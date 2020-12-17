/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Updater.Models;

namespace ZKEACMS.Updater
{
    public class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DBVersion>();
        }
    }
}
