using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.GlobalScripts.Models;
using ZKEACMS.Setting;

namespace ZKEACMS.GlobalScripts.Service
{
    public class LiveChatScriptProvider : GlobalScriptsProviderService<LiveChatScript>
    {
        public LiveChatScriptProvider(IApplicationContextAccessor applicationContextAccessor, IApplicationSettingService applicationSettingService) 
            : base(applicationContextAccessor, applicationSettingService)
        {
        }
    }
}
