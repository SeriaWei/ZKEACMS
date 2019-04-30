using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Service;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;
using Easy.Extend;

namespace ZKEACMS.FormGenerator.Models
{
    public class FormWidget : SimpleWidgetBase
    {
        public string FormID { get; set; }
    }

    class FormWidgetMetaData : WidgetMetaData<FormWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.FormID).AsDropDownList().DataSource(() =>
            {
                return Easy.ServiceLocator.GetService<IFormService>().Get().ToDictionary(f => f.ID, f => f.Title);
            }).Required();
        }
    }
}
