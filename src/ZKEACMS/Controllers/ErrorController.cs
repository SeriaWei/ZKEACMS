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
        public IActionResult Index(int? code)
        {
            var result = View("Index");
            result.StatusCode = code ?? 500;
            return result;
        }

        public IActionResult NotFond()
        {
            var result = View("NotFound");
            result.StatusCode = 404;
            return result;
        }

        public IActionResult Forbidden()
        {
            var result = View("Forbidden");
            result.StatusCode = 403;
            return result;
        }
        public IActionResult Code(int code)
        {
            switch (code)
            {
                case 404: return NotFond();
                case 403: return Forbidden();
                case 401: return Unauthorized();
                default: return Index(code);
            }
        }
    }
}
