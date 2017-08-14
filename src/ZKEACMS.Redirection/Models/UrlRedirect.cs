using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Redirection.Models
{
    [Table("CMS_Redirection"), ViewConfigure(typeof(UrlRedirectMetaData))]
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
            ViewConfig(m => m.InComingUrl).AsTextBox().MaxLength(500).AddClass("select").AddProperty("data-url", Urls.SelectPage).ShowInGrid().Search(Easy.LINQ.Query.Operators.Contains);
            ViewConfig(m => m.DestinationURL).AsTextBox().MaxLength(500).AddClass("select").AddProperty("data-url", Urls.SelectPage);
        }
    }
}
