﻿using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Logging
{
    public class FileLoggerProvider : ILoggerProvider
    {
        private readonly IHostingEnvironment _environment;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public FileLoggerProvider(IHostingEnvironment environment, IHttpContextAccessor httpContextAccessor)
        {
            _environment = environment;
            _httpContextAccessor = httpContextAccessor;
        }
        public ILogger CreateLogger(string categoryName)
        {
            return new FileLogger(_environment, _httpContextAccessor);
        }

        public void Dispose()
        {

        }
    }
}
