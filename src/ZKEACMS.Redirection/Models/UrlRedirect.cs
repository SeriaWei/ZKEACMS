using Easy.LINQ;
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Extend;

namespace ZKEACMS.Redirection.Models
{
    [DataTable("CMS_Redirection")]
    public class UrlRedirect : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string InComingUrl { get; set; }
        public string DestinationURL { get; set; }
        public bool IsPermanent { get; set; }
    }
    class UrlRedirectMetaData : ViewMetaData<UrlRedirect>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Order(0).Required().MaxLength(200).ShowInGrid().Search(Query.Operators.Contains);
            ViewConfig(m => m.InComingUrl).AsTextBox().Order(1).Required().MaxLength(500).PageSelector().ShowInGrid().Search(Query.Operators.Contains);
            ViewConfig(m => m.DestinationURL).AsTextBox().Order(2).Required().MaxLength(500).PageSelector().ShowInGrid().Search(Query.Operators.Contains);
            ViewConfig(m => m.Description).AsTextArea().Search(Query.Operators.Contains);
        }
    }
}
