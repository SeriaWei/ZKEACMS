using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Widget
{
    public class DefaultWidgetActivetor : IWidgetActivetor
    {
        private readonly IServiceProvider _serviceProvider;
        public DefaultWidgetActivetor(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }
        public IWidgetPartDriver Create(WidgetBase widget)
        {
            string key = $"{widget.AssemblyName},{widget.ServiceTypeName}";
            if (WidgetBase.KnownWidgetService.ContainsKey(key))
            {
                return _serviceProvider.GetService(WidgetBase.KnownWidgetService[key]) as IWidgetPartDriver;
            }
            return null;
        }

        public WidgetBase CreateWidgetViewModel(WidgetBase widget)
        {
            string key = $"{widget.AssemblyName},{widget.ViewModelTypeName}";
            WidgetBase viewModel = null;
            if (WidgetBase.KnownWidgetModel.ContainsKey(key))
            {
                viewModel = _serviceProvider.GetService(WidgetBase.KnownWidgetModel[key]) as WidgetBase;
            }
            return widget.CopyTo(viewModel);
        }
    }
}
