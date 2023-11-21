using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de las lineas de una compra
    public class LineaCompra
    {
        public int LineaCompraId { get; set; }
        [Required(ErrorMessage = "La cantidad es obligatia")]
        public int Cantidad { get; set; }
        public double Importe
        {
            get
            {
                if (Cantidad != null)
                {
                    return Precio * Cantidad;
                }
                else return Importe;
            }
        }
        [Required(ErrorMessage = "El precio es obligatio")]
        public double Precio { get; set; }


        public virtual Compra Compra { get; set; }
        public int CompraId { get; set; }
        public virtual Producto Producto { get; set; }
        public int ProductoId { get; set; }

        public LineaCompra() { }
    }
}
