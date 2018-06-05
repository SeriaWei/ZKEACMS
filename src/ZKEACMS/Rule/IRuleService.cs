using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Rule
{
    public interface IRuleService : IService<Rule>
    {
        IEnumerable<Rule> GetMatchRule(RuleWorkContext ruleWorkContext);
    }
}
