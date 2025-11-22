/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using ZKEACMS.Common.Models;
using ZKEACMS.ExtendField;
using ZKEACMS.Layout;
using ZKEACMS.Media;
using ZKEACMS.Options;
using ZKEACMS.Page;
using ZKEACMS.PendingTask;
using ZKEACMS.Setting;
using ZKEACMS.Theme;
using ZKEACMS.Widget;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.Zone;

namespace ZKEACMS
{
    public class CMSDbContext : EasyDbContext
    {
        private readonly DatabaseOption _databaseOption;
        public CMSDbContext(DbContextOptions<CMSDbContext> dbContextOptions,
            IEnumerable<IOnModelCreating> modelCreatings,
            DatabaseOption databaseOption)
            : base(dbContextOptions)
        {
            ModelCreatings = modelCreatings;
            _databaseOption = databaseOption;
        }

        public DbSet<WidgetBasePart> WidgetBasePart { get; set; }
        public DbSet<ApplicationSetting> ApplicationSetting { get; set; }
        public DbSet<CarouselEntity> Carousel { get; set; }
        public DbSet<CarouselItemEntity> CarouselItem { get; set; }
        public DbSet<CarouselWidget> CarouselWidget { get; set; }
        public DbSet<LayoutEntity> Layout { get; set; }
        public DbSet<LayoutHtml> LayoutHtml { get; set; }
        public DbSet<MediaEntity> Media { get; set; }
        public DbSet<PageEntity> Page { get; set; }
        public DbSet<ThemeEntity> Theme { get; set; }
        public DbSet<ZoneEntity> Zone { get; set; }
        public DbSet<DataArchived.DataArchived> DataArchived { get; set; }
        public DbSet<ExtendFieldEntity> ExtendField { get; set; }
        public DbSet<HtmlWidget> HtmlWidget { get; set; }
        public DbSet<ImageWidget> ImageWidget { get; set; }
        public DbSet<NavigationEntity> Navigation { get; set; }
        public DbSet<NavigationWidget> NavigationWidget { get; set; }
        public DbSet<ScriptWidget> ScriptWidget { get; set; }
        public DbSet<StyleSheetWidget> StyleSheetWidget { get; set; }
        public DbSet<VideoWidget> VideoWidget { get; set; }
        public DbSet<BreadcrumbWidget> BreadcrumbWidget { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            var tableNamingConverter = new NamingConverter(_databaseOption.TableNaming);
            var columnNamingConverter = new NamingConverter(_databaseOption.ColumnNaming);
            foreach (var entity in modelBuilder.Model.GetEntityTypes())
            {
                if (tableNamingConverter.Strategy != NameCaseStrategy.None)
                {
                    entity.SetTableName(tableNamingConverter.ConvertName(entity.GetTableName()));
                }
                foreach (var property in entity.GetProperties())
                {
                    if (columnNamingConverter.Strategy != NameCaseStrategy.None)
                    {
                        property.SetColumnName(columnNamingConverter.ConvertName(property.GetColumnName()));
                    }
                }
            }
        }
    }
}
