/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Captcha
{
   public static class Builder
    {
        public static void ConfigCaptcha(this IServiceCollection services)
        {
            services.AddScoped<IImageCaptchaService, ImageCaptchaService>();
            services.AddSingleton<IImageGenerator, DefaultImageGenerator>();
            services.AddScoped<ICaptchaCodeStorageProvider, SessionCaptchaCodeStorageProvider>();
        }
    }
}
