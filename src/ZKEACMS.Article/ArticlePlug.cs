/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using ZKEACMS.Common.Models;
using Microsoft.Extensions.DependencyInjection;
using ZKEACMS.Article.Service;
using ZKEACMS.Setting;
using Easy;
using ZKEACMS.Article.Models;
using Microsoft.Extensions.Options;
using ZKEACMS.WidgetTemplate;
using Easy.RepositoryPattern;
using ZKEACMS.Route;
using System.Collections.Concurrent;

namespace ZKEACMS.Article
{
    public class ArticlePlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "Article Manager",
                Icon = "glyphicon-font",
                Order = 10,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "Article List",
                        Url = "~/admin/article",
                        Icon = "glyphicon-align-justify",
                        PermissionKey = PermissionKeys.ViewArticle
                    },
                    new AdminMenu
                    {
                        Title = "Article Gallery",
                        Url = "~/admin/articlegallery",
                        Icon = "glyphicon-th",
                        PermissionKey = PermissionKeys.ViewArticle
                    },
                    new AdminMenu
                    {
                        Title = "Article Category",
                        Url = "~/admin/articletype",
                        Icon = "glyphicon-th-list",
                        PermissionKey = PermissionKeys.ViewArticleType
                    }
                }
            };
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {

        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("Article").Include("~/Plugins/ZKEACMS.Article/Content/Article.css");
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor(PermissionKeys.ViewArticle, "Article", "View Article", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageArticle, "Article", "Manage Article", "");
            yield return new PermissionDescriptor(PermissionKeys.PublishArticle, "Article", "Publish Article", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewArticleType, "Article", "View Article Category", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageArticleType, "Article", "Manage Article Category", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            string groupName = "2.Article";
            yield return new WidgetTemplateEntity<ArticleListWidgetService>
            {
                Title = "Article List",
                GroupName = groupName,
                PartialView = "Widget.ArticleList",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png",
                Order = 1
            };
            yield return new WidgetTemplateEntity<ArticleDetailWidgetService>
            {
                Title = "Article Detail",
                GroupName = groupName,
                PartialView = "Widget.ArticleDetail",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png",
                Order = 2
            };

            //add by roc
            yield return new WidgetTemplateEntity<ArticleSpecialDetailWidgetService>
            {
                Title = "Specify Article Detail",
                GroupName = groupName,
                PartialView = "Widget.ArticleDetail",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png",
                Order = 2
            };

            yield return new WidgetTemplateEntity<ArticleTopWidgetService>
            {
                Title = "Top Article",
                GroupName = groupName,
                PartialView = "Widget.ArticleTops",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleTops.png",
                Order = 3
            };
            yield return new WidgetTemplateEntity<ArticleSummaryWidgetService>
            {
                Title = "Article Summary",
                GroupName = groupName,
                PartialView = "Widget.ArticleSummary",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleSummary.png",
                Order = 4
            };
            yield return new WidgetTemplateEntity<ArticleTypeWidgetService>
            {
                Title = "Article Category",
                GroupName = groupName,
                PartialView = "Widget.ArticleType",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png",
                Order = 5
            }; ;
            yield return new WidgetTemplateEntity<ArticleGalleryWidgetService>
            {
                Title = "Article Gallery",
                GroupName = groupName,
                PartialView = "Widget.ArticleGallery",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleGallery.png",
                Order = 6
            };
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<IArticleService, ArticleService>();
            serviceCollection.AddTransient<IArticleGalleryService, ArticleGalleryService>();
            serviceCollection.AddTransient<IArticleApiService, ArticleApiService>();
            serviceCollection.AddTransient<IArticleTypeService, ArticleTypeService>();
            serviceCollection.AddTransient<IArticleTypeApiService, ArticleTypeApiService>();
            serviceCollection.AddTransient<IRouteDataProvider, ArticleRouteDataProvider>();
            serviceCollection.AddTransient<IRouteDataProvider, ArticleTypeRouteDataProvider>();
            serviceCollection.AddSingleton<IOnModelCreating, EntityFrameWorkModelCreating>();
            serviceCollection.AddTransient<IArticleListWidgetService, ArticleListWidgetService>();
            serviceCollection.AddTransient<IArticleUrlService, ArticleUrlService>();

            serviceCollection.Configure<ArticleListWidget>(option =>
            {
                option.DataSourceLinkTitle = "Article";
                option.DataSourceLink = "~/admin/article";
            });
            serviceCollection.Configure<ArticleTopWidget>(option =>
            {
                option.DataSourceLinkTitle = "Article";
                option.DataSourceLink = "~/admin/article";
            });
            serviceCollection.Configure<ArticleTypeWidget>(option =>
            {
                option.DataSourceLinkTitle = "Article Category";
                option.DataSourceLink = "~/admin/articletype";
            });
            serviceCollection.ConfigureMetaData<ArticleDetailWidget, ArticleDetailWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ArticleListWidget, ArticleListWidgetMeta>();
            serviceCollection.ConfigureMetaData<ArticleSummaryWidget, ArticleSummaryWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ArticleTopWidget, ArticleTopWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ArticleTypeWidget, ArticleTypeWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ArticleSpecialDetailWidget, ArticleSpecialDetailWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ArticleGalleryWidget, ArticleGalleryWidgetMetaData>();
        }
    }
}