using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Abstract
{
    public class EntityRepository<T> : IRepository<T> where T : EntityObject
    {
        protected ObjectSet<T> _table;
        protected ObjectContext _context;

        public EntityRepository() : this(new LegalAdviceContainer())
        {
        }

        public EntityRepository(ObjectContext objectContext)
        {
            _context = objectContext;
            _table = _context.CreateObjectSet<T>();
        }

        public void Detach(T entity)
        {
            _table.Detach(entity);
        }

        public T Get(int id)
        {
            string entitySetName = _context.DefaultContainerName + "." + _table.EntitySet.Name;
            string keyName = _table.EntitySet.ElementType.KeyMembers[0].ToString();
            var key = new EntityKey(entitySetName, new[] { new EntityKeyMember(keyName, id) });

            object found;
            if (_context.TryGetObjectByKey(key, out found))
                return (T)found;
            else
                return null;
        }

        public IQueryable<T> Get()
        {
            return _table.AsQueryable();
        }

        public T Add(T entity)
        {
            _table.AddObject(entity);
            SaveChanges();
            return entity;
        }

        public void Delete(T entity)
        {
            _table.DeleteObject(entity);
            SaveChanges();
        }

        public T Update(T entity)
        {
            if (entity.EntityState == EntityState.Detached)
            {
                _table.Attach(entity);
            }

            _table.Context.ObjectStateManager.ChangeObjectState(entity, System.Data.EntityState.Modified);

            SaveChanges();

            return entity;
        }

        public T First(Expression<Func<T, bool>> where)
        {
            return _table.FirstOrDefault(where);
        }

        public IEnumerable<T> Where(Expression<Func<T, bool>> where)
        {
            return _table.Where<T>(where);
        }

        public void Delete(int id)
        {
            var entity = Get(id);
            _table.DeleteObject(entity);
            SaveChanges();
        }

        public void Delete(IEnumerable<T> entities)
        {
            foreach (T entity in entities)
            {
                _table.DeleteObject(entity);
            }

            SaveChanges();
        }


        public void SaveChanges()
        {
            _table.Context.SaveChanges();
        }
    }
}
