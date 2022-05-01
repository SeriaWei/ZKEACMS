/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using ZKEACMS.Message.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Service
{
    public class MessageBoxWidgetService : SimpleWidgetService<MessageBoxWidget>
    {
        private readonly IMessageService _messageService;
        public MessageBoxWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, IMessageService messageService, CMSDbContext dbContext)
            : base(widgetBasePartService, applicationContext, dbContext)
        {
            _messageService = messageService;
        }

        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            return _messageService.Get(m => m.Status == (int)RecordStatus.Active)
                .OrderByDescending(m => m.CreateDate)
                .ToList();
        }
    }
}