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
        /// <summary>
        /// 主键ID
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// 皮肤名称
        /// </summary>
        [Required]
        public string ThemeName { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [Required]
        public string Name { get; set; }

        /// <summary>
        /// 文件绝对路径
        /// </summary>
        public string Path { get; set; }

        /// <summary>
        /// 相对路径
        /// </summary>
        [Required]
        public string RelativePath { get; set; }

        /// <summary>
        /// 文件内容
        /// </summary>
        [Required]
        public string Content { get; set; }

        /// <summary>
        /// 最后修改时间
        /// </summary>
        public DateTime LastUpdateTime { get; set; }
    }

    public class TemplateFileMetaData : ViewMetaData<TemplateFile>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Id).AsHidden();
            ViewConfig(m => m.ThemeName).AsTextBox().ReadOnly().ShowInGrid().Order(1);
            ViewConfig(m => m.Name).AsTextBox().ShowInGrid().Order(10);
            ViewConfig(m => m.Path).AsHidden();
            ViewConfig(m => m.RelativePath).AsTextBox().ReadOnly().ShowInGrid().Order(20).Search(Easy.LINQ.Query.Operators.None);
            ViewConfig(m => m.Content).AsTextArea().AsCodeEditor().ShowInGrid(false).Order(30);
            ViewConfig(m => m.LastUpdateTime).AsTextBox().FormatDate("yyyy-MM-dd").ShowInGrid().ReadOnly().Order(100).Search(Easy.LINQ.Query.Operators.None);
        }
    }
}
