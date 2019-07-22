/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections.Generic;

namespace Easy.Modules.MutiLanguage
{
    public interface ILanguageService : IService<LanguageEntity>
    {
        IEnumerable<LanguageEntity> GetCultures(string lanKey);
        ServiceResult<LanguageEntity> AddOrUpdate(LanguageEntity entity);
    }
}
