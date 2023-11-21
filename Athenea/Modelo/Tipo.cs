using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de los los tipos de libro que puedes haber y
    // adecuar las opciones de los mismos en la aplicación
    // Se divide en tres tipos
    // Texto, comic y revista
    public class Tipo
    {
        public int TipoId { get; set; }
        [Required(ErrorMessage = "El nombre es obligatorio")]
        [StringLength(maximumLength: 20, ErrorMessage = "longitud máxima adminitida 20 caracteres")]
        public string Nombre { get; set; }


        public virtual ICollection<Libro> Libros { get; set; }

        public Tipo()
        {
            Libros = new HashSet<Libro>();
        }
    }
}
