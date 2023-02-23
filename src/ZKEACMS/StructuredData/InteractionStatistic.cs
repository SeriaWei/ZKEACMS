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
    public class InteractionStatistic : StructuredDataBase
    {
        public override string Type { get { return "InteractionCounter"; } }

        [JsonProperty("interactionType")]
        public InteractionTypeWatchAction InteractionType { get; } = new InteractionTypeWatchAction();

        [JsonProperty("userInteractionCount")]
        public int UserInteractionCount { get; set; }
    }
}
