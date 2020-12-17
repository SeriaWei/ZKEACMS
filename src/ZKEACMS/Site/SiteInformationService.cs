using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Setting;

namespace ZKEACMS.Site
{
    public class SiteInformationService : ISiteInformationService
    {
        private readonly IApplicationSettingService _applicationSettingService;

        public SiteInformationService(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }

        public SiteInformation Get()
        {
            return new SiteInformation
            {
                SiteName = _applicationSettingService.Get("SiteInformation_SiteName", "ZKEASOFT"),
                Logo_Mini = _applicationSettingService.Get("SiteInformation_Logo_Mini", "/images/logo_min.png")
            };
        }
    }
}
