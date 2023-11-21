using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de las compras realizadas en la aplicacion
    public class Compra
    {
        public int CompraId { get; set; }
        [Required]
        public DateTime Fecha { get; set; }
        [Required]
        public double Importe { get; set; }


        public virtual ICollection<LineaCompra> LineasCompra { get; set; }
        public virtual Usuario Usuario { get; set; }
        public int UsuarioId { get; set; }
        public virtual Proveedor Proveedor { get; set; }
        public int ProveedorId { get; set; }

        public Compra()
        {
            LineasCompra = new HashSet<LineaCompra>();
        }
    }
}
