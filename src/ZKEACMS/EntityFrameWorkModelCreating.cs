/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

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
using ZKEACMS.Zone;

namespace ZKEACMS
{
    class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<LayoutHtml>().Ignore(m => m.Description).Ignore(m => m.Status).Ignore(m => m.Title);

            modelBuilder.Entity<WidgetBasePart>();
            modelBuilder.Entity<ApplicationSetting>();
            modelBuilder.Entity<CarouselEntity>();
            modelBuilder.Entity<CarouselItemEntity>();
            modelBuilder.Entity<CarouselWidget>();
            modelBuilder.Entity<LayoutEntity>();
            modelBuilder.Entity<MediaEntity>();
            modelBuilder.Entity<PageEntity>();
            modelBuilder.Entity<ThemeEntity>();
            modelBuilder.Entity<ZoneEntity>();
            modelBuilder.Entity<DataArchived.DataArchived>();
            modelBuilder.Entity<ExtendFieldEntity>();
            modelBuilder.Entity<HtmlWidget>();
            modelBuilder.Entity<ImageWidget>();
            modelBuilder.Entity<NavigationEntity>();
            modelBuilder.Entity<NavigationWidget>();
            modelBuilder.Entity<ScriptWidget>();
            modelBuilder.Entity<StyleSheetWidget>();
            modelBuilder.Entity<VideoWidget>();
            modelBuilder.Entity<Rule.Rule>();
        }
    }
}
