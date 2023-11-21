using System;
using System.Windows;

namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para vPdf.xaml
    /// </summary>
    public partial class vPdf : Window
    {
        public vPdf(Uri uRuta)
        {
            InitializeComponent();
            wbPdf.Source = uRuta;
        }
    }
}
