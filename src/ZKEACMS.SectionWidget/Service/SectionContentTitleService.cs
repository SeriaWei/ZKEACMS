/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentTitleService : ServiceBase<SectionContentTitle, CMSDbContext>, ISectionContentService, ISectionContentTitleService
    {
        public SectionContentTitleService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public SectionContentBase.Types ContentType
        {
            get { return SectionContentBase.Types.Title; }
        }

        public override IQueryable<SectionContentTitle> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public void AddContent(SectionContent content)
        {
            Add(content as SectionContentTitle);
        }

        public void DeleteContent(string contentId)
        {
            Remove(contentId);
        }

        public SectionContent GetContent(string contentId)
        {
            return Get(contentId);
        }


        public void UpdateContent(SectionContent content)
        {
            Update(content as SectionContentTitle);
        }

        public void UpdateDetailPageUrl(string oldUrl, string newUrl)
        {
            var contents = Get(m => m.Href == oldUrl || m.Href.StartsWith(oldUrl + "/"));
            foreach (var item in contents)
            {
                item.Href = newUrl + item.Href.Substring(oldUrl.Length);
            }
            UpdateRange(contents.ToArray());
        }
    }
}