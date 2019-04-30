/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.ObjectModel;
using Easy.MetaData;
using Easy.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.Layout
{
    [DataTable("CMS_LayoutHtml")]
    public class LayoutHtml : EditorEntity
    {
        [Key]
        public int LayoutHtmlId { get; set; }
        public string LayoutId { get; set; }
        public string PageId { get; set; }
        public string Html { get; set; }

        public string NoStyleHtml
        {
            get { return CustomRegex.StyleRegex.Replace(Html, ""); }
        }
    }
    public class LayoutHtmlCollection : Collection<LayoutHtml>
    {

    }

}
