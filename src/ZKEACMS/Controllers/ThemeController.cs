/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using System;
using ZKEACMS.PackageManger;
using ZKEACMS.Theme;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewTheme)]
    public class ThemeController : BasicController<ThemeEntity, string, IThemeService>
    {
        private readonly IWebHostEnvironment _hostingEnvironment;
        private readonly IPackageInstallerProvider _packageInstallerProvider;

        public ThemeController(IThemeService service, IWebHostEnvironment hostingEnvironment,
            IPackageInstallerProvider packageInstallerProvider)
            : base(service)
        {
            _packageInstallerProvider = packageInstallerProvider;
            _hostingEnvironment = hostingEnvironment;
        }

        public override IActionResult Index()
        {
            return View(Service.Get());
        }

        public IActionResult PreView(string id)
        {
            Service.SetPreview(id);
            return Redirect("~/");
        }

        public IActionResult CancelPreView()
        {
            Service.CancelPreview();
            return RedirectToAction("Index");
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageTheme)]
        public JsonResult ChangeTheme(string id)
        {
            var result = new AjaxResult(AjaxStatus.Normal, "切换主题中...");
            try
            {
                Service.ChangeTheme(id);
                result.Message = "切换主题成功!";
            }
            catch (Exception e)
            {
                result.Status = AjaxStatus.Error;
                result.Message = string.Format("切换主题失败-[{0}]", e.Message);
            }
            return Json(result);
        }

        public IActionResult ThemePackage(string id)
        {
            if (_hostingEnvironment.IsDevelopment())
            {
                var package = _packageInstallerProvider.CreateInstaller("ThemePackageInstaller").Pack(id) as ThemePackage;
                return File(package.ToFilePackage(), "Application/zip", package.Theme.Title + ".theme");
            }
            return NotFound();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageTheme)]
        public JsonResult UploadTheme()
        {
            var result = new AjaxResult(AjaxStatus.Normal, "主题安装成功，正在刷新...");
            if (Request.Form.Files.Count > 0)
            {
                try
                {
                    ThemePackage package;
                    var installer = _packageInstallerProvider.CreateInstaller(Request.Form.Files[0].OpenReadStream(), out package);
                    installer.Install(package);
                }
                catch (Exception ex)
                {
                    result.Message = "上传的主题不正确！" + ex.Message;
                    result.Status = AjaxStatus.Error;
                    return Json(result);
                }
            }

            return Json(result);
        }

        [HttpPost, AllowAnonymous]
        public JsonResult GetCurrentTheme()
        {
            return Json(Url.Content(Service.GetCurrentTheme().Url));
        }
    }
}
