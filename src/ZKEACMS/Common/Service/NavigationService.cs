/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using ZKEACMS.Common.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Safety;

namespace ZKEACMS.Common.Service
{
    public class NavigationService : ServiceBase<NavigationEntity, CMSDbContext>, INavigationService
    {
        private readonly IHtmlSanitizer _htmlSanitizer;
        public NavigationService(IApplicationContext applicationContext, CMSDbContext dbContext, IHtmlSanitizer htmlSanitizer) : base(applicationContext, dbContext)
        {
            _htmlSanitizer = htmlSanitizer;
        }
        public override DbSet<NavigationEntity> CurrentDbSet => DbContext.Navigation;
        public override ErrorOr<NavigationEntity> Add(NavigationEntity item)
        {
            if (item.ParentId.IsNullOrEmpty())
            {
                item.ParentId = "#";
            }
            item.ID = Guid.NewGuid().ToString("N");
            Santize(item);
            return base.Add(item);
        }

        public override ErrorOr<NavigationEntity> AddRange(params NavigationEntity[] items)
        {
            foreach (var item in items)
            {
                Santize(item);
            }
            return base.AddRange(items);
        }

        public override ErrorOr<NavigationEntity> Update(NavigationEntity item)
        {
            Santize(item);
            return base.Update(item);
        }

        public override ErrorOr<NavigationEntity> UpdateRange(params NavigationEntity[] items)
        {
            foreach (var item in items)
            {
                Santize(item);
            }
            return base.UpdateRange(items);
        }

        public override void Remove(NavigationEntity item)
        {
            Remove(m => m.ParentId == item.ID);
            base.Remove(item);
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

            IEnumerable<NavigationEntity> navs = CurrentDbSet.AsTracking().Where(m => m.ParentId == nav.ParentId && m.ID != nav.ID).OrderBy(m => m.DisplayOrder);

            int order = 1;
            for (int i = 0; i < navs.Count(); i++)
            {
                var eleNav = navs.ElementAt(i);
                if (i == position - 1)
                {
                    order++;
                }
                eleNav.DisplayOrder = order;
                order++;
            }
            Update(nav);
        }

        private void Santize(NavigationEntity item)
        {
            item.Title = _htmlSanitizer.Sanitize(item.Title);
            item.Html = _htmlSanitizer.Sanitize(item.Html);
        }
    }
}