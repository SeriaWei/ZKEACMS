using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection
{
    public class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UrlRedirect>();
        }
    }
}
