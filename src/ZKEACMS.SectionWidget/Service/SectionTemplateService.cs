/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;
using Easy;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionTemplateService : ServiceBase<SectionTemplate>, ISectionTemplateService
    {
        public SectionTemplateService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }
    }
}