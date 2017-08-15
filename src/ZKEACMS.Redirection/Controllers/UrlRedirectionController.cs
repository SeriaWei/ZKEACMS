/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Easy.Constant;
using Easy.Extend;
using Easy.Mvc;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.Service;
using ZKEACMS.Redirection.Models;
using ZKEACMS.Redirection.Service;

namespace ZKEACMS.Redirection.Controllers
{
    public class UrlRedirectionController : BasicController<UrlRedirect, int, IUrlRedirectService>
    {
        public UrlRedirectionController(IUrlRedirectService service) : base(service)
        {
        }
        private void Valid(UrlRedirect redirect)
        {
            if (redirect.InComingUrl == redirect.DestinationURL)
            {
                ModelState.AddModelError("InComingUrl", "访问地址和跳转地址不能一样");
            }
            if(Service.Count(m=>m.InComingUrl==redirect.InComingUrl&&m.ID!= redirect.ID) > 0)
            {
                ModelState.AddModelError("InComingUrl", "访问地址已经存在，不可重复添加");
            }
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewUrlRedirect)]
        public override ActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override ActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override ActionResult Edit(UrlRedirect entity)
        {
            //Valid(entity);
            return base.Edit(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override ActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override ActionResult Create(UrlRedirect entity)
        {
            //Valid(entity);
            return base.Create(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ViewUrlRedirect)]
        public override JsonResult GetList(DataTableOption query)
        {
            return base.GetList(query);
        }
        public IActionResult RedirectTo(string path)
        {
            var redirec = Service.GetSingle(m => m.InComingUrl == $"~/{(path ?? "")}");
            if (redirec.IsPermanent)
            {
                return RedirectPermanent(redirec.DestinationURL);
            }
            else
            {
                return Redirect(redirec.DestinationURL);
            }

        }
    }
}
