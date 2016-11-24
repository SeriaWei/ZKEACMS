/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using ZKEACMS.Common.Models;

namespace ZKEACMS.Common.Service
{
    public class NavigationService : ServiceBase<NavigationEntity>, INavigationService
    {
        public override void Add(NavigationEntity item)
        {
            if (item.ParentId.IsNullOrEmpty())
            {
                item.ParentId = "#";
            }
            item.ID = Guid.NewGuid().ToString("N");
            base.Add(item);
        }
        public override void Remove(NavigationEntity item)
        {
            Remove(m => m.ParentId == item.ID);
            base.Remove(item);
        }
        public override void Remove(params object[] primaryKey)
        {
            Remove(Get(primaryKey));
        }
        public override void RemoveRange(params NavigationEntity[] items)
        {
            items.Each(m =>
            {
                Remove(n => n.ParentId == m.ID);
            });
            base.RemoveRange(items);
        }
        public override void Remove(Expression<Func<NavigationEntity, bool>> filter)
        {
            Get(filter).Each(m =>
            {
                Remove(n => n.ParentId == m.ID);
            });
            base.Remove(filter);
        }

        public void Move(string id, string parentId, int position, int oldPosition)
        {
            var nav = Get(id);
            nav.ParentId = parentId;
            nav.DisplayOrder = position;

            IEnumerable<NavigationEntity> navs = null;

            navs = DbContext.Instance.Where(m => m.ParentId == nav.ParentId && m.ID != nav.ID).OrderBy(m => m.DisplayOrder);

            int order = 1;
            for (int i = 0; i < navs.Count(); i++)
            {
                var eleNav = navs.ElementAt(i);
                if (i == position - 1)
                {
                    order++;
                }
                eleNav.DisplayOrder = order;
                Update(eleNav);
                order++;
            }
            Update(nav);
        }
    }
}