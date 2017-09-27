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

namespace ZKEACMS
{
    public static class Builder
    {
        public static void UseZKEACMS(this IServiceCollection services, IConfigurationRoot configuration)
        {
            services.TryAddScoped<IApplicationContextAccessor, ApplicationContextAccessor>();
            services.TryAddScoped<IApplicationContext, CMSApplicationContext>();
            services.TryAddSingleton<IRouteProvider, RouteProvider>();
            services.TryAddSingleton<IAdminMenuProvider, AdminMenuProvider>();

            services.TryAddTransient<IWidgetActivator, DefaultWidgetActivator>();

            services.TryAddTransient<ICarouselItemService, CarouselItemService>();
            services.TryAddTransient<ICarouselService, CarouselService>();
            services.TryAddTransient<INavigationService, NavigationService>();
            services.TryAddTransient<IDashboardProviderService, DashboardProviderService>();
            services.TryAddTransient<IDashboardPartDriveService, DashboardWelcomePartService>();
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
            services.AddTransient<IOnModelCreating, EntityFrameWorkModelCreating>();
            services.AddTransient<Easy.Notification.ISmtpProvider, SmtpProvider>();
            services.AddTransient<IPackageInstaller, ThemePackageInstaller>();
            services.AddTransient<IPackageInstaller, WidgetPackageInstaller>();
            services.AddTransient<IPackageInstaller, FilePackageInstaller>();
            services.AddTransient<IPackageInstaller, DataDictionaryPackageInstaller>();
            services.AddTransient<IPackageInstallerProvider, PackageInstallerProvider>();
            services.AddTransient<IEventViewerService, EventViewerService>();
            services.Configure<DatabaseOption>(configuration.GetSection("Database"));

            services.AddDbContext<CMSDbContext>();

            foreach (var item in WidgetBase.KnownWidgetService)
            {
                services.TryAddTransient(item.Value);
            }
            foreach (var item in WidgetBase.KnownWidgetModel)
            {
                services.TryAddTransient(item.Value);
            }
        }
    }
}
