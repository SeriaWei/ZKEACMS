/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using YamlDotNet.Serialization;

namespace ZKEACMS.EventAction.ActionExecutor
{
    public class EventActionContent
    {
        [YamlMember(Alias = "name")]
        public string Name { get; set; }

        [YamlMember(Alias = "description")]
        public string Description { get; set; }

        [YamlMember(Alias = "condition")]
        public string Condition { get; set; }

        [YamlMember(Alias = "actions")]
        public List<ActionContent> Actions { get; set; }
    }
}
