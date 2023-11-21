using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de los productos
    public class Producto
    {
        public int ProductoId { get; set; }
        [Required(ErrorMessage = "El nombre es obligatorio")]
        [StringLength(maximumLength: 30, ErrorMessage = "longitud máxima adminitida 30 caracteres")]
        public string Nombre { get; set; }
        [StringLength(maximumLength: 20, ErrorMessage = "longitud máxima adminitida 20 caracteres")]
        public string Color { get; set; }
        public int Tamaño { get; set; }
        [StringLength(maximumLength: 200, ErrorMessage = "longitud máxima adminitida 200 caracteres")]
        public string Especificaciones { get; set; }
        [Required(ErrorMessage = "El sotck es obligatorio")]
        public int Stock { get; set; }
        public byte[] Imagen { get; set; }
        [Required(ErrorMessage = "El precio es obligatorio")]
        public double Precio { get; set; }
        public Boolean inactivo { get; set; }


        public virtual Categoria Categoria { get; set; }
        public int CategoriaId { get; set; }
        public virtual Marca Marca { get; set; }
        public int MarcaId { get; set; }
        public virtual Proveedor Proveedor { get; set; }
        public int? ProveedorId { get; set; }
        public virtual Libro Libro { get; set; }
        public virtual ICollection<LineaVenta> LineasVenta { get; set; }
        public virtual ICollection<LineaCompra> LineasCompra { get; set; }

        public Producto()
        {
            LineasVenta = new HashSet<LineaVenta>();
            LineasCompra = new HashSet<LineaCompra>();
        }
    }
}
