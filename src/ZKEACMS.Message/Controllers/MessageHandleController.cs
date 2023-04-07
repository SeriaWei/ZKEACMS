/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.Mvc.Extend;
using Easy.Mvc.ValueProvider;
using Easy.Mvc.ViewResult;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Net;
using ZKEACMS.Filter;
using ZKEACMS.Message.Models;
using ZKEACMS.Message.Service;
using ZKEACMS.Setting;

namespace ZKEACMS.Message.Controllers
{
    public class MessageHandleController : Controller
    {
        private readonly IMessageService _messageService;
        private readonly ICommentsService _commentService;
        private readonly IApplicationContextAccessor _applicationContextAccessor;
        private readonly IApplicationSettingService _applicationSettingService;
        private readonly ILocalize _localize;
        public MessageHandleController(IApplicationContextAccessor applicationContextAccessor,
            IMessageService messageService,
            ICommentsService commentsService,
            ILocalize localize,
            IApplicationSettingService applicationSettingService)
        {
            _applicationContextAccessor = applicationContextAccessor;
            _messageService = messageService;
            _commentService = commentsService;
            _localize = localize;
            _applicationSettingService = applicationSettingService;
        }
        [HttpPost, ValidateAntiForgeryToken, RenderRefererPage]
        public IActionResult PostMessage(MessageEntity entity)
        {
            if (ModelState.IsValid)
            {
                entity.Status = GetDefaultStatus();
                entity.ActionType = ActionType.Continue;//Use continue to send notification.
                var result = _messageService.Add(entity);
                ModelState.Merge(result);
                if (!result.HasViolation)
                {
                    TempData["Message"] = _localize.Get("Thank You for your submit!");
                }
            }
            return View(entity);
        }
        [HttpPost, ValidateAntiForgeryToken]
        public IActionResult PostComment(string CommentContent, string PagePath, string ReplyTo, string Title)
        {
            string referer = Request.GetReferer();
            if (referer.IsNullOrEmpty())
            {
                return new HttpBadRequestResult();
            }
            if (_applicationContextAccessor.Current.CurrentCustomer != null &&
                CommentContent.IsNotNullAndWhiteSpace() &&
                CommentContent.Length <= 500 &&
                PagePath.IsNotNullAndWhiteSpace())
            {
                _commentService.Add(new Comments
                {
                    UserId = _applicationContextAccessor.Current.CurrentCustomer.UserID,
                    Picture = _applicationContextAccessor.Current.CurrentCustomer.PhotoUrl,
                    UserName = _applicationContextAccessor.Current.CurrentCustomer.UserName,
                    PagePath = PagePath,
                    Title = Title,
                    CommentContent = CommentContent,
                    Status = (int)RecordStatus.Active
                });
                return Redirect(referer);
            }
            else
            {
                return RedirectToAction("SignIn", "Account", new { ReturnUrl = new Uri(referer).AbsolutePath });
            }
        }

        private int GetDefaultStatus()
        {
            if (_applicationSettingService.Get(SettingKeys.MessageNeedToBeReviewed, "true") == "true")
            {
                return (int)RecordStatus.InActive;
            }
            return (int)RecordStatus.Active;
        }
    }
}
