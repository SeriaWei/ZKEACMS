/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using YamlDotNet.Serialization.NamingConventions;
using YamlDotNet.Serialization;
using Easy.Extend;
using ZKEACMS.Event;
using ZKEACMS.EventAction.Service;
using Easy.RuleEngine;

namespace ZKEACMS.EventAction.ActionExecutor
{
    public sealed class EventHandler : IEventHandler
    {
        private readonly IEventActionService _eventActionService;
        private readonly IExecutorManager _executorManager;
        private readonly IRuleManager _ruleManager;

        public EventHandler(IEventActionService eventActionService, IExecutorManager executorManager, IRuleManager ruleManager)
        {
            _eventActionService = eventActionService;
            _executorManager = executorManager;
            _ruleManager = ruleManager;
        }

        public void Handle(object entity, EventArg e)
        {
            if (!_eventActionService.GetAllActivedActinosFromCache().TryGetValue(e.Name, out var actions)) return;

            foreach (var actionContent in actions)
            {
                if (actionContent.Actions == null) continue;

                //todo: Action with condition.
                //if (actionContent.Condition.IsNotNullAndWhiteSpace() && !_ruleManager.IsTrue(actionContent.Condition)) continue;

                foreach (var parsedAction in actionContent.Actions)
                {
                    var executor = _executorManager.CreateExecutor(parsedAction.Uses);
                    if (executor == null) continue;

                    var arg = _eventActionService.RenderArguments(parsedAction.With, entity);
                    executor.Execute(arg, entity, e);
                }
            }
        }
    }
}
