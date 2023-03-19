/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.LINQ;
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.PendingTask;

namespace ZKEACMS.EventAction.Models
{
    [DataTable("EA_PendingTask")]
    public class PendingTaskEntity : EditorEntity, TaskEntity
    {
        [Key]
        public int ID { get; set; }
        public string Identifier { get; set; }
        public string HandlerName { get; set; }
        public string Data { get; set; }
        public string LogMessage { get; set; }
        public int RetryCount { get; set; }
    }
    class PendingTaskEntityMetaData : ViewMetaData<PendingTaskEntity>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.CreatebyName).AsHidden();
            ViewConfig(m => m.LastUpdateByName).AsHidden();

            ViewConfig(m => m.Identifier).AsTextBox().Required().ShowInGrid();
            ViewConfig(m => m.HandlerName).AsTextBox().ShowInGrid().Required();
            ViewConfig(m => m.Status).AsDropDownList().DataSource<PendingTaskStatus>().ReadOnly().ShowInGrid().Search(Query.Operators.Equal);
            ViewConfig(m => m.Data).AsTextArea().AddProperty("rows", "10");
            ViewConfig(m => m.LogMessage).AsTextArea().AddProperty("rows", "10").ReadOnly();
            ViewConfig(m => m.RetryCount).AsTextBox().ReadOnly().ShowInGrid();
        }
    }
}
