/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;

namespace ZKEACMS.Shop.ViewModel
{
    public class OrderListViewModel
    {
        public IList<Order> Orders { get; set; }
        public Pagin Pagin { get; set; }
    }
}
