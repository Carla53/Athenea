using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de las editoriales de los libros
    public class Editorial
    {
        public int EditorialId { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")]
        [StringLength(maximumLength: 20, ErrorMessage = "longitud máxima adminitida 20 caracteres")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El correo es obligatorio")]
        [EmailAddress(ErrorMessage = "Formato de correo no valido")]
        public string Correo { get; set; }
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
        public string Direccion
        {
            get
            {
                return Calle + ", " + CodigoPostal + ", " + Provincia + ", " + Concello;
            }
        }
        public byte[] Imagen { get; set; }


        public virtual ICollection<Libro> Libros { get; set; }

        public Editorial()
        {
            Libros = new HashSet<Libro>();
        }
    }
}
