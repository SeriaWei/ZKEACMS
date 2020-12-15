@echo -----------------------------------------------------------------------------
@echo *** 欢迎使用 ZKEACMS ***
@echo -----------------------------------------------------------------------------
@echo 运行该命令将从现有的 ZKEACMS 数据库，生成SQLite的数据库脚本。
@echo 请先在您的SQL Server中生成ZKEACMS的数据库。
@echo 在开始之前，请根据您的个人实际情况修改连接字符串。（用记事打开这个文件）
@echo -----------------------------------------------------------------------------
@pause


Export2SQLCE.exe "Data Source=(local);Initial Catalog=ZKEACMS;Integrated Security=True" ZKEACMS.sqlite.sql sqlite