using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de los prooveedores
    public class Proveedor
    {
        [Required(ErrorMessage = "El cif es obligatorio")]
        [RegularExpression(@"/^[A-HJ-NP-SUVW]([0-9]{7})([0-9A-J])$", ErrorMessage = "El formato del cif es incorrecto")]
        public string CIF { get; set; }
        [Required(ErrorMessage = "El nombre es obligatorio")]
        [StringLength(maximumLength: 20, ErrorMessage = "longitud máxima adminitida 20 caracteres")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "Las silgas son obligatorias")]
        [RegularExpression(@"/^(S\.L\.L?|S\.A|S\.L\.N\.E|S\.Coop|S\.L\.U)$/i", ErrorMessage = "El formato del cif es incorrecto")]
        // Los tipos de siglas en España son: S.L (Sociedad Limitada), S.A (Sociedad Ánonima), S.L.N.E (Similar a la sociedad limitada, capital mínimo 3.000€)
        // S.L.L (Sociedad limitada laboral), S.Coop (Sociedad corporativa), S.L.U (Sociedad limitada Unipersonal)
        public string Siglas { get; set; }

        [Required(ErrorMessage = "El correo es obligatorio")]
        [EmailAddress(ErrorMessage = "Formato de correo no valido")]
        public string Correo { get; set; }

        [Phone(ErrorMessage = "El formato del telefono es incorrecto")]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "El nombre de la calle es obligatorio")]
        [StringLength(maximumLength: 80, ErrorMessage = "longitud máxima adminitida 80 caracteres")]
        public string Calle { get; set; }
        [Required(ErrorMessage = "El nombre de la provincia es obligatorio")]
        [StringLength(maximumLength: 30, ErrorMessage = "longitud máxima adminitida 30 caracteres")]
        public string Provincia { get; set; }
        [Required(ErrorMessage = "El nombre del concello es obligatorio")]
        [StringLength(maximumLength: 50, ErrorMessage = "longitud máxima adminitida 50 caracteres")]
        public string Concello { get; set; }
        [Required(ErrorMessage = "El codigo postal es obligatorio")]
        [StringLength(maximumLength: 5, MinimumLength = 5, ErrorMessage = "El formato del codigo postal es incorrecto")]
        public int CodigoPostal { get; set; }
        public byte[] Imagen { get; set; }
        public Boolean inactivo { get; set; }
        public string Direccion
        {
            get
            {
                return Calle + ", " + CodigoPostal + ", " + Provincia + ", " + Concello;
            }
        }
        public string NombreCompleto
        {
            get
            {
                return Nombre + " " + Siglas;
            }
        }

        public int ProveedorId { get; set; }

        public virtual ICollection<Compra> Compras { get; set; }
        public virtual ICollection<Producto> Productos { get; set; }

        public Proveedor()
        {
            Productos = new HashSet<Producto>();
            Compras = new HashSet<Compra>();
        }
    }
}
