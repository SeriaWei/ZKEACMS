/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Zip;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;

namespace ZKEACMS.Widget
{
    public abstract class WidgetService<T> : ServiceBase<T>, IWidgetPartDriver where T : WidgetBase
    {
        public WidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            WidgetBasePartService = widgetBasePartService;
        }

        public IWidgetBasePartService WidgetBasePartService { get; private set; }
        public bool IsNeedNotifyChange
        {
            get { return WidgetBasePartService.IsNeedNotifyChange; }
            set { WidgetBasePartService.IsNeedNotifyChange = value; }
        }
        public override ServiceResult<T> Add(T item)
        {
            ServiceResult<T> result = null;
            BeginTransaction(() =>
            {
                var id = Guid.NewGuid().ToString("N");
                var basePart = item.ToWidgetBasePart();
                basePart.ID = id;
                WidgetBasePartService.Add(basePart);
                try
                {
                    item.ID = basePart.ID;
                    result = base.Add(item);
                }
                catch (Exception ex)
                {
                    WidgetBasePartService.Remove(item.ID);
                    throw ex;
                }
            });
            return result;
        }

        public override ServiceResult<T> Update(T item)
        {
            ServiceResult<T> result = null;
            BeginTransaction(() =>
            {
                var basePart = WidgetBasePartService.Get(item.ID);
                item.CopyTo(basePart);
                WidgetBasePartService.Update(basePart);
                result = base.Update(item);
            });
            return result;
        }
        public override ServiceResult<T> UpdateRange(params T[] items)
        {
            var ids = items.Select(m => m.ID).ToArray();
            var baseParts = WidgetBasePartService.Get(m => ids.Contains(m.ID));
            foreach (var item in items)
            {
                item.CopyTo(baseParts.FirstOrDefault(m => m.ID == item.ID));
            }
            ServiceResult<T> result = null;
            BeginTransaction(() =>
            {
                WidgetBasePartService.UpdateRange(baseParts.ToArray());
                result = base.UpdateRange(items);
            });
            return result;
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
            T result = base.Get(widget.ID);
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

        public virtual WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            return widget.ToWidgetViewModelPart();
        }

        #region PartDrive
        public virtual void AddWidget(WidgetBase widget)
        {
            Add((T)widget);
        }


        public virtual void DeleteWidget(string widgetId)
        {
            Remove(widgetId);
        }

        public virtual void UpdateWidget(WidgetBase widget)
        {
            Update((T)widget);
        }
        #endregion

        public virtual void Publish(WidgetBase widget)
        {
            widget.IsTemplate = false;
            widget.IsSystem = false;
            AddWidget(widget);
        }

        #region PackWidget
        public virtual WidgetPackage PackWidget(WidgetBase widget)
        {
            widget = GetWidget(widget);
            widget.PageID = null;
            widget.LayoutID = null;
            widget.ZoneID = null;
            widget.IsSystem = false;
            widget.IsTemplate = true;
            return new WidgetPackageInstaller(ApplicationContext.HostingEnvironment).Pack(widget) as WidgetPackage;
        }

        public virtual void InstallWidget(WidgetPackage pack)
        {
            var widget = new WidgetPackageInstaller(ApplicationContext.HostingEnvironment).Install(pack);
            if (widget != null)
            {
                (widget as WidgetBase).Description = "安装";
                AddWidget(widget as WidgetBase);
            }

        }
        #endregion
    }
}
