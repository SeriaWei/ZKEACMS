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
    public class NewsArticle : StructuredDataBase
    {
        public override string Type => "NewsArticle";

        [JsonProperty("headline")]
        public string HeadLine { get; set; }

        [JsonProperty("image")]
        public string[] Image { get; set; }

        [JsonProperty("datePublished")]
        public DateTimeOffset? DatePublished { get; set; }

        [JsonProperty("dateModified")]
        public DateTimeOffset? DateModified { get; set; }

        [JsonProperty("author")]
        public Person[] Author { get; set; }
    }
}
