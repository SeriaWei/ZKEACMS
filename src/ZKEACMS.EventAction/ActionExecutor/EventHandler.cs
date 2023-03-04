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
using ZKEACMS.Event;
using ZKEACMS.EventAction.Service;

namespace ZKEACMS.EventAction.ActionExecutor
{
    public class EventHandler : IEventHandler
    {
        private readonly IEventActionService _eventActionService;
        private readonly IActionManager _actionManager;

        public EventHandler(IEventActionService eventActionService, IActionManager actionManager)
        {
            _eventActionService = eventActionService;
            _actionManager = actionManager;
        }

        public void Handle(object entity, EventArg e)
        {
            var actions = _eventActionService.GetAllActivedActinosFromCache().Where(m => m.Event == e.Name).ToList();
            if (actions.Count == 0) return;
            var deserializer = new DeserializerBuilder().WithNamingConvention(UnderscoredNamingConvention.Instance).Build();
            foreach (var action in actions)
            {
                var eventActionContent = deserializer.Deserialize<EventActionContent>(action.Actions);
                foreach (var parsedAction in eventActionContent.Actions)
                {
                    var executor = _actionManager.CreateExecutor(parsedAction.Uses);
                    if (executor == null) continue;

                    executor.Execute(entity, parsedAction.With);
                }
            }
        }
    }
}
