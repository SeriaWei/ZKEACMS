/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.Sitemap.Models
{
    [DataTable("ArticleListWidget")]
    public class ArticleListWidget
    {
        [Key]
        public string ID { get; set; }
        public int ArticleTypeID { get; set; }
        public string DetailPageUrl { get; set; }
        public bool IsPageable { get; set; }
        public int? PageSize { get; set; }
    }

}