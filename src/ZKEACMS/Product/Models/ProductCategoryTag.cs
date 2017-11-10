using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ZKEACMS.Product.Models
{
    [Table("ProductCategoryTag")]
    public class ProductCategoryTag : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public int ProductCategoryId { get; set; }
        public int ParentId { get; set; }
    }
}
