/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.LINQ;
using Easy.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using Easy.Extend;
using System.ComponentModel.DataAnnotations.Schema;
using System.Threading.Tasks;

namespace Easy.RepositoryPattern
{
    public abstract class ServiceBase<T, TdbContext> : IService<T>
        where T : class
        where TdbContext : DbContext
    {
        public ServiceBase(IApplicationContext applicationContext, TdbContext dbContext)
        {
            ApplicationContext = applicationContext;
            DbContext = dbContext;
            isInBulkSaving = false;
        }

        public virtual TdbContext DbContext
        {
            get;
            set;
        }
        public virtual DbSet<T> CurrentDbSet { get { return DbContext.Set<T>(); } }

        public IApplicationContext ApplicationContext { get; set; }

        private bool isInBulkSaving;

        public void BeginTransaction(Action action)
        {
            if (DbContext.Database.CurrentTransaction == null)
            {
                using (var transaction = DbContext.Database.BeginTransaction())
                {
                    try
                    {
                        action.Invoke();
                        transaction.Commit();
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
            else
            {
                action.Invoke();
            }
        }
        public TEntity BeginTransaction<TEntity>(Func<TEntity> action)
        {
            if (DbContext.Database.CurrentTransaction == null)
            {
                using (var transaction = DbContext.Database.BeginTransaction())
                {
                    try
                    {
                        var result = action.Invoke();
                        if (result is ErrorOr sResult && sResult.HasError)
                        {
                            transaction.Rollback();
                        }
                        else
                        {
                            transaction.Commit();
                        }                        
                        return result;
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
            else
            {
                return action.Invoke();
            }
        }
        protected virtual ErrorOr<T> Validate(T item)
        {
            ErrorOr<T> serviceResult = new ErrorOr<T>();
            var entryType = typeof(T);
            var viewConfig = ServiceLocator.GetViewConfigure(typeof(T));
            if (viewConfig != null)
            {
                entryType.GetProperties().Each(p =>
                {
                    if (p.GetCustomAttribute<NotMappedAttribute>() == null)
                    {
                        var descroptor = viewConfig.GetViewPortDescriptor(p.Name);
                        if (descroptor != null)
                        {
                            descroptor.Validator.Each(v =>
                            {
                                if (!v.Validate(p.GetValue(item)))
                                {
                                    serviceResult.AddError(p.Name, v.ErrorMessage);
                                }
                            });
                        }
                    }

                });
            }
            serviceResult.Result = item;
            return serviceResult;
        }
        public virtual ErrorOr<T> Add(T item)
        {
            var result = Validate(item);
            if (result.HasError)
            {
                return result;
            }
            var editor = item as EditorEntity;
            if (editor != null)
            {
                if (ApplicationContext.CurrentUser != null)
                {
                    editor.CreateBy = ApplicationContext.CurrentUser.UserID;
                    editor.CreatebyName = ApplicationContext.CurrentUser.UserName;

                    editor.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                    editor.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
                }
                editor.CreateDate = DateTime.Now;
                editor.LastUpdateDate = DateTime.Now;
            }
            CurrentDbSet.Add(item);
            SaveChanges();
            return result;
        }
        public virtual ErrorOr<T> AddRange(params T[] items)
        {
            ErrorOr<T> result = new ErrorOr<T>();
            foreach (var item in items)
            {
                var itemResult = Validate(item);
                if (itemResult.HasError)
                {
                    return itemResult;
                }
                var editor = item as EditorEntity;
                if (editor != null)
                {
                    if (ApplicationContext.CurrentUser != null)
                    {
                        editor.CreateBy = ApplicationContext.CurrentUser.UserID;
                        editor.CreatebyName = ApplicationContext.CurrentUser.UserName;

                        editor.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                        editor.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
                    }
                    editor.CreateDate = DateTime.Now;
                    editor.LastUpdateDate = DateTime.Now;
                }
            }
            CurrentDbSet.AddRange(items);
            SaveChanges();
            return result;
        }

        public virtual IQueryable<T> Get()
        {
            return CurrentDbSet;
        }
        public virtual T GetSingle(Expression<Func<T, bool>> filter)
        {
            return Get().Single(filter);
        }
        public virtual async Task<T> GetSingleAsync(Expression<Func<T, bool>> filter)
        {
            return await Get().SingleAsync(filter);
        }
        public virtual IList<T> Get(Expression<Func<T, bool>> filter)
        {
            return Get().Where(filter).ToList();
        }
        public virtual async Task<IList<T>> GetAsync(Expression<Func<T, bool>> filter)
        {
            return await Get().Where(filter).ToListAsync();
        }
        public virtual IList<T> Get(Expression<Func<T, bool>> filter, Pagination pagination)
        {
            pagination.RecordCount = Count(filter);
            IQueryable<T> result;
            if (filter != null)
            {
                result = Get().Where(filter);
            }
            else
            {
                result = Get();
            }
            if (pagination.OrderBy != null || pagination.OrderByDescending != null)
            {
                if (pagination.OrderBy != null)
                {
                    result = result.OrderBy(pagination.OrderBy);
                }
                else
                {
                    result = result.OrderByDescending(pagination.OrderByDescending);
                }

                if (pagination.ThenBy != null || pagination.ThenByDescending != null)
                {
                    if (pagination.ThenBy != null)
                    {
                        result = (result as IOrderedQueryable<T>).ThenBy(pagination.ThenBy);
                    }
                    else
                    {
                        result = (result as IOrderedQueryable<T>).ThenByDescending(pagination.ThenByDescending);
                    }
                }
            }
            return result.Skip(pagination.PageIndex * pagination.PageSize).Take(pagination.PageSize).ToList();
        }
        public virtual async Task<IList<T>> GetAsync(Expression<Func<T, bool>> filter, Pagination pagination)
        {
            pagination.RecordCount = await CountAsync(filter);
            IQueryable<T> result;
            if (filter != null)
            {
                result = Get().Where(filter);
            }
            else
            {
                result = Get();
            }
            if (pagination.OrderBy != null || pagination.OrderByDescending != null)
            {
                if (pagination.OrderBy != null)
                {
                    result = result.OrderBy(pagination.OrderBy);
                }
                else
                {
                    result = result.OrderByDescending(pagination.OrderByDescending);
                }
            }
            return await result.Skip(pagination.PageIndex * pagination.PageSize).Take(pagination.PageSize).ToListAsync();
        }
        public virtual T Get(params object[] primaryKey)
        {
            return CurrentDbSet.Find(primaryKey);
        }
        public virtual async Task<T> GetAsync(params object[] primaryKey)
        {
            return await CurrentDbSet.FindAsync(primaryKey);
        }
        public virtual int Count(Expression<Func<T, bool>> filter)
        {
            if (filter != null)
            {
                return Get().Where(filter).Count();
            }
            return Get().Count();
        }
        public virtual async Task<int> CountAsync(Expression<Func<T, bool>> filter)
        {
            if (filter != null)
            {
                return await Get().Where(filter).CountAsync();
            }
            return await Get().CountAsync();
        }
        public virtual ErrorOr<T> Update(T item)
        {
            var result = Validate(item);
            if (result.HasError)
            {
                return result;
            }
            var editor = item as EditorEntity;
            if (editor != null)
            {
                if (ApplicationContext.CurrentUser != null)
                {
                    editor.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                    editor.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
                }
                editor.LastUpdateDate = DateTime.Now;
            }
            CurrentDbSet.Update(item);
            SaveChanges();
            return result;
        }
        public virtual ErrorOr<T> UpdateRange(params T[] items)
        {
            foreach (var item in items)
            {
                var itemResult = Validate(item);
                if (itemResult.HasError)
                {
                    return itemResult;
                }
                var editor = item as EditorEntity;
                if (editor != null)
                {
                    if (ApplicationContext.CurrentUser != null)
                    {
                        editor.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                        editor.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
                    }
                    editor.LastUpdateDate = DateTime.Now;
                }
            }
            CurrentDbSet.UpdateRange(items);
            SaveChanges();
            return new ErrorOr<T>();
        }
        public void Remove(params object[] primaryKey)
        {
            var item = Get(primaryKey);
            if (item != null)
            {
                Remove(item);
            }
        }
        public virtual void Remove(T item)
        {
            CurrentDbSet.Remove(item);
            SaveChanges();
        }
        public virtual void Remove(Expression<Func<T, bool>> filter)
        {
            CurrentDbSet.Where(filter).ExecuteDelete();
        }
        public virtual void RemoveRange(params T[] items)
        {
            CurrentDbSet.RemoveRange(items);
            SaveChanges();
        }
        public virtual void Dispose()
        {
            //DbContext.Dispose();
        }
        private void SaveChanges()
        {
            if(!isInBulkSaving)
            {
                DbContext.SaveChanges();
                DbContext.ChangeTracker.Clear();
            }
        }

        public virtual void BeginBulkSave()
        {
            isInBulkSaving = true;
        }

        public virtual void EndBulkSave()
        {
            isInBulkSaving = false;
            SaveChanges();
        }
        
    }
    public abstract class ServiceBase<T> : ServiceBase<T, DbContext>
        where T : class
    {
        public ServiceBase(IApplicationContext applicationContext, DbContext dbContext) : base(applicationContext, dbContext)
        {
        }
    }
}