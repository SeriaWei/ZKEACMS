/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Service;
using ZKEACMS.Extend;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Models
{
    public class ArticleGalleryWidget : SimpleWidgetBase
    {
        public string DetailPageUrl { get; set; }
        public int ArticleGalleryId { get; set; }
    }
    class ArticleGalleryWidgetMetaData : WidgetMetaData<ArticleGalleryWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();

            ViewConfig(m => m.DetailPageUrl).AsTextBox().Order(NextOrder()).PageSelector();

            ViewConfig(m => m.ArticleGalleryId).AsDropDownList()
                .Order(NextOrder())
                .Required()
                .DataSource(() =>
            {
                return ServiceLocator.GetService<IArticleGalleryService>().Get(m => m.Status == (int)RecordStatus.Active).ToDictionary(m => m.ID.ToString(), m => m.Title);
            });
        }
    }

}
