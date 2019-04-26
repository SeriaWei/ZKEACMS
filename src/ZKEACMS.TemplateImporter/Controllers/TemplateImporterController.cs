using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using System.Threading.Tasks;
using ZKEACMS.TemplateImporter.Service;

namespace ZKEACMS.TemplateImporter.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ImportStaticHtmlTemplate)]
    public class TemplateImporterController : Controller
    {
        public readonly ITemplateImporterService _templateImporterService;
        public TemplateImporterController(ITemplateImporterService templateImporterService)
        {
            _templateImporterService = templateImporterService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Index(IFormFile file)
        {
            if (file != null)
            {
                var filePath = Path.GetTempFileName();
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }
                try
                {
                    _templateImporterService.Import(filePath);
                }
                catch(Exception ex)
                {
                    ViewBag.Message = ex.Message;
                    return View();
                }
                finally
                {
                    System.IO.File.Delete(filePath);
                }

                return RedirectToAction("Index", "Page", new { module = "admin" });
            }
            return RedirectToAction("Index");
        }
    }
}
