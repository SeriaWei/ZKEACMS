/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */


using Easy;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Easy.Mvc.DataAnnotations;
using Easy.Mvc.Plugin;
using Easy.Mvc.Resource;
using Easy.RepositoryPattern;
using Easy.StartTask;
using Easy.Storage;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Account;
using ZKEACMS.Article.Models;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;
using ZKEACMS.Dashboard;
using ZKEACMS.DataArchived;
using ZKEACMS.DbConnectionPool;
using ZKEACMS.ExtendField;
using ZKEACMS.Layout;
using ZKEACMS.Media;
using ZKEACMS.ModelBinder;
using ZKEACMS.Notification;
using ZKEACMS.Options;
using ZKEACMS.PackageManger;
using ZKEACMS.Page;
using ZKEACMS.Product.Models;
using ZKEACMS.Route;
using ZKEACMS.Setting;
using ZKEACMS.SMTP;
using ZKEACMS.Theme;
using ZKEACMS.Validate;
using ZKEACMS.Widget;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.Zone;

namespace ZKEACMS
{
    public static class Builder
    {
        public static void UseZKEACMS(this IServiceCollection services, IConfiguration configuration)
        {
            //添加session
            services.AddDistributedMemoryCache();
            services.AddSession(opt =>
            {
                opt.IdleTimeout = TimeSpan.FromMinutes(20);
                //opt.Cookie.Expiration = TimeSpan.FromMinutes(30);
                //opt.Cookie.MaxAge 
                opt.Cookie.HttpOnly = true;
                opt.Cookie.IsEssential = true;
            });

            IMvcBuilder mvcBuilder = services.AddControllersWithViews(option =>
             {
                 option.ModelBinderProviders.Insert(0, new WidgetTypeModelBinderProvider());
                 option.ModelMetadataDetailsProviders.Add(new DataAnnotationsMetadataProvider());
             })
            .AddRazorOptions(opt =>
            {
                opt.ViewLocationExpanders.Clear();
                opt.ViewLocationExpanders.Add(new ThemeViewLocationExpander());
            })
            .AddControllersAsServices()
            .AddNewtonsoftJson(options =>
            {
                options.SerializerSettings.DateFormatString = "yyyy/MM/dd H:mm";
            })
            .SetCompatibilityVersion(CompatibilityVersion.Latest);

            services.AddRazorPages();
            services.AddHealthChecks();
            services.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            services.TryAddScoped<IApplicationContextAccessor, ApplicationContextAccessor>();
            services.TryAddScoped<IApplicationContext, CMSApplicationContext>();
            services.TryAddSingleton<IRouteProvider, RouteProvider>();

            services.AddTransient<IRouteDataProvider, PaginationRouteDataProvider>();
            services.AddTransient<IRouteDataProvider, PostIdRouteDataProvider>();
            services.AddTransient<IRouteDataProvider, CategoryRouteDataProvider>();
            services.AddTransient<IRouteDataProvider, HtmlRouteDataProvider>();

            services.TryAddSingleton<IAdminMenuProvider, AdminMenuProvider>();
            services.TryAddScoped<IWidgetActivator, DefaultWidgetActivator>();
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
            services.AddTransient<IUserCenterLinkService, UserCenterLinkService>();
            services.TryAddScoped<ILayoutService, LayoutService>();
            services.TryAddScoped<ILayoutHtmlService, LayoutHtmlService>();
            services.TryAddTransient<IMediaService, MediaService>();
            services.TryAddScoped<IPageService, PageService>();
            services.TryAddScoped<IApplicationSettingService, ApplicationSettingService>();
            services.TryAddScoped<IThemeService, ThemeService>();
            services.TryAddTransient<IWidgetTemplateService, WidgetTemplateService>();
            services.TryAddScoped<IWidgetBasePartService, WidgetBasePartService>();
            services.TryAddScoped<IZoneService, ZoneService>();
            services.TryAddTransient<Rule.IRuleService, Rule.RuleService>();

            services.AddScoped<IOnModelCreating, EntityFrameWorkModelCreating>();

            services.AddTransient<Easy.Notification.ISmtpProvider, SmtpProvider>();
            services.AddTransient<IPackageInstaller, ThemePackageInstaller>();
            services.AddTransient<IPackageInstaller, WidgetPackageInstaller>();
            services.AddTransient<IPackageInstaller, FilePackageInstaller>();
            services.AddTransient<IPackageInstaller, DataDictionaryPackageInstaller>();
            services.AddTransient<IPackageInstallerProvider, PackageInstallerProvider>();
            services.AddTransient<IEventViewerService, EventViewerService>();

            services.AddTransient<IStorage, WebStorage>();

            services.ConfigureStateProvider<StateProvider.OuterChainPictureStateProvider>();

            services.ConfigureCache<IEnumerable<WidgetBase>>();
            services.ConfigureCache<IEnumerable<ZoneEntity>>();
            services.ConfigureCache<IEnumerable<LayoutHtml>>();
            services.ConfigureCache<IEnumerable<ThemeEntity>>();
            services.ConfigureCache<List<TemplateFile>>();
            services.ConfigureCache<ConcurrentDictionary<string, object>>();
            services.ConfigureCache<string>();

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
            services.ConfigureMetaData<SmtpSetting, SmtpSettingMetaData>();
            services.ConfigureMetaData<Robots, RobotsMetaData>();
            services.ConfigureMetaData<TemplateFile, TemplateFileMetaData>();

            services.AddScoped<IValidateService, DefaultValidateService>();

            services.AddScoped<ITemplateService, TemplateService>();

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
            #region 数据库配置
            services.AddSingleton<IDatabaseConfiguring, EntityFrameWorkConfigure>();
            services.AddSingleton<IDbConnectionPool, SimpleDbConnectionPool>();
            //池的配置：
            //MaximumRetained规定池的容量（常态最大保有数量）。
            //MaximumRetained为0时，相当于不使用DbConnection池，
            //但因为在Request期间Connection是保持打开的，所以对许多场合还是有性能改善的。
            services.AddSingleton(new DbConnectionPool.Options() { MaximumRetained = 128 });
            //提供在Request期间租、还DbConnection的支持
            services.AddScoped<IConnectionHolder, TransientConnectionHolder>();
            services.AddDbContextOptions<CMSDbContext>();
            services.AddDbContext<CMSDbContext>();
            services.AddScoped<EasyDbContext>((provider) => provider.GetService<CMSDbContext>());
            DatabaseOption databaseOption = configuration.GetSection("Database").Get<DatabaseOption>();
            //DataTableAttribute.IsLowerCaseTableNames = databaseOption.DbType == DbTypes.MySql;
            services.AddSingleton(databaseOption);
            #endregion

            services.UseEasyFrameWork(configuration);
            foreach (IPluginStartup item in services.LoadAvailablePlugins())
            {
                item.Setup(new object[] { services, mvcBuilder });
            }

            foreach (KeyValuePair<string, Type> item in WidgetBase.KnownWidgetService)
            {
                services.TryAddTransient(item.Value);
            }
            foreach (KeyValuePair<string, Type> item in WidgetBase.KnownWidgetModel)
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

        public static void UseZKEACMS(this IApplicationBuilder applicationBuilder, IWebHostEnvironment hostingEnvironment, IHttpContextAccessor httpContextAccessor)
        {
            if (hostingEnvironment.IsDevelopment())
            {
                applicationBuilder.UsePluginStaticFile();
            }
            applicationBuilder.UseStaticFiles();
            ServiceLocator.Setup(httpContextAccessor);
            applicationBuilder.ConfigureResource();
            applicationBuilder.ConfigurePlugin(hostingEnvironment);
            applicationBuilder.UseSession();
            applicationBuilder.UseRouting();

            applicationBuilder.UseAuthentication();
            applicationBuilder.UseAuthorization();

            applicationBuilder.UseEndpoints(endpoints =>
            {
                applicationBuilder.ApplicationServices.GetService<IRouteProvider>().GetRoutes().OrderByDescending(route => route.Priority).Each(route =>
                {
                    endpoints.MapControllerRoute(
                        name: route.RouteName,
                        pattern: route.Template,
                        defaults: route.Defaults,
                        constraints: route.Constraints,
                        dataTokens: route.DataTokens);
                });

                endpoints.MapRazorPages();
            });

            foreach (IStartTask task in applicationBuilder.ApplicationServices.GetServices<IStartTask>())
            {
                task.Excute();
            }
            System.IO.Directory.SetCurrentDirectory(hostingEnvironment.ContentRootPath);
            Console.WriteLine("Welcome to use ZKEACMS");
        }
    }
}
