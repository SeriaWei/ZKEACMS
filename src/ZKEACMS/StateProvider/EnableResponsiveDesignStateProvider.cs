using Easy;
using Easy.Mvc.StateProviders;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Setting;

namespace ZKEACMS.StateProvider
{
    public class EnableResponsiveDesignStateProvider : IApplicationContextStateProvider
    {
        private readonly IApplicationSettingService _applicationSettingService;
        public EnableResponsiveDesignStateProvider(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }
        public string Name => "EnableResponsiveDesign";

        public Func<IApplicationContext, T> Get<T>()
        {
            bool result = _applicationSettingService.Get(Name, "true") == "true";
            return (context) =>
            {
                return (T)(object)result;
            };
        }
    }
}
