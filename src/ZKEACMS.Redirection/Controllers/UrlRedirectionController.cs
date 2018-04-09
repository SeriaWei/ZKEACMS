/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Easy.Constant;
using Easy.Extend;
using Easy.Mvc;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using System;
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
        private bool Valid(UrlRedirect redirect)
        {
            if (redirect.InComingUrl == redirect.DestinationURL)
            {
                ModelState.AddModelError("InComingUrl", "访问地址和跳转地址不能一样");
                return false;
            }
            if (Service.Count(m => m.InComingUrl == redirect.InComingUrl && m.ID != redirect.ID) > 0)
            {
                ModelState.AddModelError("InComingUrl", "访问地址已经存在，不可重复添加");
                return false;
            }
            return true;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewUrlRedirect)]
        public override IActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override IActionResult Edit(UrlRedirect entity)
        {
            if (!Valid(entity))
            {
                return View(entity);
            }
            return base.Edit(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override IActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override IActionResult Create(UrlRedirect entity)
        {
            if (!Valid(entity))
            {
                return View(entity);
            }
            return base.Create(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ViewUrlRedirect)]
        public override IActionResult GetList(DataTableOption query)
        {
            return base.GetList(query);
        }
        public IActionResult RedirectTo(string path)
        {
            if (path.IsNotNullAndWhiteSpace() && path.IndexOf(".html", StringComparison.OrdinalIgnoreCase) < 0 && CustomRegex.PostIdRegex.IsMatch(path))
            {
                return RedirectPermanent($"~/{(path ?? "")}.html");
            }
            var redirec = Service.GetSingle(m => m.InComingUrl == $"~/{(path ?? "").Replace(".html", string.Empty, StringComparison.OrdinalIgnoreCase)}");
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
