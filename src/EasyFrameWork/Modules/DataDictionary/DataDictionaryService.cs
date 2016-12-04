/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;

namespace Easy.Modules.DataDictionary
{
    public class DataDictionaryService : ServiceBase<DataDictionaryEntity>, IDataDictionaryService
    {
        public DataDictionaryService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }
    }
}
