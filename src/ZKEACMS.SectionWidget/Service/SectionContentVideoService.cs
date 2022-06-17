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
    public class SectionContentVideoService : ServiceBase<SectionContentVideo, CMSDbContext>, ISectionContentService
    {
        public SectionContentVideoService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }     

        public SectionContentBase.Types ContentType
        {
            get { return SectionContentBase.Types.Video; }
        }

        public override IQueryable<SectionContentVideo> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public void AddContent(SectionContent content)
        {
            Add(content as SectionContentVideo);
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
            Update(content as SectionContentVideo);
        }
    }
}