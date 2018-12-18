/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */
using Easy.Constant;
using Easy.Extend;
using Easy.Mvc.Extend;
using Easy.Mvc.ValueProvider;
using Microsoft.AspNetCore.Mvc;
using System;
using ZKEACMS.Message.Models;
using ZKEACMS.Message.Service;

namespace ZKEACMS.Message.Controllers
{
    public class MessageHandleController : Controller
    {
        private readonly IMessageService _messageService;
        private readonly ICommentsService _commentService;
        private readonly IApplicationContextAccessor _applicationContextAccessor;
        private readonly ICookie _cookie;
        public MessageHandleController(IApplicationContextAccessor applicationContextAccessor, IMessageService messageService, ICommentsService commentsService, ICookie cookie)
        {
            _applicationContextAccessor = applicationContextAccessor;
            _messageService = messageService;
            _commentService = commentsService;
            _cookie = cookie;
        }
        [HttpPost, ValidateAntiForgeryToken]
        public IActionResult PostMessage(MessageEntity entity, string redirect)
        {
            if (ModelState.IsValid)
            {
                _cookie.SetValue("Message", "true", 1);
                entity.Status = (int)RecordStatus.InActive;
                _messageService.Add(entity);
            }
            return Redirect(redirect);
        }
        [HttpPost, ValidateAntiForgeryToken]
        public IActionResult PostComment(string CommentContent, string PagePath, string ReplyTo, string Title)
        {
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
                return Redirect(Request.GetReferer());
            }
            else
            {
                return RedirectToAction("SignIn", "Account", new { ReturnUrl = new Uri(Request.GetReferer()).AbsolutePath });
            }
        }
    }
}
