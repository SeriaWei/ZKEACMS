# ZKEACMS 升级步骤
### 下载CMS程序
首先您需要到我们的官方网站下载最新版本的程序

[下载企业版](https://www.zkea.net/download)

### 关闭/停止网站
在IIS中停止网站

Linux 用户使用以下命令停止网站
``` bash
 systemctl stop zkeacms
```

### 覆盖更新
将下载的最新版本解压复制到服务器上的CMS程序目录，完全覆盖所有旧的文件。

**注意：**不要覆盖`App_Data`目录。

### 重启网站
在IIS中重新启动网站

Linux用户可以使用以下命令启动网站：
``` bash
 systemctl start zkeacms
```
程序将会在启动时自动更新数据库到对应的版本。

## 关于3.3.5以前的版本更新
如果您正在使用的版本低于3.3.5，请在重新启动网站前，将您的当前版本更新到`/wwwroot/Plugins/ZKEACMS.Updater/appsettings.json`文件中，将`3.3.5`替换为您的当前版本。我们最低支持从3.3版本自动升级。
``` json
{
  "DBVersionOption": {
    "BaseVersion": "3.3.5",
    "Source": "https://gitee.com/seriawei/ZKEACMS.Core/raw/develop/DataBase"
  }
}
```