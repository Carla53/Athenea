using Athenea.Modelo;
using Microsoft.EntityFrameworkCore;
using System;
using System.IO;
using System.Windows.Media.Imaging;

namespace Athenea.DAL
{
    public class AtheneaContext : DbContext
    {
        DbSet<Producto> Productos { get; set; }
        DbSet<Categoria> Categorias { get; set; }
        DbSet<Libro> Libros { get; set; }
        DbSet<Editorial> Editoriales { get; set; }
        DbSet<Compra> Compras { get; set; }
        DbSet<LineaCompra> LineasCompra { get; set; }
        DbSet<Venta> Ventas { get; set; }
        DbSet<LineaVenta> LineasVenta { get; set; }
        DbSet<Cliente> Clientes { get; set; }
        DbSet<Proveedor> Proveedores { get; set; }
        DbSet<Usuario> Trabajadores { get; set; }
        DbSet<Rol> Roles { get; set; }
        DbSet<Marca> Marcas { get; set; }

        private byte[] bitmapImageToBytes(BitmapImage image) // del control a campo de la base de datos
        {
            if (image == null) { return null; }
            var encoder = new JpegBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(image));
            using (var ms = new MemoryStream())
            {
                encoder.Save(ms);
                return ms.ToArray();
            }
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseSqlServer(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Athenea;User Id=sa;password=abc123.");
            optionsBuilder.UseSqlServer(@"server=(LocalDB)\MSSQLLocalDB; database=Athenea; integrated security = true");
            //optionsBuilder.UseSqlServer(@"Data Source=.; database=Athenea; integrated security = true");
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //Nombre.Entity<ClasePrincipal>().HasOne<ClaseSecundaria>(s=>s.Objeto_clase_secundaria_en_clase_principal).WithOne(p=>p.Objeto_clase_principal_en_clase_secundaria).HasForeignKey<ClaseSecundaria>(a=>a.ForeignKey) )

            modelBuilder.Entity<Producto>()
                .HasOne<Categoria>(s => s.Categoria)
                .WithMany(p => p.Productos)
                .HasForeignKey(f => f.CategoriaId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Producto>()
                .HasOne<Marca>(s => s.Marca)
                .WithMany(p => p.Productos)
                .HasForeignKey(f => f.MarcaId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Usuario>()
                .HasOne<Rol>(s => s.Rol)
                .WithMany(p => p.Usuarios)
                .HasForeignKey(f => f.RolId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Marca>()
                .HasOne<Categoria>(s => s.Categoria)
                .WithMany(p => p.Marcas)
                .HasForeignKey(f => f.CategoriaId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Producto>()
                .HasOne<Proveedor>(s => s.Proveedor)
                .WithMany(p => p.Productos)
                .HasForeignKey(f => f.ProveedorId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Libro>()
                .HasOne<Editorial>(s => s.Editorial)
                .WithMany(p => p.Libros)
                .HasForeignKey(f => f.EditorialId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Libro>()
                .HasOne<Tipo>(s => s.Tipo)
                .WithMany(p => p.Libros)
                .HasForeignKey(f => f.TipoId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<LineaVenta>()
                .HasOne<Venta>(s => s.Venta)
                .WithMany(p => p.LineasVenta)
                .HasForeignKey(f => f.VentaId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<LineaVenta>()
                .HasOne<Producto>(s => s.Producto)
                .WithMany(p => p.LineasVenta)
                .HasForeignKey(f => f.ProductoId)
                .OnDelete(DeleteBehavior.NoAction); 
            
            modelBuilder.Entity<Venta>()
               .HasMany<LineaVenta>(s => s.LineasVenta)
               .WithOne(p => p.Venta)
               .HasForeignKey(f => f.VentaId)
               .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Venta>()
                .HasOne<Cliente>(s => s.Cliente)
                .WithMany(p => p.Ventas)
                .HasForeignKey(f => f.ClienteId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Venta>()
                .HasOne<Usuario>(s => s.Usuario)
                .WithMany(p => p.Ventas)
                .HasForeignKey(f => f.UsuarioId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<LineaCompra>()
                .HasOne<Compra>(s => s.Compra)
                .WithMany(p => p.LineasCompra)
                .HasForeignKey(f => f.CompraId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<LineaCompra>()
                .HasOne<Producto>(s => s.Producto)
                .WithMany(p => p.LineasCompra)
                .HasForeignKey(f => f.ProductoId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Compra>()
                .HasMany<LineaCompra>(s => s.LineasCompra)
                .WithOne(p => p.Compra)
                .HasForeignKey(f => f.CompraId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Compra>()
                .HasOne<Proveedor>(s => s.Proveedor)
                .WithMany(p => p.Compras)
                .HasForeignKey(f => f.ProveedorId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Compra>()
                .HasOne<Usuario>(s => s.Usuario)
                .WithMany(p => p.Compras)
                .HasForeignKey(f => f.UsuarioId)
                .OnDelete(DeleteBehavior.Cascade);


            modelBuilder.Entity<Cliente>().HasAlternateKey(c => new { c.DNI });

            modelBuilder.Entity<Usuario>().HasAlternateKey(c => new { c.DNI });

            modelBuilder.Entity<Proveedor>().HasAlternateKey(c => new { c.CIF });

            modelBuilder.Entity<LineaVenta>().HasAlternateKey(c => new { c.VentaId, c.ProductoId });

            modelBuilder.Entity<LineaCompra>().HasAlternateKey(c => new { c.CompraId, c.ProductoId });


            modelBuilder.Entity<Categoria>().HasData(
                new Categoria
                {
                    CategoriaId = 1,
                    Nombre = "Libro"
                },
                new Categoria
                {
                    CategoriaId = 2,
                    Nombre = "Cuaderno"
                },
                new Categoria
                {
                    CategoriaId = 3,
                    Nombre = "Utensilio"
                },
                new Categoria
                {
                    CategoriaId = 4,
                    Nombre = "Arte"
                },
                new Categoria
                {
                    CategoriaId = 5,
                    Nombre = "Dibujo"
                },
                new Categoria
                {
                    CategoriaId = 6,
                    Nombre = "Papel"
                }
            );

            modelBuilder.Entity<Marca>().HasData(
                new Marca
                {
                    MarcaId = 1,
                    Nombre = "no hay marca",
                    CategoriaId = 1
                },
                new Marca
                {
                    MarcaId = 2,
                    Nombre = "Faber",
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\faber_logo.png", UriKind.Relative)))
                },
                new Marca
                {
                    MarcaId = 3,
                    Nombre = "Staedtler",
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\staedtler_logo.jpg", UriKind.Relative)))
                },
                new Marca
                {
                    MarcaId = 4,
                    Nombre = "Cretacolor Fine Art Graphite",
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\cretacolor_logo.jpg", UriKind.Relative)))
                },
                new Marca
                {
                    MarcaId = 5,
                    Nombre = "Lyra ArtDesign 669",
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\lyra_logo.jpg", UriKind.Relative)))
                },
                new Marca
                {
                    MarcaId = 6,
                    Nombre = "Bic",
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\bic_logo.png", UriKind.Relative)))
                },
                new Marca
                {
                    MarcaId = 7,
                    Nombre = "Alpino",
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\alpino_logo.png", UriKind.Relative)))
                },
                new Marca
                {
                    MarcaId = 8,
                    Nombre = "Milan",
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\milan_logo.png", UriKind.Relative)))
                }
            );

            modelBuilder.Entity<Rol>().HasData(
                new Rol
                {
                    RolId = 1,
                    Nombre = "Admin",
                },
                new Rol
                {
                    RolId = 2,
                    Nombre = "Recepcionista",
                }
            );

            modelBuilder.Entity<Tipo>().HasData(
                new Tipo
                {
                    TipoId = 1,
                    Nombre = "Comic",
                },
                new Tipo
                {
                    TipoId = 2,
                    Nombre = "Texto",
                },
                new Tipo
                {
                    TipoId = 3,
                    Nombre = "Revista",
                }
            );

            modelBuilder.Entity<Usuario>().HasData(
                new Usuario
                {
                    UsuarioId = 1,
                    Nombre = "Admin",
                    Apellidos = "admin",
                    FechaRegistro = DateTime.Now,
                    Correo = "adminGD@gmail.com",
                    Calle = "Calle 1",
                    Provincia = "Ourense",
                    CodigoPostal = 32005,
                    Concello = "Concello 1",
                    Clave = "abc123.",
                    DNI = "2546895G",
                    RolId = 1,
                    Telefono = "123456789",
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\user1.png", UriKind.Relative)))
                },
                new Usuario
                {
                    UsuarioId = 2,
                    Nombre = "Virtudes",
                    Apellidos = "Hernandez",
                    FechaRegistro = DateTime.Now,
                    Correo = "VirtudesHR@gmail.com",
                    Calle = "Calle 2",
                    Provincia = "Valencia",
                    CodigoPostal = 32005,
                    Concello = "Concello 2",
                    Clave = "abc123.",
                    DNI = "2546685D",
                    RolId = 2,
                    Telefono = "123456589"
                }
            );

            modelBuilder.Entity<Editorial>().HasData(
                new Editorial
                {
                    EditorialId = 1,
                    Nombre = "Alamut",
                    Calle = "Calle 3",
                    CodigoPostal = 45253,
                    Correo = "alamut@gmail.com",
                    Concello = "Concello M",
                    Provincia = "Pronvincia 3",
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\alamut_logo.jpeg", UriKind.Relative)))
                },
                new Editorial
                {
                    EditorialId = 2,
                    Nombre = "Nova",
                    Calle = "Calle 5",
                    CodigoPostal = 45453,
                    Correo = "nova@gmail.com",
                    Concello = "Madrid",
                    Provincia = "Madrid",
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\nova_logo.jpg", UriKind.Relative)))
                }
            );

            modelBuilder.Entity<Proveedor>().HasData(
                new Proveedor
                {
                    ProveedorId = 1,
                    Nombre = "Empresa1",
                    Siglas = "S.A",
                    Calle = "Calle 4",
                    CodigoPostal = 45563,
                    Concello = "Concello K",
                    Provincia = "Pronvincia 4",
                    CIF = "B–76365789",
                    Correo = "empresa1@gmail.com",
                    Telefono = "987654321"
                },
                new Proveedor
                {
                    ProveedorId = 2,
                    Nombre = "Empresa2",
                    Siglas = "S.L",
                    Calle = "Calle 10",
                    CodigoPostal = 40963,
                    Concello = "Concello Q",
                    Provincia = "Pronvincia 4",
                    CIF = "B–76365349",
                    Correo = "empresa2@gmail.com",
                    Telefono = "987648321"
                }
            );

            modelBuilder.Entity<Producto>().HasData(
                new Producto
                {
                    ProductoId = 1,
                    Nombre = "Lapiz",
                    Tamaño = 8,
                    ProveedorId = 1,
                    Color = "Rojo",
                    Especificaciones = "",
                    MarcaId = 3,
                    Precio = 5.1,
                    Stock = 10,
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\lapiz.jpg", UriKind.Relative)))
                },
                new Producto
                {
                    ProductoId = 2,
                    ProveedorId = 1,
                    Nombre = "Castillo Ambulante",
                    Precio = 10.2,
                    Stock = 10,
                    CategoriaId = 1,
                    MarcaId = 1
                },
                new Producto
                {
                    ProductoId = 3,
                    ProveedorId = 2,
                    Nombre = "Dune",
                    Precio = 10.2,
                    Stock = 10,
                    CategoriaId = 1,
                    MarcaId = 1
                },
                new Producto
                {
                    ProductoId = 4,
                    Nombre = "Goma",
                    Tamaño = 3,
                    ProveedorId = 1,
                    Color = "Rosa",
                    Especificaciones = "",
                    MarcaId = 8,
                    Precio = 5.1,
                    Stock = 10,
                    CategoriaId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\goma_milan.jpg", UriKind.Relative)))
                },

                new Producto
                {
                    ProductoId = 5,
                    ProveedorId = 2,
                    Nombre = "Mitsborn",
                    Precio = 19.85,
                    Stock = 50,
                    CategoriaId = 1,
                    MarcaId = 1
                }
            );

            modelBuilder.Entity<Libro>().HasData(
                new Libro
                {
                    LibroId = 1,
                    ISBN = "0-7645-2641-3",
                    Nombre = "Castillo Ambulante",
                    Descripcion = "Descipcion",
                    ProveedorId = 1,
                    Autor = "Autor",
                    Edicion = 7,
                    EditorialId = 1,
                    Precio = 10.2,
                    Stock = 18,
                    TipoId = 2,
                    ProductoId = 2,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\castillo_ambulante_cover.jpg", UriKind.Relative)))
                },
                new Libro
                {
                    LibroId = 2,
                    ISBN = "0-7885-3471-3",
                    Nombre = "Dune",
                    Descripcion = "Dune",
                    ProveedorId = 2,
                    Autor = "Frank Herbert",
                    Edicion = 7,
                    EditorialId = 1,
                    Precio = 10.2,
                    Stock = 18,
                    TipoId = 2,
                    ProductoId = 3,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\dune_cover.jpg", UriKind.Relative)))
                },
                new Libro
                {
                    LibroId = 3,
                    ISBN = "2-6885-3371-3",
                    Nombre = "Imperio final",
                    Descripcion = "Mistborn I",
                    ProveedorId = 2,
                    Autor = "Brandon Sanderson",
                    Edicion = 14,
                    EditorialId = 2,
                    Precio = 19.8,
                    Stock = 18,
                    TipoId = 2,
                    ProductoId = 5,
                    Imagen = bitmapImageToBytes(new BitmapImage(new Uri(@"Imagenes\BD\mistborn_imperio_final_cover.jpg", UriKind.Relative)))
                }
            );
        }
    }
}

