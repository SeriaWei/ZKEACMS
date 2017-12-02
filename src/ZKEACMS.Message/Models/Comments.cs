using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Message.Models
{
    [ViewConfigure(typeof(MessageMetaData)), Table("Comments")]
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
            
        }
    }
}
