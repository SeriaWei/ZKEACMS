using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Account;

namespace ZKEACMS.Shop
{
    public class ShopCenterLinksProvider : IUserCenterLinksProvider
    {
        public IEnumerable<AdminMenu> GetLinks()
        {
            yield return new AdminMenu
            {
                PluginName = PluginBase.GetName<ShopPlug>(),
                Order = 1,
                Title = "我的订单",
                Url = "~/myorder"
            };
        }
    }
}
