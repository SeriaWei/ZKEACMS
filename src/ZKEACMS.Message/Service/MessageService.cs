using ZKEACMS.Message.Models;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.Message.Service
{
    public class MessageService : ServiceBase<MessageEntity>, IMessageService
    {
        public MessageService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        
    }
}