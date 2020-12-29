/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Message.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Service
{
    public class MessageWidgetService : SimpleWidgetService<MessageWidget>
    {
        public MessageWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetBasePartService, applicationContext, dbContext)
        {
        }
        public override WidgetViewModelPart Display(WidgetDisplayContext widgetDisplayContext)
        {
            if (widgetDisplayContext.Model is MessageEntity messageEntity)
            {
                return widgetDisplayContext.ToWidgetViewModelPart(messageEntity);
            }

            return widgetDisplayContext.ToWidgetViewModelPart(new MessageEntity());
        }
    }
}