/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Cache;
using Easy.Extend;
using Easy.Mvc;
using Easy.RuleEngine;
using Easy.RuleEngine.RuleProviders;
using Easy.RuleEngine.Scripting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

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
            serviceCollection.AddTransient<IRuleProvider, ValueOfRuleProvider>();
            serviceCollection.AddTransient<IRuleProvider, DateRuleProvider>();
            serviceCollection.AddTransient<IRuleProvider, MoneyRuleProvider>();
            serviceCollection.AddTransient<IScriptExpressionEvaluator, ScriptExpressionEvaluator>();

            serviceCollection.AddSingleton<ICacheProvider, DefaultCacheProvider>();
            serviceCollection.AddSingleton(serviceProvider => serviceProvider.GetService<ICacheProvider>().Build<ScriptExpressionResult>());

            ServiceProvider = serviceCollection.BuildServiceProvider();
        }
        [TestMethod]
        public void TestCommonMethod()
        {
            var ruleManger = ServiceProvider.GetService<IRuleManager>();
            Assert.IsTrue(ruleManger.IsTrue("In('1',['1','2','3'])"));
            Assert.IsTrue(ruleManger.IsTrue("In(1,[1,2,3])"));
            Assert.IsTrue(ruleManger.IsTrue("Equals(1,1)"));
            Assert.IsTrue(ruleManger.IsTrue("Equals('1','1')"));
            Assert.IsTrue(ruleManger.IsTrue("NotEquals('1',1)"));
            Assert.IsTrue(ruleManger.IsTrue("StartsWith('123','1')"));
            Assert.IsTrue(ruleManger.IsTrue("EndsWith('123','3')"));
            Assert.IsTrue(ruleManger.IsTrue("Contains('123','2')"));
            Assert.IsTrue(ruleManger.IsTrue("NotStartsWith('123','2')"));
            Assert.IsTrue(ruleManger.IsTrue("NotEndsWith('123','2')"));
            Assert.IsTrue(ruleManger.IsTrue("NotContains('123','4')"));
            Assert.IsTrue(ruleManger.IsTrue("IsBlank('')"));
            Assert.IsTrue(ruleManger.IsTrue("IsNotBlank('3')"));
            Assert.IsTrue(ruleManger.IsTrue("3>1"));
            Assert.IsTrue(ruleManger.IsTrue("3.1>1.0 and 2>1"));
            Assert.IsTrue(ruleManger.IsTrue("3.1>1.0 or 2<1"));
            Assert.IsTrue(ruleManger.IsTrue("3.1>1.0 && 2>1"));
            Assert.IsTrue(ruleManger.IsTrue("3.1>1.0 || 2<1"));
            Assert.IsTrue(ruleManger.IsTrue("Money('3.1')>1.0 || 2<1"));
        }
        [TestMethod]
        public void TestValueOf()
        {
            var ruleManger = ServiceProvider.GetService<IRuleManager>();
            Assert.IsTrue(ruleManger.IsTrue("In(ValueOf('Name'),['A','B','C'])", new { Name = "A" }));
            Assert.IsTrue(ruleManger.IsTrue("ValueOf('Name')=='A'", new { Name = "A" }));
            Assert.IsTrue(ruleManger.IsTrue("In(ValueOf('Name',2),['A','B','C'])", new { Name = new string[] { "A", "B", "C" } }));
            Assert.IsTrue(ruleManger.Value("ValueOf('Name')", new { Name = "A" }).Equals("A"));
        }
        [TestMethod]
        public void TestDate()
        {
            var ruleManger = ServiceProvider.GetService<IRuleManager>();
            Assert.IsTrue(ruleManger.Value("Date('2018-05-15')") is DateTime);
        }
    }
}
