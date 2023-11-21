using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class CategoriaRepository : GenericRepository<Categoria>
    {
        public CategoriaRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Categoria> categoriasCompleto()
        {
            return Get(includeProperties: "Productos,Marcas");
        }
    }
}
