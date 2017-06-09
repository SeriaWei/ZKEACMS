/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.Linq;
using Easy;
using Easy.Extend;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;
using ZKEACMS.Page;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Common.Service
{
    public class BreadcrumbWidgetService : SimpleWidgetService<BreadcrumbWidget>
    {
        private readonly IPageService _pageService;

        public BreadcrumbWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, IPageService pageService) : base(widgetBasePartService, applicationContext)
        {
            _pageService = pageService;
        }


        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {

            List<PageEntity> ParentPages = new List<PageEntity>();
            GetParentPage(ParentPages, actionContext.HttpContext.GetLayout().Page);

            return widget.ToWidgetViewModelPart(ParentPages);
        }

        void GetParentPage(List<PageEntity> parentPages, PageEntity page)
        {
            parentPages.Insert(0, page);
            if (page.ParentId.IsNotNullAndWhiteSpace() && page.ParentId != "#")
            {
                var parentPage = _pageService.Get(m => m.ID == page.ParentId).FirstOrDefault();
                if (parentPage != null)
                {
                    GetParentPage(parentPages, parentPage);
                }
            }
        }
    }
}