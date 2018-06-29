/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Microsoft.AspNetCore.Authorization;

namespace Easy.Mvc.Authorize
{
    public class DefaultAuthorizeAttribute : AuthorizeAttribute
    {
        public const string DefaultAuthenticationScheme = "DefaultAuthenticationScheme";
        public DefaultAuthorizeAttribute()
        {
            this.AuthenticationSchemes = DefaultAuthenticationScheme;
        }
    }
}