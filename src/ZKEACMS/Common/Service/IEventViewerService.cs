/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace ZKEACMS.Common.Service
{
    public interface IEventViewerService
    {
        IEnumerable<FileInfo> Get();
        void Delete(string id);
        void DeleteAll();
        Stream GetStream(string id);
        IEnumerable<LogEntry> Take(string id, long position, int take);
    }
}
