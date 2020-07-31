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
using System.Text.RegularExpressions;

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
        public bool? IsPattern { get; set; }
        private Regex _regex;
        public bool IsMatch(string path)
        {
            if (IsPattern ?? false)
            {
                if (_regex == null)
                {
                    ParsePattern();
                }
                return _regex.IsMatch(path);
            }

            return path.Equals(InComingUrl, StringComparison.OrdinalIgnoreCase);
        }
        public void ParsePattern()
        {
            if (!string.IsNullOrEmpty(InComingUrl))
            {
                _regex = new Regex(InComingUrl, RegexOptions.Compiled | RegexOptions.IgnoreCase);
            }
        }
    }
    class UrlRedirectMetaData : ViewMetaData<UrlRedirect>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Order(0).Required().MaxLength(200).ShowInGrid().Search(Query.Operators.Contains);
            ViewConfig(m => m.InComingUrl).AsTextBox().Order(1).Required().MaxLength(500).PageSelector().ShowInGrid().Search(Query.Operators.Contains);
            ViewConfig(m => m.IsPattern).AsCheckBox().Order(2);
            ViewConfig(m => m.DestinationURL).AsTextBox().Order(3).Required().MaxLength(500).PageSelector().ShowInGrid().Search(Query.Operators.Contains);
            ViewConfig(m => m.Description).AsTextArea().Order(4).Search(Query.Operators.Contains);
        }
    }
}
