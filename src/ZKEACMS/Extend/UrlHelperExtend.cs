/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Easy.Extend;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.AspNetCore.WebUtilities;

namespace ZKEACMS
{
    public static class UrlHelperExtend
    {
        public static string PathContent(this IUrlHelper helper, string path)
        {
            return helper.Content(path.IsNullOrEmpty() ? "~/" : path);
        }

        public static string ImageContent(this IUrlHelper helper, string path)
        {
            if (path.IsNullOrEmpty())
            {
                return helper.PathContent("~/images/not-img-available.jpg");
            }
            return helper.Content(path);
        }

        public static string ValidateCode(this IUrlHelper helper)
        {
            return helper.Action("Code", "Validation", new { module = "Validation" });
        }

        public static string AddQueryToCurrentUrl(this IUrlHelper helper, string name, string value)
        {
            return QueryHelpers.AddQueryString(helper.ActionContext.HttpContext.Request.Path, name, value);
        }
        public static string PostUrl(this IUrlHelper helper, string url, Article.Models.ArticleEntity article)
        {
            return article.Url.IsNullOrWhiteSpace() ? helper.PostUrl(url, article.ID.ToString()) : helper.CustomUrl(url, article.Url);
        }
        public static string PostUrl(this IUrlHelper helper, string url, Product.Models.ProductEntity product)
        {
            return product.Url.IsNullOrWhiteSpace() ? helper.PostUrl(url, product.ID.ToString()) : helper.CustomUrl(url, product.Url);
        }
        public static string PostUrl(this IUrlHelper helper, string url, int id)
        {
            return PostUrl(helper, url, id.ToString());
        }
        public static string PostUrl(this IUrlHelper helper, string url, string id)
        {
            if (url.IsNullOrWhiteSpace())
            {
                url = "/";
            }
            return helper.Content($"{url}{(url.EndsWith("/") ? "" : "/")}{StringKeys.PathFormat(StringKeys.RouteValue_Post)}{id}.html");
        }
        public static string CustomUrl(this IUrlHelper helper, string url, string ending, bool staticUrl = true)
        {
            if (url.IsNullOrWhiteSpace())
            {
                url = "/";
            }
            if (staticUrl)
            {
                return helper.Content($"{url}{(url.EndsWith("/") ? "" : "/")}{ending}.html");
            }
            else
            {
                return helper.Content($"{url}{(url.EndsWith("/") ? "" : "/")}{ending}");
            }
        }
        public static string CategoryUrl(this IUrlHelper helper, int id)
        {
            return CategoryUrl(helper, id.ToString());
        }
        public static string CategoryUrl(this IUrlHelper helper, string id)
        {
            string path = helper.ActionContext.RouteData.GetPath();
            string currentCategory = helper.ActionContext.RouteData.GetCategory().ToString();
            if (currentCategory != id)
            {
                return $"{path.TrimEnd('/')}/{StringKeys.PathFormat(StringKeys.RouteValue_Category)}{id}";
            }
            else
            {
                return path;
            }
        }

        public static string ArticleTypeUrl(this IUrlHelper helper, Article.Models.ArticleType articleType)
        {
            if (articleType.Url.IsNullOrWhiteSpace())
            {
                return helper.CategoryUrl(articleType.ID);
            }
            string path = helper.ActionContext.RouteData.GetPath();
            string currentCategory = helper.ActionContext.RouteData.GetCategoryUrl();
            if (currentCategory != articleType.Url)
            {
                return $"{path.TrimEnd('/')}/{articleType.Url}";
            }
            else
            {
                return path;
            }
        }
        public static string ProductCategoryUrl(this IUrlHelper helper, Product.Models.ProductCategory productCategory)
        {
            if (productCategory.Url.IsNullOrWhiteSpace())
            {
                return helper.CategoryUrl(productCategory.ID);
            }
            string path = helper.ActionContext.RouteData.GetPath();
            string currentCategory = helper.ActionContext.RouteData.GetCategoryUrl();
            if (currentCategory != productCategory.Url)
            {
                return $"{path.TrimEnd('/')}/{productCategory.Url}";
            }
            else
            {
                return path;
            }
        }
        public static string Page(this IUrlHelper helper, int pageIndex)
        {
            var category = helper.ActionContext.RouteData.GetCategory();
            string path = helper.ActionContext.RouteData.GetPath();
            if (category > 0)
            {
                if (pageIndex > 0)
                {
                    return $"{path.TrimEnd('/')}/{helper.ActionContext.RouteData.GetCategoryUrl() ?? (StringKeys.PathFormat(StringKeys.RouteValue_Category) + category)}/{StringKeys.PathFormat(StringKeys.RouteValue_Page)}{pageIndex}";
                }
                else
                {
                    return $"{path.TrimEnd('/')}/{helper.ActionContext.RouteData.GetCategoryUrl() ?? (StringKeys.PathFormat(StringKeys.RouteValue_Category) + category)}";
                }
            }
            if (pageIndex > 0)
            {
                return $"{path.TrimEnd('/')}/{StringKeys.PathFormat(StringKeys.RouteValue_Page)}{pageIndex}";
            }
            return path;
        }

        public static string[] ToArray(this IUrlHelper url, string path)
        {
            string p = url.PathContent(path);
            if (p == "/") return null;
            return p.Split('/');
        }
    }
}
