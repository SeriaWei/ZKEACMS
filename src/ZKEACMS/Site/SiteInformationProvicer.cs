using Easy;
using Easy.Mvc.StateProviders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Setting;

namespace ZKEACMS.Site
{
    public class SiteInformationProvicer : IApplicationContextStateProvider
    {
        private readonly IApplicationSettingService _applicationSettingService;

        public SiteInformationProvicer(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }

        public string Name
        {
            get { return "SiteInformation"; }
        }
        public Func<IApplicationContext, T> Get<T>()
        {
            SiteInformation siteInformation = new SiteInformation
            {
                SiteName = _applicationSettingService.Get("SiteInformation_SiteName", "ZKEACMS"),
                Logo_Mini = _applicationSettingService.Get("SiteInformation_Logo_Mini", "/images/logo_min.png")
            };
            return (context) =>
            {
                return (T)(object)siteInformation;
            };
        }
    }
}
