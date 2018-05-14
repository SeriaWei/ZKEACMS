using Easy;
using Easy.Mvc;
using Easy.RuleEngine;
using Easy.RuleEngine.Scripting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace EasyFrameWork.Test
{
    [TestClass]
    public class RuleEngineTest
    {
        public ServiceProvider ServiceProvider { get; set; }
        public RuleEngineTest()
        {
            var serviceCollection = new ServiceCollection();
            serviceCollection.AddTransient<IRuleManager, RuleManager>();
            serviceCollection.AddTransient<IRuleProvider, OperatorRuleBase>();
            serviceCollection.AddTransient<IScriptExpressionEvaluator, ScriptExpressionEvaluator>();

           

            ServiceProvider = serviceCollection.BuildServiceProvider();
        }
        [TestMethod]
        public void TestRuleManager()
        {
            ServiceProvider.GetService<IRuleManager>().Matches("In('1','1;2;3')", null);
        }
    }
}
