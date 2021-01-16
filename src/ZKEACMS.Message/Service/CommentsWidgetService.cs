/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy;
using Easy.Constant;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Message.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Service
{
    public class CommentsWidgetService : SimpleWidgetService<CommentsWidget>
    {
        private readonly ICommentsService _commentsService;
        public CommentsWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext, ICommentsService commentsService) : base(widgetBasePartService, applicationContext, dbContext)
        {
            _commentsService = commentsService;
        }
        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            var actionContext = widgetDisplayContext.ActionContext;
            var comments = _commentsService.Get(m => m.PagePath == actionContext.HttpContext.Request.Path.Value && m.Status == (int)RecordStatus.Active);
            return comments;
        }
    }
}
