using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Event
{
    public interface IEventManager
    {
        void Trigger(string eventName, object entity);
        void Trigger(EventArg e, object entity);
    }
}
