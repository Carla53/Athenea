using Athenea.DAL;
using Athenea.Librerias;
using Athenea.Modelo;
using Microsoft.Win32;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using Usuarios.Modelo;

namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para GestPapeleria.xaml
    /// </summary>
    public partial class GestPapeleria : Page
    {
        private UnitOfWork bd = new UnitOfWork();
        private Producto producto = new Producto();
        private Boolean nuevoProducto = true;
        private Marca marca = new Marca();
        private Categoria categoria = new Categoria();
        private int tamañoGrid = 758;
        private Boolean nuevaCategoria = true;
        private Boolean nuevaMarca = true;

        public GestPapeleria()
        {
            InitializeComponent();

            // Le indico al grid llamado formulario que su datacontexte es igual al elemento producto
            gbFormularioPapeleria.DataContext = producto;

            // Relleno los comboBox con toda la información que necesitan
            cbProveedor.ItemsSource = bd.ProveedorRepository.proveedoresCompleto();
            cbMarca.ItemsSource = bd.MarcaRepository.Get(m => m.MarcaId != 1, includeProperties: "Categoria,Productos");
            cbCategoria.ItemsSource = bd.CategoriaRepository.Get(c => c.CategoriaId != 1, includeProperties: "Productos,Marcas");

            // Pasar la imagen guardada de la bd al componente Image de la interfaz
            Imagen.Source = bd.UsuarioRepository.ToImage(producto.Imagen);

            // Le indico a los comboBox que información tiene que mostrar y cuál sacar cuando se les pida el elemento seleccionado
            cbCategoria.DisplayMemberPath = "Nombre";
            cbCategoria.SelectedValuePath = "CategoriaId";

            cbMarca.DisplayMemberPath = "Nombre";
            cbMarca.SelectedValuePath = "MarcaId";

            cbProveedor.DisplayMemberPath = "Nombre";
            cbProveedor.SelectedValuePath = "ProveedorId";

            dgPapeleria.ItemsSource = bd.ProductoRepository.productosCompleto();
        }

        // Limpio todo el formulario
        private void BtnNuevo_Click(object sender, RoutedEventArgs e)
        {
            gbFormularioPapeleria.DataContext = new Producto();
            dgPapeleria.SelectedIndex = -1;
            nuevoProducto = false;
        }

        // Este metodo buscar productos por el criterio que los usuarios elijan
        private void btnBuscar_Click(object sender, RoutedEventArgs e)
        {
            List<Producto> aux = bd.ProductoRepository.Get(p => p.inactivo && (p.Categoria.Nombre.Equals(txtBusquedaPap.Text) || p.Marca.Nombre.Equals(txtBusquedaPap.Text) || p.Proveedor.Nombre.Equals(txtBusquedaPap.Text) || p.ProductoId.Equals(txtBusquedaPap.Text)), includeProperties: "Categoria,Marca,Proveedor");
            if (aux.Count != 0)
                dgPapeleria.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgPapeleria.ItemsSource = bd.ProductoRepository.productosCompleto();
            }
        }

        // Este metodo añade o modifica el producto a la BD si todos los datos son correctos
        private void BtnGuardarProd_Click(object sender, RoutedEventArgs e)
        {
            string errores = Validacion.errores(producto);
            if (txtNombre.Text.Length != 0 && txtPrecio.Text.Length != 0 && txtStock.Text.Length != 0
                && cbMarca.SelectedIndex != -1 && cbCategoria.SelectedIndex != -1 &&
                cbProveedor.SelectedIndex != -1) {
                if (String.IsNullOrEmpty(errores))
                {
                    if (nuevoProducto) // añadir
                    {
                        bd.ProductoRepository.Añadir(producto);                        
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha añadido correctamente el producto", letra: "#58D68D", fondo: "#333333");
                    }
                    else // Modificar
                    {
                        bd.ProductoRepository.Update(producto);
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha modificado correctamente el producto", letra: "#58D68D", fondo: "#333333");
                    }

                    if (!guardarBd())
                    {
                        return;
                    }
                    BtnNuevo_Click(sender, e);
                    dgPapeleria.SelectedIndex = -1;
                    dgPapeleria.ItemsSource = bd.ProductoRepository.productosCompleto();
                } else
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: errores, letra: "#b91523", fondo: "#333333");
            }
            else
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Faltan campos por cubrir", letra: "#b91523", fondo: "#333333");
        }

        // Este metodo borra de la BD el producto que indica el usuario por medio de su codigo
        private void btnBorrar_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(txtNombre.Text))
            {
                if (String.IsNullOrEmpty(producto.ProveedorId.ToString()))
                {
                    producto = dgPapeleria.SelectedItem as Producto;
                    producto.inactivo = true;
                    bd.ProductoRepository.Update(producto);
                    if (!guardarBd())
                    {
                        return;
                    }
                    dgPapeleria.ItemsSource = bd.ProductoRepository.productosCompleto();
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente el producto", letra: "#58D68D", fondo: "#333333");
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes eliminar un producto que está asociado con un proveedor", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún producto", letra: "#b91523", fondo: "#333333");
            }
        }

        // Este metodo añade la el producto del datagrid a un elemento tipo producto de la página
        private void DgPapeleria_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgPapeleria.SelectedIndex != -1)
            {
                producto = (Producto)dgPapeleria.SelectedItem;
                gbFormularioPapeleria.DataContext = producto;
                nuevoProducto = false;

                // Pasar la imagen guardada de la bd al componente Image de la interfaz
                Imagen.Source = bd.UsuarioRepository.ToImage(producto.Imagen);
            }
        }

        // Este metodo añade una imagen para mostrar en el elemento Image de la ventana
        private void btnImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.InitialDirectory = "c:\\";
            dlg.Filter = "Image files (*.jpg)|*.jpg|(*.png)|*.png|All Files (*.*)|*.*";
            dlg.RestoreDirectory = true;
            bool? result = dlg.ShowDialog();
            if (result == true)
            {
                try
                {
                    string selectedFileName = dlg.FileName;
                    BitmapImage bitmap = new BitmapImage();
                    bitmap.BeginInit();
                    bitmap.UriSource = new Uri(selectedFileName);
                    bitmap.EndInit();
                    Imagen.Source = bitmap;
                    producto.Imagen = bitmapImageToBytes(new BitmapImage(new Uri(selectedFileName)));
                }
                catch (Exception)
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Non se puedo cargar la imagen, asegúrese de que es un formato correcto", letra: "#b91523", fondo: "#333333");
                    throw;
                }
            }
        }

        private byte[] bitmapImageToBytes(BitmapImage image) // del control a campo de la base de datos
        {
            if (image == null) { return null; }
            var encoder = new JpegBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(image));
            using (var ms = new MemoryStream())
            {
                encoder.Save(ms);
                return ms.ToArray();
            }
        }

        private Boolean guardarBd()
        {
            try
            {
                bd.Save();
                return true;
            }
            catch(Exception e)
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Ha ocurrido un error inesperado", letra: "#b91523", fondo: "#333333");
                return false;
            }
        }

        private void btnAñadirCategorias_Marcas_Click(object sender, RoutedEventArgs e)
        {
            if ((bool)btnAñadirCategorias_Marcas.IsChecked)
            {
                LibreriaV7.Animacion(gAñadirMarcas_Categorias, "gAñadirMarcas_Categorias", 0.35, WidthProperty, 0, tamañoGrid);
                LibreriaV7.Animacion(gDatos, "gDatos", 0.35, WidthProperty, tamañoGrid, 0);
            }
            else
            {
                LibreriaV7.Animacion(gAñadirMarcas_Categorias, "gAñadirMarcas_Categorias", 0.35, WidthProperty, tamañoGrid, 0);
                LibreriaV7.Animacion(gDatos, "gDatos", 0.35, WidthProperty, 0, tamañoGrid);
            }

            // Relleno los datagrid de la parte de la aplicación que acabo de mostrar con los productos que vende el proveedor seleccionado
            dgMarcaAdd.ItemsSource = bd.MarcaRepository.Get(m => m.MarcaId != 1, includeProperties: "Categoria,Productos");
            dgCategoriaAdd.ItemsSource = bd.CategoriaRepository.Get(c => c.CategoriaId != 1, includeProperties: "Productos,Marcas");
        }

        private void btnGuardarMarca_Click(object sender, RoutedEventArgs e)
        {
            if (txtNombreMarcaAdd.Text.Length > 0)
            {
                if (nuevaMarca)
                {
                    bd.MarcaRepository.Añadir(marca);
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La marca se ha añadido correctamente", letra: "#58D68D", fondo: "#333333");
                } else
                {
                    bd.MarcaRepository.Update(marca);
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La marca se ha actualizado corretamente", letra: "#58D68D", fondo: "#333333");
                }

                if (!guardarBd())
                {
                    return;
                }
                btnNuevaMarca_Click(sender, e);
                dgMarcaAdd.SelectedIndex = -1;
                dgMarcaAdd.ItemsSource = bd.MarcaRepository.Get(m => m.MarcaId != 1, includeProperties: "Categoria,Productos");
            }
            else
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Falta información que rellenar de la editorial", letra: "#b91523", fondo: "#333333");
        }

        private void btnBorrarMarca_Click(object sender, RoutedEventArgs e)
        {
            if (dgMarcaAdd.SelectedIndex != -1)
            {
                if (marca.Productos == null || marca.Productos.Count == 0)
                {
                    bd.MarcaRepository.Delete(dgMarcaAdd.SelectedItem as Marca);
                    if (!guardarBd())
                        return;
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La marca se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");
                    btnNuevaMarca_Click(sender, e);
                    dgMarcaAdd.ItemsSource = bd.MarcaRepository.marcasCompleto();
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "no puedes eliminar esta marca porque está asociada a uno o varios productos", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ninguna marca", letra: "#b91523", fondo: "#333333");
            }
        }

        private void btnGuardarCategoria_Click(object sender, RoutedEventArgs e)
        {
            if (txtCategoriaAdd.Text.Length > 0)
            {
                if (nuevaCategoria)
                {
                    bd.CategoriaRepository.Añadir(categoria);
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La categoria se ha añadido corretamente", letra: "#58D68D", fondo: "#333333");
                }
                else
                {
                    bd.CategoriaRepository.Update(categoria);
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La categoria se ha actualizado corretamente", letra: "#58D68D", fondo: "#333333");
                }

                if (!guardarBd())
                {
                    return;
                }
                btnNuevaCatogoria_Click(sender, e);
                dgCategoriaAdd.SelectedIndex = -1;
                dgCategoriaAdd.ItemsSource = bd.CategoriaRepository.Get(c => c.CategoriaId != 1, includeProperties: "Productos,Marcas");
            }
        }

        private void btnBorrarCategoria_Click(object sender, RoutedEventArgs e)
        {
            if (dgCategoriaAdd.SelectedIndex != -1)
            {
                if (categoria.Productos == null || categoria.Productos.Count == 0)
                {
                    bd.CategoriaRepository.Delete(dgCategoriaAdd.SelectedItem as Categoria);
                    if (!guardarBd())
                        return;
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La categoria se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");
                    btnNuevaCatogoria_Click(sender, e);
                    dgCategoriaAdd.ItemsSource = bd.CategoriaRepository.categoriasCompleto();
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes eliminar esta categoria porque está asociada con uno o varios productos", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ninguna categoria", letra: "#b91523", fondo: "#333333");
            }
        }

        private void btnImagenMarca_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.InitialDirectory = "c:\\";
            dlg.Filter = "Image files (*.jpg)|*.jpg|(*.png)|*.png|All Files (*.*)|*.*";
            dlg.RestoreDirectory = true;
            bool? result = dlg.ShowDialog();
            if (result == true)
            {
                try
                {
                    string selectedFileName = dlg.FileName;
                    BitmapImage bitmap = new BitmapImage();
                    bitmap.BeginInit();
                    bitmap.UriSource = new Uri(selectedFileName);
                    bitmap.EndInit();
                    ImagenMarca.Source = bitmap;
                    marca.Imagen = bitmapImageToBytes(new BitmapImage(new Uri(selectedFileName)));
                }
                catch (Exception)
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Non se puedo cargar la imagen, asegúrese de que es un formato correcto", letra: "#b91523", fondo: "#333333");
                    throw;
                }
            }
        }

        private void dgCategoriaAdd_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgCategoriaAdd.SelectedIndex != -1)
            {
                categoria = dgCategoriaAdd.SelectedItem as Categoria;
                wpCategoria.DataContext = categoria;
                nuevaCategoria = false;
            }
        }

        private void dgMarcaAdd_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgMarcaAdd.SelectedIndex != -1)
            {
                marca = dgMarcaAdd.SelectedItem as Marca;
                spMarca.DataContext = marca;
                nuevaMarca = false;
                ImagenMarca.Source = bd.UsuarioRepository.ToImage(marca.Imagen);
            }
        }

        private void btnNuevaMarca_Click(object sender, RoutedEventArgs e)
        {
            spMarca.DataContext = new Marca();
            nuevaMarca = true;
        }

        private void btnNuevaCatogoria_Click(object sender, RoutedEventArgs e)
        {
            wpCategoria.DataContext = new Categoria();
            nuevaCategoria = true;
        }
    }
}
