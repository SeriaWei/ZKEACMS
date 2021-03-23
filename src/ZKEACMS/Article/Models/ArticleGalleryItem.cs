/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Article.Models
{
    public class ArticleGalleryItem : EditorEntity
    {
        public ArticleItem Article { get; set; }
    }
    class ArticleGalleryItemMetaData : ViewMetaData<ArticleGalleryItem>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.Article).AsArticleSelector();
        }
    }
}
