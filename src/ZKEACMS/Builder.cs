/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */


using Easy;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using ZKEACMS.Common.Service;
using ZKEACMS.Dashboard;
using ZKEACMS.DataArchived;
using ZKEACMS.ExtendField;
using ZKEACMS.Layout;
using ZKEACMS.Media;
using ZKEACMS.Page;
using ZKEACMS.Setting;
using ZKEACMS.Theme;
using ZKEACMS.Widget;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.Zone;
using ZKEACMS.PackageManger;
using ZKEACMS.Options;
using Microsoft.Extensions.Configuration;
using ZKEACMS.Notification;
using ZKEACMS.Account;
using Easy.Mvc.Plugin;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using ZKEACMS.ModelBinder;
using Easy.Mvc.DataAnnotations;
using Microsoft.AspNetCore.Authorization;
using Easy.Mvc.Authorize;
using ZKEACMS.Route;
using Microsoft.AspNetCore.Http;
using System.Linq;
using ZKEACMS.Article.Models;
using ZKEACMS.Common.Models;
using ZKEACMS.Product.Models;
using System;
using Easy.Mvc.Resource;
using CacheManager.Core;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS
{
    public static class Builder
    {
        public static void UseZKEACMS(this IServiceCollection services, IConfiguration configuration)
        {

            services.AddMvc(option =>
            {
                option.ModelBinderProviders.Insert(0, new WidgetModelBinderProvider());
                option.ModelMetadataDetailsProviders.Add(new DataAnnotationsMetadataProvider());
            })
            .AddControllersAsServices()
            .AddJsonOptions(option => { option.SerializerSettings.DateFormatString = "yyyy-MM-dd"; })
            .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            services.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            services.TryAddScoped<IApplicationContextAccessor, ApplicationContextAccessor>();
            services.TryAddScoped<IApplicationContext, CMSApplicationContext>();
            services.TryAddSingleton<IRouteProvider, RouteProvider>();

            services.AddSingleton<IRouteDataProvider, PaginationRouteDataProvider>();
            services.AddSingleton<IRouteDataProvider, PostIdRouteDataProvider>();
            services.AddSingleton<IRouteDataProvider, CategoryRouteDataProvider>();
            services.AddSingleton<IRouteDataProvider, HtmlRouteDataProvider>();

            services.TryAddSingleton<IAdminMenuProvider, AdminMenuProvider>();
            services.TryAddTransient<IWidgetActivator, DefaultWidgetActivator>();
            services.TryAddTransient<ICarouselItemService, CarouselItemService>();
            services.TryAddTransient<ICarouselService, CarouselService>();
            services.TryAddTransient<INavigationService, NavigationService>();

            services.TryAddTransient<IDashboardProviderService, DashboardProviderService>();
            services.AddTransient<IDashboardPartDriveService, DashboardWelcomePartService>();
            services.AddTransient<IDashboardPartDriveService, DashboardEventLogPartService>();

            services.TryAddTransient<IDataArchivedService, DataArchivedService>();
            services.TryAddTransient<IExtendFieldService, ExtendFieldService>();
            services.TryAddTransient<INotifyService, NotifyService>();
            services.AddTransient<IUserCenterLinksProvider, UserCenterLinksProvider>();
            services.TryAddTransient<ILayoutService, LayoutService>();
            services.TryAddTransient<ILayoutHtmlService, LayoutHtmlService>();
            services.TryAddTransient<IMediaService, MediaService>();
            services.TryAddTransient<IPageService, PageService>();
            services.TryAddTransient<IApplicationSettingService, ApplicationSettingService>();
            services.TryAddTransient<IThemeService, ThemeService>();
            services.TryAddTransient<IWidgetTemplateService, WidgetTemplateService>();
            services.TryAddTransient<IWidgetBasePartService, WidgetBasePartService>();
            services.TryAddTransient<IZoneService, ZoneService>();
            services.TryAddTransient<Rule.IRuleService, Rule.RuleService>();

            services.AddScoped<IOnModelCreating, EntityFrameWorkModelCreating>();

            services.AddTransient<Easy.Notification.ISmtpProvider, SmtpProvider>();
            services.AddTransient<IPackageInstaller, ThemePackageInstaller>();
            services.AddTransient<IPackageInstaller, WidgetPackageInstaller>();
            services.AddTransient<IPackageInstaller, FilePackageInstaller>();
            services.AddTransient<IPackageInstaller, DataDictionaryPackageInstaller>();
            services.AddTransient<IPackageInstallerProvider, PackageInstallerProvider>();
            services.AddTransient<IEventViewerService, EventViewerService>();

            services.AddSingleton(serviceProvider => CacheFactory.Build<IEnumerable<WidgetBase>>(setting =>
            {
                setting.WithDictionaryHandle("PageWidgets");
            }));
            services.AddSingleton(serviceProvider => CacheFactory.Build<IEnumerable<ZoneEntity>>(setting =>
            {
                setting.WithDictionaryHandle("PublishedPageZones");
            }));
            services.AddSingleton(serviceProvider => CacheFactory.Build<IEnumerable<LayoutHtml>>(setting =>
            {
                setting.WithDictionaryHandle("PublishedPageLayoutHtmls");
            }));

            services.ConfigureMetaData<ArticleEntity, ArticleEntityMeta>();
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
            services.ConfigureMetaData<ProductEntity, ProductMetaData>();
            services.ConfigureMetaData<ProductCategory, ProductCategoryMetaData>();
            services.ConfigureMetaData<ProductImage, ProductImageMetaData>();
            services.ConfigureMetaData<ApplicationSetting, ApplicationSettingMedaData>();
            services.ConfigureMetaData<ThemeEntity, ThemeEntityMetaData>();
            services.ConfigureMetaData<ZoneEntity, ZoneEntityMetaData>();
            services.ConfigureMetaData<Rule.Rule, Rule.RuleMetaData>();
            services.ConfigureMetaData<Rule.RuleItem, Rule.RuleItemMetaData>();

            services.Configure<NavigationWidget>(option =>
            {
                option.DataSourceLinkTitle = "导航";
                option.DataSourceLink = "~/admin/Navigation";
            });

            services.Configure<CarouselWidget>(option =>
            {
                option.DataSourceLinkTitle = "焦点图";
                option.DataSourceLink = "~/admin/Carousel";
            });

            services.AddDbContext<CMSDbContext>();

            services.Configure<DatabaseOption>(configuration.GetSection("Database"));

            services.UseEasyFrameWork(configuration);
            foreach (var item in services.LoadAvailablePlugins())
            {
                item.Setup(services);
            }
            foreach (var item in WidgetBase.KnownWidgetService)
            {
                services.TryAddTransient(item.Value);
            }
            foreach (var item in WidgetBase.KnownWidgetModel)
            {
                services.TryAddTransient(item.Value);
            }

            services.Configure<AuthorizationOptions>(options =>
            {
                PermissionKeys.Configure(options);
                KnownRequirements.Configure(options);
            });

            services.AddAuthentication(DefaultAuthorizeAttribute.DefaultAuthenticationScheme)
                .AddCookie(DefaultAuthorizeAttribute.DefaultAuthenticationScheme, o =>
                {
                    o.LoginPath = new PathString("/Account/Login");
                    o.AccessDeniedPath = new PathString("/Error/Forbidden");
                })
                .AddCookie(CustomerAuthorizeAttribute.CustomerAuthenticationScheme, option =>
                {
                    option.LoginPath = new PathString("/Account/Signin");
                });
        }

        public static void UseZKEACMS(this IApplicationBuilder applicationBuilder, IHostingEnvironment hostingEnvironment, IHttpContextAccessor httpContextAccessor)
        {
            applicationBuilder.UseAuthentication();
            applicationBuilder.UseStaticFiles();
            ServiceLocator.Setup(httpContextAccessor);
            applicationBuilder.ConfigureResource();
            applicationBuilder.ConfigurePlugin(hostingEnvironment);
            applicationBuilder.UseMvc(routes =>
            {
                applicationBuilder.ApplicationServices.GetService<IRouteProvider>().GetRoutes().OrderByDescending(route => route.Priority).Each(route =>
                {
                    routes.MapRoute(route.RouteName, route.Template, route.Defaults, route.Constraints, route.DataTokens);
                });
            });
            if (hostingEnvironment.IsDevelopment())
            {
                applicationBuilder.UsePluginStaticFile();
            }
            Console.WriteLine("Welcome to use ZKEACMS");
        }
    }
}
