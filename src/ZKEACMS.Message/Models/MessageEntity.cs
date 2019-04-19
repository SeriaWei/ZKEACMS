/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.Message.Models
{
    [DataTable("CMS_Message")]
    public class MessageEntity : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string Email { get; set; }
        public string PostMessage { get; set; }
        public string Reply { get; set; }
    }
    class MessageMetaData : ViewMetaData<MessageEntity>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Required().MaxLength(50).Order(1).ShowInGrid();
            ViewConfig(m => m.Email).AsTextBox().Email().Required().MaxLength(50).Order(2).ShowInGrid();
            ViewConfig(m => m.PostMessage).AsTextArea().Required().MaxLength(500).Order(3);
            ViewConfig(m => m.Reply).AsTextArea().MaxLength(500).Order(4);
        }
    }
}