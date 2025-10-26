/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.EventAction.ActionExecutor;

namespace ZKEACMS.EventAction.Service
{
    public interface IEventActionService : IService<Models.EventAction>
    {
        Dictionary<string, List<EventActionContent>> GetAllActivedActinosFromCache();
    }
}
