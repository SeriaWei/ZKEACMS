/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
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
using ZKEACMS.Widget;
using Easy.RuleEngine;

namespace ZKEACMS.Rule
{
    public class RuleService : ServiceBase<Rule, CMSDbContext>, IRuleService
    {
        private readonly IWidgetBasePartService _widgetBasePartService;
        private readonly IWidgetActivator _widgetActivator;
        private readonly IRuleManager _ruleManager;
        private readonly ILocalize _localize;
        public RuleService(IApplicationContext applicationContext,
            IWidgetBasePartService widgetBasePartService,
            IWidgetActivator widgetActivator, IRuleManager
            ruleManager, CMSDbContext dbContext,
            ILocalize localize)
            : base(applicationContext, dbContext)
        {
            _widgetBasePartService = widgetBasePartService;
            _widgetActivator = widgetActivator;
            _ruleManager = ruleManager;
            _localize = localize;
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
                    expressionBuilder.AppendFormat("{0}({1},{2})", ruleItem.FunctionName, ruleItem.Property, FormatValue(ruleItem.Value));
                }
                else
                {
                    expressionBuilder.AppendFormat(" {3} {0}({1},{2})", ruleItem.FunctionName, ruleItem.Property, FormatValue(ruleItem.Value), ruleItem.Condition);
                }
            }
            item.RuleExpression = expressionBuilder.ToString();
            if (item.RuleExpression.IsNullOrWhiteSpace())
            {
                item.RuleExpression = "false";
            }
            return item;
        }
        bool IsDigitCharacter(char ch)
        {
            return ch >= '0' && ch <= '9';
        }
        private string FormatValue(string value)
        {
            if (value.StartsWith("[") && value.EndsWith("]"))
                return value;
            if (value.All(c => IsDigitCharacter(c)) || 
                (value.StartsWith("Date(") && value.EndsWith(")")) ||
                (value.StartsWith("Money(") && value.EndsWith(")")))
            {
                return value;
            }
            return string.Format("'{0}'", value.Replace("\\", "\\\\").Replace("'", "\\'"));
        }
        public override ServiceResult<Rule> Add(Rule item)
        {
            item = Init(item);
            try
            {
                _ruleManager.IsTrue(item.RuleExpression, new RuleWorkContext { });
            }
            catch
            {
                var result = new ServiceResult<Rule>();
                result.RuleViolations.Add(new RuleViolation("Title", _localize.Get("There is an error value in the condition, save failed!")));
                return result;
            }
            return base.Add(item);
        }
        public override ServiceResult<Rule> Update(Rule item)
        {
            item = Init(item);
            try
            {
                _ruleManager.IsTrue(item.RuleExpression, new RuleWorkContext { });
            }
            catch
            {
                var result = new ServiceResult<Rule>();
                result.RuleViolations.Add(new RuleViolation("Title", _localize.Get("There is an error value in the condition, save failed!")));
                return result;
            }
            return base.Update(item);
        }
        public override Rule Get(params object[] primaryKey)
        {
            var rule = base.Get(primaryKey);
            if (rule.RuleItems.IsNotNullAndWhiteSpace())
            {
                rule.RuleItemList = JsonConvert.DeserializeObject<List<RuleItem>>(rule.RuleItems);
            }
            return rule;
        }
        public override void Remove(Rule item)
        {
            _widgetBasePartService.Get(m => m.RuleID == item.RuleID).Each(widget => { _widgetActivator.Create(widget).DeleteWidget(widget.ID); });

            base.Remove(item);
        }

        public IEnumerable<Rule> GetMatchRule(RuleWorkContext ruleWorkContext)
        {
            return Get(m => m.Status == (int)Easy.Constant.RecordStatus.Active).Where(rule => _ruleManager.IsTrue(rule.RuleExpression, ruleWorkContext)).ToList();
        }
    }
}
