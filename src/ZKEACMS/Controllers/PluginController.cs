using Easy.Mvc.Plugin;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Controllers
{
    public class PluginController : Controller
    {
        private readonly IPluginLoader _pluginLoader;
        public PluginController(IPluginLoader pluginLoader)
        {
            _pluginLoader = pluginLoader;
        }
        public IActionResult Index()
        {
            return View(_pluginLoader.GetPlugins());
        }
    }
}
