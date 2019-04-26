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

namespace ZKEACMS.TemplateImporter.Controllers
{
    //[DefaultAuthorize(Policy = PermissionKeys.ViewTemplateImporter)]
    public class TemplateImporterController : Controller
    {
        public readonly ITemplateImporterService _templateImporterService;
        public TemplateImporterController(ITemplateImporterService templateImporterService)
        {
            _templateImporterService = templateImporterService;
        }
        public IActionResult Index()
        {
            _templateImporterService.Import(Path.Combine(PluginBase.GetPath<TemplateImporterPlug>(), "Content", "vacayhome.zip"));
            return View();
        }
    }
}
