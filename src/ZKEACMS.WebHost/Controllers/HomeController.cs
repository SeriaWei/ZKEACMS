using Easy.Mvc.ValueProvider;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Page;

namespace ZKEACMS.WebHost.Controllers
{
    public class HomeController : Easy.Mvc.Controllers.BasicController<PageEntity, string, IPageService>
    {
        public HomeController(IPageService pageService, ICookie cookie) : base(pageService)
        {

        }
        public override ActionResult Index()
        {
            return View();
        }
    }
}
