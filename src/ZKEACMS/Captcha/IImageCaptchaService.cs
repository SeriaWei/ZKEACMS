/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

namespace ZKEACMS.Captcha
{
    public interface IImageCaptchaService
    {
        byte[] GenerateCode(int num);
        bool ValidateCode(string code);
    }
}
