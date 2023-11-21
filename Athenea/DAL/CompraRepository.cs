using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class CompraRepository : GenericRepository<Compra>
    {
        public CompraRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Compra> comprasCompleto()
        {
            return Get(includeProperties: "LineasCompra,Usuario,Proveedor");
        }
    }
}
