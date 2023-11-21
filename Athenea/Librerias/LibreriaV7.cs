
using Athenea.DAL;
using MaterialDesignThemes.Wpf;
using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Animation;
namespace Athenea.Librerias
{
    public static class LibreriaV7
    {
        /// <summary>
        /// Crea Una Animacion con los parametros que le pasas
        /// </summary>
        /// <param name="Obj">Objeto al que se le quiere aplicar la Animacion</param>
        /// <param name="xName">Nombre del objeto al que se le quiere aplicar la Animacion</param>
        /// <param name="duracion">Tiempo en segundos</param>
        /// <param name="propiedad">Propiedad que se quiere modificar</param>
        /// <param name="from">Inicio</param>
        /// <param name="to">Fin</param>
        /// <param name="autoreverse">Que vuelva a la posición inicial(Default:False)</param>
        public static void Animacion(Object Obj, String xName, double duracion, Object propiedad, double from, double to, bool autoreverse = false, bool infinito = false)
        {
            Object Objeto = (UIElement)Obj;
            DoubleAnimation myDoubleAnimation = new DoubleAnimation();
            Storyboard myStoryboard = new Storyboard();

            myDoubleAnimation.From = from;
            myDoubleAnimation.To = to;
            myDoubleAnimation.Duration = new Duration(TimeSpan.FromSeconds(duracion));
            myDoubleAnimation.AutoReverse = autoreverse;
            if (infinito)
            {
                myDoubleAnimation.RepeatBehavior = RepeatBehavior.Forever;
            }
            myStoryboard.Children.Add(myDoubleAnimation);
            Storyboard.SetTargetName(myDoubleAnimation, xName);
            Storyboard.SetTargetProperty(myDoubleAnimation, new PropertyPath(propiedad));
            myStoryboard.Begin((FrameworkElement)Objeto);
        }
        /// <summary>
        /// Muestra un snackbar
        /// </summary>
        /// <param name="snackbar">Objeto Snackbar</param>
        /// <param name="mensaje">Mensaje</param>
        /// <param name="duracion">Duracion</param>
        /// <param name="letra">color letra HEX (default:#FFFAFAFA)</param>
        /// <param name="fondo">color fondo HEX (default:#FFFAFAFA)</param>
        public static void MostrarSnackbar(object snackbar, string mensaje, double duracion = 1.25, string letra = "#FFFAFAFA", string fondo = "#FF323232")
        {
            Snackbar sb = (Snackbar)snackbar;
            sb.MessageQueue.Clear();
            sb.Foreground = (Brush)new BrushConverter().ConvertFromString(letra);
            sb.Background = (Brush)new BrushConverter().ConvertFromString(fondo);
            var time = duracion;
            sb.MessageQueue?.Enqueue(
                $"" + mensaje,
                null,
                null,
                null,
                false,
                true,

                TimeSpan.FromSeconds(time));
        }
    }
}
