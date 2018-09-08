/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Linq.Expressions;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System.Linq;
using System.Threading.Tasks;

namespace Easy.RepositoryPattern
{
    public interface IService<T> : IDisposable
        where T : class
    {
        IApplicationContext ApplicationContext { get; set; }
        void BeginTransaction(Action action);
        ServiceResult<T> Add(T item);
        ServiceResult<T> AddRange(params T[] items);
        IQueryable<T> Get();
        T GetSingle(Expression<Func<T, bool>> filter);
        Task<T> GetSingleAsync(Expression<Func<T, bool>> filter);
        IList<T> Get(Expression<Func<T, bool>> filter);
        Task<IList<T>> GetAsync(Expression<Func<T, bool>> filter);
        IList<T> Get(Expression<Func<T, bool>> filter, Pagination pagination);
        Task<IList<T>> GetAsync(Expression<Func<T, bool>> filter, Pagination pagination);
        T Get(params object[] primaryKey);
        Task<T> GetAsync(params object[] primaryKey);
        int Count(Expression<Func<T, bool>> filter);
        Task<int> CountAsync(Expression<Func<T, bool>> filter);
        ServiceResult<T> Update(T item);
        ServiceResult<T> UpdateRange(params T[] items);
        void Remove(params object[] primaryKey);
        void Remove(T item);
        void Remove(Expression<Func<T, bool>> filter);
        void RemoveRange(params T[] items);
        void BeginBulkSave();
        void SaveChanges();
    }
}