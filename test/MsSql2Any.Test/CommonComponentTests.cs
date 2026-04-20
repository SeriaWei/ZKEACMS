/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using MsSql2Any.Config;
using MsSql2Any.DataAccess;

namespace MsSql2Any.Test
{
    [TestClass]
    public class CommonComponentTests
    {
        [TestMethod]
        public void TestAppConfigInitialization()
        {
            // 测试 AppConfig 类的初始化
            var config = new AppConfig
            {
                SourceConnectionString = "Server=localhost;Database=test;",
                OutputDirectory = "./output",
                BatchSize = 500
            };

            Assert.AreEqual("Server=localhost;Database=test;", config.SourceConnectionString);
            Assert.AreEqual("./output", config.OutputDirectory);
            Assert.AreEqual(500, config.BatchSize);
        }

        [TestMethod]
        public void TestColumnInfoInitialization()
        {
            // 测试 ColumnInfo 类的初始化
            var columnInfo = new ColumnInfo
            {
                Name = "TestColumn",
                DataType = "varchar",
                IsNullable = true,
                IsPrimaryKey = false,
                IsIdentity = false,
                MaxLength = 50,
                Precision = 10,
                Scale = 2,
                DefaultValue = "'default_value'"
            };

            Assert.AreEqual("TestColumn", columnInfo.Name);
            Assert.AreEqual("varchar", columnInfo.DataType);
            Assert.IsTrue(columnInfo.IsNullable);
            Assert.IsFalse(columnInfo.IsPrimaryKey);
            Assert.IsFalse(columnInfo.IsIdentity);
            Assert.AreEqual(50, columnInfo.MaxLength);
            Assert.AreEqual(10, columnInfo.Precision);
            Assert.AreEqual(2, columnInfo.Scale);
            Assert.AreEqual("'default_value'", columnInfo.DefaultValue);
        }
    }
}
