/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Primitives;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Event;

namespace ZKEACMS.SpiderLog.Service
{
    public class SearchEngineRequestHandler : IEventHandler
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISearchEngineManager _searchEngineManager;

        public SearchEngineRequestHandler(IHttpContextAccessor httpContextAccessor, ISearchEngineManager searchEngineManager)
        {
            _httpContextAccessor = httpContextAccessor;
            _searchEngineManager = searchEngineManager;
        }

        public void Handle(object entity, EventArg e)
        {
            if (_httpContextAccessor.HttpContext == null) return;
            StringValues userAgent = _httpContextAccessor.HttpContext.Request.Headers["User-Agent"];
            if (userAgent.Count == 0) return;

            var searchEngine = _searchEngineManager.Get(userAgent);
            if (searchEngine == null) return;

            _searchEngineManager.Log(searchEngine.Name, DateTime.Now, _httpContextAccessor.HttpContext.Request.GetAbsoluteUrl());
        }
    }
}
