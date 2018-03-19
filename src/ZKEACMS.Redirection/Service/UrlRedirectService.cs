using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection.Service
{
    public class UrlRedirectService : ServiceBase<UrlRedirect>, IUrlRedirectService
    {
        public UrlRedirectService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
    }
}
