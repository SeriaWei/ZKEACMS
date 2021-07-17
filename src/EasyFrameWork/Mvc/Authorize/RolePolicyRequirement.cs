/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.Authorize
{
    public class RolePolicyRequirement : IAuthorizationRequirement
    {
        public string Policy { get; set; }
    }
}
