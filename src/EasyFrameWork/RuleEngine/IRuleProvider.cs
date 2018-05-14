namespace Easy.RuleEngine
{
    public interface IRuleProvider
    {
        void Process(RuleContext ruleContext, object workContext);
    }
}