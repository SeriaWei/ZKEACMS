/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using ZKEACMS.Message.Models;
using ZKEACMS.Message.ViewModel;
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
            int page = widgetDisplayContext.ActionContext.RouteData.GetPage();
            Pagination pagination = new Pagination()
            {
                PageIndex = page,
                PageSize = 20,
                OrderByDescending = "CreateDate"
            };
            var messages = _messageService.Get(m => m.Status == (int)RecordStatus.Active, pagination);
            return new MessageBoxWidgetViewModel
            {
                Messages = messages,
                Pagination = pagination
            };
        }
    }
}