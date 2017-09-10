using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Easy.Mvc.Authorize
{
    public class CustomerAuthorizeAttribute : AuthorizeAttribute
    {
        public const string CustomerAuthenticationScheme = "CustomerAuthenticationScheme";
        public CustomerAuthorizeAttribute()
        {
            this.AuthenticationSchemes = CustomerAuthenticationScheme;
        }
    }
}
