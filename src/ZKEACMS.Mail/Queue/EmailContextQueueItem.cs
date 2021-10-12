/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy.Notification;
using LiteDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Mail.Queue
{
    public class EmailContextQueueItem : EmailContext
    {
        public EmailContextQueueItem() : base(null, null)
        {

        }

        public ObjectId Id { get; set; }
    }
}
