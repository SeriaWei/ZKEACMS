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
    public class UrlRedirectService : ServiceBase<UrlRedirect, RedirectionDbContext>, IUrlRedirectService
    {
        public UrlRedirectService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<UrlRedirect> CurrentDbSet
        {
            get { return DbContext.UrlRedirect; }
        }
    }
}
