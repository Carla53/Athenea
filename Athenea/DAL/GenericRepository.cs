using Microsoft.EntityFrameworkCore;
using Microsoft.Xaml.Behaviors.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Windows.Media.Imaging;

namespace Athenea.DAL
{
    public class GenericRepository<TEntity> where TEntity : class
    {
        internal AtheneaContext context;
        internal DbSet<TEntity> dbSet;
        public GenericRepository(AtheneaContext context)
        {
            this.context = context;
            dbSet = context.Set<TEntity>();
        }

        public void Update(TEntity entity)
        {
            context.Entry(entity).State = EntityState.Modified;
        }

        public void Delete(TEntity entityToDelete)
        {
            if (context.Entry(entityToDelete).State == EntityState.Detached)
            {
                dbSet.Attach(entityToDelete);
            }

            dbSet.Remove(entityToDelete);

            context.Entry(entityToDelete).State = EntityState.Deleted;
        }

        public void Delete(Expression<Func<TEntity, bool>> predicate)
        {
            var entities = dbSet.Where(predicate).ToList();
            entities.ForEach(x => context.Entry(x).State = EntityState.Deleted);
        }

        public BitmapImage ToImage(byte[] array) // de la base de Datos para asignar a un control
        {
            if (array != null)
            {
                using (var ms = new System.IO.MemoryStream(array))
                {
                    var image = new BitmapImage();
                    image.BeginInit();
                    image.CacheOption = BitmapCacheOption.OnLoad;
                    image.StreamSource = ms;
                    image.EndInit();
                    return image;
                }
            } return null;
        }

        public void Añadir(TEntity entity)
        {
            dbSet.Add(entity);
        }

        public void AñadirLista(List<TEntity> entity)
        {
            foreach (TEntity item in entity)
            {
                dbSet.Add(item);
            }
        }

        public List<TEntity> GetAll()
        {
            return (List<TEntity>)dbSet.ToList();
        }

        public List<TEntity> Get(Expression<Func<TEntity, bool>> filter = null, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null, string includeProperties = "")
        {
            IQueryable<TEntity> query = dbSet;
            if (filter != null)
            {
                query = query.Where(filter);
            }
            foreach (var includeProperty in includeProperties.Split
            (new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(includeProperty);
            }
            if (orderBy != null)
            {
                return orderBy(query).ToList();
            }
            else 
                return query.ToList();
        }

        public TEntity Single(Expression<Func<TEntity, bool>> predicate)
        {
            dbSet = context.Set<TEntity>();
            return dbSet.FirstOrDefault(predicate);
        }
    }
}

