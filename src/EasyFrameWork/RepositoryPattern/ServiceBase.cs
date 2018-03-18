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

namespace Easy.RepositoryPattern
{
    public abstract class ServiceBase<T> : IService<T>
        where T : class
    {
        public ServiceBase(IApplicationContext applicationContext, DbContext dbContext)
        {
            ApplicationContext = applicationContext;
            DbContext = dbContext;
            isWaitingSave = false;
        }

        public virtual DbContext DbContext
        {
            get;
            set;
        }
        public abstract DbSet<T> CurrentDbSet { get; }

        public IApplicationContext ApplicationContext { get; set; }

        private bool isWaitingSave;

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
        protected ServiceResult<T> Validate(T item)
        {
            ServiceResult<T> serviceResult = new ServiceResult<T>();
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
                                    serviceResult.RuleViolations.Add(new RuleViolation(p.Name, v.ErrorMessage));
                                }
                            });
                        }
                    }

                });
            }
            serviceResult.Result = item;
            return serviceResult;
        }
        public virtual ServiceResult<T> Add(T item)
        {
            var result = Validate(item);
            if (result.HasViolation)
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
            if (!isWaitingSave)
            {
                SaveChanges();
            }
            return result;
        }
        public virtual ServiceResult<T> AddRange(params T[] items)
        {
            ServiceResult<T> result = new ServiceResult<T>();
            foreach (var item in items)
            {
                var itemResult = Validate(item);
                if (itemResult.HasViolation)
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
            if (!isWaitingSave)
            {
                SaveChanges();
            }
            return result;
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
        public virtual ServiceResult<T> Update(T item)
        {
            var result = Validate(item);
            if (result.HasViolation)
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
            if (!isWaitingSave)
            {
                SaveChanges();
            }
            return result;
        }
        public virtual ServiceResult<T> UpdateRange(params T[] items)
        {
            foreach (var item in items)
            {
                var itemResult = Validate(item);
                if (itemResult.HasViolation)
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
            if (!isWaitingSave)
            {
                SaveChanges();
            }
            return new ServiceResult<T>();
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
            if (!isWaitingSave)
            {
                SaveChanges();
            }
        }
        public virtual void Remove(Expression<Func<T, bool>> filter)
        {
            CurrentDbSet.RemoveRange(CurrentDbSet.Where(filter));
            if (!isWaitingSave)
            {
                SaveChanges();
            }
        }
        public virtual void RemoveRange(params T[] items)
        {
            CurrentDbSet.RemoveRange(items);
            if (!isWaitingSave)
            {
                SaveChanges();
            }
        }
        public virtual void Dispose()
        {
            //DbContext.Dispose();
        }

        public virtual void SaveChanges()
        {
            DbContext.SaveChanges();
            isWaitingSave = false;
        }

        public virtual void BeginBulkSave()
        {
            isWaitingSave = true;
        }
    }
}