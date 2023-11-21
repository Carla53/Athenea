using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class LineaCompraRepository : GenericRepository<LineaCompra>
    {
        public LineaCompraRepository(AtheneaContext context) : base(context)
        {

        }
        public List<LineaCompra> lineasCompraCompleto()
        {
            return Get(includeProperties: "Compra,Producto");
        }

        public List<LineaCompra> getLineaCompraById(int compraId)
        {
            return Get(l => l.CompraId == compraId, includeProperties: "Compra,Producto");
        }
    }
}
