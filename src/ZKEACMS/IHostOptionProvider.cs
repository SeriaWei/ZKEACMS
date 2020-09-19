using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS
{
    public interface IHostOptionProvider
    {
        /// <summary>
        /// Site domain
        /// </summary>
        /// <returns></returns>
        public string GetDomain();
        /// <summary>
        /// Domain with port when port is not 80
        /// </summary>
        /// <returns></returns>
        public string GetHost();
        /// <summary>
        /// http or https
        /// </summary>
        /// <returns></returns>
        public string GetScheme();
        /// <summary>
        /// Scheme with host
        /// </summary>
        /// <returns></returns>
        public string GetOrigin();

        public Uri ToAbsoluteUri(string relativePath);
    }
}
