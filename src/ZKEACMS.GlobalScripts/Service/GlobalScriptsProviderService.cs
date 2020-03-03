using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.GlobalScripts.Models;
using Easy;
using Microsoft.AspNetCore.Http;
using ZKEACMS.Page;
using ZKEACMS.Event;
using ZKEACMS.Setting;
using Microsoft.AspNetCore.Html;
using Easy.Extend;

namespace ZKEACMS.GlobalScripts.Service
{
    public abstract class GlobalScriptsProviderService<T> : IEventHandler where T : GlobalScript, new()
    {
        private readonly IApplicationContextAccessor _applicationContextAccessor;
        private readonly IApplicationSettingService _applicationSettingService;
        public GlobalScriptsProviderService(IApplicationContextAccessor applicationContextAccessor, IApplicationSettingService applicationSettingService)
        {
            _applicationContextAccessor = applicationContextAccessor;
            _applicationSettingService = applicationSettingService;
        }
        public virtual void Handle(object entity, EventArg e)
        {
            CMSApplicationContext applicationContext = _applicationContextAccessor.Current;
            var script = _applicationSettingService.Get<T>();

            if (script != null && script.Script.IsNotNullAndWhiteSpace())
            {
                if (script.Script.IndexOf("</script>", StringComparison.OrdinalIgnoreCase) > 0)
                {
                    HtmlContentBuilder htmlContentBuilder = new HtmlContentBuilder();
                    htmlContentBuilder.AppendHtml(script.Script);
                    if (script.Location == (int)ScriptLocation.Header)
                    {
                        applicationContext.HeaderPart.Add(htmlContentBuilder);
                    }
                    else
                    {
                        applicationContext.FooterPart.Add(htmlContentBuilder);
                    }
                }
                else
                {
                    HtmlContentBuilder htmlContentBuilder = new HtmlContentBuilder();
                    htmlContentBuilder.AppendHtml("<script type=\"text/javascript\">");
                    htmlContentBuilder.AppendHtml(script.Script);
                    htmlContentBuilder.AppendHtml("</script>");
                    if (script.Location == (int)ScriptLocation.Header)
                    {
                        applicationContext.HeaderPart.Add(htmlContentBuilder);
                    }
                    else
                    {
                        applicationContext.FooterPart.Add(htmlContentBuilder);
                    }
                }
            }

        }
    }
}
