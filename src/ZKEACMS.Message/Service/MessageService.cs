using ZKEACMS.Message.Models;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.Message.Service
{
    public class MessageService : ServiceBase<MessageEntity, MessageDbContext>, IMessageService
    {
        public MessageService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<MessageEntity> CurrentDbSet
        {
            get { return DbContext.Message; }
        }
    }
}