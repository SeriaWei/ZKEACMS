/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentImageService : ServiceBase<SectionContentImage>, ISectionContentService
    {
        public SectionContentImageService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        
        public SectionContentBase.Types ContentType
        {
            get { return SectionContentBase.Types.Image; }
        }



        public void AddContent(SectionContent content)
        {
            Add(content as SectionContentImage);
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
            Update(content as SectionContentImage);
        }
    }
}