﻿/* http://www.zkea.net/ 
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
    public class PinNavScriptsService : IEventHandler
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
                styleBuilder.AppendHtml("<link type=\"text/css\" async rel=\"stylesheet\" href=\"/Plugins/ZKEACMS.PinNav/Content/pin-nav.css\" />");
                scriptBuilder.AppendHtml("<script type=\"text/javascript\" src=\"/Plugins/ZKEACMS.PinNav/Scripts/pin-nav.js \"></script>");
#else
                styleBuilder.AppendHtml("<link type=\"text/css\" async rel=\"stylesheet\" href=\"/Plugins/ZKEACMS.PinNav/Content/pin-nav.min.css\" />");
                scriptBuilder.AppendHtml("<script type=\"text/javascript\" src=\"/Plugins/ZKEACMS.PinNav/Scripts/pin-nav.min.js\" ></script>");
#endif
                applicationContext.HeaderPart.Add(styleBuilder);
                applicationContext.FooterPart.Add(scriptBuilder);
            }
        }
    }
}
