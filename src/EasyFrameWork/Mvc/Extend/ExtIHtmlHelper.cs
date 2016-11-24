using Easy.ViewPort.jsTree;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Easy.Mvc.Extend
{
    public static class ExtIHtmlHelper
    {
        public static Tree<T> Tree<T>(this IHtmlHelper htmlHelper) where T : class
        {
            return new Tree<T>(htmlHelper.ViewContext);
        }
    }
}
