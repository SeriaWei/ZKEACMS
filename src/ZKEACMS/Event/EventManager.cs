using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Event
{
    public class EventManager : IEventManager
    {
        static Dictionary<string, List<Type>> Handlers = new Dictionary<string, List<Type>>();
        private readonly IServiceProvider _serviceProvider;
        public EventManager(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }
        public void Trigger(string eventName, object entity)
        {
            Trigger(new EventArg { Name = eventName }, entity);
        }

        public void Trigger(EventArg e, object entity)
        {
            if (Handlers.ContainsKey(e.Name))
            {
                foreach (Type item in Handlers[e.Name])
                {
                    (_serviceProvider.GetService(item) as IEventHandler)?.Handle(entity, e);
                }
            }
        }
        internal static void RegistEvent(string name, Type type)
        {
            if (!Handlers.ContainsKey(name))
            {
                Handlers[name] = new List<Type>();
            }
            Handlers[name].Add(type);
        }
    }
}
