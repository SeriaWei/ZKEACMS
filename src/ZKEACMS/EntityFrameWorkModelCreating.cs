/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Layout;

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
