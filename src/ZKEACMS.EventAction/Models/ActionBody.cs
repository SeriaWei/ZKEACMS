/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.EventAction.Models
{
    [DataTable("ActionBody")]
    public class ActionBody : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string Body { get; set; }
    }
    class ActionBodyMetaData : ViewMetaData<ActionBody>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Body).AsTextArea().Required().AddProperty("rows", "20");
        }
    }
}
