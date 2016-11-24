///* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
//using Easy.Extend;

//namespace ZKEACMS.Validate
//{
//    public class DefaultValidateService : IValidateService
//    {
//        const string ValidateCodeKey = "Session_ValidateCode";
//        public byte[] GenerateCode()
//        {
//            ValidateCode validateCode = new ValidateCode();
//            string code = validateCode.CreateValidateCode(5);
//            HttpContext.Current.Session[ValidateCodeKey] = code;
//            return validateCode.CreateValidateGraphic(code);
//        }

//        public bool ValidateCode(string code)
//        {
//            if (code.IsNullOrWhiteSpace()) return false;
//            return code.Equals(HttpContext.Current.Session[ValidateCodeKey]);
//        }
//    }
//}
