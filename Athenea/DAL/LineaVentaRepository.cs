using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class LineaVentaRepository : GenericRepository<LineaVenta>
    {
        public LineaVentaRepository(AtheneaContext context) : base(context)
        {

        }
        public List<LineaVenta> lineasVentaCompleto()
        {
            return Get(includeProperties: "Venta,Producto");
        }

        public List<LineaVenta> getLineaVentaById(int ventaId)
        {
            return Get(l => l.VentaId == ventaId, includeProperties: "Venta,Producto");
        }
    }
}
