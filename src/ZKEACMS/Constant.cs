/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using System.Collections.Generic;
using System.Reflection;
using System.Text.RegularExpressions;

namespace ZKEACMS
{
    public class Const
    {
        public const string CopyWidgetCookie = "032F84D1BA204DC88F1C2694BF41F989";
    }

    public class Layouts
    {
        public const string PageDesign = "~/Views/Shared/_DesignPageLayout.cshtml";
        public const string LayoutDesign = "~/Views/Shared/_DesignLayout.cshtml";
        public const string Default = "~/Views/Shared/_Layout.cshtml";
        public const string NormalDefault = "~/Views/Shared/_LayoutNormal.cshtml";
        public const string PopUp = "~/Views/Shared/_PopUpLayout.cshtml";
        public const string ClientPopUp = "~/Views/Shared/_PopUpClientLayout.cshtml";
        public const string CustomerCenter = "~/Views/Shared/_CustomerCenterLayout.cshtml";
    }

    public class ViewDataKeys
    {
        public const string Zones = "ViewDataKey_Zones";
        public const string Layouts = "ViewDataKey_Layouts";
        public const string ArticleCategory = "ViewDataKey_ArticleType";
        public const string ProductCategory = "ViewDataKey_ProductCategory";
        public const string ProductListTemplate = "ViewDataKey_ProductListTemplate";
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

    public static class FileExtensions
    {
        public static List<string> Video
        {
            get { return new List<string> { ".mp4", ".avi", ".rmvb" }; }
        }
        public static List<string> Zip
        {
            get { return new List<string> { ".rar", ".zip", ".7z" }; }
        }
        public static List<string> Pdf
        {
            get { return new List<string> { ".pdf" }; }
        }
        public static List<string> Txt
        {
            get { return new List<string> { ".txt" }; }
        }
        public static List<string> Doc
        {
            get { return new List<string> { ".doc", ".docx" }; }
        }
        public static List<string> Excel
        {
            get { return new List<string> { ".xls", ".xlsx" }; }
        }
        public static List<string> Ppt
        {
            get { return new List<string> { ".ppt", ".pptx" }; }
        }
    }

    public static class StringKeys
    {
        public const string LayoutItem = "LayoutItem";
        public const string SelectImageClass = "select select-image";
        public const string SelectMediaClass = "select select-media";
        public const string SelectVideoClass = "select select-video";
        public const string SelectPageClass = "select select-page";
        public const string StyleEditor = "select custom-style-target";
        public const string HtmlEditorClass = "html";
        public const string UrlPart = "url-part";

        public const string RouteValue_Path = "path";
        public const string RouteValue_Post = "post";
        public const string RouteValue_Category = "cate";
        public const string RouteValue_Page = "p";

        public const string RouteVale_ArticleUrl = "ArticleUrl";
        public const string RouteVale_ProductUrl = "ProductUrl";
        public const string RouteVale_CategoryUrl = "CategoryUrl";

        public static string PathFormat(string routeKey)
        {
            return "{0}-".FormatWith(routeKey);
        }
    }

    public static class CustomRegex
    {
        public static readonly Regex StyleRegex = new Regex(@"style=""([^""]*)""", RegexOptions.IgnoreCase | RegexOptions.Compiled);

        public static Regex PostIdRegex = new Regex(@"/post-(\d+)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        public static Regex CategoryIdRegex = new Regex(@"/cate-(\d+)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        public static Regex PageRegex = new Regex(@"/p-(\d+)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
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
                    var attr = typeof(Version).GetTypeInfo().Assembly.GetCustomAttribute(typeof(AssemblyInformationalVersionAttribute)) as AssemblyInformationalVersionAttribute;
                    _version = $"ZKEACMS v{attr.InformationalVersion}";
                }
                return _version;
            }
        }
        public static string Rank
        {
            get { return "Community"; }
        }
    }
}
