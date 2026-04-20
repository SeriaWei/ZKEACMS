/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using MsSql2Any.DataAccess;
using MsSql2Any.ScriptGenerators;

namespace MsSql2Any.Test
{
    [TestClass]
    public class MysqlScriptGeneratorTests
    {
        [TestMethod]
        public void TestDbType()
        {
            // 测试 MySQL 脚本生成器的 DbType 属性
            var generator = new MysqlScriptGenerator();
            Assert.AreEqual("MySQL", generator.DbType);
        }

        [TestMethod]
        public void TestCreateTableScript()
        {
            // 测试 MySQL 脚本生成器的创建表脚本生成
            var generator = new MysqlScriptGenerator();

            var columns = new List<ColumnInfo>
            {
                new ColumnInfo
                {
                    Name = "Id",
                    DataType = "int",
                    IsNullable = false,
                    IsPrimaryKey = true,
                    IsIdentity = true
                },
                new ColumnInfo
                {
                    Name = "Name",
                    DataType = "varchar",
                    IsNullable = false,
                    IsPrimaryKey = false,
                    IsIdentity = false,
                    MaxLength = 50
                },
                new ColumnInfo
                {
                    Name = "Email",
                    DataType = "nvarchar",
                    IsNullable = true,
                    IsPrimaryKey = false,
                    IsIdentity = false,
                    MaxLength = 100
                }
            };

            var script = generator.GenerateCreateTableScript("Users", columns);

            // 验证生成的脚本包含必要的元素
            StringAssert.Contains(script, "`Id` INT NOT NULL AUTO_INCREMENT");
            StringAssert.Contains(script, "`Name` VARCHAR(50) NOT NULL");
            StringAssert.Contains(script, "`Email` VARCHAR(100)");
            StringAssert.Contains(script, "PRIMARY KEY (`Id`)");
            StringAssert.Contains(script, "CREATE TABLE `Users`");
        }

        [TestMethod]
        public void TestInsertScript()
        {
            // 测试 MySQL 脚本生成器的插入脚本生成
            var generator = new MysqlScriptGenerator();

            var columns = new List<ColumnInfo>
            {
                new ColumnInfo
                {
                    Name = "Id",
                    DataType = "int",
                    IsNullable = false,
                    IsPrimaryKey = true,
                    IsIdentity = true
                },
                new ColumnInfo
                {
                    Name = "Name",
                    DataType = "varchar",
                    IsNullable = false,
                    IsPrimaryKey = false,
                    IsIdentity = false,
                    MaxLength = 50
                }
            };

            var dataRows = new List<object[]>
            {
                new object[] { 1, "John Doe" },
                new object[] { 2, "Jane Smith" }
            };

            var script = generator.GenerateInsertScript("Users", columns, dataRows);

            // 验证生成的脚本包含必要的元素
            StringAssert.Contains(script, "INSERT INTO `Users` (`Id`, `Name`) VALUES (1, 'John Doe');");
            StringAssert.Contains(script, "INSERT INTO `Users` (`Id`, `Name`) VALUES (1, 'John Doe');");
        }
    }
}
