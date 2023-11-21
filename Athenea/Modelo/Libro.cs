using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de los libros
    public class Libro
    {
        [Required(ErrorMessage = "El ISBN es obligatorio")]
        [RegularExpression(@"^(?:ISBN(?:-1[03])?:?●)?(?=[0-9X]{10}$|(?=(?:[0-9]+[-●]){3})[-●0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[-●]){4})[-●0-9]{17}$)(?:97[89][-●]?)?[0-9]{1,5}[-●]?[0-9]+[-●]?[0-9]+[-●]?[0-9X]$", ErrorMessage = "El formato del ISBN es incorrecto")]
        public string ISBN { get; set; }
        [Required(ErrorMessage = "El nombre es obligatorio")]
        [StringLength(maximumLength: 60, ErrorMessage = "longitud máxima adminitida 60 caracteres")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "El autor es obligatorio")]
        [StringLength(maximumLength: 20, ErrorMessage = "longitud máxima adminitida 20 caracteres")]
        public string Autor { get; set; }
        [Required(ErrorMessage = "El stock es obligatorio")]
        public int Stock { get; set; }
        [Required(ErrorMessage = "La descripcion es obligatoria")]
        [StringLength(maximumLength: 150, ErrorMessage = "longitud máxima adminitida 150 caracteres")]
        public string Descripcion { get; set; }
        public byte[] Imagen { get; set; }
        [Required(ErrorMessage = "El precio es obligatio")]
        public double Precio { get; set; }
        [Required(ErrorMessage = "La edición es obligatia")]
        public int Edicion { get; set; }
        public Boolean inactivo { get; set; }


        public int LibroId { get; set; }

        public virtual Editorial Editorial { get; set; }
        public int EditorialId { get; set; }
        public virtual Proveedor Proveedor { get; set; }
        public int? ProveedorId { get; set; }
        public virtual Tipo Tipo { get; set; }
        public int TipoId { get; set; }
        public virtual Producto Producto { get; set; }
        public int ProductoId { get; set; }

        public Libro() { }
    }
}
