using Athenea.Librerias;
using Athenea.Modelo;
using System;
using System.Windows;

namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para GestApp.xaml
    /// </summary>
    public partial class GestApp : Window
    {
        public static Usuario user = new Usuario();

        private GestLibro libro = new GestLibro();
        private GestPapeleria papeleria = new GestPapeleria();
        private GestVenta venta = new GestVenta();
        private GestCompra compra = new GestCompra();
        private GestDesarrollador desarrollador = new GestDesarrollador();
        private Perfil perfil = new Perfil();
        private GestProveedor proveedor = new GestProveedor();

        public GestApp()
        {
            InitializeComponent();

            frame.Source = new Uri("GestVenta.xaml", UriKind.Relative);

            // Llamo al metodo para que compruebe los permisos del usuario
            comprobarRol();
        }

        // Escondo la opcion de desarrollador si el usuario no tiene los permisos necesarios
        public void comprobarRol()
        {
            if (user.RolId != 1)
                btnDesarrollador.Visibility = Visibility.Hidden;
            else
                btnDesarrollador.Visibility = Visibility.Visible;
        }

        public void BtnAbrirVenta_Click(object sender, RoutedEventArgs e)
        {
            refrescarPaginas();
            frame.Content = venta;
        }

        public void BtnAbrirCompra_Click(object sender, RoutedEventArgs e)
        {
            refrescarPaginas();
            frame.Content = compra;
        }

        private void BtnAbrirPapeleria_Click(object sender, RoutedEventArgs e)
        {
            refrescarPaginas();
            frame.Content = papeleria;
        }

        private void BtnAbrirLibros_Click(object sender, RoutedEventArgs e)
        {
            refrescarPaginas();
            frame.Content = libro;
        }

        private void BtnAbrirOpcionDes_Click(object sender, RoutedEventArgs e)
        {
            refrescarPaginas();
            frame.Content = desarrollador;
        }

        private void BtnAbrirPerfil_Click(object sender, RoutedEventArgs e)
        {
            refrescarPaginas();
            frame.Content = perfil;
        }
        private void btnAbrirProoveedor_Click(object sender, RoutedEventArgs e)
        {
            refrescarPaginas();
            frame.Content = proveedor;
        }

        public void abrirListaCompra()
        {
            frame.Content = new ListaCompra();
        }

        public void abrirListaVenta()
        {
            frame.Content = new ListaVentas();
        }

        // Se abre el pdf de ayuda al usuario
        private void btnAbrirAyuda_Click(object sender, RoutedEventArgs e)
        {
            new vPdf(new Uri(Environment.CurrentDirectory + "\\Archivos\\ManualUsuario.pdf")).Show();
        }

        public void refrescarPaginas()
        {
            libro = new GestLibro();
            papeleria = new GestPapeleria();
            venta = new GestVenta();
            compra = new GestCompra();
            desarrollador = new GestDesarrollador();
            perfil = new Perfil();
            proveedor = new GestProveedor();
        }   
    }
}
