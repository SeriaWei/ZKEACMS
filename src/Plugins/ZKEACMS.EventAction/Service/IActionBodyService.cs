/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.EventAction.Service
{
    public interface IActionBodyService : IService<Models.ActionBody>
    {
        string RenderBody(int ID, object model);
    }
}
