using Easy;
using Easy.Constant;
using Easy.Encrypt;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Zip;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.DataArchived;
using ZKEACMS.Page;
using Microsoft.Extensions.DependencyInjection;
using ZKEACMS.Layout;

namespace ZKEACMS.Widget
{

    public class WidgetBasePartService : ServiceBase<WidgetBasePart, CMSDbContext>, IWidgetBasePartService
    {
        protected const string EncryptWidgetTemplate = "EncryptWidgetTemplate";
        public WidgetBasePartService(IEncryptService encryptService, IDataArchivedService dataArchivedService, IApplicationContext applicationContext)
            : base(applicationContext)
        {
            EncryptService = encryptService;
            DataArchivedService = dataArchivedService;
        }
        public override DbSet<WidgetBasePart> CurrentDbSet
        {
            get
            {
                return DbContext.WidgetBasePart;
            }
        }
        private void TriggerChange(WidgetBase widget)
        {
            if (widget != null && widget.PageID.IsNotNullAndWhiteSpace())
            {
                using (var pageService = ApplicationContext.ServiceLocator.GetService<IPageService>())
                {
                    pageService.SetDbContext(DbContext);
                    pageService.MarkChanged(widget.PageID);
                }
            }
            else if (widget != null && widget.LayoutID.IsNotNullAndWhiteSpace())
            {
                using (var layoutService = ApplicationContext.ServiceLocator.GetService<ILayoutService>())
                {
                    layoutService.SetDbContext(DbContext);
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
        public override void Add(WidgetBasePart item)
        {
            base.Add(item);
            TriggerChange(item);
        }
        public override void Update(WidgetBasePart item)
        {
            TriggerChange(item);
            base.Update(item);
        }
        public override void UpdateRange(params WidgetBasePart[] items)
        {
            items.Each(TriggerChange);
            base.UpdateRange(items);
        }
        public override void Remove(Expression<Func<WidgetBasePart, bool>> filter)
        {
            base.Remove(filter);
        }
        public override void Remove(params object[] primaryKey)
        {
            TriggerChange(Get(primaryKey));
            base.Remove(primaryKey);
        }
        public override void Remove(WidgetBasePart item)
        {
            TriggerChange(item);
            base.Remove(item);
        }
        public override void RemoveRange(params WidgetBasePart[] items)
        {
            items.Each(TriggerChange);
            base.RemoveRange(items);
        }


        public WidgetViewModelPart ApplyTemplate(WidgetBase widget, HttpContext httpContext)
        {
            var widgetBasePart = Get(widget.ID);
            if (widgetBasePart == null) return null;
            if (widgetBasePart.ExtendFields != null)
            {
                widgetBasePart.ExtendFields.Each(f => { f.ActionType = ActionType.Create; });
            }
            var service = widgetBasePart.CreateServiceInstance(httpContext.RequestServices);
            var widgetBase = service.GetWidget(widgetBasePart.ToWidgetBase());

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
}
