using Athenea.DAL;
using Athenea.Librerias;
using Athenea.Modelo;
using System;
using System.Windows.Input;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Usuarios.Modelo;
namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para GestVenta.xaml
    /// </summary>
    public partial class GestVenta : Page
    {
        private UnitOfWork bd = new UnitOfWork();
        private Producto producto = new Producto();
        private Libro libro = new Libro();
        private List<LineaVenta> lineasVenta = new List<LineaVenta>();

        public GestVenta()
        {
            InitializeComponent();

            // Rellenar los DataGrid con todos los productos, libros y prooveedores de la BD
            dgPapeleria.ItemsSource = bd.ProductoRepository.productosCompleto();
            dgLibros.ItemsSource = bd.LibroRepository.librosCompleto();
            lbListaVenta.ItemsSource = lineasVenta;

            // Indico que el contexto de datos del formulario de productos
            gbFormularioProducto.DataContext = producto;
        }

        // Este metodo buscar productos por el criterio que los usuarios elijan
        private void btnBuscarProductos_Click(object sender, RoutedEventArgs e)
        {
            List<Producto> aux = bd.ProductoRepository.Get(p => p.inactivo && (p.Categoria.Nombre.Equals(txtBusquedaPap.Text) || p.Marca.Nombre.Equals(txtBusquedaPap.Text) || p.Proveedor.Nombre.Equals(txtBusquedaPap.Text) || p.ProductoId.Equals(txtBusquedaPap.Text)), includeProperties: "Categoria,Marca,Proveedor");
            if (aux.Count > 0)
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

            if (aux.Count > 0)
                dgLibros.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgLibros.ItemsSource = bd.LibroRepository.librosCompleto();
            }
        }

        // Este metodo añade la el libro del datagrid a un elemento tipo libro de la página
        private void dgLibros_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgLibros.SelectedIndex != -1)
            {
                libro = dgLibros.SelectedItem as Libro;
                producto = libro.Producto;
                gbFormularioProducto.DataContext = libro;

                // Pasar la imagen guardada de la bd al componente Image de la interfaz
                Imagen.Source = bd.UsuarioRepository.ToImage(libro.Imagen);
            }
        }

        // Este metodo añade la el producto del datagrid a un elemento tipo producto de la página
        private void dgPapeleria_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgPapeleria.SelectedIndex != -1)
            {
                producto = dgPapeleria.SelectedItem as Producto;
                gbFormularioProducto.DataContext = producto;

                // Pasar la imagen guardada de la bd al componente Image de la interfaz
                Imagen.Source = bd.UsuarioRepository.ToImage(producto.Imagen);
            }
        }

        // Este metodo añade los elementos seleccionados de los DataGrid en la lista
        private void BtnAñadir_Click(object sender, RoutedEventArgs e)
        {
            LineaVenta lineaVenta = new LineaVenta();

            if (txtNombre.Text.Length > 0)
            {
                if (txtCantidad.Text.Length > 0)
                {
                    int cantidad = -1;
                    try
                    {
                        cantidad = Int32.Parse(txtCantidad.Text);
                    }
                    catch (Exception)
                    {
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Tienes que indicar una cantidad", letra: "#b91523", fondo: "#333333");
                        return;
                    }

                    if (cantidad > 0)
                    {
                        if (lineasVenta.Find(l => l.Producto.Nombre.Equals(producto.Nombre)) != null)
                        {
                            lineasVenta.Find(l => l.Producto.Nombre.Equals(producto.Nombre)).Cantidad += Int32.Parse(txtCantidad.Text);
                        }
                        else
                        {
                            lineaVenta.Producto = producto;
                            lineaVenta.Cantidad = Int32.Parse(txtCantidad.Text);

                            if (dgLibros.SelectedIndex != -1)
                            {
                                lineaVenta.Precio = producto.Libro.Precio;
                                lineasVenta.Add(lineaVenta);
                            }
                            else if (dgPapeleria.SelectedIndex != -1)
                            {
                                lineaVenta.Precio = producto.Precio;
                                lineasVenta.Add(lineaVenta);
                            }
                        }
                    }
                    else
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La cantidad no puede ser negativa", letra: "#b91523", fondo: "#333333");
                }
                else
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Tienes que indicar la cantidad de productos", letra: "#b91523", fondo: "#333333");
            }
            else
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Tienes que indicar un producto", letra: "#b91523", fondo: "#333333");

            gbFormularioProducto.DataContext = new Producto();
            txtCantidad.Text = "";

            dgPapeleria.SelectedIndex = -1;
            dgLibros.SelectedIndex = -1;

            lbListaVenta.Items.Refresh();
        }

        // Este metodo borrar los elementos seleccionados de las lista
        private void btnBorrar_Click(object sender, RoutedEventArgs e)
        {
            if (lbListaVenta.SelectedIndex != -1)
            {
                lineasVenta.Remove(lbListaVenta.SelectedItem as LineaVenta);
                lbListaVenta.Items.Refresh();
            }
        }

        // Este método genera una venta
        private void BtnGenerarVenta_Click(object sender, RoutedEventArgs e)
        {
            if (lbListaVenta.Items.Count > 0)
            {
                // Rellanar los datos de la venta                        
                Venta venta = new Venta();

                venta.Fecha = DateTime.Now;
                venta.UsuarioId = GestApp.user.UsuarioId;
                venta.LineasVenta = lineasVenta;
                venta.Importe = lineasVenta.Sum(s => s.Importe);

                // Comprobar si hay errores
                string errores = Validacion.errores(venta);
                if (String.IsNullOrEmpty(errores))
                {
                    bd.LineaVentaRepository.AñadirLista((List<LineaVenta>)venta.LineasVenta);
                    bd.VentaRepository.Añadir(venta);
                    if (actualizarStock())
                    {
                        if (!guardarBd())
                        {
                            return;
                        }

                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha generado correctamente la venta", letra: "#58D68D", fondo: "#333333");

                        lineasVenta = new List<LineaVenta>();
                        lbListaVenta.ItemsSource = lineasVenta;

                        PrintDialog p = new PrintDialog();
                        if (p.ShowDialog() == true)
                        {
                            Ticket t = new Ticket(venta);

                            t.Show();
                            p.PrintVisual(t.ventas, "Ticket de ventas");
                            t.Close();
                        }
                    }
                }
                else
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: errores, letra: "#b91523", fondo: "#333333");
            }
            else
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes hacer una venta sin productos", letra: "#b91523", fondo: "#333333");
        }

        // Este método sirve para actualizar el stock
        private Boolean actualizarStock()
        {
            List<LineaVenta> productos = (List<LineaVenta>)lbListaVenta.Items.SourceCollection;

            List<LineaVenta> productosParaActualizar = productos.Where(p => p.Producto != null).ToList();
            List<LineaVenta> librosParaActualizar = productos.Where(p => p.Producto.Libro != null).ToList();

            if (bd.ProductoRepository.actualizaStockVenta(productosParaActualizar).Where(p => p.Producto.Stock < 0).Any())
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes hacer una venta si alguno de sus productos no tiene stock suficiente", letra: "#b91523", fondo: "#333333");
                return false;
            }
            if (bd.LibroRepository.actualizaStockVenta(librosParaActualizar).Where(p => p.Producto.Libro.Stock < 0).Any())
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No puedes hacer una venta si alguno de sus productos no tiene stock suficiente", letra: "#b91523", fondo: "#333333");
                return false;
            }

            return true;
        }

        private void comprobarEnter(object sender, KeyEventArgs e)
        {
            if (e.Key.Equals(Key.Enter))
                BtnAñadir_Click(sender, e);
        }

        private void btnMostrarVentas_Click(object sender, RoutedEventArgs e)
        {
            GestApp ventanaPrincipal = Window.GetWindow(this) as GestApp;

            ventanaPrincipal.abrirListaVenta();
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
