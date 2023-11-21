using Athenea.Modelo;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Athenea
{
    /// <summary>
    /// Lógica de interacción para Ticket.xaml
    /// </summary>
    public partial class Ticket : Window
    {
        public Ticket(Venta venta)
        {
            InitializeComponent();

            // Rellena las labels
            lbFecha.Content += DateTime.Now + "";
            lbTotalSinIva.Content = venta.Importe;
            lbTotalIva.Content = ((venta.Importe * 21)/100) + venta.Importe;

            // Rellena el dataGrid con las lineas de venta
            dgVentas.ItemsSource = venta.LineasVenta;
        }
    }
}
