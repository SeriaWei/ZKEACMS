using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Sitemap.Models;

namespace ZKEACMS.Sitemap.Service
{
    public interface ISiteUrlProvider
    {
        IEnumerable<SiteUrl> Get();
    }
}
