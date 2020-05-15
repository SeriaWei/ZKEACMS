using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS
{
    public interface IHostOptionProvider
    {
        public string GetDomain();
        public string GetHost();
        public string GetScheme();
        public string GetOrigin();
    }
}
