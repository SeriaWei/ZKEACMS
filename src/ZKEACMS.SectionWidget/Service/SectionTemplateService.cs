/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionTemplateService : ServiceBase<SectionTemplate,SectionDbContext>, ISectionTemplateService
    {
        public SectionTemplateService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<SectionTemplate> CurrentDbSet
        {
            get
            {
                return DbContext.SectionTemplate;
            }
        }
    }
}