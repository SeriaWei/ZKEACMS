using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Logging
{
   public class FileLoggerProvider : ILoggerProvider
    {
        private readonly IHostingEnvironment _environment;
        public FileLoggerProvider(IHostingEnvironment environment)
        {
            _environment = environment;
        }
        public ILogger CreateLogger(string categoryName)
        {
            return new FileLogger(_environment);
        }

        public void Dispose()
        {
            
        }
    }
}
