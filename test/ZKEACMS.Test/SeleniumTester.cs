//using System;
//using System.Collections.Generic;
//using System.IO;
//using System.Text;
//using OpenQA.Selenium;
//using OpenQA.Selenium.Chrome;

//namespace ZKEACMS.Test
//{
//    public class SeleniumTester : IDisposable
//    {

//        public SeleniumTester()
//        {
//            ChromeDriverService chromeDriverService = ChromeDriverService.CreateDefaultService(Directory.GetCurrentDirectory());
//            chromeDriverService.HostName = "127.0.0.1";

//            chromeDriverService.HideCommandPromptWindow = true;

//            WebDriver = new ChromeDriver(chromeDriverService);

//            WebDriver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
//        }

//        public IWebDriver WebDriver { get; set; }

//        public virtual void GoToUrl(string url)
//        {
//            WebDriver.Navigate().GoToUrl($"http://localhost:5000{url}");
//        }
//        public void Wait(int seconds)
//        {
//            System.Threading.Thread.Sleep(seconds * 1000);
//        }
//        public void Dispose()
//        {
//            WebDriver.Quit();
//        }
//    }
//}
