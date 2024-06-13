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
using ZKEACMS.Account;

namespace ZKEACMS.Test.Account
{
    [TestClass]
    public class UserCenterLinkTest
    {
        private readonly IServiceProvider _serviceProvider;
        public UserCenterLinkTest()
        {
            var serviceCollection = new ServiceCollection();
            serviceCollection.AddTransient<IUserCenterLinkService, UserCenterLinkService>();

            serviceCollection.AddTransient(provider =>
            {
                var userCenterLinksProvider = new Mock<IUserCenterLinksProvider>();
                userCenterLinksProvider.Setup(m => m.GetLinks()).Returns(new List<AdminMenu>
                {
                    new AdminMenu
                    {
                         Title="Menu1"
                    },
                    new AdminMenu
                    {
                         Title="Menu2"
                    }
                });
                return userCenterLinksProvider.Object;
            });
            serviceCollection.AddTransient(provider =>
            {
                var userCenterLinksProvider = new Mock<IUserCenterLinksProvider>();
                userCenterLinksProvider.Setup(m => m.GetLinks()).Returns(new List<AdminMenu>
                {
                    new AdminMenu
                    {
                         Title="Menu3"
                    },
                    new AdminMenu
                    {
                         Title="Menu4"
                    }
                });
                return userCenterLinksProvider.Object;
            });
            _serviceProvider = serviceCollection.BuildServiceProvider();
        }
        [TestMethod]
        public void TestGetLinks()
        {
            var links = _serviceProvider.GetService<IUserCenterLinkService>().GetLinks();
            Assert.IsTrue(links.Count() == 4);
        }
    }
}
