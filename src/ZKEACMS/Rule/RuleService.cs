using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using Easy.Extend;
using ZKEACMS.Extend;
using System.Linq;
using Newtonsoft.Json;

namespace ZKEACMS.Rule
{
    public class RuleService : ServiceBase<Rule>, IRuleService
    {
        public RuleService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        private Rule Init(Rule item)
        {
            item.RuleItemList = item.RuleItemList.RemoveDeletedItems().ToList();
            item.RuleItems = JsonConvert.SerializeObject(item.RuleItemList);
            StringBuilder expressionBuilder = new StringBuilder();
            foreach (var ruleItem in item.RuleItemList)
            {
                if (expressionBuilder.Length == 0)
                {
                    expressionBuilder.AppendFormat("{0}({1},\"{2}\")", ruleItem.FunctionName, ruleItem.Property, ruleItem.Value);
                }
                else
                {
                    expressionBuilder.AppendFormat(" {3} {0}({1},\"{2}\")", ruleItem.FunctionName, ruleItem.Property, ruleItem.Value, ruleItem.Condition);
                }
            }
            item.RuleExpression = expressionBuilder.ToString();
            return item;
        }
        public override ServiceResult<Rule> Add(Rule item)
        {
            return base.Add(Init(item));
        }
        public override ServiceResult<Rule> Update(Rule item)
        {
            return base.Update(Init(item));
        }
        public override Rule Get(params object[] primaryKey)
        {
            var rule= base.Get(primaryKey);
            if (rule.RuleItems.IsNotNullAndWhiteSpace())
            {
                rule.RuleItemList = JsonConvert.DeserializeObject<List<RuleItem>>(rule.RuleItems);
            }
            return rule;
        }
    }
}
