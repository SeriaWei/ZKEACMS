/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Easy.Modules.MutiLanguage
{
    public interface ILanguageService
    {
        ServiceResult<LanguageEntity> Add(LanguageEntity entity);
        ServiceResult<LanguageEntity> AddOrUpdate(LanguageEntity entity);
        IEnumerable<LanguageEntity> Get(Expression<Func<LanguageEntity, bool>> expression, Pagination pagination);
        IEnumerable<LanguageEntity> GetCultures(string lanKey);
        LanguageEntity Get(string lanKey, string cultureName);
        ServiceResult<LanguageEntity> Update(LanguageEntity entity);
    }
}
