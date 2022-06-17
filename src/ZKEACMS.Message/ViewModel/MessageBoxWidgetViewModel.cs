/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Message.Models;

namespace ZKEACMS.Message.ViewModel
{
    public class MessageBoxWidgetViewModel
    {
        public IEnumerable<MessageEntity> Messages { get; set; }
        public Pagination Pagination { get; set; }
    }
}
