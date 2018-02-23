/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using Easy.Models;
using ZKEACMS.Widget;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Microsoft.Extensions.DependencyInjection;
using System.Text;
using System.Linq;

namespace ZKEACMS.WidgetTemplate
{
    public abstract class WidgetTemplateEntity : EditorEntity
    {
        public string ID { get { return Convert.ToBase64String(Encoding.UTF8.GetBytes(AssemblyName + ServiceTypeName)); } }
        public string GroupName { get; set; }
        public string PartialView { get; set; }
        public string AssemblyName { get { return ServiceType.Assembly.GetName().Name; } }
        public virtual Type ServiceType { get; set; }
        public string ServiceTypeName { get { return ServiceType.FullName; } }
        public string Thumbnail { get; set; }
        public virtual Type ViewModelType { get; set; }
        public string ViewModelTypeName { get { return ViewModelType.FullName; } }
        public int? Order { get; set; }

        public string FormView { get; set; }

        public virtual WidgetBase ToWidget(IServiceProvider serviceProvider)
        {
            WidgetBase widget = new WidgetBase();
            widget.AssemblyName = AssemblyName;
            widget.ServiceTypeName = ServiceTypeName;
            widget.ViewModelTypeName = ViewModelTypeName;
            widget.Description = Description;
            widget.PartialView = PartialView;
            widget.WidgetName = Title;
            return serviceProvider.GetService<IWidgetActivator>().CreateWidgetViewModel(widget);
        }
    }
    public class WidgetTemplateEntity<T> : WidgetTemplateEntity
    {
        public override Type ServiceType { get { return typeof(T); } }
        public override Type ViewModelType { get { return ServiceType.IsGenericType ? ServiceType.GetGenericArguments().First() : ServiceType.BaseType.GetGenericArguments().First(); } }
    }
}
