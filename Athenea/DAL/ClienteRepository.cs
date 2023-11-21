using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class ClienteRepository : GenericRepository<Cliente>
    {
        public ClienteRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Cliente> clientesCompleto()
        {
            return Get(includeProperties: "Ventas");
        }
    }
}
