/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.ExtendField;
using ZKEACMS.Layout;
using ZKEACMS.Media;
using ZKEACMS.Page;
using ZKEACMS.Setting;
using ZKEACMS.Theme;
using ZKEACMS.Widget;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.Zone;

namespace ZKEACMS
{
    public class CMSDbContext : EasyDbContext
    {
        public CMSDbContext(DbContextOptions<CMSDbContext> dbContextOptions, IEnumerable<IOnModelCreating> modelCreatings) : base(dbContextOptions)
        {
            ModelCreatings = modelCreatings;
        }

        internal DbSet<WidgetBasePart> WidgetBasePart { get; set; }
        internal DbSet<ApplicationSetting> ApplicationSetting { get; set; }
        internal DbSet<CarouselEntity> Carousel { get; set; }
        internal DbSet<CarouselItemEntity> CarouselItem { get; set; }
        internal DbSet<CarouselWidget> CarouselWidget { get; set; }
        internal DbSet<LayoutEntity> Layout { get; set; }
        internal DbSet<LayoutHtml> LayoutHtml { get; set; }
        internal DbSet<MediaEntity> Media { get; set; }
        internal DbSet<PageEntity> Page { get; set; }
        internal DbSet<ThemeEntity> Theme { get; set; }
        internal DbSet<ZoneEntity> Zone { get; set; }
        internal DbSet<DataArchived.DataArchived> DataArchived { get; set; }
        internal DbSet<ExtendFieldEntity> ExtendField { get; set; }
        internal DbSet<HtmlWidget> HtmlWidget { get; set; }
        internal DbSet<ImageWidget> ImageWidget { get; set; }
        internal DbSet<NavigationEntity> Navigation { get; set; }
        internal DbSet<NavigationWidget> NavigationWidget { get; set; }
        internal DbSet<ScriptWidget> ScriptWidget { get; set; }
        internal DbSet<StyleSheetWidget> StyleSheetWidget { get; set; }
        internal DbSet<VideoWidget> VideoWidget { get; set; }
        internal DbSet<BreadcrumbWidget> BreadcrumbWidget { get; set; }
    }
}
