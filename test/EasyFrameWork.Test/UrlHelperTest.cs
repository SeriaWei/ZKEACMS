using Easy;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;

namespace EasyFrameWork.Test
{
    [TestClass]
    public class UrlHelperTest
    {
        [TestMethod]
        public void TestCombine()
        {
            Assert.IsTrue(Helper.Url.Combine("home", "index") == "~/home/index");
        }
        [TestMethod]
        public void TestContainsScheme()
        {
            Assert.IsTrue(Helper.Url.ContainsScheme("http://www.zkea.net"));
            Assert.IsTrue(Helper.Url.ContainsScheme("https://www.zkea.net"));
            Assert.IsTrue(Helper.Url.ContainsScheme("ftp://www.zkea.net"));
            Assert.IsTrue(Helper.Url.ContainsScheme("file://www.zkea.net"));
        }
        [TestMethod]
        public void TestToVirtualPath()
        {
            Assert.IsTrue(Helper.Url.ToVirtualPath("home/index") == "~/home/index");
            Assert.IsTrue(Helper.Url.ToVirtualPath("/home/index") == "~/home/index");
            Assert.IsTrue(Helper.Url.ToVirtualPath("~/home/index") == "~/home/index");
        }
        [TestMethod]
        public void TestToAbsolutePath()
        {
            Assert.IsTrue(Helper.Url.ToAbsolutePath("home/index") == "/home/index");
            Assert.IsTrue(Helper.Url.ToAbsolutePath("/home/index") == "/home/index");
            Assert.IsTrue(Helper.Url.ToAbsolutePath("~/home/index") == "/home/index");
        }
    }
}
