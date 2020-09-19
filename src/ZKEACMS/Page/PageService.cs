/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Easy;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using ZKEACMS.Event;
using ZKEACMS.Extend;
using ZKEACMS.Layout;
using ZKEACMS.Widget;
using ZKEACMS.Zone;

namespace ZKEACMS.Page
{
    public class PageService : ServiceBase<PageEntity, CMSDbContext>, IPageService
    {
        private readonly IWidgetBasePartService _widgetService;
        private readonly IWidgetActivator _widgetActivator;
        private readonly IZoneService _zoneService;
        private readonly ILayoutHtmlService _layoutHtmlService;
        private readonly IEventManager _eventManager;
        private readonly ILocalize _localize;
        private Dictionary<string, IEnumerable<PageEntity>> _cachedPage;
        public PageService(IWidgetBasePartService widgetService,
            IApplicationContext applicationContext,
            IWidgetActivator widgetActivator,
            IZoneService zoneService,
            ILayoutHtmlService layoutHtmlService,
            ILocalize localize,
            CMSDbContext dbContext,
            IEventManager eventManager)
            : base(applicationContext, dbContext)
        {
            _widgetService = widgetService;
            _widgetActivator = widgetActivator;
            _zoneService = zoneService;
            _layoutHtmlService = layoutHtmlService;
            _eventManager = eventManager;
            _localize = localize;
            _cachedPage = new Dictionary<string, IEnumerable<PageEntity>>(StringComparer.OrdinalIgnoreCase);
        }

        private string FormatPath(string path)
        {
            if (path != "/" && path.EndsWith("/"))
            {
                path = path.Substring(0, path.Length - 1);
            }
            if (path == "/")
            {
                path = "~/index";
            }
            else
            {
                path = $"~{path}";
            }
            return path;
        }
        private void InitAssets(PageEntity page)
        {
            if (page != null)
            {
                if (page.Style.IsNotNullAndWhiteSpace())
                {
                    page.Styles.Clear();
                    if (page.Style.StartsWith("["))
                    {
                        foreach (var item in JsonConvert.DeserializeObject<string[]>(page.Style))
                        {
                            page.Styles.Add(new PageAsset { Url = item });
                        }
                    }
                    else
                    {
                        page.Styles.Add(new PageAsset { Url = page.Style });
                    }
                }
                if (page.Script.IsNotNullAndWhiteSpace())
                {
                    page.Scripts.Clear();
                    if (page.Script.StartsWith("["))
                    {
                        foreach (var item in JsonConvert.DeserializeObject<string[]>(page.Script))
                        {
                            page.Scripts.Add(new PageAsset { Url = item });
                        }
                    }
                    else
                    {
                        page.Scripts.Add(new PageAsset { Url = page.Script });
                    }
                }
            }
        }
        private void SerializeAssets(PageEntity page)
        {
            if (page != null)
            {
                page.Style = JsonConvert.SerializeObject(page.Styles.RemoveDeletedItems().Select(m => m.Url));
                page.Script = JsonConvert.SerializeObject(page.Scripts.RemoveDeletedItems().Select(m => m.Url));
            }
        }


        private void PublishAsNew(PageEntity item)
        {
            if (item.ID.IsNullOrWhiteSpace()) throw new Exception("Can not publish page while it is new.");

            item.IsPublishedPage = true;
            item.PublishDate = DateTime.Now;
            var zones = _zoneService.GetByPage(item);
            var layoutHtmls = _layoutHtmlService.GetByPage(item);
            var widgets = _widgetService.GetByPageId(item.ID);
            Add(item);
            zones.Each(m =>
            {
                m.PageId = item.ID;
                _zoneService.Add(m);
            });
            layoutHtmls.Each(m =>
            {
                m.PageId = item.ID;
                _layoutHtmlService.Add(m);
            });
            widgets.Each(m =>
            {
                using (var widgetService = _widgetActivator.Create(m))
                {
                    m = widgetService.GetWidget(m);
                    m.PageID = item.ID;
                    widgetService.Publish(m);
                }
            });
        }

        public override DbSet<PageEntity> CurrentDbSet
        {
            get { return DbContext.Page; }
        }

        public override PageEntity Get(params object[] primaryKey)
        {
            PageEntity page = base.Get(primaryKey);
            InitAssets(page);
            return page;
        }

        public override ServiceResult<PageEntity> Add(PageEntity item)
        {
            if (!item.IsPublishedPage && Count(m => m.Url == item.Url && m.IsPublishedPage == false) > 0)
            {
                throw new PageExistException(_localize);
            }
            _eventManager.Trigger(Events.OnPageAdding, item);
            item.ID = Guid.NewGuid().ToString("N");
            if (item.ParentId.IsNullOrEmpty())
            {
                item.ParentId = "#";
            }
            var result = base.Add(item);
            if (!result.HasViolation)
            {
                _eventManager.Trigger(Events.OnPageAdded, item);
            }
            return result;
        }

        public override ServiceResult<PageEntity> Update(PageEntity item)
        {
            if (Count(m => m.ID != item.ID && m.Url == item.Url && m.IsPublishedPage == false) > 0)
            {
                throw new PageExistException(_localize);
            }
            _eventManager.Trigger(Events.OnPageUpdating, item);
            item.IsPublish = false;
            SerializeAssets(item);
            var result = base.Update(item);
            if (!result.HasViolation)
            {
                _eventManager.Trigger(Events.OnPageUpdated, item);
            }
            return result;
        }

        public void Publish(PageEntity item)
        {
            _eventManager.Trigger(Events.OnPagePublishing, item);
            string pageId = item.ID;
            BeginTransaction(() =>
            {
                item.IsPublish = true;
                item.PublishDate = DateTime.Now;
                base.Update(item);
                item.ReferencePageID = item.ID;
                PublishAsNew(item);
            });
            
            _eventManager.Trigger(Events.OnPagePublished, item);
        }


        public void Revert(string ID, bool RetainLatest)
        {
            var page = Get(ID);
            BeginTransaction(() =>
            {
                if (page.IsPublishedPage)
                {
                    var refPage = Get(page.ReferencePageID);
                    refPage.IsPublish = false;
                    Update(refPage);
                    page.Description = _localize.Get("Revert from version: {0:g}").FormatWith(page.PublishDate);
                    PublishAsNew(page);
                    if (!RetainLatest)
                    {//清空当前的所有修改

                        _layoutHtmlService.Remove(m => m.PageId == page.ReferencePageID);
                        _zoneService.Remove(m => m.PageId == page.ReferencePageID);
                        _layoutHtmlService.GetByPage(page).Each(m =>
                        {
                            _layoutHtmlService.Add(new LayoutHtml { LayoutId = m.LayoutId, Html = m.Html, PageId = page.ReferencePageID });
                        });
                        _zoneService.GetByPage(page).Each(m =>
                        {
                            m.PageId = page.ReferencePageID;
                            _zoneService.Add(m);
                        });
                        _widgetService.GetByPageId(page.ReferencePageID).Each(m =>
                        {
                            var widgetService = _widgetActivator.Create(m);
                            widgetService.DeleteWidget(m.ID);
                        });
                        _widgetService.GetByPageId(ID).Each(m =>
                        {
                            var widgetService = _widgetActivator.Create(m);
                            m = widgetService.GetWidget(m);
                            m.PageID = page.ReferencePageID;
                            widgetService.Publish(m);
                        });
                    }
                }
            });
            _eventManager.Trigger(Events.OnPagePublished, page);
        }

        public override void Remove(PageEntity item)
        {
            Remove(m => m.ID == item.ID);
        }

        public override void Remove(Expression<Func<PageEntity, bool>> filter)
        {
            BeginTransaction(() =>
            {
                var deletePages = Get(filter).ToList();
                if (deletePages.Any())
                {
                    List<PageEntity> allPages = new List<PageEntity>();
                    foreach (var item in deletePages)
                    {
                        allPages.AddRange(LoadChildren(item));
                    }
                    allPages.AddRange(deletePages);
                    var allPageIds = allPages.Select(n => n.ID).ToArray();
                    allPages.AddRange(Get(m => allPageIds.Contains(m.ReferencePageID)));
                    allPageIds = allPages.Select(n => n.ID).ToArray();
                    var widgets = _widgetService.Get(m => allPageIds.Contains(m.PageID));
                    widgets.Each(m =>
                    {
                        using (var widgetService = _widgetActivator.Create(m))
                        {
                            widgetService.DeleteWidget(m.ID);
                        }
                    });

                    _layoutHtmlService.Remove(m => allPageIds.Contains(m.PageId));
                    _zoneService.Remove(m => allPageIds.Contains(m.PageId));

                    allPages.Each(p => _eventManager.Trigger(Events.OnPageDeleted, p));

                    base.RemoveRange(allPages.ToArray());
                }
            });
        }
        private IEnumerable<PageEntity> LoadChildren(PageEntity page)
        {
            List<PageEntity> result = new List<PageEntity>();
            var children = Get(m => m.ParentId == page.ID).ToList();
            result.AddRange(children);
            if (children.Any())
            {
                foreach (var item in children)
                {
                    result.AddRange(LoadChildren(item));
                }
            }
            return result;
        }

        public override void RemoveRange(params PageEntity[] items)
        {
            var pageIds = items.Select(n => n.ID).ToArray();
            Remove(m => pageIds.Contains(m.ID));
        }

        public void DeleteVersion(string ID)
        {
            PageEntity page = Get(ID);
            BeginTransaction(() =>
            {
                if (page != null)
                {
                    var widgets = _widgetService.GetByPageId(page.ID);
                    widgets.Each(m =>
                    {
                        using (var widgetService = _widgetActivator.Create(m))
                        {
                            widgetService.DeleteWidget(m.ID);
                        }
                    });
                    _layoutHtmlService.Remove(m => m.PageId == ID);
                    _zoneService.Remove(m => m.PageId == ID);
                }
                base.Remove(page);
            });
            _eventManager.Trigger(Events.OnPageDeleted, page);
        }

        public void Move(string id, int position, int oldPosition)
        {
            var page = Get(id);
            page.DisplayOrder = position;

            IEnumerable<PageEntity> pages = CurrentDbSet.AsTracking().Where(m => !m.IsPublishedPage && m.ParentId == page.ParentId && m.ID != page.ID).OrderBy(m => m.DisplayOrder);

            int order = 1;
            for (int i = 0; i < pages.Count(); i++)
            {
                var eleNav = pages.ElementAt(i);
                if (i == position - 1)
                {
                    order++;
                }
                eleNav.DisplayOrder = order;
                order++;
            }

            Update(page);
        }
        public PageEntity GetByPath(string path, bool isPreView)
        {
            string formatedPath = FormatPath(path);
            PageEntity page = null;
            if (_cachedPage.ContainsKey(formatedPath))
            {
                page = _cachedPage[formatedPath].Where(m => m.IsPublishedPage == !isPreView)
                      .OrderByDescending(m => m.PublishDate)
                      .FirstOrDefault();
            }
            else
            {
                page = Get().Where(m => m.Url == formatedPath && m.IsPublishedPage == !isPreView)
                          .OrderByDescending(m => m.PublishDate)
                          .FirstOrDefault();
            }
            InitAssets(page);
            return page;
        }

        public void MarkChanged(string pageId)
        {
            var pageEntity = Get(pageId);
            if (pageEntity != null && !pageEntity.IsPublishedPage)
            {
                pageEntity.IsPublish = false;
                pageEntity.LastUpdateDate = DateTime.Now;
                if (ApplicationContext.CurrentUser != null)
                {
                    pageEntity.LastUpdateBy = ApplicationContext.CurrentUser.UserID;
                    pageEntity.LastUpdateByName = ApplicationContext.CurrentUser.UserName;
                }
                base.Update(pageEntity);
            }
        }

        public bool IsExists(string path)
        {
            string formatedPath = FormatPath(path);
            var pages = Get(m => m.Url == formatedPath);
            if (pages.Any() && !_cachedPage.ContainsKey(path))
            {
                _cachedPage.Add(formatedPath, pages);
            }
            return pages.Any();
        }
    }
}
