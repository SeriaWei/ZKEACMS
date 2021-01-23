/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Article.Models
{
    public class ArticleItem
    {
        public string Title { get; set; }
        public int ArticleID { get; set; }
    }
    class ArticleGalleryProductMetaData : ViewMetaData<ArticleItem>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ArticleID).AsHidden().Required();
            ViewConfig(m => m.Title).AsTextBox().Required();
        }
    }
}
