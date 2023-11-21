using Athenea.Modelo;
using System.Collections.Generic;
using System.Windows.Media.Imaging;

namespace Athenea.DAL
{
    public class UsuarioRepository : GenericRepository<Usuario>
    {
        public UsuarioRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Usuario> usuariosCompleto()
        {
            return Get(includeProperties: "Rol,Ventas,Compras");
        }
    }
}
