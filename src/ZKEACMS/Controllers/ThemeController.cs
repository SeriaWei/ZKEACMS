/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Mvc;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.Mvc.Extend;
using Easy.Zip;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Linq;
using System.Text;
using ZKEACMS.Theme;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class ThemeController : BasicController<ThemeEntity, string, IThemeService>
    {
        private const string ThemePath = "~/Themes";
        public ThemeController(IThemeService service)
            : base(service)
        {
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
            string path = Request.MapPath(ThemePath + "/" + id);
            if (Directory.Exists(path))
            {
                var theme = Service.Get(id);
                if (theme != null)
                {
                    string json = JsonConvert.SerializeObject(theme);
                    var writer = System.IO.File.CreateText(path + "/info.json");
                    writer.Write(json);
                    writer.Dispose();
                    ZipFile zipFile = new ZipFile();
                    zipFile.AddDirectory(new DirectoryInfo(path));
                    return File(zipFile.ToMemoryStream(), "application/zip", theme.Title + ".zip");
                }
            }
            return null;
        }
        [HttpPost]
        public JsonResult UploadTheme()
        {
            var result = new AjaxResult(AjaxStatus.Normal, "主题安装成功，正在刷新...");
            if (Request.Form.Files.Count > 0)
            {
                try
                {
                    var file = Request.Form.Files[0];
                    ZipFile zipFile = new ZipFile();
                    var files = zipFile.ToFileCollection(file.OpenReadStream());
                    var themeInfo = files.FirstOrDefault(m => m.RelativePath.EndsWith("\\info.json"));
                    string json = Encoding.UTF8.GetString(themeInfo.FileBytes);
                    var newTheme = JsonConvert.DeserializeObject<ThemeEntity>(json);
                    newTheme.IsActived = false;
                    if (Service.Count(m => m.ID == newTheme.ID) == 0)
                    {
                        Service.Add(newTheme);
                    }
                    else
                    {
                        var oldTheme = Service.Get(newTheme.ID);
                        if (oldTheme.IsActived)
                        {
                            newTheme.IsActived = true;
                        }
                        Service.Update(newTheme);
                        result.Message = "主题已更新...";
                    }
                    var themePath = Request.MapPath(ThemePath);

                    foreach (ZipFileInfo item in files)
                    {
                        string folder = Path.GetDirectoryName(themePath + item.RelativePath);
                        if (!Directory.Exists(folder))
                        {
                            Directory.CreateDirectory(folder);
                        }
                        using (
                            var fs =
                                System.IO.File.Create(themePath + item.RelativePath)
                            )
                        {
                            fs.Write(item.FileBytes, 0, item.FileBytes.Length);
                        }
                    }

                }
                catch (Exception ex)
                {
                    Logger.Error(ex);
                    result.Message = "上传的主题不正确！";
                    result.Status = AjaxStatus.Error;
                    return Json(result);
                }
            }

            return Json(result);
        }
    }
}
