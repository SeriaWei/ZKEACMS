/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.WidgetTemplate
{
    public class WidgetTemplateService : ServiceBase<WidgetTemplateEntity,CMSDbContext>, IWidgetTemplateService
    {
        public WidgetTemplateService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<WidgetTemplateEntity> CurrentDbSet
        {
            get
            {
                return DbContext.WidgetTemplate;
            }
        }
    }
}
