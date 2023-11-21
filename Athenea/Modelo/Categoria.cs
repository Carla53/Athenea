using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Athenea.Modelo
{
    // Esta clase sirve para guardar informacion de las categorias de productos
    public class Categoria
    {
        public int CategoriaId { get; set; }
        [Required(ErrorMessage = "El nombre es obligatio")]
        [StringLength(maximumLength: 20, ErrorMessage = "longitud máxima adminitida 20 caracteres")]
        public string Nombre { get; set; }


        public virtual ICollection<Producto> Productos { get; set; }
        public virtual ICollection<Marca> Marcas { get; set; }

        public Categoria()
        {
            Productos = new HashSet<Producto>();
            Marcas = new HashSet<Marca>();
        }
    }
}
