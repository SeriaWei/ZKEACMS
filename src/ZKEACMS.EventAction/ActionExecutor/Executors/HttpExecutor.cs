/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.RepositoryPattern;
using System.Collections.Generic;
using ZKEACMS.Event;
using ZKEACMS.EventAction.HttpParser;
using ZKEACMS.EventAction.Service;

namespace ZKEACMS.EventAction.ActionExecutor.Executors
{
    public class HttpExecutor : IActionExecutor
    {
        public const string Name = "actions/http";

        private readonly IActionBodyService _actionBodyService;
        private readonly IHttpRequestQueue _httpRequestQueue;

        public HttpExecutor(IActionBodyService actionBodyService, IHttpRequestQueue httpRequestQueue)
        {
            _actionBodyService = actionBodyService;
            _httpRequestQueue = httpRequestQueue;
        }

        public ServiceResult Execute(Dictionary<string, string> args, object model, EventArg e)
        {
            string requestBody = args.GetValueOrDefault("request");

            if (requestBody.IsNullOrWhiteSpace() &&
                args.TryGetValue("requestContentId", out var actionBodyId) &&
                int.TryParse(actionBodyId, out int id))
            {
                requestBody = _actionBodyService.RenderBody(id, model);
            }

            if (requestBody.IsNullOrWhiteSpace()) return new ServiceResult();

            var request = HttpRequestContent.Parse(requestBody);
            PushRequestInQueue(request);
            return new ServiceResult();
        }
        private void PushRequestInQueue(HttpRequestContent httpRequest)
        {
            _httpRequestQueue.Push(httpRequest);
        }
    }
}
