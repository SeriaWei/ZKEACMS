/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentCallToActionService : ServiceBase<SectionContentCallToAction, SectionDbContext>, ISectionContentService
    {
        public SectionContentCallToActionService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<SectionContentCallToAction> CurrentDbSet
        {
            get
            {
                return DbContext.SectionContentCallToAction;
            }
        }
        public SectionContentBase.Types ContentType
        {
            get { return SectionContentBase.Types.CallToAction; }
        }


        public void AddContent(SectionContent content)
        {
            Add(content as SectionContentCallToAction);
        }

        public void DeleteContent(int contentId)
        {
            Remove(contentId);
        }


        public SectionContent GetContent(int contentId)
        {
            return Get(contentId);
        }


        public void UpdateContent(SectionContent content)
        {
            Update(content as SectionContentCallToAction);
        }
    }
}