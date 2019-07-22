/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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

namespace ZKEACMS
{
    public class CMSApplicationContext : ApplicationContext
    {

        private Uri _requestUrl;

        public CMSApplicationContext(IHttpContextAccessor httpContextAccessor) :
            base(httpContextAccessor)
        {
            HeaderPart = new List<IHtmlContent>();
            FooterPart = new List<IHtmlContent>();
            Styles = new List<string>();
            Scripts = new List<string>();
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
                return HttpContextAccessor.HttpContext.Request.MapPath(path);
            }
            return path;
        }
        public PageViewMode PageMode { get; set; }
        public bool IsDesignMode { get { return PageMode == PageViewMode.Design; } }
        /// <summary>
        /// Append to html/head
        /// </summary>
        public List<IHtmlContent> HeaderPart { get; set; }
        /// <summary>
        /// Append the content before body close
        /// </summary>
        public List<IHtmlContent> FooterPart { get; set; }
        /// <summary>
        /// Append system styles to page footer
        /// </summary>
        public List<string> Styles { get; set; }
        /// <summary>
        /// Append system script to page footer
        /// </summary>
        public List<string> Scripts { get; set; }
        public bool OuterChainPicture { get { return Get<bool>(nameof(OuterChainPicture)); } }
    }
}
