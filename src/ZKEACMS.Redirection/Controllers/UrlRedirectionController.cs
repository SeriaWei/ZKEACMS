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
using ZKEACMS.Extend;
using Easy;

namespace ZKEACMS.Redirection.Controllers
{
    public class UrlRedirectionController : BasicController<UrlRedirect, int, IUrlRedirectService>
    {
        private readonly ILocalize _localize;
        public UrlRedirectionController(IUrlRedirectService service,ILocalize localize) : base(service)
        {
            _localize = localize;
        }
        private bool Valid(UrlRedirect redirect)
        {
            if (Url.Content(redirect.InComingUrl) == Url.Content(redirect.DestinationURL))
            {
                ModelState.AddModelError("InComingUrl", _localize.Get("访问地址和跳转地址不能一样"));
                return false;
            }
            if (Service.Count(m => m.InComingUrl == redirect.InComingUrl && m.ID != redirect.ID) > 0)
            {
                ModelState.AddModelError("InComingUrl", _localize.Get("访问地址已经存在，不可重复添加"));
                return false;
            }
            return true;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewUrlRedirect)]
        public override IActionResult Index()
        {
            return base.Index();
        }
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override IActionResult Edit(UrlRedirect entity)
        {
            if (ModelState.IsValid)
            {
                if (!Valid(entity))
                {
                    return View(entity);
                }
                return base.Edit(entity);
            }
            return View(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override IActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageUrlRedirect)]
        public override IActionResult Create(UrlRedirect entity)
        {
            if (ModelState.IsValid)
            {
                if (!Valid(entity))
                {
                    return View(entity);
                }
                return base.Create(entity);
            }
            return View(entity);
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
                return RedirectPermanent($"~/{(path ?? "").Trim()}.html");
            }
            path = $"~/{(path ?? "").TrimEnd('/')}";
            var redirec = Service.GetAll().Where(m => m.InComingUrl == path).FirstOrDefault();
            if (redirec != null)
            {
                if (redirec.IsPermanent)
                {
                    return RedirectPermanent(redirec.DestinationURL);
                }
                else
                {
                    return Redirect(redirec.DestinationURL);
                }
            }
            return this.NotFoundResult();
        }
    }
}
