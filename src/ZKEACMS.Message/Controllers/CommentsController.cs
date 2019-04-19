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
    [DefaultAuthorize(Policy = PermissionKeys.ViewComments)]
    public class CommentsController : BasicController<Comments, int, ICommentsService>
    {
        public CommentsController(ICommentsService service) : base(service)
        {
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageComments)]
        public override IActionResult Create()
        {
            return base.Create();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageComments)]
        public override IActionResult Create(Comments entity)
        {
            return base.Create(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageComments)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageComments)]
        public override IActionResult Edit(Comments entity)
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
