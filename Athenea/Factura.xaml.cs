using Athenea.Modelo;
using iTextSharp.text;
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
    /// Lógica de interacción para Factura.xaml
    /// </summary>
    public partial class Factura : Window
    {
        public Factura(Compra compra)
        {
            InitializeComponent();

            // Rellena las labels
            lbNumFactura.Content = compra.CompraId + "";
            lbFecha.Content = DateTime.Now;
            lbTotalIva.Content = compra.Importe;
            lbTotalSinIva.Content = ((compra.Importe * 21) / 100) + compra.Importe;
            lbECalle.Content = compra.Proveedor.Calle;
            lbEProvincia.Content = compra.Proveedor.Provincia;
            lbEDireccion.Content = compra.Proveedor.CodigoPostal + " " + compra.Proveedor.Concello + ", " + compra.Proveedor.Provincia;

            // Rellena el dataGrid con las lineas de venta
            dgCompras.ItemsSource = compra.LineasCompra;
        }
    }
}
