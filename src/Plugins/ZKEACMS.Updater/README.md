# ZKEACMS 升级步骤

### 停止网站
在开始更新之前，需要先关闭网站。

**Windows**直接在IIS中停止网站。

**Linux**用户使用以下命令停止网站：
``` bash
 systemctl stop zkeacms
```

### 覆盖更新
**Windows**环境可直接使用下列链接下载最新版本的CMS程序：

[https://cloud.zkeasoft.com/file/zkeasoft/cms.zip](https://cloud.zkeasoft.com/file/zkeasoft/cms.zip)

下载后，注意先删除包里面的`App_Data`目录后再解压覆盖原先的程序。

**Linux**环境使用`wget`命令来下载最新版本的CMS程序：
``` bash
wget -O cms.zip https://cloud.zkeasoft.com/file/zkeasoft/cms.zip
```

然后删除程序包中的数据库文件，以免在替换时覆盖了现有的数据库而导致数据丢失
``` bash
zip -d cms.zip "App_Data/Database.sqlite"
```

将文件解压到`cms`目录，注意请跟据实际情况填写cms的路径：
``` bash
unzip cms.zip -d cms
```
**注意：** 在替换文件确认时，输入大写"A"，替换所有文件。

### 重启网站
**Windows**环境直接在IIS中重新启动网站即可。

**Linux**用户可以使用以下命令启动网站：
``` bash
 systemctl start zkeacms
```

## 关于3.3.5以前的版本更新
如果您正在使用的版本低于3.3.5，请在重新启动网站前，将您的当前版本更新到`/wwwroot/Plugins/ZKEACMS.Updater/appsettings.json`文件中，将`3.3.5`替换为您的当前版本。我们最低支持从3.3版本自动升级。
``` json
{
  "DBVersionOption": {
    "BaseVersion": "3.3.5",
    "Source": "https://gitee.com/seriawei/ZKEACMS.Core/raw/develop/Database"
  }
}
```

## 升级运行环境
在更新了CMS程序后，可能会遇到网站无法启动的问题，这可能是因为需要更新运行环境。

**Windows**环境请直接使用下列地址下载并安装最新版本的运行环境

[http://www.zkea.net/windows-hosting-bundle-installer](http://www.zkea.net/windows-hosting-bundle-installer)

**Linux**环境可使用下列命令先下载最新的运行时：
``` bash
wget -O dotnet.tar.gz http://www.zkea.net/dotnet-runtime-linux
```

然后解压到`dotnet`目录：
``` bash
mkdir -p "$HOME/dotnet" && tar zxf dotnet.tar.gz -C "$HOME/dotnet"
```

**注意：** 我们默认使用的`dotnet`目录是`$HOME/dotnet`，如果你不确定`dotnet`目录的真实路径，可通过查看`zkeacms`服务来获取
``` bash
more /etc/systemd/system/zkeacms.service
```

然后找到`ExecStart=`这一行，例如：`ExecStart=/home/wayne/dotnet/dotnet /home/wayne/cms/ZKEACMS.WebHost.dll` 那`dotnet`目录就是`/home/wayne/dotnet`

然后再使用`tar`命令来更新运行环境：
``` bash
tar zxf dotnet.tar.gz -C /home/wayne/dotnet
```
