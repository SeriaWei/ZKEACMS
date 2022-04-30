/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Setting;

namespace ZKEACMS.Route
{
    public class AccountRouteConstraint : IRouteConstraint
    {
        public bool Match(HttpContext httpContext, IRouter route, string routeKey, RouteValueDictionary values, RouteDirection routeDirection)
        {
            if (httpContext == null || routeDirection == RouteDirection.UrlGeneration) return true;

            IApplicationSettingService applicationSettingService = httpContext.RequestServices.GetService<IApplicationSettingService>();
            bool enableCustomerAccount = applicationSettingService.Get(SettingKeys.EnableCustomerAccount, "true") == "true";
            if (!enableCustomerAccount) return false;

            if (IsSignUpActions(values[routeKey].ToString()))
            {
                return applicationSettingService.Get(SettingKeys.EnableSignMeUp, "true") == "true";
            }

            return true;
        }
        private bool IsSignUpActions(string action)
        {
            return action.Equals("SignUp", StringComparison.OrdinalIgnoreCase)||
                action.Equals("SignUpSuccess", StringComparison.OrdinalIgnoreCase);
        }
    }
}
