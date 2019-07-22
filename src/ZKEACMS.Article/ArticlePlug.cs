/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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
                Title = "文章管理",
                Icon = "glyphicon-font",
                Order = 10,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "文章列表",
                        Url = "~/admin/Article",
                        Icon = "glyphicon-align-justify",
                        PermissionKey = PermissionKeys.ViewArticle
                    },
                    new AdminMenu
                    {
                        Title = "文章类别",
                        Url = "~/admin/ArticleType",
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
            yield return new PermissionDescriptor(PermissionKeys.ViewArticle, "文章", "查看文章", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageArticle, "文章", "管理文章", "");
            yield return new PermissionDescriptor(PermissionKeys.PublishArticle, "文章", "发布文章", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewArticleType, "文章", "查看文章类别", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageArticleType, "文章", "管理文章类别", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            string groupName = "2.文章";
            yield return new WidgetTemplateEntity<ArticleListWidgetService>
            {
                Title = "文章列表",
                GroupName = groupName,
                PartialView = "Widget.ArticleList",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png",
                Order = 1
            };
            yield return new WidgetTemplateEntity<ArticleDetailWidgetService>
            {
                Title = "文章内容",
                GroupName = groupName,
                PartialView = "Widget.ArticleDetail",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png",
                Order = 2
            };

            //add by roc
            yield return new WidgetTemplateEntity<ArticleSpecialDetailWidgetService>
            {
                Title = "特别文章内容",
                GroupName = groupName,
                PartialView = "Widget.ArticleDetail",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png",
                Order = 2
            };

            yield return new WidgetTemplateEntity<ArticleTopWidgetService>
            {
                Title = "置顶文章",
                GroupName = groupName,
                PartialView = "Widget.ArticleTops",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleTops.png",
                Order = 3
            };
            yield return new WidgetTemplateEntity<ArticleSummaryWidgetService>
            {
                Title = "文章概览",
                GroupName = groupName,
                PartialView = "Widget.ArticleSummary",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleSummary.png",
                Order = 4
            };
            yield return new WidgetTemplateEntity<ArticleTypeWidgetService>
            {
                Title = "文章类别",
                GroupName = groupName,
                PartialView = "Widget.ArticleType",
                Thumbnail = "~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png",
                Order = 5
            };
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<IArticleService, ArticleService>();
            serviceCollection.AddTransient<IArticleTypeService, ArticleTypeService>();
            serviceCollection.AddTransient<IRouteDataProvider, ArticleRouteDataProvider>();
            serviceCollection.AddTransient<IRouteDataProvider, ArticleTypeRouteDataProvider>();
            serviceCollection.AddSingleton<IOnModelCreating, EntityFrameWorkModelCreating>();

            serviceCollection.Configure<ArticleListWidget>(option =>
            {
                option.DataSourceLinkTitle = "文章";
                option.DataSourceLink = "~/admin/Article";
            });
            serviceCollection.Configure<ArticleTopWidget>(option =>
            {
                option.DataSourceLinkTitle = "文章";
                option.DataSourceLink = "~/admin/Article";
            });
            serviceCollection.Configure<ArticleTypeWidget>(option =>
            {
                option.DataSourceLinkTitle = "文章类别";
                option.DataSourceLink = "~/admin/ArticleType";
            });
            serviceCollection.ConfigureMetaData<ArticleDetailWidget, ArticleDetailWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ArticleListWidget, ArticleListWidgetMeta>();
            serviceCollection.ConfigureMetaData<ArticleSummaryWidget, ArticleSummaryWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ArticleTopWidget, ArticleTopWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ArticleTypeWidget, ArticleTypeWidgetMetaData>();

            //add by roc
            serviceCollection.ConfigureMetaData<ArticleSpecialDetailWidget, ArticleSpecialDetailWidgetMetaData>();
        }
    }
}