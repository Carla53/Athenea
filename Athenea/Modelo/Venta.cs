using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de las ventas
    public class Venta
    {
        public int VentaId { get; set; }
        [Required(ErrorMessage = "La fecha es obligatoria")]
        public DateTime Fecha { get; set; }
        [Required(ErrorMessage = "El importe es obligatorio")]
        public double Importe { get; set; }


        public virtual ICollection<LineaVenta> LineasVenta { get; set; }
        public virtual Usuario Usuario { get; set; }
        public int UsuarioId { get; set; }
        public virtual Cliente Cliente { get; set; }
        public int? ClienteId { get; set; }

        public Venta()
        {
            LineasVenta = new List<LineaVenta>();
        }
    }
}
