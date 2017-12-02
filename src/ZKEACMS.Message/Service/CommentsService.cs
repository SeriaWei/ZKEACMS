using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Easy;
using ZKEACMS.Message.Models;

namespace ZKEACMS.Message.Service
{
    public class CommentsService : ServiceBase<Comments>, ICommentsService
    {
        public CommentsService(IApplicationContext applicationContext, MessageDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override DbSet<Comments> CurrentDbSet => (DbContext as MessageDbContext).Comments;
    }
}
