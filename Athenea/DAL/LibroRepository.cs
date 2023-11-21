using Athenea.Modelo;
using System;
using System.Collections.Generic;
using System.Windows.Media.Imaging;

namespace Athenea.DAL
{
    public class LibroRepository : GenericRepository<Libro>
    {
        public LibroRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Libro> librosCompleto()
        {
            return Get(l => l.inactivo == false, includeProperties: "Editorial,Tipo,Proveedor,Producto");
        }
        public List<LineaVenta> actualizaStockVenta(List<LineaVenta> aux)
        {
            if (aux != null && aux.Count > 0)
            {
                aux.ForEach(x => x.Producto.Libro.Stock -= x.Cantidad);
            }
            return aux;
        }
        public List<LineaCompra> actualizaStockCompra(List<LineaCompra> aux)
        {
            if (aux != null && aux.Count > 0)
            {
                aux.ForEach(x => x.Producto.Libro.Stock += x.Cantidad);
            }
            return aux;
        }
        public List<LineaVenta> actualizaStockEliminarVenta(List<LineaVenta> aux)
        {
            if (aux != null && aux.Count > 0)
            {
                aux.ForEach(x => x.Producto.Libro.Stock += x.Cantidad);
            }
            return aux;
        }
        public List<LineaCompra> actualizaStockEliminarCompra(List<LineaCompra> aux)
        {
            if (aux != null && aux.Count > 0)
            {
                aux.ForEach(x => x.Producto.Libro.Stock -= x.Cantidad);
            }
            return aux;
        }
    }
}
