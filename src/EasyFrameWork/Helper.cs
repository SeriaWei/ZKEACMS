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
