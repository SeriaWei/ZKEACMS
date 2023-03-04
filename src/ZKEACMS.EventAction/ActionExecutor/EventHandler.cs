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
    public class EventHandler : IEventHandler
    {
        private readonly IEventActionService _eventActionService;
        private readonly IExecutorManager _actionManager;
        private readonly IRuleManager _ruleManager;

        public EventHandler(IEventActionService eventActionService, IExecutorManager actionManager, IRuleManager ruleManager)
        {
            _eventActionService = eventActionService;
            _actionManager = actionManager;
            _ruleManager = ruleManager;
        }

        public void Handle(object entity, EventArg e)
        {
            if (!_eventActionService.GetAllActivedActinosFromCache().TryGetValue(e.Name, out var actions)) return;

            foreach (var actionContent in actions)
            {
                foreach (var parsedAction in actionContent.Actions)
                {
                    if (parsedAction.Condition.IsNotNullAndWhiteSpace() && !_ruleManager.IsTrue(parsedAction.Condition)) continue;

                    var executor = _actionManager.CreateExecutor(parsedAction.Uses);
                    if (executor == null) continue;

                    executor.Execute(parsedAction.With, entity, e);
                }
            }
        }
    }
}
