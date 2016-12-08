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
        internal DbSet<SectionContentBasePart> SectionContentBasePart { get; set; }
        internal DbSet<SectionContentCallToAction> SectionContentCallToAction { get; set; }
        internal DbSet<SectionContentImage> SectionContentImage { get; set; }
        internal DbSet<SectionContentParagraph> SectionContentParagraph { get; set; }
        internal DbSet<SectionContentTitle> SectionContentTitle { get; set; }
        internal DbSet<SectionContentVideo> SectionContentVideo { get; set; }
        internal DbSet<SectionGroup> SectionGroup { get; set; }
        internal DbSet<SectionTemplate> SectionTemplate { get; set; }
        internal DbSet<Models.SectionWidget> SectionWidget { get; set; }
    }
}
