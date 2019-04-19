/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Shop.Models
{
    [DataTable("Basket")]
    public class Basket : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string UserId { get; set; }
        public string ImageUrl { get; set; }
        public int Quantity { get; set; }
        [Column(TypeName = "decimal(18,4)")]
        public decimal Price { get; set; }
        public int ProductId { get; set; }
        public string PromoCode { get; set; }

        public OrderItem ToOrderItem(string orderid)
        {
            return new OrderItem
            {
                UserId = UserId,
                ImageUrl = ImageUrl,
                Quantity = Quantity,
                Price = Price,
                ProductId = ProductId,
                PromoCode = PromoCode,
                OrderId = orderid,
                Title = Title,
                Description = Description
            };
        }
    }
    class BasketMetaData : ViewMetaData<Basket>
    {
        protected override void ViewConfigure()
        {

        }
    }
}
