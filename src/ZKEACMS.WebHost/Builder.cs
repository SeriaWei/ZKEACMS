using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.Extensions.DependencyInjection;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS.WebHost
{
    public class Builder : PluginBase
    {
        #region Base
        public override IEnumerable<AdminMenu> AdminMenu()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {

        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {

        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {

        }
        #endregion

        public override void ConfigureMVC(IMvcBuilder mvcBuilder)
        {
            mvcBuilder.AddRazorRuntimeCompilation();
        }
    }
}
