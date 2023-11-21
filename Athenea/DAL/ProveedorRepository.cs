using Athenea.Modelo;
using System.Collections.Generic;

namespace Athenea.DAL
{
    public class ProveedorRepository : GenericRepository<Proveedor>
    {
        public ProveedorRepository(AtheneaContext context) : base(context)
        {

        }
        public List<Proveedor> proveedoresCompleto()
        {
            return Get(p => p.inactivo == false, includeProperties: "Productos,Compras");
        }

        public List<Proveedor> proveedoresCompletoConLibro(List<Libro> libros)
        {
            List<Proveedor> proveedores = Get(includeProperties: "Productos,Compras");

            foreach (Proveedor item in proveedores)
            {
                foreach (Producto producto in item.Productos)
                {
                    Libro libro = libros.Find(l => l.Nombre.Equals(producto.Nombre));
                    if (libro != null)
                    {
                        producto.Libro = libro;
                    }
                }
            }

            return proveedores;
        }

        public List<Proveedor> proveedoresFiltrarLibro(Libro libros)
        {
            List<Proveedor> proveedores = Get(includeProperties: "Productos,Compras");
            List<Proveedor> proveedoresLibros = new List<Proveedor>();

            foreach (Proveedor item in proveedores)
            {
                foreach (Producto producto in item.Productos)
                {
                    if (producto.Libro != null)
                    {
                        if (producto.Libro.LibroId == libros.LibroId)
                        {
                            proveedoresLibros.Add(item);
                        }
                    }
                }
            }

            return proveedoresLibros;
        }

        public List<Proveedor> proveedoresFiltrarProductos(Producto productoFiltro)
        {
            List<Proveedor> proveedores = Get(includeProperties: "Productos,Compras");
            List<Proveedor> proveedoresProductos = new List<Proveedor>();

            foreach (Proveedor item in proveedores)
            {
                foreach (Producto producto in item.Productos)
                {
                    if (producto.ProductoId == productoFiltro.ProductoId)
                    {
                        proveedoresProductos.Add(item);
                    }
                }
            }

            return proveedoresProductos;
        }
    }
}
