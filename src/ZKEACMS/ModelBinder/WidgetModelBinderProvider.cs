using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Widget;
using System.Reflection;

namespace ZKEACMS.ModelBinder
{
    public class WidgetModelBinderProvider : IModelBinderProvider
    {
        public IModelBinder GetBinder(ModelBinderProviderContext context)
        {
            if (typeof(WidgetBase).IsAssignableFrom(context.Metadata.ModelType))
            {
                return new WidgetBinder(context);
            }
            return null;
        }
    }
}
