using Athenea.DAL;
using Athenea.Librerias;
using Athenea.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Usuarios.Modelo;

namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para GestCompra.xaml
    /// </summary>
    public partial class GestCompra : Page
    {
        private UnitOfWork bd = new UnitOfWork();
        private Producto producto = new Producto();
        private Proveedor proveedor = new Proveedor();
        private List<LineaCompra> lineasCompra = new List<LineaCompra>();

        public GestCompra()
        {
            InitializeComponent();

            // Rellenar los DataGrid con todos los productos, libros y prooveedores de la BD
            dgPapeleria.ItemsSource = bd.ProductoRepository.productosCompleto();
            dgLibros.ItemsSource = bd.LibroRepository.librosCompleto();
            dgCompra.ItemsSource = lineasCompra;

            // Indico que el contexto de datos del formulario de productos
            gbFormularioProducto.DataContext = producto;
        }

        // Este metodo buscar productos por el criterio que los usuarios elijan
        private void btnBuscarProductos_Click(object sender, RoutedEventArgs e)
        {
            List<Producto> aux = bd.ProductoRepository.Get(p => !p.inactivo && (p.Categoria.Nombre.Equals(txtBusquedaPap.Text) || p.Marca.Nombre.Equals(txtBusquedaPap.Text) || p.Proveedor.Nombre.Equals(txtBusquedaPap.Text) || p.ProductoId.Equals(txtBusquedaPap.Text)), includeProperties: "Categoria,Marca,Proveedor");
            
            if (aux.Count != 0)
                dgPapeleria.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgPapeleria.ItemsSource = bd.ProductoRepository.productosCompleto();
            }
        }

        // Este metodo buscar libros por el criterio que los usuarios elijan
        private void btnBuscarLibros_Click(object sender, RoutedEventArgs e)
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

        // Método para buscar proveedores
        private void btnBuscarProveedores_Click(object sender, RoutedEventArgs e)
        {
            List<Proveedor> aux = bd.ProveedorRepository.Get(l => !l.inactivo && (l.CIF.Equals(txtBusquedaLi.Text) || l.Direccion.Contains(txtBusquedaLi.Text) || l.NombreCompleto.Contains(txtBusquedaLi.Text) || l.ProveedorId.Equals(txtBusquedaLi.Text) || l.Telefono.Equals(txtBusquedaLi.Text)), includeProperties: "Productos,Compras");

            if (aux.Count != 0)
                dgProveedores.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgProveedores.ItemsSource = bd.ProveedorRepository.proveedoresCompleto();
            }
        }

        // Este metodo añade el libro del datagrid a un elemento tipo libro de la página
        private void DgLibros_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgLibros.SelectedIndex != -1)
            {
                if (dgPapeleria.SelectedIndex != -1)
                    dgPapeleria.SelectedIndex = -1;

                producto = (dgLibros.SelectedItem as Libro).Producto;
                producto.Libro = dgLibros.SelectedItem as Libro;
                producto.Nombre = producto.Libro.Nombre;
                gbFormularioProducto.DataContext = producto;

                // Pasar la imagen guardada de la bd al componente Image de la interfaz
                Imagen.Source = bd.UsuarioRepository.ToImage(producto.Libro.Imagen);

                dgProveedores.ItemsSource = bd.ProveedorRepository.proveedoresFiltrarLibro(producto.Libro);                
            }
        }

        // Este metodo añade el producto del datagrid a un elemento tipo producto de la página
        private void DgPapeleria_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgPapeleria.SelectedIndex != -1)
            {
                if (dgLibros.SelectedIndex != -1)
                    dgLibros.SelectedIndex = -1;

                producto = dgPapeleria.SelectedItem as Producto;
                gbFormularioProducto.DataContext = producto;

                // Pasar la imagen guardada de la bd al componente Image de la interfaz
                Imagen.Source = bd.UsuarioRepository.ToImage(producto.Imagen);

                dgProveedores.ItemsSource = bd.ProveedorRepository.proveedoresFiltrarProductos(producto);
            }
        }

        // Este metodo añade el proveedor del datagrid a un elemento tipo producto de la página
        private void dgProoveedores_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgProveedores.SelectedIndex != -1)
            {
                proveedor = dgProveedores.SelectedItem as Proveedor;
                txtProveedor.Text = proveedor.Nombre;
            }
        }

        // Este metodo añade los elementos seleccionados de los DataGrid en la lista
        private void BtnAñadir_Click(object sender, RoutedEventArgs e)
        {
            if (txtNombre.Text.Length > 0)
            {
                if (txtCantidad.Text.Length > 0)
                {
                    if (txtProveedor.Text.Length > 0 && bd.ProveedorRepository.Get(p => p.Nombre.Equals(txtProveedor.Text)) != null)
                    {
                        int cantidad = -1;
                        try
                        {
                            cantidad = Int32.Parse(txtCantidad.Text);
                        }
                        catch (Exception)
                        {
                            LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Tienes que indicar una cantidad", letra: "#b91523", fondo: "#f3f3f3#333333");
                        }

                        if (cantidad > 0)
                        {
                            LineaCompra lineaCompra = new LineaCompra();

                            if (lineasCompra.Find(l => l.Producto.Nombre.Equals(producto.Nombre)) != null)
                            {
                                lineasCompra.Find(l => l.Producto.Nombre.Equals(producto.Nombre)).Cantidad += Int32.Parse(txtCantidad.Text);
                            }
                            else if (txtCantidad.Text.Length > 0)
                            {
                                lineaCompra.Producto = producto;
                                lineaCompra.Cantidad = Int32.Parse(txtCantidad.Text);

                                if (dgLibros.SelectedIndex != -1)
                                {
                                    lineaCompra.Precio = producto.Libro.Precio;
                                    lineasCompra.Add(lineaCompra);
                                }
                                else if (dgPapeleria.SelectedIndex != -1)
                                {
                                    lineaCompra.Precio = producto.Precio;
                                    lineasCompra.Add(lineaCompra);
                                }
                            }
                            else
                            {
                                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Tienes que indicar la cantidad de productos", letra: "#b91523", fondo: "#f3f3f3#333333");
                            }

                            gbFormularioProducto.DataContext = new Producto();
                            txtCantidad.Text = "";
                            txtProveedor.Text = "";

                            dgLibros.SelectedIndex = -1;
                            dgPapeleria.SelectedIndex = -1;
                            dgCompra.Items.Refresh();
                        }
                        else
                        {
                            LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La cantidad no puede ser negativa", letra: "#b91523", fondo: "#333333");
                        }
                    }
                    else
                    {
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "El proveedor es incorrecto", letra: "#b91523", fondo: "#333333");
                    }
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Tienes que indicar la cantidad de productos", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Tienes que indicar un producto", letra: "#b91523", fondo: "#333333");
            }
        }

        // Este metodo borrar los elementos seleccionados de las lista
        private void btnBorrar_Click(object sender, RoutedEventArgs e)
        {
            if (dgCompra.SelectedIndex != -1)
            {
                lineasCompra.Remove(dgCompra.SelectedItem as LineaCompra);
                dgCompra.Items.Refresh();
            }
        }

        // Este método genera una venta
        private void btnGenerarCompra_Click(object sender, RoutedEventArgs e)
        {
            // Rellanar los datos de la venta

            Compra compra = new Compra();

            compra.Fecha = DateTime.Now;
            compra.UsuarioId = GestApp.user.UsuarioId;
            compra.Proveedor = proveedor;
            compra.LineasCompra = lineasCompra;
            compra.Importe = lineasCompra.Sum(s => s.Importe);

            // Comprobar si hay errores
            string errores = Validacion.errores(compra);
            if (String.IsNullOrEmpty(errores))
            {
                if (bd.ProveedorRepository.Get(p => p.ProveedorId == compra.ProveedorId) != null)
                {
                    bd.LineaCompraRepository.AñadirLista(lineasCompra);
                    bd.CompraRepository.Añadir(compra);
                    if (!guardarBd())
                    {
                        return;
                    }

                    actualizarStock();

                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha generado correctamente la compra", letra: "#58D68D", fondo: "#333333");

                    lineasCompra = new List<LineaCompra>();
                    dgCompra.ItemsSource = lineasCompra;

                    PrintDialog p = new PrintDialog();
                    if (p.ShowDialog() == true)
                    {
                        Factura t = new Factura(compra);

                        t.Show();
                        p.PrintVisual(t.compra, "Factura de compra");
                        t.Close();
                    }
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "El proveedor es incorrecto", letra: "#B03A2E");
                }
            }
        }

        // Este método sirve para actualizar el stock
        private void actualizarStock()
        {
            List<LineaCompra> productos = (List<LineaCompra>)dgCompra.Items.SourceCollection;

            List<LineaCompra> productosParaActualizar = productos.Where(p => p.Producto != null).ToList();
            List<LineaCompra> librosParaActualizar = productos.Where(p => p.Producto.Libro != null).ToList();

            bd.ProductoRepository.actualizaStockCompra(productosParaActualizar);
            bd.LibroRepository.actualizaStockCompra(librosParaActualizar);
        }

        private void comprobarEnter(object sender, KeyEventArgs e)
        {
            if (e.Key.Equals(Key.Enter))
                BtnAñadir_Click(sender, e);
        }

        private void btnMostrarCompras_Click(object sender, RoutedEventArgs e)
        {

            GestApp ventanaPrincipal = Window.GetWindow(this) as GestApp;

            ventanaPrincipal.abrirListaCompra();
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
    }
}
