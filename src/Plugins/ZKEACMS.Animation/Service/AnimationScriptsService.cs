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

namespace ZKEACMS.Animation.Service
{
    public sealed class AnimationScriptsService : IEventHandler
    {
        private readonly IApplicationContextAccessor _applicationContextAccessor;
        private readonly IApplicationSettingService _applicationSettingService;

        public AnimationScriptsService(IApplicationContextAccessor applicationContextAccessor,
            IApplicationSettingService applicationSettingService)
        {
            _applicationContextAccessor = applicationContextAccessor;
            _applicationSettingService = applicationSettingService;
        }

        public void Handle(object entity, EventArg e)
        {
            if (_applicationSettingService.Get("Animation_Widget_FadeInUp", "false") == "true")
            {
                CMSApplicationContext applicationContext = _applicationContextAccessor.Current;
                HtmlContentBuilder styleBuilder = new HtmlContentBuilder();
                HtmlContentBuilder scriptBuilder = new HtmlContentBuilder();
#if DEBUG
                applicationContext.CurrentPage.StyleSheets.Add(new Page.StyleSheetTag("/Plugins/ZKEACMS.Animation/Content/animate.css"));
                applicationContext.CurrentPage.FooterScripts.Add(new Page.ScriptTag("/Plugins/ZKEACMS.Animation/Scripts/animate.js"));
#else
                applicationContext.CurrentPage.StyleSheets.Add(new Page.StyleSheetTag("/Plugins/ZKEACMS.Animation/Content/animate.min.css"));
                applicationContext.CurrentPage.FooterScripts.Add(new Page.ScriptTag("/Plugins/ZKEACMS.Animation/Scripts/animate.min.js"));
#endif
            }
        }
    }
}
