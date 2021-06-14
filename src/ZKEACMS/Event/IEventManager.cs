/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
