/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Easy.Extend;
using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.Authorize
{
    public class KnownRequirements
    {
        static KnownRequirements()
        {
            Requirments = new Dictionary<string, List<IAuthorizationRequirement>>();
        }
        public static void Add(string key, IAuthorizationRequirement requirement)
        {
            if (Requirments.ContainsKey(key))
            {
                Requirments[key].Add(requirement);
            }
            else
            {
                Requirments.Add(key, new List<IAuthorizationRequirement> { requirement });
            }
        }
        public static Dictionary<string, List<IAuthorizationRequirement>> Requirments { get; set; }
        public static void Configure(AuthorizationOptions options)
        {
            Requirments.Each(p =>
            {
                options.AddPolicy(p.Key, configure => { p.Value.Each(configure.Requirements.Add); });
            });
        }
    }
}
