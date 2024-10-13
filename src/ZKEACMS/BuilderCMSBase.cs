/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Storage;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using ZKEACMS.Account;
using ZKEACMS.Article.Models;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;
using ZKEACMS.Common.ViewModels;
using ZKEACMS.Currency;
using ZKEACMS.Dashboard;
using ZKEACMS.DataArchived;
using ZKEACMS.ExtendField;
using ZKEACMS.Layout;
using ZKEACMS.Media;
using ZKEACMS.Options;
using ZKEACMS.PackageManger;
using ZKEACMS.Page;
using ZKEACMS.PendingTask;
using ZKEACMS.Product.Models;
using ZKEACMS.Setting;
using ZKEACMS.Sitemap.Service;
using ZKEACMS.SMTP;
using ZKEACMS.Theme;
using ZKEACMS.Widget;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.Zone;

namespace ZKEACMS
{
    public static class BuilderCMSBase
    {
        public static void ConfigCMS(this IServiceCollection services, IConfiguration configuration)
        {
            services.TryAddSingleton<IAdminMenuProvider, AdminMenuProvider>();
            services.TryAddScoped<IWidgetActivator, DefaultWidgetActivator>();
            services.TryAddTransient<ICarouselItemService, CarouselItemService>();
            services.TryAddTransient<ICarouselService, CarouselService>();
            services.TryAddTransient<INavigationService, NavigationService>();
            services.TryAddTransient<Site.ISiteInformationService, Site.SiteInformationService>();

            services.TryAddTransient<IDashboardProviderService, DashboardProviderService>();
            services.AddTransient<IDashboardPartDriveService, DashboardWelcomePartService>();
            services.AddTransient<IDashboardPartDriveService, DashboardEventLogPartService>();

            services.TryAddTransient<IDataArchivedService, DataArchivedService>();
            services.TryAddTransient<IExtendFieldService, ExtendFieldService>();
            services.AddTransient<IUserCenterLinksProvider, UserCenterLinksProvider>();
            services.AddTransient<IUserCenterLinkService, UserCenterLinkService>();
            services.TryAddScoped<ILayoutService, LayoutService>();
            services.TryAddScoped<ILayoutHtmlService, LayoutHtmlService>();
            services.TryAddTransient<IMediaService, MediaService>();
            services.TryAddScoped<IPageService, PageService>();
            services.TryAddScoped<IPageContext, PageContext>();
            services.AddTransient<ISiteUrlProvider, PageSiteUrlProvider>();
            services.TryAddScoped<IApplicationSettingService, ApplicationSettingService>();
            services.TryAddScoped<IThemeService, ThemeService>();
            services.TryAddTransient<IWidgetTemplateService, WidgetTemplateService>();
            services.TryAddScoped<IWidgetBasePartService, WidgetBasePartService>();
            services.TryAddScoped<IZoneService, ZoneService>();
            services.TryAddScoped<IHostOptionProvider, HostOptionProvider>();
            services.TryAddTransient<Rule.IRuleService, Rule.RuleService>();

            services.AddScoped<IOnModelCreating, EntityFrameWorkModelCreating>();

            services.AddTransient<Easy.Notification.ISmtpProvider, SmtpProvider>();
            services.AddTransient<IPackageInstaller, ThemePackageInstaller>();
            services.AddTransient<IPackageInstaller, WidgetPackageInstaller>();
            services.AddTransient<IPackageInstaller, FilePackageInstaller>();
            services.AddTransient<IPackageInstaller, DataDictionaryPackageInstaller>();
            services.AddTransient<IPackageInstallerProvider, PackageInstallerProvider>();
            services.AddTransient<IEventViewerService, EventViewerService>();
            services.AddTransient<IDBContextProvider, DefaultDBContextProvider>();

            services.AddTransient<Safety.IHtmlSanitizer, Safety.DefaultHtmlSanitizer>();
            services.AddTransient<IStorage, WebStorage>();
            services.AddTransient<ICurrencyService, CurrencyService>();
            services.AddScoped<ITemplateService, TemplateService>();


            services.TryAddTransient<IPendingTaskExecutor, PendingTaskExecutor>();

            services.ConfigureStateProvider<StateProvider.OuterChainPictureStateProvider>();
            services.ConfigureStateProvider<StateProvider.EnableResponsiveDesignStateProvider>();
            services.ConfigureStateProvider<Site.SiteInformationStateProvider>();
            services.ConfigureStateProvider<CurrencyStateProvider>();

            services.Configure<HostOption>(configuration.GetSection("Host"));

            services.Configure<NavigationWidget>(option =>
            {
                option.DataSourceLinkTitle = "Navigation";
                option.DataSourceLink = "~/admin/Navigation";
            });

            services.Configure<CarouselWidget>(option =>
            {
                option.DataSourceLinkTitle = "Carousel";
                option.DataSourceLink = "~/admin/Carousel";
            });
        }
        public static void ConfigMetaData(this IServiceCollection services)
        {
            services.ConfigureMetaData<AdminSignViewModel, AdminSignViewModelMetaData>();
            services.ConfigureMetaData<SignInViewModel, SignInViewModelMetaData>();
            services.ConfigureMetaData<CustomerSignInViewModel, CustomerSignInViewModelMetaData>();
            services.ConfigureMetaData<ArticleEntity, ArticleEntityMeta>();
            services.ConfigureMetaData<ArticleGallery, ArticleGalleryMetaData>();
            services.ConfigureMetaData<ArticleGalleryItem, ArticleGalleryItemMetaData>();
            services.ConfigureMetaData<ArticleItem, ArticleGalleryProductMetaData>();
            services.ConfigureMetaData<ArticleType, ArtycleTypeMetaData>();
            services.ConfigureMetaData<BreadcrumbWidget, BreadcrumbWidgetMetaData>();
            services.ConfigureMetaData<CarouselEntity, CarouselEntityMetaData>();
            services.ConfigureMetaData<CarouselWidget, CarouselWidgetMetaData>();
            services.ConfigureMetaData<CarouselItemEntity, CarouselItemEntityMeta>();
            services.ConfigureMetaData<HtmlWidget, HtmlWidgetMetaData>();
            services.ConfigureMetaData<ImageWidget, ImageWidgetMedaData>();
            services.ConfigureMetaData<NavigationEntity, NavigationEntityMeta>();
            services.ConfigureMetaData<NavigationWidget, NavigationWidgetMetaData>();
            services.ConfigureMetaData<ScriptWidget, ScriptWidgetMetaData>();
            services.ConfigureMetaData<StyleSheetWidget, StyleSheetWidgetMetaData>();
            services.ConfigureMetaData<VideoWidget, VideoWidgetMetaData>();
            services.ConfigureMetaData<DataArchived.DataArchived, DataArchivedMetaData>();
            services.ConfigureMetaData<ExtendFieldEntity, ExtendFieldEntityMetaData>();
            services.ConfigureMetaData<LayoutEntity, LayoutEntityMetaData>();
            services.ConfigureMetaData<MediaEntity, MediaEntityMetaData>();
            services.ConfigureMetaData<PageEntity, PageMetaData>();
            services.ConfigureMetaData<PageAsset, PageAssetMetaData>();
            services.ConfigureMetaData<ProductEntity, ProductMetaData>();
            services.ConfigureMetaData<ProductCategory, ProductCategoryMetaData>();
            services.ConfigureMetaData<ProductImage, ProductImageMetaData>();
            services.ConfigureMetaData<ProductGallery, ProductGalleryMetaData>();
            services.ConfigureMetaData<ProductGalleryItem, ProductGalleryItemMetaData>();
            services.ConfigureMetaData<ProductItem, ProductGalleryProductMetaData>();
            services.ConfigureMetaData<ApplicationSetting, ApplicationSettingMedaData>();
            services.ConfigureMetaData<ThemeEntity, ThemeEntityMetaData>();
            services.ConfigureMetaData<ZoneEntity, ZoneEntityMetaData>();
            services.ConfigureMetaData<Rule.Rule, Rule.RuleMetaData>();
            services.ConfigureMetaData<Rule.RuleItem, Rule.RuleItemMetaData>();
            services.ConfigureMetaData<Robots, RobotsMetaData>();
            services.ConfigureMetaData<TemplateFile, TemplateFileMetaData>();
            services.ConfigureMetaData<TabWidget, TabWidgetMetaData>();
            services.ConfigureMetaData<TabItem, TabItemMetaData>();
            services.ConfigureMetaData<HeadWidget, HeaderWidgetMetaData>();
            services.ConfigureMetaData<ForgottenViewModel, ForgottenViewModelMetaData>();
            services.ConfigureMetaData<ResetViewModel, ResetViewModelMetaData>();
            services.ConfigureMetaData<CurrencyEntry, CurrencyEntryMetaData>();
            services.ConfigureMetaData<CurrencyOption, CurrencyOptionMetaData>();
        }
    }
}
