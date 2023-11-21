using Athenea.DAL;
using Athenea.Librerias;
using Athenea.Modelo;
using Microsoft.Win32;
using System;
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
    /// Lógica de interacción para GestLibro.xaml
    /// </summary>
    public partial class GestLibro : Page
    {
        private UnitOfWork bd = new UnitOfWork();
        private Libro libro = new Libro();
        private Editorial editorial = new Editorial();
        private Tipo tipo = new Tipo();
        private Boolean nuevoLibro = false;
        private int tamañoGrid = 758;
        private Boolean nuevaEditorial = true;
        private Boolean nuevoTipo = true;

        public GestLibro()
        {
            InitializeComponent();

            // Le indico al grid llamado formulario que su datacontexte es igual al elemento libro
            gbFormulario.DataContext = libro;

            // Relleno los comboBox con toda la información que necesitan
            cbEditorial.ItemsSource = bd.EditorialRepository.GetAll();
            cbProveedor.ItemsSource = bd.ProveedorRepository.proveedoresCompleto();
            cbTipo.ItemsSource = bd.TipoRepository.GetAll();

            // Le indico a los comboBox que información tiene que mostrar y cuál sacar cuando se les pida el elemento seleccionado

            cbEditorial.DisplayMemberPath = "Nombre";
            cbEditorial.SelectedValuePath = "EditorialId";

            cbProveedor.DisplayMemberPath = "Nombre";
            cbProveedor.SelectedValuePath = "ProveedorId";

            cbTipo.DisplayMemberPath = "Nombre";
            cbTipo.SelectedValuePath = "TipoId";

            // Relleno el datagrid con todos los elementos libro en la BD
            dgLibros.ItemsSource = bd.LibroRepository.librosCompleto();
        }

        // Limpio todo el formulario
        private void BtnNuevo_Click(object sender, RoutedEventArgs e)
        {
            gbFormulario.DataContext = new Libro();
            nuevoLibro = true;
            dgLibros.SelectedIndex = -1;
        }

        // Este metodo añade la el libro del datagrid a un elemento tipo libro de la página
        private void dgLibros_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgLibros.SelectedIndex != -1)
            {
                libro = (Libro)dgLibros.SelectedItem;
                gbFormulario.DataContext = libro;
                nuevoLibro = false;

                // Pasar la imagen guardada de la bd al componente Image de la interfaz
                Imagen.Source = bd.UsuarioRepository.ToImage(libro.Imagen);
            }
        }

        // Este metodo buscar libros por el criterio que los usuarios elijan
        private void btnBuscar_Click(object sender, RoutedEventArgs e)
        {
            List<Libro> aux = bd.LibroRepository.Get(l => !l.inactivo && (l.ISBN.Equals(txtBusquedaUs.Text) || l.Editorial.Nombre.Equals(txtBusquedaUs.Text) || l.Autor.Equals(txtBusquedaUs.Text) || l.Nombre.Equals(txtBusquedaUs.Text)), includeProperties: "Editorial,Tipo,Proveedor");

            if (aux.Count != 0)
                dgLibros.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgLibros.ItemsSource = bd.LibroRepository.librosCompleto();
            }
        }

        // Este metodo añade o modifica el libro a la BD si todos los datos son correctos
        private void BtnGuardarLi_Click(object sender, RoutedEventArgs e)
        {
            string errores = Validacion.errores(libro);
            if (txtAutor.Text.Length != 0 && txtTitulo.Text.Length != 0 && txtEdicion.Text.Length != 0 && txtISBN.Text.Length != 0
                && txtPrecio.Text.Length != 0 && cbEditorial.SelectedIndex != -1 && cbTipo.SelectedIndex != -1 && cbProveedor.SelectedIndex != -1)
            {
                if (String.IsNullOrEmpty(errores))
                {
                    // Comprobar formato edicion
                    try
                    {
                        int edicion = Int32.Parse(txtEdicion.Text);
                        libro.Edicion = edicion;
                    }
                    catch
                    {
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "El formato de la edicion es incorrecto", letra: "#B03A2E", fondo: "#333333");
                        return;
                    }

                    if (nuevoLibro) // añadir
                    {
                        if (bd.LibroRepository.Get(l => l.ISBN == libro.ISBN).Count == 0)
                        {
                            bd.LibroRepository.Añadir(libro);
                            LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha añadido correctamente el producto", letra: "#58D68D", fondo: "#333333");
                        }
                        else
                        {
                            LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes añadir un libro que ya existe", letra: "#B03A2E", fondo: "#333333");
                            return;
                        }
                    }
                    else // Modificar
                    {
                        bd.LibroRepository.Update(libro);
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha modificado correctamente el producto", letra: "#58D68D", fondo: "#333333");
                    }

                    if (!guardarBd())
                    {
                        return;
                    }
                    BtnNuevo_Click(sender, e);
                    dgLibros.SelectedIndex = -1;
                    dgLibros.ItemsSource = bd.LibroRepository.librosCompleto();
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, errores, letra: "#B03A2E", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Faltan campos por cubrir", letra: "#B03A2E", fondo: "#333333");
            }
        }

        // Este metodo borra de la BD el producto que indica el usuario por medio de su codigo
        private void btnBorrar_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(txtISBN.Text))
            {
                if (String.IsNullOrEmpty(libro.Producto.ProveedorId.ToString()))
                {
                    libro = dgLibros.SelectedItem as Libro;
                    libro.inactivo = true;
                    libro.Producto.inactivo = true;
                    bd.LibroRepository.Update(libro);
                    bd.ProductoRepository.Update(libro.Producto);
                    if (!guardarBd())
                    {
                        return;
                    }
                    dgLibros.ItemsSource = bd.LibroRepository.librosCompleto();
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente el producto", letra: "#58D68D", fondo: "#333333");
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes eliminar un libro que está asociado con un proveedor", letra: "#B03A2E", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado nigún libro", letra: "#B03A2E", fondo: "#333333");
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
                    libro.Imagen = bitmapImageToBytes(new BitmapImage(new Uri(selectedFileName)));
                }
                catch (Exception)
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se puedo cargar la imagen, asegúrese de que es un formato correcto", letra: "#b91523", fondo: "#333333");
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
            catch
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Ha ocurrido un error inesperado", letra: "#b91523", fondo: "#333333");
                return false;
            }
        }

        private void btnAñadir_Click(object sender, RoutedEventArgs e)
        {
            if ((bool)btnAñadir.IsChecked)
            {
                LibreriaV7.Animacion(gAñadirTipos_Editoriales, "gAñadirTipos_Editoriales", 0.35, WidthProperty, 0, tamañoGrid);
                LibreriaV7.Animacion(gDatos, "gDatos", 0.35, WidthProperty, tamañoGrid, 0);
            }
            else
            {
                LibreriaV7.Animacion(gAñadirTipos_Editoriales, "gAñadirTipos_Editoriales", 0.35, WidthProperty, tamañoGrid, 0);
                LibreriaV7.Animacion(gDatos, "gDatos", 0.35, WidthProperty, 0, tamañoGrid);
            }

            // Relleno los datagrid de la parte de la aplicación que acabo de mostrar con los productos que vende el proveedor seleccionado
            dgEditorialesAdd.ItemsSource = bd.EditorialRepository.editorialesCompleto();
            dgTiposAdd.ItemsSource = bd.TipoRepository.tiposCompleto();
        }

        private void btnGuardarEditorial_Click(object sender, RoutedEventArgs e)
        {
            if (txtNombreEditorialAdd.Text.Length > 0 && txtProvinciaEditorialAdd.Text.Length > 0
                && txtEmailEditorialAdd.Text.Length > 0 && txtCPEditorialAdd.Text.Length > 0
                && txtCalleEditorialAdd.Text.Length > 0 && txtConcelloEditorialAdd.Text.Length > 0)
            {
                try
                {
                    editorial.CodigoPostal = Int32.Parse(txtCPEditorialAdd.Text);
                }
                catch
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "El codigo postal es incorrecto", letra: "#b91523", fondo: "#333333");
                    return;
                }

                if (editorial.CodigoPostal.ToString().Length != 5)
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "El formato del codigo postal es incorrecto", letra: "#b91523", fondo: "#333333");
                    return;
                }

                if (nuevaEditorial)
                {
                    bd.EditorialRepository.Añadir(editorial);
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La editorial se ha añadido correctamente", letra: "#58D68D", fondo: "#333333");
                }
                else
                {
                    bd.EditorialRepository.Update(editorial);
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La editorial se ha modificado correctamente", letra: "#58D68D", fondo: "#333333");
                }

                if (!guardarBd())
                {
                    return;
                }
                btnNuevaEditorial_Click(sender, e);
                dgEditorialesAdd.SelectedIndex = -1;
                dgEditorialesAdd.ItemsSource = bd.EditorialRepository.editorialesCompleto();
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Falta información que rellenar de la editorial", letra: "#b91523", fondo: "#333333");
            }
        }

        private void btnBorrarEditorial_Click(object sender, RoutedEventArgs e)
        {
            if (dgEditorialesAdd.SelectedIndex != -1)
            {
                if (editorial.Libros == null || editorial.Libros.Count == 0)
                {
                    bd.EditorialRepository.Delete(dgEditorialesAdd.SelectedItem as Editorial);
                    if (!guardarBd())
                    {
                        return;
                    }
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La editorial se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");
                    btnNuevoTipo_Click(sender, e);
                    dgEditorialesAdd.ItemsSource = bd.EditorialRepository.editorialesCompleto();
                } else
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes eliminar esta editorial porque está asociada con uno o varios libros", letra: "#b91523", fondo: "#333333");
            }
            else
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ninguna editoral", letra: "#b91523", fondo: "#333333");
        }

        private void btnGuardarTipo_Click(object sender, RoutedEventArgs e)
        {
            if (txtTipoAdd.Text.Length > 0)
            {
                if (nuevoTipo)
                {
                    bd.TipoRepository.Añadir(tipo);
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "El tipo se ha añadido correctamente", letra: "#58D68D", fondo: "#333333");
                }
                else
                {
                    bd.TipoRepository.Update(tipo);
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "El tipo se ha actualizado correctamente", letra: "#58D68D", fondo: "#333333");
                }

                if (!guardarBd())
                {
                    return;
                }
                btnNuevoTipo_Click(sender, e);
                dgTiposAdd.SelectedIndex = -1;
                dgTiposAdd.ItemsSource = bd.TipoRepository.tiposCompleto();
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Faltan campos por rellenar de tipo", letra: "#b91523", fondo: "#333333");
            }
        }

        private void btnBorrarTipo_Click(object sender, RoutedEventArgs e)
        {
            if (dgTiposAdd.SelectedIndex != -1)
            {
                if (tipo.Libros == null || tipo.Libros.Count == 0)
                {
                    bd.TipoRepository.Delete(dgTiposAdd.SelectedItem as Tipo);
                    if (guardarBd())
                    {
                        return;
                    }
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "El tipo se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");
                    btnNuevoTipo_Click(sender, e);
                    dgTiposAdd.ItemsSource = bd.TipoRepository.tiposCompleto();
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes eliminar este tipo porque está asociada con uno o varios libros", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningun tipo", letra: "#b91523", fondo: "#333333");
            }
        }

        private void btnImagenEditorial_Click(object sender, RoutedEventArgs e)
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
                    ImagenEditorial.Source = bitmap;
                    editorial.Imagen = bitmapImageToBytes(new BitmapImage(new Uri(selectedFileName)));
                }
                catch (Exception)
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se puedo cargar la imagen, asegúrese de que es un formato correcto", letra: "#b91523", fondo: "#333333");
                    throw;
                }
            }
        }

        private void dgEditorialesAdd_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgEditorialesAdd.SelectedIndex != -1)
            {
                editorial = dgEditorialesAdd.SelectedItem as Editorial;
                spEditorialDireccion.DataContext = editorial;
                spEditorialNombre.DataContext = editorial;
                ImagenEditorial.Source = bd.UsuarioRepository.ToImage(editorial.Imagen);
                nuevaEditorial = false;
            }
        }

        private void dgTiposAdd_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgTiposAdd.SelectedIndex != -1) {
                tipo = dgTiposAdd.SelectedItem as Tipo;
                wpTipo.DataContext = tipo;
                nuevoTipo = false;
            }
        }

        private void btnNuevaEditorial_Click(object sender, RoutedEventArgs e)
        {
            spEditorialDireccion.DataContext = new Editorial();
            spEditorialNombre.DataContext = new Editorial();
            ImagenEditorial.Source = null;
            nuevaEditorial = true;
        }

        private void btnNuevoTipo_Click(object sender, RoutedEventArgs e)
        {
            wpTipo.DataContext = new Tipo();
            nuevoTipo = true;
        }
    }
}
