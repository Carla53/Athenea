using Athenea.Librerias;
using Athenea.Modelo;
using ControlzEx.Standard;
using System;
using System.Collections.Generic;
using System.Windows.Media.Imaging;

namespace Athenea.DAL
{
    public class ProductoRepository : GenericRepository<Producto>
    {
        public ProductoRepository(AtheneaContext context) : base(context)
        {

        }

        public List<Producto> productosCompleto()
        {
            return Get(p =>p.CategoriaId != 1 && p.inactivo == false, includeProperties: "Categoria,Marca,Proveedor");
        }

        public List<LineaVenta> actualizaStockVenta(List<LineaVenta> aux)
        {
            if (aux != null && aux.Count > 0)
            {
                aux.ForEach(x => x.Producto.Stock -= x.Cantidad);
            }
            return aux;
        }
        public List<LineaCompra> actualizaStockCompra(List<LineaCompra> aux)
        {
            if (aux != null && aux.Count > 0)
            {
                aux.ForEach(x => x.Producto.Stock += x.Cantidad);
            }
            return aux;
        }
        public List<LineaVenta> actualizaStockEliminarVenta(List<LineaVenta> aux)
        {
            if (aux != null && aux.Count > 0)
            {
                aux.ForEach(x => x.Producto.Stock += x.Cantidad);
            }
            return aux;
        }
        public List<LineaCompra> actualizaStockEliminarCompra(List<LineaCompra> aux)
        {
            if (aux != null && aux.Count > 0)
            {
                aux.ForEach(x => x.Producto.Stock -= x.Cantidad);
            }
            return aux;
        }
    }
}
