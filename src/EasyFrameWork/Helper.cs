/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy
{
    public static class Helper
    {
        public static class Url
        {
            public static string Combine(params string[] paths)
            {
                return "~/" + string.Join("/", paths);
            }
        }
    }
}
