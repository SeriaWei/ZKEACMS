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
    public class VideoObject : StructuredDataBase
    {
        public override string Type { get { return "VideoObject"; } }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("thumbnailUrl")]
        public string ThumbnailUrl { get; set; }

        [JsonProperty("contentURL")]
        public string ContentURL { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

        [JsonProperty("duration")]
        public string Duration { get; set; }

        [JsonProperty("embedUrl")]
        public string EmbedUrl { get; set; }

        [JsonProperty("expires")]
        public DateTimeOffset? Expires { get; set; }

        [JsonProperty("interactionStatistic")]
        public InteractionStatistic InteractionStatistic { get; set; }

        [JsonProperty("uploadDate")]
        public DateTimeOffset? UploadDate { get; set; }
    }
}
