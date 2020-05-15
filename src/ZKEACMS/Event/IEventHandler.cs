using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Event
{
    public interface IEventHandler
    {
        void Handle(object entity, EventArg e);
    }
}
