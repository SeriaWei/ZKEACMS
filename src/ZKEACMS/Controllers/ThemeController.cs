/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Mvc;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.Mvc.Extend;
using Easy.Zip;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Linq;
using System.Text;
using ZKEACMS.Theme;
using Easy.Extend;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class ThemeController : BasicController<ThemeEntity, string, IThemeService>
    {
        private const string ThemePath = "~/Themes";
        private readonly IHostingEnvironment _hostingEnvironment;
        public ThemeController(IThemeService service, IHostingEnvironment hostingEnvironment)
            : base(service)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        public override ActionResult Index()
        {
            return View(Service.GetAll());
        }

        public ActionResult PreView(string id)
        {
            Service.SetPreview(id);
            return Redirect("~/");
        }

        public ActionResult CancelPreView()
        {
            Service.CancelPreview();
            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeTheme(string id)
        {
            Service.ChangeTheme(id);
            return Json(true);
        }

        public FileResult ThemePackage(string id)
        {
            var package = new ThemePackageInstaller(_hostingEnvironment, Service).Pack(id) as ThemePackage;
            return File(JsonConvert.SerializeObject(package).ToByte(), "Application/zip", package.Theme.Title + ".theme");
        }
        [HttpPost]
        public JsonResult UploadTheme()
        {
            var result = new AjaxResult(AjaxStatus.Normal, "主题安装成功，正在刷新...");
            if (Request.Form.Files.Count > 0)
            {
                try
                {
                    StreamReader reader = new StreamReader(Request.Form.Files[0].OpenReadStream());
                    var theme = JsonConvert.DeserializeObject<ThemePackage>(reader.ReadToEnd());
                    new ThemePackageInstaller(_hostingEnvironment, Service).Install(theme);
                }
                catch (Exception ex)
                {
                    Logger.Error(ex);
                    result.Message = "上传的主题不正确！" + ex.Message;
                    result.Status = AjaxStatus.Error;
                    return Json(result);
                }
            }

            return Json(result);
        }
    }
}
