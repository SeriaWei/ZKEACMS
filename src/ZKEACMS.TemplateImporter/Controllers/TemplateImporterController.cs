using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Controllers;
using ZKEACMS.TemplateImporter.Service;
using Easy.Mvc.Authorize;
using ZKEACMS.TemplateImporter.Models;
using System.IO;
using Microsoft.AspNetCore.Http;

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
