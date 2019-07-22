/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.Sitemap.Models
{
    [DataTable("ProductListWidget")]
    public class ProductListWidget
    {
        [Key]
        public string ID { get; set; }
        public bool IsPageable { get; set; }
        public int ProductCategoryID { get; set; }
        public string DetailPageUrl { get; set; }
        public string Columns { get; set; }
        public int? PageSize { get; set; }
    }    
}