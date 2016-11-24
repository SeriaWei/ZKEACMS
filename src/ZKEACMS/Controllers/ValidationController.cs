///* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


//using Microsoft.AspNetCore.Mvc;

//namespace ZKEACMS.Controllers
//{
//    public class ValidationController : Controller
//    {
//        private readonly IValidateService _validateService;
//        public ValidationController(IValidateService validateService)
//        {
//            _validateService = validateService;
//        }

//        public ActionResult Code()
//        {

//            return File(_validateService.GenerateCode(), @"image/jpeg");
//        }
//        public JsonResult ValidCode(string code)
//        {
//            return Json(_validateService.ValidateCode(code), JsonRequestBehavior.AllowGet);
//        }
//    }
//}
