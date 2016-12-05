/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Cache;
using Easy.Constant;
using Easy.Encrypt;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Zip;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using ZKEACMS.DataArchived;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.Widget
{
    public class WidgetService : ServiceBase<WidgetBase>, IWidgetService
    {
        protected const string EncryptWidgetTemplate = "EncryptWidgetTemplate";
        public WidgetService(IEncryptService encryptService, IDataArchivedService dataArchivedService, IApplicationContext applicationContext)
            : base(applicationContext)
        {
            EncryptService = encryptService;
            DataArchivedService = dataArchivedService;
        }
        private void TriggerChange(WidgetBase widget)
        {
            if (widget != null && widget.PageID.IsNotNullAndWhiteSpace())
            {
                using (var pageService = ApplicationContext.ServiceLocator.GetService<IPageService>())
                {
                    pageService.MarkChanged(widget.PageID);
                }
            }
            else if (widget != null && widget.LayoutID.IsNotNullAndWhiteSpace())
            {
                using (var layoutService = ApplicationContext.ServiceLocator.GetService<ILayoutService>())
                {
                    layoutService.MarkChanged(widget.LayoutID);
                }
            }
        }


        public IEncryptService EncryptService { get; set; }

        public IDataArchivedService DataArchivedService { get; set; }
        public IEnumerable<WidgetBase> GetByLayoutId(string layoutId)
        {
            return Get(m => m.LayoutID == layoutId);
        }
        public IEnumerable<WidgetBase> GetByPageId(string pageId)
        {
            return Get(m => m.PageID == pageId);
        }
        public IEnumerable<WidgetBase> GetAllByPageId(IServiceProvider serviceProvider, string pageId)
        {
            using (var pageService = ApplicationContext.ServiceLocator.GetService<IPageService>())
            {
                return GetAllByPage(serviceProvider, pageService.Get(pageId));
            }

        }

        public IEnumerable<WidgetBase> GetAllByPage(IServiceProvider serviceProvider, PageEntity page)
        {
            Func<PageEntity, List<WidgetBase>> getPageWidgets = p =>
            {
                var result = GetByLayoutId(p.LayoutId);
                List<WidgetBase> widgets = result.ToList();
                widgets.AddRange(GetByPageId(p.ID));
                return widgets.Select(widget => widget.CreateServiceInstance(serviceProvider)?.GetWidget(widget)).ToList();
            };
            //if (page.IsPublishedPage)
            //{
            //    return DataArchivedService.Get(CacheTrigger.PageWidgetsArchivedKey.FormatWith(page.ReferencePageID), () => getPageWidgets(page));
            //}
            return getPageWidgets(page).Where(m => m != null);
        }
        public override void Add(WidgetBase item)
        {
            base.Add(item);
            TriggerChange(item);
        }
        public override void Update(WidgetBase item)
        {
            TriggerChange(item);
            base.Update(item);
        }
        public override void UpdateRange(params WidgetBase[] items)
        {
            items.Each(TriggerChange);
            base.UpdateRange(items);
        }
        public override void Remove(Expression<Func<WidgetBase, bool>> filter)
        {
            base.Remove(filter);
        }
        public override void Remove(params object[] primaryKey)
        {
            TriggerChange(Get(primaryKey));
            base.Remove(primaryKey);
        }
        public override void Remove(WidgetBase item)
        {
            TriggerChange(item);
            base.Remove(item);
        }
        public override void RemoveRange(params WidgetBase[] items)
        {
            items.Each(TriggerChange);
            base.RemoveRange(items);
        }


        public WidgetPart ApplyTemplate(WidgetBase widget, HttpContext httpContext)
        {
            var widgetBase = Get(widget.ID);
            if (widgetBase == null) return null;
            if (widgetBase.ExtendFields != null)
            {
                widgetBase.ExtendFields.Each(f => { f.ActionType = ActionType.Create; });
            }
            var service = widgetBase.CreateServiceInstance(httpContext.RequestServices);
            widgetBase = service.GetWidget(widgetBase);

            widgetBase.PageID = widget.PageID;
            widgetBase.ZoneID = widget.ZoneID;
            widgetBase.Position = widget.Position;
            widgetBase.LayoutID = widget.LayoutID;
            widgetBase.IsTemplate = false;
            widgetBase.Thumbnail = null;

            var widgetPart = service.Display(widgetBase, httpContext);
            service.AddWidget(widgetBase);
            return widgetPart;
        }

        public MemoryStream PackWidget(string widgetId, HttpContext httpContext)
        {
            var widgetBase = Get(widgetId);
            var zipfile = widgetBase.CreateServiceInstance(httpContext.RequestServices).PackWidget(widgetBase);
            var bytes = Encrypt(zipfile.ToMemoryStream().ToArray());
            return new MemoryStream(bytes);
        }

        public WidgetBase InstallPackWidget(Stream stream, HttpContext httpContext)
        {
            byte[] bytes = new byte[stream.Length];
            stream.Read(bytes, 0, bytes.Length);
            stream.Seek(0, SeekOrigin.Begin);

            ZipFile zipFile = new ZipFile();

            var files = zipFile.ToFileCollection(new MemoryStream(Decrypt(bytes)));
            foreach (ZipFileInfo item in files)
            {
                if (item.RelativePath.EndsWith("-widget.json"))
                {
                    try
                    {
                        var jsonStr = Encoding.UTF8.GetString(item.FileBytes);
                        var widgetBase = JsonConvert.DeserializeObject<WidgetBase>(jsonStr);
                        var service = widgetBase.CreateServiceInstance(httpContext.RequestServices);
                        var widget = service.UnPackWidget(files);
                        widget.PageID = null;
                        widget.LayoutID = null;
                        widget.ZoneID = null;
                        widget.IsSystem = false;
                        widget.IsTemplate = true;
                        service.AddWidget(widget);
                    }
                    catch (Exception ex)
                    {
                        Logger.Error(ex);
                        return null;
                    }
                }
            }
            return null;
        }

        private byte[] Encrypt(byte[] source)
        {
            if (Easy.Builder.Configuration[EncryptWidgetTemplate] == "true")
            {
                return EncryptService.Encrypt(source);
            }
            return source;
        }

        private byte[] Decrypt(byte[] source)
        {
            return EncryptService.Decrypt(source);
        }
    }
    public abstract class WidgetService<T> : ServiceBase<T>, IWidgetPartDriver where T : WidgetBase
    {
        protected const string TempFolder = "~/Temp";
        protected const string TempJsonFile = "~/Temp/{0}-widget.json";
        private IWidgetService widgetService;

        public WidgetService(IWidgetService widgetService, IApplicationContext applicationContext)
            : base(applicationContext)
        {
            WidgetBaseService = widgetService;
        }

        public IWidgetService WidgetBaseService { get; private set; }

        private void CopyTo(WidgetBase from, T to)
        {
            if (to != null)
            {
                to.AssemblyName = from.AssemblyName;
                to.CreateBy = from.CreateBy;
                to.CreatebyName = from.CreatebyName;
                to.CreateDate = from.CreateDate;
                to.Description = from.Description;
                to.ID = from.ID;
                to.LastUpdateBy = from.LastUpdateBy;
                to.LastUpdateByName = from.LastUpdateByName;
                to.LastUpdateDate = from.LastUpdateDate;
                to.LayoutID = from.LayoutID;
                to.PageID = from.PageID;
                to.PartialView = from.PartialView;
                to.Position = from.Position;
                to.ServiceTypeName = from.ServiceTypeName;
                to.Status = from.Status;
                to.Title = from.Title;
                to.ViewModelTypeName = from.ViewModelTypeName;
                to.WidgetName = from.WidgetName;
                to.ZoneID = from.ZoneID;
                to.FormView = from.FormView;
                to.StyleClass = from.StyleClass;
                to.IsTemplate = from.IsTemplate;
                to.Thumbnail = from.Thumbnail;
                to.IsSystem = from.IsSystem;
                to.ExtendFields = from.ExtendFields;
            }
        }

        public override void Add(T item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            WidgetBaseService.Add(item.ToWidgetBase());
            if (typeof(T) != typeof(WidgetBase))
            {
                base.Add(item);
            }
        }
        public override void Update(T item)
        {
            WidgetBaseService.Update(item.ToWidgetBase());
            if (typeof(T) != typeof(WidgetBase))
            {
                base.Update(item);
            }
            Signal.Trigger(CacheTrigger.WidgetChanged);
        }
        public override void UpdateRange(params T[] items)
        {
            WidgetBaseService.UpdateRange(items.Select(m => m.ToWidgetBase()).ToArray());
            if (typeof(T) != typeof(WidgetBase))
            {
                base.UpdateRange(items);
            }
            Signal.Trigger(CacheTrigger.WidgetChanged);
        }
        public override T GetSingle(Expression<Func<T, bool>> filter)
        {
            T model = base.GetSingle(filter);
            if (typeof(T) != typeof(WidgetBase))
            {
                CopyTo(WidgetBaseService.Get(model.ID), model);
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
                    CopyTo(WidgetBaseService.Get(widget.ID), widget);
                });
            }
            return widgets;
        }
        public override T Get(params object[] primaryKeys)
        {
            T model = base.Get(primaryKeys);
            if (typeof(T) != typeof(WidgetBase))
            {
                CopyTo(WidgetBaseService.Get(primaryKeys), model);
            }
            return model;
        }

        public override void Remove(Expression<Func<T, bool>> filter)
        {
            if (typeof(T) != typeof(WidgetBase))
            {
                base.Remove(filter);
            }
            WidgetBaseService.Remove(Expression.Lambda<Func<WidgetBase, bool>>(filter.Body, filter.Parameters));
        }
        public override void Remove(params object[] primaryKey)
        {
            if (typeof(T) != typeof(WidgetBase))
            {
                base.Remove(primaryKey);
            }
            WidgetBaseService.Remove(primaryKey);
        }
        public override void Remove(T item)
        {
            if (typeof(T) != typeof(WidgetBase))
            {
                base.Remove(item);
            }
            WidgetBaseService.Remove(item.ToWidgetBase());
        }
        public override void RemoveRange(params T[] items)
        {
            if (typeof(T) != typeof(WidgetBase))
            {
                base.RemoveRange(items);
            }
            WidgetBaseService.RemoveRange(items.Select(m => m.ToWidgetBase()).ToArray());
        }


        public virtual WidgetBase GetWidget(WidgetBase widget)
        {
            T result = base.Get(widget.ID);
            CopyTo(widget, result);
            return result;
        }

        public virtual WidgetPart Display(WidgetBase widget, HttpContext httpContext)
        {
            return widget.ToWidgetPart();
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
