using System;

namespace Athenea.DAL
{
    public class UnitOfWork : IDisposable
    {
        private AtheneaContext context = new AtheneaContext();
        private bool disposed = false;

        private CategoriaRepository categoriaRepository;
        private ClienteRepository clienteRepository;
        private CompraRepository compraRepository;
        private EditorialRepository editorialRepository;
        private LibroRepository libroRepository;
        private LineaCompraRepository lineaCompraRepository;
        private LineaVentaRepository lineaVentaRepository;
        private MarcaRepository marcaRepository;
        private ProductoRepository productoRepository;
        private ProveedorRepository proveedorRepository;
        private RolRepository rolRepository;
        private UsuarioRepository usuarioRepository;
        private VentaRepository ventaRepository;
        private TipoRepository tipoRepository;

        public UnitOfWork() {
            context.Database.EnsureCreated();
        }

        public CategoriaRepository CategoriaRepository
        {
            get
            {
                if (categoriaRepository == null)
                {
                    categoriaRepository = new CategoriaRepository(context);
                }

                return categoriaRepository;
            }
        }

        public ClienteRepository ClienteRepository
        {
            get
            {
                if (clienteRepository == null)
                {
                    clienteRepository = new ClienteRepository(context);
                }

                return clienteRepository;
            }
        }

        public CompraRepository CompraRepository
        {
            get
            {
                if (compraRepository == null)
                {
                    compraRepository = new CompraRepository(context);
                }

                return compraRepository;
            }
        }

        public EditorialRepository EditorialRepository
        {
            get
            {
                if (editorialRepository == null)
                {
                    editorialRepository = new EditorialRepository(context);
                }

                return editorialRepository;
            }
        }

        public LibroRepository LibroRepository
        {
            get
            {
                if (libroRepository == null)
                {
                    libroRepository = new LibroRepository(context);
                }

                return libroRepository;
            }
        }

        public TipoRepository TipoRepository
        {
            get
            {
                if (tipoRepository == null)
                {
                    tipoRepository = new TipoRepository(context);
                }

                return tipoRepository;
            }
        }

        public LineaCompraRepository LineaCompraRepository
        {
            get
            {
                if (lineaCompraRepository == null)
                {
                    lineaCompraRepository = new LineaCompraRepository(context);
                }

                return lineaCompraRepository;
            }
        }

        public LineaVentaRepository LineaVentaRepository
        {
            get
            {
                if (lineaVentaRepository == null)
                {
                    lineaVentaRepository = new LineaVentaRepository(context);
                }

                return lineaVentaRepository;
            }
        }

        public MarcaRepository MarcaRepository
        {
            get
            {
                if (marcaRepository == null)
                {
                    marcaRepository = new MarcaRepository(context);
                }

                return marcaRepository;
            }
        }

        public ProductoRepository ProductoRepository
        {
            get
            {
                if (productoRepository == null)
                {
                    productoRepository = new ProductoRepository(context);
                }

                return productoRepository;
            }
        }
        public ProveedorRepository ProveedorRepository
        {
            get
            {
                if (proveedorRepository == null)
                {
                    proveedorRepository = new ProveedorRepository(context);
                }

                return proveedorRepository;
            }
        }

        public RolRepository RolRepository
        {
            get
            {
                if (rolRepository == null)
                {
                    rolRepository = new RolRepository(context);
                }

                return rolRepository;
            }
        }

        public UsuarioRepository UsuarioRepository
        {
            get
            {
                if (usuarioRepository == null)
                {
                    usuarioRepository = new UsuarioRepository(context);
                }

                return usuarioRepository;
            }
        }

        public VentaRepository VentaRepository
        {
            get
            {
                if (ventaRepository == null)
                {
                    ventaRepository = new VentaRepository(context);
                }

                return ventaRepository;
            }
        }

        public void Save()
        {
            context.SaveChanges();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
