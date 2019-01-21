/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Easy.Extend;
using Microsoft.AspNetCore.Routing;
using ZKEACMS.Article.Models;
using ZKEACMS.Product.Models;

namespace ZKEACMS
{
    public static class RouteDataExtend
    {
        public static string GetPath(this RouteData routeData)
        {
            const string defaultPath = "/";
            string path = defaultPath;
            if (routeData.Values.ContainsKey(StringKeys.RouteValue_Path) && routeData.Values[StringKeys.RouteValue_Path] != null)
            {
                path = routeData.Values[StringKeys.RouteValue_Path].ToString();
                if (path.EndsWith("/") && path.Length > 1)
                {
                    return path.Substring(0, path.Length - 1);
                }
            }
            return path;
        }
        public static void SetPost(this RouteValueDictionary routeValue,int post)
        {
            routeValue.TryAdd(StringKeys.RouteValue_Post, post);
        }
        public static int GetPost(this RouteData routeData)
        {
            int post = 0;
            if (routeData.Values.ContainsKey(StringKeys.RouteValue_Post))
            {
                int.TryParse(routeData.Values[StringKeys.RouteValue_Post].ToString(), out post);
            }
            return post;
        }
        public static void SetCategory(this RouteValueDictionary routeValue,int category)
        {
            routeValue.TryAdd(StringKeys.RouteValue_Category, category);
        }
        public static int GetCategory(this RouteData routeData)
        {
            int post = 0;
            if (routeData.Values.ContainsKey(StringKeys.RouteValue_Category))
            {
                int.TryParse(routeData.Values[StringKeys.RouteValue_Category].ToString(), out post);
            }
            return post;
        }
        public static void SetPage(this RouteValueDictionary routeValue, int page)
        {
            routeValue.TryAdd(StringKeys.RouteValue_Page, page);
        }
        public static int GetPage(this RouteData routeData)
        {
            int page = 0;
            if (routeData.Values.ContainsKey(StringKeys.RouteValue_Page))
            {
                int.TryParse(routeData.Values[StringKeys.RouteValue_Page].ToString(), out page);
            }
            return page;
        }
        public static void SetArticle(this RouteValueDictionary routeValue, ArticleEntity article)
        {
            string key = StringKeys.RouteVale_Article.FormatWith(article.ID);
            routeValue.TryAdd(key, article);
        }
        public static ArticleEntity GetArticle(this RouteData routeData, int id)
        {
            string key = StringKeys.RouteVale_Article.FormatWith(id);
            object result = null;
            if (routeData.Values.TryGetValue(key, out result))
            {
                return result as ArticleEntity;
            }
            return null;
        }
        public static void SetArticleUrl(this RouteValueDictionary routeValue, string url)
        {
            routeValue.TryAdd(StringKeys.RouteVale_ArticleUrl, url);
        }
        public static string GetArticleUrl(this RouteData roteData)
        {
            if (roteData.Values.ContainsKey(StringKeys.RouteVale_ArticleUrl))
            {
                return roteData.Values[StringKeys.RouteVale_ArticleUrl].ToString();
            }
            return null;
        }
        public static void SetProduct(this RouteValueDictionary routeValue, ProductEntity product)
        {
            string key = StringKeys.RouteVale_Product.FormatWith(product.ID);
            routeValue.TryAdd(key, product);
        }
        public static ProductEntity GetProduct(this RouteData routeData, int id)
        {
            string key = StringKeys.RouteVale_Product.FormatWith(id);
            object result = null;
            if (routeData.Values.TryGetValue(key, out result))
            {
                return result as ProductEntity;
            }
            return null;
        }
        public static void SetProductUrl(this RouteValueDictionary routeValue,string url)
        {
            routeValue.TryAdd(StringKeys.RouteVale_ProductUrl, url);
        }
        public static string GetProductUrl(this RouteData routeData)
        {
            if (routeData.Values.ContainsKey(StringKeys.RouteVale_ProductUrl))
            {
                return routeData.Values[StringKeys.RouteVale_ProductUrl].ToString();
            }
            return null;
        }
        public static void SetCategoryUrl(this RouteValueDictionary routeValue,string url)
        {
            routeValue.TryAdd(StringKeys.RouteVale_CategoryUrl, url);
        }
        public static string GetCategoryUrl(this RouteData routeData)
        {
            if (routeData.Values.ContainsKey(StringKeys.RouteVale_CategoryUrl))
            {
                return routeData.Values[StringKeys.RouteVale_CategoryUrl].ToString();
            }
            return null;
        }
    }
}
