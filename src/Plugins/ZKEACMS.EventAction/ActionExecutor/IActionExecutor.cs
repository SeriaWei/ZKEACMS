/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Event;

namespace ZKEACMS.EventAction.ActionExecutor
{
    public interface IActionExecutor
    {
        ErrorOr Execute(Arguments args, object model, EventArg e);
    }
}
