using Easy;
using Easy.Mvc.StateProviders;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Setting;

namespace ZKEACMS.StateProvider
{
    public class OuterChainPictureStateProvider : IApplicationContextStateProvider
    {
        private readonly IApplicationSettingService _applicationSettingService;
        public OuterChainPictureStateProvider(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }
        public string Name => "OuterChainPicture";

        public Func<IApplicationContext, T> Get<T>()
        {
            bool result = _applicationSettingService.Get(Name, "false") == "true";
            return (context) =>
            {
                return (T)(object)result;
            };
        }
    }
}
