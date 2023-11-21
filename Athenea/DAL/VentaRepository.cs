using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class VentaRepository : GenericRepository<Venta>
    {
        public VentaRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Venta> ventasCompleto()
        {
            return Get(includeProperties: "LineasVenta,Usuario,Cliente");
        }
    }
}
