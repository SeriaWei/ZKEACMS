using System.Collections.Generic;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Message.Models;

namespace ZKEACMS.Message
{
    public class MessageDbContext : CMSDbContext
    {
        public MessageDbContext(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring) : base(modelCreatings, configuring)
        {
        }

        internal DbSet<MessageEntity> Message { get; set; }
        internal DbSet<Comments> Comments { get; set; }
    }
}
