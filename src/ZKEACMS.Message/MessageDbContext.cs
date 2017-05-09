using Microsoft.EntityFrameworkCore;
using ZKEACMS.Message.Models;

namespace ZKEACMS.Message
{
    public class MessageDbContext : CMSDbContext
    {
        internal DbSet<MessageEntity> Message { get; set; }
    }
}
