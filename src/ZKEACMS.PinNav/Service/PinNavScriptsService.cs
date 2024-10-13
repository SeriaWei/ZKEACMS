/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Easy;
using ZKEACMS.Event;
using ZKEACMS.Setting;
using Microsoft.AspNetCore.Html;

namespace ZKEACMS.PinNav.Service
{
    public sealed class PinNavScriptsService : IEventHandler
    {
        private readonly IApplicationContextAccessor _applicationContextAccessor;
        private readonly IApplicationSettingService _applicationSettingService;

        public PinNavScriptsService(IApplicationContextAccessor applicationContextAccessor,
            IApplicationSettingService applicationSettingService)
        {
            _applicationContextAccessor = applicationContextAccessor;
            _applicationSettingService = applicationSettingService;
        }

        public void Handle(object entity, EventArg e)
        {
            if (_applicationSettingService.Get("PinNavigation", "true") == "true")
            {
                CMSApplicationContext applicationContext = _applicationContextAccessor.Current;
                HtmlContentBuilder styleBuilder = new HtmlContentBuilder();
                HtmlContentBuilder scriptBuilder = new HtmlContentBuilder();
#if DEBUG
                applicationContext.CurrentPage.StyleSheets.Add(new Page.StyleSheetTag("/Plugins/ZKEACMS.PinNav/Content/pin-nav.css"));
                applicationContext.CurrentPage.FooterScripts.Add(new Page.ScriptTag("/Plugins/ZKEACMS.PinNav/Scripts/pin-nav.js"));
#else
                applicationContext.CurrentPage.StyleSheets.Add(new Page.StyleSheetTag("/Plugins/ZKEACMS.PinNav/Content/pin-nav.min.css"));
                applicationContext.CurrentPage.FooterScripts.Add(new Page.ScriptTag("/Plugins/ZKEACMS.PinNav/Scripts/pin-nav.min.js"));
#endif
            }
        }
    }
}
