using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Redirection.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.Redirection
{
    public class RedirectionDbContext : CMSDbContext
    {
        public RedirectionDbContext(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring) : base(modelCreatings, configuring)
        {
        }

        internal DbSet<UrlRedirect> UrlRedirect { get; set; }
    }
}
