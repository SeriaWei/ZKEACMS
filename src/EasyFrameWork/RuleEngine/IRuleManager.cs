namespace Easy.RuleEngine
{
    public interface IRuleManager
    {
        bool Matches(string expression, object workContext);
        object Value(string expression, object workContext);
    }
}