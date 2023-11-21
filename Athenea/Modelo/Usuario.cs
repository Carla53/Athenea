using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de los usuarios de la tienda
    public class Usuario
    {
        public int UsuarioId { get; set; }
        [Required(ErrorMessage = "El nombre es obligatorio")]
        [StringLength(maximumLength: 20, ErrorMessage = "longitud máxima adminitida 20 caracteres")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "Los apellidos son obligatorios")]
        [StringLength(maximumLength: 50, ErrorMessage = "longitud máxima adminitida 50 caracteres")]
        public string Apellidos { get; set; }
        [Required(ErrorMessage = "El DNI es obligatorio")]
        [RegularExpression(@"^[A-Z]?\d(8)[A-z]$", ErrorMessage = "Dni con formato erroneo")]
        public string DNI { get; set; }
        [Required(ErrorMessage = "El email es obligatorio")]
        [EmailAddress(ErrorMessage = "Formato de correo no valido")]
        public string Correo { get; set; }

        [Required(ErrorMessage = "La contraseña es obligatoria")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$", ErrorMessage = "El formato de la contraseña es incorrecta")]
        public string Clave { get; set; }
        [Required(ErrorMessage = "El telefono es obligatorio")]
        [Phone(ErrorMessage = "Formato de correo no válido")]
        public string Telefono { get; set; }
        [Required(ErrorMessage = "La fecha de refistro es obligatoria")]
        public DateTime FechaRegistro { get; set; }

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

        // Junto todos los datos de la dirección en un solo string
        public string Direccion
        {
            get
            {
                if (Concello != null && Calle != null && Provincia != null && CodigoPostal != null)
                {
                    if (Calle.Length > 0 && Concello.Length > 0 && Provincia.Length > 0 && CodigoPostal > 0)
                    {
                        return Calle + ", " + CodigoPostal + ", " + Provincia + ", " + Concello;
                    }
                    else
                        return "";
                }
                else return "";
            }
        }
        // método para sacar una fecha con un formato especifico
        public string fechaReg
        {
            get
            {
                return FechaRegistro.ToString("dd/MM/yyyy");
            }
        }

        public virtual Rol Rol { get; set; }
        public int RolId { get; set; }
        public virtual ICollection<Venta> Ventas { get; set; }
        public virtual ICollection<Compra> Compras { get; set; }

        public Usuario()
        {
            Ventas = new HashSet<Venta>();
            Compras = new HashSet<Compra>();
        }
    }
}
