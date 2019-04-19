/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */
using ZKEACMS.Message.Models;
using ZKEACMS.Message.Service;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Message.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewMessage)]
    public class MessageController : BasicController<MessageEntity, int, IMessageService>
    {
        public MessageController(IMessageService service) : base(service)
        {
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageMessage)]
        public override IActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageMessage)]
        public override IActionResult Create(MessageEntity entity)
        {
            return base.Create(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageMessage)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageMessage)]
        public override IActionResult Edit(MessageEntity entity)
        {
            return base.Edit(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageMessage)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
