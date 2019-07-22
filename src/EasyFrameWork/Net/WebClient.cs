/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Net
{
    public class WebClient : System.Net.WebClient
    {
        const string UserAgent = "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3438.3 Safari/537.36";
        public WebClient()
        {
            Headers["User-Agent"] = UserAgent;
        }
    }
}
