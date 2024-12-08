/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text.RegularExpressions;

namespace ZKEACMS
{
    public class Const
    {
        public const string CopyWidgetCookie = "F84DBA";
    }
    public class DictionaryKeys
    {
        public const string WidgetStatus = "WidgetStatus";
    }
    public class Layouts
    {
        /// <summary>
        /// Page Design
        /// </summary>
        public const string PageDesign = "_DesignPageLayout";
        /// <summary>
        /// Layout Design
        /// </summary>
        public const string LayoutDesign = "_DesignLayout";
        /// <summary>
        /// Layout for user created pages
        /// </summary>
        public const string Default = "_Layout";
        /// <summary>
        /// Layout for admin pop up modal
        /// </summary>
        public const string PopUp = "_PopUpLayout";
        /// <summary>
        /// Layout for front end pop up modal
        /// </summary>
        public const string ClientPopUp = "_PopUpClientLayout";
        /// <summary>
        /// User center
        /// </summary>
        public const string CustomerCenter = "_CustomerCenterLayout";
        /// <summary>
        /// Empty Layout, without current theme.
        /// </summary>
        public const string EmptyLayout = "_EmptyLayout";
        public const string EmailLayout = "_EmailLayout";

        public const string ThemeLayout = "~/wwwroot/themes/{0}/Views/_Layout.cshtml";
        public const string ThemeSharedLayout = "~/wwwroot/themes/{0}/Views/Shared/_Layout.cshtml";
    }

    public class ViewDataKeys
    {
        public const string Zones = "ViewDataKey_Zones";
        public const string Layouts = "ViewDataKey_Layouts";
        public const string ArticleCategory = "ViewDataKey_ArticleType";
        public const string ProductCategory = "ViewDataKey_ProductCategory";
        public const string ProductListTemplate = "ViewDataKey_ProductListTemplate";
        public const string Currency = "ViewDataKey_Currency";
    }
    public class ReView
    {
        public const string QueryKey = "ViewType";
        public const string Review = "Review";
    }

    public class CacheTrigger
    {
        public const string WidgetChanged = "WidgetChanged";

        public const string PageWidgetsArchivedKey = "PageWidgets:{0}";
    }

    public class Urls
    {
        public const string SelectPage = "/admin/page/select";
        public const string SelectMedia = "/admin/Media/Select";
        public const string StyleEditor = "/admin/StyleEditor/Edit";
        public const string SelectArticle = "/admin/article/select";
        public const string SelectProduct = "/admin/product/select";
    }

    public enum MediaType
    {
        Folder = 1,
        Image = 2,
        Video = 3,
        Zip = 4,
        Pdf = 5,
        Txt = 6,
        Doc = 7,
        Excel = 8,
        Ppt = 9,
        Other = 100
    }
    public enum WidgetStatus
    {
        Undefined = 0,
        Visible = 1,
        Hidden = 2,
        Deleted = 3
    }
    public static class FileExtensions
    {
        public static HashSet<string> Video = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".mp4", ".avi", ".rmvb", ".flv", ".wmv", ".asf", ".asx", ".rm", ".3gp", ".mov", ".m4v", ".mkv", ".vob" };
        public static HashSet<string> Zip = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".rar", ".zip", ".7z", ".arj", ".bz2", ".cab", ".gz", ".lz", ".lzh", ".tar", ".uue", ".xz", ".zipx", ".zst", ".001" };
        public static HashSet<string> Pdf = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".pdf" };
        public static HashSet<string> Txt = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".txt" };
        public static HashSet<string> Doc = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".doc", ".docx" };
        public static HashSet<string> Excel = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".xls", ".xlsx" };
        public static HashSet<string> Ppt = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".ppt", ".pptx" };
    }

    public static class StringKeys
    {
        public const string LayoutItem = "LayoutItem";
        public const string SelectImageClass = "select select-image";
        public const string SelectMediaClass = "select select-media";
        public const string SelectVideoClass = "select select-video";
        public const string SelectPageClass = "select select-page";
        public const string SelectArticleClass = "select select-article";
        public const string SelectProductClass = "select select-product";
        public const string StyleEditor = "select custom-style-target";
        public const string HtmlEditorClass = "html";
        public const string DynamicHtmlEditorClass = "dy-editor";
        public const string UrlPart = "url-part";

        public const string RouteValue_Path = "path";
        public const string RouteValue_Post = "post";
        public const string RouteValue_Category = "cate";
        public const string RouteValue_Page = "p";

        public const string RouteVale_ArticleUrl = "ArticleUrl";
        public const string RouteVale_Article = "Article-{0}";
        public const string RouteVale_ProductUrl = "ProductUrl";
        public const string RouteVale_Product = "Product-{0}";
        public const string RouteVale_CategoryUrl = "CategoryUrl";

        public static string PathFormat(string routeKey)
        {
            return "{0}-".FormatWith(routeKey);
        }
    }

    public static partial class CustomRegex
    {
        [GeneratedRegex("style=\"([^\"]*)\"", RegexOptions.IgnoreCase)]
        public static partial Regex CssStyle();

        [GeneratedRegex("/post-(\\d+)", RegexOptions.IgnoreCase)]
        public static partial Regex PostId();
        [GeneratedRegex("/cate-(\\d+)", RegexOptions.IgnoreCase)]
        public static partial Regex CategoryId();

        [GeneratedRegex("/p-(\\d+)", RegexOptions.IgnoreCase | RegexOptions.Compiled)]
        public static partial Regex PageIndex();

        [GeneratedRegex(@"\.(\d+)", RegexOptions.IgnoreCase | RegexOptions.Compiled)]
        public static partial Regex DecimalPoint();
    }
    public static class CacheSignals
    {
        public const string PageUrlChanged = "PageUrlChanged";
        public const string PageWidgetChanged = "PageWidgetChanged";
        public const string PageZoneChanged = "PageZoneChanged";
    }
    public static class Version
    {
        static string _version;
        public static string CurrentVersion
        {
            get
            {
                if (_version == null)
                {
                    _version = $"ZKEACMS v{VersionInfo}";
                }
                return _version;
            }
        }
        static string _versionInfo;
        public static string VersionInfo
        {
            get
            {
                if (_versionInfo == null)
                {
                    var attr = typeof(Version).GetTypeInfo().Assembly.GetCustomAttribute(typeof(AssemblyFileVersionAttribute)) as AssemblyFileVersionAttribute;
                    _versionInfo = attr.Version;
                }
                return _versionInfo;
            }
        }
        public static string Rank
        {
            get { return "Community"; }
        }
    }
}
