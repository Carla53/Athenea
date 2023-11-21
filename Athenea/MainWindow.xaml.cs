using Athenea.DAL;
using Athenea.Librerias;
using Athenea.Modelo;
using System;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using Usuarios.Modelo;

namespace Athenea
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private UnitOfWork bd = new UnitOfWork();
        private Usuario user = new Usuario();

        public MainWindow()
        {
            InitializeComponent();

            cbUsuario.ItemsSource = bd.UsuarioRepository.usuariosCompleto();

            cbUsuario.DisplayMemberPath = "Nombre";
            cbUsuario.SelectedValuePath = "UsuarioId";
        }

        // Entra en la aplicacion con el usuario indicado si todos los datos son correctos
        private void btnEntrar_OnClick(object sender, RoutedEventArgs e)
        {
            if (cbUsuario.SelectedValue != null)
            {
                if (bd.UsuarioRepository.Get(u => u.UsuarioId == (int)cbUsuario.SelectedValue, includeProperties: "Rol,Ventas,Compras").Count > 0)
                {
                    user = bd.UsuarioRepository.Get(u => u.UsuarioId == (int)cbUsuario.SelectedValue, includeProperties: "Rol,Ventas,Compras").First();
                    if (user.Clave.Equals(pwdPass.Password))
                    {
                        GestApp.user = user;
                        GestApp ventana = new GestApp();
                        ventana.Show();
                        this.Close();
                    }
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "La contraseña es incorrecta", letra: "#b91523", fondo: "#333333");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Tienes que seleccionar un usuario", letra: "#b91523", fondo: "#333333");
            }
            pwdPass.Password = "";
        }
        
        private void MgEye_MouseEnter(object sender, MouseEventArgs e)
        {
            txtPass.Visibility = Visibility.Visible;
            pwdPass.Visibility = Visibility.Hidden;
            txtPass.Text = pwdPass.Password;
        }

        private void MgEye_MouseLeave(object sender, MouseEventArgs e)
        {
            txtPass.Visibility = Visibility.Hidden;
            pwdPass.Visibility = Visibility.Visible;
            pwdPass.Password = txtPass.Text;
        }

        private void comprobarEnter(object sender, KeyEventArgs e)
        {
            if (e.Key.Equals(Key.Enter))
                btnEntrar_OnClick(sender, e);
        }
    }
}
