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
        [JsonProperty("@type")]
        public abstract string Type { get; }
    }
}
