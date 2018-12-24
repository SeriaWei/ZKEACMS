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
    [DataTable("Comments")]
    public class Comments : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string PagePath { get; set; }
        public string UserId { get; set; }
        public string Picture { get; set; }
        public string UserName { get; set; }
        public string CommentContent { get; set; }
        public int Agrees { get; set; }
        public int Disagrees { get; set; }
    }
    class CommentsMetadata : ViewMetaData<Comments>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().ShowInGrid().SetGridColumnTemplate("<a href=\"{pagePath}\" target=\"_blank\">{title}</a>").ReadOnly().Order(1);
            ViewConfig(m => m.PagePath).AsTextBox().ReadOnly();
            ViewConfig(m => m.UserId).AsHidden();
            ViewConfig(m => m.Picture).AsHidden();
            ViewConfig(m => m.CommentContent).AsTextArea().ShowInGrid().MaxLength(100);
        }
    }
}
