using Easy.Net.WebApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyFrameWork.Test.CMSApiClient
{
    public class CMSApiClient : ApiClient
    {
        public CMSApiClient(CMSApiEnvironment environment) : base(environment)
        {
            AddInjector(new AuthorizeInjector(environment));
        }
    }
}
