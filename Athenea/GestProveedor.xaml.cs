using Athenea.DAL;
using Athenea.Librerias;
using Athenea.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Usuarios.Modelo;

namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para Prooveedor.xaml
    /// </summary>
    public partial class GestProveedor : Page
    {
        private UnitOfWork bd = new UnitOfWork();
        private Proveedor proveedor = new Proveedor();
        private Producto producto = new Producto();
        private Libro libro = new Libro();
        private Boolean nuevoProoveedor = false;
        private int tamañoGrid = 751;

        public GestProveedor()
        {
            InitializeComponent();

            // Le indico al grid llamado formulario que su datacontexte es igual al elemento libro
            gbFormulario.DataContext = proveedor;
            gbFormularioDireccion.DataContext = proveedor;

            // Relleno el datagrid con todos los elementos usuario de la BD
            dgProveedores.ItemsSource = bd.ProveedorRepository.proveedoresCompletoConLibro(bd.LibroRepository.librosCompleto());

            // Le indico a los comboBox que información tiene que mostrar y cuál sacar cuando se les pida el elemento seleccionado
            cbProductos.DisplayMemberPath = "Nombre";
            cbProductos.SelectedValuePath = "ProductoId";

            cbLibros.DisplayMemberPath = "Nombre";
            cbLibros.SelectedValuePath = "LibroId";

            cbProductosAdd.DisplayMemberPath = "Nombre";
            cbProductosAdd.SelectedValuePath = "ProductoId";

            cbLibrosAdd.DisplayMemberPath = "Nombre";
            cbLibrosAdd.SelectedValuePath = "LibroId";

            // Animacion para esconder el grid para añadir productos y/o libros al prooveedor
            LibreriaV7.Animacion(gAñadirPro_Li, "gAñadirPro_Li", 0.35, WidthProperty, 510, 0);
        }

        // Limpio todo el formulario
        private void BtnNuevo_Click(object sender, RoutedEventArgs e)
        {
            gbFormulario.DataContext = new Libro();
            gbFormularioDireccion.DataContext = new Libro();
            nuevoProoveedor = true;

            dgLibrosAdd.ItemsSource = null;
            dgProductosAdd.ItemsSource = null;
        }

        // Este metodo añade el prooveedor seleccionado del datagrid a un elemento tipo prooveedor de la página
        private void dgProoveedores_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgProveedores.SelectedIndex != -1)
            {
                proveedor = (Proveedor)dgProveedores.SelectedItem;
                gbFormulario.DataContext = proveedor;
                gbFormularioDireccion.DataContext = proveedor;
                nuevoProoveedor = false;

                // Relleno los datagrid con los productos que vende el proveedor seleccionado
                dgLibros.ItemsSource = bd.LibroRepository.Get(l => l.ProveedorId == proveedor.ProveedorId && !proveedor.inactivo, includeProperties: "Editorial,Tipo,Proveedor");
                dgProductos.ItemsSource = bd.ProductoRepository.Get(p => p.ProveedorId == proveedor.ProveedorId && p.CategoriaId != 1, includeProperties: "Categoria,Marca,Proveedor");

                // Relleno los comboBox con los productos que vende el proveedor seleccionado
                cbLibros.ItemsSource = bd.LibroRepository.Get(l => l.ProveedorId == proveedor.ProveedorId && !l.inactivo, includeProperties: "Editorial,Tipo,Proveedor");
                cbProductos.ItemsSource = bd.ProductoRepository.Get(p => p.ProveedorId == proveedor.ProveedorId && p.CategoriaId != 1, includeProperties: "Categoria,Marca,Proveedor");

                cbLibros.SelectedIndex = 0;
                cbProductos.SelectedIndex = 0;
            }
        }

        // Este metodo buscar usuarios por el criterio que los usuarios elijan
        private void btnBuscarProv_Click(object sender, RoutedEventArgs e)
        {
            List<Proveedor> aux = bd.ProveedorRepository.Get(l => !l.inactivo && (l.CIF.Equals(txtBusquedaPro.Text) || l.NombreCompleto.Equals(txtBusquedaPro.Text) || l.Correo.Contains(txtBusquedaPro.Text) || l.Telefono.Contains(txtBusquedaPro.Text)), includeProperties: "Productos,Compras");

            if (aux.Count != 0)
                dgProveedores.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgProveedores.ItemsSource = bd.ProveedorRepository.proveedoresCompleto();
            }
        }

        // Este metodo añade o modifica el usuario a la BD si todos los datos son correctos
        private void BtnGuardarProv_Click(object sender, RoutedEventArgs e)
        {
            string errores = Validacion.errores(proveedor);
            if (!proveedor.CIF.Equals(txtCIF.Text))
            {
                if (txtCalle.Text.Length > 0 && txtProvincia.Text.Length > 0 && txtConcello.Text.Length > 0 && txtCP.Text.Length > 0
                    && txtNombre.Text.Length > 0 && txtCIF.Text.Length > 0 && txtSiglas.Text.Length > 0 && txtTelefono.Text.Length > 0)
                {
                    if (nuevoProoveedor) // añadir
                    {
                        bd.ProveedorRepository.Añadir(proveedor);
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha añadido correctamente el producto", letra: "#58D68D", fondo: "#333333");
                    }
                    else // Modificar
                    {
                        bd.ProveedorRepository.Update(proveedor);
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha modificado correctamente el producto", letra: "#58D68D", fondo: "#333333");
                    }

                    if (!guardarBd())
                    {
                        return;
                    }
                    nuevoProoveedor = false;
                    dgProveedores.SelectedIndex = -1;
                    dgProveedores.ItemsSource = bd.UsuarioRepository.usuariosCompleto();
                }
                else
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Faltan campos por cubrir", letra: "#b91523", fondo: "#f3f3f3");
            }
            else if (String.IsNullOrEmpty(errores))
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: errores, letra: "#b91523", fondo: "#f3f3f3");
            else
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes modificar el usuario que estas utilizando", letra: "#b91523", fondo: "#333333");
        }

        // Este metodo borra de la BD el usuario que indica el usuario por medio de su codigo
        private void btnBorrarProv_Click(object sender, RoutedEventArgs e)
        {
            if (dgProveedores.SelectedIndex != -1 && dgProductos.SelectedIndex == -1 && dgLibros.SelectedIndex == -1)
            {
                if (!String.IsNullOrEmpty(txtCIF.Text))
                {
                    if (proveedor.Productos == null || proveedor.Productos.Count == 0)
                    {
                        proveedor.inactivo = true;
                        bd.ProveedorRepository.Update(proveedor);
                        if (!guardarBd())
                            return;
                        dgProveedores.ItemsSource = bd.ProveedorRepository.proveedoresCompleto();
                        dgProductos.SelectedIndex = -1;
                        dgLibros.SelectedIndex = -1;
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");

                    }
                    else
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes eliminar este proveedor porque está asociada con uno o varios productos", letra: "#b91523", fondo: "#333333");
                }
                else
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún proveedor", letra: "#b91523", fondo: "#333333");
            }
            else if (dgProductos.SelectedIndex != -1)
            {
                eliminarProductosProveedor(proveedor, producto, null);
                if (!guardarBd())
                {
                    return;
                }
                dgProductos.SelectedIndex = -1;
                dgProductos.ItemsSource = bd.ProductoRepository.Get(p => p.ProveedorId == proveedor.ProveedorId && p.CategoriaId != 1, includeProperties: "Categoria,Marca,Proveedor");
                cbProductos.ItemsSource = bd.ProductoRepository.Get(p => p.ProveedorId == proveedor.ProveedorId && p.CategoriaId != 1, includeProperties: "Categoria,Marca,Proveedor");
                cbProductos.SelectedIndex = 0;
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");
            }
            else if (dgLibros.SelectedIndex != -1)
            {
                eliminarProductosProveedor(proveedor, null, libro);
                if (!guardarBd())
                {
                    return;
                }
                dgLibros.SelectedIndex = -1;
                dgLibros.ItemsSource = bd.LibroRepository.Get(l => l.ProveedorId == proveedor.ProveedorId && !proveedor.inactivo, includeProperties: "Editorial,Tipo,Proveedor");

                cbLibros.ItemsSource = bd.LibroRepository.Get(l => l.ProveedorId == proveedor.ProveedorId && !l.inactivo, includeProperties: "Editorial,Tipo,Proveedor");
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");

            }
        }

        private void eliminarProductosProveedor(Proveedor proveedor, Producto producto, Libro libro)
        {
            if (libro == null)
            {
                foreach (var item in proveedor.Productos)
                {
                    if (item.ProductoId == producto.ProductoId)
                    {
                        item.ProveedorId = null;
                        bd.ProductoRepository.Update(item);
                        proveedor.Productos.Remove(item);
                        bd.ProveedorRepository.Update(proveedor);
                        return;
                    }
                }
            }
            else
            {
                foreach (var item in proveedor.Productos)
                {
                    if (item.Libro != null && item.Libro.LibroId == libro.LibroId)
                    {
                        item.ProveedorId = null;
                        item.Libro.ProveedorId = null;
                        bd.ProductoRepository.Update(item);
                        bd.LibroRepository.Update(item.Libro);
                        proveedor.Productos.Remove(item);
                        bd.ProveedorRepository.Update(proveedor);
                        return;
                    }
                }
            }
        }

        // Este metodo añade el producto seleccionado del datagrid a un elemento tipo Producto de la página
        private void dgProductos_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgProductos.SelectedIndex != -1)
                producto = (Producto)dgProductos.SelectedItem;
        }

        // Este metodo añade el libro seleccionado del datagrid a un elemento tipo Libro de la página
        private void dgLibros_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgLibros.SelectedIndex != -1)
                libro = (Libro)dgLibros.SelectedItem;
        }

        // Este metodo muestra el grid para añadir libros y/o productos
        private void btnAñadirLi_Pro_Click(object sender, RoutedEventArgs e)
        {
            if ((bool)btnAñadirLi_Pro.IsChecked)
            {
                LibreriaV7.Animacion(gAñadirPro_Li, "gAñadirPro_Li", 0.35, WidthProperty, 0, tamañoGrid);
                LibreriaV7.Animacion(gDatos, "gDatos", 0.35, WidthProperty, tamañoGrid, 0);
            }
            else
            {
                LibreriaV7.Animacion(gAñadirPro_Li, "gAñadirPro_Li", 0.35, WidthProperty, tamañoGrid, 0);
                LibreriaV7.Animacion(gDatos, "gDatos", 0.35, WidthProperty, 0, tamañoGrid);
            }

            if (dgProveedores.SelectedIndex != -1)
            {
                inicializasAdds();

                dgProveedores.SelectedIndex = -1;
            }
        }

        private void inicializasAdds()
        {
            // Relleno los datagrid de la parte de la aplicación que acabo de mostrar con los productos que vende el proveedor seleccionado
            dgLibrosAdd.ItemsSource = bd.LibroRepository.Get(l => l.ProveedorId != proveedor.ProveedorId && !l.inactivo, includeProperties: "Editorial,Tipo,Proveedor");
            dgProductosAdd.ItemsSource = bd.ProductoRepository.Get(p => p.ProveedorId != proveedor.ProveedorId && p.CategoriaId != 1 && !p.inactivo, includeProperties: "Categoria,Marca,Proveedor");

            // Relleno los comboBox de la parte de la aplicación que acabo de mostrar con los productos que vende el proveedor seleccionado
            cbLibrosAdd.ItemsSource = bd.LibroRepository.Get(l => l.ProveedorId == proveedor.ProveedorId && !l.inactivo, includeProperties: "Editorial,Tipo,Proveedor");
            cbLibrosAdd.SelectedIndex = 0;
            cbProductosAdd.ItemsSource = bd.ProductoRepository.Get(p => p.ProveedorId == proveedor.ProveedorId && p.CategoriaId != 1 && !p.inactivo, includeProperties: "Categoria,Marca,Proveedor");
            cbProductosAdd.SelectedIndex = 0;
        }

        // El método sirve para borrar el elemento libro seleccionado de prooveedor con repercusion el la bd
        private void btnBorrarLi_Click(object sender, RoutedEventArgs e)
        {
            if (cbLibrosAdd.ItemsSource != null || cbLibrosAdd.Items.Count > 0)
            {
                if (cbLibrosAdd.SelectedIndex != -1)
                {
                    Libro lib = cbLibrosAdd.SelectedItem as Libro;
                    eliminarProductosProveedor(proveedor, null, lib);
                    if (!guardarBd())
                        return;
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");
                    inicializasAdds();
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún libro", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún proveedor", letra: "#b91523", fondo: "#333333");
            }
        }

        // El método añade el elemento libro seleccionado de prooveedor con repercusion el la bd
        private void btnGuardarLi_Click(object sender, RoutedEventArgs e)
        {
            if (proveedor != null && proveedor.ProveedorId != 0)
            {
                if (dgLibrosAdd.SelectedIndex != -1)
                {
                    if (!proveedor.Productos.Where(p => p.MarcaId == 1).Any())
                    {
                        proveedor.Productos.Add(new Producto());
                        proveedor.Productos.ElementAt(proveedor.Productos.Count).Libro = (Libro)dgLibrosAdd.SelectedItem;

                        bd.ProveedorRepository.Update(proveedor);
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha modificado correctamente", letra: "#58D68D", fondo: "#333333");
                        inicializasAdds();
                    }
                    else
                    {
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Ese libro ya está añadido", letra: "#b91523", fondo: "#333333");
                    }
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún libro", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún proveedor", letra: "#b91523", fondo: "#333333");
            }
            dgLibrosAdd.SelectedIndex = -1;
        }

        // El método sirve para borrar el elemento producto seleccionado de prooveedor con repercusion el la bd
        private void btnBorrarProd_Click(object sender, RoutedEventArgs e)
        {
            if (cbProductosAdd.ItemsSource != null || cbProductosAdd.Items.Count > 0)
            {
                if (cbProductosAdd.SelectedIndex != -1)
                {
                    Producto prod = cbProductosAdd.SelectedItem as Producto;
                    eliminarProductosProveedor(proveedor, prod, null);
                    if (!guardarBd())
                        return;
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente", letra: "#58D68D", fondo: "#333333");
                    inicializasAdds();
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún producto", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún proveedor", letra: "#b91523", fondo: "#333333");
            }
            dgProductosAdd.SelectedIndex = -1;
        }

        // El método añade el elemento producto seleccionado de prooveedor con repercusion el la bd
        private void btnGuardarProd_Click(object sender, RoutedEventArgs e)
        {
            if (proveedor != null && proveedor.ProveedorId != 0)
            {
                if (dgProductosAdd.SelectedIndex != -1)
                {
                    if (!proveedor.Productos.Where(p => p.ProductoId == ((Producto)dgProductosAdd.SelectedItem).ProductoId).Any())
                    {
                        proveedor.Productos.Add((Producto)dgProductosAdd.SelectedItem);

                        bd.ProveedorRepository.Update(proveedor);
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha modificado correctamente", letra: "#58D68D", fondo: "#333333");
                        inicializasAdds();
                    }
                    else
                    {
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Ese producto ya está añadido", letra: "#b91523", fondo: "#333333");
                    }
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún producto", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No has seleccionado ningún proveedor", letra: "#b91523", fondo: "#333333");
            }
            dgProductosAdd.SelectedIndex = -1;
        }

        // Este metodo buscar libros por el criterio que los usuarios elijan
        private void btnBuscarLi_Click(object sender, RoutedEventArgs e)
        {
            List<Libro> aux = bd.LibroRepository.Get(l => !l.inactivo && (l.ISBN.Equals(txtBusquedaLi.Text) || l.Editorial.Nombre.Equals(txtBusquedaLi.Text) || l.Autor.Equals(txtBusquedaLi.Text) || l.Nombre.Equals(txtBusquedaLi.Text)), includeProperties: "Editorial,Tipo,Proveedor");

            if (aux.Count != 0)
                dgLibros.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgLibros.ItemsSource = bd.LibroRepository.librosCompleto();
            }
        }

        // Este metodo buscar productos por el criterio que los usuarios elijan
        private void btnBuscarProd_Click(object sender, RoutedEventArgs e)
        {
            List<Producto> aux = bd.ProductoRepository.Get(p => !p.inactivo && (p.Categoria.Nombre.Equals(txtBusquedaProd.Text) || p.Marca.Nombre.Equals(txtBusquedaProd.Text) || p.Proveedor.Nombre.Equals(txtBusquedaProd.Text) || p.ProductoId.Equals(txtBusquedaProd.Text)), includeProperties: "Categoria,Marca,Proveedor");
            if (aux.Count != 0)
                dgProductos.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgProductos.ItemsSource = bd.ProductoRepository.productosCompleto();
            }
        }

        private Boolean guardarBd()
        {
            try
            {
                bd.Save();
                return true;
            }
            catch (Exception e)
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Ha ocurrido un error inesperado", letra: "#b91523", fondo: "#333333");
                return false;
            }
        }
    }
}
