/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc;
using System;
using Easy.Mvc.Extend;
using Microsoft.AspNetCore.Http;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Hosting;
using ZKEACMS.Filter;
using System.Collections.Generic;
using Microsoft.AspNetCore.Html;
using Easy.Mvc.StateProviders;
using ZKEACMS.Site;
using ZKEACMS.Currency;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Easy.Extend;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Razor.TagHelpers;
using Microsoft.AspNetCore.Mvc.Rendering;
using ZKEACMS.Page;

namespace ZKEACMS
{
    public class CMSApplicationContext : ApplicationContext
    {

        private Uri _requestUrl;

        public CMSApplicationContext(IHttpContextAccessor httpContextAccessor) :
            base(httpContextAccessor)
        {
        }

        public Uri RequestUrl
        {
            get
            {
                if (_requestUrl == null)
                {
                    if (HttpContextAccessor.HttpContext != null)
                    {
                        _requestUrl = new Uri(HttpContextAccessor.HttpContext.Request.Path);
                    }
                }
                return _requestUrl;
            }
            set { _requestUrl = new Uri(value.AbsoluteUri); }
        }

        public string MapPath(string path)
        {
            if (HttpContextAccessor.HttpContext != null)
            {
                HostingEnvironment.MapPath(path);
            }
            return path;
        }

        public PageViewMode PageMode { get; set; }
        public bool IsDesignMode { get { return PageMode == PageViewMode.Design; } }
        public bool IsPreViewMode { get { return PageMode == PageViewMode.PreView; } }

        public bool OuterChainPicture { get { return Get<bool>(nameof(OuterChainPicture)); } }
        public bool EnableResponsiveDesign { get { return Get<bool>(nameof(EnableResponsiveDesign)); } }
        public SiteInformation SiteInformation { get { return Get<SiteInformation>(nameof(SiteInformation)); } }
        public CurrencyOption Currency { get { return Get<CurrencyOption>(nameof(Currency)); } }

        public IPageContext CurrentPage { get { return HttpContextAccessor.HttpContext.RequestServices.GetService<IPageContext>(); } }
    }
}
