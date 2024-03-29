﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS
{
    public static class ApplicationContextExtend
    {
        public static T GetService<T>(this IApplicationContext applicationContext)
        {
            return applicationContext.CurrentAppContext().HttpContextAccessor.HttpContext.RequestServices.GetService<T>();
        }
        public static IEnumerable<T> GetServices<T>(this IApplicationContext applicationContext)
        {
            return applicationContext.CurrentAppContext().HttpContextAccessor.HttpContext.RequestServices.GetServices<T>();
        }
        public static CMSApplicationContext CurrentAppContext(this IApplicationContext applicationContext)
        {
            return applicationContext.As<CMSApplicationContext>();
        }
    }
}
