/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.ComponentModel.DataAnnotations;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.Models;
using System;
using Easy.Extend;
using Easy.RepositoryPattern;

namespace Easy.Modules.MutiLanguage
{
    [DataTable("Language")]
    public class LanguageEntity
    {
        [NotMapped]
        public string ID
        {
            get
            {
                if (LanKey.IsNullOrWhiteSpace())
                {
                    return string.Empty;
                }
                return Convert.ToBase64String(LanKey.ToByte()).UrlEncode();
            }
        }
        public string LanKey { get; set; }
        public string CultureName { get; set; }
        public string LanValue { get; set; }
        public string Module { get; set; }
        public string LanType { get; set; }
    }
    class LanguageEntityMetaData : ViewMetaData<LanguageEntity>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden().Ignore();
            ViewConfig(m => m.CultureName).AsTextBox().ShowInGrid().ReadOnly().Search(LINQ.Query.Operators.None);
            ViewConfig(m => m.LanKey).AsTextBox().ShowInGrid().Search(LINQ.Query.Operators.Contains).SetGridColumnTemplate("<a href=\"/admin/language/edit?Id={id}\">{lanKey}</a>").ReadOnly();
            ViewConfig(m => m.LanType).AsTextBox();
            ViewConfig(m => m.Module).AsTextBox();
            ViewConfig(m => m.LanValue).AsTextBox().Required().ShowInGrid().Search(LINQ.Query.Operators.Contains);
        }
    }

}
