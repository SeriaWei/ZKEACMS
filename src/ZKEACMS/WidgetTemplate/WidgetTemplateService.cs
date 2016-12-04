/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.RepositoryPattern;

namespace ZKEACMS.WidgetTemplate
{
    public class WidgetTemplateService : ServiceBase<WidgetTemplateEntity>, IWidgetTemplateService
    {
        public WidgetTemplateService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }
    }
}
