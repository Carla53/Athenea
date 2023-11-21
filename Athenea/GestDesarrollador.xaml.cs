using Athenea.DAL;
using Athenea.Librerias;
using Athenea.Modelo;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using Usuarios.Modelo;

namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para GestDesarrollador.xaml
    /// </summary>
    public partial class GestDesarrollador : Page
    {
        private UnitOfWork bd = new UnitOfWork();
        private Usuario user = new Usuario();
        private Boolean nuevoUsuario = true;

        public GestDesarrollador()
        {
            InitializeComponent();

            // Le indico al grid llamado formulario que su datacontexte es igual al elemento libro
            gbFormulario.DataContext = user;
            gbFormularioDireccion.DataContext = user;
            user.FechaRegistro = DateTime.Now;

            // Indico al DatePicker el tipo de formato que va a usar
            CultureInfo cultureInfoES = new CultureInfo("es-SP");
            dpFechReg.Language = System.Windows.Markup.XmlLanguage.GetLanguage(cultureInfoES.Name);

            // Relleno el datagrid con todos los elementos usuario de la BD
            dgUsuarios.ItemsSource = bd.UsuarioRepository.usuariosCompleto();

            // Relleno los comboBox con toda la información que necesitan
            cbRol.ItemsSource = bd.RolRepository.rolesCompleto();

            // Le indico a los comboBox que información tiene que mostrar y cuál sacar cuando se les pida el elemento seleccionado

            cbRol.DisplayMemberPath = "Nombre";
            cbRol.SelectedValuePath = "RolId";
        }

        // Limpio todo el formulario
        private void BtnNuevo_Click(object sender, RoutedEventArgs e)
        {
            gbFormulario.DataContext = new Usuario();
            gbFormularioDireccion.DataContext = new Usuario();
            dgUsuarios.SelectedIndex = -1;
            nuevoUsuario = true;
        }

        // Este metodo añade la el usuario del datagrid a un elemento tipo libro de la página
        private void dgUsuarios_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dgUsuarios.SelectedIndex != -1)
            {
                user = (Usuario)dgUsuarios.SelectedItem;
                gbFormulario.DataContext = user;
                gbFormularioDireccion.DataContext = user;
                Imagen.Source = bd.UsuarioRepository.ToImage(user.Imagen);
                nuevoUsuario = false;
            }
        }

        // Este metodo buscar usuarios por el criterio que los usuarios elijan
        private void btnBuscar_Click(object sender, RoutedEventArgs e)
        {
            List<Usuario> aux = bd.UsuarioRepository.Get(l => l.DNI.Equals(txtBusquedaUs.Text) || l.Nombre.Equals(txtBusquedaUs.Text) || l.Apellidos.Contains(txtBusquedaUs.Text) || l.Clave.Equals(txtBusquedaUs.Text) || l.Correo.Equals(txtBusquedaUs.Text) || l.fechaReg.Contains(txtBusquedaUs.Text), includeProperties: "Rol,Ventas,Compras");

            if (aux.Count != 0)
                dgUsuarios.ItemsSource = aux;
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "No se han encontrado coincidencias", letra: "#b91523", fondo: "#333333");
                dgUsuarios.ItemsSource = bd.UsuarioRepository.usuariosCompleto();
            }
        }

        // Este metodo añade o modifica el usuario a la BD si todos los datos son correctos
        private void BtnGuardarUs_Click(object sender, RoutedEventArgs e)
        {
            string errores = Validacion.errores(user);

            if (txtApellidos.Text.Length > 0 && txtNombre.Text.Length > 0 && txtProvincia.Text.Length > 0
                && txtTelefono.Text.Length > 0 && txtCalle.Text.Length > 0 && txtClave.Text.Length > 0
                && txtCP.Text.Length > 0)
            {
                if (String.IsNullOrEmpty(errores))
                {
                    if (nuevoUsuario) // añadir
                    {
                        bd.UsuarioRepository.Añadir(user);
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha añadido correctamente el producto", letra: "#58D68D", fondo: "#333333");
                    }
                    else // Modificar
                    {
                        bd.UsuarioRepository.Update(user);
                        LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha modificado correctamente el producto", letra: "#58D68D", fondo: "#333333");
                    }
                    if (!guardarBd())
                    {
                        return;
                    }
                    nuevoUsuario = false;
                    dgUsuarios.SelectedIndex = -1;
                    dgUsuarios.ItemsSource = bd.UsuarioRepository.usuariosCompleto();
                }
                else
                {
                    LibreriaV7.MostrarSnackbar(sbNotification, mensaje: errores, letra: "#b91523", fondo: "#f3f3f3");
                }
            }
            else
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Faltan campos por cubrir", letra: "#b91523", fondo: "#f3f3f3");
            }
        }

        // Este metodo borra de la BD el usuario que indica el usuario por medio de su codigo
        private void btnBorrar_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(txtDNI.Text))
            {
                bd.UsuarioRepository.Delete(d => d.DNI.Equals(txtDNI.Text));
                if (!guardarBd())
                {
                    return;
                }
                dgUsuarios.ItemsSource = bd.UsuarioRepository.usuariosCompleto();
                dgUsuarios.Items.Refresh();

                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Se ha eliminado correctamente el producto", letra: "#58D68D", fondo: "#333333");
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
                    user.Imagen = bitmapImageToBytes(new BitmapImage(new Uri(selectedFileName)));
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
            catch
            {
                LibreriaV7.MostrarSnackbar(sbNotification, mensaje: "Ha ocurrido un error inesperado", letra: "#b91523", fondo: "#333333");
                return false;
            }
        }
    }
}
