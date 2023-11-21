using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class MarcaRepository : GenericRepository<Marca>
    {
        public MarcaRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Marca> marcasCompleto()
        {
            return Get(includeProperties: "Categoria,Productos");
        }
    }
}
