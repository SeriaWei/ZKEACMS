/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.DependencyInjection;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Event;

namespace ZKEACMS.Test.Event
{
    [TestClass]
    public class EventTest
    {
        private readonly IServiceProvider _serviceProvider;
        public EventTest()
        {
            var serviceCollection = new ServiceCollection();
            serviceCollection.AddTransient<IEventManager, EventManager>();

            serviceCollection.RegistEvent<TestEventHandler>("Test");
            _serviceProvider = serviceCollection.BuildServiceProvider();
        }
        [TestMethod]
        public void TestTrigger()
        {
            _serviceProvider.GetService<IEventManager>().Trigger("Test", new object());
            _serviceProvider.GetService<IEventManager>().Trigger(new EventArg { Name = "Test" }, new object());
        }
    }
    public class TestEventHandler : IEventHandler
    {
        public void Handle(object entity, EventArg e)
        {
            Assert.IsNotNull(entity);
            Assert.IsNotNull(e);
            Assert.IsTrue(e.Name == "Test");
        }
    }
}
