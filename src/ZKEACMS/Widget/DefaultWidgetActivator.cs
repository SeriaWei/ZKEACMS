using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using ZKEACMS.WidgetTemplate;
using System.Linq;

namespace ZKEACMS.Widget
{
    public class DefaultWidgetActivator : IWidgetActivator
    {
        private readonly IServiceProvider _serviceProvider;
        public DefaultWidgetActivator(IServiceProvider serviceProvider)
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
            else
            {
                var template = _serviceProvider.GetService<IWidgetTemplateService>().Get(m => m.PartialView == widget.PartialView).FirstOrDefault();
                if (template != null)
                {
                    widget.AssemblyName = template.AssemblyName;
                    widget.ServiceTypeName = template.ServiceTypeName;
                    widget.ViewModelTypeName = template.ViewModelTypeName;
                    key = $"{widget.AssemblyName},{widget.ServiceTypeName}";
                    if (WidgetBase.KnownWidgetService.ContainsKey(key))
                    {
                        return _serviceProvider.GetService(WidgetBase.KnownWidgetService[key]) as IWidgetPartDriver;
                    }
                }
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
            else
            {
                var template = _serviceProvider.GetService<IWidgetTemplateService>().Get(m => m.PartialView == widget.PartialView).FirstOrDefault();
                if (template != null)
                {
                    widget.AssemblyName = template.AssemblyName;
                    widget.ServiceTypeName = template.ServiceTypeName;
                    widget.ViewModelTypeName = template.ViewModelTypeName;
                    key = $"{widget.AssemblyName},{widget.ServiceTypeName}";
                    if (WidgetBase.KnownWidgetService.ContainsKey(key))
                    {
                        viewModel = _serviceProvider.GetService(WidgetBase.KnownWidgetModel[key]) as WidgetBase;
                    }
                }
            }
            return viewModel == null ? null : widget.CopyTo(viewModel);
        }
    }
}
