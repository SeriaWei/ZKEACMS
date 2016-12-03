/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Article.ActionFilter;
using ZKEACMS.Article.Controllers;
using Easy.Web.Authorize;
using Easy.Web.Filter;

namespace ZKEACMS.Article
{
    public class FilterConfig : ConfigureFilterBase
    {
        public FilterConfig(IFilterRegister register)
            : base(register)
        {
        }
        public override void Configure()
        {
            Registry.Register<ArticleController, ViewDataArticleTypeAttribute>(m => m.Index());
            Registry.Register<ArticleController, ViewDataArticleTypeAttribute>(m => m.Create());
            Registry.Register<ArticleController, ViewDataArticleTypeAttribute>(m => m.Create(null));
            Registry.Register<ArticleController, ViewDataArticleTypeAttribute>(m => m.Edit(0));
            Registry.Register<ArticleController, ViewDataArticleTypeAttribute>(m => m.Edit(null));
            Registry.Register<ArticleController, ViewDataArticleTypeAttribute>(m => m.GetList());


            Registry.Register<ArticleController, DefaultAuthorizeAttribute>(m => m.Index(), auth => auth.SetPermissionKey(PermissionKeys.ViewArticle));
            Registry.Register<ArticleController, DefaultAuthorizeAttribute>(m => m.Create(), auth => auth.SetPermissionKey(PermissionKeys.ManageArticle));
            Registry.Register<ArticleController, DefaultAuthorizeAttribute>(m => m.Create(null), auth => auth.SetPermissionKey(PermissionKeys.ManageArticle));
            Registry.Register<ArticleController, DefaultAuthorizeAttribute>(m => m.Edit(0), auth => auth.SetPermissionKey(PermissionKeys.ManageArticle));
            Registry.Register<ArticleController, DefaultAuthorizeAttribute>(m => m.Edit(null), auth => auth.SetPermissionKey(PermissionKeys.ManageArticle));
            Registry.Register<ArticleController, DefaultAuthorizeAttribute>(m => m.Delete(null), auth => auth.SetPermissionKey(PermissionKeys.ManageArticle));
            Registry.Register<ArticleController, DefaultAuthorizeAttribute>(m => m.GetList(), auth => auth.SetPermissionKey(PermissionKeys.ViewArticle));

            Registry.Register<ArticleTypeController, DefaultAuthorizeAttribute>(m => m.Index(), auth => auth.SetPermissionKey(PermissionKeys.ViewArticleType));
            Registry.Register<ArticleTypeController, DefaultAuthorizeAttribute>(m => m.Create(), auth => auth.SetPermissionKey(PermissionKeys.ManageArticleType));
            Registry.Register<ArticleTypeController, DefaultAuthorizeAttribute>(m => m.Create(null), auth => auth.SetPermissionKey(PermissionKeys.ManageArticleType));
            Registry.Register<ArticleTypeController, DefaultAuthorizeAttribute>(m => m.Edit(0), auth => auth.SetPermissionKey(PermissionKeys.ManageArticleType));
            Registry.Register<ArticleTypeController, DefaultAuthorizeAttribute>(m => m.Edit(null), auth => auth.SetPermissionKey(PermissionKeys.ManageArticleType));
            Registry.Register<ArticleTypeController, DefaultAuthorizeAttribute>(m => m.Delete(null), auth => auth.SetPermissionKey(PermissionKeys.ManageArticleType));
            Registry.Register<ArticleTypeController, DefaultAuthorizeAttribute>(m => m.GetList(), auth => auth.SetPermissionKey(PermissionKeys.ViewArticleType));
        }

    }
}