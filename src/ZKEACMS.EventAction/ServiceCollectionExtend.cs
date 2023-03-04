/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Event;
using ZKEACMS.EventAction.ActionExecutor;

namespace ZKEACMS.EventAction
{
    public static class ServiceCollectionExtend
    {
        public static void RegistActionExecutor<ActionExecutor>(this IServiceCollection services, string uniqueUseName)
           where ActionExecutor : class, IActionExecutor
        {
            Type type = typeof(ActionExecutor);
            ExecutorManager.RegistExecutor(uniqueUseName, type);
            services.AddTransient(type);
        }
    }
}
