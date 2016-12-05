using System;
using System.Linq.Expressions;
using System.Collections.Generic;
namespace Easy.RepositoryPattern
{
    public interface IService<T> : IDisposable where T : class
    {
        DbContext<T> DbContext { get; set; }
        IApplicationContext ApplicationContext { get; set; }
        void Add(T item);
        void AddRange(params T[] items);
        IEnumerable<T> GetAll();
        T GetSingle(Expression<Func<T, bool>> filter);
        IEnumerable<T> Get(Expression<Func<T, bool>> filter);
        IEnumerable<T> Get(Expression<Func<T, bool>> filter, Pagination pagination);
        T Get(params object[] primaryKey);
        int Count(Expression<Func<T, bool>> filter);
        void Update(T item);
        void UpdateRange(params T[] items);
        void Remove(params object[] primaryKey);
        void Remove(T item);
        void Remove(Expression<Func<T, bool>> filter);
        void RemoveRange(params T[] items);
    }
}