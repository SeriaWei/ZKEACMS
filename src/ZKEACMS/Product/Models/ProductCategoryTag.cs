/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ZKEACMS.Product.Models
{
    [DataTable("ProductCategoryTag")]
    public class ProductCategoryTag : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public int ProductCategoryId { get; set; }
        public int ParentId { get; set; }
        [NotMapped]
        public bool Selected { get; set; }
    }
}
