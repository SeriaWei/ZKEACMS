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
        ErrorOr<LanguageEntity> Add(LanguageEntity entity);
        ErrorOr<LanguageEntity> AddOrUpdate(LanguageEntity entity);
        IEnumerable<LanguageEntity> Get(Expression<Func<LanguageEntity, bool>> expression, Pagination pagination);
        IEnumerable<LanguageEntity> GetCultures(string lanKey);
        LanguageEntity Get(string lanKey, string cultureName);
        ErrorOr<LanguageEntity> Update(LanguageEntity entity);
        string[] GetCultureCodes();
    }
}
