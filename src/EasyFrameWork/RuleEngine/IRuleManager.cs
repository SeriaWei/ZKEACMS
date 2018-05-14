namespace Easy.RuleEngine
{
    public interface IRuleManager
    {
        bool Matches(string expression, object workContext);
    }
}