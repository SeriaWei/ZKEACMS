using System;
using System.Threading.Tasks;
///* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Mvc.ModelBinding.Binders;

namespace ZKEACMS.ModelBinder
{
    public class WidgetBinder : IModelBinder
    {

        public Task BindModelAsync(ModelBindingContext bindingContext)
        {
            Microsoft.AspNetCore.Mvc.ModelBinding.Binders.
               var assembly = bindingContext.ValueProvider.GetValue("AssemblyName");
            var viewModelType = bindingContext.ValueProvider.GetValue("ViewModelTypeName");
            
            SimpleTypeModelBinder simpleBinder = new SimpleTypeModelBinder(WidgetBase.KnownWidgetModel[$"{assembly.FirstValue},{viewModelType.FirstValue}"]);

            return simpleBinder.BindModelAsync(bindingContext);
        }
    }
}
