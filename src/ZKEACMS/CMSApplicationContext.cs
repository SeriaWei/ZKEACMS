/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc;
using System;
using Easy.Mvc.Extend;
using Microsoft.AspNetCore.Http;
using Easy.Modules.User.Service;

namespace ZKEACMS
{
    public class CMSApplicationContext : ApplicationContext
    {
        public CMSApplicationContext(IHttpContextAccessor httpContextAccessor) :
            base(httpContextAccessor)
        {

        }
        private Uri _requestUrl;
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
    }
}
