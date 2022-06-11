using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EasyFrameWork.Test.CMSApiClient
{
    public class User
    {
        [JsonProperty("userID")]
        public string UserId { get; set; }

        [JsonProperty("passWord")]
        public string Password { get; set; }
    }
}
