using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class TipoRepository : GenericRepository<Tipo>
    {
        public TipoRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Tipo> tiposCompleto()
        {
            return Get(includeProperties: "Libros");
        }
    }
}
