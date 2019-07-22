using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.SectionWidget.Models;

namespace ZKEACMS.SectionWidget
{
    public class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SectionContentBasePart>();
            modelBuilder.Entity<SectionContentCallToAction>();
            modelBuilder.Entity<SectionContentImage>();
            modelBuilder.Entity<SectionContentParagraph>();
            modelBuilder.Entity<SectionContentTitle>();
            modelBuilder.Entity<SectionContentVideo>();
            modelBuilder.Entity<SectionGroup>();
            modelBuilder.Entity<SectionTemplate>();
            modelBuilder.Entity<Models.SectionWidget>();
        }
    }
}
