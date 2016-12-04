/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.RepositoryPattern;

namespace ZKEACMS.ExtendField
{
    public class ExtendFieldService : ServiceBase<ExtendFieldEntity>, IExtendFieldService
    {
        public ExtendFieldService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }
    }
}