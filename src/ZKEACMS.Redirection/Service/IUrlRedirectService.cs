using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection.Service
{
    public interface IUrlRedirectService : IService<UrlRedirect>
    {
        IEnumerable<UrlRedirect> GetAll();
    }
}
