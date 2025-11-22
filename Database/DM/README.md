# 这是用于达梦数据库（DM8, dameng）的数据库初始化脚本

右键“模式”，选择导入dmp，然后添加导入文件，点确定即可。

## 数据库配置

使用达梦数据库的时候需要注意，由于达梦数据库的表名和字段名都是大写的，所以请配置表名和字段名为大写`"TableNaming": "UpperCase"`, `"ColumnNaming": "UpperCase"`。

appsettings.json
``` json
{
  "Database": {
    "DbType": "DM",
    "ConnectionString": "Server=localhost;Port=5236;SCHEMA=ZKEACMS;User Id=SYSDBA;Password=SYSDBA001;",
    "TableNaming": "UpperCase",
    "ColumnNaming": "UpperCase"
  }
}
```