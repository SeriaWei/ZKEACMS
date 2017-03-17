/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using Easy.Models;
using ZKEACMS.Widget;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.WidgetTemplate
{
    [ViewConfigure(typeof(WidgetTemplateMetaData)), Table("CMS_WidgetTemplate")]
    public class WidgetTemplateEntity : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string GroupName { get; set; }

        public string PartialView { get; set; }
        public string AssemblyName { get; set; }
        public string ServiceTypeName { get; set; }
        public string Thumbnail { get; set; }
        public string ViewModelTypeName { get; set; }
        public int? Order { get; set; }

        public string FormView { get; set; }

        public WidgetBase ToWidget(IServiceProvider serviceProvider)
        {
            WidgetBase widget = new WidgetBase();
            widget.AssemblyName = AssemblyName;
            widget.ServiceTypeName = ServiceTypeName;
            widget.ViewModelTypeName = ViewModelTypeName;
            widget.Description = Description;
            widget.PartialView = PartialView;
            widget.WidgetName = Title;
            return serviceProvider.GetService<IWidgetActivetor>().CreateWidgetViewModel(widget);
        }
    }
    class WidgetTemplateMetaData : ViewMetaData<WidgetTemplateEntity>
    {

        protected override void ViewConfigure()
        {

        }
    }

}
