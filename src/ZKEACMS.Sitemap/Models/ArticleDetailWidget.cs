/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.MetaData;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Sitemap.Models
{
    [DataTable("ArticleDetailWidget")]
    public class ArticleDetailWidget : BasicWidget
    {
        public string CustomerClass { get; set; }
    }
}