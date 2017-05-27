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

namespace Easy.RepositoryPattern
{
    public abstract class ServiceBase<T, TDB> : IService<T>
        where T : class
        where TDB : DbContext, new()
    {
        public ServiceBase(IApplicationContext applicationContext)
        {
            ApplicationContext = applicationContext;
        }
        private TDB _dbContext;
        public virtual TDB DbContext
        {
            get
            {
                return _dbContext ?? (_dbContext = new TDB());
            }
            set { _dbContext = value; }
        }
        public abstract DbSet<T> CurrentDbSet { get; }

        public IApplicationContext ApplicationContext { get; set; }


        public virtual void SetDbContext(DbContext dbContext)
        {
            var target = DbContext as TDB;
            if (target != null)
            {
                DbContext = target;
            }
            else throw new Exception("DbContext must inherit from:" + typeof(TDB).FullName);
        }
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
            if (editor != null && ApplicationContext.CurrentUser != null)
            {
                editor.CreateBy = ApplicationContext.CurrentUser.UserID;
                editor.CreatebyName = ApplicationContext.CurrentUser.UserName;
                editor.CreateDate = DateTime.Now;

                editor.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                editor.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
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
                if (editor != null && ApplicationContext.CurrentUser != null)
                {
                    editor.CreateBy = ApplicationContext.CurrentUser.UserID;
                    editor.CreatebyName = ApplicationContext.CurrentUser.UserName;
                    editor.CreateDate = DateTime.Now;

                    editor.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                    editor.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
                    editor.LastUpdateDate = DateTime.Now;
                }
            }
            CurrentDbSet.AddRange(items);
            DbContext.SaveChanges();
        }
        public virtual IEnumerable<T> GetAll()
        {
            return DbContext.Set<T>();
        }
        public virtual T GetSingle(Expression<Func<T, bool>> filter)
        {
            return CurrentDbSet.Single(filter);
        }
        public virtual IEnumerable<T> Get(Expression<Func<T, bool>> filter)
        {
            if (filter == null) return GetAll();
            return CurrentDbSet.Where(filter);
        }
        public virtual IEnumerable<T> Get(Expression<Func<T, bool>> filter, Pagination pagination)
        {
            pagination.RecordCount = Count(filter);
            var pagin = pagination as Pagination<T>;
            IEnumerable<T> result;
            if (filter != null)
            {
                result = CurrentDbSet.Where(filter);
            }
            else
            {
                result = CurrentDbSet;
            }

            if (pagin != null && (pagin.OrderBy != null || pagin.OrderByDescending != null))
            {
                if (pagin.OrderBy != null)
                {
                    result = result.OrderBy(pagin.OrderBy);
                }
                else
                {
                    result = result.OrderByDescending(pagin.OrderByDescending);
                }
            }
            return result.Skip(pagination.PageIndex * pagination.PageSize).Take(pagin.PageSize);
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
            if (editor != null && ApplicationContext.CurrentUser != null)
            {
                editor.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                editor.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
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
                if (editor != null && ApplicationContext.CurrentUser != null)
                {
                    editor.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                    editor.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
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