using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using Easy.Extend;
using ZKEACMS.Extend;

namespace ZKEACMS.Rule
{
    public class RuleService : ServiceBase<Rule>, IRuleService
    {
        public RuleService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        public override ServiceResult<Rule> Add(Rule item)
        {
           item.RuleItemList.RemoveDeletedItems().ToList();
            return base.Add(item);
        }
        public override ServiceResult<Rule> Update(Rule item)
        {
            return base.Update(item);
        }
    }
}
