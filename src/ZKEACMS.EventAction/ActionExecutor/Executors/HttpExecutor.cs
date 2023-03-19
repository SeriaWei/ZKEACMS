/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.RepositoryPattern;
using System.Collections.Generic;
using ZKEACMS.Event;
using ZKEACMS.EventAction.HttpParser;
using ZKEACMS.EventAction.Service;
using ZKEACMS.PendingTask;

namespace ZKEACMS.EventAction.ActionExecutor.Executors
{
    public sealed class HttpExecutor : IActionExecutor
    {
        public const string Name = "actions/http";

        private readonly IActionBodyService _actionBodyService;
        private readonly IPendingTaskService _pendingTaskService;

        public HttpExecutor(IActionBodyService actionBodyService, IPendingTaskService pendingTaskService)
        {
            _actionBodyService = actionBodyService;
            _pendingTaskService = pendingTaskService;
        }

        public ServiceResult Execute(Arguments args, object model, EventArg e)
        {
            string requestBody = args.Named("request");

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
            _pendingTaskService.Add(httpRequest.Method + " " + httpRequest.Url.Split('?')[0], HttpRequesetTaskHandler.Name, httpRequest);
        }
    }
}
