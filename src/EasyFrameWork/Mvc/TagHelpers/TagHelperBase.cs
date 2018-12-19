/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Razor.TagHelpers;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.TagHelpers
{
    public abstract class TagHelperBase : TagHelper
    {
        [HtmlAttributeNotBound]
        [ViewContext]
        public ViewContext ViewContext { get; set; }

        private IUrlHelper _url;

        [HtmlAttributeNotBound]
        public IUrlHelper Url
        {
            get
            {
                if (_url == null)
                {
                    var urlHelperFactory = ViewContext.HttpContext.RequestServices.GetService<IUrlHelperFactory>();
                    _url = urlHelperFactory.GetUrlHelper(ViewContext);
                }
                return _url;
            }
        }
    }
}
