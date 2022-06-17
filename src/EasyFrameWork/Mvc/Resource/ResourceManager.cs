/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Resource.Enums;
using Microsoft.AspNetCore.Mvc.ApplicationParts;
using System;
using System.Collections.Generic;

namespace Easy.Mvc.Resource
{
    public abstract class ResourceManager : ApplicationPart
    {
        protected ResourceHelper Script(string name)
        {
            return new ResourceHelper(name, ResourceType.Script);
        }
        protected ResourceHelper Style(string name)
        {
            return new ResourceHelper(name, ResourceType.Style);
        }

        protected abstract void InitScript(Func<string, ResourceHelper> script);
        protected abstract void InitStyle(Func<string, ResourceHelper> style);

        public virtual void SetupResource()
        {
            InitScript(Script);
            InitStyle(Style);
        }
    }

}
