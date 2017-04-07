using Easy.Constant;
using Easy.Mvc.ValueProvider;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Message.Models;
using ZKEACMS.Message.Service;

namespace ZKEACMS.Message.Controllers
{
    public class MessageHandleController : Controller
    {
        private readonly IMessageService _messageService;
        private readonly ICookie _cookie;
        public MessageHandleController(IMessageService messageService, ICookie cookie)
        {
            _messageService = messageService;
            _cookie = cookie;
        }

        public ActionResult PostMessage(MessageEntity entity, string redirect)
        {
            if (ModelState.IsValid)
            {
                _cookie.SetValue("Message", "true", 1);
                entity.Status = (int)RecordStatus.InActive;
                _messageService.Add(entity);
            }
            return Redirect(redirect);
        }

    }
}
