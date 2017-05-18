using System;
using System.Linq.Expressions;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;

namespace Easy.RepositoryPattern
{
    public interface IService<T> : IDisposable
        where T : class
    {
        void SetDbContext(DbContext dbContext);
        IApplicationContext ApplicationContext { get; set; }
        void BeginTransaction(Action action);
        void Add(T item);
        void AddRange(params T[] items);
        IEnumerable<T> GetAll();
        T GetSingle(Expression<Func<T, bool>> filter);
        IEnumerable<T> Get(Expression<Func<T, bool>> filter);
        IEnumerable<T> Get(Expression<Func<T, bool>> filter, Pagination pagination);
        T Get(params object[] primaryKey);
        int Count(Expression<Func<T, bool>> filter);
        void Update(T item, bool saveImmediately = true);
        void UpdateRange(params T[] items);
        void Remove(params object[] primaryKey);
        void Remove(T item, bool saveImmediately = true);
        void Remove(Expression<Func<T, bool>> filter);
        void RemoveRange(params T[] items);
        void SaveChanges();
    }
}