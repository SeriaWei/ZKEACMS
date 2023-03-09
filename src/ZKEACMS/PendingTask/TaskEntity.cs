/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
    public class TaskEntity
    {
        public ObjectId Id { get; set; }
        public string HandlerName { get; set; }
        public string Data { get; set; }
        public string Error { get; set; }
        public int RetryCount { get; set; }
    }
}
