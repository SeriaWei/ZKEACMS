using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection
{
    public class RedirectionDbContext : CMSDbContext
    {
        internal DbSet<UrlRedirect> UrlRedirect { get; set; }
    }
}
