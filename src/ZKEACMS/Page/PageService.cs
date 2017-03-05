/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using ZKEACMS.DataArchived;
using ZKEACMS.ExtendField;
using ZKEACMS.Widget;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Page
{
    public class PageService : ServiceBase<PageEntity, CMSDbContext>, IPageService
    {
        private readonly IWidgetBasePartService _widgetService;
        private readonly IDataArchivedService _dataArchivedService;



        public PageService(IWidgetBasePartService widgetService, IDataArchivedService dataArchivedService, IApplicationContext applicationContext)
            : base(applicationContext)
        {
            _widgetService = widgetService;
            _dataArchivedService = dataArchivedService;
        }
        public override DbSet<PageEntity> CurrentDbSet
        {
            get
            {
                return DbContext.Page;
            }
        }
        public override void Add(PageEntity item)
        {
            if (!item.IsPublishedPage && Count(m => m.Url == item.Url && m.IsPublishedPage == false) > 0)
            {
                throw new PageExistException(item);
            }
            item.ID = Guid.NewGuid().ToString("N");
            if (item.ParentId.IsNullOrEmpty())
            {
                item.ParentId = "#";
            }
            base.Add(item);
        }

        public override void Update(PageEntity item)
        {
            if (Count(m => m.ID != item.ID && m.Url == item.Url && m.IsPublishedPage == false) > 0)
            {
                throw new PageExistException(item);
            }
            item.IsPublish = false;
            base.Update(item);
        }

        public void Publish(PageEntity item)
        {
            item = Get(item.ID);
            item.IsPublish = true;
            item.PublishDate = DateTime.Now;
            base.Update(item);

            //Remove(m => m.ReferencePageID == item.ID && m.IsPublishedPage == true);

            _dataArchivedService.Remove(CacheTrigger.PageWidgetsArchivedKey.FormatWith(item.ID));

            item.ReferencePageID = item.ID;
            item.IsPublishedPage = true;
            item.PublishDate = DateTime.Now;
            if (item.ExtendFields != null)
            {
                item.ExtendFields.Each(m => m.ActionType = ActionType.Create);
            }
            var widgets = _widgetService.GetByPageId(item.ID);
            Add(item);
            widgets.Each(m =>
            {
                using (var widgetService = m.CreateServiceInstance(ApplicationContext.ServiceLocator))
                {
                    m = widgetService.GetWidget(m);
                    if (m.ExtendFields != null)
                    {
                        m.ExtendFields.Each(f => f.ActionType = ActionType.Create);
                    }
                    m.PageID = item.ID;
                    widgetService.Publish(m);
                }
            });
        }
        public void Revert(string ID, bool RetainLatest)
        {
            var page = Get(ID);
            if (page.IsPublishedPage)
            {
                if (RetainLatest)
                {//保留当前编辑版本
                    var refPage = Get(page.ReferencePageID);
                    refPage.IsPublish = false;
                    Update(refPage);

                    page.PublishDate = DateTime.Now;
                    Add(page);
                }
                else
                {
                    var refPage = Get(page.ReferencePageID);
                    refPage.PublishDate = null;
                    Update(refPage);

                    Remove(page.ReferencePageID); //删除当前的编辑版本，加入旧的版本做为编辑版本，再发布
                    page.ID = page.ReferencePageID;
                    page.ReferencePageID = null;
                    page.IsPublish = false;
                    page.IsPublishedPage = false;
                    if (page.ExtendFields != null)
                    {
                        page.ExtendFields.Each(m => m.ActionType = ActionType.Create);
                    }
                    base.Add(page);
                }
                var widgets = _widgetService.GetByPageId(ID);
                widgets.Each(m =>
                {
                    var widgetService = m.CreateServiceInstance(ApplicationContext.ServiceLocator);
                    m = widgetService.GetWidget(m);
                    if (m.ExtendFields != null)
                    {
                        m.ExtendFields.Each(f => f.ActionType = ActionType.Create);
                    }
                    m.PageID = page.ID;
                    widgetService.Publish(m);
                });
                if (!RetainLatest)
                {
                    Publish(page);
                }

            }
        }
        public override void Remove(PageEntity item)
        {
            Remove(m => m.ParentId == item.ID);
            var widgets = _widgetService.Get(m => m.PageID == item.ID);
            widgets.Each(m =>
            {
                using (var widgetService = m.CreateServiceInstance(ApplicationContext.ServiceLocator))
                {
                    widgetService.DeleteWidget(m.ID);
                }
            });
            if (item.PublishDate.HasValue)
            {
                Remove(m => m.ReferencePageID == item.ID);
            }
            _dataArchivedService.Remove(CacheTrigger.PageWidgetsArchivedKey.FormatWith(item.ID));
            base.Remove(item);
        }
        
        public override void Remove(Expression<Func<PageEntity, bool>> filter)
        {
            var deletes = Get(filter).ToList(m => m.ID);
            if (deletes.Any())
            {
                Remove(m => deletes.Any(d => d == m.ParentId));
                Remove(m => deletes.Any(d => d == m.ReferencePageID));

                var widgets = _widgetService.Get(m => deletes.Any(n => n == m.PageID));
                widgets.Each(m =>
                {
                    using (var widgetService = m.CreateServiceInstance(ApplicationContext.ServiceLocator))
                    {
                        widgetService.DeleteWidget(m.ID);
                    }
                });

                deletes.Each(p => _dataArchivedService.Remove(CacheTrigger.PageWidgetsArchivedKey.FormatWith(p)));

                base.Remove(filter);
            }

        }
        public override void RemoveRange(params PageEntity[] items)
        {
            items.Each(Remove);
        }

        public void DeleteVersion(string ID)
        {
            PageEntity page = Get(ID);
            if (page != null)
            {
                var widgets = _widgetService.Get(m => m.PageID == page.ID);
                widgets.Each(m => m.CreateServiceInstance(ApplicationContext.ServiceLocator).DeleteWidget(m.ID));
                _dataArchivedService.Remove(CacheTrigger.PageWidgetsArchivedKey.FormatWith(page.ID));
            }
            base.Remove(ID);
        }

        public void Move(string id, int position, int oldPosition)
        {
            var page = Get(id);
            page.DisplayOrder = position;

            if (position > oldPosition)
            {
                var pages = Get(m => !m.IsPublishedPage && m.ParentId == page.ParentId && m.ID != page.ID && m.DisplayOrder <= position && m.DisplayOrder >= oldPosition);
                pages.Each(m =>
                {
                    m.DisplayOrder--;
                    Update(m);
                });
            }
            else
            {
                var pages = Get(m => !m.IsPublishedPage && m.ParentId == page.ParentId && m.ID != page.ID && m.DisplayOrder <= oldPosition && m.DisplayOrder >= position);
                pages.Each(m =>
                {
                    m.DisplayOrder++;
                    Update(m);
                });
            }
            Update(page);
        }
        public PageEntity GetByPath(string path, bool isPreView)
        {
            if (path != "/" && path.EndsWith("/"))
            {
                path = path.Substring(0, path.Length - 1);
            }

            var pages = CurrentDbSet.Where(m => m.IsPublishedPage == !isPreView);
            if (path == "/")
            {
                path = "~/index";
            }
            else
            {
                pages = pages.Where(m => m.Url == (path.StartsWith("~") ? "" : "~") + path);
            }

            pages = pages.OrderByDescending(m => m.PublishDate);
            var result = pages.FirstOrDefault();
            if (result != null && result.ExtendFields != null)
            {
                /* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
                ((List<ExtendFieldEntity>)result.ExtendFields).Add(new ExtendFieldEntity { Title = "meta_support", Value = "ZKEASOFT" });
            }
            return result;

        }

        public void MarkChanged(string pageId)
        {
            var pageEntity = Get(pageId);
            pageEntity.IsPublish = false;
            pageEntity.LastUpdateDate = DateTime.Now;
            pageEntity.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
            base.Update(pageEntity);
        }
    }
}
