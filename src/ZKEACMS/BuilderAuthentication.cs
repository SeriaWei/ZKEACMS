/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Api;

namespace ZKEACMS
{
    public static class BuilderAuthentication
    {
        public static void ConfigAuthentication(this IServiceCollection services)
        {
            services.Configure<AuthorizationOptions>(options =>
            {
                PermissionKeys.Configure(options);
                KnownRequirements.Configure(options);
            });

            services.AddAuthentication(DefaultAuthorizeAttribute.DefaultAuthenticationScheme)
                .AddCookie(DefaultAuthorizeAttribute.DefaultAuthenticationScheme, o =>
                {
                    o.LoginPath = new PathString("/account/login");
                    o.AccessDeniedPath = new PathString("/error/forbidden");
                })
                .AddCookie(CustomerAuthorizeAttribute.CustomerAuthenticationScheme, option =>
                {
                    option.LoginPath = new PathString("/account/signin");
                    option.AccessDeniedPath = new PathString("/error/forbidden");
                })
                .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters()
                    {
                        ValidateIssuer = true,
                        ValidIssuer = JwtBearerDefaults.Issuer,
                        ValidateAudience = true,
                        ValidAudience = JwtBearerDefaults.Audience,
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(JwtBearerDefaults.IssuerSigningKey))
                    };
                });
        }
    }
}
