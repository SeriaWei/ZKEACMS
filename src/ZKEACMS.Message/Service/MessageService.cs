using ZKEACMS.Message.Models;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.Message.Service
{
    public class MessageService : ServiceBase<MessageEntity>, IMessageService
    {
        public MessageService(IApplicationContext applicationContext, MessageDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override DbSet<MessageEntity> CurrentDbSet
        {
            get { return (DbContext as MessageDbContext).Message; }
        }
    }
}