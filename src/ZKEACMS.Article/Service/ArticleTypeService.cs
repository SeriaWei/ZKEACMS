/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Web.CMS.Article.Models;
using Easy.Web.CMS.Article.Service;
using Microsoft.Practices.ServiceLocation;

namespace ZKEACMS.Article.Service
{
    public class ArticleTypeService : ServiceBase<ArticleType>, IArticleTypeService
    {
        private IArticleService _articleService;

        public override void Add(ArticleType item)
        {
            item.ParentID = item.ParentID ?? 0;
            base.Add(item);
        }

        public IEnumerable<ArticleType> GetChildren(long id)
        {
            return Get(m => m.ParentID == id);
        }

        public override int Delete(params object[] primaryKeys)
        {
            _articleService = _articleService ?? ServiceLocator.Current.GetInstance<IArticleService>();
            var item = Get(primaryKeys);
            if (item != null)
            {
                GetChildren(item.ID ?? 0).Each(m =>
                {
                    _articleService.Delete(n => n.ArticleTypeID == m.ID);
                    Delete(m.ID);
                });
                _articleService.Delete(n => n.ArticleTypeID == item.ID);
            }
            return base.Delete(primaryKeys);
        }
    }
}