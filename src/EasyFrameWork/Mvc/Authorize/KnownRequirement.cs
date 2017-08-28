using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.Authorize
{
    public static class KnownRequirements
    {
        static KnownRequirements()
        {
            Requirments = new Dictionary<string, IAuthorizationRequirement>();
        }
        public static Dictionary<string, IAuthorizationRequirement> Requirments { get; set; }
    }
}
