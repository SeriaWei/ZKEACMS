/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Resource.Enums;
using System.Collections.Generic;

namespace Easy.Mvc.Resource
{
    public class ResourceCollection : List<ResourceEntity>
    {
        public string Name { get; set; }
        public bool Required { get; set; }
        public ResourcePosition Position { get; set; }
    }
}
