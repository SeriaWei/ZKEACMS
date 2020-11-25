/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;
using Version = Easy.Version;

namespace EasyFrameWork.Test
{
    [TestClass]
    public class VersionTest
    {
        [TestMethod]
        public void TestParse()
        {
            Version v = Version.Parse("1.1");
            Assert.IsTrue(v.Major == 1 && v.Minor == 1 && v.Revision == 0 && v.Build == 0);

            v = Version.Parse("1.1.2");
            Assert.IsTrue(v.Major == 1 && v.Minor == 1 && v.Revision == 2 && v.Build == 0);

            v = Version.Parse("1.1.2.3");
            Assert.IsTrue(v.Major == 1 && v.Minor == 1 && v.Revision == 2 && v.Build == 3);
        }

        [TestMethod]
        public void TestEquals()
        {
            Version v1 = Version.Parse("1.1");
            Version v2 = Version.Parse("1.1");

            Assert.IsTrue(v1 == v2);

            Assert.IsTrue(v1.Equals(v2));
        }
        [TestMethod]
        public void TestNotEquals()
        {
            Version v1 = Version.Parse("1.2");
            Version v2 = Version.Parse("1.1");

            Assert.IsTrue(v1 != v2);
        }
        [TestMethod]
        public void TestGreaterLessThan()
        {
            Version v1 = Version.Parse("0.1.1.1");
            Version v2 = Version.Parse("1.2");

            Assert.IsTrue(v1 < v2);
            Assert.IsTrue(v2 > v1);
        }

        [TestMethod]
        public void TestGreaterLessAndEqual()
        {
            Assert.IsTrue(Version.Parse("1.2") <= Version.Parse("1.2"));
            Assert.IsTrue(Version.Parse("1.2.1") <= Version.Parse("1.2.1"));
            Assert.IsTrue(Version.Parse("1.2.1.1") <= Version.Parse("1.2.1.1"));

            Assert.IsTrue(Version.Parse("1.2") >= Version.Parse("1.2"));
            Assert.IsTrue(Version.Parse("1.2.1") >= Version.Parse("1.2.1"));
            Assert.IsTrue(Version.Parse("1.2.1.1") >= Version.Parse("1.2.1.1"));

            Assert.IsFalse(Version.Parse("1.2") >= Version.Parse("1.2.1"));
            Assert.IsFalse(Version.Parse("1.2.1") >= Version.Parse("1.2.1.1"));
            Assert.IsFalse(Version.Parse("1.2.1.1") >= Version.Parse("1.2.1.2"));

            Assert.IsTrue(Version.Parse("1.2") <= Version.Parse("1.2.1"));
            Assert.IsTrue(Version.Parse("1.2.1") <= Version.Parse("1.2.1.1"));
            Assert.IsTrue(Version.Parse("1.2.1.1") <= Version.Parse("1.2.1.2"));


            Assert.IsFalse(Version.Parse("1.2.1") <= Version.Parse("1.2"));
            Assert.IsFalse(Version.Parse("1.2.1.1") <= Version.Parse("1.2.1"));
            Assert.IsFalse(Version.Parse("1.2.1.2") <= Version.Parse("1.2.1.1"));


        }

        [TestMethod]
        public void TestToString()
        {
            Version v1 = Version.Parse("1.2.0.0");
            Assert.IsTrue("1.2.0.0" == v1.ToString());
        }

        [TestMethod]
        public void TestEqualsNull()
        {
            Version v1 = null;
            Version v2 = null;
            Assert.IsTrue(v1 == v2);

            Assert.IsFalse(Version.Parse("1.2.0.0") == null);
            Assert.IsFalse(null == Version.Parse("1.2.0.0"));
        }
    }
}