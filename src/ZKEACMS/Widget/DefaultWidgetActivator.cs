/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
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
            if (widget == null)
            {
                throw new Exception($"Fail to create widget service. Because the widget is null.");
            }
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
            throw new Exception($"Fail to create {key} instance. May be the plugin is not exists or not regist.");
        }

        public WidgetBase CreateWidgetViewModel(WidgetBase widget)
        {
            if (widget == null)
            {
                throw new Exception($"Fail to create widget service. Because the widget is null.");
            }
            string key = $"{widget.AssemblyName},{widget.ViewModelTypeName}";
            if (WidgetBase.KnownWidgetModel.ContainsKey(key))
            {
                return widget.CopyTo(_serviceProvider.GetService(WidgetBase.KnownWidgetModel[key]) as WidgetBase);
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
                        return widget.CopyTo(_serviceProvider.GetService(WidgetBase.KnownWidgetModel[key]) as WidgetBase);
                    }
                }
            }
            throw new Exception($"Fail to create {key} instance. May be the plugin is not exists or not regist.");
        }
    }
}
