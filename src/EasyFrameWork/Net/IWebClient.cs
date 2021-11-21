/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Net
{
    public interface IWebClient : IDisposable
    {
        Task<byte[]> DownloadDataAsync(string requestUri);
        Task<string> DownloadStringAsync(string requestUri);
        Task<Stream> GetStreamAsync(string requestUri);
    }
}
