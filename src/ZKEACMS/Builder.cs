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

namespace ZKEACMS
{
    public static class Builder
    {
        public static void UseZKEACMS(this IServiceCollection serviceCollection)
        {
            serviceCollection.TryAddScoped<IApplicationContext, CMSApplicationContext>();
            serviceCollection.TryAddSingleton<IRouteProvider, RouteProvider>();
            serviceCollection.TryAddSingleton<IAdminMenuProvider, AdminMenuProvider>();

            serviceCollection.TryAddTransient<ICarouselItemService, CarouselItemService>();
            serviceCollection.TryAddTransient<ICarouselService, CarouselService>();
            serviceCollection.TryAddTransient<INavigationService, NavigationService>();
            serviceCollection.TryAddTransient<IDashboardProviderService, DashboardProviderService>();
            serviceCollection.TryAddTransient<IDashboardPartDriveService, DashboardWelcomePartService>();
            serviceCollection.TryAddTransient<IDataArchivedService, DataArchivedService>();
            serviceCollection.TryAddTransient<IExtendFieldService, ExtendFieldService>();

            serviceCollection.TryAddTransient<ILayoutService, LayoutService>();
            serviceCollection.TryAddTransient<ILayoutHtmlService, LayoutHtmlService>();
            serviceCollection.TryAddTransient<IMediaService, MediaService>();
            serviceCollection.TryAddTransient<IPageService, PageService>();
            serviceCollection.TryAddTransient<IApplicationSettingService, ApplicationSettingService>();
            serviceCollection.TryAddTransient<IThemeService, ThemeService>();
            serviceCollection.TryAddTransient<IWidgetTemplateService, WidgetTemplateService>();
            serviceCollection.TryAddTransient<IWidgetService, WidgetService>();
            serviceCollection.TryAddTransient<IZoneService, ZoneService>();
            serviceCollection.AddTransient<IOnModelCreating, EntityFrameWorkModelCreating>();

            new KnownTypeProvider().GetTypes().Each(type =>
            {
                serviceCollection.TryAddTransient(type);
            });
        }
    }
}
