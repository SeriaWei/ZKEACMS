/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Captcha
{
    public interface ICaptchaCodeStorageProvider
    {
        void SaveCode(string code);
        string GetCode();
    }
}
