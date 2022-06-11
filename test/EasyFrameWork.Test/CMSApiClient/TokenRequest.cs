using Easy.Net.WebApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace EasyFrameWork.Test.CMSApiClient
{
    public class TokenRequest : HttpRequest
    {
        public TokenRequest(CMSApiEnvironment environment) : base("/api/acount/createtoken", HttpMethod.Post, typeof(JwtToken))
        {
            ContentType = MimeContentType.Json;
            Body = new User
            {
                UserId = environment.Username,
                Password = environment.Password
            };
        }
    }
}
