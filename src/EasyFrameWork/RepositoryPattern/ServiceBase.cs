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

namespace Easy.RepositoryPattern
{
    public abstract class ServiceBase<T> : IService<T>
        where T : class
    {
        public ServiceBase(IApplicationContext applicationContext, DbContextBase dbContext)
        {
            ApplicationContext = applicationContext;
            DbContext = dbContext;
            DbContext.ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
        }
        
        public virtual DbContextBase DbContext
        {
            get;
            set;
        }
        public abstract DbSet<T> CurrentDbSet { get; }

        public IApplicationContext ApplicationContext { get; set; }

        public void BeginTransaction(Action action)
        {
            using (var transaction = DbContext.Database.BeginTransaction())
            {
                try
                {
                    action.Invoke();
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }
            }
        }

        public virtual void Add(T item)
        {
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
            DbContext.SaveChanges();
        }
        public virtual void AddRange(params T[] items)
        {
            foreach (var item in items)
            {
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
            DbContext.SaveChanges();
        }
        public virtual IQueryable<T> Get()
        {
            return CurrentDbSet;
        }
        public virtual T GetSingle(Expression<Func<T, bool>> filter)
        {
            return CurrentDbSet.Single(filter);
        }
        public virtual IList<T> Get(Expression<Func<T, bool>> filter)
        {
            return CurrentDbSet.Where(filter).ToList();
        }
        public virtual IList<T> Get(Expression<Func<T, bool>> filter, Pagination pagination)
        {
            pagination.RecordCount = Count(filter);
            IQueryable<T> result;
            if (filter != null)
            {
                result = CurrentDbSet.Where(filter);
            }
            else
            {
                result = CurrentDbSet;
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
            return result.Skip(pagination.PageIndex * pagination.PageSize).Take(pagination.PageSize).ToList();
        }
        public virtual T Get(params object[] primaryKey)
        {
            return CurrentDbSet.Find(primaryKey);
        }
        public virtual int Count(Expression<Func<T, bool>> filter)
        {
            if (filter != null)
            {
                return CurrentDbSet.Where(filter).Count();
            }
            return CurrentDbSet.Count();
        }
        public virtual void Update(T item, bool saveImmediately = true)
        {
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
            if (saveImmediately)
            {
                DbContext.SaveChanges();
            }
        }
        public virtual void UpdateRange(params T[] items)
        {
            foreach (var item in items)
            {
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
            DbContext.SaveChanges();
        }
        public void Remove(params object[] primaryKey)
        {
            var item = Get(primaryKey);
            if (item != null)
            {
                Remove(item);
            }
        }
        public virtual void Remove(T item, bool saveImmediately = true)
        {
            CurrentDbSet.Remove(item);
            if (saveImmediately)
            {
                DbContext.SaveChanges();
            }

        }
        public virtual void Remove(Expression<Func<T, bool>> filter)
        {
            CurrentDbSet.RemoveRange(CurrentDbSet.Where(filter));
            DbContext.SaveChanges();

        }
        public virtual void RemoveRange(params T[] items)
        {
            CurrentDbSet.RemoveRange(items);
            DbContext.SaveChanges();
        }
        public virtual void Dispose()
        {
            //DbContext.Dispose();
        }

        public void SaveChanges()
        {
            DbContext.SaveChanges();
        }
    }
}