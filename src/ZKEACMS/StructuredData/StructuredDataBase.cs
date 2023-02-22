/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.StructuredData
{
    public abstract class StructuredDataBase
    {
        [JsonProperty("@context")]
        public string Context { get { return "https://schema.org"; } }

        [JsonProperty("@type")]
        public abstract string Type { get; }
    }
}
