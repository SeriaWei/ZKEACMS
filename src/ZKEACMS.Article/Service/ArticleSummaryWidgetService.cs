/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using ZKEACMS.Article.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Service
{
    public class ArticleSummaryWidgetService : WidgetService<ArticleSummaryWidget>
    {
        public ArticleSummaryWidgetService(IWidgetService widgetService, IApplicationContext applicationContext) 
            : base(widgetService, applicationContext)
        {
        }
    }
}