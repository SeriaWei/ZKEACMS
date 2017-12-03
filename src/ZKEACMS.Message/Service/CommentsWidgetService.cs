using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Message.Models;
using ZKEACMS.Widget;
using Easy.Constant;

namespace ZKEACMS.Message.Service
{
    public class CommentsWidgetService : SimpleWidgetService<CommentsWidget>
    {
        private readonly ICommentsService _commentsService;
        public CommentsWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, MessageDbContext dbContext, ICommentsService commentsService) : base(widgetBasePartService, applicationContext, dbContext)
        {
            _commentsService = commentsService;
        }
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            return widget.ToWidgetViewModelPart(_commentsService.Get(m => m.PagePath == actionContext.HttpContext.Request.Path.Value && m.Status == (int)RecordStatus.Active));
        }
    }
}
