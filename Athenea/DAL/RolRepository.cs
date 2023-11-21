using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class RolRepository : GenericRepository<Rol>
    {
        public RolRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Rol> rolesCompleto()
        {
            return Get(includeProperties: "Usuarios");
        }
    }
}
