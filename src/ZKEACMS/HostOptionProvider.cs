using Easy;
using Easy.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Options;

namespace ZKEACMS
{
    public class HostOptionProvider : IHostOptionProvider
    {
        private readonly IOptions<HostOption> _hostOptions;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public HostOptionProvider(IOptions<HostOption> hostOptions, IHttpContextAccessor httpContextAccessor)
        {
            _hostOptions = hostOptions;
            _httpContextAccessor = httpContextAccessor;
        }
        public string GetDomain()
        {
            if (_hostOptions.Value != null && _hostOptions.Value.Domain.IsNotNullAndWhiteSpace())
            {
                return _hostOptions.Value.Domain;
            }
            return _httpContextAccessor.HttpContext.Request.Host.Host;
        }

        public string GetHost()
        {
            if (_hostOptions.Value != null && _hostOptions.Value.Domain.IsNotNullAndWhiteSpace())
            {
                if (_hostOptions.Value.Port.HasValue && _hostOptions.Value.Port.Value != 80)
                {
                    return "{0}:{1}".FormatWith(_hostOptions.Value.Domain, _hostOptions.Value.Port.Value);
                }
                return _hostOptions.Value.Domain;
            }
            return _httpContextAccessor.HttpContext.Request.Host.ToString();
        }

        public string GetOrigin()
        {
            return $"{GetScheme()}://{GetHost()}";
        }

        public string GetScheme()
        {
            if (_hostOptions.Value != null && _hostOptions.Value.Scheme.IsNotNullAndWhiteSpace())
            {
                return _hostOptions.Value.Scheme;
            }
            return _httpContextAccessor.HttpContext.Request.Scheme;
        }

        public Uri ToAbsoluteUri(string relativePath)
        {
            string path = Helper.Url.ToAbsolutePath(relativePath);
            return new Uri($"{GetOrigin()}{path}", UriKind.Absolute);
        }
    }
}
