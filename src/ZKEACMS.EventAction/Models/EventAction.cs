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
using ZKEACMS.Extend;

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
            ViewConfig(m => m.Title).AsTextBox().Order(1).Required().ShowInGrid().Search(Easy.LINQ.Query.Operators.Contains).MaxLength(200);
            ViewConfig(m => m.Event).AsDropDownList().Required().DataSource(new Dictionary<string, string>
            {
                { "ZKEACMS.Events.OnResetPassword","OnResetPassword" },
                { "ZKEACMS.Message.Events.OnMessageSubmitted","OnMessageSubmitted" },
                { "ZKEACMS.Message.Events.OnCommentsSubmitted","OnCommentsSubmitted" },
                { "ZKEACMS.FormGenerator.Events.OnFormDataSubmitted","OnFormGeneratorFormSubmitted" }
            }).ShowInGrid();
            ViewConfig(m => m.Actions).AsTextArea().Required().AsCodeEditor("yaml");
        }
    }
}
