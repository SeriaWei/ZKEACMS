/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ZKEACMS.Product.Models
{
    [DataTable("ProductTag")]
    public class ProductTag
    {
        [Key]
        public int ID { get; set; }
        public int ProductId { get; set; }
        public int TagId { get; set; }
        public string Title { get; set; }
    }
}
