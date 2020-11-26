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
    public class SiteInformationStateProvider : IApplicationContextStateProvider
    {
        private readonly ISiteInformationService _siteInformationService;
        public SiteInformationStateProvider(ISiteInformationService siteInformationService)
        {
            _siteInformationService = siteInformationService;
        }

        public string Name
        {
            get { return "SiteInformation"; }
        }
        public Func<IApplicationContext, T> Get<T>()
        {
            SiteInformation siteInformation = _siteInformationService.Get();
            return (context) =>
            {
                return (T)(object)siteInformation;
            };
        }
    }
}
