/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Api
{
    public class JwtBearerDefaults
    {
        public const string Issuer = "ZKEACMS.Security.Tokens.Issuer";
        public const string Audience = "ZKEACMS.Security.Tokens.Audience";
        public const string IssuerSigningKey = "ZKEACMS.Security.Tokens.Key";
        public const double ExpireDays = 1;
        /// <summary>
        /// Bearer
        /// </summary>
        public const string AuthenticationScheme = Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerDefaults.AuthenticationScheme;
    }
}
