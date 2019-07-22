/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZKEACMS.Common.Models;

namespace ZKEACMS.Common.ViewModels
{
    public class NavigationViewModel
    {
        private readonly IEnumerable<NavigationEntity> _navs;

        public NavigationViewModel(IEnumerable<NavigationEntity> navs, NavigationEntity nav)
        {
            _navs = navs;
            Current = nav;
        }
        public NavigationEntity Current { get; set; }
        public IEnumerable<NavigationViewModel> Children
        {
            get
            {
                foreach (var item in _navs.Where(m => m.ParentId == Current.ID))
                {
                    yield return new NavigationViewModel(_navs, item);
                }
            }
        }
    }
}
