using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Common.Models;
using ZKEACMS.Layout;
using ZKEACMS.Widget;

namespace ZKEACMS
{
    class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<LayoutHtml>().Ignore(m => m.Description).Ignore(m => m.Status).Ignore(m => m.Title);
        }
    }
}
