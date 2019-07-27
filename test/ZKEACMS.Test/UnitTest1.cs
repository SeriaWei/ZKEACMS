///* http://www.zkea.net/ 
// * Copyright 2018 ZKEASOFT 
// * http://www.zkea.net/licenses */

//using Microsoft.VisualStudio.TestTools.UnitTesting;
//using OpenQA.Selenium;
//using OpenQA.Selenium.Support.UI;

//namespace ZKEACMS.Test
//{
//    [TestClass]
//    public class UnitTest1 : SeleniumTester
//    {
//        public void Login()
//        {
//            GoToUrl("/admin");
//            WebDriver.FindElement(By.Id("userName")).SendKeys("admin");
//            WebDriver.FindElement(By.Id("password")).SendKeys("admin");
//            WebDriver.FindElement(By.CssSelector("input.btn-login")).Click();
//        }
//        public void LogOut()
//        {
//            GoToUrl("/Account/Logout");
//        }
//        [TestMethod]
//        public void LoadAllPage()
//        {
//            Login();

//            GoToUrl("/admin/Layout");
//            GoToUrl("/admin/Layout/LayoutWidget");
//            GoToUrl("/admin/Page");
//            GoToUrl("/admin/Navigation");
//            GoToUrl("/admin/Theme");
//            GoToUrl("/admin/Media");
//            GoToUrl("/admin/Carousel");
//            GoToUrl("/Admin/Message");
//            GoToUrl("/Admin/Message");
//            GoToUrl("/admin/Order");
//            GoToUrl("/admin/AliPay/Setting");
//            GoToUrl("/admin/Article");
//            GoToUrl("/admin/ArticleType");
//            GoToUrl("/Admin/Form");

//            GoToUrl("/Admin/FormData");
//        }
//        [TestMethod]
//        public void Page()
//        {
//            Login();
//            GoToUrl("/admin/Page");
//            WebDriver.FindElement(By.CssSelector("#pageZones .panel-footer .btn:last-child")).Click();
//            Wait(1);
//            WebDriver.FindElement(By.Id("MessageBoxOkBtn")).Click();
//            Wait(1);
//            WebDriver.FindElement(By.CssSelector("#pageZones > div > div.panel-footer > div > a:nth-child(3)")).Click();
//            Wait(1);
//            WebDriver.FindElement(By.CssSelector(".old-versions .revert")).Click();
//            Wait(1);
//            WebDriver.FindElement(By.Id("MessageBoxOkBtn")).Click();
//            Wait(1);
//            WebDriver.FindElement(By.CssSelector(".old-versions .remove")).Click();
//            Wait(1);
//            WebDriver.FindElement(By.Id("MessageBoxOkBtn")).Click();
//            Wait(1);
//            LogOut();
//        }
//    }
//}
