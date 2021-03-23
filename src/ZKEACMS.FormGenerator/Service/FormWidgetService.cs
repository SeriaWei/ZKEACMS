/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy;
using ZKEACMS.Widget;
using ZKEACMS.FormGenerator.Models;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormWidgetService : SimpleWidgetService<FormWidget>
    {
        private readonly IFormService _formService;
        public FormWidgetService(IWidgetBasePartService widgetBasePartService,
            IApplicationContext applicationContext,
            CMSDbContext dbContext,
            IFormService formService)
            : base(widgetBasePartService, applicationContext, dbContext)
        {
            _formService = formService;
        }

        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            if(widgetDisplayContext.FormModel is Form form)
            {
                return form;
            }
            form = _formService.Get((widgetDisplayContext.Widget as FormWidget).FormID);
            return form;
        }
    }
}
