using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.SectionWidget.Models;

namespace ZKEACMS.SectionWidget
{
    public class SectionDbContext : CMSDbContext
    {
        public DbSet<SectionContentBasePart> SectionContentBasePart { get; set; }
        public DbSet<SectionContentCallToAction> SectionContentCallToAction { get; set; }
        public DbSet<SectionContentImage> SectionContentImage { get; set; }
        public DbSet<SectionContentParagraph> SectionContentParagraph { get; set; }
        public DbSet<SectionContentTitle> SectionContentTitle { get; set; }
        public DbSet<SectionContentVideo> SectionContentVideo { get; set; }
        public DbSet<SectionGroup> SectionGroup { get; set; }
        public DbSet<SectionTemplate> SectionTemplate { get; set; }
        public DbSet<Models.SectionWidget> SectionWidget { get; set; }
    }
}
