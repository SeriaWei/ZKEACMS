/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using ZKEACMS.Extend;

namespace ZKEACMS.Common.Models
{
    public class TemplateFile
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string ThemeName { get; set; }

        [Required]
        public string Name { get; set; }

        public string Path { get; set; }

        [Required]
        public string RelativePath { get; set; }

        [Required]
        public string Content { get; set; }

        public DateTime LastUpdateTime { get; set; }

        public string ThemeViewsFolder { get; set; }
    }

    public class TemplateFileMetaData : ViewMetaData<TemplateFile>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Id).AsHidden();
            ViewConfig(m => m.ThemeViewsFolder).AsHidden();
            ViewConfig(m => m.ThemeName).AsTextBox().ReadOnly().ShowInGrid().Order(1);
            ViewConfig(m => m.Name).AsTextBox().ShowInGrid().Order(10);
            ViewConfig(m => m.Path).AsHidden();
            ViewConfig(m => m.RelativePath).AsTextBox().ReadOnly().ShowInGrid().Order(20).Search(Easy.LINQ.Query.Operators.None);
            ViewConfig(m => m.Content).AsTextArea().AsCodeEditor().ShowInGrid(false).Order(30);
            ViewConfig(m => m.LastUpdateTime).AsTextBox().FormatAsDateTime().ShowInGrid().ReadOnly().Order(100).Search(Easy.LINQ.Query.Operators.None);
        }
    }
}
