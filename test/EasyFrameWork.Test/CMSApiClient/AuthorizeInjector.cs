using Easy.Net.WebApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyFrameWork.Test.CMSApiClient
{
    public class AuthorizeInjector : IInjector
    {
        private JwtToken _jwtToken;
        private CMSApiEnvironment _environment;
        public AuthorizeInjector(CMSApiEnvironment environment)
        {
            _environment = environment;
        }

        public void Inject(HttpRequest request)
        {
            if(request is IAuthorizeRequired)
            {
                if (_jwtToken == null || _jwtToken.IsExpired)
                {
                    using (ApiClient apiClient = new ApiClient(_environment))
                    {
                        _jwtToken = apiClient.Excute(new TokenRequest(_environment)).Result<JwtToken>();
                    }
                }
                request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _jwtToken.Token);
            }
        }
    }
}
