/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Event;
using ZKEACMS.Page;

namespace ZKEACMS.Common.Service
{
    public sealed class UpdateNavOnPageUrlChangeEventHandler : IEventHandler
    {
        private readonly INavigationService _navigationService;

        public UpdateNavOnPageUrlChangeEventHandler(INavigationService navigationService)
        {
            _navigationService = navigationService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null && e.Data != null)
            {
                string oldPageUrl = e.Data.ToString();
                var navs = _navigationService.Get(m => m.Url == oldPageUrl || m.Url.StartsWith(oldPageUrl + "/"));
                foreach (var item in navs)
                {
                    item.Url = page.Url + item.Url.Substring(oldPageUrl.Length);
                }
                _navigationService.UpdateRange(navs.ToArray());
            }
        }
    }
}
