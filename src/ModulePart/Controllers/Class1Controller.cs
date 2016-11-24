using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Reflection;

namespace ModulePart.Controllers
{
    public class Class1Controller : Controller
    {
        public Class1Controller()
        {
            
        }
        public ActionResult Index()
        {
            return View();
        }
    }
}
