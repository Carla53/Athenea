using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class EditorialRepository : GenericRepository<Editorial>
    {
        public EditorialRepository(AtheneaContext context) : base(context)
        {


        }
        public List<Editorial> editorialesCompleto()
        {
            return Get(includeProperties: "Libros");
        }
    }
}
