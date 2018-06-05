using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Widget;
using System.Reflection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.ModelBinder
{
    public class WidgetModelBinderProvider : IModelBinderProvider
    {
        public IModelBinder GetBinder(ModelBinderProviderContext context)
        {
            if (typeof(BasicWidget).IsAssignableFrom(context.Metadata.ModelType))
            {
                return new WidgetBinder(context, context.Services.GetService<ILoggerFactory>());
            }
            return null;
        }
    }
}
