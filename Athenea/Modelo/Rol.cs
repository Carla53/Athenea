using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de los roles que puede tener un usuario y adecuar
    // las opciones de los mismos en la aplicación
    public class Rol
    {
        // Rol tiene estas categorias
        //
        // 1 --> Admin
        // 2 --> Encargado
        //

        public int RolId { get; set; }
        [Required]
        [StringLength(maximumLength: 25, ErrorMessage = "longitud máxima adminitida 25 caracteres")]
        public string Nombre { get; set; }

        public virtual ICollection<Usuario> Usuarios { get; set; }

        public Rol()
        {
            Usuarios = new HashSet<Usuario>();
        }
    }
}
