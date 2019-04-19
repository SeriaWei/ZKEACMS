/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Message.Models;

namespace ZKEACMS.Message
{
    public class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<MessageEntity>();
            modelBuilder.Entity<Comments>();
        }
    }
}
