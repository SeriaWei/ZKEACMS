using Easy.LINQ;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace Easy.RepositoryPattern
{
    public abstract class ServiceBase<T> : IService<T> where T : class
    {
        public ServiceBase(IApplicationContext applicationContext)
        {
            ApplicationContext = applicationContext;
        }
        public virtual DbContext<T> DbContext { get; set; } = new DbContext<T>();
        public IApplicationContext ApplicationContext { get; set; }
        
        public virtual void Add(T item)
        {
            DbContext.Instance.Add(item);
            DbContext.SaveChanges();
        }
        public virtual void AddRange(params T[] items)
        {
            DbContext.Instance.AddRange(items);
            DbContext.SaveChanges();
        }
        public virtual IEnumerable<T> GetAll()
        {
            return DbContext.Set<T>();
        }
        public virtual T GetSingle(Expression<Func<T, bool>> filter)
        {
            return DbContext.Instance.Single(filter);
        }
        public virtual IEnumerable<T> Get(Expression<Func<T, bool>> filter)
        {
            return DbContext.Instance.Where(filter);
        }
        public virtual IEnumerable<T> Get(Expression<Func<T, bool>> filter, Pagination pagination)
        {
            pagination.RecordCount = Count(filter);
            if (filter != null)
            {
                return DbContext.Instance.Where(filter).Skip(pagination.PageIndex * pagination.PageSize).Take(pagination.PageSize);
            }
            else
            {
                return DbContext.Instance.Skip(pagination.PageIndex * pagination.PageSize).Take(pagination.PageSize);
            }
        }
        public virtual T Get(params object[] primaryKey)
        {
            return DbContext.Instance.Find(primaryKey);
        }
        public virtual int Count(Expression<Func<T, bool>> filter)
        {
            if (filter != null)
            {
                return DbContext.Instance.Where(filter).Count();
            }
            return DbContext.Instance.Count();
        }
        public virtual void Update(T item)
        {
            DbContext.Instance.Update(item);
            DbContext.SaveChanges();
        }
        public virtual void UpdateRange(params T[] items)
        {
            DbContext.Instance.UpdateRange(items);
            DbContext.SaveChanges();
        }
        public virtual void Remove(params object[] primaryKey)
        {
            var item =DbContext.Instance.Find(primaryKey);
            if (item != null)
            {
                Remove(item);
            }
        }
        public virtual void Remove(T item)
        {
            DbContext.Instance.Remove(item);
            DbContext.SaveChanges();
        }
        public virtual void Remove(Expression<Func<T, bool>> filter)
        {
            DbContext.Instance.RemoveRange(DbContext.Instance.Where(filter));
            DbContext.SaveChanges();

        }
        public virtual void RemoveRange(params T[] items)
        {
            DbContext.Instance.RemoveRange(items);
            DbContext.SaveChanges();
        }
        public virtual void Dispose()
        {
            DbContext.Dispose();
        }
    }
}