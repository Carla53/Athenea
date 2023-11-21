using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de las marcas de los productos
    public class Marca
    {
        public int MarcaId { get; set; }
        [Required(ErrorMessage = "El nombre es obligatorio")]
        [StringLength(maximumLength: 40, ErrorMessage = "longitud máxima adminitida 40 caracteres")]
        public string Nombre { get; set; }
        public byte[] Imagen { get; set; }


        public virtual Categoria Categoria { get; set; }
        public int CategoriaId { get; set; }
        public virtual ICollection<Producto> Productos { get; set; }

        public Marca()
        {
            Productos = new HashSet<Producto>();
        }
    }
}
