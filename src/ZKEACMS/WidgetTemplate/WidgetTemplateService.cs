/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.WidgetTemplate
{
    public class WidgetTemplateService : ServiceBase<WidgetTemplateEntity>, IWidgetTemplateService
    {
        public WidgetTemplateService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override DbSet<WidgetTemplateEntity> CurrentDbSet
        {
            get
            {
                return (DbContext as CMSDbContext).WidgetTemplate;
            }
        }
    }
}
