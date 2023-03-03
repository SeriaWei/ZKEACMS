/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using Easy.MetaData;
using Easy.RepositoryPattern;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.EventAction.Models
{
    [DataTable("EventAction")]
    public class EventAction : EditorEntity
    {
        [Key]
        public int ID { get; set; }
    }
    class EventActionMetaData : ViewMetaData<EventAction>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
        }
    }
}
