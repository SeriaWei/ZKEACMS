using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EasyFrameWork.Test.CMSApiClient
{
    public class JwtToken
    {
        [JsonProperty("token")]
        public string Token { get; set; }

        [JsonProperty("expires")]
        public DateTime Expires { get; set; }
        public bool IsExpired
        {
            get
            {
                return DateTime.UtcNow > Expires;
            }
        }
    }
}
