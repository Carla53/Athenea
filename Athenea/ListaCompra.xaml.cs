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
    /// Lógica de interacción para ListCompra.xaml
    /// </summary>
    public partial class ListaCompra : Page
    {
        private UnitOfWork bd = new UnitOfWork();
        private Compra compra = new Compra();
        private LineaCompra lineaCompra = new LineaCompra();

        public ListaCompra()
        {
            InitializeComponent();

            // Rellenar los DataGrid con todos los productos, libros y prooveedores de la BD
            dgCompras.ItemsSource = bd.CompraRepository.comprasCompleto();      
            
            // Rellenar los comboBox

            cbLibros.DisplayMemberPath = "Nombre";
            cbLibros.SelectedValuePath = "Producto.Libro.LibroId";

            cbProductos.DisplayMemberPath = "Nombre";
            cbProductos.SelectedValuePath = "Producto.ProductoId";

            // Indico que el contexto de datos del formulario de productos
            gbFormulario.DataContext = compra;
            gbFormulario.DataContext = lineaCompra;

            txtImporte.IsReadOnly = true;
        }

        private void BtnNuevo_Click(object sender, RoutedEventArgs e)
        {
            compra = new Compra();
            gbFormulario.DataContext = compra;
        }

        private void btnBorrar_Click(object sender, RoutedEventArgs e)
        {
            if (dgCompras.SelectedIndex != -1)
            {
                if (!String.IsNullOrEmpty(txtId.Text))
                {
                    actualizarStock();
                    bd.CompraRepository.Delete(p => p.CompraId == Int32.Parse(txtId.Text));
                }

                if (!guardarBd())
                {
                    return;
                }


                dgCompras.ItemsSource = bd.CompraRepository.comprasCompleto();
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente la cpmpra", letra: "#58D68D", fondo: "#333333");

                dgCompras.Items.Refresh();
            }
            else if (dgLineasCompra.SelectedIndex != 1 && dgCompras.SelectedIndex != -1)
            {
                LineaCompra lineasCompra = dgLineasCompra.SelectedItem as LineaCompra;
                bd.LineaCompraRepository.Delete(p => p.LineaCompraId == lineasCompra.LineaCompraId);
                if (!guardarBd())
                {
                    return;
                }
                dgLineasCompra.Items.Refresh();
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente la linea de compra", letra: "#58D68D", fondo: "#333333");
            }
        }

        private void actualizarStock()
        {
            List<LineaCompra> productos = (List<LineaCompra>)dgLineasCompra.Items.SourceCollection;

            List<LineaCompra> productosParaActualizar = productos.Where(p => p.Producto != null).ToList();
            List<LineaCompra> librosParaActualizar = productos.Where(p => p.Producto.Libro != null).ToList();

            bd.ProductoRepository.actualizaStockEliminarCompra(productosParaActualizar);
            bd.LibroRepository.actualizaStockEliminarCompra(librosParaActualizar);
        }

        private void btnBuscar_Click(object sender, RoutedEventArgs e)
        {
            List<Compra> aux = new List<Compra>();
            aux = bd.CompraRepository.Get(p => p.Proveedor.Nombre.Equals(txtBusquedaVent.Text)
            || p.Fecha.Equals(txtBusquedaVent.Text) || p.Usuario.Nombre.Equals(txtBusquedaVent.Text)
            || p.CompraId.Equals(txtBusquedaVent.Text));

            if (aux.Count > 0)
                dgCompras.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgCompras.ItemsSource = bd.CompraRepository.comprasCompleto();
            }
        }

        private void dgLineasCompra_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgLineasCompra.SelectedIndex != -1)
            {
                lineaCompra = (LineaCompra)dgLineasCompra.SelectedItem;

                if (!compra.LineasCompra.Contains(lineaCompra))
                {
                    compra.LineasCompra.Add(lineaCompra);
                }

                gbFormulario.DataContext = compra;
            }
        }

        private void dgCompra_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgCompras.SelectedIndex != -1)
            {
                compra = (Compra)dgCompras.SelectedItem;
                gbFormulario.DataContext = compra;
            }

            List<LineaCompra> lineasCompra = bd.LineaCompraRepository.getLineaCompraById(compra.CompraId);

            if (compra.LineasCompra.Count > 0)
            {
                dgLineasCompra.ItemsSource = lineasCompra;
            }


            List<Producto> productos = new List<Producto>();
            List<Producto> librosP = new List<Producto>();

            foreach (LineaCompra item in lineasCompra)
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
