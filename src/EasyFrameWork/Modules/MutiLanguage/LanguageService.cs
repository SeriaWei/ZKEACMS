/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace Easy.Modules.MutiLanguage
{
    public class LanguageService : ServiceBase<LanguageEntity>, ILanguageService
    {
        public LanguageService(IApplicationContext applicationContext, EasyDbContext easyDbContext) : base(applicationContext, easyDbContext)
        {
        }

        public override DbSet<LanguageEntity> CurrentDbSet
        {
            get { return (DbContext as EasyDbContext).Language; }
        }

    }
}
