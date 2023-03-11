/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using AngleSharp.Attributes;
using Easy.Models;
using Easy.RepositoryPattern;
using LiteDB;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.PendingTask
{
    public interface TaskEntity
    {
        string Identifier { get; set; }
        string HandlerName { get; set; }
        string Data { get; set; }
        int? Status { get; set; }
        string LogMessage { get; set; }
        int RetryCount { get; set; }
    }
}
