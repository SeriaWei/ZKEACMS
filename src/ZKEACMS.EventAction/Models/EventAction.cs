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
using ZKEACMS.Event;

namespace ZKEACMS.EventAction.Models
{
    [DataTable("EA_EventAction")]
    public class EventAction : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string Event { get; set; }
        public string Actions { get; set; }
    }
    class EventActionMetaData : ViewMetaData<EventAction>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Event).AsDropDownList().Required().DataSource(new Dictionary<string, string>
            {
                { "ZKEACMS.Message.Events.OnMessageSubmitted","On Message Submitted" },
                { "ZKEACMS.Message.Events.OnCommentsSubmitted","On Comments Submitted" }
            }).ShowInGrid();
            ViewConfig(m => m.Actions).AsTextArea().Required().AddProperty("rows", "20");
        }
    }
}
