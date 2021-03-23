/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

namespace ZKEACMS.Captcha
{
    public interface IImageCaptchaService
    {
        byte[] GenerateCode(int num);
        bool ValidateCode(string code);
    }
}
