/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace Easy.Logging
{
    public sealed class FileLoggerProvider : ILoggerProvider
    {
        private readonly string _contentRootPath;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public FileLoggerProvider(IWebHostEnvironment environment, IHttpContextAccessor httpContextAccessor)
        {
            _contentRootPath = environment.ContentRootPath;
            _httpContextAccessor = httpContextAccessor;
        }
        public ILogger CreateLogger(string categoryName)
        {
            return new FileLogger(_httpContextAccessor, _contentRootPath, categoryName);
        }

        public void Dispose()
        {

        }
    }
}
