using Easy;
using Easy.Constant;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace EasyFrameWork.Test
{
    [TestClass]
    public class NamingConverterTest
    {
        [TestMethod]
        public void Constructor_SetsStrategy()
        {
            var converter = new NamingConverter(NameCaseStrategy.CamelCase);
            Assert.AreEqual(NameCaseStrategy.CamelCase, converter.Strategy);
        }

        [TestMethod]
        public void ConvertName_WithNullInput_ReturnsNull()
        {
            var converter = new NamingConverter(NameCaseStrategy.LowerCase);
            string result = converter.ConvertName(null);
            Assert.IsNull(result);
        }

        [TestMethod]
        public void ConvertName_WithEmptyInput_ReturnsEmpty()
        {
            var converter = new NamingConverter(NameCaseStrategy.LowerCase);
            string result = converter.ConvertName("");
            Assert.AreEqual("", result);
        }

        [TestMethod]
        public void ConvertName_WithLowerCaseStrategy_ReturnsLowerCase()
        {
            var converter = new NamingConverter(NameCaseStrategy.LowerCase);
            string result = converter.ConvertName("TestName");
            Assert.AreEqual("testname", result);
        }

        [TestMethod]
        public void ConvertName_WithUpperCaseStrategy_ReturnsUpperCase()
        {
            var converter = new NamingConverter(NameCaseStrategy.UpperCase);
            string result = converter.ConvertName("testName");
            Assert.AreEqual("TESTNAME", result);
        }

        [TestMethod]
        public void ConvertName_WithCamelCaseStrategy_ReturnsCamelCase()
        {
            var converter = new NamingConverter(NameCaseStrategy.CamelCase);
            string result = converter.ConvertName("TestName");
            Assert.AreEqual("testName", result);
        }

        [TestMethod]
        public void ConvertName_WithPascalCaseStrategy_ReturnsPascalCase()
        {
            var converter = new NamingConverter(NameCaseStrategy.PascalCase);
            string result = converter.ConvertName("testName");
            Assert.AreEqual("TestName", result);
        }

        [TestMethod]
        public void ConvertName_WithSnakeCaseStrategy_ReturnsSnakeCase()
        {
            var converter = new NamingConverter(NameCaseStrategy.SnakeCase);
            string result = converter.ConvertName("TestName");
            Assert.AreEqual("test_name", result);
        }

        [TestMethod]
        public void ConvertName_WithSnakeCaseStrategy_MultipleUppercase_ReturnsSnakeCase()
        {
            var converter = new NamingConverter(NameCaseStrategy.SnakeCase);
            string result = converter.ConvertName("TestNameExample");
            Assert.AreEqual("test_name_example", result);
        }

        [TestMethod]
        public void ConvertName_WithKebabCaseStrategy_ReturnsKebabCase()
        {
            var converter = new NamingConverter(NameCaseStrategy.KebabCase);
            string result = converter.ConvertName("TestName");
            Assert.AreEqual("test-name", result);
        }

        [TestMethod]
        public void ConvertName_WithKebabCaseStrategy_MultipleUppercase_ReturnsKebabCase()
        {
            var converter = new NamingConverter(NameCaseStrategy.KebabCase);
            string result = converter.ConvertName("TestNameExample");
            Assert.AreEqual("test-name-example", result);
        }

        [TestMethod]
        public void ConvertName_WithPrefix_AddsPrefix()
        {
            var converter = new NamingConverter(NameCaseStrategy.LowerCase);
            converter.Prefix = "prefix_";
            string result = converter.ConvertName("TestName");
            Assert.AreEqual("prefix_testname", result);
        }

        [TestMethod]
        public void ConvertName_WithSuffix_AddsSuffix()
        {
            var converter = new NamingConverter(NameCaseStrategy.LowerCase);
            converter.Suffix = "_suffix";
            string result = converter.ConvertName("TestName");
            Assert.AreEqual("testname_suffix", result);
        }

        [TestMethod]
        public void ConvertName_WithPrefixAndSuffix_AddsBoth()
        {
            var converter = new NamingConverter(NameCaseStrategy.LowerCase);
            converter.Prefix = "prefix_";
            converter.Suffix = "_suffix";
            string result = converter.ConvertName("TestName");
            Assert.AreEqual("prefix_testname_suffix", result);
        }

        [TestMethod]
        public void ConvertName_WithSnakeCaseAndPrefixAndSuffix_WorksCorrectly()
        {
            var converter = new NamingConverter(NameCaseStrategy.SnakeCase);
            converter.Prefix = "prefix_";
            converter.Suffix = "_suffix";
            string result = converter.ConvertName("TestNameExample");
            Assert.AreEqual("prefix_test_name_example_suffix", result);
        }

        [TestMethod]
        public void ConvertName_WithUnknownStrategy_ReturnsOriginal()
        {
            var converter = new NamingConverter((NameCaseStrategy)(-1)); // Invalid strategy
            string result = converter.ConvertName("TestName");
            Assert.AreEqual("TestName", result);
        }
    }
}