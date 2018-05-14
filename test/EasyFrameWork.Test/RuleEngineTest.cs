using Easy;
using Easy.Mvc;
using Easy.RuleEngine;
using Easy.RuleEngine.RuleProviders;
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
            serviceCollection.AddTransient<IRuleProvider, CommonMethodsRuleProvider>();
            serviceCollection.AddTransient<IScriptExpressionEvaluator, ScriptExpressionEvaluator>();



            ServiceProvider = serviceCollection.BuildServiceProvider();
        }
        [TestMethod]
        public void TestRuleManager()
        {
            var ruleManger = ServiceProvider.GetService<IRuleManager>();
            Assert.IsTrue(ruleManger.Matches("In('1',['1','2','3'])", null));
            Assert.IsTrue(ruleManger.Matches("In(1,[1,2,3])", null));
            Assert.IsTrue(ruleManger.Matches("Equals(1,1)", null));
            Assert.IsTrue(ruleManger.Matches("Equals('1','1')", null));
            Assert.IsTrue(ruleManger.Matches("NotEquals('1',1)", null));
            Assert.IsTrue(ruleManger.Matches("StartsWith('123','1')", null));
            Assert.IsTrue(ruleManger.Matches("EndsWith('123','3')", null));
            Assert.IsTrue(ruleManger.Matches("Contains('123','2')", null));
            Assert.IsTrue(ruleManger.Matches("NotStartsWith('123','2')", null));
            Assert.IsTrue(ruleManger.Matches("NotEndsWith('123','2')", null));
            Assert.IsTrue(ruleManger.Matches("NotContains('123','4')", null));
            Assert.IsTrue(ruleManger.Matches("IsBlank('')", null));
            Assert.IsTrue(ruleManger.Matches("IsNotBlank('3')", null));
            Assert.IsTrue(ruleManger.Matches("3>1", null));
            Assert.IsTrue(ruleManger.Matches("ValueOf(1)==1", null));
        }
    }
}
