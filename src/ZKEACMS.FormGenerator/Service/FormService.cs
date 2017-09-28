using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Microsoft.EntityFrameworkCore;
using Easy;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormService : ServiceBase<Form>, IFormService
    {
        public FormService(IApplicationContext applicationContext, FormGeneratorDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override DbSet<Form> CurrentDbSet => (DbContext as FormGeneratorDbContext).Form;
    }
}
