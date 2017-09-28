using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;

namespace ZKEACMS.FormGenerator
{
    public class FormGeneratorDbContext : DbContextBase
    {
        public FormGeneratorDbContext(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring)
            : base(modelCreatings, configuring)
        {
        }
        internal DbSet<Form> Form { get; set; }
    }
}
