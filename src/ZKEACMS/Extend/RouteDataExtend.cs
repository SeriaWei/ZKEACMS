/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Microsoft.AspNetCore.Routing;

namespace ZKEACMS
{
    public static class RouteDataExtend
    {
        public static string GetPath(this RouteData roteData)
        {
            const string defaultPath = "/";
            string path = defaultPath;
            if (roteData.Values.ContainsKey(StringKeys.RouteValue_Path) && roteData.Values[StringKeys.RouteValue_Path] != null)
            {
                path = roteData.Values[StringKeys.RouteValue_Path].ToString();
                if (path.EndsWith("/") && path.Length > 1)
                {
                    return path.Substring(0, path.Length - 1);
                }
            }
            return path;
        }
        public static int GetPost(this RouteData roteData)
        {
            int post = 0;
            if (roteData.Values.ContainsKey(StringKeys.RouteValue_Post))
            {
                int.TryParse(roteData.Values[StringKeys.RouteValue_Post].ToString(), out post);
            }
            return post;
        }
        public static int GetCategory(this RouteData roteData)
        {
            int post = 0;
            if (roteData.Values.ContainsKey(StringKeys.RouteValue_Category))
            {
                int.TryParse(roteData.Values[StringKeys.RouteValue_Category].ToString(), out post);
            }
            return post;
        }
        public static int GetPage(this RouteData roteData)
        {
            int page = 0;
            if (roteData.Values.ContainsKey(StringKeys.RouteValue_Page))
            {
                int.TryParse(roteData.Values[StringKeys.RouteValue_Page].ToString(), out page);
            }
            return page;
        }

        public static string GetArticleUrl(this RouteData roteData)
        {
            if (roteData.Values.ContainsKey(StringKeys.RouteVale_ArticleUrl))
            {
                return roteData.Values[StringKeys.RouteVale_ArticleUrl].ToString();
            }
            return null;
        }        

        public static string GetProductUrl(this RouteData roteData)
        {
            if (roteData.Values.ContainsKey(StringKeys.RouteVale_ProductUrl))
            {
                return roteData.Values[StringKeys.RouteVale_ProductUrl].ToString();
            }
            return null;
        }

        public static string GetCategoryUrl(this RouteData roteData)
        {
            if (roteData.Values.ContainsKey(StringKeys.RouteVale_CategoryUrl))
            {
                return roteData.Values[StringKeys.RouteVale_CategoryUrl].ToString();
            }
            return null;
        }
    }
}
