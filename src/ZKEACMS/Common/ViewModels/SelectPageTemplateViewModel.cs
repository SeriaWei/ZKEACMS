using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Common.ViewModels
{
    public class SelectPageTemplateViewModel
    {
        public IEnumerable<Page.PageEntity> Templates { get; set; }
        public string ToPageID { get; set; }
    }
}
