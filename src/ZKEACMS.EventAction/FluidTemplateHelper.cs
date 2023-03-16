/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Fluid;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using ZKEACMS.EventAction.TemplateEngine;

namespace ZKEACMS.EventAction
{
    internal static class FluidTemplateHelper
    {
        private static readonly FluidParser _fluidParser = new FluidParser();
        public static string Render(this IFluidTemplate template, object model)
        {
            TemplateOptions templateOptions = new TemplateOptions();
            templateOptions.MemberAccessStrategy.Register(typeof(ViewModelAccessor), new ViewModelAccessor());
            var context = new TemplateContext(model, templateOptions);
            var viewModel = new TemplateViewModel { Model = model };
            context.SetValue("this", new ViewModelAccessor(JObject.FromObject(viewModel)));
            return template.Render(context, HtmlEncoder.Default);
        }

        public static bool TryParse(string template, out IFluidTemplate fluidTemplate, out string error)
        {
            return _fluidParser.TryParse(template, out fluidTemplate, out error);
        }
    }
}
