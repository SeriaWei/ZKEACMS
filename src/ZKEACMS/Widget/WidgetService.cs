/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Zip;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Event;
using ZKEACMS.Page;
using ZKEACMS.PackageManger;

namespace ZKEACMS.Widget
{
    public abstract class WidgetService<T> : ServiceBase<T, CMSDbContext>, IWidgetPartDriver
        where T : WidgetBase
    {
        public WidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            WidgetBasePartService = widgetBasePartService;
        }

        protected IWidgetBasePartService WidgetBasePartService { get; private set; }
        public override IQueryable<T> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }
        public override ServiceResult<T> Add(T item)
        {
            return BeginTransaction(() =>
             {
                 var id = Guid.NewGuid().ToString("N");
                 var basePart = item.ToWidgetBasePart();
                 basePart.ID = id;
                 var baseResult = WidgetBasePartService.Add(basePart);
                 if (baseResult.HasViolation)
                 {
                     ServiceResult<T> result = new ServiceResult<T>();
                     foreach (var item in baseResult.RuleViolations)
                     {
                         result.AddRuleViolation(item.ParameterName, item.ErrorMessage);
                     }
                     return result;
                 }
                 item.ID = basePart.ID;
                 return base.Add(item);
             });
        }

        public override ServiceResult<T> Update(T item)
        {
            return BeginTransaction(() =>
             {
                 var basePart = WidgetBasePartService.Get(item.ID);
                 item.CopyTo(basePart);
                 var baseResult = WidgetBasePartService.Update(basePart);
                 if (baseResult.HasViolation)
                 {
                     ServiceResult<T> result = new ServiceResult<T>();
                     foreach (var item in baseResult.RuleViolations)
                     {
                         result.AddRuleViolation(item.ParameterName, item.ErrorMessage);
                     }
                     return result;
                 }
                 return base.Update(item);
             });
        }
        public override ServiceResult<T> UpdateRange(params T[] items)
        {
            var ids = items.Select(m => m.ID).ToArray();
            var baseParts = WidgetBasePartService.Get(m => ids.Contains(m.ID));
            foreach (var item in items)
            {
                item.CopyTo(baseParts.FirstOrDefault(m => m.ID == item.ID));
            }

            return BeginTransaction(() =>
             {
                 var baseResult = WidgetBasePartService.UpdateRange(baseParts.ToArray());
                 if (baseResult.HasViolation)
                 {
                     ServiceResult<T> result = new ServiceResult<T>();
                     foreach (var item in baseResult.RuleViolations)
                     {
                         result.AddRuleViolation(item.ParameterName, item.ErrorMessage);
                     }
                     return result;
                 }
                 return base.UpdateRange(items);
             });
        }
        public override T GetSingle(Expression<Func<T, bool>> filter)
        {
            T model = base.GetSingle(filter);
            if (typeof(T) != typeof(WidgetBase))
            {
                WidgetBasePartService.Get(model.ID).CopyTo(model);
            }
            return model;
        }

        public override IList<T> Get(Expression<Func<T, bool>> filter)
        {
            var widgets = base.Get(filter);

            if (widgets != null && typeof(T) != typeof(WidgetBase))
            {
                widgets.Each(widget =>
                {
                    WidgetBasePartService.Get(widget.ID).CopyTo(widget);
                });
            }
            return widgets;
        }
        public override T Get(params object[] primaryKeys)
        {
            T model = base.Get(primaryKeys);
            if (model != null)
            {
                WidgetBasePartService.Get(primaryKeys).CopyTo(model);
            }
            if (model == null)
            {
                throw new Exception("Get widget error. Widget ID:" + string.Join(",", primaryKeys));
            }
            return model;
        }

        public override void Remove(Expression<Func<T, bool>> filter)
        {
            BeginTransaction(() =>
            {
                base.Remove(filter);

                WidgetBasePartService.Remove(Expression.Lambda<Func<WidgetBase, bool>>(filter.Body, filter.Parameters));
            });
        }

        public override void Remove(T item)
        {
            BeginTransaction(() =>
            {
                base.Remove(item);

                WidgetBasePartService.Remove(item.ID);
            });
        }
        public override void RemoveRange(params T[] items)
        {
            BeginTransaction(() =>
            {
                base.RemoveRange(items);
                var ids = items.Select(n => n.ID).ToArray();
                var widgets = WidgetBasePartService.Get(m => ids.Contains(m.ID)).ToArray();
                WidgetBasePartService.RemoveRange(widgets);
            });
        }


        public virtual WidgetBase GetWidget(WidgetBase widget)
        {
            T result = Get().FirstOrDefault(m => m.ID == widget.ID);
            if (result != null)
            {
                widget.CopyTo(result);
            }
            if (result == null)
            {
                throw new Exception("Get widget error. Widget ID:" + widget.ID);
            }
            return result;
        }

        /// <summary>
        /// Display the specified widget. Return object will pass into widget template.
        /// </summary>
        /// <returns>The widget view model</returns>
        /// <param name="widgetDisplayContext">WidgetDisplayContext.</param>
        public virtual object Display(WidgetDisplayContext widgetDisplayContext)
        {
            return widgetDisplayContext.Widget;
        }


        #region PartDrive
        public virtual void AddWidget(WidgetBase widget)
        {
            if (widget.PartialView.IsNullOrWhiteSpace())
            {
                throw new Exception("Widget.PartialView must be specified!");
            }
            WidgetBasePartService.EventManager.Trigger(Events.OnWidgetAdding, widget);
            Add((T)widget);
            WidgetBasePartService.EventManager.Trigger(Events.OnWidgetAdded, widget);
        }


        public virtual void DeleteWidget(string widgetId)
        {
            var widget = Get(widgetId);
            if (widget != null)
            {
                WidgetBasePartService.EventManager.Trigger(Events.OnWidgetDeleting, widget);
                Remove(widget);
                WidgetBasePartService.EventManager.Trigger(Events.OnWidgetDeleted, widget);
            }
        }

        public virtual void UpdateWidget(WidgetBase widget)
        {
            if (widget.PartialView.IsNullOrWhiteSpace())
            {
                throw new Exception("Widget.PartialView must be specified!");
            }
            WidgetBasePartService.EventManager.Trigger(Events.OnWidgetUpdating, widget);
            Update((T)widget);
            WidgetBasePartService.EventManager.Trigger(Events.OnWidgetUpdated, widget);
        }
        #endregion

        public virtual void Publish(WidgetBase widget)
        {
            widget.IsTemplate = false;
            widget.IsSystem = false;
            var publishResult = Add((T)widget);
            if (publishResult.HasViolation) throw new Exception(widget.WidgetName + " " + publishResult.ErrorMessage);
        }

        #region PackWidget
        public virtual WidgetPackage PackWidget(WidgetBase widget)
        {
            widget = GetWidget(widget);
            widget.PageId = null;
            widget.LayoutId = null;
            widget.ZoneId = null;
            widget.IsSystem = false;
            widget.IsTemplate = true;
            WidgetPackage package = new WidgetPackage(WidgetPackageInstaller.InstallerName);
            package.Widget = widget;
            AddFileToPackage(package, widget.Thumbnail);
            return package;
        }

        protected virtual void AddFileToPackage(WidgetPackage package, string filePath)
        {
            if (!IsLocalFile(filePath)) return;

            string physicalPath = ApplicationContext.HostingEnvironment.MapPath(filePath);
            System.IO.FileInfo fileInfo = new System.IO.FileInfo(physicalPath);
            if (!fileInfo.Exists) return;

            package.Files.Add(new PackageManger.FileInfo
            {
                FilePath = filePath,
                FileName = fileInfo.Name,
                Content = fileInfo.ReadAllBytes()
            });
        }

        private static bool IsLocalFile(string filePath)
        {
            return filePath.IsNotNullAndWhiteSpace() && (filePath.StartsWith("~/") || filePath.StartsWith("/"));
        }

        public virtual void InstallWidget(WidgetPackage pack)
        {
            var widget = pack.Widget;
            if (widget != null)
            {
                new FilePackageInstaller(ApplicationContext.HostingEnvironment).Install(pack);
                widget.Description = "Install";
                AddWidget(widget);
            }
        }
        #endregion
    }
}
