/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Controllers
{

    public class ErrorController : Controller
    {
        public ErrorController()
        {
        }
        public IActionResult Index()
        {
            var result = View();
            result.StatusCode = 500;
            return result;
        }

        public IActionResult NotFond()
        {
            var result = View();
            result.StatusCode = 404;
            return result;
        }

        public IActionResult Forbidden()
        {
            var result = View();
            result.StatusCode = 403;
            return result;
        }
    }
}
