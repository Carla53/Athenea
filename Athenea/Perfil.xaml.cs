using Athenea.DAL;
using Athenea.Librerias;
using Athenea.Modelo;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media.Imaging;

namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para Perfil.xaml
    /// </summary>
    public partial class Perfil : Page
    {
        private Usuario user;
        private UnitOfWork bd = new UnitOfWork();

        public Perfil()
        {
            InitializeComponent();

            // Relleno el elemento de la clase user con el de la clase GestApp
            user = GestApp.user;

            // Le indico al grid llamado formulario que su datacontexte es igual al elemento libro
            gbFormulario.DataContext = user;
            gbFormularioDireccion.DataContext = user;

            // Indico al DatePicker el tipo de formato que va a usar
            CultureInfo cultureInfoES = new CultureInfo("es-SP");
            dpFechReg.Language = System.Windows.Markup.XmlLanguage.GetLanguage(cultureInfoES.Name);

            // Pasar la imagen guardada de la bd al componente Image de la interfaz
            Imagen.Source = bd.UsuarioRepository.ToImage(user.Imagen);

            // Le indico a los comboBox que información tiene que mostrar y cuál sacar cuando se les pida el elemento seleccionado
            cbUser.ItemsSource = bd.UsuarioRepository.Get(u => u.Correo != user.Correo, includeProperties: "Rol,Ventas,Compras");

            cbUser.DisplayMemberPath = "Nombre";
            cbUser.SelectedValuePath = "UsuarioId";
        }

        // Compruebo si se ha seleccionado un usuario y si no es el mismo que el que se está utulizando y lo combio por el usuario indicado
        private void BtnCambiar_Click(object sender, RoutedEventArgs e)
        {
            if (cbUser.SelectedIndex != -1)
            {
                List<Usuario> userC = bd.UsuarioRepository.Get(u => u.DNI.Equals((cbUser.SelectedItem as Usuario).DNI), includeProperties: "Rol,Ventas,Compras");
                if (userC != null && userC.ElementAt(0).Clave.Equals(pswUserPassword.Password))
                {
                    GestApp.user = userC.ElementAt(0);

                    refrescarPagina();

                    pswUserPassword.Password = "";

                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha cambiado correctamente de usuario", letra: "#58D68D", fondo: "#333333");
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La contraseña del usuario es incorrecta", letra: "#b91523", fondo: "#333333");
                }
            }
        }

        private void comprobarEnter(object sender, KeyEventArgs e)
        {
            if (e.Key.Equals(Key.Enter))
                BtnCambiar_Click(sender, e);
        }

        private void refrescarPagina()
        {
            // Busco mi ventana principal activa y refresco las páginas de la app
            GestApp parent = Application.Current.Windows.OfType<GestApp>().FirstOrDefault();
            parent.comprobarRol();
            parent.refrescarPaginas();

            // Relleno el elemento de la clase user con el de la clase GestApp
            user = GestApp.user;

            // Le indico al grid llamado formulario que su datacontexte es igual al elemento libro
            gbFormulario.DataContext = user;
            gbFormularioDireccion.DataContext = user;

            // Indico al DatePicker el tipo de formato que va a usar
            CultureInfo cultureInfoES = new CultureInfo("es-SP");
            dpFechReg.Language = System.Windows.Markup.XmlLanguage.GetLanguage(cultureInfoES.Name);

            // Pasar la imagen guardada de la bd al componente Image de la interfaz
            Imagen.Source = bd.UsuarioRepository.ToImage(user.Imagen);

            cbUser.ItemsSource = bd.UsuarioRepository.Get(u => u.Correo != user.Correo, includeProperties: "Rol,Ventas,Compras");
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
                    user.Imagen = bitmapImageToBytes(new BitmapImage(new Uri(selectedFileName)));
                }
                catch (Exception)
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "A ocurrido un error con la transformación del archivo", letra: "#b91523", fondo: "#333333");
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
    }
}
