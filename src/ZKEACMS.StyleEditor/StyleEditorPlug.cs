/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */
using Easy;
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Easy.RepositoryPattern;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS.StyleEditor
{
    public class StyleEditor : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            return null;
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
            script("style-editor")
                .Include("~/Plugins/ZKEACMS.StyleEditor/Scripts/bgrins-spectrum/spectrum.js", "~/Plugins/ZKEACMS.StyleEditor/Scripts/bgrins-spectrum/spectrum.min.js")
                .Include("~/Plugins/ZKEACMS.StyleEditor/Scripts/bgrins-spectrum/i18n/jquery.spectrum-zh-cn.js")
                .Include("~/Plugins/ZKEACMS.StyleEditor/Scripts/jquery-ui.custom.js", "~/Plugins/ZKEACMS.StyleEditor/Scripts/jquery-ui.custom.min.js")
                .Include("~/Plugins/ZKEACMS.StyleEditor/Scripts/editor.js", "~/Plugins/ZKEACMS.StyleEditor/Scripts/editor.min.js")
                .Include("~/Plugins/ZKEACMS.StyleEditor/Scripts/values.js", "~/Plugins/ZKEACMS.StyleEditor/Scripts/values.min.js");
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("style-editor")
                .Include("~/Plugins/ZKEACMS.StyleEditor/Scripts/bgrins-spectrum/spectrum.css", "~/Plugins/ZKEACMS.StyleEditor/Scripts/bgrins-spectrum/spectrum.min.css")
                .Include("~/Plugins/ZKEACMS.StyleEditor/Content/main.css", "~/Plugins/ZKEACMS.StyleEditor/Content/main.min.css")
                .Include("~/Plugins/ZKEACMS.StyleEditor/Content/jquery-ui.css", "~/Plugins/ZKEACMS.StyleEditor/Content/jquery-ui.min.css");
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
        }
    }
}