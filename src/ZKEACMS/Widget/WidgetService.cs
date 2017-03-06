/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Cache;
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

namespace ZKEACMS.Widget
{
    public abstract class WidgetService<T, TDB> : ServiceBase<T, TDB>, IWidgetPartDriver where T : WidgetBase where TDB : CMSDbContext, new()
    {
        protected const string TempFolder = "~/Temp";
        protected const string TempJsonFile = "~/Temp/{0}-widget.json";

        public WidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext)
            : base(applicationContext)
        {
            WidgetBasePartService = widgetBasePartService;
        }

        public IWidgetBasePartService WidgetBasePartService { get; private set; }


        public override void Add(T item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            WidgetBasePartService.Add(item.ToWidgetBasePart());
            try
            {
                base.Add(item);
            }
            catch (Exception ex)
            {
                WidgetBasePartService.Remove(item.ID);
                throw ex;
            }

            Signal.Trigger(CacheTrigger.WidgetChanged);
        }

        public override void Update(T item)
        {

            WidgetBasePartService.Update(item.ToWidgetBasePart());

            base.Update(item);


            Signal.Trigger(CacheTrigger.WidgetChanged);

        }
        public override void UpdateRange(params T[] items)
        {

            WidgetBasePartService.UpdateRange(items.Select(m => m.ToWidgetBasePart()).ToArray());

            base.UpdateRange(items);
            Signal.Trigger(CacheTrigger.WidgetChanged);
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
        public override IEnumerable<T> Get(Expression<Func<T, bool>> filter)
        {
            var widgets = base.Get(filter)?.ToList();

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
            else
            {
                var basePart = new WidgetBasePart { ID = primaryKeys[0].ToString() };
                DbContext.WidgetBasePart.Attach(basePart);
                DbContext.WidgetBasePart.Remove(basePart);
                DbContext.SaveChanges();
            }
            return model;
        }

        public override void Remove(Expression<Func<T, bool>> filter)
        {
            base.Remove(filter);

            WidgetBasePartService.Remove(Expression.Lambda<Func<WidgetBase, bool>>(filter.Body, filter.Parameters));

        }
        
        public override void Remove(T item)
        {

            base.Remove(item);

            WidgetBasePartService.Remove(WidgetBasePartService.Get(item.ID));

        }
        public override void RemoveRange(params T[] items)
        {

            base.RemoveRange(items);

            WidgetBasePartService.RemoveRange(items.Select(m => m.ToWidgetBasePart()).ToArray());

        }


        public virtual WidgetBase GetWidget(WidgetBase widget)
        {
            T result = base.Get(widget.ID);
            if (result != null)
            {
                widget.CopyTo(result);
                return result;
            }
            var basePart = widget.ToWidgetBasePart();
            DbContext.WidgetBasePart.Attach(basePart);
            DbContext.WidgetBasePart.Remove(basePart);
            DbContext.SaveChanges();
            return null;
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
            AddWidget(widget);
        }

        #region PackWidget
        public virtual ZipFile PackWidget(WidgetBase widget)
        {
            widget = GetWidget(widget);
            widget.PageID = null;
            widget.LayoutID = null;
            widget.ZoneID = null;
            widget.IsSystem = false;
            widget.IsTemplate = true;
            var jsonResult = JsonConvert.SerializeObject(widget);
            string tempFile = ((CMSApplicationContext)ApplicationContext).MapPath(TempJsonFile.FormatWith(Guid.NewGuid().ToString("N")));
            if (!Directory.Exists(((CMSApplicationContext)ApplicationContext).MapPath(TempFolder)))
            {
                Directory.CreateDirectory(((CMSApplicationContext)ApplicationContext).MapPath(TempFolder));
            }
            File.WriteAllText(tempFile, jsonResult);
            ZipFile file = new ZipFile();
            file.AddFile(new FileInfo(tempFile));
            return file;
        }

        public virtual WidgetBase UnPackWidget(ZipFileInfoCollection pack)
        {
            WidgetBase result = null;
            try
            {
                foreach (ZipFileInfo item in pack)
                {
                    if (item.RelativePath.EndsWith("-widget.json"))
                    {
                        var jsonStr = Encoding.UTF8.GetString(item.FileBytes);
                        var widgetBase = JsonConvert.DeserializeObject<WidgetBase>(jsonStr);
                        var widget = JsonConvert.DeserializeObject(jsonStr, widgetBase.GetViewModelType()) as WidgetBase;
                        result = widget;
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
            return result;
        }
        #endregion
    }
}
