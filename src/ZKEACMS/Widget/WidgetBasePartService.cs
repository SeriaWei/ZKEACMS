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
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Widget
{

    public class WidgetBasePartService : ServiceBase<WidgetBasePart, CMSDbContext>, IWidgetBasePartService
    {
        protected const string EncryptWidgetTemplate = "EncryptWidgetTemplate";
        private readonly IWidgetActivator _widgetActivator;
        private readonly IServiceProvider _serviceProvider;
        public WidgetBasePartService(IEncryptService encryptService, IDataArchivedService dataArchivedService, 
            IApplicationContext applicationContext, IWidgetActivator widgetActivator, IServiceProvider serviceProvider)
            : base(applicationContext)
        {
            EncryptService = encryptService;
            DataArchivedService = dataArchivedService;
            _widgetActivator = widgetActivator;
            _serviceProvider = serviceProvider;
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
                using (var pageService = _serviceProvider.GetService<IPageService>())
                {
                    pageService.MarkChanged(widget.PageID);
                }
            }
            else if (widget != null && widget.LayoutID.IsNotNullAndWhiteSpace())
            {
                using (var layoutService = _serviceProvider.GetService<ILayoutService>())
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
            return Get(m => m.PageID == pageId).ToList();
        }

        public IEnumerable<WidgetBase> GetAllByPage(PageEntity page)
        {
            Func<PageEntity, List<WidgetBase>> getPageWidgets = p =>
            {
                var result = GetByLayoutId(p.LayoutId);
                List<WidgetBase> widgets = result.ToList();
                widgets.AddRange(GetByPageId(p.ID));
                return widgets.Select(widget => _widgetActivator.Create(widget)?.GetWidget(widget)).ToList();
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


        public WidgetViewModelPart ApplyTemplate(WidgetBase widget, ActionContext actionContext)
        {
            var widgetBasePart = Get(widget.ID);
            if (widgetBasePart == null) return null;
            if (widgetBasePart.ExtendFields != null)
            {
                widgetBasePart.ExtendFields.Each(f => { f.ActionType = ActionType.Create; });
            }
            var service = _widgetActivator.Create(widgetBasePart);
            var widgetBase = service.GetWidget(widgetBasePart.ToWidgetBase());

            widgetBase.PageID = widget.PageID;
            widgetBase.ZoneID = widget.ZoneID;
            widgetBase.Position = widget.Position;
            widgetBase.LayoutID = widget.LayoutID;
            widgetBase.IsTemplate = false;
            widgetBase.Thumbnail = null;

            var widgetPart = service.Display(widgetBase, actionContext);
            service.AddWidget(widgetBase);
            return widgetPart;
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
