/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace Easy.Modules.MutiLanguage
{
    public class LanguageService : ServiceBase<LanguageEntity, EasyDbContext>, ILanguageService
    {
        public LanguageService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<LanguageEntity> CurrentDbSet
        {
            get { return DbContext.Language; }
        }
        
    }
}
