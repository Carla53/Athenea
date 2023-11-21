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
    /// Lógica de interacción para ListaVentas.xaml
    /// </summary>
    public partial class ListaVentas : Page
    {
        private UnitOfWork bd = new UnitOfWork();
        private Venta venta = new Venta();
        private LineaVenta lineaVenta = new LineaVenta();

        public ListaVentas()
        {
            InitializeComponent();

            // Rellenar los DataGrid con todos los productos, libros y prooveedores de la BD
            dgVentas.ItemsSource = bd.VentaRepository.ventasCompleto();

            // Rellenar los comboBox

            cbLibros.DisplayMemberPath = "Nombre";
            cbLibros.SelectedValuePath = "Producto.Libro.LibroId";

            cbProductos.DisplayMemberPath = "Nombre";
            cbProductos.SelectedValuePath = "Producto.ProductoId";

            // Indico que el contexto de datos del formulario de productos
            gbFormulario.DataContext = venta;
            gbFormulario.DataContext = lineaVenta;

            txtImporte.IsReadOnly = true;
        }

        private void BtnNuevo_Click(object sender, RoutedEventArgs e)
        {
            venta = new Venta();
            gbFormulario.DataContext = venta;
        }

        private void btnBorrar_Click(object sender, RoutedEventArgs e)
        {
            int linea = dgLineasVenta.SelectedIndex;
            if (dgVentas.SelectedIndex != -1)
            {
                if (!String.IsNullOrEmpty(txtId.Text))
                {
                    actualizarStock();
                    bd.VentaRepository.Delete(p => p.VentaId == Int32.Parse(txtId.Text));
                }

                if (!guardarBd())
                {
                    return;
                }

                dgVentas.ItemsSource = bd.VentaRepository.ventasCompleto();
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente la venta", letra: "#58D68D", fondo: "#333333");

                dgVentas.Items.Refresh();
            } else if (dgLineasVenta.SelectedIndex != -1)
            {
                LineaVenta lineasVenta = dgLineasVenta.SelectedItem as LineaVenta;
                bd.LineaVentaRepository.Delete(p => p.LineaVentaId == lineasVenta.LineaVentaId);
                if (!guardarBd())
                {
                    return;
                }
                dgLineasVenta.Items.Refresh();
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente la linea de venta", letra: "#58D68D", fondo: "#333333");
            }
        }

        // Este método sirve para actualizar el stock
        private void actualizarStock()
        {
            List<LineaVenta> productos = (List<LineaVenta>)dgLineasVenta.Items.SourceCollection;

            List<LineaVenta> productosParaActualizar = productos.Where(p => p.Producto != null).ToList();
            List<LineaVenta> librosParaActualizar = productos.Where(p => p.Producto.Libro != null).ToList();

            bd.ProductoRepository.actualizaStockEliminarVenta(productosParaActualizar);
            bd.LibroRepository.actualizaStockEliminarVenta(librosParaActualizar);
        }

        private void btnBuscar_Click(object sender, RoutedEventArgs e)
        {
            List<Venta> aux = new List<Venta>();
            aux = bd.VentaRepository.Get(p => p.Cliente.Nombre.Equals(txtBusquedaVenta.Text)
            || p.Fecha.Equals(txtBusquedaVenta.Text) || p.Usuario.Nombre.Equals(txtBusquedaVenta.Text)
            || p.VentaId.Equals(txtBusquedaVenta.Text));
            if (aux.Count > 0)
                dgVentas.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgVentas.ItemsSource = bd.VentaRepository.ventasCompleto();
            }
        }

        private void dgLineasVenta_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgLineasVenta.SelectedIndex != -1)
            {
                lineaVenta = (LineaVenta)dgLineasVenta.SelectedItem;
                
                if (!venta.LineasVenta.Contains(lineaVenta))
                {
                    venta.LineasVenta.Add(lineaVenta);
                }

                gbFormulario.DataContext = venta;
            }
        }

        private void dgVentas_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgVentas.SelectedIndex != -1)
            {
                venta = (Venta)dgVentas.SelectedItem;
                gbFormulario.DataContext = venta;

                List<LineaVenta> lineasVenta = bd.LineaVentaRepository.getLineaVentaById(venta.VentaId);

                if (venta.LineasVenta.Count > 0)
                {
                    dgLineasVenta.ItemsSource = lineasVenta;
                }

                List<Producto> productos = new List<Producto>();
                List<Producto> librosP = new List<Producto>();

                foreach (LineaVenta item in lineasVenta)
                {
                    if (item.Producto.CategoriaId != 1)
                        productos.Add(item.Producto);
                    else librosP.Add(item.Producto);
                }

                List<Libro> libros = new List<Libro>();

                foreach (Producto item in librosP)
                {
                    libros = bd.LibroRepository.Get(l => l.ProductoId == item.ProductoId, includeProperties: "Editorial,Tipo,Proveedor,Producto");
                }

                cbLibros.ItemsSource = libros;
                cbProductos.ItemsSource = productos;
                cbLibros.SelectedIndex = 0;
                cbProductos.SelectedIndex = 0;
            }
        }

        private void btnAtras_Click(object sender, RoutedEventArgs e)
        {
            GestApp ventanaPrincipal = Window.GetWindow(this) as GestApp;

            ventanaPrincipal.BtnAbrirVenta_Click(sender, e);
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
