# 这是用于创建MySql的数据库脚本
请使用对应的版本来生成ZKEACMS的数据库

脚本中均包含了创建数据库的脚本，请自行根据实际情况删除或者保留
![image](https://user-images.githubusercontent.com/6006218/31644506-51e86d88-b329-11e7-8dcc-81bcfbc5113d.png)

## Linux 中注意事项
Linux下MySql安装完后默认是区分表名的大小写的，脚本生成的表名都是小写的，所以要先设置表名不区分大小写，编辑 /etc/my.cnf 添加 lower_case_table_names=1 配置，重启MySql服务
> vi /etc/my.cnf

> service mysqld restart