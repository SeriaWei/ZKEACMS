using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Controllers;
using ZKEACMS.TemplateImporter.Service;
using Easy.Mvc.Authorize;
using ZKEACMS.TemplateImporter.Models;

namespace ZKEACMS.TemplateImporter.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewTemplateImporter)]
    public class TemplateImporterController : Controller
    {
        
    }
}
