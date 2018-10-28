# 这是用于创建MySql的数据库脚本
请使用对应的版本来生成ZKEACMS的数据库

脚本中均包含了创建数据库的脚本，请自行根据实际情况删除或者保留
![image](https://user-images.githubusercontent.com/6006218/31644506-51e86d88-b329-11e7-8dcc-81bcfbc5113d.png)

## Linux 中注意事项
Linux下MySql安装完后默认是**区分表名的大小写**的，建库脚本中的表名都是**小写**的，这会导致程序出现找不到表的异常。所以要先开启MySql的表名小写，这样MySql会自动将查询语句中表名转成小写。
### Centos.7
编辑 /etc/my.cnf 添加 **lower_case_table_names=1** 配置，重启MySql服务
```
vi /etc/my.cnf
```
修改结果如下图所示：

![image](https://user-images.githubusercontent.com/6006218/31671046-96a1b7e2-b38b-11e7-89ac-770c24786999.png)
### Ubuntu.16.04
Ubuntu 的MySql的配置文件、目录在 /etc/mysql/my.cnf
```
vi /etc/mysql/my.cnf
```
添加以下内容，注意放在 **[mysqld]** 下面，并且中间空一行
```
[mysqld]

lower_case_table_names=1
```
然后重启MySql服务
```
systemctl restart mysqld
```
## Centos7 安装MySql
使用以下命令安装MySql
```
sudo yum update
yum install wget
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update
sudo yum install mysql-server
sudo systemctl start mysqld
```
初始化MySql：
```
sudo mysql_secure_installation
```
## Ubuntu 16.04 安装MySql
```
sudo apt-get update
sudo apt-get install mysql-server
sudo systemctl start mysql
sudo mysql_secure_installation
```
# 创建数据
先删除脚本中的建库脚本（如果是Windows环境，可不用删除，并跳过以下建库脚本），并上传脚本到服务器，使用以下命令初始化数据库：

登录MySql
```
mysql -u root -p
```
使用脚本初始化数据库中的表和数据
```
source /root/Dump.sql;
```
