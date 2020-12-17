/* https://github.com/SeriaWei/mssql2mysql */


CREATE DATABASE  IF NOT EXISTS `ZKEACMS_Blog` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ZKEACMS_Blog`;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `ApplicationSetting`;
CREATE TABLE `ApplicationSetting` (
	`SettingKey` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`Value` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`SettingKey`)
);

/*!40000 ALTER TABLE `ApplicationSetting` DISABLE KEYS */;
INSERT INTO `ApplicationSetting` VALUES
('EnableResponsiveDesign','true',NULL,NULL,1,NULL,NULL,'2020-04-05 10:11:19.740',NULL,NULL,'2020-04-05 10:11:19.740'),
('ExpandAllPage','true',NULL,NULL,1,'admin','ZKEASOFT','2019-05-07 21:20:04.247','admin','ZKEASOFT','2019-05-07 21:20:04.247'),
('Favicon','~/favicon.ico',NULL,NULL,NULL,'admin','ZKEASOFT','2017-03-19 20:57:33.627','admin','ZKEASOFT','2017-03-19 20:57:33.627'),
('OuterChainPicture','false',NULL,NULL,1,NULL,NULL,'2020-04-05 10:11:19.510',NULL,NULL,'2020-04-05 10:11:19.510');
/*!40000 ALTER TABLE `ApplicationSetting` ENABLE KEYS */;

DROP TABLE IF EXISTS `Article`;
CREATE TABLE `Article` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Summary` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`MetaKeyWords` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`MetaDescription` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Counter` INT  NULL,
	`ArticleTypeID` INT  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ArticleContent` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`ImageThumbUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`IsPublish` TINYINT(1)  NOT NULL,
	`PublishDate` DATETIME  NULL,
	`Url` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_Article_ArticleCategory` (`ArticleTypeID`),
	CONSTRAINT `FK_Article_ArticleCategory` FOREIGN KEY (`ArticleTypeID`) REFERENCES `ArticleType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES
(1,'Build ZKEACMS Core Docker image','使用Docker build生成ZKEACMS Core的docker image','ZKEACMS,Docker','在项目的根目录，直接使用docker build来生成docker image，在构建过程中，会自动生成和发布程序',3,2,NULL,'<p>在项目的根目录，直接使用docker build来生成docker image，在构建过程中，会自动生成和发布程序</p>
<pre>docker build -t zkeacms:latest .</pre>
<h3>手动发布后生成 docker image</h3>
<p>使用Publish.cmd或者Publish.sh(Linux)先发布ZKEACMS，发布完以后，可以定位到发布目录\src\ZKEACMS.WebHost\bin\Release\PublishOutput做一些配置和修改。</p>
<p>定位到目录\src\ZKEACMS.WebHost再使用docker build来生成docker image</p>
<pre>docker build -t zkeacms:latest .</pre>
<p>使用以下命令来查看生成的Docker image</p>
<pre>docker images</pre>
<h3>运行ZKEACMS</h3>
<p>运行ZKEACMS，数据库是必需的，在可以正常运行之前，还需要配置好数据库。然后可以使用docker run来运行</p>
<pre>docker run -d -p 2345:80 zkeacms</pre>
<h3>拉取最新的ZKEACMS镜像</h3>
<p>您可以不用自己生成，可以直接拉取我们整理好的镜像，该镜像已经配置好数据，可以直接运行</p>
<pre>docker pull zkeasoft/zkeacms</pre>
<h3>MySql</h3>
<p>首先需要拉取MySql的镜像</p>
<pre>docker pull mysql</pre>
<p>运行一个MySql的实例</p>
<pre>docker run -d -e MYSQL_ROOT_PASSWORD=root --name mysql -p 3306:3306 mysql --lower_case_table_names=1</pre>
<p>在MySql里面初始化一个ZKEACMS的数据库</p>
<p>拉取MySql的ZKEACMS镜像，镜像中已经初始化了MySql连接字符串：Server=mysql;Database=ZKEACMS_Core;User Id=root;Password=root;</p>
<pre>docker pull zkeasoft/zkeacms:mysql</pre>
<p>链接MySql运行。</p>
<pre>docker run -p 808:80 --link=mysql zkeacms:mysql</pre>',1,'/themes/blog/images/docker.jpg',NULL,1,'2017-11-19 23:41:19.000','zkeacms-docker-image','admin','ZKEASOFT','2017-11-19 23:41:19.000','admin','ZKEASOFT','2020-04-05 10:15:45.580'),
(2,'SQL中的 XACT_ABORT{ ON | OFF }','SQL Server（从 2008 开始），可以通过设置XACT_ABORT来指定当 SQL Server 语句出现运行时错误时， Transact-SQL 是否自动回滚当前事务。','SQL,XACT_ABORT','SQL Server（从 2008 开始），可以通过设置XACT_ABORT来指定当 SQL Server 语句出现运行时错误时， Transact-SQL 是否自动回滚当前事务。',13,5,NULL,'<p>SQL Server（从 2008 开始），可以通过设置XACT_ABORT来指定当 SQL Server 语句出现运行时错误时， Transact-SQL 是否自动回滚当前事务。</p>
<h3>XACT_ABORT</h3>
<p>语法：</p>
<pre>SET XACT_ABORT { ON | OFF }</pre>
<p>&nbsp;&nbsp;</p>
<ul>
<li>当 SET XACT_ABORT 为 ON 时，如果执行&nbsp;Transact-SQL&nbsp;语句产生运行时错误，则整个事务将终止并回滚。</li>
<li>当 SET XACT_ABORT 为 OFF 时，有时只回滚产生错误的&nbsp;Transact-SQL&nbsp;语句，而事务将继续进行处理。&nbsp;如果错误很严重，那么即使 SET XACT_ABORT 为 OFF，也可能回滚整个事务。&nbsp;OFF 是默认设置。</li>
</ul>
<p>&nbsp;</p>
<p>编译错误（如语法错误）不受 SET XACT_ABORT 的影响。</p>
<p>对于大多数 OLE DB 访问接口（包括&nbsp;SQL Server），必须将隐式或显示事务中的数据修改语句中的 XACT_ABORT 设置为 ON。&nbsp;唯一不需要该选项的情况是在提供程序支持嵌套事务时。</p>
<p>当 ANSI_WARNINGS=OFF 时，违反权限的行为导致事务中止。</p>
<p>SET XACT_ABORT 的设置是在执行或运行时设置，而不是在分析时设置。</p>
<p>要查看此设置的当前设置，请运行以下查询。</p>
<pre>DECLARE @XACT_ABORT VARCHAR(3) = ''OFF''; <br />IF ( (16384 &amp; @@OPTIONS) = 16384 ) SET @XACT_ABORT = ''ON''; <br />SELECT @XACT_ABORT AS XACT_ABORT;</pre>
<p>原文链接：<a href=\"https://docs.microsoft.com/en-us/sql/t-sql/statements/set-xact-abort-transact-sql\" target=\"_blank\" rel=\"noopener\">https://docs.microsoft.com/en-us/sql/t-sql/statements/set-xact-abort-transact-sql</a></p>
<p></p>',1,'/themes/blog/images/sql.png',NULL,1,'2018-04-03 11:00:32.000','sql-xact-abort','admin','ZKEASOFT','2017-11-19 23:53:16.000','admin','ZKEASOFT','2020-04-05 10:16:02.010'),
(3,'JavaScript 数组删除的几种方式','JavaScript 数组删除的几种方式，shift，slice，pop，filter','JavaScript 数组删除，shift，slice，pop，filter','JavaScript 数组删除的几种方式，shift，slice，pop，filter',NULL,3,NULL,'<h3>按索引删除</h3>
<pre>//1
someArray.shift(); // 删除第一个元素
//2
someArray = someArray.slice(1); // 删除第一个元素
//3
someArray.splice(0,1); // 删除第一个元素
//4
someArray.pop(); // 删除最后一个元素
</pre>
<h3>按条件删除</h3>
<pre>someArray = [{name:\"Kristian\", lines:\"2,5,10\"},
             {name:\"John\", lines:\"1,19,26,96\"},
             {name:\"Brian\",lines:\"3,9,62,36\" }];
johnRemoved = someArray.filter(function(el) {
    return el.name !== \"John\";
});

console.log(JSON.stringify(johnRemoved, null, '' ''));</pre>',1,'/themes/blog/images/javascript.jpg',NULL,1,'2018-04-03 10:48:28.000','javascript-array-delete','admin','ZKEASOFT','2018-04-03 10:48:28.000','admin','ZKEASOFT','2020-04-05 10:16:23.747'),
(4,'CSS 的一些常用技巧','下面这些CSS常用技巧，学会了，你也是前端达人。','CSS 技巧','下面这些CSS常用技巧，学会了，你也是前端达人。',NULL,4,NULL,'<h2>使用 :not() 在菜单上应用/取消应用边框</h2>
<p>先给每一个菜单项添加边框</p>
<div>
<pre>/* add border */
.nav li {
  border-right: 1px solid #666;
}
</pre>
</div>
<p>&hellip;&hellip;然后再除去最后一个元素&hellip;&hellip;</p>
<p>//* remove border */</p>
<div>
<pre>.nav li:last-child {
  border-right: none;
}
</pre>
</div>
<p>&hellip;&hellip;可以直接使用 :not() 伪类来应用元素：</p>
<div>
<pre>.nav li:not(:last-child) {
  border-right: 1px solid #666;
}
</pre>
</div>
<p>这样代码就干净，易读，易于理解了。</p>
<p>当然，如果你的新元素有兄弟元素的话，也可以使用通用的兄弟选择符（~）：</p>
<p>..nav li:first-child ~ li {</p>
<div>
<pre>  border-left: 1px solid #666;
}</pre>
</div>
<h2>逗号分隔的列表</h2>
<p>让HTML列表项看上去像一个真正的，用逗号分隔的列表：</p>
<div>
<pre>ul &gt; li:not(:last-child)::after {
  content: \",\";
}
</pre>
</div>
<p>对最后一个列表项使用 :not() 伪类。</p>
<h2>使用负的 nth-child 选择项目</h2>
<p>在CSS中使用负的 nth-child 选择项目1到项目n。</p>
<div>
<pre>li {
  display: none;
}

/* select items 1 through 3 and display them */
li:nth-child(-n+3) {
  display: block;
}
</pre>
</div>
<p>就是这么容易。</p>
<h2>对图标使用SVG</h2>
<p>我们没有理由不对图标使用SVG：</p>
<div>
<pre>.logo {
  background: url(\"logo.svg\");
}
</pre>
</div>
<p>SVG对所有的分辨率类型都具有良好的扩展性，并支持所有浏览器都回归到IE9。这样可以避开.png、.jpg或.gif文件了。</p>
<h2>优化显示文本</h2>
<p>有时，字体并不能在所有设备上都达到最佳的显示，所以可以让设备浏览器来帮助你：</p>
<div>
<pre>html {
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}
</pre>
</div>
<p>注：请负责任地使用 optimizeLegibility。此外，IE /Edge没有 text-rendering 支持。</p>
<h2>对纯CSS滑块使用 max-height</h2>
<p>使用 max-height 和溢出隐藏来实现只有CSS的滑块：</p>
<div>
<pre>.slider ul {
  max-height: 0;
  overlow: hidden;
}

.slider:hover ul {
  max-height: 1000px;
  transition: .3s ease;
}
</pre>
</div>
<h2>继承 box-sizing</h2>
<p>让 box-sizing 继承 html：</p>
<div>
<pre>html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}
</pre>
</div>
<p>这样在插件或杠杆其他行为的其他组件中就能更容易地改变 box-sizing 了。</p>
<h2>表格单元格等宽</h2>
<p>表格工作起来很麻烦，所以务必尽量使用 table-layout: fixed 来保持单元格的等宽：</p>
<div>
<pre>.calendar {
  table-layout: fixed;
}</pre>
</div>
<h2>使用属性选择器用于空链接</h2>
<p>当 &lt;a&gt; 元素没有文本值，但 href 属性有链接的时候显示链接：</p>
<div>
<pre>a[href^=\"http\"]:empty::before {
  content: attr(href);
}
</pre>
</div>
<p>相当方便。</p>',1,'/themes/blog/images/css.png',NULL,1,'2018-04-03 10:49:37.000','css-optimize','admin','ZKEASOFT','2018-04-03 10:49:37.000','admin','ZKEASOFT','2020-04-05 10:16:52.427'),
(5,'Linux 如何获取命令的完整路径','在一些时候，会需要知道执行命令的完整路径，如添加服务时，就要写完整的路径','Linux命令路径','在一些时候，会需要知道执行命令的完整路径，如添加服务时，就要写完整的路径，那么应该如何得到这个路径呢？',6,6,NULL,'<p>在一些时候，会需要知道执行命令的完整路径，如添加服务时，就要写完整的路径，那么应该如何得到这个路径呢？</p>
<h3>type 命令</h3>
<p>type 命令用于查询命令的别名，功能，是否是builtin命令或可执行命令文件。一般用法：</p>
<pre><span>type {command-name}</span></pre>
<p>例如查询dotnet命令的路径，可以这样输入</p>
<pre>type dotnet</pre>
<p>输出</p>
<p>dotnet is /usr/bin/dotnet</p>
<h3>whereis 命令</h3>
<p><span>whereis会得到很多条结果，因为这个命令把所有包含（不管是文件还是文件夹）的路径都列了出来。</span></p>
<pre><span>whereis dotnet</span></pre>
<p><span>输出</span></p>
<p><span>dotnet: /usr/bin/dotnet /usr/local/bin/dotnet /usr/share/dotnet /usr/share/man/man1/dotnet.1<br /></span></p>
<h3><span>which 命令</span></h3>
<p><span>which 返回的是 PATH路径中第一个位置，也就是命令默认执行的位置</span></p>
<pre><span> which dotnet<br /></span></pre>
<p><span>输出</span></p>
<p><span>/usr/bin/dotnet<br /></span></p>',1,'/themes/blog/images/linux.jpg',NULL,1,'2018-04-03 10:51:03.000','linux-type-whereis','admin','ZKEASOFT','2018-04-03 10:51:03.000','admin','ZKEASOFT','2020-04-05 10:17:10.777');
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;

DROP TABLE IF EXISTS `ArticleDetailWidget`;
CREATE TABLE `ArticleDetailWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`CustomerClass` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ArticleDetailWidget_Widget` (`ID`),
	CONSTRAINT `FK_ArticleDetailWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `ArticleDetailWidget` DISABLE KEYS */;
INSERT INTO `ArticleDetailWidget` VALUES
('93b43552bcfd45bc8067818e4ce2c412',NULL),
('ad2e89beefd542709124bd4e81eedf58',NULL);
/*!40000 ALTER TABLE `ArticleDetailWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `ArticleListWidget`;
CREATE TABLE `ArticleListWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`ArticleTypeID` INT  NULL,
	`DetailPageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`IsPageable` TINYINT(1)  NOT NULL,
	`PageSize` INT  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ArticleListWidget_Widget` (`ID`),
	CONSTRAINT `FK_ArticleListWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `ArticleListWidget` DISABLE KEYS */;
INSERT INTO `ArticleListWidget` VALUES
('03c0002864334a168ea2ea3c1d96c829',1,'~/posts',1,10),
('0706d53d78d641139316c70a33dc5aad',2,'~/posts',1,10),
('0796c731dd5e45579e8855fd474b390f',4,'~/posts',1,10),
('0c7f5ce6231b407f8f3156b3b2c07835',6,'~/posts',1,10),
('14d6de860ba34a66b07ffb103fcb4a8d',3,'~/posts',1,10),
('6f0d49adcf324b7c92fd8b38462f388c',1,'~/posts',1,10),
('712173677e3c467f884340375778ec7f',2,'~/posts',1,10),
('8c7a3d38aad446698e151f6a7c45d040',5,'~/posts',1,10),
('8f6a4eed88e5415e97d28bfd221e1c6e',3,'~/posts',1,10),
('b1661efc756d4ab7ac4931b0539ac82d',5,'~/posts',1,10),
('d3b03ba290b74a408670042549d532ba',4,'~/posts',1,10),
('defdfcdef32c4080bde0ecad73ca2e1d',6,'~/posts',1,10);
/*!40000 ALTER TABLE `ArticleListWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `ArticleSummaryWidget`;
CREATE TABLE `ArticleSummaryWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SubTitle` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Style` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`DetailLink` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Summary` LONGTEXT CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ArticleSummaryWidget_Widget` (`ID`),
	CONSTRAINT `FK_ArticleSummaryWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `ArticleTopWidget`;
CREATE TABLE `ArticleTopWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`ArticleTypeID` INT  NULL,
	`Tops` INT  NULL,
	`SubTitle` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`MoreLink` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`DetailPageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ArticleTopWidget_Widget` (`ID`),
	CONSTRAINT `FK_ArticleTopWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `ArticleType`;
CREATE TABLE `ArticleType` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ParentID` INT  NULL,
	`Url` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`SEOTitle` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`SEOKeyWord` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`SEODescription` VARCHAR(300) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `ArticleType` DISABLE KEYS */;
INSERT INTO `ArticleType` VALUES
(1,'博客',NULL,0,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:18.000','admin','ZKEASOFT','2018-04-03 10:38:00.387'),
(2,'C#',NULL,1,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:24.000','admin','ZKEASOFT','2018-04-03 10:38:23.163'),
(3,'JavaScript',NULL,1,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:29.000','admin','ZKEASOFT','2018-04-03 10:38:29.990'),
(4,'HTML / CSS',NULL,1,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-03 10:38:39.000','admin','ZKEASOFT','2018-04-03 10:39:17.250'),
(5,'SQL',NULL,1,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-03 10:38:48.843','admin','ZKEASOFT','2018-04-03 10:38:48.843'),
(6,'Linux',NULL,1,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-03 10:39:05.830','admin','ZKEASOFT','2018-04-03 10:39:05.830');
/*!40000 ALTER TABLE `ArticleType` ENABLE KEYS */;

DROP TABLE IF EXISTS `ArticleTypeWidget`;
CREATE TABLE `ArticleTypeWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`ArticleTypeID` INT  NULL,
	`TargetPage` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ArticleTypeWidget_Widget` (`ID`),
	CONSTRAINT `FK_ArticleTypeWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `Basket`;
CREATE TABLE `Basket` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`UserId` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`ImageUrl` VARCHAR(500) CHARACTER SET utf8mb4  NOT NULL,
	`Quantity` INT  NOT NULL,
	`Price` DECIMAL (18,4)  NOT NULL,
	`ProductId` INT  NOT NULL,
	`PromoCode` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NOT NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `Carousel`;
CREATE TABLE `Carousel` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Height` INT  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `Carousel` DISABLE KEYS */;
INSERT INTO `Carousel` VALUES
(1,'示例',NULL,NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.203','admin','ZKEASOFT','2016-03-27 15:17:54.050');
/*!40000 ALTER TABLE `Carousel` ENABLE KEYS */;

DROP TABLE IF EXISTS `CarouselItem`;
CREATE TABLE `CarouselItem` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`CarouselID` INT  NULL,
	`CarouselWidgetID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`TargetLink` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_CarouselItem_CarouselWidget` (`CarouselWidgetID`),
	CONSTRAINT `FK_CarouselItem_CarouselWidget` FOREIGN KEY (`CarouselWidgetID`) REFERENCES `CarouselWidget` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `CarouselItem` DISABLE KEYS */;
INSERT INTO `CarouselItem` VALUES
(1,'图1',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg1.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.217','admin','ZKEASOFT','2016-03-27 15:17:54.053'),
(2,'图2',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg2.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.570','admin','ZKEASOFT','2016-03-27 15:17:54.420'),
(3,'图3',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg3.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.573','admin','ZKEASOFT','2016-03-27 15:17:54.433');
/*!40000 ALTER TABLE `CarouselItem` ENABLE KEYS */;

DROP TABLE IF EXISTS `CarouselWidget`;
CREATE TABLE `CarouselWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`CarouselID` INT  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_CarouselWidget_Carousel` (`CarouselID`),
	CONSTRAINT `FK_CarouselWidget_Carousel` FOREIGN KEY (`CarouselID`) REFERENCES `Carousel` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	KEY `FK_CarouselWidget_Widget` (`ID`),
	CONSTRAINT `FK_CarouselWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `CMS_Layout`;
CREATE TABLE `CMS_Layout` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`LayoutName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ContainerClass` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`Description` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Script` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Style` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`ImageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageThumbUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Theme` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `CMS_Layout` DISABLE KEYS */;
INSERT INTO `CMS_Layout` VALUES
('ca16c7482fc3405ea8cc53f5d4990937','默认',NULL,'container',1,NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-03 09:50:51.997','admin','ZKEASOFT','2018-04-03 09:50:51.997','~/images/layout.jpg','~/images/layout.jpg',NULL);
/*!40000 ALTER TABLE `CMS_Layout` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_LayoutHtml`;
CREATE TABLE `CMS_LayoutHtml` (
	`LayoutHtmlId` INT AUTO_INCREMENT  NOT NULL,
	`LayoutId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`PageId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Html` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`LayoutHtmlId`),
	KEY `FK_CMS_LayoutHtml_CMS_Layout` (`LayoutId`),
	CONSTRAINT `FK_CMS_LayoutHtml_CMS_Layout` FOREIGN KEY (`LayoutId`) REFERENCES `CMS_Layout` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `CMS_LayoutHtml` DISABLE KEYS */;
INSERT INTO `CMS_LayoutHtml` VALUES
(278,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2018-04-03 10:46:28.103','admin','ZKEASOFT','2018-04-03 10:46:28.103'),
(279,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'<zone>','admin','ZKEASOFT','2018-04-03 10:46:28.117','admin','ZKEASOFT','2018-04-03 10:46:28.117'),
(280,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-0','admin','ZKEASOFT','2018-04-03 10:46:28.120','admin','ZKEASOFT','2018-04-03 10:46:28.120'),
(281,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'</zone>','admin','ZKEASOFT','2018-04-03 10:46:28.123','admin','ZKEASOFT','2018-04-03 10:46:28.123'),
(282,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-04-03 10:46:28.127','admin','ZKEASOFT','2018-04-03 10:46:28.127'),
(283,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'<zone>','admin','ZKEASOFT','2018-04-03 10:46:28.130','admin','ZKEASOFT','2018-04-03 10:46:28.130'),
(284,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-1','admin','ZKEASOFT','2018-04-03 10:46:28.137','admin','ZKEASOFT','2018-04-03 10:46:28.137'),
(285,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'</zone>','admin','ZKEASOFT','2018-04-03 10:46:28.140','admin','ZKEASOFT','2018-04-03 10:46:28.140'),
(286,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-04-03 10:46:28.143','admin','ZKEASOFT','2018-04-03 10:46:28.143'),
(287,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'<zone>','admin','ZKEASOFT','2018-04-03 10:46:28.150','admin','ZKEASOFT','2018-04-03 10:46:28.150'),
(288,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-2','admin','ZKEASOFT','2018-04-03 10:46:28.157','admin','ZKEASOFT','2018-04-03 10:46:28.157'),
(289,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'</zone>','admin','ZKEASOFT','2018-04-03 10:46:28.163','admin','ZKEASOFT','2018-04-03 10:46:28.163'),
(290,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2018-04-03 10:46:28.167','admin','ZKEASOFT','2018-04-03 10:46:28.167'),
(291,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'<zone>','admin','ZKEASOFT','2018-04-03 10:46:28.173','admin','ZKEASOFT','2018-04-03 10:46:28.173'),
(292,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-3','admin','ZKEASOFT','2018-04-03 10:46:28.177','admin','ZKEASOFT','2018-04-03 10:46:28.177'),
(293,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'</zone>','admin','ZKEASOFT','2018-04-03 10:46:28.177','admin','ZKEASOFT','2018-04-03 10:46:28.177'),
(294,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2018-04-03 10:46:28.183','admin','ZKEASOFT','2018-04-03 10:46:28.183'),
(295,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:20:04.487','admin','ZKEASOFT','2019-05-07 21:20:04.487'),
(296,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','<zone>','admin','ZKEASOFT','2019-05-07 21:20:04.520','admin','ZKEASOFT','2019-05-07 21:20:04.520'),
(297,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','ZONE-0','admin','ZKEASOFT','2019-05-07 21:20:04.523','admin','ZKEASOFT','2019-05-07 21:20:04.523'),
(298,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','</zone>','admin','ZKEASOFT','2019-05-07 21:20:04.527','admin','ZKEASOFT','2019-05-07 21:20:04.527'),
(299,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:20:04.533','admin','ZKEASOFT','2019-05-07 21:20:04.533'),
(300,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','<zone>','admin','ZKEASOFT','2019-05-07 21:20:04.537','admin','ZKEASOFT','2019-05-07 21:20:04.537'),
(301,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','ZONE-1','admin','ZKEASOFT','2019-05-07 21:20:04.543','admin','ZKEASOFT','2019-05-07 21:20:04.543'),
(302,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','</zone>','admin','ZKEASOFT','2019-05-07 21:20:04.547','admin','ZKEASOFT','2019-05-07 21:20:04.547'),
(303,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:20:04.550','admin','ZKEASOFT','2019-05-07 21:20:04.550'),
(304,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','<zone>','admin','ZKEASOFT','2019-05-07 21:20:04.553','admin','ZKEASOFT','2019-05-07 21:20:04.553'),
(305,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','ZONE-2','admin','ZKEASOFT','2019-05-07 21:20:04.560','admin','ZKEASOFT','2019-05-07 21:20:04.560'),
(306,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','</zone>','admin','ZKEASOFT','2019-05-07 21:20:04.563','admin','ZKEASOFT','2019-05-07 21:20:04.563'),
(307,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:20:04.567','admin','ZKEASOFT','2019-05-07 21:20:04.567'),
(308,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','<zone>','admin','ZKEASOFT','2019-05-07 21:20:04.570','admin','ZKEASOFT','2019-05-07 21:20:04.570'),
(309,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','ZONE-3','admin','ZKEASOFT','2019-05-07 21:20:04.577','admin','ZKEASOFT','2019-05-07 21:20:04.577'),
(310,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','</zone>','admin','ZKEASOFT','2019-05-07 21:20:04.580','admin','ZKEASOFT','2019-05-07 21:20:04.580'),
(311,'ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:20:04.583','admin','ZKEASOFT','2019-05-07 21:20:04.583'),
(312,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:22:36.707','admin','ZKEASOFT','2019-05-07 21:22:36.707'),
(313,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','<zone>','admin','ZKEASOFT','2019-05-07 21:22:36.717','admin','ZKEASOFT','2019-05-07 21:22:36.717'),
(314,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','ZONE-0','admin','ZKEASOFT','2019-05-07 21:22:36.717','admin','ZKEASOFT','2019-05-07 21:22:36.717'),
(315,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','</zone>','admin','ZKEASOFT','2019-05-07 21:22:36.720','admin','ZKEASOFT','2019-05-07 21:22:36.720'),
(316,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:22:36.723','admin','ZKEASOFT','2019-05-07 21:22:36.723'),
(317,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','<zone>','admin','ZKEASOFT','2019-05-07 21:22:36.727','admin','ZKEASOFT','2019-05-07 21:22:36.727'),
(318,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','ZONE-1','admin','ZKEASOFT','2019-05-07 21:22:36.730','admin','ZKEASOFT','2019-05-07 21:22:36.730'),
(319,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','</zone>','admin','ZKEASOFT','2019-05-07 21:22:36.733','admin','ZKEASOFT','2019-05-07 21:22:36.733'),
(320,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:22:36.737','admin','ZKEASOFT','2019-05-07 21:22:36.737'),
(321,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','<zone>','admin','ZKEASOFT','2019-05-07 21:22:36.740','admin','ZKEASOFT','2019-05-07 21:22:36.740'),
(322,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','ZONE-2','admin','ZKEASOFT','2019-05-07 21:22:36.743','admin','ZKEASOFT','2019-05-07 21:22:36.743'),
(323,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','</zone>','admin','ZKEASOFT','2019-05-07 21:22:36.743','admin','ZKEASOFT','2019-05-07 21:22:36.743'),
(324,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:22:36.747','admin','ZKEASOFT','2019-05-07 21:22:36.747'),
(325,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','<zone>','admin','ZKEASOFT','2019-05-07 21:22:36.750','admin','ZKEASOFT','2019-05-07 21:22:36.750'),
(326,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','ZONE-3','admin','ZKEASOFT','2019-05-07 21:22:36.753','admin','ZKEASOFT','2019-05-07 21:22:36.753'),
(327,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','</zone>','admin','ZKEASOFT','2019-05-07 21:22:36.757','admin','ZKEASOFT','2019-05-07 21:22:36.757'),
(328,'ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:22:36.760','admin','ZKEASOFT','2019-05-07 21:22:36.760'),
(329,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:23:00.817','admin','ZKEASOFT','2019-05-07 21:23:00.817'),
(330,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','<zone>','admin','ZKEASOFT','2019-05-07 21:23:00.820','admin','ZKEASOFT','2019-05-07 21:23:00.820'),
(331,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','ZONE-0','admin','ZKEASOFT','2019-05-07 21:23:00.823','admin','ZKEASOFT','2019-05-07 21:23:00.823'),
(332,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','</zone>','admin','ZKEASOFT','2019-05-07 21:23:00.830','admin','ZKEASOFT','2019-05-07 21:23:00.830'),
(333,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:23:00.833','admin','ZKEASOFT','2019-05-07 21:23:00.833'),
(334,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','<zone>','admin','ZKEASOFT','2019-05-07 21:23:00.837','admin','ZKEASOFT','2019-05-07 21:23:00.837'),
(335,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','ZONE-1','admin','ZKEASOFT','2019-05-07 21:23:00.840','admin','ZKEASOFT','2019-05-07 21:23:00.840'),
(336,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','</zone>','admin','ZKEASOFT','2019-05-07 21:23:00.843','admin','ZKEASOFT','2019-05-07 21:23:00.843'),
(337,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:23:00.847','admin','ZKEASOFT','2019-05-07 21:23:00.847'),
(338,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','<zone>','admin','ZKEASOFT','2019-05-07 21:23:00.850','admin','ZKEASOFT','2019-05-07 21:23:00.850'),
(339,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','ZONE-2','admin','ZKEASOFT','2019-05-07 21:23:00.853','admin','ZKEASOFT','2019-05-07 21:23:00.853'),
(340,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','</zone>','admin','ZKEASOFT','2019-05-07 21:23:00.857','admin','ZKEASOFT','2019-05-07 21:23:00.857'),
(341,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:23:00.860','admin','ZKEASOFT','2019-05-07 21:23:00.860'),
(342,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','<zone>','admin','ZKEASOFT','2019-05-07 21:23:00.863','admin','ZKEASOFT','2019-05-07 21:23:00.863'),
(343,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','ZONE-3','admin','ZKEASOFT','2019-05-07 21:23:00.867','admin','ZKEASOFT','2019-05-07 21:23:00.867'),
(344,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','</zone>','admin','ZKEASOFT','2019-05-07 21:23:00.870','admin','ZKEASOFT','2019-05-07 21:23:00.870'),
(345,'ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:23:00.873','admin','ZKEASOFT','2019-05-07 21:23:00.873'),
(346,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:23:15.833','admin','ZKEASOFT','2019-05-07 21:23:15.833'),
(347,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','<zone>','admin','ZKEASOFT','2019-05-07 21:23:15.840','admin','ZKEASOFT','2019-05-07 21:23:15.840'),
(348,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','ZONE-0','admin','ZKEASOFT','2019-05-07 21:23:15.840','admin','ZKEASOFT','2019-05-07 21:23:15.840'),
(349,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','</zone>','admin','ZKEASOFT','2019-05-07 21:23:15.843','admin','ZKEASOFT','2019-05-07 21:23:15.843'),
(350,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:23:15.847','admin','ZKEASOFT','2019-05-07 21:23:15.847'),
(351,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','<zone>','admin','ZKEASOFT','2019-05-07 21:23:15.850','admin','ZKEASOFT','2019-05-07 21:23:15.850'),
(352,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','ZONE-1','admin','ZKEASOFT','2019-05-07 21:23:15.857','admin','ZKEASOFT','2019-05-07 21:23:15.857'),
(353,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','</zone>','admin','ZKEASOFT','2019-05-07 21:23:15.857','admin','ZKEASOFT','2019-05-07 21:23:15.857'),
(354,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:23:15.860','admin','ZKEASOFT','2019-05-07 21:23:15.860'),
(355,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','<zone>','admin','ZKEASOFT','2019-05-07 21:23:15.863','admin','ZKEASOFT','2019-05-07 21:23:15.863'),
(356,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','ZONE-2','admin','ZKEASOFT','2019-05-07 21:23:15.867','admin','ZKEASOFT','2019-05-07 21:23:15.867'),
(357,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','</zone>','admin','ZKEASOFT','2019-05-07 21:23:15.867','admin','ZKEASOFT','2019-05-07 21:23:15.867'),
(358,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:23:15.870','admin','ZKEASOFT','2019-05-07 21:23:15.870'),
(359,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','<zone>','admin','ZKEASOFT','2019-05-07 21:23:15.873','admin','ZKEASOFT','2019-05-07 21:23:15.873'),
(360,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','ZONE-3','admin','ZKEASOFT','2019-05-07 21:23:15.877','admin','ZKEASOFT','2019-05-07 21:23:15.877'),
(361,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','</zone>','admin','ZKEASOFT','2019-05-07 21:23:15.880','admin','ZKEASOFT','2019-05-07 21:23:15.880'),
(362,'ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:23:15.880','admin','ZKEASOFT','2019-05-07 21:23:15.880'),
(363,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:24:47.673','admin','ZKEASOFT','2019-05-07 21:24:47.673'),
(364,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','<zone>','admin','ZKEASOFT','2019-05-07 21:24:47.680','admin','ZKEASOFT','2019-05-07 21:24:47.680'),
(365,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','ZONE-0','admin','ZKEASOFT','2019-05-07 21:24:47.683','admin','ZKEASOFT','2019-05-07 21:24:47.683'),
(366,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','</zone>','admin','ZKEASOFT','2019-05-07 21:24:47.687','admin','ZKEASOFT','2019-05-07 21:24:47.687'),
(367,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:24:47.690','admin','ZKEASOFT','2019-05-07 21:24:47.690'),
(368,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','<zone>','admin','ZKEASOFT','2019-05-07 21:24:47.693','admin','ZKEASOFT','2019-05-07 21:24:47.693'),
(369,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','ZONE-1','admin','ZKEASOFT','2019-05-07 21:24:47.697','admin','ZKEASOFT','2019-05-07 21:24:47.697'),
(370,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','</zone>','admin','ZKEASOFT','2019-05-07 21:24:47.700','admin','ZKEASOFT','2019-05-07 21:24:47.700'),
(371,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:24:47.707','admin','ZKEASOFT','2019-05-07 21:24:47.707'),
(372,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','<zone>','admin','ZKEASOFT','2019-05-07 21:24:47.710','admin','ZKEASOFT','2019-05-07 21:24:47.710'),
(373,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','ZONE-2','admin','ZKEASOFT','2019-05-07 21:24:47.713','admin','ZKEASOFT','2019-05-07 21:24:47.713'),
(374,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','</zone>','admin','ZKEASOFT','2019-05-07 21:24:47.713','admin','ZKEASOFT','2019-05-07 21:24:47.713'),
(375,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:24:47.720','admin','ZKEASOFT','2019-05-07 21:24:47.720'),
(376,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','<zone>','admin','ZKEASOFT','2019-05-07 21:24:47.723','admin','ZKEASOFT','2019-05-07 21:24:47.723'),
(377,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','ZONE-3','admin','ZKEASOFT','2019-05-07 21:24:47.727','admin','ZKEASOFT','2019-05-07 21:24:47.727'),
(378,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','</zone>','admin','ZKEASOFT','2019-05-07 21:24:47.727','admin','ZKEASOFT','2019-05-07 21:24:47.727'),
(379,'ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:24:47.730','admin','ZKEASOFT','2019-05-07 21:24:47.730'),
(380,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:24:56.410','admin','ZKEASOFT','2019-05-07 21:24:56.410'),
(381,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','<zone>','admin','ZKEASOFT','2019-05-07 21:24:56.413','admin','ZKEASOFT','2019-05-07 21:24:56.413'),
(382,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','ZONE-0','admin','ZKEASOFT','2019-05-07 21:24:56.417','admin','ZKEASOFT','2019-05-07 21:24:56.417'),
(383,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','</zone>','admin','ZKEASOFT','2019-05-07 21:24:56.420','admin','ZKEASOFT','2019-05-07 21:24:56.420'),
(384,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:24:56.423','admin','ZKEASOFT','2019-05-07 21:24:56.423'),
(385,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','<zone>','admin','ZKEASOFT','2019-05-07 21:24:56.427','admin','ZKEASOFT','2019-05-07 21:24:56.427'),
(386,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','ZONE-1','admin','ZKEASOFT','2019-05-07 21:24:56.427','admin','ZKEASOFT','2019-05-07 21:24:56.427'),
(387,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','</zone>','admin','ZKEASOFT','2019-05-07 21:24:56.433','admin','ZKEASOFT','2019-05-07 21:24:56.433'),
(388,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:24:56.437','admin','ZKEASOFT','2019-05-07 21:24:56.437'),
(389,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','<zone>','admin','ZKEASOFT','2019-05-07 21:24:56.440','admin','ZKEASOFT','2019-05-07 21:24:56.440'),
(390,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','ZONE-2','admin','ZKEASOFT','2019-05-07 21:24:56.443','admin','ZKEASOFT','2019-05-07 21:24:56.443'),
(391,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','</zone>','admin','ZKEASOFT','2019-05-07 21:24:56.443','admin','ZKEASOFT','2019-05-07 21:24:56.443'),
(392,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:24:56.450','admin','ZKEASOFT','2019-05-07 21:24:56.450'),
(393,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','<zone>','admin','ZKEASOFT','2019-05-07 21:24:56.453','admin','ZKEASOFT','2019-05-07 21:24:56.453'),
(394,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','ZONE-3','admin','ZKEASOFT','2019-05-07 21:24:56.457','admin','ZKEASOFT','2019-05-07 21:24:56.457'),
(395,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','</zone>','admin','ZKEASOFT','2019-05-07 21:24:56.457','admin','ZKEASOFT','2019-05-07 21:24:56.457'),
(396,'ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:24:56.460','admin','ZKEASOFT','2019-05-07 21:24:56.460'),
(397,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:13.613','admin','ZKEASOFT','2019-05-07 21:25:13.613'),
(398,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','<zone>','admin','ZKEASOFT','2019-05-07 21:25:13.617','admin','ZKEASOFT','2019-05-07 21:25:13.617'),
(399,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','ZONE-0','admin','ZKEASOFT','2019-05-07 21:25:13.620','admin','ZKEASOFT','2019-05-07 21:25:13.620'),
(400,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','</zone>','admin','ZKEASOFT','2019-05-07 21:25:13.623','admin','ZKEASOFT','2019-05-07 21:25:13.623'),
(401,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:13.627','admin','ZKEASOFT','2019-05-07 21:25:13.627'),
(402,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','<zone>','admin','ZKEASOFT','2019-05-07 21:25:13.630','admin','ZKEASOFT','2019-05-07 21:25:13.630'),
(403,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','ZONE-1','admin','ZKEASOFT','2019-05-07 21:25:13.633','admin','ZKEASOFT','2019-05-07 21:25:13.633'),
(404,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','</zone>','admin','ZKEASOFT','2019-05-07 21:25:13.637','admin','ZKEASOFT','2019-05-07 21:25:13.637'),
(405,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:13.643','admin','ZKEASOFT','2019-05-07 21:25:13.643'),
(406,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','<zone>','admin','ZKEASOFT','2019-05-07 21:25:13.647','admin','ZKEASOFT','2019-05-07 21:25:13.647'),
(407,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','ZONE-2','admin','ZKEASOFT','2019-05-07 21:25:13.650','admin','ZKEASOFT','2019-05-07 21:25:13.650'),
(408,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','</zone>','admin','ZKEASOFT','2019-05-07 21:25:13.653','admin','ZKEASOFT','2019-05-07 21:25:13.653'),
(409,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:13.657','admin','ZKEASOFT','2019-05-07 21:25:13.657'),
(410,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','<zone>','admin','ZKEASOFT','2019-05-07 21:25:13.660','admin','ZKEASOFT','2019-05-07 21:25:13.660'),
(411,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','ZONE-3','admin','ZKEASOFT','2019-05-07 21:25:13.663','admin','ZKEASOFT','2019-05-07 21:25:13.663'),
(412,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','</zone>','admin','ZKEASOFT','2019-05-07 21:25:13.667','admin','ZKEASOFT','2019-05-07 21:25:13.667'),
(413,'ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:25:13.673','admin','ZKEASOFT','2019-05-07 21:25:13.673'),
(414,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:23.207','admin','ZKEASOFT','2019-05-07 21:25:23.207'),
(415,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','<zone>','admin','ZKEASOFT','2019-05-07 21:25:23.210','admin','ZKEASOFT','2019-05-07 21:25:23.210'),
(416,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','ZONE-0','admin','ZKEASOFT','2019-05-07 21:25:23.213','admin','ZKEASOFT','2019-05-07 21:25:23.213'),
(417,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','</zone>','admin','ZKEASOFT','2019-05-07 21:25:23.217','admin','ZKEASOFT','2019-05-07 21:25:23.217'),
(418,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:23.217','admin','ZKEASOFT','2019-05-07 21:25:23.217'),
(419,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','<zone>','admin','ZKEASOFT','2019-05-07 21:25:23.220','admin','ZKEASOFT','2019-05-07 21:25:23.220'),
(420,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','ZONE-1','admin','ZKEASOFT','2019-05-07 21:25:23.223','admin','ZKEASOFT','2019-05-07 21:25:23.223'),
(421,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','</zone>','admin','ZKEASOFT','2019-05-07 21:25:23.223','admin','ZKEASOFT','2019-05-07 21:25:23.223'),
(422,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:23.227','admin','ZKEASOFT','2019-05-07 21:25:23.227'),
(423,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','<zone>','admin','ZKEASOFT','2019-05-07 21:25:23.230','admin','ZKEASOFT','2019-05-07 21:25:23.230'),
(424,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','ZONE-2','admin','ZKEASOFT','2019-05-07 21:25:23.233','admin','ZKEASOFT','2019-05-07 21:25:23.233'),
(425,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','</zone>','admin','ZKEASOFT','2019-05-07 21:25:23.237','admin','ZKEASOFT','2019-05-07 21:25:23.237'),
(426,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:23.240','admin','ZKEASOFT','2019-05-07 21:25:23.240'),
(427,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','<zone>','admin','ZKEASOFT','2019-05-07 21:25:23.243','admin','ZKEASOFT','2019-05-07 21:25:23.243'),
(428,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','ZONE-3','admin','ZKEASOFT','2019-05-07 21:25:23.243','admin','ZKEASOFT','2019-05-07 21:25:23.243'),
(429,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','</zone>','admin','ZKEASOFT','2019-05-07 21:25:23.247','admin','ZKEASOFT','2019-05-07 21:25:23.247'),
(430,'ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:25:23.247','admin','ZKEASOFT','2019-05-07 21:25:23.247'),
(431,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:35.017','admin','ZKEASOFT','2019-05-07 21:25:35.017'),
(432,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','<zone>','admin','ZKEASOFT','2019-05-07 21:25:35.020','admin','ZKEASOFT','2019-05-07 21:25:35.020'),
(433,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','ZONE-0','admin','ZKEASOFT','2019-05-07 21:25:35.023','admin','ZKEASOFT','2019-05-07 21:25:35.023'),
(434,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','</zone>','admin','ZKEASOFT','2019-05-07 21:25:35.027','admin','ZKEASOFT','2019-05-07 21:25:35.027'),
(435,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:35.030','admin','ZKEASOFT','2019-05-07 21:25:35.030'),
(436,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','<zone>','admin','ZKEASOFT','2019-05-07 21:25:35.033','admin','ZKEASOFT','2019-05-07 21:25:35.033'),
(437,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','ZONE-1','admin','ZKEASOFT','2019-05-07 21:25:35.037','admin','ZKEASOFT','2019-05-07 21:25:35.037'),
(438,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','</zone>','admin','ZKEASOFT','2019-05-07 21:25:35.040','admin','ZKEASOFT','2019-05-07 21:25:35.040'),
(439,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:35.043','admin','ZKEASOFT','2019-05-07 21:25:35.043'),
(440,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','<zone>','admin','ZKEASOFT','2019-05-07 21:25:35.047','admin','ZKEASOFT','2019-05-07 21:25:35.047'),
(441,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','ZONE-2','admin','ZKEASOFT','2019-05-07 21:25:35.050','admin','ZKEASOFT','2019-05-07 21:25:35.050'),
(442,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','</zone>','admin','ZKEASOFT','2019-05-07 21:25:35.057','admin','ZKEASOFT','2019-05-07 21:25:35.057'),
(443,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:35.060','admin','ZKEASOFT','2019-05-07 21:25:35.060'),
(444,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','<zone>','admin','ZKEASOFT','2019-05-07 21:25:35.063','admin','ZKEASOFT','2019-05-07 21:25:35.063'),
(445,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','ZONE-3','admin','ZKEASOFT','2019-05-07 21:25:35.067','admin','ZKEASOFT','2019-05-07 21:25:35.067'),
(446,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','</zone>','admin','ZKEASOFT','2019-05-07 21:25:35.070','admin','ZKEASOFT','2019-05-07 21:25:35.070'),
(447,'ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:25:35.073','admin','ZKEASOFT','2019-05-07 21:25:35.073'),
(448,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:48.770','admin','ZKEASOFT','2019-05-07 21:25:48.770'),
(449,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','<zone>','admin','ZKEASOFT','2019-05-07 21:25:48.773','admin','ZKEASOFT','2019-05-07 21:25:48.773'),
(450,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','ZONE-0','admin','ZKEASOFT','2019-05-07 21:25:48.777','admin','ZKEASOFT','2019-05-07 21:25:48.777'),
(451,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','</zone>','admin','ZKEASOFT','2019-05-07 21:25:48.780','admin','ZKEASOFT','2019-05-07 21:25:48.780'),
(452,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:48.787','admin','ZKEASOFT','2019-05-07 21:25:48.787'),
(453,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','<zone>','admin','ZKEASOFT','2019-05-07 21:25:48.790','admin','ZKEASOFT','2019-05-07 21:25:48.790'),
(454,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','ZONE-1','admin','ZKEASOFT','2019-05-07 21:25:48.793','admin','ZKEASOFT','2019-05-07 21:25:48.793'),
(455,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','</zone>','admin','ZKEASOFT','2019-05-07 21:25:48.793','admin','ZKEASOFT','2019-05-07 21:25:48.793'),
(456,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:48.797','admin','ZKEASOFT','2019-05-07 21:25:48.797'),
(457,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','<zone>','admin','ZKEASOFT','2019-05-07 21:25:48.800','admin','ZKEASOFT','2019-05-07 21:25:48.800'),
(458,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','ZONE-2','admin','ZKEASOFT','2019-05-07 21:25:48.800','admin','ZKEASOFT','2019-05-07 21:25:48.800'),
(459,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','</zone>','admin','ZKEASOFT','2019-05-07 21:25:48.803','admin','ZKEASOFT','2019-05-07 21:25:48.803'),
(460,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:48.807','admin','ZKEASOFT','2019-05-07 21:25:48.807'),
(461,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','<zone>','admin','ZKEASOFT','2019-05-07 21:25:48.810','admin','ZKEASOFT','2019-05-07 21:25:48.810'),
(462,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','ZONE-3','admin','ZKEASOFT','2019-05-07 21:25:48.813','admin','ZKEASOFT','2019-05-07 21:25:48.813'),
(463,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','</zone>','admin','ZKEASOFT','2019-05-07 21:25:48.813','admin','ZKEASOFT','2019-05-07 21:25:48.813'),
(464,'ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:25:48.817','admin','ZKEASOFT','2019-05-07 21:25:48.817'),
(465,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:59.657','admin','ZKEASOFT','2019-05-07 21:25:59.657'),
(466,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','<zone>','admin','ZKEASOFT','2019-05-07 21:25:59.660','admin','ZKEASOFT','2019-05-07 21:25:59.660'),
(467,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','ZONE-0','admin','ZKEASOFT','2019-05-07 21:25:59.663','admin','ZKEASOFT','2019-05-07 21:25:59.663'),
(468,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','</zone>','admin','ZKEASOFT','2019-05-07 21:25:59.667','admin','ZKEASOFT','2019-05-07 21:25:59.667'),
(469,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:59.670','admin','ZKEASOFT','2019-05-07 21:25:59.670'),
(470,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','<zone>','admin','ZKEASOFT','2019-05-07 21:25:59.673','admin','ZKEASOFT','2019-05-07 21:25:59.673'),
(471,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','ZONE-1','admin','ZKEASOFT','2019-05-07 21:25:59.677','admin','ZKEASOFT','2019-05-07 21:25:59.677'),
(472,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','</zone>','admin','ZKEASOFT','2019-05-07 21:25:59.680','admin','ZKEASOFT','2019-05-07 21:25:59.680'),
(473,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:59.683','admin','ZKEASOFT','2019-05-07 21:25:59.683'),
(474,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','<zone>','admin','ZKEASOFT','2019-05-07 21:25:59.687','admin','ZKEASOFT','2019-05-07 21:25:59.687'),
(475,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','ZONE-2','admin','ZKEASOFT','2019-05-07 21:25:59.687','admin','ZKEASOFT','2019-05-07 21:25:59.687'),
(476,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','</zone>','admin','ZKEASOFT','2019-05-07 21:25:59.690','admin','ZKEASOFT','2019-05-07 21:25:59.690'),
(477,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:25:59.693','admin','ZKEASOFT','2019-05-07 21:25:59.693'),
(478,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','<zone>','admin','ZKEASOFT','2019-05-07 21:25:59.700','admin','ZKEASOFT','2019-05-07 21:25:59.700'),
(479,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','ZONE-3','admin','ZKEASOFT','2019-05-07 21:25:59.700','admin','ZKEASOFT','2019-05-07 21:25:59.700'),
(480,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','</zone>','admin','ZKEASOFT','2019-05-07 21:25:59.703','admin','ZKEASOFT','2019-05-07 21:25:59.703'),
(481,'ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:25:59.707','admin','ZKEASOFT','2019-05-07 21:25:59.707'),
(482,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:21.580','admin','ZKEASOFT','2019-05-07 21:26:21.580'),
(483,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','<zone>','admin','ZKEASOFT','2019-05-07 21:26:21.580','admin','ZKEASOFT','2019-05-07 21:26:21.580'),
(484,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','ZONE-0','admin','ZKEASOFT','2019-05-07 21:26:21.583','admin','ZKEASOFT','2019-05-07 21:26:21.583'),
(485,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','</zone>','admin','ZKEASOFT','2019-05-07 21:26:21.587','admin','ZKEASOFT','2019-05-07 21:26:21.587'),
(486,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:21.587','admin','ZKEASOFT','2019-05-07 21:26:21.587'),
(487,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','<zone>','admin','ZKEASOFT','2019-05-07 21:26:21.590','admin','ZKEASOFT','2019-05-07 21:26:21.590'),
(488,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','ZONE-1','admin','ZKEASOFT','2019-05-07 21:26:21.593','admin','ZKEASOFT','2019-05-07 21:26:21.593'),
(489,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','</zone>','admin','ZKEASOFT','2019-05-07 21:26:21.597','admin','ZKEASOFT','2019-05-07 21:26:21.597'),
(490,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:21.600','admin','ZKEASOFT','2019-05-07 21:26:21.600'),
(491,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','<zone>','admin','ZKEASOFT','2019-05-07 21:26:21.600','admin','ZKEASOFT','2019-05-07 21:26:21.600'),
(492,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','ZONE-2','admin','ZKEASOFT','2019-05-07 21:26:21.603','admin','ZKEASOFT','2019-05-07 21:26:21.603'),
(493,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','</zone>','admin','ZKEASOFT','2019-05-07 21:26:21.607','admin','ZKEASOFT','2019-05-07 21:26:21.607'),
(494,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:21.607','admin','ZKEASOFT','2019-05-07 21:26:21.607'),
(495,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','<zone>','admin','ZKEASOFT','2019-05-07 21:26:21.613','admin','ZKEASOFT','2019-05-07 21:26:21.613'),
(496,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','ZONE-3','admin','ZKEASOFT','2019-05-07 21:26:21.617','admin','ZKEASOFT','2019-05-07 21:26:21.617'),
(497,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','</zone>','admin','ZKEASOFT','2019-05-07 21:26:21.617','admin','ZKEASOFT','2019-05-07 21:26:21.617'),
(498,'ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:26:21.620','admin','ZKEASOFT','2019-05-07 21:26:21.620'),
(499,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:23.240','admin','ZKEASOFT','2019-05-07 21:26:23.240'),
(500,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','<zone>','admin','ZKEASOFT','2019-05-07 21:26:23.247','admin','ZKEASOFT','2019-05-07 21:26:23.247'),
(501,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','ZONE-0','admin','ZKEASOFT','2019-05-07 21:26:23.250','admin','ZKEASOFT','2019-05-07 21:26:23.250'),
(502,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','</zone>','admin','ZKEASOFT','2019-05-07 21:26:23.257','admin','ZKEASOFT','2019-05-07 21:26:23.257'),
(503,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:23.260','admin','ZKEASOFT','2019-05-07 21:26:23.260'),
(504,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','<zone>','admin','ZKEASOFT','2019-05-07 21:26:23.260','admin','ZKEASOFT','2019-05-07 21:26:23.260'),
(505,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','ZONE-1','admin','ZKEASOFT','2019-05-07 21:26:23.263','admin','ZKEASOFT','2019-05-07 21:26:23.263'),
(506,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','</zone>','admin','ZKEASOFT','2019-05-07 21:26:23.263','admin','ZKEASOFT','2019-05-07 21:26:23.263'),
(507,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:23.263','admin','ZKEASOFT','2019-05-07 21:26:23.263'),
(508,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','<zone>','admin','ZKEASOFT','2019-05-07 21:26:23.267','admin','ZKEASOFT','2019-05-07 21:26:23.267'),
(509,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','ZONE-2','admin','ZKEASOFT','2019-05-07 21:26:23.270','admin','ZKEASOFT','2019-05-07 21:26:23.270'),
(510,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','</zone>','admin','ZKEASOFT','2019-05-07 21:26:23.270','admin','ZKEASOFT','2019-05-07 21:26:23.270'),
(511,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:23.273','admin','ZKEASOFT','2019-05-07 21:26:23.273'),
(512,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','<zone>','admin','ZKEASOFT','2019-05-07 21:26:23.277','admin','ZKEASOFT','2019-05-07 21:26:23.277'),
(513,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','ZONE-3','admin','ZKEASOFT','2019-05-07 21:26:23.277','admin','ZKEASOFT','2019-05-07 21:26:23.277'),
(514,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','</zone>','admin','ZKEASOFT','2019-05-07 21:26:23.280','admin','ZKEASOFT','2019-05-07 21:26:23.280'),
(515,'ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:26:23.280','admin','ZKEASOFT','2019-05-07 21:26:23.280'),
(516,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:46.820','admin','ZKEASOFT','2019-05-07 21:26:46.820'),
(517,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','<zone>','admin','ZKEASOFT','2019-05-07 21:26:46.823','admin','ZKEASOFT','2019-05-07 21:26:46.823'),
(518,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','ZONE-0','admin','ZKEASOFT','2019-05-07 21:26:46.830','admin','ZKEASOFT','2019-05-07 21:26:46.830'),
(519,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','</zone>','admin','ZKEASOFT','2019-05-07 21:26:46.833','admin','ZKEASOFT','2019-05-07 21:26:46.833'),
(520,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:46.833','admin','ZKEASOFT','2019-05-07 21:26:46.833'),
(521,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','<zone>','admin','ZKEASOFT','2019-05-07 21:26:46.837','admin','ZKEASOFT','2019-05-07 21:26:46.837'),
(522,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','ZONE-1','admin','ZKEASOFT','2019-05-07 21:26:46.840','admin','ZKEASOFT','2019-05-07 21:26:46.840'),
(523,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','</zone>','admin','ZKEASOFT','2019-05-07 21:26:46.843','admin','ZKEASOFT','2019-05-07 21:26:46.843'),
(524,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:46.847','admin','ZKEASOFT','2019-05-07 21:26:46.847'),
(525,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','<zone>','admin','ZKEASOFT','2019-05-07 21:26:46.850','admin','ZKEASOFT','2019-05-07 21:26:46.850'),
(526,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','ZONE-2','admin','ZKEASOFT','2019-05-07 21:26:46.853','admin','ZKEASOFT','2019-05-07 21:26:46.853'),
(527,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','</zone>','admin','ZKEASOFT','2019-05-07 21:26:46.857','admin','ZKEASOFT','2019-05-07 21:26:46.857'),
(528,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:26:46.857','admin','ZKEASOFT','2019-05-07 21:26:46.857'),
(529,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','<zone>','admin','ZKEASOFT','2019-05-07 21:26:46.863','admin','ZKEASOFT','2019-05-07 21:26:46.863'),
(530,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','ZONE-3','admin','ZKEASOFT','2019-05-07 21:26:46.867','admin','ZKEASOFT','2019-05-07 21:26:46.867'),
(531,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','</zone>','admin','ZKEASOFT','2019-05-07 21:26:46.867','admin','ZKEASOFT','2019-05-07 21:26:46.867'),
(532,'ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:26:46.870','admin','ZKEASOFT','2019-05-07 21:26:46.870'),
(533,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:00.937','admin','ZKEASOFT','2019-05-07 21:27:00.937'),
(534,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','<zone>','admin','ZKEASOFT','2019-05-07 21:27:00.943','admin','ZKEASOFT','2019-05-07 21:27:00.943'),
(535,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','ZONE-0','admin','ZKEASOFT','2019-05-07 21:27:00.947','admin','ZKEASOFT','2019-05-07 21:27:00.947'),
(536,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','</zone>','admin','ZKEASOFT','2019-05-07 21:27:00.950','admin','ZKEASOFT','2019-05-07 21:27:00.950'),
(537,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:00.953','admin','ZKEASOFT','2019-05-07 21:27:00.953'),
(538,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','<zone>','admin','ZKEASOFT','2019-05-07 21:27:00.957','admin','ZKEASOFT','2019-05-07 21:27:00.957'),
(539,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','ZONE-1','admin','ZKEASOFT','2019-05-07 21:27:00.957','admin','ZKEASOFT','2019-05-07 21:27:00.957'),
(540,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','</zone>','admin','ZKEASOFT','2019-05-07 21:27:00.960','admin','ZKEASOFT','2019-05-07 21:27:00.960'),
(541,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:00.963','admin','ZKEASOFT','2019-05-07 21:27:00.963'),
(542,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','<zone>','admin','ZKEASOFT','2019-05-07 21:27:00.963','admin','ZKEASOFT','2019-05-07 21:27:00.963'),
(543,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','ZONE-2','admin','ZKEASOFT','2019-05-07 21:27:00.967','admin','ZKEASOFT','2019-05-07 21:27:00.967'),
(544,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','</zone>','admin','ZKEASOFT','2019-05-07 21:27:00.973','admin','ZKEASOFT','2019-05-07 21:27:00.973'),
(545,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:00.973','admin','ZKEASOFT','2019-05-07 21:27:00.973'),
(546,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','<zone>','admin','ZKEASOFT','2019-05-07 21:27:00.977','admin','ZKEASOFT','2019-05-07 21:27:00.977'),
(547,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','ZONE-3','admin','ZKEASOFT','2019-05-07 21:27:00.980','admin','ZKEASOFT','2019-05-07 21:27:00.980'),
(548,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','</zone>','admin','ZKEASOFT','2019-05-07 21:27:00.980','admin','ZKEASOFT','2019-05-07 21:27:00.980'),
(549,'ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:27:00.983','admin','ZKEASOFT','2019-05-07 21:27:00.983'),
(550,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:08.597','admin','ZKEASOFT','2019-05-07 21:27:08.597'),
(551,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','<zone>','admin','ZKEASOFT','2019-05-07 21:27:08.597','admin','ZKEASOFT','2019-05-07 21:27:08.597'),
(552,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','ZONE-0','admin','ZKEASOFT','2019-05-07 21:27:08.600','admin','ZKEASOFT','2019-05-07 21:27:08.600'),
(553,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','</zone>','admin','ZKEASOFT','2019-05-07 21:27:08.603','admin','ZKEASOFT','2019-05-07 21:27:08.603'),
(554,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:08.603','admin','ZKEASOFT','2019-05-07 21:27:08.603'),
(555,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','<zone>','admin','ZKEASOFT','2019-05-07 21:27:08.607','admin','ZKEASOFT','2019-05-07 21:27:08.607'),
(556,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','ZONE-1','admin','ZKEASOFT','2019-05-07 21:27:08.610','admin','ZKEASOFT','2019-05-07 21:27:08.610'),
(557,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','</zone>','admin','ZKEASOFT','2019-05-07 21:27:08.613','admin','ZKEASOFT','2019-05-07 21:27:08.613'),
(558,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:08.613','admin','ZKEASOFT','2019-05-07 21:27:08.613'),
(559,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','<zone>','admin','ZKEASOFT','2019-05-07 21:27:08.617','admin','ZKEASOFT','2019-05-07 21:27:08.617'),
(560,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','ZONE-2','admin','ZKEASOFT','2019-05-07 21:27:08.620','admin','ZKEASOFT','2019-05-07 21:27:08.620'),
(561,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','</zone>','admin','ZKEASOFT','2019-05-07 21:27:08.620','admin','ZKEASOFT','2019-05-07 21:27:08.620'),
(562,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:08.627','admin','ZKEASOFT','2019-05-07 21:27:08.627'),
(563,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','<zone>','admin','ZKEASOFT','2019-05-07 21:27:08.630','admin','ZKEASOFT','2019-05-07 21:27:08.630'),
(564,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','ZONE-3','admin','ZKEASOFT','2019-05-07 21:27:08.630','admin','ZKEASOFT','2019-05-07 21:27:08.630'),
(565,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','</zone>','admin','ZKEASOFT','2019-05-07 21:27:08.633','admin','ZKEASOFT','2019-05-07 21:27:08.633'),
(566,'ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:27:08.637','admin','ZKEASOFT','2019-05-07 21:27:08.637'),
(567,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:42.260','admin','ZKEASOFT','2019-05-07 21:27:42.260'),
(568,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','<zone>','admin','ZKEASOFT','2019-05-07 21:27:42.263','admin','ZKEASOFT','2019-05-07 21:27:42.263'),
(569,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','ZONE-0','admin','ZKEASOFT','2019-05-07 21:27:42.267','admin','ZKEASOFT','2019-05-07 21:27:42.267'),
(570,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','</zone>','admin','ZKEASOFT','2019-05-07 21:27:42.270','admin','ZKEASOFT','2019-05-07 21:27:42.270'),
(571,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:42.273','admin','ZKEASOFT','2019-05-07 21:27:42.273'),
(572,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','<zone>','admin','ZKEASOFT','2019-05-07 21:27:42.277','admin','ZKEASOFT','2019-05-07 21:27:42.277'),
(573,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','ZONE-1','admin','ZKEASOFT','2019-05-07 21:27:42.277','admin','ZKEASOFT','2019-05-07 21:27:42.277'),
(574,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','</zone>','admin','ZKEASOFT','2019-05-07 21:27:42.280','admin','ZKEASOFT','2019-05-07 21:27:42.280'),
(575,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:42.283','admin','ZKEASOFT','2019-05-07 21:27:42.283'),
(576,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','<zone>','admin','ZKEASOFT','2019-05-07 21:27:42.287','admin','ZKEASOFT','2019-05-07 21:27:42.287'),
(577,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','ZONE-2','admin','ZKEASOFT','2019-05-07 21:27:42.287','admin','ZKEASOFT','2019-05-07 21:27:42.287'),
(578,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','</zone>','admin','ZKEASOFT','2019-05-07 21:27:42.290','admin','ZKEASOFT','2019-05-07 21:27:42.290'),
(579,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:27:42.293','admin','ZKEASOFT','2019-05-07 21:27:42.293'),
(580,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','<zone>','admin','ZKEASOFT','2019-05-07 21:27:42.293','admin','ZKEASOFT','2019-05-07 21:27:42.293'),
(581,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','ZONE-3','admin','ZKEASOFT','2019-05-07 21:27:42.297','admin','ZKEASOFT','2019-05-07 21:27:42.297'),
(582,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','</zone>','admin','ZKEASOFT','2019-05-07 21:27:42.300','admin','ZKEASOFT','2019-05-07 21:27:42.300'),
(583,'ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:27:42.303','admin','ZKEASOFT','2019-05-07 21:27:42.303'),
(584,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:28:46.597','admin','ZKEASOFT','2019-05-07 21:28:46.597'),
(585,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','<zone>','admin','ZKEASOFT','2019-05-07 21:28:46.600','admin','ZKEASOFT','2019-05-07 21:28:46.600'),
(586,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','ZONE-0','admin','ZKEASOFT','2019-05-07 21:28:46.603','admin','ZKEASOFT','2019-05-07 21:28:46.603'),
(587,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','</zone>','admin','ZKEASOFT','2019-05-07 21:28:46.607','admin','ZKEASOFT','2019-05-07 21:28:46.607'),
(588,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:28:46.610','admin','ZKEASOFT','2019-05-07 21:28:46.610'),
(589,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','<zone>','admin','ZKEASOFT','2019-05-07 21:28:46.610','admin','ZKEASOFT','2019-05-07 21:28:46.610'),
(590,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','ZONE-1','admin','ZKEASOFT','2019-05-07 21:28:46.613','admin','ZKEASOFT','2019-05-07 21:28:46.613'),
(591,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','</zone>','admin','ZKEASOFT','2019-05-07 21:28:46.617','admin','ZKEASOFT','2019-05-07 21:28:46.617'),
(592,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:28:46.617','admin','ZKEASOFT','2019-05-07 21:28:46.617'),
(593,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','<zone>','admin','ZKEASOFT','2019-05-07 21:28:46.620','admin','ZKEASOFT','2019-05-07 21:28:46.620'),
(594,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','ZONE-2','admin','ZKEASOFT','2019-05-07 21:28:46.623','admin','ZKEASOFT','2019-05-07 21:28:46.623'),
(595,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','</zone>','admin','ZKEASOFT','2019-05-07 21:28:46.627','admin','ZKEASOFT','2019-05-07 21:28:46.627'),
(596,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2019-05-07 21:28:46.630','admin','ZKEASOFT','2019-05-07 21:28:46.630'),
(597,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','<zone>','admin','ZKEASOFT','2019-05-07 21:28:46.630','admin','ZKEASOFT','2019-05-07 21:28:46.630'),
(598,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','ZONE-3','admin','ZKEASOFT','2019-05-07 21:28:46.633','admin','ZKEASOFT','2019-05-07 21:28:46.633'),
(599,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','</zone>','admin','ZKEASOFT','2019-05-07 21:28:46.637','admin','ZKEASOFT','2019-05-07 21:28:46.637'),
(600,'ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-07 21:28:46.640','admin','ZKEASOFT','2019-05-07 21:28:46.640'),
(601,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:12:34.627','admin','ZKEASOFT','2020-04-05 10:12:34.627'),
(602,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','<zone>','admin','ZKEASOFT','2020-04-05 10:12:34.680','admin','ZKEASOFT','2020-04-05 10:12:34.680'),
(603,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','ZONE-0','admin','ZKEASOFT','2020-04-05 10:12:34.683','admin','ZKEASOFT','2020-04-05 10:12:34.683'),
(604,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','</zone>','admin','ZKEASOFT','2020-04-05 10:12:34.690','admin','ZKEASOFT','2020-04-05 10:12:34.690'),
(605,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:12:34.693','admin','ZKEASOFT','2020-04-05 10:12:34.693'),
(606,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','<zone>','admin','ZKEASOFT','2020-04-05 10:12:34.697','admin','ZKEASOFT','2020-04-05 10:12:34.697'),
(607,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','ZONE-1','admin','ZKEASOFT','2020-04-05 10:12:34.697','admin','ZKEASOFT','2020-04-05 10:12:34.697'),
(608,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','</zone>','admin','ZKEASOFT','2020-04-05 10:12:34.703','admin','ZKEASOFT','2020-04-05 10:12:34.703'),
(609,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:12:34.707','admin','ZKEASOFT','2020-04-05 10:12:34.707'),
(610,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','<zone>','admin','ZKEASOFT','2020-04-05 10:12:34.710','admin','ZKEASOFT','2020-04-05 10:12:34.710'),
(611,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','ZONE-2','admin','ZKEASOFT','2020-04-05 10:12:34.713','admin','ZKEASOFT','2020-04-05 10:12:34.713'),
(612,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','</zone>','admin','ZKEASOFT','2020-04-05 10:12:34.717','admin','ZKEASOFT','2020-04-05 10:12:34.717'),
(613,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:12:34.723','admin','ZKEASOFT','2020-04-05 10:12:34.723'),
(614,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','<zone>','admin','ZKEASOFT','2020-04-05 10:12:34.727','admin','ZKEASOFT','2020-04-05 10:12:34.727'),
(615,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','ZONE-3','admin','ZKEASOFT','2020-04-05 10:12:34.730','admin','ZKEASOFT','2020-04-05 10:12:34.730'),
(616,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','</zone>','admin','ZKEASOFT','2020-04-05 10:12:34.733','admin','ZKEASOFT','2020-04-05 10:12:34.733'),
(617,'ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2020-04-05 10:12:34.740','admin','ZKEASOFT','2020-04-05 10:12:34.740'),
(618,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:13:06.473','admin','ZKEASOFT','2020-04-05 10:13:06.473'),
(619,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','<zone>','admin','ZKEASOFT','2020-04-05 10:13:06.477','admin','ZKEASOFT','2020-04-05 10:13:06.477'),
(620,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','ZONE-0','admin','ZKEASOFT','2020-04-05 10:13:06.480','admin','ZKEASOFT','2020-04-05 10:13:06.480'),
(621,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','</zone>','admin','ZKEASOFT','2020-04-05 10:13:06.487','admin','ZKEASOFT','2020-04-05 10:13:06.487'),
(622,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:13:06.490','admin','ZKEASOFT','2020-04-05 10:13:06.490'),
(623,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','<zone>','admin','ZKEASOFT','2020-04-05 10:13:06.493','admin','ZKEASOFT','2020-04-05 10:13:06.493'),
(624,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','ZONE-1','admin','ZKEASOFT','2020-04-05 10:13:06.497','admin','ZKEASOFT','2020-04-05 10:13:06.497'),
(625,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','</zone>','admin','ZKEASOFT','2020-04-05 10:13:06.500','admin','ZKEASOFT','2020-04-05 10:13:06.500'),
(626,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:13:06.507','admin','ZKEASOFT','2020-04-05 10:13:06.507'),
(627,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','<zone>','admin','ZKEASOFT','2020-04-05 10:13:06.510','admin','ZKEASOFT','2020-04-05 10:13:06.510'),
(628,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','ZONE-2','admin','ZKEASOFT','2020-04-05 10:13:06.513','admin','ZKEASOFT','2020-04-05 10:13:06.513'),
(629,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','</zone>','admin','ZKEASOFT','2020-04-05 10:13:06.520','admin','ZKEASOFT','2020-04-05 10:13:06.520'),
(630,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:13:06.523','admin','ZKEASOFT','2020-04-05 10:13:06.523'),
(631,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','<zone>','admin','ZKEASOFT','2020-04-05 10:13:06.527','admin','ZKEASOFT','2020-04-05 10:13:06.527'),
(632,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','ZONE-3','admin','ZKEASOFT','2020-04-05 10:13:06.530','admin','ZKEASOFT','2020-04-05 10:13:06.530'),
(633,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','</zone>','admin','ZKEASOFT','2020-04-05 10:13:06.537','admin','ZKEASOFT','2020-04-05 10:13:06.537'),
(634,'ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2020-04-05 10:13:06.540','admin','ZKEASOFT','2020-04-05 10:13:06.540'),
(635,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:13:43.290','admin','ZKEASOFT','2020-04-05 10:13:43.290'),
(636,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','<zone>','admin','ZKEASOFT','2020-04-05 10:13:43.293','admin','ZKEASOFT','2020-04-05 10:13:43.293'),
(637,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','ZONE-0','admin','ZKEASOFT','2020-04-05 10:13:43.297','admin','ZKEASOFT','2020-04-05 10:13:43.297'),
(638,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','</zone>','admin','ZKEASOFT','2020-04-05 10:13:43.300','admin','ZKEASOFT','2020-04-05 10:13:43.300'),
(639,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:13:43.303','admin','ZKEASOFT','2020-04-05 10:13:43.303'),
(640,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','<zone>','admin','ZKEASOFT','2020-04-05 10:13:43.307','admin','ZKEASOFT','2020-04-05 10:13:43.307'),
(641,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','ZONE-1','admin','ZKEASOFT','2020-04-05 10:13:43.313','admin','ZKEASOFT','2020-04-05 10:13:43.313'),
(642,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','</zone>','admin','ZKEASOFT','2020-04-05 10:13:43.317','admin','ZKEASOFT','2020-04-05 10:13:43.317'),
(643,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:13:43.320','admin','ZKEASOFT','2020-04-05 10:13:43.320'),
(644,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','<zone>','admin','ZKEASOFT','2020-04-05 10:13:43.327','admin','ZKEASOFT','2020-04-05 10:13:43.327'),
(645,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','ZONE-2','admin','ZKEASOFT','2020-04-05 10:13:43.330','admin','ZKEASOFT','2020-04-05 10:13:43.330'),
(646,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','</zone>','admin','ZKEASOFT','2020-04-05 10:13:43.330','admin','ZKEASOFT','2020-04-05 10:13:43.330'),
(647,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:13:43.337','admin','ZKEASOFT','2020-04-05 10:13:43.337'),
(648,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','<zone>','admin','ZKEASOFT','2020-04-05 10:13:43.340','admin','ZKEASOFT','2020-04-05 10:13:43.340'),
(649,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','ZONE-3','admin','ZKEASOFT','2020-04-05 10:13:43.347','admin','ZKEASOFT','2020-04-05 10:13:43.347'),
(650,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','</zone>','admin','ZKEASOFT','2020-04-05 10:13:43.350','admin','ZKEASOFT','2020-04-05 10:13:43.350'),
(651,'ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2020-04-05 10:13:43.357','admin','ZKEASOFT','2020-04-05 10:13:43.357'),
(652,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:25.947','admin','ZKEASOFT','2020-04-05 10:14:25.947'),
(653,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','<zone>','admin','ZKEASOFT','2020-04-05 10:14:25.950','admin','ZKEASOFT','2020-04-05 10:14:25.950'),
(654,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','ZONE-0','admin','ZKEASOFT','2020-04-05 10:14:25.957','admin','ZKEASOFT','2020-04-05 10:14:25.957'),
(655,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','</zone>','admin','ZKEASOFT','2020-04-05 10:14:25.960','admin','ZKEASOFT','2020-04-05 10:14:25.960'),
(656,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:25.963','admin','ZKEASOFT','2020-04-05 10:14:25.963'),
(657,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','<zone>','admin','ZKEASOFT','2020-04-05 10:14:25.963','admin','ZKEASOFT','2020-04-05 10:14:25.963'),
(658,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','ZONE-1','admin','ZKEASOFT','2020-04-05 10:14:25.967','admin','ZKEASOFT','2020-04-05 10:14:25.967'),
(659,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','</zone>','admin','ZKEASOFT','2020-04-05 10:14:25.973','admin','ZKEASOFT','2020-04-05 10:14:25.973'),
(660,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:25.977','admin','ZKEASOFT','2020-04-05 10:14:25.977'),
(661,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','<zone>','admin','ZKEASOFT','2020-04-05 10:14:25.977','admin','ZKEASOFT','2020-04-05 10:14:25.977'),
(662,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','ZONE-2','admin','ZKEASOFT','2020-04-05 10:14:25.980','admin','ZKEASOFT','2020-04-05 10:14:25.980'),
(663,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','</zone>','admin','ZKEASOFT','2020-04-05 10:14:25.983','admin','ZKEASOFT','2020-04-05 10:14:25.983'),
(664,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:25.990','admin','ZKEASOFT','2020-04-05 10:14:25.990'),
(665,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','<zone>','admin','ZKEASOFT','2020-04-05 10:14:25.993','admin','ZKEASOFT','2020-04-05 10:14:25.993'),
(666,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','ZONE-3','admin','ZKEASOFT','2020-04-05 10:14:25.997','admin','ZKEASOFT','2020-04-05 10:14:25.997'),
(667,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','</zone>','admin','ZKEASOFT','2020-04-05 10:14:26.000','admin','ZKEASOFT','2020-04-05 10:14:26.000'),
(668,'ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2020-04-05 10:14:26.003','admin','ZKEASOFT','2020-04-05 10:14:26.003'),
(669,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:29.313','admin','ZKEASOFT','2020-04-05 10:14:29.313'),
(670,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','<zone>','admin','ZKEASOFT','2020-04-05 10:14:29.317','admin','ZKEASOFT','2020-04-05 10:14:29.317'),
(671,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','ZONE-0','admin','ZKEASOFT','2020-04-05 10:14:29.320','admin','ZKEASOFT','2020-04-05 10:14:29.320'),
(672,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','</zone>','admin','ZKEASOFT','2020-04-05 10:14:29.327','admin','ZKEASOFT','2020-04-05 10:14:29.327'),
(673,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:29.330','admin','ZKEASOFT','2020-04-05 10:14:29.330'),
(674,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','<zone>','admin','ZKEASOFT','2020-04-05 10:14:29.330','admin','ZKEASOFT','2020-04-05 10:14:29.330'),
(675,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','ZONE-1','admin','ZKEASOFT','2020-04-05 10:14:29.337','admin','ZKEASOFT','2020-04-05 10:14:29.337'),
(676,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','</zone>','admin','ZKEASOFT','2020-04-05 10:14:29.340','admin','ZKEASOFT','2020-04-05 10:14:29.340'),
(677,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:29.343','admin','ZKEASOFT','2020-04-05 10:14:29.343'),
(678,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','<zone>','admin','ZKEASOFT','2020-04-05 10:14:29.347','admin','ZKEASOFT','2020-04-05 10:14:29.347'),
(679,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','ZONE-2','admin','ZKEASOFT','2020-04-05 10:14:29.350','admin','ZKEASOFT','2020-04-05 10:14:29.350'),
(680,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','</zone>','admin','ZKEASOFT','2020-04-05 10:14:29.353','admin','ZKEASOFT','2020-04-05 10:14:29.353'),
(681,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:29.360','admin','ZKEASOFT','2020-04-05 10:14:29.360'),
(682,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','<zone>','admin','ZKEASOFT','2020-04-05 10:14:29.363','admin','ZKEASOFT','2020-04-05 10:14:29.363'),
(683,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','ZONE-3','admin','ZKEASOFT','2020-04-05 10:14:29.367','admin','ZKEASOFT','2020-04-05 10:14:29.367'),
(684,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','</zone>','admin','ZKEASOFT','2020-04-05 10:14:29.370','admin','ZKEASOFT','2020-04-05 10:14:29.370'),
(685,'ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2020-04-05 10:14:29.373','admin','ZKEASOFT','2020-04-05 10:14:29.373'),
(686,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:31.633','admin','ZKEASOFT','2020-04-05 10:14:31.633'),
(687,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','<zone>','admin','ZKEASOFT','2020-04-05 10:14:31.637','admin','ZKEASOFT','2020-04-05 10:14:31.637'),
(688,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','ZONE-0','admin','ZKEASOFT','2020-04-05 10:14:31.640','admin','ZKEASOFT','2020-04-05 10:14:31.640'),
(689,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','</zone>','admin','ZKEASOFT','2020-04-05 10:14:31.643','admin','ZKEASOFT','2020-04-05 10:14:31.643'),
(690,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:31.647','admin','ZKEASOFT','2020-04-05 10:14:31.647'),
(691,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','<zone>','admin','ZKEASOFT','2020-04-05 10:14:31.650','admin','ZKEASOFT','2020-04-05 10:14:31.650'),
(692,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','ZONE-1','admin','ZKEASOFT','2020-04-05 10:14:31.653','admin','ZKEASOFT','2020-04-05 10:14:31.653'),
(693,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','</zone>','admin','ZKEASOFT','2020-04-05 10:14:31.657','admin','ZKEASOFT','2020-04-05 10:14:31.657'),
(694,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:31.660','admin','ZKEASOFT','2020-04-05 10:14:31.660'),
(695,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','<zone>','admin','ZKEASOFT','2020-04-05 10:14:31.663','admin','ZKEASOFT','2020-04-05 10:14:31.663'),
(696,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','ZONE-2','admin','ZKEASOFT','2020-04-05 10:14:31.667','admin','ZKEASOFT','2020-04-05 10:14:31.667'),
(697,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','</zone>','admin','ZKEASOFT','2020-04-05 10:14:31.670','admin','ZKEASOFT','2020-04-05 10:14:31.670'),
(698,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:31.673','admin','ZKEASOFT','2020-04-05 10:14:31.673'),
(699,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','<zone>','admin','ZKEASOFT','2020-04-05 10:14:31.677','admin','ZKEASOFT','2020-04-05 10:14:31.677'),
(700,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','ZONE-3','admin','ZKEASOFT','2020-04-05 10:14:31.677','admin','ZKEASOFT','2020-04-05 10:14:31.677'),
(701,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','</zone>','admin','ZKEASOFT','2020-04-05 10:14:31.680','admin','ZKEASOFT','2020-04-05 10:14:31.680'),
(702,'ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2020-04-05 10:14:31.683','admin','ZKEASOFT','2020-04-05 10:14:31.683'),
(703,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:33.983','admin','ZKEASOFT','2020-04-05 10:14:33.983'),
(704,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','<zone>','admin','ZKEASOFT','2020-04-05 10:14:33.990','admin','ZKEASOFT','2020-04-05 10:14:33.990'),
(705,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','ZONE-0','admin','ZKEASOFT','2020-04-05 10:14:33.990','admin','ZKEASOFT','2020-04-05 10:14:33.990'),
(706,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','</zone>','admin','ZKEASOFT','2020-04-05 10:14:33.993','admin','ZKEASOFT','2020-04-05 10:14:33.993'),
(707,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:33.997','admin','ZKEASOFT','2020-04-05 10:14:33.997'),
(708,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','<zone>','admin','ZKEASOFT','2020-04-05 10:14:34.000','admin','ZKEASOFT','2020-04-05 10:14:34.000'),
(709,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','ZONE-1','admin','ZKEASOFT','2020-04-05 10:14:34.007','admin','ZKEASOFT','2020-04-05 10:14:34.007'),
(710,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','</zone>','admin','ZKEASOFT','2020-04-05 10:14:34.007','admin','ZKEASOFT','2020-04-05 10:14:34.007'),
(711,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:34.010','admin','ZKEASOFT','2020-04-05 10:14:34.010'),
(712,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','<zone>','admin','ZKEASOFT','2020-04-05 10:14:34.013','admin','ZKEASOFT','2020-04-05 10:14:34.013'),
(713,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','ZONE-2','admin','ZKEASOFT','2020-04-05 10:14:34.017','admin','ZKEASOFT','2020-04-05 10:14:34.017'),
(714,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','</zone>','admin','ZKEASOFT','2020-04-05 10:14:34.020','admin','ZKEASOFT','2020-04-05 10:14:34.020'),
(715,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:34.023','admin','ZKEASOFT','2020-04-05 10:14:34.023'),
(716,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','<zone>','admin','ZKEASOFT','2020-04-05 10:14:34.027','admin','ZKEASOFT','2020-04-05 10:14:34.027'),
(717,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','ZONE-3','admin','ZKEASOFT','2020-04-05 10:14:34.030','admin','ZKEASOFT','2020-04-05 10:14:34.030'),
(718,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','</zone>','admin','ZKEASOFT','2020-04-05 10:14:34.033','admin','ZKEASOFT','2020-04-05 10:14:34.033'),
(719,'ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2020-04-05 10:14:34.037','admin','ZKEASOFT','2020-04-05 10:14:34.037'),
(720,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','<div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:36.347','admin','ZKEASOFT','2020-04-05 10:14:36.347'),
(721,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','<zone>','admin','ZKEASOFT','2020-04-05 10:14:36.347','admin','ZKEASOFT','2020-04-05 10:14:36.347'),
(722,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','ZONE-0','admin','ZKEASOFT','2020-04-05 10:14:36.350','admin','ZKEASOFT','2020-04-05 10:14:36.350'),
(723,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','</zone>','admin','ZKEASOFT','2020-04-05 10:14:36.353','admin','ZKEASOFT','2020-04-05 10:14:36.353'),
(724,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','</div>
                </div>
            </div>
        </div>
    </div>
    <div class=\"container main custom-style\">
        <div class=\"additional row\"><div class=\"col-md-8 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:36.357','admin','ZKEASOFT','2020-04-05 10:14:36.357'),
(725,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','<zone>','admin','ZKEASOFT','2020-04-05 10:14:36.360','admin','ZKEASOFT','2020-04-05 10:14:36.360'),
(726,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','ZONE-1','admin','ZKEASOFT','2020-04-05 10:14:36.363','admin','ZKEASOFT','2020-04-05 10:14:36.363'),
(727,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','</zone>','admin','ZKEASOFT','2020-04-05 10:14:36.363','admin','ZKEASOFT','2020-04-05 10:14:36.363'),
(728,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','</div></div></div>
                            <div class=\"col-md-4 additional\">
                                
                            <div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:36.367','admin','ZKEASOFT','2020-04-05 10:14:36.367'),
(729,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','<zone>','admin','ZKEASOFT','2020-04-05 10:14:36.373','admin','ZKEASOFT','2020-04-05 10:14:36.373'),
(730,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','ZONE-2','admin','ZKEASOFT','2020-04-05 10:14:36.373','admin','ZKEASOFT','2020-04-05 10:14:36.373'),
(731,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','</zone>','admin','ZKEASOFT','2020-04-05 10:14:36.377','admin','ZKEASOFT','2020-04-05 10:14:36.377'),
(732,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','</div></div></div></div>
    </div>
    <div class=\"container-fluid main custom-style\">
        <div class=\"additional row\">
            <div class=\"col-md-12 additional\">
                <div class=\"colContent row\">
                    <div class=\"additional zone\">','admin','ZKEASOFT','2020-04-05 10:14:36.380','admin','ZKEASOFT','2020-04-05 10:14:36.380'),
(733,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','<zone>','admin','ZKEASOFT','2020-04-05 10:14:36.383','admin','ZKEASOFT','2020-04-05 10:14:36.383'),
(734,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','ZONE-3','admin','ZKEASOFT','2020-04-05 10:14:36.387','admin','ZKEASOFT','2020-04-05 10:14:36.387'),
(735,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','</zone>','admin','ZKEASOFT','2020-04-05 10:14:36.390','admin','ZKEASOFT','2020-04-05 10:14:36.390'),
(736,'ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2020-04-05 10:14:36.393','admin','ZKEASOFT','2020-04-05 10:14:36.393');
/*!40000 ALTER TABLE `CMS_LayoutHtml` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Media`;
CREATE TABLE `CMS_Media` (
	`ID` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`ParentID` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`MediaType` INT  NULL,
	`Url` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `CMS_Media` DISABLE KEYS */;
INSERT INTO `CMS_Media` VALUES
('6056810a7ede46bb94b55b2756323640','#','图片',1,NULL,NULL,'admin','ZKEASOFT','2016-04-01 21:42:14.960','admin','ZKEASOFT','2016-04-01 21:42:14.960',NULL);
/*!40000 ALTER TABLE `CMS_Media` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Message`;
CREATE TABLE `CMS_Message` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Email` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`PostMessage` LONGTEXT CHARACTER SET utf8mb4  NOT NULL,
	`Reply` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`Description` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `CMS_Message` DISABLE KEYS */;
INSERT INTO `CMS_Message` VALUES
(1,'ZKEASOFT','zkea@zkea.net','ZKEACMS是基于ASP.NET MVC4开发的开源CMS，提供免费下载学习使用。','KEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。',1,'admin','ZKEASOFT','2017-03-19 21:02:34.260','admin','ZKEASOFT','2017-03-19 21:02:34.260',NULL),
(2,'ZKEASOFT','zkea@zkea.net','ZKEACMS使用可视化编辑设计','ZKEACMS是一个内容管理软件（网站），不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。',1,'admin','ZKEASOFT','2017-03-19 21:03:09.967','admin','ZKEASOFT','2017-03-19 21:03:09.967',NULL);
/*!40000 ALTER TABLE `CMS_Message` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Page`;
CREATE TABLE `CMS_Page` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`ReferencePageID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`IsPublishedPage` TINYINT(1)  NULL,
	`ParentId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`PageName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`IsHomePage` TINYINT(1)  NOT NULL,
	`Url` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`LayoutId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Content` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`DisplayOrder` INT  NULL,
	`Description` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`IsPublish` TINYINT(1)  NOT NULL,
	`PublishDate` DATETIME  NULL,
	`MetaKeyWorlds` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`MetaDescription` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Script` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Style` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`BodyStyle` LONGTEXT CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_CMS_Page_CMS_Layout` (`LayoutId`),
	CONSTRAINT `FK_CMS_Page_CMS_Layout` FOREIGN KEY (`LayoutId`) REFERENCES `CMS_Layout` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `CMS_Page` DISABLE KEYS */;
INSERT INTO `CMS_Page` VALUES
('16f350dcf7b240f0871d18b7520cdab1','da663176840c4eac99a807e7880f2e77',1,'#','Linux',0,'~/linux','ca16c7482fc3405ea8cc53f5d4990937','Linux - 博客',NULL,6,NULL,1,1,'2020-04-05 10:14:36.327',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:36.330','admin','ZKEASOFT','2020-04-05 10:14:36.330',NULL),
('1b80523a21f54c6cbc5a681e9834048d',NULL,0,'#','C#',0,'~/csharp','ca16c7482fc3405ea8cc53f5d4990937','C# - 博客',NULL,2,NULL,1,1,'2020-04-05 10:14:25.917',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:23:00.777','admin','ZKEASOFT','2020-04-05 10:14:25.917',NULL),
('207ca2a6d2824accb05f70911ebf8fc6',NULL,0,'#','首页',0,'~/index','ca16c7482fc3405ea8cc53f5d4990937','欢迎使用ZKEACMS进行创作',NULL,1,NULL,1,1,'2020-04-05 10:13:06.430',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-03 09:53:36.797','admin','ZKEASOFT','2020-04-05 10:13:06.430',NULL),
('213bcc0047264fed91a670dd91de319d','207ca2a6d2824accb05f70911ebf8fc6',1,'#','首页',0,'~/index','ca16c7482fc3405ea8cc53f5d4990937','欢迎使用ZKEACMS进行创作',NULL,1,NULL,1,1,'2020-04-05 10:13:06.440',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:13:06.443','admin','ZKEASOFT','2020-04-05 10:13:06.443',NULL),
('38e09dd1eace43908b7e26f2fa5ffbaf','8f52621c5bcf400ca5cacdd5b426942c',1,'#','SQL',0,'~/sql','ca16c7482fc3405ea8cc53f5d4990937','SQL - 博客',NULL,5,NULL,1,1,'2020-04-05 10:14:33.963',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:33.967','admin','ZKEASOFT','2020-04-05 10:14:33.967',NULL),
('456f297493f84c6caf09fd0ceb3680b6','6328cdbf6a7c4dacbfa84688ab0bf47a',1,'#','文章明细',0,'~/posts','ca16c7482fc3405ea8cc53f5d4990937','文章明细',NULL,7,NULL,1,1,'2020-04-05 10:13:43.267',NULL,NULL,'[]','[]','admin','ZKEASOFT','2020-04-05 10:13:43.273','admin','ZKEASOFT','2020-04-05 10:13:43.273',NULL),
('6328cdbf6a7c4dacbfa84688ab0bf47a',NULL,0,'#','文章明细',0,'~/posts','ca16c7482fc3405ea8cc53f5d4990937','文章明细',NULL,7,NULL,1,1,'2020-04-05 10:13:43.257',NULL,NULL,'[]','[]','admin','ZKEASOFT','2018-04-03 10:51:53.000','admin','ZKEASOFT','2020-04-05 10:13:43.257',NULL),
('7d3619f621014ee6b9a9327a60e32221',NULL,0,'#','JavaScript',0,'~/javascript','ca16c7482fc3405ea8cc53f5d4990937','JavaScript - 博客',NULL,3,NULL,1,1,'2020-04-05 10:14:29.277',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:24:47.633','admin','ZKEASOFT','2020-04-05 10:14:29.277',NULL),
('8f52621c5bcf400ca5cacdd5b426942c',NULL,0,'#','SQL',0,'~/sql','ca16c7482fc3405ea8cc53f5d4990937','SQL - 博客',NULL,5,NULL,1,1,'2020-04-05 10:14:33.953',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:25:34.977','admin','ZKEASOFT','2020-04-05 10:14:33.953',NULL),
('91e701d880dd489fb1d43012e4ada2ae','dfc244751ee0488f9269cf7caff7dcb2',1,'#','HTML / CSS',0,'~/html-css','ca16c7482fc3405ea8cc53f5d4990937','HTML / CSS - 博客',NULL,4,NULL,1,1,'2020-04-05 10:14:31.613',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:31.617','admin','ZKEASOFT','2020-04-05 10:14:31.617',NULL),
('bd18017046f54018b5abbdd6db17dfec','7d3619f621014ee6b9a9327a60e32221',1,'#','JavaScript',0,'~/javascript','ca16c7482fc3405ea8cc53f5d4990937','JavaScript - 博客',NULL,3,NULL,1,1,'2020-04-05 10:14:29.287',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:29.293','admin','ZKEASOFT','2020-04-05 10:14:29.293',NULL),
('da663176840c4eac99a807e7880f2e77',NULL,0,'#','Linux',0,'~/linux','ca16c7482fc3405ea8cc53f5d4990937','Linux - 博客',NULL,6,NULL,1,1,'2020-04-05 10:14:36.317',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:25:59.627','admin','ZKEASOFT','2020-04-05 10:14:36.317',NULL),
('dfc244751ee0488f9269cf7caff7dcb2',NULL,0,'#','HTML / CSS',0,'~/html-css','ca16c7482fc3405ea8cc53f5d4990937','HTML / CSS - 博客',NULL,4,NULL,1,1,'2020-04-05 10:14:31.607',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:25:13.573','admin','ZKEASOFT','2020-04-05 10:14:31.607',NULL),
('ed466c962c4b4c98b8f22edfde977ce0','1b80523a21f54c6cbc5a681e9834048d',1,'#','C#',0,'~/csharp','ca16c7482fc3405ea8cc53f5d4990937','C# - 博客',NULL,2,NULL,1,1,'2020-04-05 10:14:25.930',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:25.930','admin','ZKEASOFT','2020-04-05 10:14:25.930',NULL);
/*!40000 ALTER TABLE `CMS_Page` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Redirection`;
CREATE TABLE `CMS_Redirection` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NOT NULL,
	`InComingUrl` VARCHAR(500) CHARACTER SET utf8mb4  NOT NULL,
	`DestinationURL` VARCHAR(500) CHARACTER SET utf8mb4  NOT NULL,
	`IsPermanent` TINYINT(1)  NOT NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`IsPattern` TINYINT(1)  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `CMS_Redirection` DISABLE KEYS */;
INSERT INTO `CMS_Redirection` VALUES
(1,'默认','~/','~/index',0,NULL,1,'admin','ZKEASOFT','2017-08-14 14:58:06.000','admin','ZKEASOFT','2017-08-14 15:53:01.387',NULL);
/*!40000 ALTER TABLE `CMS_Redirection` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Rule`;
CREATE TABLE `CMS_Rule` (
	`RuleID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`ZoneName` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`RuleExpression` VARCHAR(800) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`RuleItems` LONGTEXT CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`RuleID`)
);


DROP TABLE IF EXISTS `CMS_Theme`;
CREATE TABLE `CMS_Theme` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Url` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`UrlDebugger` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Thumbnail` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`IsActived` TINYINT(1)  NULL,
	`Status` INT  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `CMS_Theme` DISABLE KEYS */;
INSERT INTO `CMS_Theme` VALUES
('blog','博客','~/themes/blog/css/Theme.min.css','~/themes/blog/css/Theme.css','~/themes/blog/thumbnail.jpg',1,1,'',NULL,NULL,NULL,NULL,NULL,NULL),
('Default','默认','~/themes/Default/css/Theme.min.css','~/themes/Default/css/Theme.css','~/themes/Default/thumbnail.jpg',0,1,NULL,'admin','ZKEASOFT','2016-04-04 22:17:10.790','admin','ZKEASOFT','2016-04-04 22:21:01.487');
/*!40000 ALTER TABLE `CMS_Theme` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_WidgetBase`;
CREATE TABLE `CMS_WidgetBase` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`WidgetName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Position` INT  NULL,
	`LayoutId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`PageId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`ZoneId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`PartialView` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`AssemblyName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ServiceTypeName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ViewModelTypeName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`FormView` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`StyleClass` VARCHAR(1000) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`Description` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`IsTemplate` TINYINT(1)  NULL,
	`Thumbnail` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`IsSystem` TINYINT(1)  NULL,
	`ExtendData` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`RuleID` INT  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `CMS_WidgetBase` DISABLE KEYS */;
INSERT INTO `CMS_WidgetBase` VALUES
('00f62c5acfe840e0bee3ca2979f0f025','图片右',NULL,9,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:13:55.010','admin','ZKEASOFT','2016-06-29 14:13:22.937',NULL,NULL,1,'~/images/template%20(6).png',1,NULL,NULL),
('03c0002864334a168ea2ea3c1d96c829','文章列表',NULL,1,NULL,'207ca2a6d2824accb05f70911ebf8fc6','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2018-04-03 10:02:47.000','admin','ZKEASOFT','2020-04-05 10:13:02.523',NULL,NULL,0,NULL,0,NULL,NULL),
('0706d53d78d641139316c70a33dc5aad','文章列表',NULL,1,NULL,'ed466c962c4b4c98b8f22edfde977ce0','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:26.010','admin','ZKEASOFT','2020-04-05 10:14:26.010',NULL,NULL,0,NULL,0,NULL,NULL),
('0796c731dd5e45579e8855fd474b390f','文章列表',NULL,1,NULL,'dfc244751ee0488f9269cf7caff7dcb2','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:25:16.000','admin','ZKEASOFT','2020-04-05 10:14:09.340',NULL,NULL,0,NULL,0,NULL,NULL),
('09617f6142934daaadee6cfb9df6d66f','段落',NULL,4,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:53:07.263','admin','ZKEASOFT','2016-03-24 10:49:44.100',NULL,NULL,1,'~/images/template%20(2).png',1,NULL,NULL),
('0c7f5ce6231b407f8f3156b3b2c07835','文章列表',NULL,1,NULL,'16f350dcf7b240f0871d18b7520cdab1','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:36.400','admin','ZKEASOFT','2020-04-05 10:14:36.400',NULL,NULL,0,NULL,0,NULL,NULL),
('0cbd1f8be3b44fd0a2729fe941b9dfdd','段落',NULL,4,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-2','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:21:34.880','admin','ZKEASOFT','2019-05-07 21:21:53.550',NULL,NULL,0,NULL,0,NULL,NULL),
('0f66ab8ff0df44e2b5e57fd8d8c5d8ff','文字三列',NULL,8,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:23:51.277','admin','ZKEASOFT','2016-06-29 14:12:54.387',NULL,NULL,1,'~/images/template (15).png',1,NULL,NULL),
('14d6de860ba34a66b07ffb103fcb4a8d','文章列表',NULL,1,NULL,'bd18017046f54018b5abbdd6db17dfec','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:29.380','admin','ZKEASOFT','2020-04-05 10:14:29.380',NULL,NULL,0,NULL,0,NULL,NULL),
('16a0f1e9a8294a05a7b988fb54e03f1d','个人信息',NULL,1,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2019-05-07 21:20:59.997','admin','ZKEASOFT','2019-05-07 21:21:53.523',NULL,NULL,0,NULL,0,NULL,NULL),
('1fb967867e3b440e86336bc5a51e8719','图例三（圆）',NULL,17,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:40:26.767','admin','ZKEASOFT','2016-06-29 14:19:30.777',NULL,NULL,1,'~/images/template%20(12).png',1,NULL,NULL),
('2b3eb61307d24c50a6b3aaa75db3810e','图片左',NULL,11,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:06:17.637','admin','ZKEASOFT','2016-06-29 14:14:54.330',NULL,NULL,1,'~/images/template%20(5).png',1,NULL,NULL),
('2d71120b7f464f46ba26beb19d3120ea','分隔符',NULL,2,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-2','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:21:20.603','admin','ZKEASOFT','2019-05-07 21:21:53.530',NULL,NULL,0,NULL,0,NULL,NULL),
('35b49b8cb3cd4cd39b1c53410e076347','评论箱',NULL,1,NULL,'456f297493f84c6caf09fd0ceb3680b6','ZONE-3','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,'container','admin','ZKEASOFT','2020-04-05 10:13:43.360','admin','ZKEASOFT','2020-04-05 10:13:43.360',NULL,NULL,0,NULL,0,'{\"RuleID\":null,\"CustomClass\":\"container\",\"CustomStyle\":null,\"DataSourceLink\":null,\"DataSourceLinkTitle\":null,\"ActionType\":1}',NULL),
('3d8b565424ef44b99ceb6d95c3ac9f9a','版权申明',NULL,2,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-3','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,'footer','admin','ZKEASOFT','2018-04-03 09:53:08.583','admin','ZKEASOFT','2019-05-07 21:28:34.700',NULL,NULL,0,NULL,0,NULL,NULL),
('481574ebc98b4cdf9a07e3f20c1ab78d','图片左（圆）',NULL,12,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:48.870','admin','ZKEASOFT','2016-06-29 14:15:23.317',NULL,NULL,1,'~/images/template%20(7).png',1,NULL,NULL),
('50f810582d28440eb3bdff9ee5b1ef24','图片左（平分）',NULL,13,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:36:23.247','admin','ZKEASOFT','2016-06-29 14:16:05.733',NULL,NULL,1,'~/images/template (17).png',1,NULL,NULL),
('55b73e54fd054de4847960bdac350c6d','图例二（圆）',NULL,15,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:33:40.533','admin','ZKEASOFT','2016-06-29 14:17:49.737',NULL,NULL,1,'~/images/template%20(10).png',1,NULL,NULL),
('56991d0ff59d4c1db27aff3a50fcb382','页头',NULL,2,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:51:35.577','admin','ZKEASOFT','2016-06-29 14:10:19.703',NULL,NULL,1,'~/images/template%20(1).png',1,NULL,NULL),
('6f0d49adcf324b7c92fd8b38462f388c','文章列表',NULL,1,NULL,'213bcc0047264fed91a670dd91de319d','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:13:06.547','admin','ZKEASOFT','2020-04-05 10:13:06.547',NULL,NULL,0,NULL,0,NULL,NULL),
('712173677e3c467f884340375778ec7f','文章列表',NULL,1,NULL,'1b80523a21f54c6cbc5a681e9834048d','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:23:03.000','admin','ZKEASOFT','2020-04-05 10:13:19.697',NULL,NULL,0,NULL,0,NULL,NULL),
('7e6ffef4f66c488c8c36c9012a6df10c','评论箱',NULL,1,NULL,'6328cdbf6a7c4dacbfa84688ab0bf47a','ZONE-3','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,'container','admin','ZKEASOFT','2018-04-03 10:56:56.617','admin','ZKEASOFT','2019-05-07 21:28:34.680',NULL,NULL,0,NULL,0,'{\"CustomClass\":\"\",\"CustomStyle\":\"\",\"DataSourceLink\":null,\"DataSourceLinkTitle\":null,\"ActionType\":1}',NULL),
('8c7a3d38aad446698e151f6a7c45d040','文章列表',NULL,1,NULL,'38e09dd1eace43908b7e26f2fa5ffbaf','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:34.043','admin','ZKEASOFT','2020-04-05 10:14:34.043',NULL,NULL,0,NULL,0,NULL,NULL),
('8cc061c2e2514ef9b85bbecdec3f84ab','分隔符',NULL,5,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:55:12.377','admin','ZKEASOFT','2016-03-09 13:55:12.377',NULL,NULL,1,'~/images/template%20(3).png',1,NULL,NULL),
('8f6a4eed88e5415e97d28bfd221e1c6e','文章列表',NULL,1,NULL,'7d3619f621014ee6b9a9327a60e32221','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:24:49.000','admin','ZKEASOFT','2020-04-05 10:14:03.013',NULL,NULL,0,NULL,0,NULL,NULL),
('93b43552bcfd45bc8067818e4ce2c412','文章内容',NULL,1,NULL,'456f297493f84c6caf09fd0ceb3680b6','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:13:43.370','admin','ZKEASOFT','2020-04-05 10:13:43.370',NULL,NULL,0,NULL,0,NULL,NULL),
('a8259ee60a274b61834ff820f2299843','导航',NULL,2,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-0','Widget.Navigation','ZKEACMS','ZKEACMS.Common.Service.NavigationWidgetService','ZKEACMS.Common.Models.NavigationWidget',NULL,'full','admin','ZKEASOFT','2018-04-03 09:52:11.173','admin','ZKEASOFT','2018-04-03 09:59:03.893',NULL,NULL,0,NULL,0,NULL,NULL),
('ad2e89beefd542709124bd4e81eedf58','文章内容',NULL,1,NULL,'6328cdbf6a7c4dacbfa84688ab0bf47a','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2018-04-03 10:52:08.000','admin','ZKEASOFT','2019-05-07 21:27:39.403',NULL,NULL,0,NULL,0,NULL,NULL),
('b1661efc756d4ab7ac4931b0539ac82d','文章列表',NULL,1,NULL,'8f52621c5bcf400ca5cacdd5b426942c','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:25:36.000','admin','ZKEASOFT','2020-04-05 10:14:15.093',NULL,NULL,0,NULL,0,NULL,NULL),
('b568ff7f4a894870adaf9afadf787bf9','图例二',NULL,14,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:20:29.887','admin','ZKEASOFT','2016-06-29 14:16:58.140',NULL,NULL,1,'~/images/template%20(9).png',1,NULL,NULL),
('bb7dab4f077745ef8b5b425eaabb423c','巨幕',NULL,1,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:28:47.827','admin','ZKEASOFT','2016-06-29 14:09:41.597',NULL,NULL,1,'~/images/template (16).png',1,NULL,NULL),
('d3b03ba290b74a408670042549d532ba','文章列表',NULL,1,NULL,'91e701d880dd489fb1d43012e4ada2ae','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2020-04-05 10:14:31.693','admin','ZKEASOFT','2020-04-05 10:14:31.693',NULL,NULL,0,NULL,0,NULL,NULL),
('defdfcdef32c4080bde0ecad73ca2e1d','文章列表',NULL,1,NULL,'da663176840c4eac99a807e7880f2e77','ZONE-1','Widget.ArticleList-Snippet','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-07 21:26:01.000','admin','ZKEASOFT','2020-04-05 10:14:20.107',NULL,NULL,0,NULL,0,NULL,NULL),
('e3eb5dd919c4477a857a478764daaa78','巨幕',NULL,1,'ca16c7482fc3405ea8cc53f5d4990937',NULL,'ZONE-0','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,'full style=\"color:#fff;height:500px;background-image:url(/themes/blog/images/top-background.jpg);background-position:50% 50%;background-size:cover;\"','admin','ZKEASOFT','2018-04-03 09:56:37.000','admin','ZKEASOFT','2018-04-03 10:37:16.157',NULL,NULL,0,NULL,0,NULL,NULL),
('ed837392097f4e60b812bc57111dd762','图例三',NULL,16,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:36:24.463','admin','ZKEASOFT','2016-06-29 14:18:22.983',NULL,NULL,1,'~/images/template%20(11).png',1,NULL,NULL),
('f41174cfa4d247f4974c47f4d2b000fd','文字二列',NULL,7,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:21:37.693','admin','ZKEASOFT','2016-06-29 14:11:06.067',NULL,NULL,1,'~/images/template (14).png',1,NULL,NULL),
('f6de0d62d3974ee2bf2ded3fbbc82c2b','间距',NULL,6,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 14:00:46.400','admin','ZKEASOFT','2016-03-09 14:08:21.673',NULL,NULL,1,'~/images/template%20(4).png',1,NULL,NULL),
('f6f11ba2fec844de883acf0a1fe3eb89','图片右（圆）',NULL,10,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:44.227','admin','ZKEASOFT','2016-06-29 14:13:44.223',NULL,NULL,1,'~/images/template%20(8).png',1,NULL,NULL),
('fee7f4d7d7e641b0bfa74491a543d245','图片',NULL,3,NULL,NULL,NULL,'Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:14:46.133','admin','ZKEASOFT','2016-03-09 21:14:46.133',NULL,NULL,1,'~/images/template (13).png',1,NULL,NULL);
/*!40000 ALTER TABLE `CMS_WidgetBase` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Zone`;
CREATE TABLE `CMS_Zone` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`LayoutId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`PageId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`ZoneName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`Description` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`HeadingCode` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_CMS_Zone_CMS_Layout` (`LayoutId`),
	CONSTRAINT `FK_CMS_Zone_CMS_Layout` FOREIGN KEY (`LayoutId`) REFERENCES `CMS_Layout` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `CMS_Zone` DISABLE KEYS */;
INSERT INTO `CMS_Zone` VALUES
('01de893a6dc343d99000d67c29f97c90','ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:27:42.257','admin','ZKEASOFT','2019-05-07 21:27:42.257',NULL,NULL,'ZONE-0'),
('023fe37d855d40468c7272b286be7375','ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','边栏',NULL,'admin','ZKEASOFT','2020-04-05 10:14:29.307','admin','ZKEASOFT','2020-04-05 10:14:29.307',NULL,NULL,'ZONE-2'),
('024daf79b620428d83508979f5859735','ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','主内容',NULL,'admin','ZKEASOFT','2020-04-05 10:14:25.937','admin','ZKEASOFT','2020-04-05 10:14:25.937',NULL,NULL,'ZONE-1'),
('0671aa8ddf5448b8bb17573447b22b7f','ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','底部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:29.297','admin','ZKEASOFT','2020-04-05 10:14:29.297',NULL,NULL,'ZONE-3'),
('08c2e54c2e14459c8aa0b3e55513a114','ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:20:04.470','admin','ZKEASOFT','2019-05-07 21:20:04.470',NULL,NULL,'ZONE-0'),
('0a3dc97cbbbc4ecbab78f6aa3d9c9498','ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:22:36.707','admin','ZKEASOFT','2019-05-07 21:22:36.707',NULL,NULL,'ZONE-2'),
('111e6863e7814d7b98e0e318ff3db484','ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:27:42.257','admin','ZKEASOFT','2019-05-07 21:27:42.257',NULL,NULL,'ZONE-3'),
('132cc12aefa5422e99fe401837557ba4','ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:22:36.703','admin','ZKEASOFT','2019-05-07 21:22:36.703',NULL,NULL,'ZONE-1'),
('13b2f0ef613d4bffb51c5fbf023107a1','ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:23.197','admin','ZKEASOFT','2019-05-07 21:25:23.197',NULL,NULL,'ZONE-0'),
('150cae67403b4b0e8ce922fc0f25874a','ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','底部',NULL,'admin','ZKEASOFT','2020-04-05 10:12:34.617','admin','ZKEASOFT','2020-04-05 10:12:34.617',NULL,NULL,'ZONE-3'),
('17c51c47b4294102a886cd8c025aeeb5','ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:27:00.937','admin','ZKEASOFT','2019-05-07 21:27:00.937',NULL,NULL,'ZONE-0'),
('1bdc7bccc7424cb7b8a73e8a630879ca','ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:25:48.763','admin','ZKEASOFT','2019-05-07 21:25:48.763',NULL,NULL,'ZONE-2'),
('1dd65140490b4ae68d2d781ed03b794c','ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:20:04.477','admin','ZKEASOFT','2019-05-07 21:20:04.477',NULL,NULL,'ZONE-3'),
('1df8af81a05b4aaebde5d88310480d1a','ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','底部',NULL,'admin','ZKEASOFT','2020-04-05 10:13:06.453','admin','ZKEASOFT','2020-04-05 10:13:06.453',NULL,NULL,'ZONE-3'),
('1f0b1eb10b7b4f7294f360aeb94f2d2e','ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:27:00.930','admin','ZKEASOFT','2019-05-07 21:27:00.930',NULL,NULL,'ZONE-1'),
('248a10dbde714d579d6179cd24e52d6f','ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','主内容',NULL,'admin','ZKEASOFT','2020-04-05 10:14:29.310','admin','ZKEASOFT','2020-04-05 10:14:29.310',NULL,NULL,'ZONE-1'),
('256b226d34734e41b132b0cac2a49389','ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:26:23.233','admin','ZKEASOFT','2019-05-07 21:26:23.233',NULL,NULL,'ZONE-1'),
('2572463b5411404a8d69214640f8c304','ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','边栏',NULL,'admin','ZKEASOFT','2020-04-05 10:14:33.980','admin','ZKEASOFT','2020-04-05 10:14:33.980',NULL,NULL,'ZONE-2'),
('25c0367de7754fb99f7285585ea20ed0','ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:22:36.693','admin','ZKEASOFT','2019-05-07 21:22:36.693',NULL,NULL,'ZONE-0'),
('2807ca0ad6d143bca06591ac4856705d','ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:20:04.480','admin','ZKEASOFT','2019-05-07 21:20:04.480',NULL,NULL,'ZONE-1'),
('2b4527683b5640a4bd655f7a9d77200c','ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','主内容',NULL,'admin','ZKEASOFT','2020-04-05 10:12:34.613','admin','ZKEASOFT','2020-04-05 10:12:34.613',NULL,NULL,'ZONE-1'),
('2d058a3f0cda4581ab9369a34b3b236d','ca16c7482fc3405ea8cc53f5d4990937',NULL,'边栏',NULL,'admin','ZKEASOFT','2018-04-03 09:51:47.877','admin','ZKEASOFT','2018-04-03 10:46:28.040',NULL,NULL,'ZONE-2'),
('2f6608b15dff41348b30f26dd1b5547d','ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:28:46.590','admin','ZKEASOFT','2019-05-07 21:28:46.590',NULL,NULL,'ZONE-3'),
('32b93f9b4b1943e1abcff9346d535655','ca16c7482fc3405ea8cc53f5d4990937',NULL,'顶部',NULL,'admin','ZKEASOFT','2018-04-03 09:51:47.867','admin','ZKEASOFT','2018-04-03 10:46:28.053',NULL,NULL,'ZONE-0'),
('3c7a831e2981412fa515d723c2eac6b1','ca16c7482fc3405ea8cc53f5d4990937','bd18017046f54018b5abbdd6db17dfec','顶部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:29.300','admin','ZKEASOFT','2020-04-05 10:14:29.300',NULL,NULL,'ZONE-0'),
('3d57ade9ee534e63942b7d3359b9f0f7','ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:23.193','admin','ZKEASOFT','2019-05-07 21:25:23.193',NULL,NULL,'ZONE-3'),
('3e90a10a209d47aa9c4d59c8a05baa47','ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:26:23.227','admin','ZKEASOFT','2019-05-07 21:26:23.227',NULL,NULL,'ZONE-3'),
('3f28c7e1d08046ae92193c539844c888','ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:28:46.587','admin','ZKEASOFT','2019-05-07 21:28:46.587',NULL,NULL,'ZONE-1'),
('4014655e4e1c469487ee6f9ef70db7b8','ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','主内容',NULL,'admin','ZKEASOFT','2020-04-05 10:13:06.463','admin','ZKEASOFT','2020-04-05 10:13:06.463',NULL,NULL,'ZONE-1'),
('4136d0f9a9e04958b9390f1544d220ba','ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','底部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:36.343','admin','ZKEASOFT','2020-04-05 10:14:36.343',NULL,NULL,'ZONE-3'),
('46f2aaf3ecc943bda7ce8ccfeae549d9','ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','顶部',NULL,'admin','ZKEASOFT','2020-04-05 10:12:34.623','admin','ZKEASOFT','2020-04-05 10:12:34.623',NULL,NULL,'ZONE-0'),
('4724e32dce064e8c96fe7496d5f5151a','ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','顶部',NULL,'admin','ZKEASOFT','2020-04-05 10:13:43.287','admin','ZKEASOFT','2020-04-05 10:13:43.287',NULL,NULL,'ZONE-0'),
('47618a6ca9214d4abcafbd70cd23d254','ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:26:21.570','admin','ZKEASOFT','2019-05-07 21:26:21.570',NULL,NULL,'ZONE-2'),
('48fdbafb54624a7e8e8c9fe465dd22da','ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:26:46.800','admin','ZKEASOFT','2019-05-07 21:26:46.800',NULL,NULL,'ZONE-2'),
('4d33a568f9a44fca8c88649654144217','ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:24:56.407','admin','ZKEASOFT','2019-05-07 21:24:56.407',NULL,NULL,'ZONE-1'),
('4e0debb4f68a456e9e1bd19d24ee202d','ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:48.767','admin','ZKEASOFT','2019-05-07 21:25:48.767',NULL,NULL,'ZONE-3'),
('4ffef0c89f02452e852202314a5737c5','ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:59.647','admin','ZKEASOFT','2019-05-07 21:25:59.647',NULL,NULL,'ZONE-0'),
('5376d1b4577c4949a4e370f6fa8156b8','ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:23:15.827','admin','ZKEASOFT','2019-05-07 21:23:15.827',NULL,NULL,'ZONE-1'),
('56aca6bd93fd4879b98e17c8f35d4cfa','ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:26:21.573','admin','ZKEASOFT','2019-05-07 21:26:21.573',NULL,NULL,'ZONE-1'),
('5980ed8c0bfa4cd48db31225ef24bf4d','ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:25:59.643','admin','ZKEASOFT','2019-05-07 21:25:59.643',NULL,NULL,'ZONE-2'),
('5b78733063734ee4b10037267f72bc35','ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','主内容',NULL,'admin','ZKEASOFT','2020-04-05 10:14:33.973','admin','ZKEASOFT','2020-04-05 10:14:33.973',NULL,NULL,'ZONE-1'),
('5f1168c2d2b64986811a900468272425','ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:26:46.813','admin','ZKEASOFT','2019-05-07 21:26:46.813',NULL,NULL,'ZONE-1'),
('60dd46a58c4446b89147f3a2128a47f8','ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:26:46.807','admin','ZKEASOFT','2019-05-07 21:26:46.807',NULL,NULL,'ZONE-3'),
('631bb06c18bd4f1a9588c9c2c09733a1','ca16c7482fc3405ea8cc53f5d4990937',NULL,'底部',NULL,'admin','ZKEASOFT','2018-04-03 09:51:47.880','admin','ZKEASOFT','2018-04-03 10:46:28.053',NULL,NULL,'ZONE-3'),
('6a22e6256ddc488993af7605821e78f6','ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:24:56.400','admin','ZKEASOFT','2019-05-07 21:24:56.400',NULL,NULL,'ZONE-2'),
('6ab2cd66838845079ee37e8a536f9459','ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','顶部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:33.977','admin','ZKEASOFT','2020-04-05 10:14:33.977',NULL,NULL,'ZONE-0'),
('7370a4990c8143939d9bd8332a25c59b','ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:24:47.663','admin','ZKEASOFT','2019-05-07 21:24:47.663',NULL,NULL,'ZONE-3'),
('7443adbc43b44c958d5ef80511049e80','ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:25:23.203','admin','ZKEASOFT','2019-05-07 21:25:23.203',NULL,NULL,'ZONE-2'),
('74b7eb2b96ae4173a0920239ef5d9459','ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:23:15.830','admin','ZKEASOFT','2019-05-07 21:23:15.830',NULL,NULL,'ZONE-0'),
('79e74602a80942ebb4d68edc5d1214e1','ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:48.760','admin','ZKEASOFT','2019-05-07 21:25:48.760',NULL,NULL,'ZONE-0'),
('7bc7b870cead4655b5c0704d8f4629e0','ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','顶部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:36.333','admin','ZKEASOFT','2020-04-05 10:14:36.333',NULL,NULL,'ZONE-0'),
('7d63305b941b4f879d3d8490137a7667','ca16c7482fc3405ea8cc53f5d4990937','3c7307f174074203a108f3f6253b3aba','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:25:23.197','admin','ZKEASOFT','2019-05-07 21:25:23.197',NULL,NULL,'ZONE-1'),
('86b5c95864234ef89c8f51ef8ac86919','ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','边栏',NULL,'admin','ZKEASOFT','2020-04-05 10:14:36.337','admin','ZKEASOFT','2020-04-05 10:14:36.337',NULL,NULL,'ZONE-2'),
('881b4c18a6584af395b89120f3a7b020','ca16c7482fc3405ea8cc53f5d4990937','6328cdbf6a7c4dacbfa84688ab0bf47a','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:26:46.803','admin','ZKEASOFT','2019-05-07 21:26:46.803',NULL,NULL,'ZONE-0'),
('88362e55328b438b87afe1ddf0b24005','ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:25:35.010','admin','ZKEASOFT','2019-05-07 21:25:35.010',NULL,NULL,'ZONE-1'),
('8abfbe9a2c97473182871991190e63e2','ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','主内容',NULL,'admin','ZKEASOFT','2020-04-05 10:13:43.277','admin','ZKEASOFT','2020-04-05 10:13:43.277',NULL,NULL,'ZONE-1'),
('9488b105174343f2a51894d55bcc5d7d','ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:24:56.390','admin','ZKEASOFT','2019-05-07 21:24:56.390',NULL,NULL,'ZONE-3'),
('9a96e35ad3b745b6a1338068960049dc','ca16c7482fc3405ea8cc53f5d4990937','207ca2a6d2824accb05f70911ebf8fc6','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:20:04.443','admin','ZKEASOFT','2019-05-07 21:20:04.443',NULL,NULL,'ZONE-2'),
('9aba4237cf514abba78697f7ab1013ec','ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','底部',NULL,'admin','ZKEASOFT','2020-04-05 10:13:43.280','admin','ZKEASOFT','2020-04-05 10:13:43.280',NULL,NULL,'ZONE-3'),
('9bcf490e2a3f4c8485bff004741e6adb','ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:35.003','admin','ZKEASOFT','2019-05-07 21:25:35.003',NULL,NULL,'ZONE-0'),
('9be158c04ac5476f948e51ef0e4ce46d','ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:23:00.807','admin','ZKEASOFT','2019-05-07 21:23:00.807',NULL,NULL,'ZONE-3'),
('9e802557ad4246979d618319f2c6301a','ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:23:15.830','admin','ZKEASOFT','2019-05-07 21:23:15.830',NULL,NULL,'ZONE-2'),
('a3282e8ac8534b9faf2b0f3e3a661fee','ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:27:08.587','admin','ZKEASOFT','2019-05-07 21:27:08.587',NULL,NULL,'ZONE-2'),
('a6e467a0530b402ca7d08969e0fe554b','ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:13.600','admin','ZKEASOFT','2019-05-07 21:25:13.600',NULL,NULL,'ZONE-3'),
('a7ff57858b7f41c980f9f50a7ba0f1ce','ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:24:47.660','admin','ZKEASOFT','2019-05-07 21:24:47.660',NULL,NULL,'ZONE-0'),
('a83c8b94a5f04258822d521bdb9be7ba','ca16c7482fc3405ea8cc53f5d4990937','35f86f8ae0e24ee7a9a82ff447931ca9','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:24:56.397','admin','ZKEASOFT','2019-05-07 21:24:56.397',NULL,NULL,'ZONE-0'),
('afa6b2f43cc2492eaedbded6550d5706','ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:26:21.577','admin','ZKEASOFT','2019-05-07 21:26:21.577',NULL,NULL,'ZONE-3'),
('b0a1cc72416345faa3afffe688d2458a','ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:13.597','admin','ZKEASOFT','2019-05-07 21:25:13.597',NULL,NULL,'ZONE-0'),
('b263b6461a884fa2a060edb508f3ff52','ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:27:08.587','admin','ZKEASOFT','2019-05-07 21:27:08.587',NULL,NULL,'ZONE-1'),
('b4d20794f99c4a70912db458c527c21c','ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:27:08.590','admin','ZKEASOFT','2019-05-07 21:27:08.590',NULL,NULL,'ZONE-3'),
('b5be26a6f4914a379b4a7bb99b12eb66','ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','底部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:31.623','admin','ZKEASOFT','2020-04-05 10:14:31.623',NULL,NULL,'ZONE-3'),
('bab53c95960646518a4839aca62451da','ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:25:35.000','admin','ZKEASOFT','2019-05-07 21:25:35.000',NULL,NULL,'ZONE-2'),
('bbd2e73066624483af7c85faee89f2aa','ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','底部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:25.933','admin','ZKEASOFT','2020-04-05 10:14:25.933',NULL,NULL,'ZONE-3'),
('bbd899e660aa4a17b3f25bcd9ba6842c','ca16c7482fc3405ea8cc53f5d4990937','8f52621c5bcf400ca5cacdd5b426942c','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:35.007','admin','ZKEASOFT','2019-05-07 21:25:35.007',NULL,NULL,'ZONE-3'),
('beaf39cfb3d340fe9f3f5d52da706792','ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','边栏',NULL,'admin','ZKEASOFT','2020-04-05 10:13:06.467','admin','ZKEASOFT','2020-04-05 10:13:06.467',NULL,NULL,'ZONE-2'),
('c8b78f8381764c399ec4833c328861f3','ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:24:47.657','admin','ZKEASOFT','2019-05-07 21:24:47.657',NULL,NULL,'ZONE-2'),
('c96d3f87d9ed49a6b3d42e3db1449e06','ca16c7482fc3405ea8cc53f5d4990937','ea91caaa7263400ea516fabcc9cc8d53','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:25:48.757','admin','ZKEASOFT','2019-05-07 21:25:48.757',NULL,NULL,'ZONE-1'),
('ca889f367a914a038fe6104bbd293223','ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','顶部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:31.623','admin','ZKEASOFT','2020-04-05 10:14:31.623',NULL,NULL,'ZONE-0'),
('cb6626d06c37496ba8179fbf6ed0a785','ca16c7482fc3405ea8cc53f5d4990937','213bcc0047264fed91a670dd91de319d','顶部',NULL,'admin','ZKEASOFT','2020-04-05 10:13:06.447','admin','ZKEASOFT','2020-04-05 10:13:06.447',NULL,NULL,'ZONE-0'),
('cc0bac9b5102480e83d1a356ce458ce8','ca16c7482fc3405ea8cc53f5d4990937','c75a37485af6483290a5c681729be6a0','边栏',NULL,'admin','ZKEASOFT','2020-04-05 10:12:34.593','admin','ZKEASOFT','2020-04-05 10:12:34.593',NULL,NULL,'ZONE-2'),
('cce78ce8accd4587900c04bc57a8b89c','ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:25:13.607','admin','ZKEASOFT','2019-05-07 21:25:13.607',NULL,NULL,'ZONE-1'),
('cfb25494c8a24f6691ff574ae322ffed','ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','边栏',NULL,'admin','ZKEASOFT','2020-04-05 10:14:31.630','admin','ZKEASOFT','2020-04-05 10:14:31.630',NULL,NULL,'ZONE-2'),
('d03aac9afa22476e801a0114bd6eca2b','ca16c7482fc3405ea8cc53f5d4990937','38e09dd1eace43908b7e26f2fa5ffbaf','底部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:33.983','admin','ZKEASOFT','2020-04-05 10:14:33.983',NULL,NULL,'ZONE-3'),
('d5838d6adba54d40bef7488e31553724','ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:23:00.810','admin','ZKEASOFT','2019-05-07 21:23:00.810',NULL,NULL,'ZONE-1'),
('d585c17a90e9449b96680f25ca025af8','ca16c7482fc3405ea8cc53f5d4990937','30f2d6fc620d4cd28cefcdf06c4016fa','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:22:36.700','admin','ZKEASOFT','2019-05-07 21:22:36.700',NULL,NULL,'ZONE-3'),
('d68338ca27f4403bbc2e85381a90f40d','ca16c7482fc3405ea8cc53f5d4990937','5f6ee2692eea45fe925ff8cfec298620','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:23:15.820','admin','ZKEASOFT','2019-05-07 21:23:15.820',NULL,NULL,'ZONE-3'),
('d844457af35744ffa3e653e5de6b3b20','ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:25:59.650','admin','ZKEASOFT','2019-05-07 21:25:59.650',NULL,NULL,'ZONE-1'),
('d8564eb6dbf847a5b3c434c3a5cbdf62','ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:28:46.580','admin','ZKEASOFT','2019-05-07 21:28:46.580',NULL,NULL,'ZONE-2'),
('dbf120ac1d4944878e4160167c073edf','ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:23:00.800','admin','ZKEASOFT','2019-05-07 21:23:00.800',NULL,NULL,'ZONE-2'),
('dc4088fce2234e32a330642caa06f5f7','ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:27:42.253','admin','ZKEASOFT','2019-05-07 21:27:42.253',NULL,NULL,'ZONE-1'),
('dc9d023147294165866e98954c64a854','ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:27:00.927','admin','ZKEASOFT','2019-05-07 21:27:00.927',NULL,NULL,'ZONE-2'),
('dcaf2ec6a8224cea95a94bc4045e857b','ca16c7482fc3405ea8cc53f5d4990937','da663176840c4eac99a807e7880f2e77','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:25:59.650','admin','ZKEASOFT','2019-05-07 21:25:59.650',NULL,NULL,'ZONE-3'),
('dd6cba951d7047fdbcd3caf7bfd4b27a','ca16c7482fc3405ea8cc53f5d4990937',NULL,'主内容',NULL,'admin','ZKEASOFT','2018-04-03 09:51:47.877','admin','ZKEASOFT','2018-04-03 10:46:28.057',NULL,NULL,'ZONE-1'),
('de3a6f64c64046cdbf83b08024f86516','ca16c7482fc3405ea8cc53f5d4990937','7d3619f621014ee6b9a9327a60e32221','主内容',NULL,'admin','ZKEASOFT','2019-05-07 21:24:47.667','admin','ZKEASOFT','2019-05-07 21:24:47.667',NULL,NULL,'ZONE-1'),
('de783c948cc443fabea06da42a415806','ca16c7482fc3405ea8cc53f5d4990937','16f350dcf7b240f0871d18b7520cdab1','主内容',NULL,'admin','ZKEASOFT','2020-04-05 10:14:36.340','admin','ZKEASOFT','2020-04-05 10:14:36.340',NULL,NULL,'ZONE-1'),
('dfc1935e30d843d68df94ec151e8f624','ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','顶部',NULL,'admin','ZKEASOFT','2020-04-05 10:14:25.943','admin','ZKEASOFT','2020-04-05 10:14:25.943',NULL,NULL,'ZONE-0'),
('e01b2e33d6a14084ad93d5caf9d219da','ca16c7482fc3405ea8cc53f5d4990937','91e701d880dd489fb1d43012e4ada2ae','主内容',NULL,'admin','ZKEASOFT','2020-04-05 10:14:31.627','admin','ZKEASOFT','2020-04-05 10:14:31.627',NULL,NULL,'ZONE-1'),
('e6bf874e0fe24080b7c7a7ec6cb1713d','ca16c7482fc3405ea8cc53f5d4990937','b8b17e2ea98345d1a13fb0370639ad27','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:26:21.567','admin','ZKEASOFT','2019-05-07 21:26:21.567',NULL,NULL,'ZONE-0'),
('e72da0e984b44c42ae4a8982459b7f9c','ca16c7482fc3405ea8cc53f5d4990937','5fb68bdbbf9341eba937580f2a6e18e2','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:27:08.593','admin','ZKEASOFT','2019-05-07 21:27:08.593',NULL,NULL,'ZONE-0'),
('ea4fe2373d4f4b418750ace7d881dae7','ca16c7482fc3405ea8cc53f5d4990937','456f297493f84c6caf09fd0ceb3680b6','边栏',NULL,'admin','ZKEASOFT','2020-04-05 10:13:43.273','admin','ZKEASOFT','2020-04-05 10:13:43.273',NULL,NULL,'ZONE-2'),
('ea716e272d004755b276d258157d1312','ca16c7482fc3405ea8cc53f5d4990937','c569d6abb1e749b7b339ce1ae9e3e19c','底部',NULL,'admin','ZKEASOFT','2019-05-07 21:27:00.930','admin','ZKEASOFT','2019-05-07 21:27:00.930',NULL,NULL,'ZONE-3'),
('ec57dda133344d2783ecaac79530b575','ca16c7482fc3405ea8cc53f5d4990937','0b799e73255b44b3994befc95ba243a2','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:27:42.250','admin','ZKEASOFT','2019-05-07 21:27:42.250',NULL,NULL,'ZONE-2'),
('ec60823b3b7942648faf7c270c04fc95','ca16c7482fc3405ea8cc53f5d4990937','ed466c962c4b4c98b8f22edfde977ce0','边栏',NULL,'admin','ZKEASOFT','2020-04-05 10:14:25.943','admin','ZKEASOFT','2020-04-05 10:14:25.943',NULL,NULL,'ZONE-2'),
('efd60787bece495d9b48b21acd225b75','ca16c7482fc3405ea8cc53f5d4990937','711bbff5416942dbbb23f996081fb961','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:28:46.593','admin','ZKEASOFT','2019-05-07 21:28:46.593',NULL,NULL,'ZONE-0'),
('f10dd16ebde1421d9054c7756dcf3f14','ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:26:23.227','admin','ZKEASOFT','2019-05-07 21:26:23.227',NULL,NULL,'ZONE-0'),
('f5f510746cf6425892211775937c906c','ca16c7482fc3405ea8cc53f5d4990937','77d542abda5f4ad49565187d3416e765','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:26:23.220','admin','ZKEASOFT','2019-05-07 21:26:23.220',NULL,NULL,'ZONE-2'),
('f62da2ed53da431f9ab6c9a945e122c8','ca16c7482fc3405ea8cc53f5d4990937','dfc244751ee0488f9269cf7caff7dcb2','边栏',NULL,'admin','ZKEASOFT','2019-05-07 21:25:13.593','admin','ZKEASOFT','2019-05-07 21:25:13.593',NULL,NULL,'ZONE-2'),
('f85d597070564d2094aec5211f345966','ca16c7482fc3405ea8cc53f5d4990937','1b80523a21f54c6cbc5a681e9834048d','顶部',NULL,'admin','ZKEASOFT','2019-05-07 21:23:00.803','admin','ZKEASOFT','2019-05-07 21:23:00.803',NULL,NULL,'ZONE-0');
/*!40000 ALTER TABLE `CMS_Zone` ENABLE KEYS */;

DROP TABLE IF EXISTS `Comments`;
CREATE TABLE `Comments` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`PagePath` VARCHAR(300) CHARACTER SET utf8mb4  NULL,
	`UserId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Picture` VARCHAR(300) CHARACTER SET utf8mb4  NULL,
	`UserName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CommentContent` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Agrees` INT  NULL,
	`Disagrees` INT  NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `DataArchived`;
CREATE TABLE `DataArchived` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Data` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `DataArchived` DISABLE KEYS */;
INSERT INTO `DataArchived` VALUES
('ZKEACMS.GlobalScripts.Models.LiveChatScript','{\"Location\":0,\"Script\":null}',NULL,NULL,NULL,NULL,NULL,'2019-05-07 21:19:17.490',NULL,NULL,'2019-05-07 21:19:17.490'),
('ZKEACMS.GlobalScripts.Models.StatisticsScript','{\"Location\":0,\"Script\":null}',NULL,NULL,NULL,NULL,NULL,'2019-05-07 21:19:17.603',NULL,NULL,'2019-05-07 21:19:17.603'),
('ZKEACMS.Shop.AliPayConfigOptions','{\"AppId\":\"2016082000296332\",\"Uid\":\"2088102172250345\",\"Gatewayurl\":\"https://openapi.alipaydev.com/gateway.do\",\"PrivateKey\":\"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP\",\"AlipayPublicKey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB\",\"SignType\":\"RSA2\",\"CharSet\":\"UTF-8\",\"IsKeyFromFile\":false}',NULL,NULL,NULL,NULL,NULL,'2018-04-03 09:48:09.593',NULL,NULL,'2018-04-03 09:48:09.593');
/*!40000 ALTER TABLE `DataArchived` ENABLE KEYS */;

DROP TABLE IF EXISTS `DataDictionary`;
CREATE TABLE `DataDictionary` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`DicName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`DicValue` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Order` INT  NULL,
	`Pid` INT  NULL,
	`IsSystem` TINYINT(1)  NOT NULL,
	`ImageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageThumbUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `DataDictionary` DISABLE KEYS */;
INSERT INTO `DataDictionary` VALUES
(1,'RecordStatus','Active','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'RecordStatus','Inactive','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'ArticleCategory','News','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'ArticleCategory','Company News','2',2,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'ArticleCategory','Industry News','3',3,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'UserEntity@Sex','Male','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'UserEntity@Sex','Female','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'UserEntity@MaritalStatus','Unmarried','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(9,'UserEntity@MaritalStatus','Married','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'UserEntity@UserTypeCD','Administrator','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(12,'ArticleTopWidget@PartialView','Default','Widget.ArticleTops',1,0,1,NULL,'~/images/article/005.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(13,'ArticleListWidget@PartialView','Default','Widget.ArticleList',1,0,1,NULL,'~/images/article/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(14,'ArticleListWidget@PartialView','Banner','Widget.ArticleList-Snippet',2,0,1,NULL,'~/images/article/001.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(15,'ProductListWidget@PartialView','Default','Widget.ProductList',1,0,1,NULL,'~/images/product/003.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(16,'ProductListWidget@Columns','3 Columns','col-xs-12 col-sm-6 col-md-4',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(17,'ProductListWidget@Columns','4 Columns','col-xs-12 col-sm-6 col-md-4 col-lg-3',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(18,'CarouselWidget@PartialView','Default','Widget.Carousel',1,0,1,NULL,'~/images/carousel/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(19,'ArticleSummaryWidget@Style','Default','bs-callout-default',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20,'ArticleSummaryWidget@Style','Danger','bs-callout-danger',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(21,'ArticleSummaryWidget@Style','Warning','bs-callout-warning',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22,'ArticleSummaryWidget@Style','Information','bs-callout-info',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23,'ArticleSummaryWidget@Style','Success','bs-callout-success',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(24,'ArticleSummaryWidget@PartialView','Default','Widget.ArticleSummary',1,0,1,NULL,'~/images/article/012.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(25,'ProductCategoryWidget@PartialView','Default','Widget.ProductCategory',1,0,1,NULL,'~/images/product/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(26,'ArticleTypeWidget@PartialView','Default','Widget.ArticleType',1,0,1,NULL,'~/images/article/009.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(27,'UserEntity@UserTypeCD','Customer','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(28,'Order@OrderStatus','Unpaid','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(29,'Order@OrderStatus','Cancel','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(30,'Order@OrderStatus','Paid','3',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(31,'Order@OrderStatus','Shipped','4',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(32,'Order@OrderStatus','Traid Finished','5',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(33,'Order@OrderStatus','Refunded','6',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(34,'Order@OrderStatus','Refunding','7',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(35,'ProductListWidget@PartialView','List','Widget.ProductList.A',2,0,1,NULL,'~/images/product/004.png',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),
(36,'RuleItem@Condition','And','and',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(37,'RuleItem@Condition','Or','or',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(38,'RuleItem@FunctionName','Equals','Equals',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(39,'RuleItem@FunctionName','Not Equals','NotEquals',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(40,'RuleItem@FunctionName','Greater Than','GreaterThan',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(41,'RuleItem@FunctionName','Greater Than Or Equals','GreaterThanOrEquals',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(42,'RuleItem@FunctionName','Less Than','LessThan',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(43,'RuleItem@FunctionName','Less Than Or Equals','LessThanOrEquals',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(44,'RuleItem@FunctionName','Starts With','StartsWith',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(45,'RuleItem@FunctionName','Ends With','EndsWith',8,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(46,'RuleItem@FunctionName','Not Starts With','NotStartsWith',9,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(47,'RuleItem@FunctionName','Not Ends With','NotEndsWith',10,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(48,'RuleItem@FunctionName','Contains','Contains',11,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(49,'RuleItem@FunctionName','Not Contains','NotContains',12,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(50,'RuleItem@FunctionName','In','In',13,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(51,'RuleItem@FunctionName','Not In','NotIn',14,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(52,'RuleItem@Property','Url','ValueOf(''Url'')',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(53,'RuleItem@Property','Query String','ValueOf(''QueryString'')',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(54,'RuleItem@Property','User-Agent','ValueOf(''UserAgent'')',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(55,'RuleItem@Property','Today','ValueOf(''Now'')',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(56,'NavigationWidget@PartialView','Default','Widget.Navigation',1,0,1,NULL,'~/images/navigation/000.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(57,'NavigationWidget@PartialView','Style A','Widget.Navigation.A',2,0,1,NULL,'~/images/navigation/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(58,'NavigationWidget@PartialView','Style B','Widget.Navigation.B',3,0,1,NULL,'~/images/navigation/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(59,'NavigationWidget@PartialView','Style C','Widget.Navigation.C',4,0,1,NULL,'~/images/navigation/003.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(60,'NavigationWidget@PartialView','Style D','Widget.Navigation.D',5,0,1,NULL,'~/images/navigation/004.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(61,'NavigationWidget@PartialView','Style E','Widget.Navigation.E',6,0,1,NULL,'~/images/navigation/005.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(62,'NavigationWidget@PartialView','Style F','Widget.Navigation.F',7,0,1,NULL,'~/images/navigation/006.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(63,'NavigationWidget@PartialView','Style G','Widget.Navigation.G',8,0,1,NULL,'~/images/navigation/007.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(64,'ArticleListWidget@PartialView','Style A','Widget.ArticleList.A',3,0,1,NULL,'~/images/article/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(65,'ArticleListWidget@PartialView','Style B','Widget.ArticleList.B',4,0,1,NULL,'~/images/article/003.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(66,'ArticleListWidget@PartialView','Style C','Widget.ArticleList.C',5,0,1,NULL,'~/images/article/004.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(67,'ArticleTopWidget@PartialView','Style A','Widget.ArticleTops.A',2,0,1,NULL,'~/images/article/006.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(68,'ArticleTopWidget@PartialView','Style B','Widget.ArticleTops.B',3,0,1,NULL,'~/images/article/007.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(69,'ArticleTopWidget@PartialView','Style C','Widget.ArticleTops.C',4,0,1,NULL,'~/images/article/008.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(70,'ArticleTypeWidget@PartialView','Style A','Widget.ArticleType.A',2,0,1,NULL,'~/images/article/010.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(71,'ArticleTypeWidget@PartialView','Style B','Widget.ArticleType.B',3,0,1,NULL,'~/images/article/011.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(72,'ArticleSummaryWidget@PartialView','Style A','Widget.ArticleSummary.A',2,0,1,NULL,'~/images/article/013.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(73,'ArticleSummaryWidget@PartialView','Style B','Widget.ArticleSummary.B',3,0,1,NULL,'~/images/article/014.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(74,'ArticleSummaryWidget@PartialView','Style C','Widget.ArticleSummary.C',4,0,1,NULL,'~/images/article/015.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(75,'ProductCategoryWidget@PartialView','Style A','Widget.ProductCategory.A',2,0,1,NULL,'~/images/product/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(76,'ProductCategoryWidget@PartialView','Style B','Widget.ProductCategory.B',3,0,1,NULL,'~/images/product/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(77,'CarouselWidget@PartialView','Style A','Widget.Carousel.A',2,0,1,NULL,'~/images/carousel/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL),
(78,'StaticPageSetting@CacheProvider','Memory Cache','MemoryCache',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(79,'StaticPageSetting@CacheProvider','Database Cache','Database',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(80,'StaticPageSetting@CacheProvider','File Cache','File',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(81,'CultureSetting@CultureMode','Single domain','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(82,'CultureSetting@CultureMode','Standalone domain','2',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `DataDictionary` ENABLE KEYS */;

DROP TABLE IF EXISTS `DBVersion`;
CREATE TABLE `DBVersion` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Major` INT  NULL,
	`Minor` INT  NULL,
	`Revision` INT  NULL,
	`Build` INT  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `DBVersion` DISABLE KEYS */;
INSERT INTO `DBVersion` VALUES
(1,3,3,6,0);
/*!40000 ALTER TABLE `DBVersion` ENABLE KEYS */;

DROP TABLE IF EXISTS `ExtendField`;
CREATE TABLE `ExtendField` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Value` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`OwnerModule` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`OwnerID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `FormData`;
CREATE TABLE `FormData` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`FormId` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`Status` INT  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `FormDataItem`;
CREATE TABLE `FormDataItem` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`FormDataId` INT  NOT NULL,
	`FieldId` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`FieldText` VARCHAR(1000) CHARACTER SET utf8mb4  NULL,
	`FieldValue` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`OptionValue` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `Forms`;
CREATE TABLE `Forms` (
	`ID` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`FieldsData` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`NotificationReceiver` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `Forms` DISABLE KEYS */;
INSERT INTO `Forms` VALUES
('5ed56d90ac154e73befa6fbc981ae3ae','问卷调查','[{\"ID\":\"f05da60a6e3b448fadbf7c5c040a7d5c\",\"Name\":\"Label\",\"DisplayName\":\"一个简单的问卷调查\",\"Value\":null,\"Description\":\"欢迎您使用ZKEACMS，这是一个自定义表单\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"41481e6eefa048feae380460b0cd5661\",\"Name\":\"SingleLine\",\"DisplayName\":\"姓名\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-6\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"bfd1418684a64890a7099f764baa24b3\",\"Name\":\"Number\",\"DisplayName\":\"电话\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-6\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"7e635c8fdd124b6b94f037d3bf112bc0\",\"Name\":\"Email\",\"DisplayName\":\"邮箱地址\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"4d61bb5f733c47778975cc6cfbc84123\",\"Name\":\"SingleLine\",\"DisplayName\":\"QQ\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"b85aeb9beaf64f509726f16ba582ec3c\",\"Name\":\"SingleLine\",\"DisplayName\":\"微信\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"a2aea72c496e4a458265f7ceadb3653a\",\"Name\":\"Address\",\"DisplayName\":\"省份地址\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"0932ca1f1f7f4af098d51e4b1ac18b94\",\"Name\":\"SingleLine\",\"DisplayName\":\"详细地址\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"572c61930769464d97f3d31771ecf65e\",\"Name\":\"Radio\",\"DisplayName\":\"您从哪里了解到ZKEACMS\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"搜索引擎\",\"Value\":\"70a915caf7a84e9086d5dbdf26ed3053\"},{\"DisplayText\":\"博客园\",\"Value\":\"419a7d1d91974282af5c26688fbe0e8c\"},{\"DisplayText\":\"朋友介绍\",\"Value\":\"227f6d2f6b39479aaf2d5b79dbefdc5c\"},{\"DisplayText\":\"其它论坛\",\"Value\":\"ef50fb3bccf74d6487320e53781fb1ec\"}],\"AdditionalSettings\":null},{\"ID\":\"845830a5c8be4b81866a8cef83049899\",\"Name\":\"Checkbox\",\"DisplayName\":\"您一般使用ZKEACMS做什么\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"网站\",\"Value\":\"5f0fbb9faa0343e0958a896fe3cead4f\"},{\"DisplayText\":\"博客\",\"Value\":\"65902e51d35142019c4aab8badff9e35\"},{\"DisplayText\":\"其它\",\"Value\":\"944343b3ed904b94a9db6950dbdcccf3\"}],\"AdditionalSettings\":null},{\"ID\":\"2fe6e4baf01e4cb897986991c920df56\",\"Name\":\"Dropdown\",\"DisplayName\":\"您觉得ZKEACMS怎么样\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"很不错\",\"Value\":\"fc3929826e364318b7a3436d991fb097\"},{\"DisplayText\":\"还可以\",\"Value\":\"619e09c2864b41ae81f4f90e7cab92ba\"},{\"DisplayText\":\"有待提高\",\"Value\":\"fd1279a07150490f9a1f69c85298e22c\"},{\"DisplayText\":\"不怎么样\",\"Value\":\"ef19983754504a9482232dd6be01f34d\"}],\"AdditionalSettings\":null},{\"ID\":\"2868de2d8e9b4d269da891342e6dc95b\",\"Name\":\"Paragraph\",\"DisplayName\":\"您的意见或建议\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null}]',NULL,NULL,'',NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:07:58.013');
/*!40000 ALTER TABLE `Forms` ENABLE KEYS */;

DROP TABLE IF EXISTS `HtmlWidget`;
CREATE TABLE `HtmlWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`HTML` LONGTEXT CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_HtmlWidget_Widget` (`ID`),
	CONSTRAINT `FK_HtmlWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `HtmlWidget` DISABLE KEYS */;
INSERT INTO `HtmlWidget` VALUES
('09617f6142934daaadee6cfb9df6d66f','<p>这是文本段落，你可以在段里面加入标题，文字，图片，表格，列表，链接等等。例如：</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>'),
('0cbd1f8be3b44fd0a2729fe941b9dfdd','<p>A developer, podcast producer, book author, and open source evangelist. On his personal blog C#, .NET, IIS, SNMP, and many other topics are covered. The opinions expressed herein are his own personal opinions and do not represent his employer&rsquo;s view in any way.</p>'),
('2d71120b7f464f46ba26beb19d3120ea','<hr />'),
('3d8b565424ef44b99ceb6d95c3ac9f9a','<div id=\"footer\">ZKEACMS是开源软件，提供免费下载学习使用
<p>Copyright @&nbsp;2018 ZKEASOFT. All Rights Reserved | <a href=\"http://www.zkea.net/\" target=\"_blank\" rel=\"noopener\">www.zkea.net</a></p>
</div>'),
('50f810582d28440eb3bdff9ee5b1ef24','<div>
<div class=\"row\">
<div class=\"col-sm-6\"><img src=\"/Images/28.jpg\" alt=\"\" /></div>
<div class=\"col-sm-6\">
<h3>为什么选择我们？</h3>
<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>
<p>&nbsp;</p>
<p><a class=\"btn btn-info\" href=\"#\">Read More</a></p>
</div>
</div>
</div>'),
('56991d0ff59d4c1db27aff3a50fcb382','<div class=\"page-header\">
<h1>ZKEASOFT</h1>
</div>
<p>ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>'),
('8cc061c2e2514ef9b85bbecdec3f84ab','<hr />'),
('bb7dab4f077745ef8b5b425eaabb423c','<h1 style=\"text-align: center; font-size: 3em;\">ZKEASOFT</h1>
<p>&nbsp;</p>
<p style=\"text-align: center;\">ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>
<p style=\"text-align: center;\"><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a>是基于<a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p style=\"text-align: center;\">ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p style=\"text-align: center;\">ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p style=\"text-align: center;\">ZKEACMS采用插件式设计，支持扩展新插件。</p>
<p style=\"text-align: center;\">&nbsp;</p>
<p style=\"text-align: center;\"><a class=\"btn btn-info\" href=\"#\">Read More</a></p>'),
('e3eb5dd919c4477a857a478764daaa78','<h2 style=\"text-align: center; padding-top: 200px; font-size: 3em; font-weight: bold; margin-top: 0;\">The Half-Blood Programmer</h2>
<p style=\"text-align: center;\">About C#, JavaScript, Html, CSS</p>'),
('f6de0d62d3974ee2bf2ded3fbbc82c2b','<div class=\"space\">&nbsp;</div>');
/*!40000 ALTER TABLE `HtmlWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `ImageWidget`;
CREATE TABLE `ImageWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`ImageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Width` INT  NULL,
	`Height` INT  NULL,
	`AltText` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Link` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageUrlMd` VARCHAR(225) CHARACTER SET utf8mb4  NULL,
	`ImageUrlSm` VARCHAR(225) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ImageWidget_Widget` (`ID`),
	CONSTRAINT `FK_ImageWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `ImageWidget` DISABLE KEYS */;
INSERT INTO `ImageWidget` VALUES
('fee7f4d7d7e641b0bfa74491a543d245','~/images/30.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ImageWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `Language`;
CREATE TABLE `Language` (
	`LanKey` VARCHAR(190) CHARACTER SET utf8mb4  NOT NULL,
	`CultureName` VARCHAR(10) CHARACTER SET utf8mb4  NOT NULL,
	`LanValue` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Module` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LanType` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`LanKey`,`CultureName`)
);

/*!40000 ALTER TABLE `Language` DISABLE KEYS */;
INSERT INTO `Language` VALUES
('-- City --','zh-CN','-- 选择市 --',NULL,NULL),
('-- District --','zh-CN','-- 选择区 --',NULL,NULL),
('-- Province --','zh-CN','-- 选择省 --',NULL,NULL),
('--- Select ---','zh-CN','---请选择---',NULL,NULL),
('-- Select --','zh-CN','-- 请选择 --',NULL,NULL),
('_Site Search','zh-CN','_站内搜索',NULL,NULL),
('{0} is already exists','zh-CN','{0} 已存在',NULL,NULL),
('{0} is invalid','en-GB','{0} is invalid',NULL,NULL),
('{0} is invalid','en-US','{0} is invalid',NULL,NULL),
('{0} is invalid','zh-CN','{0}不正确',NULL,NULL),
('{0} is not correct.','zh-CN','{0}错误',NULL,NULL),
('{0} is required','en-GB','{0} is required',NULL,NULL),
('{0} is required','en-US','{0} is required',NULL,NULL),
('{0} is required','zh-CN','请输入{0}',NULL,NULL),
('{0} length should be between {1} to {2}','zh-CN','{0}的长度应大于{1}且小于{2}',NULL,NULL),
('{0} length should be greater than {1}','zh-CN','{0}的长度应大于{1}',NULL,NULL),
('{0} length should be less than {1}','zh-CN','{0}的长度应小于或等于{1}',NULL,NULL),
('{0} length should in range({0}-{1})','zh-CN','{0}的长度应大于{1}且小于{2}',NULL,NULL),
('{0} should in range({1}-{2})','zh-CN','{0}的值范围应在{1}-{2}之间',NULL,NULL),
('3 Columns','zh-CN','3 列',NULL,NULL),
('4 Columns','zh-CN','4 列',NULL,NULL),
('Absolute','zh-CN','绝对',NULL,NULL),
('Account','zh-CN','账号',NULL,NULL),
('Account Center','en-GB','Account',NULL,NULL),
('Account Center','en-US','Account',NULL,NULL),
('Account Center','zh-CN','个人中心',NULL,NULL),
('Action','en-GB','Action',NULL,NULL),
('Action','en-US','Action',NULL,NULL),
('Action','zh-CN','操作',NULL,NULL),
('Active','en-GB','Active',NULL,NULL),
('Active','en-US','Active',NULL,NULL),
('Active','zh-CN','有效',NULL,NULL),
('Add','en-GB','Add',NULL,NULL),
('Add','en-US','Add',NULL,NULL),
('Add','zh-CN','添加',NULL,NULL),
('Add Content','en-GB','Add Content',NULL,NULL),
('Add Content','en-US','Add Content',NULL,NULL),
('Add Content','zh-CN','添加内容',NULL,NULL),
('Add Link','zh-CN','添加链接',NULL,NULL),
('Add Margin','en-GB','Padding',NULL,NULL),
('Add Margin','en-US','Padding',NULL,NULL),
('Add Margin','zh-CN','增加边距',NULL,NULL),
('Add Paragraph','zh-CN','添加段落',NULL,NULL),
('Add Picture','zh-CN','添加图片',NULL,NULL),
('Add Text','zh-CN','添加文字',NULL,NULL),
('Add Title','zh-CN','添加标题',NULL,NULL),
('Add To Cart','zh-CN','加入购物车',NULL,NULL),
('Add Video','zh-CN','添加视频',NULL,NULL),
('Administrator','zh-CN','后台管理员',NULL,NULL),
('AdminSignViewModel@PassWord','en-US','Password','AdminSignViewModel','EntityProperty'),
('AdminSignViewModel@PassWord','zh-CN','密码','AdminSignViewModel','EntityProperty'),
('AdminSignViewModel@UserID','en-US','User','AdminSignViewModel','EntityProperty'),
('AdminSignViewModel@UserID','zh-CN','用户名',NULL,NULL),
('After change the password, please sign in use the new password','zh-CN','密码修改成功以后将直接跳转到登录页面，请使用新密码登录',NULL,NULL),
('After index the content then you can search by keywords','zh-CN','网站的页面必须要先经过索引才会出现在搜索结果中，新增、修改了网站内容需更新索引。',NULL,NULL),
('Alert Box','zh-CN','消息框',NULL,NULL),
('Aligh Right','zh-CN','右对齐',NULL,NULL),
('Align','zh-CN','对齐',NULL,NULL),
('Align Bottom','zh-CN','底部对齐',NULL,NULL),
('Align Left','en-GB','Align Left',NULL,NULL),
('Align Left','en-US','Align Left',NULL,NULL),
('Align Left','zh-CN','左对齐',NULL,NULL),
('Align Left Bottom','zh-CN','左下对齐',NULL,NULL),
('Align Left Top','zh-CN','左上对齐',NULL,NULL),
('Align Right','en-GB','Align Right',NULL,NULL),
('Align Right','en-US','Align Right',NULL,NULL),
('Align Right','zh-CN','右对齐',NULL,NULL),
('Align Right Bottom','zh-CN','右下对齐',NULL,NULL),
('Align Right Top','zh-CN','右上对齐',NULL,NULL),
('Align Top','zh-CN','顶部对齐',NULL,NULL),
('Alipay Setting','en-GB','Alipay',NULL,NULL),
('Alipay Setting','en-US','Alipay',NULL,NULL),
('Alipay Setting','zh-CN','支付宝集成设置',NULL,NULL),
('AlipayOptions@AlipayPublicKey','en-GB','Alipay Public Key','AlipayOptions','EntityProperty'),
('AlipayOptions@AlipayPublicKey','en-US','Alipay Public Key','AlipayOptions','EntityProperty'),
('AlipayOptions@AlipayPublicKey','zh-CN','应用公钥','AlipayOptions','EntityProperty'),
('AlipayOptions@AppId','en-GB','App','AlipayOptions','EntityProperty'),
('AlipayOptions@AppId','en-US','App','AlipayOptions','EntityProperty'),
('AlipayOptions@AppId','zh-CN','AppId','AlipayOptions','EntityProperty'),
('AlipayOptions@Gatewayurl','en-GB','Gatewayurl','AlipayOptions','EntityProperty'),
('AlipayOptions@Gatewayurl','en-US','Gatewayurl','AlipayOptions','EntityProperty'),
('AlipayOptions@Gatewayurl','zh-CN','支付宝网关','AlipayOptions','EntityProperty'),
('AlipayOptions@IsKeyFromFile','en-GB','Is Key From File','AlipayOptions','EntityProperty'),
('AlipayOptions@IsKeyFromFile','en-US','Is Key From File','AlipayOptions','EntityProperty'),
('AlipayOptions@IsKeyFromFile','zh-CN','IsKeyFromFile','AlipayOptions','EntityProperty'),
('AlipayOptions@PrivateKey','en-GB','Private Key','AlipayOptions','EntityProperty'),
('AlipayOptions@PrivateKey','en-US','Private Key','AlipayOptions','EntityProperty'),
('AlipayOptions@PrivateKey','zh-CN','应用私钥','AlipayOptions','EntityProperty'),
('AlipayOptions@SignType','en-GB','Sign Type','AlipayOptions','EntityProperty'),
('AlipayOptions@SignType','en-US','Sign Type','AlipayOptions','EntityProperty'),
('AlipayOptions@SignType','zh-CN','SignType','AlipayOptions','EntityProperty'),
('AlipayOptions@Uid','en-GB','Uid','AlipayOptions','EntityProperty'),
('AlipayOptions@Uid','en-US','Uid','AlipayOptions','EntityProperty'),
('AlipayOptions@Uid','zh-CN','商户UID','AlipayOptions','EntityProperty'),
('All','en-GB','All',NULL,NULL),
('All','en-US','All',NULL,NULL),
('All','zh-CN','全部',NULL,NULL),
('Always horizontally','zh-CN','总是水平排列',NULL,NULL),
('Amount','zh-CN','金额',NULL,NULL),
('And','en-GB','And',NULL,NULL),
('And','en-US','And',NULL,NULL),
('And','zh-CN','并且',NULL,NULL),
('Append ''.html''','en-GB','Append ''.html''',NULL,NULL),
('Append ''.html''','en-US','Append ''.html''',NULL,NULL),
('Append ''.html''','zh-CN','转为伪静态路径',NULL,NULL),
('ApplicationSetting@ActionType','zh-CN','ActionType','ApplicationSetting','EntityProperty'),
('ApplicationSetting@CreateBy','zh-CN','CreateBy','ApplicationSetting','EntityProperty'),
('ApplicationSetting@CreatebyName','en-US','Create By','ApplicationSetting','EntityProperty'),
('ApplicationSetting@CreatebyName','zh-CN','创建人','ApplicationSetting','EntityProperty'),
('ApplicationSetting@CreateDate','en-US','Create Date','ApplicationSetting','EntityProperty'),
('ApplicationSetting@CreateDate','zh-CN','创建日期','ApplicationSetting','EntityProperty'),
('ApplicationSetting@Description','zh-CN','描述','ApplicationSetting','EntityProperty'),
('ApplicationSetting@LastUpdateBy','zh-CN','LastUpdateBy','ApplicationSetting','EntityProperty'),
('ApplicationSetting@LastUpdateByName','en-US','Last Update By','ApplicationSetting','EntityProperty'),
('ApplicationSetting@LastUpdateByName','zh-CN','更新人','ApplicationSetting','EntityProperty'),
('ApplicationSetting@LastUpdateDate','en-US','Last Update Date','ApplicationSetting','EntityProperty'),
('ApplicationSetting@LastUpdateDate','zh-CN','更新日期','ApplicationSetting','EntityProperty'),
('ApplicationSetting@SettingKey','en-US','Setting Key','ApplicationSetting','EntityProperty'),
('ApplicationSetting@SettingKey','zh-CN','键','ApplicationSetting','EntityProperty'),
('ApplicationSetting@Status','en-US','Status','ApplicationSetting','EntityProperty'),
('ApplicationSetting@Status','zh-CN','状态','ApplicationSetting','EntityProperty'),
('ApplicationSetting@Title','zh-CN','标题','ApplicationSetting','EntityProperty'),
('ApplicationSetting@Value','en-US','Value','ApplicationSetting','EntityProperty'),
('ApplicationSetting@Value','zh-CN','值','ApplicationSetting','EntityProperty'),
('Article','zh-CN','文章',NULL,NULL),
('Article Category','en-GB','Article Category',NULL,NULL),
('Article Category','en-US','Article Category',NULL,NULL),
('Article Category','zh-CN','文章类别',NULL,NULL),
('Article Detail','en-GB','Article Content',NULL,NULL),
('Article Detail','en-US','Article Content',NULL,NULL),
('Article Detail','zh-CN','文章内容',NULL,NULL),
('Article keywords','en-GB','Article keywords',NULL,NULL),
('Article keywords','en-US','Article keywords',NULL,NULL),
('Article keywords','zh-CN','文章关键字',NULL,NULL),
('Article List','en-GB','Article List',NULL,NULL),
('Article List','en-US','Article List',NULL,NULL),
('Article List','zh-CN','文章列表',NULL,NULL),
('Article Manager','en-GB','Article',NULL,NULL),
('Article Manager','en-US','Article',NULL,NULL),
('Article Manager','zh-CN','文章管理',NULL,NULL),
('Article News','en-GB','News',NULL,NULL),
('Article News','en-US','News',NULL,NULL),
('Article News','zh-CN','新闻资讯',NULL,NULL),
('Article Summary','en-GB','Article Summary',NULL,NULL),
('Article Summary','en-US','Article Summary',NULL,NULL),
('Article Summary','zh-CN','文章概览',NULL,NULL),
('ArticleDetailWidget@ActionType','zh-CN','ActionType','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@AssemblyName','zh-CN','AssemblyName','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@CreateBy','zh-CN','CreateBy','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@CreatebyName','zh-CN','创建人','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@CreateDate','zh-CN','创建日期','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@CustomClass','zh-CN','CustomClass','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@CustomerClass','zh-CN','CustomerClass','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@CustomStyle','zh-CN','CustomStyle','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@Description','zh-CN','描述','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@ExtendData','zh-CN','ExtendData','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@ExtendFields','zh-CN','扩展属性','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@FormView','zh-CN','FormView','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@ID','zh-CN','ID','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@IsSystem','zh-CN','IsSystem','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@IsTemplate','zh-CN','保存为模板','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@LastUpdateByName','zh-CN','更新人','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@LastUpdateDate','zh-CN','更新日期','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@LayoutID','zh-CN','LayoutID','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@PageID','zh-CN','PageID','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@PartialView','zh-CN','显示模板','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@Position','zh-CN','排序','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@Status','zh-CN','状态','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@StyleClass','zh-CN','自定义样式','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@Thumbnail','zh-CN','缩略图','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@Title','zh-CN','标题','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@WidgetName','zh-CN','组件名称','ArticleDetailWidget','EntityProperty'),
('ArticleDetailWidget@ZoneID','zh-CN','区域','ArticleDetailWidget','EntityProperty'),
('ArticleEntity@ActionType','zh-CN','ActionType','ArticleEntity','EntityProperty'),
('ArticleEntity@ArticleContent','zh-CN','文章内容','ArticleEntity','EntityProperty'),
('ArticleEntity@ArticleTypeID','en-GB','Article Type','ArticleEntity','EntityProperty'),
('ArticleEntity@ArticleTypeID','en-US','Article Type','ArticleEntity','EntityProperty'),
('ArticleEntity@ArticleTypeID','zh-CN','文章类别','ArticleEntity','EntityProperty'),
('ArticleEntity@Counter','zh-CN','阅读次数','ArticleEntity','EntityProperty'),
('ArticleEntity@CreateBy','zh-CN','CreateBy','ArticleEntity','EntityProperty'),
('ArticleEntity@CreatebyName','en-GB','Create By','ArticleEntity','EntityProperty'),
('ArticleEntity@CreatebyName','en-US','Create By','ArticleEntity','EntityProperty'),
('ArticleEntity@CreatebyName','zh-CN','创建人','ArticleEntity','EntityProperty'),
('ArticleEntity@CreateDate','en-GB','Create Date','ArticleEntity','EntityProperty'),
('ArticleEntity@CreateDate','en-US','Create Date','ArticleEntity','EntityProperty'),
('ArticleEntity@CreateDate','zh-CN','创建日期','ArticleEntity','EntityProperty'),
('ArticleEntity@Description','zh-CN','描述','ArticleEntity','EntityProperty'),
('ArticleEntity@ExtendFields','zh-CN','扩展属性','ArticleEntity','EntityProperty'),
('ArticleEntity@ID','en-US','ID','ArticleEntity','EntityProperty'),
('ArticleEntity@ID','zh-CN','ID','ArticleEntity','EntityProperty'),
('ArticleEntity@ImageThumbUrl','zh-CN','缩略图','ArticleEntity','EntityProperty'),
('ArticleEntity@ImageUrl','zh-CN','图片','ArticleEntity','EntityProperty'),
('ArticleEntity@IsPublish','en-GB','Is Publish','ArticleEntity','EntityProperty'),
('ArticleEntity@IsPublish','en-US','Is Publish','ArticleEntity','EntityProperty'),
('ArticleEntity@IsPublish','zh-CN','已发布?','ArticleEntity','EntityProperty'),
('ArticleEntity@LastUpdateBy','zh-CN','LastUpdateBy','ArticleEntity','EntityProperty'),
('ArticleEntity@LastUpdateByName','en-GB','Last Update By','ArticleEntity','EntityProperty'),
('ArticleEntity@LastUpdateByName','en-US','Last Update By','ArticleEntity','EntityProperty'),
('ArticleEntity@LastUpdateByName','zh-CN','更新人','ArticleEntity','EntityProperty'),
('ArticleEntity@LastUpdateDate','en-GB','Last Update Date','ArticleEntity','EntityProperty'),
('ArticleEntity@LastUpdateDate','en-US','Last Update Date','ArticleEntity','EntityProperty'),
('ArticleEntity@LastUpdateDate','zh-CN','更新日期','ArticleEntity','EntityProperty'),
('ArticleEntity@MetaDescription','zh-CN','SEO描述','ArticleEntity','EntityProperty'),
('ArticleEntity@MetaKeyWords','zh-CN','SEO关键字','ArticleEntity','EntityProperty'),
('ArticleEntity@PublishDate','zh-CN','发布日期','ArticleEntity','EntityProperty'),
('ArticleEntity@ReturnUrl','zh-CN','ReturnUrl','ArticleEntity','EntityProperty'),
('ArticleEntity@Status','zh-CN','状态','ArticleEntity','EntityProperty'),
('ArticleEntity@Summary','zh-CN','概述','ArticleEntity','EntityProperty'),
('ArticleEntity@Title','en-GB','Title','ArticleEntity','EntityProperty'),
('ArticleEntity@Title','en-US','Title','ArticleEntity','EntityProperty'),
('ArticleEntity@Title','zh-CN','标题','ArticleEntity','EntityProperty'),
('ArticleEntity@Url','zh-CN','英文名','ArticleEntity','EntityProperty'),
('ArticleListWidget@ActionType','zh-CN','ActionType','ArticleListWidget','EntityProperty'),
('ArticleListWidget@ArticleCategoryID','zh-CN','ArticleCategoryID','ArticleListWidget','EntityProperty'),
('ArticleListWidget@ArticleTypeID','zh-CN','文章类别','ArticleListWidget','EntityProperty'),
('ArticleListWidget@AssemblyName','zh-CN','AssemblyName','ArticleListWidget','EntityProperty'),
('ArticleListWidget@CreateBy','zh-CN','CreateBy','ArticleListWidget','EntityProperty'),
('ArticleListWidget@CreatebyName','zh-CN','创建人','ArticleListWidget','EntityProperty'),
('ArticleListWidget@CreateDate','zh-CN','创建日期','ArticleListWidget','EntityProperty'),
('ArticleListWidget@CustomClass','zh-CN','CustomClass','ArticleListWidget','EntityProperty'),
('ArticleListWidget@CustomStyle','zh-CN','CustomStyle','ArticleListWidget','EntityProperty'),
('ArticleListWidget@Description','zh-CN','描述','ArticleListWidget','EntityProperty'),
('ArticleListWidget@DetailPageUrl','zh-CN','详细页面','ArticleListWidget','EntityProperty'),
('ArticleListWidget@ExtendData','zh-CN','ExtendData','ArticleListWidget','EntityProperty'),
('ArticleListWidget@ExtendFields','zh-CN','扩展属性','ArticleListWidget','EntityProperty'),
('ArticleListWidget@FormView','zh-CN','FormView','ArticleListWidget','EntityProperty'),
('ArticleListWidget@ID','zh-CN','ID','ArticleListWidget','EntityProperty'),
('ArticleListWidget@IsPageable','zh-CN','分页?','ArticleListWidget','EntityProperty'),
('ArticleListWidget@IsSystem','zh-CN','IsSystem','ArticleListWidget','EntityProperty'),
('ArticleListWidget@IsTemplate','zh-CN','保存为模板','ArticleListWidget','EntityProperty'),
('ArticleListWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleListWidget','EntityProperty'),
('ArticleListWidget@LastUpdateByName','zh-CN','更新人','ArticleListWidget','EntityProperty'),
('ArticleListWidget@LastUpdateDate','zh-CN','更新日期','ArticleListWidget','EntityProperty'),
('ArticleListWidget@LayoutID','zh-CN','LayoutID','ArticleListWidget','EntityProperty'),
('ArticleListWidget@PageID','zh-CN','PageID','ArticleListWidget','EntityProperty'),
('ArticleListWidget@PageSize','zh-CN','分页大小','ArticleListWidget','EntityProperty'),
('ArticleListWidget@PartialView','zh-CN','显示模板','ArticleListWidget','EntityProperty'),
('ArticleListWidget@Position','zh-CN','排序','ArticleListWidget','EntityProperty'),
('ArticleListWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleListWidget','EntityProperty'),
('ArticleListWidget@Status','zh-CN','状态','ArticleListWidget','EntityProperty'),
('ArticleListWidget@StyleClass','zh-CN','自定义样式','ArticleListWidget','EntityProperty'),
('ArticleListWidget@Thumbnail','zh-CN','缩略图','ArticleListWidget','EntityProperty'),
('ArticleListWidget@Title','zh-CN','标题','ArticleListWidget','EntityProperty'),
('ArticleListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleListWidget','EntityProperty'),
('ArticleListWidget@WidgetName','zh-CN','组件名称','ArticleListWidget','EntityProperty'),
('ArticleListWidget@ZoneID','zh-CN','区域','ArticleListWidget','EntityProperty'),
('ArticleSpecialDetailWidget@ArticleId','zh-CN','文章ID','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@ArticleName','zh-CN','文章英文名','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@AssemblyName','zh-CN','Assembly Name','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@IsSystem','zh-CN','Is System','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@IsTemplate','zh-CN','保存为模板','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@PartialView','zh-CN','显示模板','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@Position','zh-CN','排序','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@ServiceTypeName','zh-CN','Service Type Name','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@StyleClass','zh-CN','自定义样式','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@Thumbnail','zh-CN','缩略图','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@Title','zh-CN','标题','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@ViewModelTypeName','zh-CN','View Model Type Name','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@WidgetName','zh-CN','组件名称','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSpecialDetailWidget@ZoneID','zh-CN','区域','ArticleSpecialDetailWidget','EntityProperty'),
('ArticleSummaryWidget@ActionType','zh-CN','ActionType','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@AssemblyName','zh-CN','AssemblyName','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@CreateBy','zh-CN','CreateBy','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@CreatebyName','zh-CN','创建人','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@CreateDate','zh-CN','创建日期','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@CustomClass','zh-CN','CustomClass','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@CustomStyle','zh-CN','CustomStyle','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@Description','zh-CN','描述','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@DetailLink','zh-CN','详细页面','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@ExtendData','zh-CN','ExtendData','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@ExtendFields','zh-CN','扩展属性','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@FormView','zh-CN','FormView','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@ID','zh-CN','ID','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@IsSystem','zh-CN','IsSystem','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@IsTemplate','zh-CN','保存为模板','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@LastUpdateByName','zh-CN','更新人','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@LastUpdateDate','zh-CN','更新日期','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@LayoutID','zh-CN','布局','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@PageID','zh-CN','页面','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@PartDriver','zh-CN','PartDriver','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@PartialView','zh-CN','显示模板','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@Position','zh-CN','排序','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@Status','zh-CN','状态','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@Style','zh-CN','样式','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@StyleClass','zh-CN','自定义样式','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@SubTitle','zh-CN','子标题','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@Summary','zh-CN','概述','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@Thumbnail','zh-CN','缩略图','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@Title','zh-CN','标题','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@WidgetName','zh-CN','组件名称','ArticleSummaryWidget','EntityProperty'),
('ArticleSummaryWidget@ZoneID','zh-CN','区域','ArticleSummaryWidget','EntityProperty'),
('ArticleTopWidget@ActionType','zh-CN','ActionType','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@ArticleTypeID','zh-CN','文章类别','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@AssemblyName','zh-CN','AssemblyName','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@CreateBy','zh-CN','CreateBy','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@CreatebyName','zh-CN','创建人','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@CreateDate','zh-CN','创建日期','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@CustomClass','zh-CN','CustomClass','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@CustomStyle','zh-CN','CustomStyle','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@Description','zh-CN','描述','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@DetailPageUrl','zh-CN','详细页面','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@ExtendData','zh-CN','ExtendData','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@ExtendFields','zh-CN','扩展属性','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@FormView','zh-CN','FormView','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@ID','zh-CN','ID','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@IsSystem','zh-CN','IsSystem','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@IsTemplate','zh-CN','保存为模板','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@LastUpdateByName','zh-CN','更新人','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@LastUpdateDate','zh-CN','更新日期','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@LayoutID','zh-CN','LayoutID','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@MoreLink','zh-CN','更多页面','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@PageID','zh-CN','PageID','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@PartDriver','zh-CN','PartDriver','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@PartialView','zh-CN','显示模板','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@Position','zh-CN','排序','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@Status','zh-CN','状态','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@StyleClass','zh-CN','自定义样式','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@SubTitle','zh-CN','子标题','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@Thumbnail','zh-CN','缩略图','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@Title','zh-CN','标题','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@Tops','zh-CN','置顶数','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@WidgetName','zh-CN','组件名称','ArticleTopWidget','EntityProperty'),
('ArticleTopWidget@ZoneID','zh-CN','区域','ArticleTopWidget','EntityProperty'),
('ArticleType@ActionType','zh-CN','ActionType','ArticleType','EntityProperty'),
('ArticleType@CreateBy','zh-CN','CreateBy','ArticleType','EntityProperty'),
('ArticleType@CreatebyName','zh-CN','创建人','ArticleType','EntityProperty'),
('ArticleType@CreateDate','zh-CN','创建日期','ArticleType','EntityProperty'),
('ArticleType@Description','zh-CN','描述','ArticleType','EntityProperty'),
('ArticleType@ID','zh-CN','ID','ArticleType','EntityProperty'),
('ArticleType@LastUpdateBy','zh-CN','LastUpdateBy','ArticleType','EntityProperty'),
('ArticleType@LastUpdateByName','zh-CN','更新人','ArticleType','EntityProperty'),
('ArticleType@LastUpdateDate','zh-CN','更新日期','ArticleType','EntityProperty'),
('ArticleType@ParentID','zh-CN','ParentID','ArticleType','EntityProperty'),
('ArticleType@Status','zh-CN','状态','ArticleType','EntityProperty'),
('ArticleType@Title','zh-CN','标题','ArticleType','EntityProperty'),
('ArticleType@Url','zh-CN','英文名','ArticleType','EntityProperty'),
('ArticleTypeWidget@ActionType','zh-CN','ActionType','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@ArticleTypeID','zh-CN','文章类别','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@AssemblyName','zh-CN','AssemblyName','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@CreateBy','zh-CN','CreateBy','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@CreatebyName','zh-CN','创建人','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@CreateDate','zh-CN','创建日期','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@CustomClass','zh-CN','CustomClass','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@CustomStyle','zh-CN','CustomStyle','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@Description','zh-CN','描述','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@ExtendFields','zh-CN','扩展属性','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@FormView','zh-CN','FormView','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@ID','zh-CN','ID','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@IsSystem','zh-CN','IsSystem','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@IsTemplate','zh-CN','保存为模板','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@LastUpdateByName','zh-CN','更新人','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@LastUpdateDate','zh-CN','更新日期','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@LayoutID','zh-CN','LayoutID','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@PageID','zh-CN','PageID','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@PartialView','zh-CN','显示模板','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@Position','zh-CN','排序','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@Status','zh-CN','状态','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@StyleClass','zh-CN','自定义样式','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@TargetPage','zh-CN','详细页面','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@Thumbnail','zh-CN','缩略图','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@Title','zh-CN','标题','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@WidgetName','zh-CN','组件名称','ArticleTypeWidget','EntityProperty'),
('ArticleTypeWidget@ZoneID','zh-CN','区域','ArticleTypeWidget','EntityProperty'),
('Assembly','zh-CN','程序集',NULL,NULL),
('Attachment','zh-CN','附件',NULL,NULL),
('Attention','zh-CN','注意事项',NULL,NULL),
('AuthOption@ClientId','en-GB','Client','AuthOption','EntityProperty'),
('AuthOption@ClientId','en-US','Client','AuthOption','EntityProperty'),
('AuthOption@ClientId','zh-CN','APP ID','AuthOption','EntityProperty'),
('AuthOption@ClientSecret','en-GB','Client Secret','AuthOption','EntityProperty'),
('AuthOption@ClientSecret','en-US','Client Secret','AuthOption','EntityProperty'),
('AuthOption@ClientSecret','zh-CN','APP Key','AuthOption','EntityProperty'),
('Auto','zh-CN','自动',NULL,NULL),
('Avatar','en-GB','Avatar',NULL,NULL),
('Avatar','en-US','Avatar',NULL,NULL),
('Avatar','zh-CN','头像',NULL,NULL),
('Background','zh-CN','背景',NULL,NULL),
('Background Image','zh-CN','背景图',NULL,NULL),
('Baidu Map','en-GB','Map',NULL,NULL),
('Baidu Map','en-US','Map',NULL,NULL),
('Baidu Map','zh-CN','百度地图',NULL,NULL),
('BaiduMapWidget@ApplicationKey','zh-CN','服务密钥(AK)','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@AssemblyName','zh-CN','Assembly Name','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@Height','zh-CN','地图高度(px)','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@Instruction','zh-CN','相关链接','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@IsSystem','zh-CN','Is System','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@IsTemplate','zh-CN','保存为模板','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@LocationPoint','zh-CN','位置坐标','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@Position','zh-CN','排序','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@ServiceTypeName','zh-CN','Service Type Name','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@StyleClass','zh-CN','自定义样式','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@TagSummary','zh-CN','标注说明','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@TagTitle','zh-CN','标注','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@Thumbnail','zh-CN','缩略图','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@Title','zh-CN','标题','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@ViewModelTypeName','zh-CN','View Model Type Name','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@WidgetName','zh-CN','组件名称','BaiduMapWidget','EntityProperty'),
('BaiduMapWidget@ZoneID','zh-CN','区域','BaiduMapWidget','EntityProperty'),
('Banner','zh-CN','横幅',NULL,NULL),
('Basis','en-GB','Basis',NULL,NULL),
('Basis','en-US','Basis',NULL,NULL),
('Basis','zh-CN','基础',NULL,NULL),
('Basket','zh-CN','购物车',NULL,NULL),
('Biography','en-GB','Biography',NULL,NULL),
('Biography','en-US','Biography',NULL,NULL),
('Biography','zh-CN','简介',NULL,NULL),
('BiographyWidget@AssemblyName','zh-CN','Assembly Name','BiographyWidget','EntityProperty'),
('BiographyWidget@Content','zh-CN','详细信息','BiographyWidget','EntityProperty'),
('BiographyWidget@IsSystem','zh-CN','Is System','BiographyWidget','EntityProperty'),
('BiographyWidget@IsTemplate','zh-CN','保存为模板','BiographyWidget','EntityProperty'),
('BiographyWidget@Name','zh-CN','名称','BiographyWidget','EntityProperty'),
('BiographyWidget@Others','zh-CN','其它','BiographyWidget','EntityProperty'),
('BiographyWidget@PartialView','zh-CN','显示模板','BiographyWidget','EntityProperty'),
('BiographyWidget@Photo','zh-CN','照片','BiographyWidget','EntityProperty'),
('BiographyWidget@Position','zh-CN','排序','BiographyWidget','EntityProperty'),
('BiographyWidget@ServiceTypeName','zh-CN','Service Type Name','BiographyWidget','EntityProperty'),
('BiographyWidget@StyleClass','zh-CN','自定义样式','BiographyWidget','EntityProperty'),
('BiographyWidget@Thumbnail','zh-CN','缩略图','BiographyWidget','EntityProperty'),
('BiographyWidget@Title','zh-CN','标题','BiographyWidget','EntityProperty'),
('BiographyWidget@ViewModelTypeName','zh-CN','View Model Type Name','BiographyWidget','EntityProperty'),
('BiographyWidget@WidgetName','zh-CN','组件名称','BiographyWidget','EntityProperty'),
('BiographyWidget@ZoneID','zh-CN','区域','BiographyWidget','EntityProperty'),
('Blink','zh-CN','闪烁',NULL,NULL),
('Bold','zh-CN','粗体',NULL,NULL),
('Bolder','zh-CN','超粗体',NULL,NULL),
('Border','zh-CN','边框',NULL,NULL),
('Border Radius','zh-CN','圆角',NULL,NULL),
('Border Width','zh-CN','边宽',NULL,NULL),
('Border(Empty Zone)','en-GB','Border(Empty Zone)',NULL,NULL),
('Border(Empty Zone)','en-US','Border(Empty Zone)',NULL,NULL),
('Border(Empty Zone)','zh-CN','边框(显示空区域)',NULL,NULL),
('Box Blur','zh-CN','模糊',NULL,NULL),
('Box Horizontal','zh-CN','水平大小',NULL,NULL),
('Box Vertical','zh-CN','垂直大小',NULL,NULL),
('Breadcrumbs','en-GB','Breadcrumbs',NULL,NULL),
('Breadcrumbs','en-US','Breadcrumbs',NULL,NULL),
('Breadcrumbs','zh-CN','路径导航',NULL,NULL),
('BreadcrumbWidget@ActionType','zh-CN','ActionType','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@AssemblyName','zh-CN','AssemblyName','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@CreateBy','zh-CN','CreateBy','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@CreatebyName','zh-CN','创建人','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@CreateDate','zh-CN','创建日期','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@CustomClass','zh-CN','CustomClass','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@CustomStyle','zh-CN','CustomStyle','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@Description','zh-CN','描述','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@ExtendData','zh-CN','ExtendData','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@ExtendFields','zh-CN','扩展属性','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@FormView','zh-CN','FormView','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@ID','zh-CN','ID','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@IsLinkAble','zh-CN','IsLinkAble','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@IsSystem','zh-CN','IsSystem','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@IsTemplate','zh-CN','保存为模板','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@LastUpdateBy','zh-CN','LastUpdateBy','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@LastUpdateByName','zh-CN','更新人','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@LastUpdateDate','zh-CN','更新日期','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@LayoutID','zh-CN','布局','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@PageID','zh-CN','页面','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@PartialView','zh-CN','显示模板','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@Position','zh-CN','排序','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@ServiceTypeName','zh-CN','ServiceTypeName','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@Status','zh-CN','状态','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@StyleClass','zh-CN','自定义样式','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@Thumbnail','zh-CN','缩略图','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@Title','zh-CN','标题','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@WidgetName','zh-CN','组件名称','BreadcrumbWidget','EntityProperty'),
('BreadcrumbWidget@ZoneID','zh-CN','区域','BreadcrumbWidget','EntityProperty'),
('Button','zh-CN','按钮',NULL,NULL),
('Can not delete yourself.','zh-CN','不能删除当前登录用户',NULL,NULL),
('Cancel','en-GB','Cancel',NULL,NULL),
('Cancel','en-US','Cancel',NULL,NULL),
('Cancel','zh-CN','取消',NULL,NULL),
('Capitalize','zh-CN','首字母大写',NULL,NULL),
('Carousel','en-GB','Carousel',NULL,NULL),
('Carousel','en-US','Carousel',NULL,NULL),
('Carousel','zh-CN','焦点图',NULL,NULL),
('CarouselEntity@ActionType','zh-CN','ActionType','CarouselEntity','EntityProperty'),
('CarouselEntity@CarouselItems','en-GB','Carousel Items','CarouselEntity','EntityProperty'),
('CarouselEntity@CarouselItems','en-US','Carousel Items','CarouselEntity','EntityProperty'),
('CarouselEntity@CarouselItems','zh-CN','滚动图','CarouselEntity','EntityProperty'),
('CarouselEntity@CreateBy','zh-CN','CreateBy','CarouselEntity','EntityProperty'),
('CarouselEntity@CreatebyName','en-GB','Create By','CarouselEntity','EntityProperty'),
('CarouselEntity@CreatebyName','en-US','Create By','CarouselEntity','EntityProperty'),
('CarouselEntity@CreatebyName','zh-CN','创建人','CarouselEntity','EntityProperty'),
('CarouselEntity@CreateDate','en-GB','Create Date','CarouselEntity','EntityProperty'),
('CarouselEntity@CreateDate','en-US','Create Date','CarouselEntity','EntityProperty'),
('CarouselEntity@CreateDate','zh-CN','创建日期','CarouselEntity','EntityProperty'),
('CarouselEntity@Description','en-GB','Description','CarouselEntity','EntityProperty'),
('CarouselEntity@Description','en-US','Description','CarouselEntity','EntityProperty'),
('CarouselEntity@Description','zh-CN','描述','CarouselEntity','EntityProperty'),
('CarouselEntity@Height','zh-CN','高度(px)','CarouselEntity','EntityProperty'),
('CarouselEntity@ID','zh-CN','ID','CarouselEntity','EntityProperty'),
('CarouselEntity@LastUpdateBy','zh-CN','LastUpdateBy','CarouselEntity','EntityProperty'),
('CarouselEntity@LastUpdateByName','en-GB','Last Update By','CarouselEntity','EntityProperty'),
('CarouselEntity@LastUpdateByName','en-US','Last Update By','CarouselEntity','EntityProperty'),
('CarouselEntity@LastUpdateByName','zh-CN','更新人','CarouselEntity','EntityProperty'),
('CarouselEntity@LastUpdateDate','en-GB','Last Update Date','CarouselEntity','EntityProperty'),
('CarouselEntity@LastUpdateDate','en-US','Last Update Date','CarouselEntity','EntityProperty'),
('CarouselEntity@LastUpdateDate','zh-CN','更新日期','CarouselEntity','EntityProperty'),
('CarouselEntity@Status','en-GB','Status','CarouselEntity','EntityProperty'),
('CarouselEntity@Status','en-US','Status','CarouselEntity','EntityProperty'),
('CarouselEntity@Status','zh-CN','状态','CarouselEntity','EntityProperty'),
('CarouselEntity@Title','en-GB','Title','CarouselEntity','EntityProperty'),
('CarouselEntity@Title','en-US','Title','CarouselEntity','EntityProperty'),
('CarouselEntity@Title','zh-CN','标题','CarouselEntity','EntityProperty'),
('CarouselItemEntity@ActionType','zh-CN','ActionType','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@CarouselID','en-GB','Carousel','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@CarouselID','en-US','Carousel','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@CarouselID','zh-CN','焦点图','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@CarouselWidgetID','zh-CN','CarouselWidgetID','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@CreateBy','zh-CN','CreateBy','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@CreatebyName','zh-CN','创建人','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@CreateDate','zh-CN','创建日期','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@Description','zh-CN','描述','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@ID','zh-CN','ID','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@ImageUrl','en-GB','Image Url','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@ImageUrl','en-US','Image Url','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@ImageUrl','zh-CN','图片','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@LastUpdateBy','zh-CN','LastUpdateBy','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@LastUpdateByName','zh-CN','更新人','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@LastUpdateDate','zh-CN','更新日期','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@Status','en-GB','Status','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@Status','en-US','Status','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@Status','zh-CN','状态','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@TargetLink','en-GB','Target Link','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@TargetLink','en-US','Target Link','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@TargetLink','zh-CN','链接','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@Title','en-GB','Title','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@Title','en-US','Title','CarouselItemEntity','EntityProperty'),
('CarouselItemEntity@Title','zh-CN','标题','CarouselItemEntity','EntityProperty'),
('CarouselWidget@ActionType','zh-CN','ActionType','CarouselWidget','EntityProperty'),
('CarouselWidget@AssemblyName','zh-CN','AssemblyName','CarouselWidget','EntityProperty'),
('CarouselWidget@CarouselID','zh-CN','共享焦点图','CarouselWidget','EntityProperty'),
('CarouselWidget@CarouselItems','zh-CN','滚动图','CarouselWidget','EntityProperty'),
('CarouselWidget@CreateBy','zh-CN','CreateBy','CarouselWidget','EntityProperty'),
('CarouselWidget@CreatebyName','zh-CN','创建人','CarouselWidget','EntityProperty'),
('CarouselWidget@CreateDate','zh-CN','创建日期','CarouselWidget','EntityProperty'),
('CarouselWidget@CustomClass','zh-CN','CustomClass','CarouselWidget','EntityProperty'),
('CarouselWidget@CustomStyle','zh-CN','CustomStyle','CarouselWidget','EntityProperty'),
('CarouselWidget@Description','zh-CN','描述','CarouselWidget','EntityProperty'),
('CarouselWidget@ExtendFields','zh-CN','扩展属性','CarouselWidget','EntityProperty'),
('CarouselWidget@FormView','zh-CN','FormView','CarouselWidget','EntityProperty'),
('CarouselWidget@ID','zh-CN','ID','CarouselWidget','EntityProperty'),
('CarouselWidget@IsSystem','zh-CN','IsSystem','CarouselWidget','EntityProperty'),
('CarouselWidget@IsTemplate','zh-CN','保存为模板','CarouselWidget','EntityProperty'),
('CarouselWidget@LastUpdateBy','zh-CN','LastUpdateBy','CarouselWidget','EntityProperty'),
('CarouselWidget@LastUpdateByName','zh-CN','更新人','CarouselWidget','EntityProperty'),
('CarouselWidget@LastUpdateDate','zh-CN','更新日期','CarouselWidget','EntityProperty'),
('CarouselWidget@LayoutID','zh-CN','LayoutID','CarouselWidget','EntityProperty'),
('CarouselWidget@PageID','zh-CN','PageID','CarouselWidget','EntityProperty'),
('CarouselWidget@PartialView','zh-CN','显示模板','CarouselWidget','EntityProperty'),
('CarouselWidget@Position','zh-CN','排序','CarouselWidget','EntityProperty'),
('CarouselWidget@ServiceTypeName','zh-CN','ServiceTypeName','CarouselWidget','EntityProperty'),
('CarouselWidget@Status','zh-CN','状态','CarouselWidget','EntityProperty'),
('CarouselWidget@StyleClass','zh-CN','自定义样式','CarouselWidget','EntityProperty'),
('CarouselWidget@Thumbnail','zh-CN','缩略图','CarouselWidget','EntityProperty'),
('CarouselWidget@Title','zh-CN','标题','CarouselWidget','EntityProperty'),
('CarouselWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CarouselWidget','EntityProperty'),
('CarouselWidget@WidgetName','zh-CN','组件名称','CarouselWidget','EntityProperty'),
('CarouselWidget@ZoneID','zh-CN','区域','CarouselWidget','EntityProperty'),
('Case Sensitivity','zh-CN','大小写',NULL,NULL),
('Cell phone','en-GB','Cell phone',NULL,NULL),
('Cell phone','en-US','Cell phone',NULL,NULL),
('Cell phone','zh-CN','手机',NULL,NULL),
('Center','en-GB','Center',NULL,NULL),
('Center','en-US','Center',NULL,NULL),
('Center','zh-CN','居中',NULL,NULL),
('Change Password','en-GB','Change Password',NULL,NULL),
('Change Password','en-US','Change Password',NULL,NULL),
('Change Password','zh-CN','修改密码',NULL,NULL),
('Chat Script','zh-CN','在线客服代码',NULL,NULL),
('Check','zh-CN','检查',NULL,NULL),
('Check Out','zh-CN','结 算',NULL,NULL),
('Check the email','zh-CN','查收邮件',NULL,NULL),
('Check your pages for SEO','zh-CN','扫描您的页面，我们将为您提供一些SEO优化建议：',NULL,NULL),
('Checkbox','zh-CN','复选框',NULL,NULL),
('Class prefix','zh-CN','类前缀',NULL,NULL),
('Click on the \"Thumbnails\" to preview. Click on \"Exit Theme Preview\" in the preview page to return to','en-GB','Click on the \"Thumbnails\" to preview. Click on \"Exit Theme Preview\" in the preview page to return to the page.',NULL,NULL),
('Click on the \"Thumbnails\" to preview. Click on \"Exit Theme Preview\" in the preview page to return to','en-US','Click on the \"Thumbnails\" to preview. Click on \"Exit Theme Preview\" in the preview page to return to the page.',NULL,NULL),
('Click on the \"Thumbnails\" to preview. Click on \"Exit Theme Preview\" in the preview page to return to','zh-CN','点击主题“缩略图”可进行进行预览，在预览页面右上角点击“退出主题预览”可回到该页面',NULL,NULL),
('Click the radio button to switch the theme','en-GB','Click the radio button to switch the theme',NULL,NULL),
('Click the radio button to switch the theme','en-US','Click the radio button to switch the theme',NULL,NULL),
('Click the radio button to switch the theme','zh-CN','点击单选框进行主题切换',NULL,NULL),
('Click to select','zh-CN','点击选择该区域',NULL,NULL),
('Close','en-GB','Close',NULL,NULL),
('Close','en-US','Close',NULL,NULL),
('Close','zh-CN','关闭',NULL,NULL),
('CMS Plugins','en-GB','Plugins',NULL,NULL),
('CMS Plugins','en-US','Plugins',NULL,NULL),
('CMS Plugins','zh-CN','扩展插件',NULL,NULL),
('Code','zh-CN','代码',NULL,NULL),
('Collapse','en-GB','Collapse',NULL,NULL),
('Collapse','en-US','Collapse',NULL,NULL),
('Collapse','zh-CN','收起',NULL,NULL),
('Collapse','zh-TW','收起',NULL,NULL),
('Collapsed to start, horizontal above breakpoints','zh-CN','开始是堆叠在一起的，当大于这些阈值时将变为水平排列',NULL,NULL),
('Color','zh-CN','颜色',NULL,NULL),
('Column','zh-CN','列',NULL,NULL),
('Column Width','en-GB','Column',NULL,NULL),
('Column Width','en-US','Column',NULL,NULL),
('Column Width','zh-CN','列宽',NULL,NULL),
('Columns','zh-CN','列数',NULL,NULL),
('Comment Box','en-GB','Comment Box',NULL,NULL),
('Comment Box','en-US','Comment Box',NULL,NULL),
('Comment Box','zh-CN','评论箱',NULL,NULL),
('Comments','zh-CN','评论',NULL,NULL),
('Comments@ActionType','zh-CN','ActionType','Comments','EntityProperty'),
('Comments@Agrees','zh-CN','赞同数','Comments','EntityProperty'),
('Comments@CommentContent','en-GB','Comment Content','Comments','EntityProperty'),
('Comments@CommentContent','en-US','Comment Content','Comments','EntityProperty'),
('Comments@CommentContent','zh-CN','评论内容','Comments','EntityProperty'),
('Comments@CreateBy','zh-CN','CreateBy','Comments','EntityProperty'),
('Comments@CreatebyName','en-GB','Create By','Comments','EntityProperty'),
('Comments@CreatebyName','en-US','Create By','Comments','EntityProperty'),
('Comments@CreatebyName','zh-CN','创建人','Comments','EntityProperty'),
('Comments@CreateDate','en-GB','Create Date','Comments','EntityProperty'),
('Comments@CreateDate','en-US','Create Date','Comments','EntityProperty'),
('Comments@CreateDate','zh-CN','创建日期','Comments','EntityProperty'),
('Comments@Description','zh-CN','描述','Comments','EntityProperty'),
('Comments@Disagrees','zh-CN','反对数','Comments','EntityProperty'),
('Comments@ID','zh-CN','ID','Comments','EntityProperty'),
('Comments@LastUpdateBy','zh-CN','LastUpdateBy','Comments','EntityProperty'),
('Comments@LastUpdateByName','en-GB','Last Update By','Comments','EntityProperty'),
('Comments@LastUpdateByName','en-US','Last Update By','Comments','EntityProperty'),
('Comments@LastUpdateByName','zh-CN','更新人','Comments','EntityProperty'),
('Comments@LastUpdateDate','en-GB','Last Update Date','Comments','EntityProperty'),
('Comments@LastUpdateDate','en-US','Last Update Date','Comments','EntityProperty'),
('Comments@LastUpdateDate','zh-CN','更新日期','Comments','EntityProperty'),
('Comments@PagePath','zh-CN','页面地址','Comments','EntityProperty'),
('Comments@Picture','zh-CN','Picture','Comments','EntityProperty'),
('Comments@Status','en-GB','Status','Comments','EntityProperty'),
('Comments@Status','en-US','Status','Comments','EntityProperty'),
('Comments@Status','zh-CN','状态','Comments','EntityProperty'),
('Comments@Title','en-GB','Title','Comments','EntityProperty'),
('Comments@Title','en-US','Title','Comments','EntityProperty'),
('Comments@Title','zh-CN','标题','Comments','EntityProperty'),
('Comments@UserId','zh-CN','登录名','Comments','EntityProperty'),
('Comments@UserName','zh-CN','用户名','Comments','EntityProperty'),
('CommentsWidget@ActionType','zh-CN','ActionType','CommentsWidget','EntityProperty'),
('CommentsWidget@AssemblyName','zh-CN','AssemblyName','CommentsWidget','EntityProperty'),
('CommentsWidget@CreateBy','zh-CN','CreateBy','CommentsWidget','EntityProperty'),
('CommentsWidget@CreatebyName','zh-CN','创建人','CommentsWidget','EntityProperty'),
('CommentsWidget@CreateDate','zh-CN','创建日期','CommentsWidget','EntityProperty'),
('CommentsWidget@CustomClass','zh-CN','CustomClass','CommentsWidget','EntityProperty'),
('CommentsWidget@CustomStyle','zh-CN','CustomStyle','CommentsWidget','EntityProperty'),
('CommentsWidget@Description','zh-CN','描述','CommentsWidget','EntityProperty'),
('CommentsWidget@ExtendData','zh-CN','ExtendData','CommentsWidget','EntityProperty'),
('CommentsWidget@FormView','zh-CN','FormView','CommentsWidget','EntityProperty'),
('CommentsWidget@ID','zh-CN','ID','CommentsWidget','EntityProperty'),
('CommentsWidget@IsSystem','zh-CN','IsSystem','CommentsWidget','EntityProperty'),
('CommentsWidget@IsTemplate','zh-CN','保存为模板','CommentsWidget','EntityProperty'),
('CommentsWidget@LastUpdateBy','zh-CN','LastUpdateBy','CommentsWidget','EntityProperty'),
('CommentsWidget@LastUpdateByName','zh-CN','更新人','CommentsWidget','EntityProperty'),
('CommentsWidget@LastUpdateDate','zh-CN','更新日期','CommentsWidget','EntityProperty'),
('CommentsWidget@LayoutID','zh-CN','LayoutID','CommentsWidget','EntityProperty'),
('CommentsWidget@PageID','zh-CN','PageID','CommentsWidget','EntityProperty'),
('CommentsWidget@PartialView','zh-CN','显示模板','CommentsWidget','EntityProperty'),
('CommentsWidget@Position','zh-CN','排序','CommentsWidget','EntityProperty'),
('CommentsWidget@ServiceTypeName','zh-CN','ServiceTypeName','CommentsWidget','EntityProperty'),
('CommentsWidget@Status','zh-CN','状态','CommentsWidget','EntityProperty'),
('CommentsWidget@StyleClass','zh-CN','自定义样式','CommentsWidget','EntityProperty'),
('CommentsWidget@Thumbnail','zh-CN','缩略图','CommentsWidget','EntityProperty'),
('CommentsWidget@Title','zh-CN','标题','CommentsWidget','EntityProperty'),
('CommentsWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CommentsWidget','EntityProperty'),
('CommentsWidget@WidgetName','zh-CN','组件名称','CommentsWidget','EntityProperty'),
('CommentsWidget@ZoneID','zh-CN','区域','CommentsWidget','EntityProperty'),
('commit','en-GB','Comment',NULL,NULL),
('commit','en-US','Comment',NULL,NULL),
('commit','zh-CN','评论',NULL,NULL),
('Company News','zh-CN','公司新闻',NULL,NULL),
('Completed updating the index','zh-CN','完成更新索引',NULL,NULL),
('Confirm Password','en-GB','Confirm Password',NULL,NULL),
('Confirm Password','en-US','Confirm Password',NULL,NULL),
('Confirm Password','zh-CN','确认密码',NULL,NULL),
('Contact','zh-CN','联系人',NULL,NULL),
('Contact/Consignee','zh-CN','联系人/收货人',NULL,NULL),
('contain','zh-CN','容纳',NULL,NULL),
('Container','en-GB','Container',NULL,NULL),
('Container','en-US','Container',NULL,NULL),
('Container','zh-CN','容器',NULL,NULL),
('Contains','en-GB','Contains',NULL,NULL),
('Contains','en-US','Contains',NULL,NULL),
('Contains','zh-CN','包含',NULL,NULL),
('Content','en-GB','Content',NULL,NULL),
('Content','en-US','Content',NULL,NULL),
('Content','zh-CN','内容',NULL,NULL),
('Content Category','en-GB','Content Category',NULL,NULL),
('Content Category','en-US','Content Category',NULL,NULL),
('Content Category','zh-CN','内容类型',NULL,NULL),
('ContentField@FieldType','zh-CN','字段类型','ContentField','EntityProperty'),
('ContentField@Name','zh-CN','属性名','ContentField','EntityProperty'),
('ContentField@Order','zh-CN','订单','ContentField','EntityProperty'),
('ContentField@Status','en-GB','Status','ContentField','EntityProperty'),
('ContentField@Status','en-US','Status','ContentField','EntityProperty'),
('ContentField@Title','zh-CN','显示名称','ContentField','EntityProperty'),
('ContentTemplate@CreatebyName','en-GB','Create By','ContentTemplate','EntityProperty'),
('ContentTemplate@CreatebyName','en-US','Create By','ContentTemplate','EntityProperty'),
('ContentTemplate@CreatebyName','zh-CN','创建人','ContentTemplate','EntityProperty'),
('ContentTemplate@CreateDate','en-GB','Create Date','ContentTemplate','EntityProperty'),
('ContentTemplate@CreateDate','en-US','Create Date','ContentTemplate','EntityProperty'),
('ContentTemplate@CreateDate','zh-CN','创建日期','ContentTemplate','EntityProperty'),
('ContentTemplate@Description','en-GB','Description','ContentTemplate','EntityProperty'),
('ContentTemplate@Description','en-US','Description','ContentTemplate','EntityProperty'),
('ContentTemplate@LastUpdateByName','en-GB','Last Update By','ContentTemplate','EntityProperty'),
('ContentTemplate@LastUpdateByName','en-US','Last Update By','ContentTemplate','EntityProperty'),
('ContentTemplate@LastUpdateByName','zh-CN','更新人','ContentTemplate','EntityProperty'),
('ContentTemplate@LastUpdateDate','en-GB','Last Update Date','ContentTemplate','EntityProperty'),
('ContentTemplate@LastUpdateDate','en-US','Last Update Date','ContentTemplate','EntityProperty'),
('ContentTemplate@LastUpdateDate','zh-CN','更新日期','ContentTemplate','EntityProperty'),
('ContentTemplate@Status','en-GB','Status','ContentTemplate','EntityProperty'),
('ContentTemplate@Status','en-US','Status','ContentTemplate','EntityProperty'),
('ContentTemplate@Status','zh-CN','状态','ContentTemplate','EntityProperty'),
('ContentTemplate@Template','zh-CN','模板代码','ContentTemplate','EntityProperty'),
('ContentTemplate@Title','en-GB','Title','ContentTemplate','EntityProperty'),
('ContentTemplate@Title','en-US','Title','ContentTemplate','EntityProperty'),
('ContentTemplate@Title','zh-CN','标题','ContentTemplate','EntityProperty'),
('ContentType@CreatebyName','en-GB','Create By','ContentType','EntityProperty'),
('ContentType@CreatebyName','en-US','Create By','ContentType','EntityProperty'),
('ContentType@CreatebyName','zh-CN','创建人','ContentType','EntityProperty'),
('ContentType@CreateDate','en-GB','Create Date','ContentType','EntityProperty'),
('ContentType@CreateDate','en-US','Create Date','ContentType','EntityProperty'),
('ContentType@CreateDate','zh-CN','创建日期','ContentType','EntityProperty'),
('ContentType@Description','en-GB','Description','ContentType','EntityProperty'),
('ContentType@Description','en-US','Description','ContentType','EntityProperty'),
('ContentType@Description','zh-CN','描述','ContentType','EntityProperty'),
('ContentType@Fields','zh-CN','字段','ContentType','EntityProperty'),
('ContentType@ID','zh-CN','ID','ContentType','EntityProperty'),
('ContentType@LastUpdateByName','en-GB','Last Update By','ContentType','EntityProperty'),
('ContentType@LastUpdateByName','en-US','Last Update By','ContentType','EntityProperty'),
('ContentType@LastUpdateByName','zh-CN','更新人','ContentType','EntityProperty'),
('ContentType@LastUpdateDate','en-GB','Last Update Date','ContentType','EntityProperty'),
('ContentType@LastUpdateDate','en-US','Last Update Date','ContentType','EntityProperty'),
('ContentType@LastUpdateDate','zh-CN','更新日期','ContentType','EntityProperty'),
('ContentType@Status','en-GB','Status','ContentType','EntityProperty'),
('ContentType@Status','en-US','Status','ContentType','EntityProperty'),
('ContentType@Status','zh-CN','状态','ContentType','EntityProperty'),
('ContentType@Title','en-GB','Title','ContentType','EntityProperty'),
('ContentType@Title','en-US','Title','ContentType','EntityProperty'),
('ContentType@Title','zh-CN','标题','ContentType','EntityProperty'),
('ContentValue@ContentTypeID','zh-CN','Content Type','ContentValue','EntityProperty'),
('ContentValue@CreatebyName','en-US','Create By',NULL,NULL),
('ContentValue@CreatebyName','zh-CN','创建人','ContentValue','EntityProperty'),
('ContentValue@CreateDate','en-US','Create Date',NULL,NULL),
('ContentValue@CreateDate','zh-CN','创建日期','ContentValue','EntityProperty'),
('ContentValue@Description','zh-CN','描述','ContentValue','EntityProperty'),
('ContentValue@ID','zh-CN','ID','ContentValue','EntityProperty'),
('ContentValue@LastUpdateByName','en-US','Update By',NULL,NULL),
('ContentValue@LastUpdateByName','zh-CN','更新人','ContentValue','EntityProperty'),
('ContentValue@LastUpdateDate','en-US','Last Update Date',NULL,NULL),
('ContentValue@LastUpdateDate','zh-CN','更新日期','ContentValue','EntityProperty'),
('ContentValue@SEODescription','en-US','SEO Description',NULL,NULL),
('ContentValue@SEODescription','zh-CN','SEO描述','ContentValue','EntityProperty'),
('ContentValue@SEOKeyWord','en-US','SEO Keyword',NULL,NULL),
('ContentValue@SEOKeyWord','zh-CN','SEO关键字','ContentValue','EntityProperty'),
('ContentValue@SEOTitle','en-US','SEO Title',NULL,NULL),
('ContentValue@SEOTitle','zh-CN','SEO标题','ContentValue','EntityProperty'),
('ContentValue@Status','en-US','Status','ContentValue','EntityProperty'),
('ContentValue@Status','zh-CN','状态','ContentValue','EntityProperty'),
('ContentValue@Title','en-US','Title','ContentValue','EntityProperty'),
('ContentValue@Title','zh-CN','标题','ContentValue','EntityProperty'),
('ContentValue@Url','zh-CN','Url','ContentValue','EntityProperty'),
('Context Menu','en-GB','Menu',NULL,NULL),
('Context Menu','en-US','Menu',NULL,NULL),
('Context Menu','zh-CN','右键菜单',NULL,NULL),
('Continue','zh-CN','继续',NULL,NULL),
('Copy','en-GB','Copy',NULL,NULL),
('Copy','en-US','Copy',NULL,NULL),
('Copy','zh-CN','复制',NULL,NULL),
('Copy from page','zh-CN','从现有页面复制',NULL,NULL),
('cover','zh-CN','覆盖',NULL,NULL),
('Create page from template','zh-CN','从模板中快速创建页面',NULL,NULL),
('Crosshair','zh-CN','十字',NULL,NULL),
('Culture@CreatebyName','zh-CN','创建人','Culture','EntityProperty'),
('Culture@CreateDate','zh-CN','创建日期','Culture','EntityProperty'),
('Culture@CultureCode','zh-CN','语言缩写','Culture','EntityProperty'),
('Culture@CultureID','zh-CN','CultureID','Culture','EntityProperty'),
('Culture@Description','zh-CN','描述','Culture','EntityProperty'),
('Culture@DisplayName','zh-CN','显示名称','Culture','EntityProperty'),
('Culture@Domain','zh-CN','域名','Culture','EntityProperty'),
('Culture@EnglishName','zh-CN','英文名','Culture','EntityProperty'),
('Culture@Flag','zh-CN','旗帜','Culture','EntityProperty'),
('Culture@LastUpdateByName','zh-CN','更新人','Culture','EntityProperty'),
('Culture@LastUpdateDate','zh-CN','更新日期','Culture','EntityProperty'),
('Culture@LCID','zh-CN','LCID','Culture','EntityProperty'),
('Culture@Status','zh-CN','状态','Culture','EntityProperty'),
('Culture@Title','zh-CN','标题','Culture','EntityProperty'),
('Culture@UrlCode','zh-CN','Url缩写','Culture','EntityProperty'),
('CultureSetting@CultureMode','en-GB','Culture Mode','CultureSetting','EntityProperty'),
('CultureSetting@CultureMode','en-US','Culture Mode','CultureSetting','EntityProperty'),
('CultureSetting@CultureMode','zh-CN','多语言模式','CultureSetting','EntityProperty'),
('CultureSetting@DefaultCulture','en-GB','Default Culture','CultureSetting','EntityProperty'),
('CultureSetting@DefaultCulture','en-US','Default Culture','CultureSetting','EntityProperty'),
('CultureSetting@DefaultCulture','zh-CN','默认语言','CultureSetting','EntityProperty'),
('CultureSetting@IsEnable','en-GB','Is Enable','CultureSetting','EntityProperty'),
('CultureSetting@IsEnable','en-US','Is Enable','CultureSetting','EntityProperty'),
('CultureSetting@IsEnable','zh-CN','是否启用？','CultureSetting','EntityProperty'),
('CultureSetting@IsShowDefault','en-GB','Is Show Default','CultureSetting','EntityProperty'),
('CultureSetting@IsShowDefault','en-US','Is Show Default','CultureSetting','EntityProperty'),
('CultureSetting@IsShowDefault','zh-CN','无内容时使用默认语言？','CultureSetting','EntityProperty'),
('Current','zh-CN','当前',NULL,NULL),
('Current password error.','zh-CN','当前密码错误',NULL,NULL),
('Custom','zh-CN','自定义',NULL,NULL),
('Custom Fields','zh-CN','自定义字段',NULL,NULL),
('Custom Rule','en-GB','Rule',NULL,NULL),
('Custom Rule','en-US','Rule',NULL,NULL),
('Custom Rule','zh-CN','定义条件',NULL,NULL),
('Customer','zh-CN','前端用户',NULL,NULL),
('Danger','zh-CN','危险',NULL,NULL),
('Dashed','zh-CN','虚线',NULL,NULL),
('Data Source','en-GB','Data Source',NULL,NULL),
('Data Source','en-US','Data Source',NULL,NULL),
('Data Source','zh-CN','内容来源',NULL,NULL),
('Database Cache','zh-CN','数据库缓存',NULL,NULL),
('DataDictionaryEntity@CreateBy','zh-CN','CreateBy','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@CreatebyName','zh-CN','创建人','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@CreateDate','zh-CN','创建日期','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@Description','zh-CN','描述','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@DicName','zh-CN','DicName','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@DicValue','zh-CN','DicValue','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@ID','zh-CN','ID','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@ImageThumbUrl','zh-CN','缩略图','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@ImageUrl','zh-CN','图片','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@IsSystem','zh-CN','IsSystem','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@LastUpdateBy','zh-CN','LastUpdateBy','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@LastUpdateByName','zh-CN','更新人','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@LastUpdateDate','zh-CN','更新日期','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@Order','zh-CN','排序','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@Pid','zh-CN','Pid','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@Status','zh-CN','状态','DataDictionaryEntity','EntityProperty'),
('DataDictionaryEntity@Title','zh-CN','标题','DataDictionaryEntity','EntityProperty'),
('Date','zh-CN','日期',NULL,NULL),
('Ddashboard','en-GB','Dashboard',NULL,NULL),
('Ddashboard','en-US','Dashboard',NULL,NULL),
('Ddashboard','zh-CN','仪表盘',NULL,NULL),
('Decoration','zh-CN','修饰',NULL,NULL),
('Default','zh-CN','默认',NULL,NULL),
('Delete','en-GB','Delete',NULL,NULL),
('Delete','en-US','Delete',NULL,NULL),
('Delete','zh-CN','删除',NULL,NULL),
('Delete Current Group','zh-CN','删除当前组',NULL,NULL),
('Delete?','en-GB','Delete?',NULL,NULL),
('Delete?','en-US','Delete?',NULL,NULL),
('Delete?','zh-CN','确定删除?',NULL,NULL),
('Demo Video','en-GB','Videos',NULL,NULL),
('Demo Video','en-US','Videos',NULL,NULL),
('Demo Video','zh-CN','演示视频',NULL,NULL),
('Description','en-GB','Description',NULL,NULL),
('Description','en-US','Description',NULL,NULL),
('Description','zh-CN','描述',NULL,NULL),
('Design','en-GB','Design',NULL,NULL),
('Design','en-US','Design',NULL,NULL),
('Design','zh-CN','设计',NULL,NULL),
('Desktop (≥1200px)','zh-CN','大桌面显示器 (≥1200px)',NULL,NULL),
('Desktop (≥992px)','zh-CN','桌面显示器 (≥992px)',NULL,NULL),
('Display Contents','en-GB','Contents',NULL,NULL),
('Display Contents','en-US','Contents',NULL,NULL),
('Display Contents','zh-CN','显示内容',NULL,NULL),
('Display in page','en-GB','Display in page',NULL,NULL),
('Display in page','en-US','Display in page',NULL,NULL),
('Display in page','zh-CN','页面展现的内容',NULL,NULL),
('Display Template','en-GB','Display Template',NULL,NULL),
('Display Template','en-US','Display Template',NULL,NULL),
('Display Template','zh-CN','显示模板',NULL,NULL),
('Do you want to delete?','zh-CN','确定要删除吗？',NULL,NULL),
('Do you want to publish?','zh-CN','确定要发布吗？',NULL,NULL),
('Do you want to refund?','zh-CN','确定要退款吗？',NULL,NULL),
('Do you want to revert to this version?','zh-CN','确定要撤回到该版本吗？',NULL,NULL),
('Document','en-GB','Document',NULL,NULL),
('Document','en-US','Document',NULL,NULL),
('Document','zh-CN','文档',NULL,NULL),
('Donate','en-GB','Donate',NULL,NULL),
('Donate','en-US','Donate',NULL,NULL),
('Donate','zh-CN','赞助',NULL,NULL),
('Dotted','zh-CN','点划线',NULL,NULL),
('Double','zh-CN','双线',NULL,NULL),
('Download','zh-CN','下载',NULL,NULL),
('Download Sections','en-GB','Sections',NULL,NULL),
('Download Sections','en-US','Sections',NULL,NULL),
('Download Sections','zh-CN','下载板块',NULL,NULL),
('Download Theme','en-GB','Download',NULL,NULL),
('Download Theme','en-US','Download',NULL,NULL),
('Download Theme','zh-CN','下载更多主题',NULL,NULL),
('Download Themes','en-GB','Themes',NULL,NULL),
('Download Themes','en-US','Themes',NULL,NULL),
('Download Themes','zh-CN','下载主题',NULL,NULL),
('Drag','en-GB','Drag',NULL,NULL),
('Drag','en-US','Drag',NULL,NULL),
('Drag','zh-CN','拖动',NULL,NULL),
('Drag to container','zh-CN','点击拖动到容器',NULL,NULL),
('Drag to layout','zh-CN','点击拖动到主屏幕',NULL,NULL),
('Drag to row','zh-CN','点击拖动到行',NULL,NULL),
('Dropdown','zh-CN','下拉菜单',NULL,NULL),
('Dynamic','en-GB','Dynamic',NULL,NULL),
('Dynamic','en-US','Dynamic',NULL,NULL),
('Dynamic','zh-CN','动态',NULL,NULL),
('E-commerce','en-GB','E-commerce',NULL,NULL),
('E-commerce','en-US','E-commerce',NULL,NULL),
('E-commerce','zh-CN','电子商务',NULL,NULL),
('Edit','en-GB','Edit',NULL,NULL),
('Edit','en-US','Edit',NULL,NULL),
('Edit','zh-CN','编辑',NULL,NULL),
('Edit Chat Script','zh-CN','设置在线客服代码',NULL,NULL),
('Edit Content','en-GB','Edit',NULL,NULL),
('Edit Content','en-US','Edit',NULL,NULL),
('Edit Content','zh-CN','编辑内容',NULL,NULL),
('Edit Layout','en-GB','Layout',NULL,NULL),
('Edit Layout','en-US','Layout',NULL,NULL),
('Edit Layout','zh-CN','编辑布局',NULL,NULL),
('Edit Page','en-GB','Page',NULL,NULL),
('Edit Page','en-US','Page',NULL,NULL),
('Edit Page','zh-CN','编辑页面',NULL,NULL),
('Edit Pixel Script','zh-CN','设置访客统计代码',NULL,NULL),
('Edit settings','en-GB','Edit',NULL,NULL),
('Edit settings','en-US','Edit',NULL,NULL),
('Edit settings','zh-CN','编辑设置',NULL,NULL),
('Edit Template','zh-CN','编辑模板',NULL,NULL),
('Edit: Design page','en-GB','Edit: Design page',NULL,NULL),
('Edit: Design page','en-US','Edit: Design page',NULL,NULL),
('Edit: Design page','zh-CN','编辑：进入页面的设计模式，编辑内容',NULL,NULL),
('Email','en-GB','Email',NULL,NULL),
('Email','en-US','Email',NULL,NULL),
('Email','zh-CN','邮箱',NULL,NULL),
('Email is incorrect','zh-CN','邮箱地址格式不正确',NULL,NULL),
('Ends With','en-GB','Ends With',NULL,NULL),
('Ends With','en-US','Ends With',NULL,NULL),
('Ends With','zh-CN','以...结尾',NULL,NULL),
('Enter a URL address to check, such as: /about/zkeacms','zh-CN','输入一个Url地址进行检查，如：/about/zkeacms',NULL,NULL),
('Enter keyworkds to search...','zh-CN','输入关键字进行搜索...',NULL,NULL),
('Enter the keywords to search','zh-CN','输入关键字进行搜索',NULL,NULL),
('Enter your Email','zh-CN','请输入您的邮箱',NULL,NULL),
('Enter your new password','zh-CN','输入新密码',NULL,NULL),
('Enter your password','en-GB','Enter your password',NULL,NULL),
('Enter your password','en-US','Enter your password',NULL,NULL),
('Enter your password','zh-CN','输入密码',NULL,NULL),
('Enter zone name','zh-CN','输入区域名称',NULL,NULL),
('Enterprise','en-GB','Enterprise',NULL,NULL),
('Enterprise','en-US','Enterprise',NULL,NULL),
('Enterprise','zh-CN','企业版',NULL,NULL),
('Enterprise','zh-TW','企業版',NULL,NULL),
('Equals','en-GB','Equals',NULL,NULL),
('Equals','en-US','Equals',NULL,NULL),
('Equals','zh-CN','等于',NULL,NULL),
('e-resize','zh-CN','向右改变大小',NULL,NULL),
('Error!','zh-CN','错误！',NULL,NULL),
('Everything goes well.','zh-CN','一切都很好。',NULL,NULL),
('Example','zh-CN','示例',NULL,NULL),
('Explanation','en-GB','Explanation',NULL,NULL),
('Explanation','en-US','Explanation',NULL,NULL),
('Explanation','zh-CN','说明',NULL,NULL),
('Export All Data','zh-CN','导出所有数据',NULL,NULL),
('Export Excel','zh-CN','导出Excel',NULL,NULL),
('Export Form Data','zh-CN','导出表单数据',NULL,NULL),
('ExtendFieldEntity@ActionType','zh-CN','ActionType','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@CreateBy','zh-CN','CreateBy','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@CreatebyName','zh-CN','创建人','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@CreateDate','zh-CN','创建日期','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@Description','zh-CN','描述','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@ID','zh-CN','ID','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@LastUpdateBy','zh-CN','LastUpdateBy','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@LastUpdateByName','zh-CN','更新人','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@LastUpdateDate','zh-CN','更新日期','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@OwnerID','zh-CN','OwnerID','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@OwnerModule','zh-CN','OwnerModule','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@Status','zh-CN','状态','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@Title','zh-CN','名称','ExtendFieldEntity','EntityProperty'),
('ExtendFieldEntity@Value','zh-CN','值','ExtendFieldEntity','EntityProperty'),
('Female','en-GB','Female',NULL,NULL),
('Female','en-US','Female',NULL,NULL),
('Female','zh-CN','女',NULL,NULL),
('Field Name','en-GB','Name',NULL,NULL),
('Field Name','en-US','Name',NULL,NULL),
('Field Name','zh-CN','属性名',NULL,NULL),
('Field Setting','zh-CN','字段设置',NULL,NULL),
('Fields','zh-CN','选择字段',NULL,NULL),
('File Cache','zh-CN','文件缓存',NULL,NULL),
('Fixed','zh-CN','固定',NULL,NULL),
('Fixed Width','zh-CN','定宽',NULL,NULL),
('Float','zh-CN','浮动',NULL,NULL),
('Float Left','zh-CN','左浮动',NULL,NULL),
('Float Right','zh-CN','右浮动',NULL,NULL),
('Fluid Content','en-GB','Fluid Content',NULL,NULL),
('Fluid Content','en-US','Fluid Content',NULL,NULL),
('Fluid Content','zh-CN','自定义内容',NULL,NULL),
('Fluid Content List','en-GB','Fluid Content List',NULL,NULL),
('Fluid Content List','en-US','Fluid Content List',NULL,NULL),
('Fluid Content List','zh-CN','自定义内容列表',NULL,NULL),
('FluidContentListWidget@AssemblyName','zh-CN','Assembly Name','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@ContentTemplateID','zh-CN','显示模板','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@ContentTypeID','zh-CN','自定义内容类型','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@DetailPageUrl','zh-CN','详细页面','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@IsPageable','zh-CN','分页?','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@IsSystem','zh-CN','Is System','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@IsTemplate','zh-CN','保存为模板','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@PageSize','zh-CN','分页大小','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@Position','zh-CN','排序','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@ServiceTypeName','zh-CN','Service Type Name','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@StyleClass','zh-CN','自定义样式','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@Thumbnail','zh-CN','缩略图','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@Title','zh-CN','标题','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@ViewModelTypeName','zh-CN','View Model Type Name','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@WidgetName','zh-CN','组件名称','FluidContentListWidget','EntityProperty'),
('FluidContentListWidget@ZoneID','zh-CN','区域','FluidContentListWidget','EntityProperty'),
('FluidContentWidget@AssemblyName','zh-CN','Assembly Name','FluidContentWidget','EntityProperty'),
('FluidContentWidget@ContentTemplateID','zh-CN','显示模板','FluidContentWidget','EntityProperty'),
('FluidContentWidget@ContentValueID','zh-CN','自定义内容','FluidContentWidget','EntityProperty'),
('FluidContentWidget@IsSupportQueryID','zh-CN','动态内容','FluidContentWidget','EntityProperty'),
('FluidContentWidget@IsSystem','zh-CN','Is System','FluidContentWidget','EntityProperty'),
('FluidContentWidget@IsTemplate','zh-CN','保存为模板','FluidContentWidget','EntityProperty'),
('FluidContentWidget@PartialView','zh-CN','显示模板','FluidContentWidget','EntityProperty'),
('FluidContentWidget@Position','zh-CN','排序','FluidContentWidget','EntityProperty'),
('FluidContentWidget@ServiceTypeName','zh-CN','Service Type Name','FluidContentWidget','EntityProperty'),
('FluidContentWidget@StyleClass','zh-CN','自定义样式','FluidContentWidget','EntityProperty'),
('FluidContentWidget@Thumbnail','zh-CN','缩略图','FluidContentWidget','EntityProperty'),
('FluidContentWidget@Title','zh-CN','标题','FluidContentWidget','EntityProperty'),
('FluidContentWidget@ViewModelTypeName','zh-CN','View Model Type Name','FluidContentWidget','EntityProperty'),
('FluidContentWidget@WidgetName','zh-CN','组件名称','FluidContentWidget','EntityProperty'),
('FluidContentWidget@ZoneID','zh-CN','区域','FluidContentWidget','EntityProperty'),
('Fobidden','zh-CN','没有权限',NULL,NULL),
('Font','zh-CN','字体',NULL,NULL),
('Font Size','zh-CN','字体大小',NULL,NULL),
('Font Variant','zh-CN','字体变形',NULL,NULL),
('Font Weight','zh-CN','字体粗细',NULL,NULL),
('Forgot your password?','en-GB','Forgot your password?',NULL,NULL),
('Forgot your password?','en-US','Forgot your password?',NULL,NULL),
('Forgot your password?','zh-CN','忘记密码？',NULL,NULL),
('Forgotten password','zh-CN','找回密码',NULL,NULL),
('Form','en-GB','Form',NULL,NULL),
('Form','en-US','Form',NULL,NULL),
('Form','zh-CN','表单',NULL,NULL),
('Form Data','en-GB','Form Data',NULL,NULL),
('Form Data','en-US','Form Data',NULL,NULL),
('Form Data','zh-CN','表单数据',NULL,NULL),
('Form Generator','en-GB','Form Generator',NULL,NULL),
('Form Generator','en-US','Form Generator',NULL,NULL),
('Form Generator','zh-CN','自定义表单',NULL,NULL),
('Form have submited','zh-CN','表单提交成功',NULL,NULL),
('Form@ActionType','zh-CN','ActionType','Form','EntityProperty'),
('Form@CreateBy','zh-CN','CreateBy','Form','EntityProperty'),
('Form@CreatebyName','en-GB','Create By','Form','EntityProperty'),
('Form@CreatebyName','en-US','Create By','Form','EntityProperty'),
('Form@CreatebyName','zh-CN','创建人','Form','EntityProperty'),
('Form@CreateDate','en-GB','Create Date','Form','EntityProperty'),
('Form@CreateDate','en-US','Create Date','Form','EntityProperty'),
('Form@CreateDate','zh-CN','创建日期','Form','EntityProperty'),
('Form@Description','zh-CN','描述','Form','EntityProperty'),
('Form@FieldsData','zh-CN','FieldsData','Form','EntityProperty'),
('Form@FormFields','zh-CN','FormFields','Form','EntityProperty'),
('Form@ID','zh-CN','ID','Form','EntityProperty'),
('Form@LastUpdateBy','zh-CN','LastUpdateBy','Form','EntityProperty'),
('Form@LastUpdateByName','en-GB','Last Update By','Form','EntityProperty'),
('Form@LastUpdateByName','en-US','Last Update By','Form','EntityProperty'),
('Form@LastUpdateByName','zh-CN','更新人','Form','EntityProperty'),
('Form@LastUpdateDate','en-GB','Last Update Date','Form','EntityProperty'),
('Form@LastUpdateDate','en-US','Last Update Date','Form','EntityProperty'),
('Form@LastUpdateDate','zh-CN','更新日期','Form','EntityProperty'),
('Form@Status','zh-CN','状态','Form','EntityProperty'),
('Form@Title','en-GB','Title','Form','EntityProperty'),
('Form@Title','en-US','Title','Form','EntityProperty'),
('Form@Title','zh-CN','标题','Form','EntityProperty'),
('FormData@ActionType','zh-CN','ActionType','FormData','EntityProperty'),
('FormData@CreateBy','zh-CN','CreateBy','FormData','EntityProperty'),
('FormData@CreatebyName','en-GB','Create By','FormData','EntityProperty'),
('FormData@CreatebyName','en-US','Create By','FormData','EntityProperty'),
('FormData@CreatebyName','zh-CN','创建人','FormData','EntityProperty'),
('FormData@CreateDate','en-GB','Create Date','FormData','EntityProperty'),
('FormData@CreateDate','en-US','Create Date','FormData','EntityProperty'),
('FormData@CreateDate','zh-CN','创建日期','FormData','EntityProperty'),
('FormData@Datas','zh-CN','Datas','FormData','EntityProperty'),
('FormData@Description','zh-CN','描述','FormData','EntityProperty'),
('FormData@Form','zh-CN','Form','FormData','EntityProperty'),
('FormData@FormId','en-GB','Form','FormData','EntityProperty'),
('FormData@FormId','en-US','Form','FormData','EntityProperty'),
('FormData@FormId','zh-CN','表单','FormWidget','EntityProperty'),
('FormData@ID','zh-CN','ID','FormData','EntityProperty'),
('FormData@LastUpdateBy','zh-CN','LastUpdateBy','FormData','EntityProperty'),
('FormData@LastUpdateByName','en-GB','Last Update By','FormData','EntityProperty'),
('FormData@LastUpdateByName','en-US','Last Update By','FormData','EntityProperty'),
('FormData@LastUpdateByName','zh-CN','更新人','FormData','EntityProperty'),
('FormData@LastUpdateDate','en-GB','Last Update Date','FormData','EntityProperty'),
('FormData@LastUpdateDate','en-US','Last Update Date','FormData','EntityProperty'),
('FormData@LastUpdateDate','zh-CN','更新日期','FormData','EntityProperty'),
('FormData@Status','zh-CN','状态','FormData','EntityProperty'),
('FormData@Title','en-GB','Title','FormData','EntityProperty'),
('FormData@Title','en-US','Title','FormData','EntityProperty'),
('FormData@Title','zh-CN','标题','FormData','EntityProperty'),
('FormWidget@ActionType','zh-CN','ActionType','FormWidget','EntityProperty'),
('FormWidget@AssemblyName','zh-CN','AssemblyName','FormWidget','EntityProperty'),
('FormWidget@CreateBy','zh-CN','CreateBy','FormWidget','EntityProperty'),
('FormWidget@CreatebyName','zh-CN','创建人','FormWidget','EntityProperty'),
('FormWidget@CreateDate','zh-CN','创建日期','FormWidget','EntityProperty'),
('FormWidget@CustomClass','zh-CN','CustomClass','FormWidget','EntityProperty'),
('FormWidget@CustomStyle','zh-CN','CustomStyle','FormWidget','EntityProperty'),
('FormWidget@Description','zh-CN','描述','FormWidget','EntityProperty'),
('FormWidget@ExtendData','zh-CN','ExtendData','FormWidget','EntityProperty'),
('FormWidget@FormID','zh-CN','表单','FormWidget','EntityProperty'),
('FormWidget@FormView','zh-CN','FormView','FormWidget','EntityProperty'),
('FormWidget@ID','zh-CN','ID','FormWidget','EntityProperty'),
('FormWidget@IsSystem','zh-CN','IsSystem','FormWidget','EntityProperty'),
('FormWidget@IsTemplate','zh-CN','保存为模板','FormWidget','EntityProperty'),
('FormWidget@LastUpdateBy','zh-CN','LastUpdateBy','FormWidget','EntityProperty'),
('FormWidget@LastUpdateByName','zh-CN','更新人','FormWidget','EntityProperty'),
('FormWidget@LastUpdateDate','zh-CN','更新日期','FormWidget','EntityProperty'),
('FormWidget@LayoutID','zh-CN','LayoutID','FormWidget','EntityProperty'),
('FormWidget@PageID','zh-CN','PageID','FormWidget','EntityProperty'),
('FormWidget@PartialView','zh-CN','显示模板','FormWidget','EntityProperty'),
('FormWidget@Position','zh-CN','排序','FormWidget','EntityProperty'),
('FormWidget@ServiceTypeName','zh-CN','ServiceTypeName','FormWidget','EntityProperty'),
('FormWidget@Status','zh-CN','状态','FormWidget','EntityProperty'),
('FormWidget@StyleClass','zh-CN','自定义样式','FormWidget','EntityProperty'),
('FormWidget@Thumbnail','zh-CN','缩略图','FormWidget','EntityProperty'),
('FormWidget@Title','zh-CN','标题','FormWidget','EntityProperty'),
('FormWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','FormWidget','EntityProperty'),
('FormWidget@WidgetName','zh-CN','组件名称','FormWidget','EntityProperty'),
('FormWidget@ZoneID','zh-CN','区域','FormWidget','EntityProperty'),
('Full','zh-CN','整行',NULL,NULL),
('Full-text Index','zh-CN','全站索引',NULL,NULL),
('Gender','en-GB','Gender',NULL,NULL),
('Gender','en-US','Gender',NULL,NULL),
('Gender','zh-CN','性别',NULL,NULL),
('Generate','zh-CN','生成',NULL,NULL),
('Generate Content','zh-CN','基础内容',NULL,NULL),
('Get app private key','zh-CN','获取服务密钥(AK)',NULL,NULL),
('Get location','zh-CN','获取位置坐标',NULL,NULL),
('Greater Than','en-GB','Greater Than',NULL,NULL),
('Greater Than','en-US','Greater Than',NULL,NULL),
('Greater Than','zh-CN','大于',NULL,NULL),
('Greater Than Or Equals','en-GB','Greater Than Or Equals',NULL,NULL),
('Greater Than Or Equals','en-US','Greater Than Or Equals',NULL,NULL),
('Greater Than Or Equals','zh-CN','大于等于',NULL,NULL),
('Grid','zh-CN','栅格',NULL,NULL),
('Grid Display','zh-CN','栅格系统行为',NULL,NULL),
('Grid System','zh-CN','栅格列说明',NULL,NULL),
('Groove','zh-CN','凹槽',NULL,NULL),
('Group','zh-CN','组',NULL,NULL),
('Have account?','en-GB','Have account?',NULL,NULL),
('Have account?','en-US','Have account?',NULL,NULL),
('Have account?','zh-CN','已有账号？',NULL,NULL),
('Have your say...','zh-CN','说说你的看法...',NULL,NULL),
('Height(px)','zh-CN','高(px)',NULL,NULL),
('Help','zh-CN','帮助',NULL,NULL),
('Hidden','zh-CN','隐藏',NULL,NULL),
('History','en-GB','History',NULL,NULL),
('History','en-US','History',NULL,NULL),
('History','zh-CN','历史事件',NULL,NULL),
('HistoryEventItem@Description','zh-CN','事件','HistoryEventItem','EntityProperty'),
('HistoryEventItem@Status','zh-CN','状态','HistoryEventItem','EntityProperty'),
('HistoryEventItem@Title','zh-CN','年份','HistoryEventItem','EntityProperty'),
('HistoryEventWidget@AssemblyName','zh-CN','Assembly Name','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@Events','zh-CN','历史事件','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@IsSystem','zh-CN','Is System','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@IsTemplate','zh-CN','保存为模板','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@Position','zh-CN','排序','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@ServiceTypeName','zh-CN','Service Type Name','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@StyleClass','zh-CN','自定义样式','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@Thumbnail','zh-CN','缩略图','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@Title','zh-CN','标题','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@ViewModelTypeName','zh-CN','View Model Type Name','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@WidgetName','zh-CN','组件名称','HistoryEventWidget','EntityProperty'),
('HistoryEventWidget@ZoneID','zh-CN','区域','HistoryEventWidget','EntityProperty'),
('Hobby','en-GB','Hobby',NULL,NULL),
('Hobby','en-US','Hobby',NULL,NULL),
('Hobby','zh-CN','爱好',NULL,NULL),
('Home Page','en-GB','Home',NULL,NULL),
('Home Page','en-US','Home',NULL,NULL),
('Home Page','zh-CN','首页',NULL,NULL),
('Horizontal Display','zh-CN','水平排列',NULL,NULL),
('How many column you want?','zh-CN','将内容分为几列？',NULL,NULL),
('HtmlWidget@ActionType','zh-CN','ActionType','HtmlWidget','EntityProperty'),
('HtmlWidget@AssemblyName','zh-CN','AssemblyName','HtmlWidget','EntityProperty'),
('HtmlWidget@CreateBy','zh-CN','CreateBy','HtmlWidget','EntityProperty'),
('HtmlWidget@CreatebyName','zh-CN','创建人','HtmlWidget','EntityProperty'),
('HtmlWidget@CreateDate','zh-CN','创建日期','HtmlWidget','EntityProperty'),
('HtmlWidget@CustomClass','zh-CN','CustomClass','HtmlWidget','EntityProperty'),
('HtmlWidget@CustomStyle','zh-CN','CustomStyle','HtmlWidget','EntityProperty'),
('HtmlWidget@Description','zh-CN','描述','HtmlWidget','EntityProperty'),
('HtmlWidget@ExtendData','zh-CN','ExtendData','HtmlWidget','EntityProperty'),
('HtmlWidget@ExtendFields','zh-CN','扩展属性','HtmlWidget','EntityProperty'),
('HtmlWidget@FormView','zh-CN','FormView','HtmlWidget','EntityProperty'),
('HtmlWidget@HTML','zh-CN','内容','HtmlWidget','EntityProperty'),
('HtmlWidget@ID','zh-CN','ID','HtmlWidget','EntityProperty'),
('HtmlWidget@IsSystem','zh-CN','IsSystem','HtmlWidget','EntityProperty'),
('HtmlWidget@IsTemplate','zh-CN','保存为模板','HtmlWidget','EntityProperty'),
('HtmlWidget@LastUpdateBy','zh-CN','LastUpdateBy','HtmlWidget','EntityProperty'),
('HtmlWidget@LastUpdateByName','zh-CN','更新人','HtmlWidget','EntityProperty'),
('HtmlWidget@LastUpdateDate','zh-CN','更新日期','HtmlWidget','EntityProperty'),
('HtmlWidget@LayoutID','zh-CN','布局','HtmlWidget','EntityProperty'),
('HtmlWidget@PageID','zh-CN','页面','HtmlWidget','EntityProperty'),
('HtmlWidget@PartDriver','zh-CN','PartDriver','HtmlWidget','EntityProperty'),
('HtmlWidget@PartialView','zh-CN','显示模板','HtmlWidget','EntityProperty'),
('HtmlWidget@Position','zh-CN','排序','HtmlWidget','EntityProperty'),
('HtmlWidget@ServiceTypeName','zh-CN','ServiceTypeName','HtmlWidget','EntityProperty'),
('HtmlWidget@Status','zh-CN','状态','HtmlWidget','EntityProperty'),
('HtmlWidget@StyleClass','zh-CN','自定义样式','HtmlWidget','EntityProperty'),
('HtmlWidget@Thumbnail','zh-CN','缩略图','HtmlWidget','EntityProperty'),
('HtmlWidget@Title','zh-CN','标题','HtmlWidget','EntityProperty'),
('HtmlWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','HtmlWidget','EntityProperty'),
('HtmlWidget@WidgetName','zh-CN','组件名称','HtmlWidget','EntityProperty'),
('HtmlWidget@ZoneID','zh-CN','区域','HtmlWidget','EntityProperty'),
('Image Border','en-GB','Image Border',NULL,NULL),
('Image Border','en-US','Image Border',NULL,NULL),
('Image Border','zh-CN','图片边框',NULL,NULL),
('Image Radius','en-GB','Image Radius',NULL,NULL),
('Image Radius','en-US','Image Radius',NULL,NULL),
('Image Radius','zh-CN','图片圆角',NULL,NULL),
('Image should set alt title','zh-CN','页面中有图片缺少alt',NULL,NULL),
('Image Text','en-GB','Image Text',NULL,NULL),
('Image Text','en-US','Image Text',NULL,NULL),
('Image Text','zh-CN','图片文字',NULL,NULL),
('ImageWidget@ActionType','zh-CN','ActionType','ImageWidget','EntityProperty'),
('ImageWidget@AltText','zh-CN','说明','ImageWidget','EntityProperty'),
('ImageWidget@AssemblyName','zh-CN','AssemblyName','ImageWidget','EntityProperty'),
('ImageWidget@CreateBy','zh-CN','CreateBy','ImageWidget','EntityProperty'),
('ImageWidget@CreatebyName','zh-CN','创建人','ImageWidget','EntityProperty'),
('ImageWidget@CreateDate','zh-CN','创建日期','ImageWidget','EntityProperty'),
('ImageWidget@CustomClass','zh-CN','CustomClass','ImageWidget','EntityProperty'),
('ImageWidget@CustomStyle','zh-CN','CustomStyle','ImageWidget','EntityProperty'),
('ImageWidget@Description','zh-CN','描述','ImageWidget','EntityProperty'),
('ImageWidget@ExtendFields','zh-CN','扩展属性','ImageWidget','EntityProperty'),
('ImageWidget@FormView','zh-CN','FormView','ImageWidget','EntityProperty'),
('ImageWidget@Height','zh-CN','高度(px)','ImageWidget','EntityProperty'),
('ImageWidget@ID','zh-CN','ID','ImageWidget','EntityProperty'),
('ImageWidget@ImageUrl','zh-CN','图片','ImageWidget','EntityProperty'),
('ImageWidget@ImageUrlMd','zh-CN','中屏图片','PageEntity','EntityProperty'),
('ImageWidget@ImageUrlSm','zh-CN','小屏图片','PageEntity','EntityProperty'),
('ImageWidget@IsSystem','zh-CN','IsSystem','ImageWidget','EntityProperty'),
('ImageWidget@IsTemplate','zh-CN','保存为模板','ImageWidget','EntityProperty'),
('ImageWidget@LastUpdateBy','zh-CN','LastUpdateBy','ImageWidget','EntityProperty'),
('ImageWidget@LastUpdateByName','zh-CN','更新人','ImageWidget','EntityProperty'),
('ImageWidget@LastUpdateDate','zh-CN','更新日期','ImageWidget','EntityProperty'),
('ImageWidget@LayoutID','zh-CN','布局','ImageWidget','EntityProperty'),
('ImageWidget@Link','zh-CN','链接','ImageWidget','EntityProperty'),
('ImageWidget@PageID','zh-CN','页面','ImageWidget','EntityProperty'),
('ImageWidget@PartDriver','zh-CN','PartDriver','ImageWidget','EntityProperty'),
('ImageWidget@PartialView','zh-CN','显示模板','ImageWidget','EntityProperty'),
('ImageWidget@Position','zh-CN','排序','ImageWidget','EntityProperty'),
('ImageWidget@ServiceTypeName','zh-CN','ServiceTypeName','ImageWidget','EntityProperty'),
('ImageWidget@Status','zh-CN','状态','ImageWidget','EntityProperty'),
('ImageWidget@StyleClass','zh-CN','自定义样式','ImageWidget','EntityProperty'),
('ImageWidget@Thumbnail','zh-CN','缩略图','ImageWidget','EntityProperty'),
('ImageWidget@Title','zh-CN','标题','ImageWidget','EntityProperty'),
('ImageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ImageWidget','EntityProperty'),
('ImageWidget@WidgetName','zh-CN','组件名称','ImageWidget','EntityProperty'),
('ImageWidget@Width','zh-CN','宽度(px)','ImageWidget','EntityProperty'),
('ImageWidget@ZoneID','zh-CN','区域','ImageWidget','EntityProperty'),
('Import html page to system','zh-CN','该功能用于将做好的静态页面模板（HTML）导入到系统中',NULL,NULL),
('Import Html Template','zh-CN','导入静态模板',NULL,NULL),
('In','en-GB','In',NULL,NULL),
('In','en-US','In',NULL,NULL),
('In','zh-CN','在...里',NULL,NULL),
('In Queue...','zh-CN','排队中...',NULL,NULL),
('Inactive','en-GB','Inactive',NULL,NULL),
('Inactive','en-US','Inactive',NULL,NULL),
('Inactive','zh-CN','无效',NULL,NULL),
('Incoming address is already exists.','zh-CN','访问地址已经存在，不可重复添加',NULL,NULL),
('Incoming address is the same with target address.','zh-CN','访问地址和跳转地址一样。',NULL,NULL),
('Indent','zh-CN','缩进',NULL,NULL),
('Index content may take a few minutes!','zh-CN','更新索引的时间可能会较长，请耐心等待！',NULL,NULL),
('Industry News','zh-CN','行业新闻',NULL,NULL),
('Information','en-GB','Information',NULL,NULL),
('Information','en-US','Information',NULL,NULL),
('Information','zh-CN','基本信息',NULL,NULL),
('Input keywords to search','zh-CN','输入关键字搜索',NULL,NULL),
('Inset','zh-CN','内嵌',NULL,NULL),
('Install','zh-CN','安装',NULL,NULL),
('Install Theme','en-GB','Install',NULL,NULL),
('Install Theme','en-US','Install',NULL,NULL),
('Install Theme','zh-CN','安装主题',NULL,NULL),
('Installing Theme...','zh-CN','主题安装中...',NULL,NULL),
('Internal Error','zh-CN','内部错误',NULL,NULL),
('Invalid date value for {0}.','zh-CN','{0}的日期格式不正确',NULL,NULL),
('Invalid Email for {0}.','zh-CN','{0}的邮件格式不正确',NULL,NULL),
('Invalid Number for {0}.','zh-CN','{0}不是一个有效的数字',NULL,NULL),
('Invalid value for {0}.','zh-CN','{0}的格式不正确',NULL,NULL),
('IsTemplate','zh-CN','保存为模板',NULL,NULL),
('Italic','zh-CN','斜体',NULL,NULL),
('JavaScript','en-GB','JavaScript',NULL,NULL),
('JavaScript','en-US','JavaScript',NULL,NULL),
('JavaScript','zh-CN','脚本',NULL,NULL),
('justify','zh-CN','两端对齐',NULL,NULL),
('Keep working changes','zh-CN','保留当前的修改',NULL,NULL),
('Keywords@Action','en-GB','Action','Keywords','EntityProperty'),
('Keywords@Action','en-US','Action','Keywords','EntityProperty'),
('Keywords@Action','zh-CN','Action','Keywords','EntityProperty'),
('Keywords@MetaDescription','en-GB','Meta Description','Keywords','EntityProperty'),
('Keywords@MetaDescription','en-US','Meta Description','Keywords','EntityProperty'),
('Keywords@MetaDescription','zh-CN','SEO描述','Keywords','EntityProperty'),
('Keywords@MetaKeyWords','en-GB','Meta Key Words','Keywords','EntityProperty'),
('Keywords@MetaKeyWords','en-US','Meta Key Words','Keywords','EntityProperty'),
('Keywords@MetaKeyWords','zh-CN','SEO关键字','Keywords','EntityProperty'),
('Keywords@MetaKeyWorlds','en-GB','Meta Key Worlds','Keywords','EntityProperty'),
('Keywords@MetaKeyWorlds','en-US','Meta Key Worlds','Keywords','EntityProperty'),
('Keywords@MetaKeyWorlds','zh-CN','SEO关键字','Keywords','EntityProperty'),
('Keywords@SEODescription','en-US','SEO Description',NULL,NULL),
('Keywords@SEODescription','zh-CN','SEO描述','Keywords','EntityProperty'),
('Keywords@SEODescription','zh-TW','SEO描述',NULL,NULL),
('Keywords@SEOKeyWord','en-US','SEO Keywords',NULL,NULL),
('Keywords@SEOKeyWord','zh-CN','SEO关键字','Keywords','EntityProperty'),
('Keywords@SEOKeyWord','zh-TW','SEO关键字',NULL,NULL),
('Keywords@SEOTitle','en-US','SEO Title',NULL,NULL),
('Keywords@SEOTitle','zh-CN','SEO标题','Keywords','EntityProperty'),
('Keywords@SEOTitle','zh-TW','SEO标题',NULL,NULL),
('Keywords@Title','en-GB','Title','Keywords','EntityProperty'),
('Keywords@Title','en-US','Title','Keywords','EntityProperty'),
('Keywords@Title','zh-CN','标题','Keywords','EntityProperty'),
('Keywords@Url','en-GB','Url','Keywords','EntityProperty'),
('Keywords@Url','en-US','Url','Keywords','EntityProperty'),
('Keywords@Url','zh-CN','Url','Keywords','EntityProperty'),
('LanguageEntity@CultureName','en-GB','Culture Name','LanguageEntity','EntityProperty'),
('LanguageEntity@CultureName','en-US','Culture Name','LanguageEntity','EntityProperty'),
('LanguageEntity@CultureName','zh-CN','语言缩写','LanguageEntity','EntityProperty'),
('LanguageEntity@LanKey','en-GB','Lan Key','LanguageEntity','EntityProperty'),
('LanguageEntity@LanKey','en-US','Lan Key','LanguageEntity','EntityProperty'),
('LanguageEntity@LanKey','zh-CN','翻译键','LanguageEntity','EntityProperty'),
('LanguageEntity@LanType','zh-CN','对象','LanguageEntity','EntityProperty'),
('LanguageEntity@LanValue','en-GB','Lan Value','LanguageEntity','EntityProperty'),
('LanguageEntity@LanValue','en-US','Lan Value','LanguageEntity','EntityProperty'),
('LanguageEntity@LanValue','zh-CN','翻译值','LanguageEntity','EntityProperty'),
('LanguageEntity@Module','zh-CN','模块','LanguageEntity','EntityProperty'),
('Last-Modified','zh-CN','修改时间',NULL,NULL),
('Layout','en-GB','Layout',NULL,NULL),
('Layout','en-US','Layout',NULL,NULL),
('Layout','zh-CN','布局',NULL,NULL),
('Layout Code','zh-CN','布局代码',NULL,NULL),
('Layout Content','en-GB','Content',NULL,NULL),
('Layout Content','en-US','Content',NULL,NULL),
('Layout Content','zh-CN','布局内容',NULL,NULL),
('Layout Design','en-GB','Design',NULL,NULL),
('Layout Design','en-US','Design',NULL,NULL),
('Layout Design','zh-CN','布局设计',NULL,NULL),
('Layout List','en-GB','Layout',NULL,NULL),
('Layout List','en-US','Layout',NULL,NULL),
('Layout List','zh-CN','布局列表',NULL,NULL),
('Layout: Edit page layout','en-GB','Layout: Edit page layout',NULL,NULL),
('Layout: Edit page layout','en-US','Layout: Edit page layout',NULL,NULL),
('Layout: Edit page layout','zh-CN','布局：修改页面布局',NULL,NULL),
('LayoutEntity@ActionType','zh-CN','ActionType','LayoutEntity','EntityProperty'),
('LayoutEntity@ContainerClass','zh-CN','ContainerClass','LayoutEntity','EntityProperty'),
('LayoutEntity@CreateBy','zh-CN','CreateBy','LayoutEntity','EntityProperty'),
('LayoutEntity@CreatebyName','zh-CN','创建人','LayoutEntity','EntityProperty'),
('LayoutEntity@CreateDate','zh-CN','创建日期','LayoutEntity','EntityProperty'),
('LayoutEntity@CurrentTheme','zh-CN','CurrentTheme','LayoutEntity','EntityProperty'),
('LayoutEntity@Description','en-GB','Description','LayoutEntity','EntityProperty'),
('LayoutEntity@Description','en-US','Description','LayoutEntity','EntityProperty'),
('LayoutEntity@Description','zh-CN','描述','LayoutEntity','EntityProperty'),
('LayoutEntity@Html','zh-CN','内容','LayoutEntity','EntityProperty'),
('LayoutEntity@ID','zh-CN','ID','LayoutEntity','EntityProperty'),
('LayoutEntity@ImageThumbUrl','zh-CN','缩略图','LayoutEntity','EntityProperty'),
('LayoutEntity@ImageUrl','zh-CN','图片','LayoutEntity','EntityProperty'),
('LayoutEntity@IsTemplate','en-GB','Is Template','LayoutEntity','EntityProperty'),
('LayoutEntity@IsTemplate','en-US','Is Template','LayoutEntity','EntityProperty'),
('LayoutEntity@IsTemplate','zh-CN','保存为模板','LayoutEntity','EntityProperty'),
('LayoutEntity@LastUpdateBy','zh-CN','LastUpdateBy','LayoutEntity','EntityProperty'),
('LayoutEntity@LastUpdateByName','zh-CN','更新人','LayoutEntity','EntityProperty'),
('LayoutEntity@LastUpdateDate','zh-CN','更新日期','LayoutEntity','EntityProperty'),
('LayoutEntity@Layout','zh-CN','Layout','LayoutEntity','EntityProperty'),
('LayoutEntity@LayoutName','en-GB','Layout Name','LayoutEntity','EntityProperty'),
('LayoutEntity@LayoutName','en-US','Layout Name','LayoutEntity','EntityProperty'),
('LayoutEntity@LayoutName','zh-CN','名称','LayoutEntity','EntityProperty'),
('LayoutEntity@Page','zh-CN','Page','LayoutEntity','EntityProperty'),
('LayoutEntity@PreViewPage','zh-CN','PreViewPage','LayoutEntity','EntityProperty'),
('LayoutEntity@Script','en-GB','Script','LayoutEntity','EntityProperty'),
('LayoutEntity@Script','en-US','Script','LayoutEntity','EntityProperty'),
('LayoutEntity@Script','zh-CN','脚本','LayoutEntity','EntityProperty'),
('LayoutEntity@Status','en-GB','Status','LayoutEntity','EntityProperty'),
('LayoutEntity@Status','en-US','Status','LayoutEntity','EntityProperty'),
('LayoutEntity@Status','zh-CN','状态','LayoutEntity','EntityProperty'),
('LayoutEntity@Style','en-GB','Style','LayoutEntity','EntityProperty'),
('LayoutEntity@Style','en-US','Style','LayoutEntity','EntityProperty'),
('LayoutEntity@Style','zh-CN','样式','LayoutEntity','EntityProperty'),
('LayoutEntity@Templates','zh-CN','Templates','LayoutEntity','EntityProperty'),
('LayoutEntity@Theme','zh-CN','主题','LayoutEntity','EntityProperty'),
('LayoutEntity@Title','zh-CN','标题','LayoutEntity','EntityProperty'),
('LayoutEntity@Zones','zh-CN','Zones','LayoutEntity','EntityProperty'),
('LayoutEntity@ZoneWidgets','zh-CN','ZoneWidgets','LayoutEntity','EntityProperty'),
('LayoutHtml@ActionType','zh-CN','ActionType','LayoutHtml','EntityProperty'),
('LayoutHtml@CreateBy','zh-CN','CreateBy','LayoutHtml','EntityProperty'),
('LayoutHtml@CreatebyName','zh-CN','创建人','LayoutHtml','EntityProperty'),
('LayoutHtml@CreateDate','zh-CN','创建日期','LayoutHtml','EntityProperty'),
('LayoutHtml@Description','zh-CN','描述','LayoutHtml','EntityProperty'),
('LayoutHtml@Html','zh-CN','内容','LayoutHtml','EntityProperty'),
('LayoutHtml@LastUpdateBy','zh-CN','LastUpdateBy','LayoutHtml','EntityProperty'),
('LayoutHtml@LastUpdateByName','zh-CN','更新人','LayoutHtml','EntityProperty'),
('LayoutHtml@LastUpdateDate','zh-CN','更新日期','LayoutHtml','EntityProperty'),
('LayoutHtml@LayoutHtmlId','zh-CN','LayoutHtmlId','LayoutHtml','EntityProperty'),
('LayoutHtml@LayoutId','zh-CN','布局','LayoutHtml','EntityProperty'),
('LayoutHtml@Status','zh-CN','状态','LayoutHtml','EntityProperty'),
('LayoutHtml@Title','zh-CN','标题','LayoutHtml','EntityProperty'),
('Less Than','en-GB','Less Than',NULL,NULL),
('Less Than','en-US','Less Than',NULL,NULL),
('Less Than','zh-CN','小于',NULL,NULL),
('Less Than Or Equals','en-GB','Less Than Or Equals',NULL,NULL),
('Less Than Or Equals','en-US','Less Than Or Equals',NULL,NULL),
('Less Than Or Equals','zh-CN','小于等于',NULL,NULL),
('Letter Spacing','zh-CN','字间距',NULL,NULL),
('LG Screen','zh-CN','大屏幕',NULL,NULL),
('License','en-GB','License',NULL,NULL),
('License','en-US','License',NULL,NULL),
('License','zh-CN','许可协议',NULL,NULL),
('Lighter','zh-CN','轻加粗',NULL,NULL),
('Line Height','zh-CN','行高',NULL,NULL),
('Line Through','zh-CN','中线',NULL,NULL),
('Link','zh-CN','链接',NULL,NULL),
('List','zh-CN','列表',NULL,NULL),
('List Group','zh-CN','列表组',NULL,NULL),
('List Group End','zh-CN','组结束',NULL,NULL),
('LiveChatScript@Location','en-US','Location','LiveChatScript','EntityProperty'),
('LiveChatScript@Location','zh-CN','位置','GlobalScripts','EntityProperty'),
('LiveChatScript@Script','en-US','Script','LiveChatScript','EntityProperty'),
('LiveChatScript@Script','zh-CN','脚本','LiveChatScript','EntityProperty'),
('Load demo data','zh-CN','加载示例数据',NULL,NULL),
('Logs','en-GB','Log',NULL,NULL),
('Logs','en-US','Log',NULL,NULL),
('Logs','zh-CN','错误日志',NULL,NULL),
('Lowercase','zh-CN','小写',NULL,NULL),
('Male','en-GB','Male',NULL,NULL),
('Male','en-US','Male',NULL,NULL),
('Male','zh-CN','男',NULL,NULL),
('Manage Article','zh-CN','管理文章',NULL,NULL),
('Manage Article Category','zh-CN','管理文章类别',NULL,NULL),
('Manage Carousel','zh-CN','管理焦点图',NULL,NULL),
('Manage Comments','zh-CN','管理评论',NULL,NULL),
('Manage Content','zh-CN','管理内容',NULL,NULL),
('Manage Content Template','zh-CN','管理内容模板',NULL,NULL),
('Manage Content Type','zh-CN','管理内容类型',NULL,NULL),
('Manage Form','zh-CN','管理表单',NULL,NULL),
('Manage Form Data','zh-CN','管理表单数据',NULL,NULL),
('Manage Layout','zh-CN','管理布局',NULL,NULL),
('Manage Media','zh-CN','管理媒体库',NULL,NULL),
('Manage Message','zh-CN','管理留言',NULL,NULL),
('Manage Navigation','en-GB','Navigation',NULL,NULL),
('Manage Navigation','en-US','Navigation',NULL,NULL),
('Manage Navigation','zh-CN','导航管理',NULL,NULL),
('Manage Notify Email','zh-CN','管理通知邮箱',NULL,NULL),
('Manage Order','zh-CN','管理订单',NULL,NULL),
('Manage Page','en-GB','Page',NULL,NULL),
('Manage Page','en-US','Page',NULL,NULL),
('Manage Page','zh-CN','页面管理',NULL,NULL),
('Manage Pages','zh-CN','管理页面',NULL,NULL),
('Manage Product','en-GB','Product',NULL,NULL),
('Manage Product','en-US','Product',NULL,NULL),
('Manage Product','zh-CN','产品管理',NULL,NULL),
('Manage Product Category','zh-CN','管理产品类别',NULL,NULL),
('Manage Product Tag','zh-CN','管理产品标签',NULL,NULL),
('Manage Role','zh-CN','管理角色',NULL,NULL),
('Manage Setting','zh-CN','管理设置',NULL,NULL),
('Manage Subscription','zh-CN','管理订阅',NULL,NULL),
('Manage Template','zh-CN','管理模板',NULL,NULL),
('Manage Theme','zh-CN','管理主题',NULL,NULL),
('Manage URL Redirection','zh-CN','管理URL重定向',NULL,NULL),
('Manage Users','zh-CN','管理用户',NULL,NULL),
('Map','en-GB','Map',NULL,NULL),
('Map','en-US','Map',NULL,NULL),
('Map','zh-CN','地图',NULL,NULL),
('Margin','zh-CN','外边距',NULL,NULL),
('Margin Padding','zh-CN','边距',NULL,NULL),
('Married','en-GB','Married',NULL,NULL),
('Married','en-US','Married',NULL,NULL),
('Married','zh-CN','已婚',NULL,NULL),
('Max Column Width','zh-CN','最大列宽',NULL,NULL),
('Max Width','zh-CN','最大宽度',NULL,NULL),
('Media','en-GB','Media',NULL,NULL),
('Media','en-US','Media',NULL,NULL),
('Media','zh-CN','媒体库',NULL,NULL),
('MediaEntity@ActionType','zh-CN','ActionType','MediaEntity','EntityProperty'),
('MediaEntity@CreateBy','zh-CN','CreateBy','MediaEntity','EntityProperty'),
('MediaEntity@CreatebyName','zh-CN','CreatebyName','MediaEntity','EntityProperty'),
('MediaEntity@CreateDate','zh-CN','CreateDate','MediaEntity','EntityProperty'),
('MediaEntity@Description','zh-CN','描述','MediaEntity','EntityProperty'),
('MediaEntity@ID','zh-CN','ID','MediaEntity','EntityProperty'),
('MediaEntity@LastUpdateBy','zh-CN','LastUpdateBy','MediaEntity','EntityProperty'),
('MediaEntity@LastUpdateByName','zh-CN','LastUpdateByName','MediaEntity','EntityProperty'),
('MediaEntity@LastUpdateDate','zh-CN','LastUpdateDate','MediaEntity','EntityProperty'),
('MediaEntity@MediaType','zh-CN','MediaType','MediaEntity','EntityProperty'),
('MediaEntity@MediaTypeImage','zh-CN','MediaTypeImage','MediaEntity','EntityProperty'),
('MediaEntity@ParentID','zh-CN','ParentID','MediaEntity','EntityProperty'),
('MediaEntity@Status','zh-CN','状态','MediaEntity','EntityProperty'),
('MediaEntity@Title','zh-CN','标题','MediaEntity','EntityProperty'),
('MediaEntity@Url','zh-CN','Url','MediaEntity','EntityProperty'),
('Memory Cache','zh-CN','内存缓存',NULL,NULL),
('Message','en-GB','Message',NULL,NULL),
('Message','en-US','Message',NULL,NULL),
('Message','zh-CN','留言',NULL,NULL),
('Message And Comments','en-GB','Comments',NULL,NULL),
('Message And Comments','en-US','Comments',NULL,NULL),
('Message And Comments','zh-CN','留言评论',NULL,NULL),
('Message Board','en-GB','Message Board',NULL,NULL),
('Message Board','en-US','Message Board',NULL,NULL),
('Message Board','zh-CN','留言板',NULL,NULL),
('Message List','en-GB','Message List',NULL,NULL),
('Message List','en-US','Message List',NULL,NULL),
('Message List','zh-CN','留言内容',NULL,NULL),
('MessageBoxWidget@AssemblyName','zh-CN','Assembly Name','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@IsSystem','zh-CN','Is System','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@IsTemplate','zh-CN','保存为模板','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@PartialView','zh-CN','显示模板','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@Position','zh-CN','排序','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@ServiceTypeName','zh-CN','Service Type Name','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@StyleClass','zh-CN','自定义样式','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@Thumbnail','zh-CN','缩略图','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@Title','zh-CN','标题','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@ViewModelTypeName','zh-CN','View Model Type Name','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@WidgetName','zh-CN','组件名称','MessageBoxWidget','EntityProperty'),
('MessageBoxWidget@ZoneID','zh-CN','区域','MessageBoxWidget','EntityProperty'),
('MessageEntity@ActionType','zh-CN','ActionType','MessageEntity','EntityProperty'),
('MessageEntity@CreateBy','zh-CN','CreateBy','MessageEntity','EntityProperty'),
('MessageEntity@CreatebyName','en-GB','Create By','MessageEntity','EntityProperty'),
('MessageEntity@CreatebyName','en-US','Create By','MessageEntity','EntityProperty'),
('MessageEntity@CreatebyName','zh-CN','创建人','MessageEntity','EntityProperty'),
('MessageEntity@CreateDate','en-GB','Create Date','MessageEntity','EntityProperty'),
('MessageEntity@CreateDate','en-US','Create Date','MessageEntity','EntityProperty'),
('MessageEntity@CreateDate','zh-CN','创建日期','MessageEntity','EntityProperty'),
('MessageEntity@Description','zh-CN','描述','MessageEntity','EntityProperty'),
('MessageEntity@Email','en-GB','Email','MessageEntity','EntityProperty'),
('MessageEntity@Email','en-US','Email','MessageEntity','EntityProperty'),
('MessageEntity@Email','zh-CN','邮箱','MessageEntity','EntityProperty'),
('MessageEntity@ID','zh-CN','ID','MessageEntity','EntityProperty'),
('MessageEntity@LastUpdateBy','zh-CN','LastUpdateBy','MessageEntity','EntityProperty'),
('MessageEntity@LastUpdateByName','en-GB','Last Update By','MessageEntity','EntityProperty'),
('MessageEntity@LastUpdateByName','en-US','Last Update By','MessageEntity','EntityProperty'),
('MessageEntity@LastUpdateByName','zh-CN','更新人','MessageEntity','EntityProperty'),
('MessageEntity@LastUpdateDate','en-GB','Last Update Date','MessageEntity','EntityProperty'),
('MessageEntity@LastUpdateDate','en-US','Last Update Date','MessageEntity','EntityProperty'),
('MessageEntity@LastUpdateDate','zh-CN','更新日期','MessageEntity','EntityProperty'),
('MessageEntity@PostMessage','zh-CN','留言内容','MessageEntity','EntityProperty'),
('MessageEntity@Reply','zh-CN','回复','MessageEntity','EntityProperty'),
('MessageEntity@Status','en-GB','Status','MessageEntity','EntityProperty'),
('MessageEntity@Status','en-US','Status','MessageEntity','EntityProperty'),
('MessageEntity@Status','zh-CN','状态','MessageEntity','EntityProperty'),
('MessageEntity@Title','en-GB','Name','MessageEntity','EntityProperty'),
('MessageEntity@Title','en-US','Name','MessageEntity','EntityProperty'),
('MessageEntity@Title','zh-CN','姓名','MessageEntity','EntityProperty'),
('MessageNotificationConfig@CommentNotifyEmails','en-GB','Comment Notify Emails','MessageNotificationConfig','EntityProperty'),
('MessageNotificationConfig@CommentNotifyEmails','en-US','Comment Notify Emails','MessageNotificationConfig','EntityProperty'),
('MessageNotificationConfig@CommentNotifyEmails','zh-CN','新评论通知邮箱','MessageNotificationConfig','EntityProperty'),
('MessageNotificationConfig@MessageNotifyEmails','en-GB','Message Notify Emails','MessageNotificationConfig','EntityProperty'),
('MessageNotificationConfig@MessageNotifyEmails','en-US','Message Notify Emails','MessageNotificationConfig','EntityProperty'),
('MessageNotificationConfig@MessageNotifyEmails','zh-CN','新留言通知邮箱','MessageNotificationConfig','EntityProperty'),
('MessageWidget@ActionType','zh-CN','ActionType','MessageWidget','EntityProperty'),
('MessageWidget@AssemblyName','zh-CN','AssemblyName','MessageWidget','EntityProperty'),
('MessageWidget@CreateBy','zh-CN','CreateBy','MessageWidget','EntityProperty'),
('MessageWidget@CreatebyName','zh-CN','创建人','MessageWidget','EntityProperty'),
('MessageWidget@CreateDate','zh-CN','创建日期','MessageWidget','EntityProperty'),
('MessageWidget@CustomClass','zh-CN','CustomClass','MessageWidget','EntityProperty'),
('MessageWidget@CustomStyle','zh-CN','CustomStyle','MessageWidget','EntityProperty'),
('MessageWidget@Description','zh-CN','描述','MessageWidget','EntityProperty'),
('MessageWidget@ExtendData','zh-CN','ExtendData','MessageWidget','EntityProperty'),
('MessageWidget@ExtendFields','zh-CN','扩展属性','MessageWidget','EntityProperty'),
('MessageWidget@FormView','zh-CN','FormView','MessageWidget','EntityProperty'),
('MessageWidget@ID','zh-CN','ID','MessageWidget','EntityProperty'),
('MessageWidget@IsSystem','zh-CN','IsSystem','MessageWidget','EntityProperty'),
('MessageWidget@IsTemplate','zh-CN','保存为模板','MessageWidget','EntityProperty'),
('MessageWidget@LastUpdateBy','zh-CN','LastUpdateBy','MessageWidget','EntityProperty'),
('MessageWidget@LastUpdateByName','zh-CN','更新人','MessageWidget','EntityProperty'),
('MessageWidget@LastUpdateDate','zh-CN','更新日期','MessageWidget','EntityProperty'),
('MessageWidget@LayoutID','zh-CN','LayoutID','MessageWidget','EntityProperty'),
('MessageWidget@PageID','zh-CN','PageID','MessageWidget','EntityProperty'),
('MessageWidget@PartialView','zh-CN','显示模板','MessageWidget','EntityProperty'),
('MessageWidget@Position','zh-CN','排序','MessageWidget','EntityProperty'),
('MessageWidget@ServiceTypeName','zh-CN','ServiceTypeName','MessageWidget','EntityProperty'),
('MessageWidget@Status','zh-CN','状态','MessageWidget','EntityProperty'),
('MessageWidget@StyleClass','zh-CN','自定义样式','MessageWidget','EntityProperty'),
('MessageWidget@Thumbnail','zh-CN','缩略图','MessageWidget','EntityProperty'),
('MessageWidget@Title','zh-CN','标题','MessageWidget','EntityProperty'),
('MessageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','MessageWidget','EntityProperty'),
('MessageWidget@WidgetName','zh-CN','组件名称','MessageWidget','EntityProperty'),
('MessageWidget@ZoneID','zh-CN','区域','MessageWidget','EntityProperty'),
('Mobile (<768px)','zh-CN','手机 (<768px)',NULL,NULL),
('Modified','zh-CN','已修改',NULL,NULL),
('Modified By','zh-CN','修改人',NULL,NULL),
('Modify Account','en-GB','Modify Account',NULL,NULL),
('Modify Account','en-US','Modify Account',NULL,NULL),
('Modify Account','zh-CN','修改基本信息',NULL,NULL),
('More','en-GB','More',NULL,NULL),
('More','en-US','More',NULL,NULL),
('More','zh-CN','更多',NULL,NULL),
('More','zh-TW','更多',NULL,NULL),
('More Templates','zh-CN','更多模板>>',NULL,NULL),
('More...','zh-CN','更多...',NULL,NULL),
('Most Read Top10','zh-CN','阅读排行 Top10',NULL,NULL),
('Mouse Cursor','zh-CN','鼠标',NULL,NULL),
('Move','zh-CN','移动',NULL,NULL),
('Multi Line','zh-CN','多行输入',NULL,NULL),
('Multi-language','en-GB','Multi-language',NULL,NULL),
('Multi-language','en-US','Multi-language',NULL,NULL),
('Multi-language','zh-CN','多语言',NULL,NULL),
('Multi-language Config','en-GB','Multi-language Config',NULL,NULL),
('Multi-language Config','en-US','Multi-language Config',NULL,NULL),
('Multi-language Config','zh-CN','多语言设置',NULL,NULL),
('Multi-Language Setting','zh-CN','语言设置',NULL,NULL),
('My Order','en-GB','Orders',NULL,NULL),
('My Order','en-US','Orders',NULL,NULL),
('My Order','zh-CN','我的订单',NULL,NULL),
('Name','zh-CN','名称',NULL,NULL),
('Navigation','en-GB','Navigation',NULL,NULL),
('Navigation','en-US','Navigation',NULL,NULL),
('Navigation','zh-CN','导航',NULL,NULL),
('NavigationEntity@ActionType','zh-CN','ActionType','NavigationEntity','EntityProperty'),
('NavigationEntity@CreateBy','zh-CN','CreateBy','NavigationEntity','EntityProperty'),
('NavigationEntity@CreatebyName','zh-CN','创建人','NavigationEntity','EntityProperty'),
('NavigationEntity@CreateDate','zh-CN','创建日期','NavigationEntity','EntityProperty'),
('NavigationEntity@Description','en-GB','Description','NavigationEntity','EntityProperty'),
('NavigationEntity@Description','en-US','Description','NavigationEntity','EntityProperty'),
('NavigationEntity@Description','zh-CN','描述','NavigationEntity','EntityProperty'),
('NavigationEntity@DisplayOrder','zh-CN','排序','NavigationEntity','EntityProperty'),
('NavigationEntity@Html','en-GB','Html','NavigationEntity','EntityProperty'),
('NavigationEntity@Html','en-US','Html','NavigationEntity','EntityProperty'),
('NavigationEntity@Html','zh-CN','HTML内容','NavigationEntity','EntityProperty'),
('NavigationEntity@ID','zh-CN','ID','NavigationEntity','EntityProperty'),
('NavigationEntity@IsCurrent','en-GB','Is Current','NavigationEntity','EntityProperty'),
('NavigationEntity@IsCurrent','en-US','Is Current','NavigationEntity','EntityProperty'),
('NavigationEntity@IsCurrent','zh-CN','IsCurrent','NavigationEntity','EntityProperty'),
('NavigationEntity@IsMobile','en-GB','Is Mobile','NavigationEntity','EntityProperty'),
('NavigationEntity@IsMobile','en-US','Is Mobile','NavigationEntity','EntityProperty'),
('NavigationEntity@IsMobile','zh-CN','手机一级导航','NavigationEntity','EntityProperty'),
('NavigationEntity@LastUpdateBy','zh-CN','LastUpdateBy','NavigationEntity','EntityProperty'),
('NavigationEntity@LastUpdateByName','zh-CN','更新人','NavigationEntity','EntityProperty'),
('NavigationEntity@LastUpdateDate','zh-CN','更新日期','NavigationEntity','EntityProperty'),
('NavigationEntity@ParentId','zh-CN','ParentId','NavigationEntity','EntityProperty'),
('NavigationEntity@Status','en-GB','Status','NavigationEntity','EntityProperty'),
('NavigationEntity@Status','en-US','Status','NavigationEntity','EntityProperty'),
('NavigationEntity@Status','zh-CN','状态','NavigationEntity','EntityProperty'),
('NavigationEntity@Title','en-GB','Title','NavigationEntity','EntityProperty'),
('NavigationEntity@Title','en-US','Title','NavigationEntity','EntityProperty'),
('NavigationEntity@Title','zh-CN','标题','NavigationEntity','EntityProperty'),
('NavigationEntity@Url','en-GB','Url','NavigationEntity','EntityProperty'),
('NavigationEntity@Url','en-US','Url','NavigationEntity','EntityProperty'),
('NavigationEntity@Url','zh-CN','Url','NavigationEntity','EntityProperty'),
('NavigationWidget@ActionType','zh-CN','ActionType','NavigationWidget','EntityProperty'),
('NavigationWidget@AlignClass','en-GB','Align Class','NavigationWidget','EntityProperty'),
('NavigationWidget@AlignClass','en-US','Align Class','NavigationWidget','EntityProperty'),
('NavigationWidget@AlignClass','zh-CN','对齐','NavigationWidget','EntityProperty'),
('NavigationWidget@AssemblyName','en-GB','Assembly Name','NavigationWidget','EntityProperty'),
('NavigationWidget@AssemblyName','en-US','Assembly Name','NavigationWidget','EntityProperty'),
('NavigationWidget@AssemblyName','zh-CN','AssemblyName','NavigationWidget','EntityProperty'),
('NavigationWidget@CreateBy','zh-CN','CreateBy','NavigationWidget','EntityProperty'),
('NavigationWidget@CreatebyName','zh-CN','创建人','NavigationWidget','EntityProperty'),
('NavigationWidget@CreateDate','zh-CN','创建日期','NavigationWidget','EntityProperty'),
('NavigationWidget@CustomClass','zh-CN','CustomClass','NavigationWidget','EntityProperty'),
('NavigationWidget@CustomerClass','en-GB','Customer Class','NavigationWidget','EntityProperty'),
('NavigationWidget@CustomerClass','en-US','Customer Class','NavigationWidget','EntityProperty'),
('NavigationWidget@CustomerClass','zh-CN','契合度','NavigationWidget','EntityProperty'),
('NavigationWidget@CustomStyle','zh-CN','契合度','NavigationWidget','EntityProperty'),
('NavigationWidget@Description','zh-CN','描述','NavigationWidget','EntityProperty'),
('NavigationWidget@ExtendData','zh-CN','ExtendData','NavigationWidget','EntityProperty'),
('NavigationWidget@ExtendFields','zh-CN','扩展属性','NavigationWidget','EntityProperty'),
('NavigationWidget@FormView','zh-CN','FormView','NavigationWidget','EntityProperty'),
('NavigationWidget@ID','zh-CN','ID','NavigationWidget','EntityProperty'),
('NavigationWidget@IsSystem','en-GB','Is System','NavigationWidget','EntityProperty'),
('NavigationWidget@IsSystem','en-US','Is System','NavigationWidget','EntityProperty'),
('NavigationWidget@IsSystem','zh-CN','IsSystem','NavigationWidget','EntityProperty'),
('NavigationWidget@IsTemplate','en-GB','Is Template','NavigationWidget','EntityProperty'),
('NavigationWidget@IsTemplate','en-US','Is Template','NavigationWidget','EntityProperty'),
('NavigationWidget@IsTemplate','zh-CN','保存为模板','NavigationWidget','EntityProperty'),
('NavigationWidget@IsTopFix','zh-CN','顶部固定','NavigationWidget','EntityProperty'),
('NavigationWidget@LastUpdateBy','zh-CN','LastUpdateBy','NavigationWidget','EntityProperty'),
('NavigationWidget@LastUpdateByName','zh-CN','更新人','NavigationWidget','EntityProperty'),
('NavigationWidget@LastUpdateDate','zh-CN','更新日期','NavigationWidget','EntityProperty'),
('NavigationWidget@LayoutID','zh-CN','布局','NavigationWidget','EntityProperty'),
('NavigationWidget@Logo','en-GB','Logo','NavigationWidget','EntityProperty'),
('NavigationWidget@Logo','en-US','Logo','NavigationWidget','EntityProperty'),
('NavigationWidget@Logo','zh-CN','Logo','NavigationWidget','EntityProperty'),
('NavigationWidget@PageID','zh-CN','页面','NavigationWidget','EntityProperty'),
('NavigationWidget@PartDriver','zh-CN','PartDriver','NavigationWidget','EntityProperty'),
('NavigationWidget@PartialView','en-GB','Partial View','NavigationWidget','EntityProperty'),
('NavigationWidget@PartialView','en-US','Partial View','NavigationWidget','EntityProperty'),
('NavigationWidget@PartialView','zh-CN','显示模板','NavigationWidget','EntityProperty'),
('NavigationWidget@Position','en-GB','Position','NavigationWidget','EntityProperty'),
('NavigationWidget@Position','en-US','Position','NavigationWidget','EntityProperty'),
('NavigationWidget@Position','zh-CN','排序','NavigationWidget','EntityProperty'),
('NavigationWidget@RootID','en-GB','Root','NavigationWidget','EntityProperty'),
('NavigationWidget@RootID','en-US','Root','NavigationWidget','EntityProperty'),
('NavigationWidget@RootID','zh-CN','根结点','NavigationWidget','EntityProperty'),
('NavigationWidget@ServiceTypeName','en-GB','Service Type Name','NavigationWidget','EntityProperty'),
('NavigationWidget@ServiceTypeName','en-US','Service Type Name','NavigationWidget','EntityProperty'),
('NavigationWidget@ServiceTypeName','zh-CN','ServiceTypeName','NavigationWidget','EntityProperty'),
('NavigationWidget@ShowBasket','en-GB','Show Basket','NavigationWidget','EntityProperty'),
('NavigationWidget@ShowBasket','en-US','Show Basket','NavigationWidget','EntityProperty'),
('NavigationWidget@ShowBasket','zh-CN','显示购物车？','NavigationWidget','EntityProperty'),
('NavigationWidget@Status','zh-CN','状态','NavigationWidget','EntityProperty'),
('NavigationWidget@StyleClass','en-GB','Style Class','NavigationWidget','EntityProperty'),
('NavigationWidget@StyleClass','en-US','Style Class','NavigationWidget','EntityProperty'),
('NavigationWidget@StyleClass','zh-CN','自定义样式','NavigationWidget','EntityProperty'),
('NavigationWidget@Thumbnail','en-GB','Thumbnail','NavigationWidget','EntityProperty'),
('NavigationWidget@Thumbnail','en-US','Thumbnail','NavigationWidget','EntityProperty'),
('NavigationWidget@Thumbnail','zh-CN','缩略图','NavigationWidget','EntityProperty'),
('NavigationWidget@Title','en-GB','Title','NavigationWidget','EntityProperty'),
('NavigationWidget@Title','en-US','Title','NavigationWidget','EntityProperty'),
('NavigationWidget@Title','zh-CN','标题','NavigationWidget','EntityProperty'),
('NavigationWidget@ViewModelTypeName','en-GB','View Model Type Name','NavigationWidget','EntityProperty'),
('NavigationWidget@ViewModelTypeName','en-US','View Model Type Name','NavigationWidget','EntityProperty'),
('NavigationWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','NavigationWidget','EntityProperty'),
('NavigationWidget@WidgetName','en-GB','Widget Name','NavigationWidget','EntityProperty'),
('NavigationWidget@WidgetName','en-US','Widget Name','NavigationWidget','EntityProperty'),
('NavigationWidget@WidgetName','zh-CN','组件名称','NavigationWidget','EntityProperty'),
('NavigationWidget@ZoneID','en-GB','Zone','NavigationWidget','EntityProperty'),
('NavigationWidget@ZoneID','en-US','Zone','NavigationWidget','EntityProperty'),
('NavigationWidget@ZoneID','zh-CN','区域','NavigationWidget','EntityProperty'),
('ne-resize','zh-CN','向右上改变大小',NULL,NULL),
('New','en-GB','New',NULL,NULL),
('New','en-US','New',NULL,NULL),
('New','zh-CN','新建',NULL,NULL),
('New Category','en-GB','New',NULL,NULL),
('New Category','en-US','New',NULL,NULL),
('New Category','zh-CN','添加类别',NULL,NULL),
('New Folder','en-GB','New Folder',NULL,NULL),
('New Folder','en-US','New Folder',NULL,NULL),
('New Folder','zh-CN','创建文件夹',NULL,NULL),
('New Layout','en-GB','New Layout',NULL,NULL),
('New Layout','en-US','New Layout',NULL,NULL),
('New Layout','zh-CN','添加布局',NULL,NULL),
('New Navigation','en-GB','New',NULL,NULL),
('New Navigation','en-US','New',NULL,NULL),
('New Navigation','zh-CN','添加导航',NULL,NULL),
('New Page','en-GB','New Page',NULL,NULL),
('New Page','en-US','New Page',NULL,NULL),
('New Page','zh-CN','添加页面',NULL,NULL),
('New Page: Add a root level page','en-GB','New Page: Add a root level page',NULL,NULL),
('New Page: Add a root level page','en-US','New Page: Add a root level page',NULL,NULL),
('New Page: Add a root level page','zh-CN','添加页面：添加顶级页面，即域名下的一级子页面。~/xxxxx',NULL,NULL),
('New Password','en-GB','New Password',NULL,NULL),
('New Password','en-US','New Password',NULL,NULL),
('New Password','zh-CN','新密码',NULL,NULL),
('New Product Tag','en-GB','New',NULL,NULL),
('New Product Tag','en-US','New',NULL,NULL),
('New Product Tag','zh-CN','添加产品标签',NULL,NULL),
('New Tag','zh-CN','新建标签',NULL,NULL),
('New: Add sub page','en-GB','New: Add sub page',NULL,NULL),
('New: Add sub page','en-US','New: Add sub page',NULL,NULL),
('New: Add sub page','zh-CN','添加：添加子页面',NULL,NULL),
('News','zh-CN','新闻',NULL,NULL),
('Next','zh-CN','下一步',NULL,NULL),
('Next:','zh-CN','下一篇:',NULL,NULL),
('No','zh-CN','否',NULL,NULL),
('None','zh-CN','无',NULL,NULL),
('None（Auto）','zh-CN','None（自动）',NULL,NULL),
('no-repeat','zh-CN','不重复',NULL,NULL),
('Normal','zh-CN','普通',NULL,NULL),
('Not Contains','en-GB','Not Contains',NULL,NULL),
('Not Contains','en-US','Not Contains',NULL,NULL),
('Not Contains','zh-CN','不包含',NULL,NULL),
('Not Ends With','en-GB','Not Ends With',NULL,NULL),
('Not Ends With','en-US','Not Ends With',NULL,NULL),
('Not Ends With','zh-CN','不以...结尾',NULL,NULL),
('Not Equals','en-GB','Not Equals',NULL,NULL),
('Not Equals','en-US','Not Equals',NULL,NULL),
('Not Equals','zh-CN','不等于',NULL,NULL),
('Not In','en-GB','Not In',NULL,NULL),
('Not In','en-US','Not In',NULL,NULL),
('Not In','zh-CN','不在...里',NULL,NULL),
('Not Starts With','en-GB','Not Starts With',NULL,NULL),
('Not Starts With','en-US','Not Starts With',NULL,NULL),
('Not Starts With','zh-CN','不以…开头',NULL,NULL),
('Notice','zh-CN','提示',NULL,NULL),
('Notice:','en-GB','Notice:',NULL,NULL),
('Notice:','en-US','Notice:',NULL,NULL),
('Notice:','zh-CN','注：',NULL,NULL),
('Notice: click the rule will display the match content.','zh-CN','提示：点击左边条件，右则将展示出满足该条件时的内容',NULL,NULL),
('Notice: Drop to upload','zh-CN','注：把模板包拖到列表区域进行上传',NULL,NULL),
('Notify Email','zh-CN','通知邮箱',NULL,NULL),
('n-resize','zh-CN','向上改变大小',NULL,NULL),
('Number','zh-CN','数字',NULL,NULL),
('nw-resize','zh-CN','向左上改变大小',NULL,NULL),
('OAuth','en-GB','OAuth',NULL,NULL),
('OAuth','en-US','OAuth',NULL,NULL),
('OAuth','zh-CN','第三方登录',NULL,NULL),
('OAuth Config','zh-CN','配置第三方登录信息',NULL,NULL),
('OAuthWidget@AssemblyName','zh-CN','Assembly Name','OAuthWidget','EntityProperty'),
('OAuthWidget@IsSystem','zh-CN','Is System','OAuthWidget','EntityProperty'),
('OAuthWidget@IsTemplate','zh-CN','保存为模板','OAuthWidget','EntityProperty'),
('OAuthWidget@PartialView','zh-CN','显示模板','OAuthWidget','EntityProperty'),
('OAuthWidget@Position','zh-CN','排序','OAuthWidget','EntityProperty'),
('OAuthWidget@QQ','zh-CN','QQ?','OAuthWidget','EntityProperty'),
('OAuthWidget@Redirect','zh-CN','跳转地址','OAuthWidget','EntityProperty'),
('OAuthWidget@ServiceTypeName','zh-CN','Service Type Name','OAuthWidget','EntityProperty'),
('OAuthWidget@StyleClass','zh-CN','自定义样式','OAuthWidget','EntityProperty'),
('OAuthWidget@Thumbnail','zh-CN','缩略图','OAuthWidget','EntityProperty'),
('OAuthWidget@Title','zh-CN','标题','OAuthWidget','EntityProperty'),
('OAuthWidget@ViewModelTypeName','zh-CN','View Model Type Name','OAuthWidget','EntityProperty'),
('OAuthWidget@WeChat','zh-CN','微信?','OAuthWidget','EntityProperty'),
('OAuthWidget@WeiBo','zh-CN','微博?','OAuthWidget','EntityProperty'),
('OAuthWidget@WidgetName','zh-CN','组件名称','OAuthWidget','EntityProperty'),
('OAuthWidget@ZoneID','zh-CN','区域','OAuthWidget','EntityProperty'),
('Oblique','zh-CN','倾斜',NULL,NULL),
('Official Website','zh-CN','官网',NULL,NULL),
('OK','zh-CN','确定',NULL,NULL),
('Old Password','en-GB','Old Password',NULL,NULL),
('Old Password','en-US','Old Password',NULL,NULL),
('Old Password','zh-CN','旧密码',NULL,NULL),
('Only support zip package','zh-CN','上传的包必需为<code>zip</code>格式',NULL,NULL),
('Only unpaid order can be closed!','zh-CN','只有未支付的订单可以关闭',NULL,NULL),
('Option','zh-CN','选项',NULL,NULL),
('Option 1','zh-CN','选项1',NULL,NULL),
('Option 2','zh-CN','选项2',NULL,NULL),
('Or','en-GB','Or',NULL,NULL),
('Or','en-US','Or',NULL,NULL),
('Or','zh-CN','或者',NULL,NULL),
('Order','en-GB','Order',NULL,NULL),
('Order','en-US','Order',NULL,NULL),
('Order','zh-CN','订单',NULL,NULL),
('Order Amount','zh-CN','订单总额',NULL,NULL),
('Order Confirm','zh-CN','确认定单',NULL,NULL),
('Order Date','zh-CN','订单日期',NULL,NULL),
('Order Detail','zh-CN','订单明细',NULL,NULL),
('Order failed to pay','zh-CN','订单支付失败',NULL,NULL),
('Order for refund','zh-CN','申请退款的订单',NULL,NULL),
('Order Number','zh-CN','订单号',NULL,NULL),
('Order Number:','zh-CN','订单号：',NULL,NULL),
('Order@ActionType','zh-CN','ActionType','Order','EntityProperty'),
('Order@CompletePayTime','zh-CN','完成支付时间','Order','EntityProperty'),
('Order@Contact','en-GB','Contact','Order','EntityProperty'),
('Order@Contact','en-US','Contact','Order','EntityProperty'),
('Order@Contact','zh-CN','联系人','Order','EntityProperty'),
('Order@CreateBy','zh-CN','CreateBy','Order','EntityProperty'),
('Order@CreatebyName','zh-CN','创建人','Order','EntityProperty'),
('Order@CreateDate','en-GB','Create Date','Order','EntityProperty'),
('Order@CreateDate','en-US','Create Date','Order','EntityProperty'),
('Order@CreateDate','zh-CN','创建日期','Order','EntityProperty'),
('Order@Description','zh-CN','描述','Order','EntityProperty'),
('Order@ID','en-US','ID','Order','EntityProperty'),
('Order@ID','zh-CN','订单号','Order','EntityProperty'),
('Order@LastUpdateBy','zh-CN','LastUpdateBy','Order','EntityProperty'),
('Order@LastUpdateByName','en-GB','Last Update By','Order','EntityProperty'),
('Order@LastUpdateByName','en-US','Last Update By','Order','EntityProperty'),
('Order@LastUpdateByName','zh-CN','更新人','Order','EntityProperty'),
('Order@LastUpdateDate','en-GB','Last Update Date','Order','EntityProperty'),
('Order@LastUpdateDate','en-US','Last Update Date','Order','EntityProperty'),
('Order@LastUpdateDate','zh-CN','更新日期','Order','EntityProperty'),
('Order@LogisticsCompany','zh-CN','快递公司','Order','EntityProperty'),
('Order@OrderStatus','en-GB','Order Status','Order','EntityProperty'),
('Order@OrderStatus','en-US','Order Status','Order','EntityProperty'),
('Order@OrderStatus','zh-CN','订单状态','Order','EntityProperty'),
('Order@PaymentGateway','zh-CN','支付方式','Order','EntityProperty'),
('Order@PaymentID','zh-CN','支付ID','Order','EntityProperty'),
('Order@PayTime','zh-CN','发起支付时间','Order','EntityProperty'),
('Order@PhoneNumber','en-GB','Phone Number','Order','EntityProperty'),
('Order@PhoneNumber','en-US','Phone Number','Order','EntityProperty'),
('Order@PhoneNumber','zh-CN','电话','Order','EntityProperty'),
('Order@Refund','zh-CN','退款金额','Order','EntityProperty'),
('Order@RefundDate','zh-CN','退款日期','Order','EntityProperty'),
('Order@RefundID','zh-CN','退款流水号','Order','EntityProperty'),
('Order@RefundReason','zh-CN','退款原因','Order','EntityProperty'),
('Order@ShippingAddress','en-GB','Shipping Address','Order','EntityProperty'),
('Order@ShippingAddress','en-US','Shipping Address','Order','EntityProperty'),
('Order@ShippingAddress','zh-CN','收货地址','Order','EntityProperty'),
('Order@Status','zh-CN','状态','Order','EntityProperty'),
('Order@Title','zh-CN','标题','Order','EntityProperty'),
('Order@Total','en-GB','Total','Order','EntityProperty'),
('Order@Total','en-US','Total','Order','EntityProperty'),
('Order@Total','zh-CN','总价','Order','EntityProperty'),
('Order@TrackingNumber','zh-CN','快递单号','Order','EntityProperty'),
('Order@UserId','zh-CN','登录名','Order','EntityProperty'),
('Other','en-GB','Other',NULL,NULL),
('Other','en-US','Other',NULL,NULL),
('Other','zh-CN','其它',NULL,NULL),
('Other Settings','en-GB','Other',NULL,NULL),
('Other Settings','en-US','Other',NULL,NULL),
('Other Settings','zh-CN','其它设置',NULL,NULL),
('Output Cache','zh-CN','静态缓存设置',NULL,NULL),
('Outset','zh-CN','外嵌',NULL,NULL),
('Overflow','zh-CN','超出行为',NULL,NULL),
('Overline','zh-CN','顶线',NULL,NULL),
('Overview','en-GB','Overview',NULL,NULL),
('Overview','en-US','Overview',NULL,NULL),
('Overview','zh-CN','概览',NULL,NULL),
('Pack','zh-CN','打包',NULL,NULL),
('Pack widget','zh-CN','打包模板',NULL,NULL),
('Padding','zh-CN','内边距',NULL,NULL),
('Page','en-GB','Page',NULL,NULL),
('Page','en-US','Page',NULL,NULL),
('Page','zh-CN','页面',NULL,NULL),
('Page And Layout','zh-CN','页面布局',NULL,NULL),
('Page description is empty','zh-CN','页面的描述为空',NULL,NULL),
('Page description is too short or too long','zh-CN','页面的描述文字长度太长或者太短',NULL,NULL),
('Page Design','en-GB','Design',NULL,NULL),
('Page Design','en-US','Design',NULL,NULL),
('Page Design','zh-CN','页面设计',NULL,NULL),
('Page keyword is empty','zh-CN','页面没有设置关键字',NULL,NULL),
('Page keywords','en-GB','Page keywords',NULL,NULL),
('Page keywords','en-US','Page keywords',NULL,NULL),
('Page keywords','zh-CN','页面关键字',NULL,NULL),
('Page Not Exists','zh-CN','页面不存在',NULL,NULL),
('Page Title','zh-CN','页面的标题',NULL,NULL),
('Page title is empty','zh-CN','页面没有设置标题',NULL,NULL),
('Page title is too short or too long','zh-CN','页面的标题文字长度太长或者太短',NULL,NULL),
('PageAsset@Url','en-US','Url','PageAsset','EntityProperty'),
('PageAsset@Url','zh-CN','Url','PageEntity','EntityProperty'),
('PageEntity@ActionType','zh-CN','ActionType','PageEntity','EntityProperty'),
('PageEntity@Content','zh-CN','Content','PageEntity','EntityProperty'),
('PageEntity@CreateBy','zh-CN','CreateBy','PageEntity','EntityProperty'),
('PageEntity@CreatebyName','zh-CN','创建人','PageEntity','EntityProperty'),
('PageEntity@CreateDate','zh-CN','创建日期','PageEntity','EntityProperty'),
('PageEntity@Description','en-GB','Description','PageEntity','EntityProperty'),
('PageEntity@Description','en-US','Description','PageEntity','EntityProperty'),
('PageEntity@Description','zh-CN','描述','PageEntity','EntityProperty'),
('PageEntity@DisplayOrder','zh-CN','排序','PageEntity','EntityProperty'),
('PageEntity@ExtendFields','zh-CN','扩展属性','PageEntity','EntityProperty'),
('PageEntity@Favicon','zh-CN','Favicon','PageEntity','EntityProperty'),
('PageEntity@ID','zh-CN','ID','PageEntity','EntityProperty'),
('PageEntity@IsHomePage','en-GB','Is Home Page','PageEntity','EntityProperty'),
('PageEntity@IsHomePage','en-US','Is Home Page','PageEntity','EntityProperty'),
('PageEntity@IsHomePage','zh-CN','首页?','PageEntity','EntityProperty'),
('PageEntity@IsPublish','en-GB','Is Publish','PageEntity','EntityProperty'),
('PageEntity@IsPublish','en-US','Is Publish','PageEntity','EntityProperty'),
('PageEntity@IsPublish','zh-CN','已发布?','PageEntity','EntityProperty'),
('PageEntity@IsPublishedPage','en-GB','Is Published Page','PageEntity','EntityProperty'),
('PageEntity@IsPublishedPage','en-US','Is Published Page','PageEntity','EntityProperty'),
('PageEntity@IsPublishedPage','zh-CN','IsPublishedPage','PageEntity','EntityProperty'),
('PageEntity@IsTemplate','en-GB','Is Template','PageEntity','EntityProperty'),
('PageEntity@IsTemplate','en-US','Is Template','PageEntity','EntityProperty'),
('PageEntity@IsTemplate','zh-CN','保存为模板','PageEntity','EntityProperty'),
('PageEntity@LastUpdateBy','zh-CN','LastUpdateBy','PageEntity','EntityProperty'),
('PageEntity@LastUpdateByName','zh-CN','更新人','PageEntity','EntityProperty'),
('PageEntity@LastUpdateDate','zh-CN','更新日期','PageEntity','EntityProperty'),
('PageEntity@LayoutId','en-GB','Layout','PageEntity','EntityProperty'),
('PageEntity@LayoutId','en-US','Layout','PageEntity','EntityProperty'),
('PageEntity@LayoutId','zh-CN','布局','PageEntity','EntityProperty'),
('PageEntity@MetaDescription','en-GB','Meta Description','PageEntity','EntityProperty'),
('PageEntity@MetaDescription','en-US','Meta Description','PageEntity','EntityProperty'),
('PageEntity@MetaDescription','zh-CN','SEO描述','PageEntity','EntityProperty'),
('PageEntity@MetaKeyWorlds','en-GB','Meta Key Worlds','PageEntity','EntityProperty'),
('PageEntity@MetaKeyWorlds','en-US','Meta Key Worlds','PageEntity','EntityProperty'),
('PageEntity@MetaKeyWorlds','zh-CN','SEO关键字','PageEntity','EntityProperty'),
('PageEntity@PageName','en-GB','Page Name','PageEntity','EntityProperty'),
('PageEntity@PageName','en-US','Page Name','PageEntity','EntityProperty'),
('PageEntity@PageName','zh-CN','名称','PageEntity','EntityProperty'),
('PageEntity@PageUrl','en-GB','Page Url','PageEntity','EntityProperty'),
('PageEntity@PageUrl','en-US','Page Url','PageEntity','EntityProperty'),
('PageEntity@PageUrl','zh-CN','页面地址','PageEntity','EntityProperty'),
('PageEntity@ParentId','zh-CN','ParentId','PageEntity','EntityProperty'),
('PageEntity@PublishDate','zh-CN','发布日期','PageEntity','EntityProperty'),
('PageEntity@ReferencePageID','zh-CN','ReferencePageID','PageEntity','EntityProperty'),
('PageEntity@Script','en-GB','Script','PageEntity','EntityProperty'),
('PageEntity@Script','en-US','Script','PageEntity','EntityProperty'),
('PageEntity@Script','zh-CN','脚本','PageEntity','EntityProperty'),
('PageEntity@Scripts','en-US','Scripts','PageEntity','EntityProperty'),
('PageEntity@Scripts','zh-CN','脚本','PageEntity','EntityProperty'),
('PageEntity@Status','en-GB','Status','PageEntity','EntityProperty'),
('PageEntity@Status','en-US','Status','PageEntity','EntityProperty'),
('PageEntity@Status','zh-CN','状态','PageEntity','EntityProperty'),
('PageEntity@Style','en-GB','Style','PageEntity','EntityProperty'),
('PageEntity@Style','en-US','Style','PageEntity','EntityProperty'),
('PageEntity@Style','zh-CN','样式','PageEntity','EntityProperty'),
('PageEntity@Styles','en-US','Styles','PageEntity','EntityProperty'),
('PageEntity@Styles','zh-CN','样式','PageEntity','EntityProperty'),
('PageEntity@Title','en-GB','Title','PageEntity','EntityProperty'),
('PageEntity@Title','en-US','Title','PageEntity','EntityProperty'),
('PageEntity@Title','zh-CN','标题','PageEntity','EntityProperty'),
('PageEntity@Url','zh-CN','Url','PageEntity','EntityProperty'),
('Paid','zh-CN','已支付',NULL,NULL),
('Panel','zh-CN','面板',NULL,NULL),
('Paragraph','en-GB','Paragraph',NULL,NULL),
('Paragraph','en-US','Paragraph',NULL,NULL),
('Paragraph','zh-CN','段落',NULL,NULL),
('Parallax','en-GB','Parallax',NULL,NULL),
('Parallax','en-US','Parallax',NULL,NULL),
('Parallax','zh-CN','平行视差',NULL,NULL),
('ParallaxWidget@AssemblyName','zh-CN','Assembly Name','ParallaxWidget','EntityProperty'),
('ParallaxWidget@ImageUrl','zh-CN','图片','ParallaxWidget','EntityProperty'),
('ParallaxWidget@IsSystem','zh-CN','Is System','ParallaxWidget','EntityProperty'),
('ParallaxWidget@IsTemplate','zh-CN','保存为模板','ParallaxWidget','EntityProperty'),
('ParallaxWidget@Position','zh-CN','排序','ParallaxWidget','EntityProperty'),
('ParallaxWidget@ServiceTypeName','zh-CN','Service Type Name','ParallaxWidget','EntityProperty'),
('ParallaxWidget@StyleClass','zh-CN','自定义样式','ParallaxWidget','EntityProperty'),
('ParallaxWidget@Thumbnail','zh-CN','缩略图','ParallaxWidget','EntityProperty'),
('ParallaxWidget@Title','zh-CN','标题','ParallaxWidget','EntityProperty'),
('ParallaxWidget@ViewModelTypeName','zh-CN','View Model Type Name','ParallaxWidget','EntityProperty'),
('ParallaxWidget@WidgetName','zh-CN','组件名称','ParallaxWidget','EntityProperty'),
('ParallaxWidget@ZoneID','zh-CN','区域','ParallaxWidget','EntityProperty'),
('PartialView','zh-CN','显示模板',NULL,NULL),
('Password','en-GB','Password',NULL,NULL),
('Password','en-US','Password',NULL,NULL),
('Password','zh-CN','密码',NULL,NULL),
('Passwords are inconsistent','en-GB','Passwords are inconsistent',NULL,NULL),
('Passwords are inconsistent','en-US','Passwords are inconsistent',NULL,NULL),
('Passwords are inconsistent','zh-CN','密码不一致',NULL,NULL),
('Paste','en-GB','Paste',NULL,NULL),
('Paste','en-US','Paste',NULL,NULL),
('Paste','zh-CN','粘贴',NULL,NULL),
('Paste copy content to the area','zh-CN','粘贴复制的内容到该区域',NULL,NULL),
('Pay','zh-CN','付款',NULL,NULL),
('Pay Online','zh-CN','在线支付',NULL,NULL),
('Payment Information','zh-CN','支付信息',NULL,NULL),
('Payment Order','zh-CN','已支付订单',NULL,NULL),
('Payment Setting','zh-CN','支付集成设置',NULL,NULL),
('Pending pages','zh-CN','有未处理完的页面',NULL,NULL),
('Phone','en-GB','Phone',NULL,NULL),
('Phone','en-US','Phone',NULL,NULL),
('Phone','zh-CN','电话',NULL,NULL),
('Phone number is invalid','zh-CN','电话格式不正确',NULL,NULL),
('Picture','en-GB','Image',NULL,NULL),
('Picture','en-US','Image',NULL,NULL),
('Picture','zh-CN','图片',NULL,NULL),
('Pixel Script','zh-CN','访客统计代码',NULL,NULL),
('Please contact administrator.','zh-CN','请联系管理员。',NULL,NULL),
('Please enter the refund amount','zh-CN','请输入退款金额',NULL,NULL),
('Please enter your account information','zh-CN','请输入您的用户信息以找回密码',NULL,NULL),
('Please enter your name','en-GB','Please enter your name',NULL,NULL),
('Please enter your name','en-US','Please enter your name',NULL,NULL),
('Please enter your name','zh-CN','输入姓名',NULL,NULL),
('Please enter your user information to log in','en-GB','Please enter your user information to log in',NULL,NULL),
('Please enter your user information to log in','en-US','Please enter your user information to log in',NULL,NULL),
('Please enter your user information to log in','zh-CN','请输入您的用户信息以登录',NULL,NULL),
('Please enter your user information to log in to the system','en-GB','Please enter your user information to log in to the system',NULL,NULL),
('Please enter your user information to log in to the system','en-US','Please enter your user information to log in to the system',NULL,NULL),
('Please enter your user information to log in to the system','zh-CN','请输入您的用户信息以登录系统',NULL,NULL),
('Please enter your user information to regist','en-GB','Please enter your user information to regist',NULL,NULL),
('Please enter your user information to regist','en-US','Please enter your user information to regist',NULL,NULL),
('Please enter your user information to regist','zh-CN','请输入您的用户信息以注册',NULL,NULL),
('Please input a number','zh-CN','请输入数字',NULL,NULL),
('Please input a phone number','zh-CN','电话地址格式不正确',NULL,NULL),
('Please make only one folder in the package','zh-CN','压缩包的根目录<strong>有且仅能有一个文件夹</strong>，文件夹名将会作为主题名称和路径，所以请使用英文。',NULL,NULL),
('Please select a product category','zh-CN','请选择一个产品类别',NULL,NULL),
('Please select at least one option','zh-CN','请至少选择一个选项',NULL,NULL),
('Please try again later.','zh-CN','请稍后再试',NULL,NULL),
('Plugins','zh-CN','插件',NULL,NULL),
('Pointer','zh-CN','手形',NULL,NULL),
('Position','zh-CN','位置',NULL,NULL),
('Position Bottom','zh-CN','底部距离',NULL,NULL),
('Position Left','zh-CN','左边距离',NULL,NULL),
('Position Right','zh-CN','右边距离',NULL,NULL),
('Position Top','zh-CN','顶部距离',NULL,NULL),
('Position Type','zh-CN','定位',NULL,NULL),
('Press Enter to save','en-GB','Press Enter to save',NULL,NULL),
('Press Enter to save','en-US','Press Enter to save',NULL,NULL),
('Press Enter to save','zh-CN','按回车保存',NULL,NULL),
('Preview','en-GB','Preview',NULL,NULL),
('Preview','en-US','Preview',NULL,NULL),
('Preview','zh-CN','预览',NULL,NULL),
('Preview: Preview the pending page','en-GB','Preview: Preview the page',NULL,NULL),
('Preview: Preview the pending page','en-US','Preview: Preview the page',NULL,NULL),
('Preview: Preview the pending page','zh-CN','预览：查看最新修改版本',NULL,NULL),
('Previous:','zh-CN','上一篇:',NULL,NULL),
('Product','en-GB','Product',NULL,NULL),
('Product','en-US','Product',NULL,NULL),
('Product','zh-CN','产品',NULL,NULL),
('Product Category','en-GB','Product Category',NULL,NULL),
('Product Category','en-US','Product Category',NULL,NULL),
('Product Category','zh-CN','产品类别',NULL,NULL),
('Product Content','en-GB','Product Content',NULL,NULL),
('Product Content','en-US','Product Content',NULL,NULL),
('Product Content','zh-CN','产品内容',NULL,NULL),
('Product keywords','en-GB','Product keywords',NULL,NULL),
('Product keywords','en-US','Product keywords',NULL,NULL),
('Product keywords','zh-CN','产品关键字',NULL,NULL),
('Product List','en-GB','Product List',NULL,NULL),
('Product List','en-US','Product List',NULL,NULL),
('Product List','zh-CN','产品列表',NULL,NULL),
('Product Sort','en-GB','Sort',NULL,NULL),
('Product Sort','en-US','Sort',NULL,NULL),
('Product Sort','zh-CN','产品排序',NULL,NULL),
('Product Tag','en-GB','Product Tag',NULL,NULL),
('Product Tag','en-US','Product Tag',NULL,NULL),
('Product Tag','zh-CN','产品标签',NULL,NULL),
('ProductCategory@ActionType','zh-CN','ActionType','ProductCategory','EntityProperty'),
('ProductCategory@CreateBy','zh-CN','CreateBy','ProductCategory','EntityProperty'),
('ProductCategory@CreatebyName','zh-CN','创建人','ProductCategory','EntityProperty'),
('ProductCategory@CreateDate','zh-CN','创建日期','ProductCategory','EntityProperty'),
('ProductCategory@Description','en-GB','Description','ProductCategory','EntityProperty'),
('ProductCategory@Description','en-US','Description','ProductCategory','EntityProperty'),
('ProductCategory@Description','zh-CN','描述','ProductCategory','EntityProperty'),
('ProductCategory@ID','zh-CN','ID','ProductCategory','EntityProperty'),
('ProductCategory@LastUpdateBy','zh-CN','LastUpdateBy','ProductCategory','EntityProperty'),
('ProductCategory@LastUpdateByName','zh-CN','更新人','ProductCategory','EntityProperty'),
('ProductCategory@LastUpdateDate','zh-CN','更新日期','ProductCategory','EntityProperty'),
('ProductCategory@ParentID','en-GB','Parent','ProductCategory','EntityProperty'),
('ProductCategory@ParentID','en-US','Parent','ProductCategory','EntityProperty'),
('ProductCategory@ParentID','zh-CN','ParentID','ProductCategory','EntityProperty'),
('ProductCategory@Status','en-GB','Status','ProductCategory','EntityProperty'),
('ProductCategory@Status','en-US','Status','ProductCategory','EntityProperty'),
('ProductCategory@Status','zh-CN','状态','ProductCategory','EntityProperty'),
('ProductCategory@Title','en-GB','Title','ProductCategory','EntityProperty'),
('ProductCategory@Title','en-US','Title','ProductCategory','EntityProperty'),
('ProductCategory@Title','zh-CN','标题','ProductCategory','EntityProperty'),
('ProductCategory@Url','en-GB','Url','ProductCategory','EntityProperty'),
('ProductCategory@Url','en-US','Url','ProductCategory','EntityProperty'),
('ProductCategory@Url','zh-CN','英文名','ProductCategory','EntityProperty'),
('ProductCategoryWidget@ActionType','zh-CN','ActionType','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@AssemblyName','zh-CN','AssemblyName','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@CreateBy','zh-CN','CreateBy','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@CreatebyName','zh-CN','创建人','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@CreateDate','zh-CN','创建日期','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@CustomClass','zh-CN','CustomClass','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@CustomStyle','zh-CN','CustomStyle','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@Description','zh-CN','描述','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@ExtendFields','zh-CN','扩展属性','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@FormView','zh-CN','FormView','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@ID','zh-CN','ID','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@IsSystem','zh-CN','IsSystem','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@IsTemplate','zh-CN','保存为模板','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@LastUpdateByName','zh-CN','更新人','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@LastUpdateDate','zh-CN','更新日期','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@LayoutID','zh-CN','LayoutID','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@PageID','zh-CN','PageID','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@PartialView','zh-CN','显示模板','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@Position','zh-CN','排序','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@ProductCategoryID','zh-CN','产品类别','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@Status','zh-CN','状态','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@StyleClass','zh-CN','自定义样式','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@TargetPage','zh-CN','详细页面','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@Thumbnail','zh-CN','缩略图','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@Title','zh-CN','标题','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@WidgetName','zh-CN','组件名称','ProductCategoryWidget','EntityProperty'),
('ProductCategoryWidget@ZoneID','zh-CN','区域','ProductCategoryWidget','EntityProperty'),
('ProductDetailWidget@ActionType','zh-CN','ActionType','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@AssemblyName','zh-CN','AssemblyName','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@CreateBy','zh-CN','CreateBy','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@CreatebyName','zh-CN','创建人','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@CreateDate','zh-CN','创建日期','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@CustomClass','zh-CN','CustomClass','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@CustomerClass','zh-CN','CustomerClass','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@CustomStyle','zh-CN','CustomStyle','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@Description','zh-CN','描述','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@ExtendFields','zh-CN','扩展属性','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@FormView','zh-CN','FormView','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@ID','zh-CN','ID','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@IsSystem','zh-CN','IsSystem','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@IsTemplate','zh-CN','保存为模板','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@LastUpdateByName','zh-CN','更新人','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@LastUpdateDate','zh-CN','更新日期','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@LayoutID','zh-CN','LayoutID','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@PageID','zh-CN','PageID','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@PartialView','zh-CN','显示模板','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@Position','zh-CN','排序','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@Status','zh-CN','状态','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@StyleClass','zh-CN','自定义样式','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@Thumbnail','zh-CN','缩略图','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@Title','zh-CN','标题','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@WidgetName','zh-CN','组件名称','ProductDetailWidget','EntityProperty'),
('ProductDetailWidget@ZoneID','zh-CN','区域','ProductDetailWidget','EntityProperty'),
('ProductEntity@ActionType','zh-CN','ActionType','ProductEntity','EntityProperty'),
('ProductEntity@BrandCD','zh-CN','BrandCD','ProductEntity','EntityProperty'),
('ProductEntity@Color','zh-CN','颜色','ProductEntity','EntityProperty'),
('ProductEntity@CreateBy','zh-CN','CreateBy','ProductEntity','EntityProperty'),
('ProductEntity@CreatebyName','en-GB','Create By','ProductEntity','EntityProperty'),
('ProductEntity@CreatebyName','en-US','Create By','ProductEntity','EntityProperty'),
('ProductEntity@CreatebyName','zh-CN','创建人','ProductEntity','EntityProperty'),
('ProductEntity@CreateDate','en-GB','Create Date','ProductEntity','EntityProperty'),
('ProductEntity@CreateDate','en-US','Create Date','ProductEntity','EntityProperty'),
('ProductEntity@CreateDate','zh-CN','创建日期','ProductEntity','EntityProperty'),
('ProductEntity@Description','zh-CN','描述','ProductEntity','EntityProperty'),
('ProductEntity@ExtendFields','zh-CN','扩展属性','ProductEntity','EntityProperty'),
('ProductEntity@ID','zh-CN','ID','ProductEntity','EntityProperty'),
('ProductEntity@ImageThumbUrl','zh-CN','缩略图','ProductEntity','EntityProperty'),
('ProductEntity@ImageUrl','zh-CN','图片','ProductEntity','EntityProperty'),
('ProductEntity@IsPublish','zh-CN','已发布?','ProductEntity','EntityProperty'),
('ProductEntity@LastUpdateBy','zh-CN','LastUpdateBy','ProductEntity','EntityProperty'),
('ProductEntity@LastUpdateByName','en-GB','Last Update By','ProductEntity','EntityProperty'),
('ProductEntity@LastUpdateByName','en-US','Last Update By','ProductEntity','EntityProperty'),
('ProductEntity@LastUpdateByName','zh-CN','更新人','ProductEntity','EntityProperty'),
('ProductEntity@LastUpdateDate','en-GB','Last Update Date','ProductEntity','EntityProperty'),
('ProductEntity@LastUpdateDate','en-US','Last Update Date','ProductEntity','EntityProperty'),
('ProductEntity@LastUpdateDate','zh-CN','更新日期','ProductEntity','EntityProperty'),
('ProductEntity@Norm','zh-CN','规格','ProductEntity','EntityProperty'),
('ProductEntity@OrderIndex','zh-CN','排序','ProductEntity','EntityProperty'),
('ProductEntity@PartNumber','en-GB','Part Number','ProductEntity','EntityProperty'),
('ProductEntity@PartNumber','en-US','Part Number','ProductEntity','EntityProperty'),
('ProductEntity@PartNumber','zh-CN','型号','ProductEntity','EntityProperty'),
('ProductEntity@Price','zh-CN','价格','ProductEntity','EntityProperty'),
('ProductEntity@ProductCategoryID','en-GB','Product Category','ProductEntity','EntityProperty'),
('ProductEntity@ProductCategoryID','en-US','Product Category','ProductEntity','EntityProperty'),
('ProductEntity@ProductCategoryID','zh-CN','产品类别','ProductEntity','EntityProperty'),
('ProductEntity@ProductContent','zh-CN','详细内容','ProductEntity','EntityProperty'),
('ProductEntity@ProductEntityCategory','zh-CN','产品类别','ProductEntity','EntityProperty'),
('ProductEntity@ProductEntityCategoryID','zh-CN','产品类别','ProductEntity','EntityProperty'),
('ProductEntity@ProductEntityContent','zh-CN','描述','ProductEntity','EntityProperty'),
('ProductEntity@ProductImages','zh-CN','展示图','ProductEntity','EntityProperty'),
('ProductEntity@ProductTags','zh-CN','标签','ProductEntity','EntityProperty'),
('ProductEntity@PublishDate','zh-CN','发布日期','ProductEntity','EntityProperty'),
('ProductEntity@PurchasePrice','zh-CN','成本价','ProductEntity','EntityProperty'),
('ProductEntity@RebatePrice','zh-CN','折扣价','ProductEntity','EntityProperty'),
('ProductEntity@SEODescription','zh-CN','SEO描述','ProductEntity','EntityProperty'),
('ProductEntity@SEOKeyWord','zh-CN','SEO关键字','ProductEntity','EntityProperty'),
('ProductEntity@SEOTitle','zh-CN','SEO标题','ProductEntity','EntityProperty'),
('ProductEntity@ShelfLife','zh-CN','保质期','ProductEntity','EntityProperty'),
('ProductEntity@SourceFrom','zh-CN','来源','ProductEntity','EntityProperty'),
('ProductEntity@Status','en-GB','Status','ProductEntity','EntityProperty'),
('ProductEntity@Status','en-US','Status','ProductEntity','EntityProperty'),
('ProductEntity@Status','zh-CN','状态','ProductEntity','EntityProperty'),
('ProductEntity@TargetFrom','zh-CN','其它网站','ProductEntity','EntityProperty'),
('ProductEntity@TargetUrl','zh-CN','网站网址','ProductEntity','EntityProperty'),
('ProductEntity@Title','en-GB','Title','ProductEntity','EntityProperty'),
('ProductEntity@Title','en-US','Title','ProductEntity','EntityProperty'),
('ProductEntity@Title','zh-CN','标题','ProductEntity','EntityProperty'),
('ProductEntity@Url','zh-CN','英文名','ProductEntity','EntityProperty'),
('ProductImage@ActionType','zh-CN','ActionType','ProductImage','EntityProperty'),
('ProductImage@CreateBy','zh-CN','CreateBy','ProductImage','EntityProperty'),
('ProductImage@CreatebyName','zh-CN','创建人','ProductImage','EntityProperty'),
('ProductImage@CreateDate','zh-CN','创建日期','ProductImage','EntityProperty'),
('ProductImage@Description','zh-CN','描述','ProductImage','EntityProperty'),
('ProductImage@ID','zh-CN','ID','ProductImage','EntityProperty'),
('ProductImage@ImageUrl','zh-CN','图片','ProductImage','EntityProperty'),
('ProductImage@LastUpdateBy','zh-CN','LastUpdateBy','ProductImage','EntityProperty'),
('ProductImage@LastUpdateByName','zh-CN','更新人','ProductImage','EntityProperty'),
('ProductImage@LastUpdateDate','zh-CN','更新日期','ProductImage','EntityProperty'),
('ProductImage@ProductId','zh-CN','ProductId','ProductImage','EntityProperty'),
('ProductImage@Status','zh-CN','状态','ProductImage','EntityProperty'),
('ProductImage@Title','zh-CN','标题','ProductImage','EntityProperty'),
('ProductListWidget@ActionType','zh-CN','ActionType','ProductListWidget','EntityProperty'),
('ProductListWidget@AssemblyName','zh-CN','AssemblyName','ProductListWidget','EntityProperty'),
('ProductListWidget@Columns','zh-CN','显示列','ProductListWidget','EntityProperty'),
('ProductListWidget@CreateBy','zh-CN','CreateBy','ProductListWidget','EntityProperty'),
('ProductListWidget@CreatebyName','zh-CN','创建人','ProductListWidget','EntityProperty'),
('ProductListWidget@CreateDate','zh-CN','创建日期','ProductListWidget','EntityProperty'),
('ProductListWidget@CustomClass','zh-CN','CustomClass','ProductListWidget','EntityProperty'),
('ProductListWidget@CustomStyle','zh-CN','CustomStyle','ProductListWidget','EntityProperty'),
('ProductListWidget@Description','zh-CN','描述','ProductListWidget','EntityProperty'),
('ProductListWidget@DetailPageUrl','zh-CN','详细页面','ProductListWidget','EntityProperty'),
('ProductListWidget@ExtendData','zh-CN','ExtendData','ProductListWidget','EntityProperty'),
('ProductListWidget@ExtendFields','zh-CN','扩展属性','ProductListWidget','EntityProperty'),
('ProductListWidget@FormView','zh-CN','FormView','ProductListWidget','EntityProperty'),
('ProductListWidget@ID','zh-CN','ID','ProductListWidget','EntityProperty'),
('ProductListWidget@IsPageable','zh-CN','分页?','ProductListWidget','EntityProperty'),
('ProductListWidget@IsSystem','zh-CN','IsSystem','ProductListWidget','EntityProperty'),
('ProductListWidget@IsTemplate','zh-CN','保存为模板','ProductListWidget','EntityProperty'),
('ProductListWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductListWidget','EntityProperty'),
('ProductListWidget@LastUpdateByName','zh-CN','更新人','ProductListWidget','EntityProperty'),
('ProductListWidget@LastUpdateDate','zh-CN','更新日期','ProductListWidget','EntityProperty'),
('ProductListWidget@LayoutID','zh-CN','LayoutID','ProductListWidget','EntityProperty'),
('ProductListWidget@PageID','zh-CN','PageID','ProductListWidget','EntityProperty'),
('ProductListWidget@PageSize','zh-CN','分页大小','ProductListWidget','EntityProperty'),
('ProductListWidget@PartialView','zh-CN','显示模板','ProductListWidget','EntityProperty'),
('ProductListWidget@Position','zh-CN','排序','ProductListWidget','EntityProperty'),
('ProductListWidget@ProductCategoryID','zh-CN','产品类别','ProductListWidget','EntityProperty'),
('ProductListWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductListWidget','EntityProperty'),
('ProductListWidget@Status','zh-CN','状态','ProductListWidget','EntityProperty'),
('ProductListWidget@StyleClass','zh-CN','自定义样式','ProductListWidget','EntityProperty'),
('ProductListWidget@Thumbnail','zh-CN','缩略图','ProductListWidget','EntityProperty'),
('ProductListWidget@Title','zh-CN','标题','ProductListWidget','EntityProperty'),
('ProductListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductListWidget','EntityProperty'),
('ProductListWidget@WidgetName','zh-CN','组件名称','ProductListWidget','EntityProperty'),
('ProductListWidget@ZoneID','zh-CN','区域','ProductListWidget','EntityProperty'),
('Property','en-GB','Property',NULL,NULL),
('Property','en-US','Property',NULL,NULL),
('Property','zh-CN','属性',NULL,NULL),
('Property/History','en-GB','Property/History',NULL,NULL),
('Property/History','en-US','Property/History',NULL,NULL),
('Property/History','zh-CN','属性/历史记录',NULL,NULL),
('Property: Page property, history etc.','en-GB','Property: Page property, history etc.',NULL,NULL),
('Property: Page property, history etc.','en-US','Property: Page property, history etc.',NULL,NULL),
('Property: Page property, history etc.','zh-CN','属性：编辑选中页面的属性，像标题，SEO关键字等',NULL,NULL),
('Province Address','zh-CN','省份地址',NULL,NULL),
('Publish','en-GB','Publish',NULL,NULL),
('Publish','en-US','Publish',NULL,NULL),
('Publish','zh-CN','发布',NULL,NULL),
('Publish Article','zh-CN','发布文章',NULL,NULL),
('Publish By','en-GB','Publish By',NULL,NULL),
('Publish By','en-US','Publish By',NULL,NULL),
('Publish By','zh-CN','发布人',NULL,NULL),
('Publish Date','en-GB','Publish Date',NULL,NULL),
('Publish Date','en-US','Publish Date',NULL,NULL),
('Publish Date','zh-CN','发布日期',NULL,NULL),
('Publish Product','zh-CN','发布产品',NULL,NULL),
('Publish: Publish page','en-GB','Publish: Publish page',NULL,NULL),
('Publish: Publish page','en-US','Publish: Publish page',NULL,NULL),
('Publish: Publish page','zh-CN','发布：将页面发布到前端可查看',NULL,NULL),
('Published','zh-CN','已发布',NULL,NULL),
('QQ Config','zh-CN','配置QQ登录',NULL,NULL),
('Query String','en-GB','Query String',NULL,NULL),
('Query String','en-US','Query String',NULL,NULL),
('Query String','zh-CN','Url参数',NULL,NULL),
('Querystring is not allowed','zh-CN','不支持带有参数的URL地址静态化',NULL,NULL),
('Radio Button','zh-CN','单选框',NULL,NULL),
('Radius','zh-CN','圆角',NULL,NULL),
('Recent Articles','zh-CN','近期文章',NULL,NULL),
('Reduce Margin','en-GB','Full',NULL,NULL),
('Reduce Margin','en-US','Full',NULL,NULL),
('Reduce Margin','zh-CN','减小外边距',NULL,NULL),
('Refresh','zh-CN','刷新',NULL,NULL),
('Refund','zh-CN','退款',NULL,NULL),
('Refund Amount','zh-CN','退款金额',NULL,NULL),
('Refund amount exceeds the amount of the order','zh-CN','退款金额超出订单金额',NULL,NULL),
('Refund Information','zh-CN','退款信息',NULL,NULL),
('Refund successfull!','zh-CN','退款成功！',NULL,NULL),
('Refunded','zh-CN','已退款',NULL,NULL),
('Refunding','zh-CN','退款中',NULL,NULL),
('Reinstall to update the theme','en-GB','Reinstall to update the theme',NULL,NULL),
('Reinstall to update the theme','en-US','Reinstall to update the theme',NULL,NULL),
('Reinstall to update the theme','zh-CN','若主题有更新，重复安装即可更新',NULL,NULL),
('Relative','zh-CN','相对',NULL,NULL),
('Release your mouse to upload...','zh-CN','松开鼠标进行上传...',NULL,NULL),
('Repeat','zh-CN','重复',NULL,NULL),
('repeat-x','zh-CN','水平重复',NULL,NULL),
('repeat-y','zh-CN','垂直重复',NULL,NULL),
('Reply','zh-CN','回复',NULL,NULL),
('Report issue','zh-CN','反馈问题',NULL,NULL),
('Reset failed?','zh-CN','重置失败？',NULL,NULL),
('Reset password','zh-CN','重置密码',NULL,NULL),
('Revert','en-GB','Revert',NULL,NULL),
('Revert','en-US','Revert',NULL,NULL),
('Revert','zh-CN','恢复',NULL,NULL),
('Revert','zh-TW','恢復',NULL,NULL),
('Revert from version: {0:g}','zh-CN','从 {0:g} 版本撤回',NULL,NULL),
('Revert to','zh-CN','撤回到该版本',NULL,NULL),
('Revert to original','zh-CN','将模板还原到最初状态？',NULL,NULL),
('Review','zh-CN','预览',NULL,NULL),
('Rich Text','zh-CN','富文本',NULL,NULL),
('Rich text box','zh-CN','富文本输入',NULL,NULL),
('Ridge','zh-CN','屋脊',NULL,NULL),
('Robots@Content','en-US','Content','Robots','EntityProperty'),
('Robots@Content','zh-CN','内容','Robots','EntityProperty'),
('Role','en-GB','Role',NULL,NULL),
('Role','en-US','Role',NULL,NULL),
('Role','zh-CN','角色',NULL,NULL),
('RoleEntity@ActionType','zh-CN','ActionType','RoleEntity','EntityProperty'),
('RoleEntity@CreateBy','zh-CN','CreateBy','RoleEntity','EntityProperty'),
('RoleEntity@CreatebyName','en-GB','Create By','RoleEntity','EntityProperty'),
('RoleEntity@CreatebyName','en-US','Create By','RoleEntity','EntityProperty'),
('RoleEntity@CreatebyName','zh-CN','创建人','RoleEntity','EntityProperty'),
('RoleEntity@CreateDate','en-GB','Create Date','RoleEntity','EntityProperty'),
('RoleEntity@CreateDate','en-US','Create Date','RoleEntity','EntityProperty'),
('RoleEntity@CreateDate','zh-CN','创建日期','RoleEntity','EntityProperty'),
('RoleEntity@Description','en-US','Description','RoleEntity','EntityProperty'),
('RoleEntity@Description','zh-CN','描述','RoleEntity','EntityProperty'),
('RoleEntity@ID','en-US','ID','RoleEntity','EntityProperty'),
('RoleEntity@ID','zh-CN','ID','RoleEntity','EntityProperty'),
('RoleEntity@LastUpdateBy','zh-CN','LastUpdateBy','RoleEntity','EntityProperty'),
('RoleEntity@LastUpdateByName','en-GB','Last Update By','RoleEntity','EntityProperty'),
('RoleEntity@LastUpdateByName','en-US','Last Update By','RoleEntity','EntityProperty'),
('RoleEntity@LastUpdateByName','zh-CN','更新人','RoleEntity','EntityProperty'),
('RoleEntity@LastUpdateDate','en-GB','Last Update Date','RoleEntity','EntityProperty'),
('RoleEntity@LastUpdateDate','en-US','Last Update Date','RoleEntity','EntityProperty'),
('RoleEntity@LastUpdateDate','zh-CN','更新日期','RoleEntity','EntityProperty'),
('RoleEntity@Permissions','zh-CN','Permissions','RoleEntity','EntityProperty'),
('RoleEntity@Status','en-GB','Status','RoleEntity','EntityProperty'),
('RoleEntity@Status','en-US','Status','RoleEntity','EntityProperty'),
('RoleEntity@Status','zh-CN','状态','RoleEntity','EntityProperty'),
('RoleEntity@Title','en-GB','Title','RoleEntity','EntityProperty'),
('RoleEntity@Title','en-US','Title','RoleEntity','EntityProperty'),
('RoleEntity@Title','zh-CN','标题','RoleEntity','EntityProperty'),
('Row','en-GB','Row',NULL,NULL),
('Row','en-US','Row',NULL,NULL),
('Row','zh-CN','行',NULL,NULL),
('Rule','zh-CN','条件规则',NULL,NULL),
('Rule@Description','en-GB','Description','Rule','EntityProperty'),
('Rule@Description','en-US','Description','Rule','EntityProperty'),
('Rule@Description','zh-CN','描述','Rule','EntityProperty'),
('Rule@RuleID','en-GB','Rule','Rule','EntityProperty'),
('Rule@RuleID','en-US','Rule','Rule','EntityProperty'),
('Rule@RuleID','zh-CN','RuleID','Rule','EntityProperty'),
('Rule@RuleItemList','en-GB','Rule Item List','Rule','EntityProperty'),
('Rule@RuleItemList','en-US','Rule Item List','Rule','EntityProperty'),
('Rule@RuleItemList','zh-CN','条件组','Rule','EntityProperty'),
('Rule@Status','en-GB','Status','Rule','EntityProperty'),
('Rule@Status','en-US','Status','Rule','EntityProperty'),
('Rule@Status','zh-CN','状态','Rule','EntityProperty'),
('Rule@Title','en-GB','Title','Rule','EntityProperty'),
('Rule@Title','en-US','Title','Rule','EntityProperty'),
('Rule@Title','zh-CN','标题','Rule','EntityProperty'),
('Rule@ZoneName','en-GB','Zone Name','Rule','EntityProperty'),
('Rule@ZoneName','en-US','Zone Name','Rule','EntityProperty'),
('Rule@ZoneName','zh-CN','显示区域','Rule','EntityProperty'),
('RuleItem@Condition','en-GB','Condition','RuleItem','EntityProperty'),
('RuleItem@Condition','en-US','Condition','RuleItem','EntityProperty'),
('RuleItem@Condition','zh-CN','条件','RuleItem','EntityProperty'),
('RuleItem@FunctionName','en-GB','Function Name','RuleItem','EntityProperty'),
('RuleItem@FunctionName','en-US','Function Name','RuleItem','EntityProperty'),
('RuleItem@FunctionName','zh-CN','运算方式','RuleItem','EntityProperty'),
('RuleItem@Property','en-GB','Property','RuleItem','EntityProperty'),
('RuleItem@Property','en-US','Property','RuleItem','EntityProperty'),
('RuleItem@Property','zh-CN','属性','RuleItem','EntityProperty'),
('RuleItem@Value','en-GB','Value','RuleItem','EntityProperty'),
('RuleItem@Value','en-US','Value','RuleItem','EntityProperty'),
('RuleItem@Value','zh-CN','值','RuleItem','EntityProperty'),
('Save','en-GB','Save',NULL,NULL),
('Save','en-US','Save',NULL,NULL),
('Save','zh-CN','保存',NULL,NULL),
('Save Success','zh-CN','保存成功！',NULL,NULL),
('Scan all pages','zh-CN','检查所有页面',NULL,NULL),
('ScriptWidget@ActionType','zh-CN','ActionType','ScriptWidget','EntityProperty'),
('ScriptWidget@AssemblyName','zh-CN','AssemblyName','ScriptWidget','EntityProperty'),
('ScriptWidget@CreateBy','zh-CN','CreateBy','ScriptWidget','EntityProperty'),
('ScriptWidget@CreatebyName','zh-CN','创建人','ScriptWidget','EntityProperty'),
('ScriptWidget@CreateDate','zh-CN','创建日期','ScriptWidget','EntityProperty'),
('ScriptWidget@CustomClass','zh-CN','CustomClass','ScriptWidget','EntityProperty'),
('ScriptWidget@CustomStyle','zh-CN','CustomStyle','ScriptWidget','EntityProperty'),
('ScriptWidget@Description','zh-CN','描述','ScriptWidget','EntityProperty'),
('ScriptWidget@ExtendFields','zh-CN','扩展属性','ScriptWidget','EntityProperty'),
('ScriptWidget@FormView','zh-CN','FormView','ScriptWidget','EntityProperty'),
('ScriptWidget@ID','zh-CN','ID','ScriptWidget','EntityProperty'),
('ScriptWidget@IsSystem','zh-CN','IsSystem','ScriptWidget','EntityProperty'),
('ScriptWidget@IsTemplate','zh-CN','保存为模板','ScriptWidget','EntityProperty'),
('ScriptWidget@LastUpdateBy','zh-CN','LastUpdateBy','ScriptWidget','EntityProperty'),
('ScriptWidget@LastUpdateByName','zh-CN','更新人','ScriptWidget','EntityProperty'),
('ScriptWidget@LastUpdateDate','zh-CN','更新日期','ScriptWidget','EntityProperty'),
('ScriptWidget@LayoutID','zh-CN','LayoutID','ScriptWidget','EntityProperty'),
('ScriptWidget@PageID','zh-CN','PageID','ScriptWidget','EntityProperty'),
('ScriptWidget@PartialView','zh-CN','显示模板','ScriptWidget','EntityProperty'),
('ScriptWidget@Position','zh-CN','排序','ScriptWidget','EntityProperty'),
('ScriptWidget@Script','zh-CN','脚本','ScriptWidget','EntityProperty'),
('ScriptWidget@ServiceTypeName','zh-CN','ServiceTypeName','ScriptWidget','EntityProperty'),
('ScriptWidget@Status','zh-CN','状态','ScriptWidget','EntityProperty'),
('ScriptWidget@StyleClass','zh-CN','自定义样式','ScriptWidget','EntityProperty'),
('ScriptWidget@Thumbnail','zh-CN','缩略图','ScriptWidget','EntityProperty'),
('ScriptWidget@Title','zh-CN','标题','ScriptWidget','EntityProperty'),
('ScriptWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ScriptWidget','EntityProperty'),
('ScriptWidget@WidgetName','zh-CN','组件名称','ScriptWidget','EntityProperty'),
('ScriptWidget@ZoneID','zh-CN','区域','ScriptWidget','EntityProperty'),
('Scroll','zh-CN','滚动',NULL,NULL),
('Search','zh-CN','搜 索',NULL,NULL),
('Search Engine Optimization','en-GB','SEO',NULL,NULL),
('Search Engine Optimization','en-US','SEO',NULL,NULL),
('Search Engine Optimization','zh-CN','SEO优化',NULL,NULL),
('Search Engine Search','zh-CN','站点搜索',NULL,NULL),
('Search Page','zh-CN','搜索页面',NULL,NULL),
('Search result depends on the following information:','zh-CN','页面的搜索结果取决于搜索<strong>关键字</strong>是否和页面的以下信息匹配：',NULL,NULL),
('SearchKeyword@Title','zh-CN','标题','SearchKeyword','EntityProperty'),
('SearchWidget@AssemblyName','zh-CN','AssemblyName','SearchWidget','EntityProperty'),
('SearchWidget@IsSystem','zh-CN','IsSystem','SearchWidget','EntityProperty'),
('SearchWidget@IsTemplate','zh-CN','保存为模板','SearchWidget','EntityProperty'),
('SearchWidget@PartialView','zh-CN','显示模板','SearchWidget','EntityProperty'),
('SearchWidget@Position','zh-CN','排序','SearchWidget','EntityProperty'),
('SearchWidget@SearchKeywords','zh-CN','关键字','SearchWidget','EntityProperty'),
('SearchWidget@ServiceTypeName','zh-CN','ServiceTypeName','SearchWidget','EntityProperty'),
('SearchWidget@StyleClass','zh-CN','自定义样式','SearchWidget','EntityProperty'),
('SearchWidget@Thumbnail','zh-CN','缩略图','SearchWidget','EntityProperty'),
('SearchWidget@Title','zh-CN','标题','SearchWidget','EntityProperty'),
('SearchWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SearchWidget','EntityProperty'),
('SearchWidget@WidgetName','zh-CN','组件名称','SearchWidget','EntityProperty'),
('SearchWidget@ZoneID','zh-CN','区域','SearchWidget','EntityProperty'),
('Section Widget','en-GB','Custom Section',NULL,NULL),
('Section Widget','en-US','Custom Section',NULL,NULL),
('Section Widget','zh-CN','自定义',NULL,NULL),
('SectionContent@ActionType','zh-CN','ActionType','SectionContent','EntityProperty'),
('SectionContent@CreateBy','zh-CN','CreateBy','SectionContent','EntityProperty'),
('SectionContent@CreatebyName','zh-CN','创建人','SectionContent','EntityProperty'),
('SectionContent@CreateDate','zh-CN','创建日期','SectionContent','EntityProperty'),
('SectionContent@Description','zh-CN','描述','SectionContent','EntityProperty'),
('SectionContent@ID','zh-CN','ID','SectionContent','EntityProperty'),
('SectionContent@LastUpdateBy','zh-CN','LastUpdateBy','SectionContent','EntityProperty'),
('SectionContent@LastUpdateByName','zh-CN','更新人','SectionContent','EntityProperty'),
('SectionContent@LastUpdateDate','zh-CN','更新日期','SectionContent','EntityProperty'),
('SectionContent@Order','zh-CN','排序','SectionContent','EntityProperty'),
('SectionContent@SectionContentType','zh-CN','SectionContentType','SectionContent','EntityProperty'),
('SectionContent@SectionGroupId','zh-CN','SectionGroupId','SectionContent','EntityProperty'),
('SectionContent@SectionWidgetId','zh-CN','SectionWidgetId','SectionContent','EntityProperty'),
('SectionContent@Status','zh-CN','状态','SectionContent','EntityProperty'),
('SectionContent@Title','zh-CN','标题','SectionContent','EntityProperty'),
('SectionContentCallToAction@ActionType','zh-CN','ActionType','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@CreateBy','zh-CN','CreateBy','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@CreatebyName','zh-CN','创建人','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@CreateDate','zh-CN','创建日期','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@Description','zh-CN','描述','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@Href','zh-CN','链接','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@ID','zh-CN','ID','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@InnerText','zh-CN','标题','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@LastUpdateByName','zh-CN','更新人','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@LastUpdateDate','zh-CN','更新日期','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@Order','zh-CN','排序','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@SectionContentType','zh-CN','SectionContentType','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@SectionGroupId','zh-CN','SectionGroupId','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@Status','zh-CN','状态','SectionContentCallToAction','EntityProperty'),
('SectionContentCallToAction@Title','zh-CN','标题','SectionContentCallToAction','EntityProperty'),
('SectionContentImage@ActionType','zh-CN','ActionType','SectionContentImage','EntityProperty'),
('SectionContentImage@CreateBy','zh-CN','CreateBy','SectionContentImage','EntityProperty'),
('SectionContentImage@CreatebyName','zh-CN','创建人','SectionContentImage','EntityProperty'),
('SectionContentImage@CreateDate','zh-CN','创建日期','SectionContentImage','EntityProperty'),
('SectionContentImage@Description','zh-CN','描述','SectionContentImage','EntityProperty'),
('SectionContentImage@Height','zh-CN','高度(px)','SectionContentImage','EntityProperty'),
('SectionContentImage@Href','zh-CN','链接','SectionContentImage','EntityProperty'),
('SectionContentImage@ID','zh-CN','ID','SectionContentImage','EntityProperty'),
('SectionContentImage@ImageAlt','zh-CN','说明','SectionContentImage','EntityProperty'),
('SectionContentImage@ImageSrc','zh-CN','图片','SectionContentImage','EntityProperty'),
('SectionContentImage@ImageTitle','zh-CN','标题','SectionContentImage','EntityProperty'),
('SectionContentImage@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentImage','EntityProperty'),
('SectionContentImage@LastUpdateByName','zh-CN','更新人','SectionContentImage','EntityProperty'),
('SectionContentImage@LastUpdateDate','zh-CN','更新日期','SectionContentImage','EntityProperty'),
('SectionContentImage@Order','zh-CN','排序','SectionContentImage','EntityProperty'),
('SectionContentImage@SectionContentType','zh-CN','SectionContentType','SectionContentImage','EntityProperty'),
('SectionContentImage@SectionGroupId','zh-CN','SectionGroupId','SectionContentImage','EntityProperty'),
('SectionContentImage@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentImage','EntityProperty'),
('SectionContentImage@Status','zh-CN','状态','SectionContentImage','EntityProperty'),
('SectionContentImage@Title','zh-CN','标题','SectionContentImage','EntityProperty'),
('SectionContentImage@Width','zh-CN','宽度(px)','SectionContentImage','EntityProperty'),
('SectionContentParagraph@ActionType','zh-CN','ActionType','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@CreateBy','zh-CN','CreateBy','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@CreatebyName','zh-CN','创建人','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@CreateDate','zh-CN','创建日期','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@Description','zh-CN','描述','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@HtmlContent','zh-CN','内容','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@ID','zh-CN','ID','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@LastUpdateByName','zh-CN','更新人','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@LastUpdateDate','zh-CN','更新日期','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@Order','zh-CN','排序','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@SectionContentType','zh-CN','SectionContentType','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@SectionGroupId','zh-CN','SectionGroupId','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@Status','zh-CN','状态','SectionContentParagraph','EntityProperty'),
('SectionContentParagraph@Title','zh-CN','标题','SectionContentParagraph','EntityProperty'),
('SectionContentTitle@ActionType','zh-CN','ActionType','SectionContentTitle','EntityProperty'),
('SectionContentTitle@CreateBy','zh-CN','CreateBy','SectionContentTitle','EntityProperty'),
('SectionContentTitle@CreatebyName','zh-CN','创建人','SectionContentTitle','EntityProperty'),
('SectionContentTitle@CreateDate','zh-CN','创建日期','SectionContentTitle','EntityProperty'),
('SectionContentTitle@Description','zh-CN','描述','SectionContentTitle','EntityProperty'),
('SectionContentTitle@Href','zh-CN','链接','SectionContentTitle','EntityProperty'),
('SectionContentTitle@ID','zh-CN','ID','SectionContentTitle','EntityProperty'),
('SectionContentTitle@InnerText','zh-CN','标题','SectionContentTitle','EntityProperty'),
('SectionContentTitle@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentTitle','EntityProperty'),
('SectionContentTitle@LastUpdateByName','zh-CN','更新人','SectionContentTitle','EntityProperty'),
('SectionContentTitle@LastUpdateDate','zh-CN','更新日期','SectionContentTitle','EntityProperty'),
('SectionContentTitle@Order','zh-CN','排序','SectionContentTitle','EntityProperty'),
('SectionContentTitle@SectionContentType','zh-CN','SectionContentType','SectionContentTitle','EntityProperty'),
('SectionContentTitle@SectionGroupId','zh-CN','SectionGroupId','SectionContentTitle','EntityProperty'),
('SectionContentTitle@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentTitle','EntityProperty'),
('SectionContentTitle@Status','zh-CN','状态','SectionContentTitle','EntityProperty'),
('SectionContentTitle@Title','zh-CN','标题','SectionContentTitle','EntityProperty'),
('SectionContentTitle@TitleLevel','zh-CN','等级','SectionContentTitle','EntityProperty'),
('SectionContentVideo@ActionType','zh-CN','ActionType','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Code','zh-CN','视频代码','SectionContentVideo','EntityProperty'),
('SectionContentVideo@CreateBy','zh-CN','CreateBy','SectionContentVideo','EntityProperty'),
('SectionContentVideo@CreatebyName','zh-CN','CreatebyName','SectionContentVideo','EntityProperty'),
('SectionContentVideo@CreateDate','zh-CN','CreateDate','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Description','zh-CN','描述','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Height','zh-CN','高度(px)','SectionContentVideo','EntityProperty'),
('SectionContentVideo@ID','zh-CN','ID','SectionContentVideo','EntityProperty'),
('SectionContentVideo@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentVideo','EntityProperty'),
('SectionContentVideo@LastUpdateByName','zh-CN','LastUpdateByName','SectionContentVideo','EntityProperty'),
('SectionContentVideo@LastUpdateDate','zh-CN','LastUpdateDate','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Order','zh-CN','Order','SectionContentVideo','EntityProperty'),
('SectionContentVideo@SectionContentType','zh-CN','SectionContentType','SectionContentVideo','EntityProperty'),
('SectionContentVideo@SectionGroupId','zh-CN','SectionGroupId','SectionContentVideo','EntityProperty'),
('SectionContentVideo@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Status','zh-CN','状态','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Thumbnail','zh-CN','缩略图','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Title','zh-CN','Title','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Url','zh-CN','视频地址(MP4)','SectionContentVideo','EntityProperty'),
('SectionContentVideo@VideoTitle','zh-CN','标题','SectionContentVideo','EntityProperty'),
('SectionContentVideo@Width','zh-CN','宽度(px)','SectionContentVideo','EntityProperty'),
('SectionGroup@ActionType','zh-CN','ActionType','SectionGroup','EntityProperty'),
('SectionGroup@CallToAction','zh-CN','CallToAction','SectionGroup','EntityProperty'),
('SectionGroup@CallToActions','zh-CN','CallToActions','SectionGroup','EntityProperty'),
('SectionGroup@CreateBy','zh-CN','CreateBy','SectionGroup','EntityProperty'),
('SectionGroup@CreatebyName','zh-CN','创建人','SectionGroup','EntityProperty'),
('SectionGroup@CreateDate','zh-CN','创建日期','SectionGroup','EntityProperty'),
('SectionGroup@Description','zh-CN','描述','SectionGroup','EntityProperty'),
('SectionGroup@GroupName','zh-CN','组名','SectionGroup','EntityProperty'),
('SectionGroup@ID','zh-CN','ID','SectionGroup','EntityProperty'),
('SectionGroup@IsLoadDefaultData','zh-CN','IsLoadDefaultData','SectionGroup','EntityProperty'),
('SectionGroup@LastUpdateBy','zh-CN','LastUpdateBy','SectionGroup','EntityProperty'),
('SectionGroup@LastUpdateByName','zh-CN','更新人','SectionGroup','EntityProperty'),
('SectionGroup@LastUpdateDate','zh-CN','更新日期','SectionGroup','EntityProperty'),
('SectionGroup@Order','zh-CN','排序','SectionGroup','EntityProperty'),
('SectionGroup@Paragraph','zh-CN','Paragraph','SectionGroup','EntityProperty'),
('SectionGroup@Paragraphs','zh-CN','Paragraphs','SectionGroup','EntityProperty'),
('SectionGroup@PartialView','zh-CN','显示模板','SectionGroup','EntityProperty'),
('SectionGroup@PercentWidth','zh-CN','栅格列','SectionGroup','EntityProperty'),
('SectionGroup@SectionContents','zh-CN','SectionContents','SectionGroup','EntityProperty'),
('SectionGroup@SectionImage','zh-CN','SectionImage','SectionGroup','EntityProperty'),
('SectionGroup@SectionImages','zh-CN','SectionImages','SectionGroup','EntityProperty'),
('SectionGroup@SectionTitle','zh-CN','SectionTitle','SectionGroup','EntityProperty'),
('SectionGroup@SectionTitles','zh-CN','SectionTitles','SectionGroup','EntityProperty'),
('SectionGroup@SectionWidgetId','zh-CN','SectionWidgetId','SectionGroup','EntityProperty'),
('SectionGroup@Status','zh-CN','状态','SectionGroup','EntityProperty'),
('SectionGroup@Title','zh-CN','标题','SectionGroup','EntityProperty'),
('SectionWidget@ActionType','zh-CN','ActionType','SectionWidget','EntityProperty'),
('SectionWidget@AssemblyName','zh-CN','AssemblyName','SectionWidget','EntityProperty'),
('SectionWidget@CreateBy','zh-CN','CreateBy','SectionWidget','EntityProperty'),
('SectionWidget@CreatebyName','zh-CN','创建人','SectionWidget','EntityProperty'),
('SectionWidget@CreateDate','zh-CN','创建日期','SectionWidget','EntityProperty'),
('SectionWidget@CustomClass','zh-CN','CustomClass','SectionWidget','EntityProperty'),
('SectionWidget@CustomStyle','zh-CN','CustomStyle','SectionWidget','EntityProperty'),
('SectionWidget@Description','zh-CN','描述','SectionWidget','EntityProperty'),
('SectionWidget@ExtendData','zh-CN','ExtendData','SectionWidget','EntityProperty'),
('SectionWidget@ExtendFields','zh-CN','扩展属性','SectionWidget','EntityProperty'),
('SectionWidget@FormView','zh-CN','FormView','SectionWidget','EntityProperty'),
('SectionWidget@Groups','zh-CN','Groups','SectionWidget','EntityProperty'),
('SectionWidget@ID','zh-CN','ID','SectionWidget','EntityProperty'),
('SectionWidget@IsHorizontal','zh-CN','水平分组','SectionWidget','EntityProperty'),
('SectionWidget@IsSystem','zh-CN','IsSystem','SectionWidget','EntityProperty'),
('SectionWidget@IsTemplate','zh-CN','保存为模板','SectionWidget','EntityProperty'),
('SectionWidget@LastUpdateBy','zh-CN','LastUpdateBy','SectionWidget','EntityProperty'),
('SectionWidget@LastUpdateByName','zh-CN','更新人','SectionWidget','EntityProperty'),
('SectionWidget@LastUpdateDate','zh-CN','更新日期','SectionWidget','EntityProperty'),
('SectionWidget@LayoutID','zh-CN','布局','SectionWidget','EntityProperty'),
('SectionWidget@PageID','zh-CN','页面','SectionWidget','EntityProperty'),
('SectionWidget@PartDriver','zh-CN','PartDriver','SectionWidget','EntityProperty'),
('SectionWidget@PartialView','zh-CN','显示模板','SectionWidget','EntityProperty'),
('SectionWidget@Position','zh-CN','排序','SectionWidget','EntityProperty'),
('SectionWidget@SectionTitle','zh-CN','标题','SectionWidget','EntityProperty'),
('SectionWidget@ServiceTypeName','zh-CN','ServiceTypeName','SectionWidget','EntityProperty'),
('SectionWidget@Status','zh-CN','状态','SectionWidget','EntityProperty'),
('SectionWidget@StyleClass','zh-CN','自定义样式','SectionWidget','EntityProperty'),
('SectionWidget@Template','zh-CN','Template','SectionWidget','EntityProperty'),
('SectionWidget@Thumbnail','zh-CN','缩略图','SectionWidget','EntityProperty'),
('SectionWidget@Title','zh-CN','标题','SectionWidget','EntityProperty'),
('SectionWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SectionWidget','EntityProperty'),
('SectionWidget@WidgetName','zh-CN','组件名称','SectionWidget','EntityProperty'),
('SectionWidget@ZoneID','zh-CN','区域','SectionWidget','EntityProperty'),
('Security','zh-CN','安全',NULL,NULL),
('Select','zh-CN','选择',NULL,NULL),
('Select All','zh-CN','全选',NULL,NULL),
('Select package file','zh-CN','选择模板文件',NULL,NULL),
('Select widget then double click or click next.','zh-CN','选择组件，<strong>双击</strong>或者点击<strong>下一步</strong>',NULL,NULL),
('SEO Description','zh-CN','SEO描述',NULL,NULL),
('SEO Keywords','zh-CN','SEO关键字',NULL,NULL),
('se-resize','zh-CN','向右下改变大小',NULL,NULL),
('Setting','zh-CN','设置',NULL,NULL),
('Setting have saved, but an error occur when clean cache.','zh-CN','配置保存成功，但清空缓存时发生异常，请重试！',NULL,NULL),
('Shadow','en-GB','Shadow',NULL,NULL),
('Shadow','en-US','Shadow',NULL,NULL),
('Shadow','zh-CN','阴影',NULL,NULL),
('Shipped','zh-CN','已发货',NULL,NULL),
('Shipped orders','zh-CN','已发货订单',NULL,NULL),
('Shipping Address','zh-CN','收货地址',NULL,NULL),
('Shop','zh-CN','商城',NULL,NULL),
('Sign in','en-GB','Sign in',NULL,NULL),
('Sign in','en-US','Sign in',NULL,NULL),
('Sign in','zh-CN','立即登录',NULL,NULL),
('Sign Out','en-GB','Sign Out',NULL,NULL),
('Sign Out','en-US','Sign Out',NULL,NULL),
('Sign Out','zh-CN','退出',NULL,NULL),
('Sign up','en-GB','Sign up',NULL,NULL),
('Sign up','en-US','Sign up',NULL,NULL),
('Sign up','zh-CN','立即注册',NULL,NULL),
('Single domain','en-GB','Single domain',NULL,NULL),
('Single domain','en-US','Single domain',NULL,NULL),
('Single domain','zh-CN','单域名模式',NULL,NULL),
('Single Line','zh-CN','单行输入',NULL,NULL),
('Site Search','zh-CN','站内搜索',NULL,NULL),
('Site Templates','en-GB','Templates',NULL,NULL),
('Site Templates','en-US','Templates',NULL,NULL),
('Site Templates','zh-CN','成品模板',NULL,NULL),
('SiteSearchWidget@AssemblyName','zh-CN','AssemblyName','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@IsSystem','zh-CN','IsSystem','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@IsTemplate','zh-CN','保存为模板','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@PartialView','zh-CN','显示模板','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@Position','zh-CN','排序','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@SearchEngine','zh-CN','搜索引擎',NULL,'EntityProperty'),
('SiteSearchWidget@SearchQuery','zh-CN','Search Query','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@ServiceTypeName','zh-CN','ServiceTypeName','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@StyleClass','zh-CN','自定义样式','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@Thumbnail','zh-CN','缩略图','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@Title','zh-CN','标题','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@WidgetName','zh-CN','组件名称','SiteSearchWidget','EntityProperty'),
('SiteSearchWidget@ZoneID','zh-CN','区域','SiteSearchWidget','EntityProperty'),
('Size','zh-CN','大小',NULL,NULL),
('SM Screen','zh-CN','小屏幕',NULL,NULL),
('Small Caps','zh-CN','小字体',NULL,NULL),
('SMTP Config','en-GB','SMTP',NULL,NULL),
('SMTP Config','en-US','SMTP',NULL,NULL),
('SMTP Config','zh-CN','邮件服务器设置',NULL,NULL),
('SmtpSetting@Email','en-US','Email','SmtpSetting','EntityProperty'),
('SmtpSetting@Email','zh-CN','邮箱','SmtpSetting','EntityProperty'),
('SmtpSetting@EnableSsl','en-US','Enable Ssl','SmtpSetting','EntityProperty'),
('SmtpSetting@EnableSsl','zh-CN','启用SSL','SmtpSetting','EntityProperty'),
('SmtpSetting@Host','en-US','Host','SmtpSetting','EntityProperty'),
('SmtpSetting@Host','zh-CN','服务器','SmtpSetting','EntityProperty'),
('SmtpSetting@PassWord','en-US','Password','SmtpSetting','EntityProperty'),
('SmtpSetting@PassWord','zh-CN','密码','SmtpSetting','EntityProperty'),
('SmtpSetting@Port','en-US','Port','SmtpSetting','EntityProperty'),
('SmtpSetting@Port','zh-CN','端口','SmtpSetting','EntityProperty'),
('Solid','zh-CN','实线',NULL,NULL),
('Specify Article Detail','zh-CN','特定文章内容',NULL,NULL),
('Split View','zh-CN','分裂视图',NULL,NULL),
('SplitviewItem@ImageUrl','zh-CN','Image Url','SplitviewItem','EntityProperty'),
('SplitviewItem@TargetLink','zh-CN','Target Link','SplitviewItem','EntityProperty'),
('SplitviewWidget@AssemblyName','zh-CN','Assembly Name','SplitviewWidget','EntityProperty'),
('SplitviewWidget@Images','zh-CN','图片','SplitviewWidget','EntityProperty'),
('SplitviewWidget@IsSystem','zh-CN','Is System','SplitviewWidget','EntityProperty'),
('SplitviewWidget@IsTemplate','zh-CN','保存为模板','SplitviewWidget','EntityProperty'),
('SplitviewWidget@Position','zh-CN','排序','SplitviewWidget','EntityProperty'),
('SplitviewWidget@ServiceTypeName','zh-CN','Service Type Name','SplitviewWidget','EntityProperty'),
('SplitviewWidget@StyleClass','zh-CN','自定义样式','SplitviewWidget','EntityProperty'),
('SplitviewWidget@Thumbnail','zh-CN','缩略图','SplitviewWidget','EntityProperty'),
('SplitviewWidget@Title','zh-CN','标题','SplitviewWidget','EntityProperty'),
('SplitviewWidget@ViewModelTypeName','zh-CN','View Model Type Name','SplitviewWidget','EntityProperty'),
('SplitviewWidget@WidgetName','zh-CN','组件名称','SplitviewWidget','EntityProperty'),
('SplitviewWidget@ZoneID','zh-CN','区域','SplitviewWidget','EntityProperty'),
('s-resize','zh-CN','向下改变大小',NULL,NULL),
('Standalone domain','en-GB','Standalone domain',NULL,NULL),
('Standalone domain','en-US','Standalone domain',NULL,NULL),
('Standalone domain','zh-CN','独立域名模式',NULL,NULL),
('Starts With','en-GB','Starts With',NULL,NULL),
('Starts With','en-US','Starts With',NULL,NULL),
('Starts With','zh-CN','以…开头',NULL,NULL),
('Static','zh-CN','静止',NULL,NULL),
('StaticPageSetting@CacheMinutes','zh-CN','缓存时间（分钟）',NULL,'EntityProperty'),
('StaticPageSetting@CacheProvider','zh-CN','缓存方式',NULL,'EntityProperty'),
('StaticPageSetting@Enable','zh-CN','启用？',NULL,'EntityProperty'),
('StaticPageSetting@ExcludePages','zh-CN','例外页面',NULL,'EntityProperty'),
('Statistics@ActionType','zh-CN','ActionType','Statistics','EntityProperty'),
('Statistics@ContactName','zh-CN','ContactName','Statistics','EntityProperty'),
('Statistics@CreateBy','zh-CN','CreateBy','Statistics','EntityProperty'),
('Statistics@CreatebyName','zh-CN','CreatebyName','Statistics','EntityProperty'),
('Statistics@CreateDate','zh-CN','CreateDate','Statistics','EntityProperty'),
('Statistics@Description','zh-CN','描述','Statistics','EntityProperty'),
('Statistics@Host','zh-CN','Host','Statistics','EntityProperty'),
('Statistics@IpAddress','zh-CN','IpAddress','Statistics','EntityProperty'),
('Statistics@LastUpdateBy','zh-CN','LastUpdateBy','Statistics','EntityProperty'),
('Statistics@LastUpdateByName','zh-CN','LastUpdateByName','Statistics','EntityProperty'),
('Statistics@LastUpdateDate','zh-CN','LastUpdateDate','Statistics','EntityProperty'),
('Statistics@StatisticsId','zh-CN','StatisticsId','Statistics','EntityProperty'),
('Statistics@Status','zh-CN','状态','Statistics','EntityProperty'),
('Statistics@Tel','zh-CN','Tel','Statistics','EntityProperty'),
('Statistics@Title','zh-CN','标题','Statistics','EntityProperty'),
('StatisticsScript@Location','en-US','Location','StatisticsScript','EntityProperty'),
('StatisticsScript@Location','zh-CN','位置','GlobalScripts','EntityProperty'),
('StatisticsScript@Script','en-US','Script','StatisticsScript','EntityProperty'),
('StatisticsScript@Script','zh-CN','脚本','StatisticsScript','EntityProperty'),
('Status','zh-CN','状态',NULL,NULL),
('StrongPoint@Description','zh-CN','描述','StrongPoint','EntityProperty'),
('StrongPoint@Title','zh-CN','名称','StrongPoint','EntityProperty'),
('Style','en-GB','Style',NULL,NULL),
('Style','en-US','Style',NULL,NULL),
('Style','zh-CN','样式',NULL,NULL),
('Style A','zh-CN','样式A',NULL,NULL),
('Style B','zh-CN','样式B',NULL,NULL),
('Style C','zh-CN','样式C',NULL,NULL),
('Style D','zh-CN','样式D',NULL,NULL),
('Style E','zh-CN','样式E',NULL,NULL),
('Style F','zh-CN','样式F',NULL,NULL),
('Style G','zh-CN','样式G',NULL,NULL),
('StyleClass','zh-CN','自定义样式',NULL,NULL),
('StyleSheetWidget@ActionType','zh-CN','ActionType','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@AssemblyName','zh-CN','AssemblyName','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@CreateBy','zh-CN','CreateBy','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@CreatebyName','zh-CN','创建人','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@CreateDate','zh-CN','创建日期','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@CustomClass','zh-CN','CustomClass','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@CustomStyle','zh-CN','CustomStyle','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@Description','zh-CN','描述','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@ExtendFields','zh-CN','扩展属性','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@FormView','zh-CN','FormView','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@ID','zh-CN','ID','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@IsSystem','zh-CN','IsSystem','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@IsTemplate','zh-CN','保存为模板','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@LastUpdateBy','zh-CN','LastUpdateBy','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@LastUpdateByName','zh-CN','更新人','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@LastUpdateDate','zh-CN','更新日期','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@LayoutID','zh-CN','LayoutID','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@PageID','zh-CN','PageID','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@PartDriver','zh-CN','PartDriver','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@PartialView','zh-CN','显示模板','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@Position','zh-CN','排序','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@ServiceTypeName','zh-CN','ServiceTypeName','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@Status','zh-CN','状态','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@StyleClass','zh-CN','自定义样式','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@StyleSheet','zh-CN','样式','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@Thumbnail','zh-CN','缩略图','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@Title','zh-CN','标题','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@WidgetName','zh-CN','组件名称','StyleSheetWidget','EntityProperty'),
('StyleSheetWidget@ZoneID','zh-CN','区域','StyleSheetWidget','EntityProperty'),
('Submit','zh-CN','提交',NULL,NULL),
('Subscribe','en-US','Subscribe',NULL,NULL),
('Subscribe','zh-CN','订阅',NULL,NULL),
('Subscriber@CreatebyName','zh-CN','创建人',NULL,NULL),
('Subscriber@CreateDate','zh-CN','创建日期',NULL,NULL),
('Subscriber@IsValidate','zh-CN','已验证？',NULL,NULL),
('Subscriber@LastUpdateByName','zh-CN','更新人',NULL,NULL),
('Subscriber@LastUpdateDate','zh-CN','更新日期',NULL,NULL),
('Subscriber@Referrer','zh-CN','来源',NULL,NULL),
('Subscription','en-US','Subscription',NULL,NULL),
('Subscription','zh-CN','订阅',NULL,NULL),
('Subscription_Body_Copy','en-US','Subscribe by email, you will be able to receive our related information at the first time',NULL,NULL),
('Subscription_Body_Copy','zh-CN','通过邮箱订阅我们，您将可以在第一时间收到我们的相关信息',NULL,NULL),
('Subscription_Email_Confirm_Button','en-US','Yes, I want to subscribe',NULL,NULL),
('Subscription_Email_Confirm_Button','zh-CN','是的，我想要订阅',NULL,NULL),
('Subscription_Email_Confirm_Copy','en-US','You will not be subscribed if you don''t click on the link above.',NULL,NULL),
('Subscription_Email_Confirm_Copy','zh-CN','如果您不点击上方链接，您将不会订阅我们。',NULL,NULL),
('Subscription_Email_Confirm_Title','en-US','Confirm Your Subscription',NULL,NULL),
('Subscription_Email_Confirm_Title','zh-CN','确认订阅我们',NULL,NULL),
('Subscription_Email_Unscribe_Button','en-US','Yes, I want to unsubscribe',NULL,NULL),
('Subscription_Email_Unscribe_Button','zh-CN','是的，我想要取消订阅',NULL,NULL),
('Subscription_Email_Unscribe_Copy','en-US','You will not be unsubscribed if you don''t click on the link above.',NULL,NULL),
('Subscription_Email_Unscribe_Copy','zh-CN','如果您不点击上方链接，您将不会取消订阅我们。',NULL,NULL),
('Subscription_Email_Unscribe_Title','en-US','Unsubscribe confirm',NULL,NULL),
('Subscription_Email_Unscribe_Title','zh-CN','取消订阅我们',NULL,NULL),
('Subscription_Footer_Copy','en-US','We promise to handle your information in line with our privacy policy.',NULL,NULL),
('Subscription_Footer_Copy','zh-CN','我们承诺严格遵守隐私政策处理您的信息。',NULL,NULL),
('Subscription_Header_Copy','en-US','Be the first to know',NULL,NULL),
('Subscription_Header_Copy','zh-CN','第一时间了解最新动态',NULL,NULL),
('Subscription_Subscribe_Thank_Copy','en-US','Thanks for confirming your email address!',NULL,NULL),
('Subscription_Subscribe_Thank_Copy','zh-CN','感谢您确认您的邮件地址！',NULL,NULL),
('Subscription_Subscribed_Title','en-US','You''ve Been Subscribed',NULL,NULL),
('Subscription_Subscribed_Title','zh-CN','您已订阅成功',NULL,NULL),
('Subscription_Unsubscribed_Copy','en-US','We have sent you an email to confirm',NULL,NULL),
('Subscription_Unsubscribed_Copy','zh-CN','我们已经给您发送了取消订阅确认邮件',NULL,NULL),
('Subscription_Unsubscribed_Title','en-US','You''ve Been Unsubscribed',NULL,NULL),
('Subscription_Unsubscribed_Title','zh-CN','您已取消订阅',NULL,NULL),
('Subscription_Unsubscribing_Copy','en-US','We will send you an email to confirm',NULL,NULL),
('Subscription_Unsubscribing_Copy','zh-CN','我们会给您发送取消订阅确认邮件',NULL,NULL),
('Subscription_Unsubscribing_Title','en-US','You are unsubscribing',NULL,NULL),
('Subscription_Unsubscribing_Title','zh-CN','您正在取消订阅',NULL,NULL),
('SubscriptionSetting@IsEnable','zh-CN','是否启用？',NULL,NULL),
('Success','zh-CN','成功',NULL,NULL),
('Switch Template','zh-CN','切换模板',NULL,NULL),
('Switching Theme...','zh-CN','切换主题中...',NULL,NULL),
('sw-resize','zh-CN','向左下改变大小',NULL,NULL),
('System','en-GB','System',NULL,NULL),
('System','en-US','System',NULL,NULL),
('System','zh-CN','系统',NULL,NULL),
('Tab','zh-CN','标签页',NULL,NULL),
('TabItem@Description','zh-CN','描述','TabItem','EntityProperty'),
('TabItem@Status','zh-CN','状态','TabItem','EntityProperty'),
('TabItem@Title','zh-CN','标题','TabItem','EntityProperty'),
('Tablet (≥768px)','zh-CN','平板 (≥768px)',NULL,NULL),
('TabWidget@AssemblyName','zh-CN','Assembly Name','TabWidget','EntityProperty'),
('TabWidget@IsSystem','zh-CN','Is System','TabWidget','EntityProperty'),
('TabWidget@IsTemplate','zh-CN','保存为模板','TabWidget','EntityProperty'),
('TabWidget@PartialView','zh-CN','显示模板','TabWidget','EntityProperty'),
('TabWidget@Position','zh-CN','排序','TabWidget','EntityProperty'),
('TabWidget@ServiceTypeName','zh-CN','Service Type Name','TabWidget','EntityProperty'),
('TabWidget@StyleClass','zh-CN','自定义样式','TabWidget','EntityProperty'),
('TabWidget@TabItems','zh-CN','标签项','TabWidget','EntityProperty'),
('TabWidget@Thumbnail','zh-CN','缩略图','TabWidget','EntityProperty'),
('TabWidget@Title','zh-CN','标题','TabWidget','EntityProperty'),
('TabWidget@ViewModelTypeName','zh-CN','View Model Type Name','TabWidget','EntityProperty'),
('TabWidget@WidgetName','zh-CN','组件名称','TabWidget','EntityProperty'),
('TabWidget@ZoneID','zh-CN','区域','TabWidget','EntityProperty'),
('Tag','en-GB','Tag',NULL,NULL),
('Tag','en-US','Tag',NULL,NULL),
('Tag','zh-CN','标签',NULL,NULL),
('TemplateFile@Content','zh-CN','模板代码','TemplateFile','EntityProperty'),
('TemplateFile@Id','zh-CN','Id','TemplateFile','EntityProperty'),
('TemplateFile@LastUpdateTime','en-US','Last Update Time','TemplateFile','EntityProperty'),
('TemplateFile@LastUpdateTime','zh-CN','最后更新时间','TemplateFile','EntityProperty'),
('TemplateFile@Name','en-US','Name','TemplateFile','EntityProperty'),
('TemplateFile@Name','zh-CN','名称','TemplateFile','EntityProperty'),
('TemplateFile@RelativePath','en-US','Relative Path','TemplateFile','EntityProperty'),
('TemplateFile@RelativePath','zh-CN','模板路径','TemplateFile','EntityProperty'),
('TemplateFile@ThemeName','en-US','Theme Name','TemplateFile','EntityProperty'),
('TemplateFile@ThemeName','zh-CN','主题','TemplateFile','EntityProperty'),
('Test Page','en-GB','Test Page',NULL,NULL),
('Test Page','en-US','Test Page',NULL,NULL),
('Test Page','zh-CN','页面检测',NULL,NULL),
('Text','zh-CN','文本',NULL,NULL),
('Text Blur','zh-CN','模糊',NULL,NULL),
('Text Cursor','zh-CN','光标',NULL,NULL),
('Text Horizontal','zh-CN','水平大小',NULL,NULL),
('Text Shadow','zh-CN','文字阴影',NULL,NULL),
('Text Title','en-GB','Title',NULL,NULL),
('Text Title','en-US','Title',NULL,NULL),
('Text Title','zh-CN','文字标题',NULL,NULL),
('Text Vertical','zh-CN','垂直大小',NULL,NULL),
('Thank you for sign up','en-GB','Thank you!',NULL,NULL),
('Thank you for sign up','en-US','Thank you!',NULL,NULL),
('Thank you for sign up','zh-CN','注册结果',NULL,NULL),
('The max length of {0} is {1}','zh-CN','{0}的长度应小于{1}',NULL,NULL),
('The order is closed!','zh-CN','订单已关闭！',NULL,NULL),
('The page more than a <h1> tag','zh-CN','页面中的<h1>标签超过了1个',NULL,NULL),
('The page must be published before it can be accessed via the URL.','zh-CN','只有在页面发布之后才可查看！',NULL,NULL),
('The page must be published before it can be accessed via the URL. Modifying the page does not affect','en-GB','The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.',NULL,NULL),
('The page must be published before it can be accessed via the URL. Modifying the page does not affect','en-US','The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.',NULL,NULL),
('The page must be published before it can be accessed via the URL. Modifying the page does not affect','zh-CN','页面必须要发布才可以通过网址访问。对页面进行修改不会影响到已发布版本，直到下一次发布。',NULL,NULL),
('The page should have a <h1> tag','zh-CN','页面中应当有一个<h1>标签',NULL,NULL),
('The parent node does not create a corresponding language','zh-CN','父级结节未创建对应语言',NULL,NULL),
('The setting key is already exists','zh-CN','已经存在该键值',NULL,NULL),
('The template is being used, could not delete','zh-CN','该模板被使用中，无法删除',NULL,NULL),
('Theme','en-GB','Theme',NULL,NULL),
('Theme','en-US','Theme',NULL,NULL),
('Theme','zh-CN','主题',NULL,NULL),
('Theme Template','zh-CN','主题模板',NULL,NULL),
('ThemeEntity@ActionType','zh-CN','ActionType','ThemeEntity','EntityProperty'),
('ThemeEntity@CreateBy','zh-CN','CreateBy','ThemeEntity','EntityProperty'),
('ThemeEntity@CreatebyName','zh-CN','CreatebyName','ThemeEntity','EntityProperty'),
('ThemeEntity@CreateDate','zh-CN','CreateDate','ThemeEntity','EntityProperty'),
('ThemeEntity@Description','zh-CN','描述','ThemeEntity','EntityProperty'),
('ThemeEntity@ID','zh-CN','ID','ThemeEntity','EntityProperty'),
('ThemeEntity@IsActived','zh-CN','IsActived','ThemeEntity','EntityProperty'),
('ThemeEntity@IsPreView','zh-CN','IsPreView','ThemeEntity','EntityProperty'),
('ThemeEntity@LastUpdateBy','zh-CN','LastUpdateBy','ThemeEntity','EntityProperty'),
('ThemeEntity@LastUpdateByName','zh-CN','LastUpdateByName','ThemeEntity','EntityProperty'),
('ThemeEntity@LastUpdateDate','zh-CN','LastUpdateDate','ThemeEntity','EntityProperty'),
('ThemeEntity@Status','zh-CN','状态','ThemeEntity','EntityProperty'),
('ThemeEntity@Title','zh-CN','标题','ThemeEntity','EntityProperty'),
('ThemeEntity@Url','zh-CN','Url','ThemeEntity','EntityProperty'),
('ThemeEntity@UrlDebugger','zh-CN','UrlDebugger','ThemeEntity','EntityProperty'),
('There is an error value in the condition, save failed!','zh-CN','条件中的值有错误，保存失败！',NULL,NULL),
('There is no messages...','zh-CN','还没有留言……',NULL,NULL),
('This is required','zh-CN','这是必填项',NULL,NULL),
('Thumbnail','zh-CN','缩略图',NULL,NULL),
('Title','zh-CN','标题',NULL,NULL),
('Today','en-GB','Today',NULL,NULL),
('Today','en-US','Today',NULL,NULL),
('Today','zh-CN','当前日期',NULL,NULL),
('Toggle Container','zh-CN','切换容器',NULL,NULL),
('Top Article','en-GB','Top Article',NULL,NULL),
('Top Article','en-US','Top Article',NULL,NULL),
('Top Article','zh-CN','置顶文章',NULL,NULL),
('Total','zh-CN','总计',NULL,NULL),
('Total Articles:','zh-CN','文章总数：',NULL,NULL),
('Total Comments','zh-CN','条评论',NULL,NULL),
('Total:','zh-CN','合计：',NULL,NULL),
('Tracking number:','zh-CN','运单：',NULL,NULL),
('Traid Finished','zh-CN','交易完成',NULL,NULL),
('Translate','en-GB','Translate',NULL,NULL),
('Translate','en-US','Translate',NULL,NULL),
('Translate','zh-CN','翻译',NULL,NULL),
('Translation','en-GB','Translation',NULL,NULL),
('Translation','en-US','Translation',NULL,NULL),
('Translation','zh-CN','翻译内容',NULL,NULL),
('Translation Key','en-GB','Key',NULL,NULL),
('Translation Key','en-US','Key',NULL,NULL),
('Translation Key','zh-CN','翻译键',NULL,NULL),
('Translation key is already exists','zh-CN','翻译键已存在',NULL,NULL),
('Underline','zh-CN','底线',NULL,NULL),
('Underline Overline','zh-CN','上下线',NULL,NULL),
('Unmarried','en-GB','Unmarried',NULL,NULL),
('Unmarried','en-US','Unmarried',NULL,NULL),
('Unmarried','zh-CN','未婚',NULL,NULL),
('Unpaid','zh-CN','未支付',NULL,NULL),
('Unpaid order','zh-CN','订单未支付',NULL,NULL),
('Unpaid orders','zh-CN','未支付订单',NULL,NULL),
('Unpublished','zh-CN','未发布',NULL,NULL),
('Unsubscribe','en-US','Unsubscribe',NULL,NULL),
('Unsubscribe','zh-CN','取消订阅',NULL,NULL),
('Update Index','zh-CN','更新索引',NULL,NULL),
('Update site index','zh-CN','更新网站索引',NULL,NULL),
('Upload','en-GB','Upload',NULL,NULL),
('Upload','en-US','Upload',NULL,NULL),
('Upload','zh-CN','上传文件',NULL,NULL),
('Upload failed','zh-CN','文件上传失败',NULL,NULL),
('Upload Section','en-GB','Upload Section',NULL,NULL),
('Upload Section','en-US','Upload Section',NULL,NULL),
('Upload Section','zh-CN','安装板块',NULL,NULL),
('Uppercase','zh-CN','大写',NULL,NULL),
('URL already exists','zh-CN','Url已存在',NULL,NULL),
('Url Redirect','en-GB','Url  Redirect',NULL,NULL),
('Url Redirect','en-US','Url  Redirect',NULL,NULL),
('Url Redirect','zh-CN','URL重定向',NULL,NULL),
('UrlRedirect@ActionType','zh-CN','ActionType','UrlRedirect','EntityProperty'),
('UrlRedirect@CreateBy','zh-CN','CreateBy','UrlRedirect','EntityProperty'),
('UrlRedirect@CreatebyName','en-GB','Create By','UrlRedirect','EntityProperty'),
('UrlRedirect@CreatebyName','en-US','Create By','UrlRedirect','EntityProperty'),
('UrlRedirect@CreatebyName','zh-CN','创建人','UrlRedirect','EntityProperty'),
('UrlRedirect@CreateDate','en-GB','Create Date','UrlRedirect','EntityProperty'),
('UrlRedirect@CreateDate','en-US','Create Date','UrlRedirect','EntityProperty'),
('UrlRedirect@CreateDate','zh-CN','创建日期','UrlRedirect','EntityProperty'),
('UrlRedirect@Description','en-GB','Description','UrlRedirect','EntityProperty'),
('UrlRedirect@Description','en-US','Description','UrlRedirect','EntityProperty'),
('UrlRedirect@Description','zh-CN','描述','UrlRedirect','EntityProperty'),
('UrlRedirect@DestinationURL','en-GB','Destination Url',NULL,'EntityProperty'),
('UrlRedirect@DestinationURL','en-US','Destination Url',NULL,'EntityProperty'),
('UrlRedirect@DestinationURL','zh-CN','跳转地址',NULL,'EntityProperty'),
('UrlRedirect@ID','zh-CN','ID','UrlRedirect','EntityProperty'),
('UrlRedirect@InComingUrl','en-GB','In Coming Url','UrlRedirect','EntityProperty'),
('UrlRedirect@InComingUrl','en-US','In Coming Url','UrlRedirect','EntityProperty'),
('UrlRedirect@InComingUrl','zh-CN','访问地址','UrlRedirect','EntityProperty'),
('UrlRedirect@IsPattern','zh-CN','使用正则表达式？',NULL,NULL),
('UrlRedirect@IsPermanent','en-GB','Is Permanent','UrlRedirect','EntityProperty'),
('UrlRedirect@IsPermanent','en-US','Is Permanent','UrlRedirect','EntityProperty'),
('UrlRedirect@IsPermanent','zh-CN','永久？','UrlRedirect','EntityProperty'),
('UrlRedirect@LastUpdateBy','zh-CN','LastUpdateBy','UrlRedirect','EntityProperty'),
('UrlRedirect@LastUpdateByName','en-GB','Last Update By','UrlRedirect','EntityProperty'),
('UrlRedirect@LastUpdateByName','en-US','Last Update By','UrlRedirect','EntityProperty'),
('UrlRedirect@LastUpdateByName','zh-CN','更新人','UrlRedirect','EntityProperty'),
('UrlRedirect@LastUpdateDate','en-GB','Last Update Date','UrlRedirect','EntityProperty'),
('UrlRedirect@LastUpdateDate','en-US','Last Update Date','UrlRedirect','EntityProperty'),
('UrlRedirect@LastUpdateDate','zh-CN','更新日期','UrlRedirect','EntityProperty'),
('UrlRedirect@Status','en-GB','Status','UrlRedirect','EntityProperty'),
('UrlRedirect@Status','en-US','Status','UrlRedirect','EntityProperty'),
('UrlRedirect@Status','zh-CN','状态','UrlRedirect','EntityProperty'),
('UrlRedirect@Title','en-GB','Title','UrlRedirect','EntityProperty'),
('UrlRedirect@Title','en-US','Title','UrlRedirect','EntityProperty'),
('UrlRedirect@Title','zh-CN','标题','UrlRedirect','EntityProperty'),
('User','en-GB','User',NULL,NULL),
('User','en-US','User',NULL,NULL),
('User','zh-CN','用户',NULL,NULL),
('User name password is incorrect','zh-CN','用户名密码不正确',NULL,NULL),
('UserEntity@ActionType','zh-CN','ActionType','UserEntity','EntityProperty'),
('UserEntity@Address','en-GB','Address','UserEntity','EntityProperty'),
('UserEntity@Address','en-US','Address','UserEntity','EntityProperty'),
('UserEntity@Address','zh-CN','地址','UserEntity','EntityProperty'),
('UserEntity@Age','en-GB','Age','UserEntity','EntityProperty'),
('UserEntity@Age','en-US','Age','UserEntity','EntityProperty'),
('UserEntity@Age','zh-CN','年龄','UserEntity','EntityProperty'),
('UserEntity@ApiLoginToken','zh-CN','ApiLoginToken','UserEntity','EntityProperty'),
('UserEntity@AuthenticationType','zh-CN','AuthenticationType','UserEntity','EntityProperty'),
('UserEntity@Birthday','en-GB','Birthday','UserEntity','EntityProperty'),
('UserEntity@Birthday','en-US','Birthday','UserEntity','EntityProperty'),
('UserEntity@Birthday','zh-CN','出生日期','UserEntity','EntityProperty'),
('UserEntity@Birthplace','en-GB','Birthplace','UserEntity','EntityProperty'),
('UserEntity@Birthplace','en-US','Birthplace','UserEntity','EntityProperty'),
('UserEntity@Birthplace','zh-CN','出生地','UserEntity','EntityProperty'),
('UserEntity@CreateBy','zh-CN','CreateBy','UserEntity','EntityProperty'),
('UserEntity@CreatebyName','en-GB','Create By','UserEntity','EntityProperty'),
('UserEntity@CreatebyName','en-US','Create By','UserEntity','EntityProperty'),
('UserEntity@CreatebyName','zh-CN','创建人','UserEntity','EntityProperty'),
('UserEntity@CreateDate','en-GB','Create Date','UserEntity','EntityProperty'),
('UserEntity@CreateDate','en-US','Create Date','UserEntity','EntityProperty'),
('UserEntity@CreateDate','zh-CN','创建日期','UserEntity','EntityProperty'),
('UserEntity@Description','en-GB','Description','UserEntity','EntityProperty'),
('UserEntity@Description','en-US','Description','UserEntity','EntityProperty'),
('UserEntity@Description','zh-CN','描述','UserEntity','EntityProperty'),
('UserEntity@Email','en-GB','Email','UserEntity','EntityProperty'),
('UserEntity@Email','en-US','Email','UserEntity','EntityProperty'),
('UserEntity@Email','zh-CN','邮箱','UserEntity','EntityProperty'),
('UserEntity@EnglishName','en-GB','English Name','UserEntity','EntityProperty'),
('UserEntity@EnglishName','en-US','English Name','UserEntity','EntityProperty'),
('UserEntity@EnglishName','zh-CN','英文名','UserEntity','EntityProperty'),
('UserEntity@FirstName','en-GB','First Name','UserEntity','EntityProperty'),
('UserEntity@FirstName','en-US','First Name','UserEntity','EntityProperty'),
('UserEntity@FirstName','zh-CN','名','UserEntity','EntityProperty'),
('UserEntity@Hobby','en-GB','Hobby','UserEntity','EntityProperty'),
('UserEntity@Hobby','en-US','Hobby','UserEntity','EntityProperty'),
('UserEntity@Hobby','zh-CN','爱好','UserEntity','EntityProperty'),
('UserEntity@ID','zh-CN','ID','UserEntity','EntityProperty'),
('UserEntity@IsAuthenticated','zh-CN','IsAuthenticated','UserEntity','EntityProperty'),
('UserEntity@LastLoginDate','zh-CN','最后登录时间','UserEntity','EntityProperty'),
('UserEntity@LastName','en-GB','Last Name','UserEntity','EntityProperty'),
('UserEntity@LastName','en-US','Last Name','UserEntity','EntityProperty'),
('UserEntity@LastName','zh-CN','姓','UserEntity','EntityProperty'),
('UserEntity@LastUpdateBy','zh-CN','LastUpdateBy','UserEntity','EntityProperty'),
('UserEntity@LastUpdateByName','en-GB','Last Update By','UserEntity','EntityProperty'),
('UserEntity@LastUpdateByName','en-US','Last Update By','UserEntity','EntityProperty'),
('UserEntity@LastUpdateByName','zh-CN','更新人','UserEntity','EntityProperty'),
('UserEntity@LastUpdateDate','en-GB','Last Update Date','UserEntity','EntityProperty'),
('UserEntity@LastUpdateDate','en-US','Last Update Date','UserEntity','EntityProperty'),
('UserEntity@LastUpdateDate','zh-CN','更新日期','UserEntity','EntityProperty'),
('UserEntity@LoginIP','zh-CN','LoginIP','UserEntity','EntityProperty'),
('UserEntity@MaritalStatus','en-GB','Marital Status','UserEntity','EntityProperty'),
('UserEntity@MaritalStatus','en-US','Marital Status','UserEntity','EntityProperty'),
('UserEntity@MaritalStatus','zh-CN','婚姻情况','UserEntity','EntityProperty'),
('UserEntity@MobilePhone','en-GB','Mobile Phone','UserEntity','EntityProperty'),
('UserEntity@MobilePhone','en-US','Mobile Phone','UserEntity','EntityProperty'),
('UserEntity@MobilePhone','zh-CN','手机号码','UserEntity','EntityProperty'),
('UserEntity@Name','zh-CN','Name','UserEntity','EntityProperty'),
('UserEntity@NickName','en-GB','Nick Name','UserEntity','EntityProperty'),
('UserEntity@NickName','en-US','Nick Name','UserEntity','EntityProperty'),
('UserEntity@NickName','zh-CN','昵称','UserEntity','EntityProperty'),
('UserEntity@PassWord','zh-CN','密码','UserEntity','EntityProperty'),
('UserEntity@PassWordNew','en-GB','Pass Word New','UserEntity','EntityProperty'),
('UserEntity@PassWordNew','en-US','Pass Word New','UserEntity','EntityProperty'),
('UserEntity@PassWordNew','zh-CN','密码','UserEntity','EntityProperty'),
('UserEntity@PhotoUrl','en-GB','Photo Url','UserEntity','EntityProperty'),
('UserEntity@PhotoUrl','en-US','Photo Url','UserEntity','EntityProperty'),
('UserEntity@PhotoUrl','zh-CN','头像','UserEntity','EntityProperty'),
('UserEntity@Profession','en-GB','Profession','UserEntity','EntityProperty'),
('UserEntity@Profession','en-US','Profession','UserEntity','EntityProperty'),
('UserEntity@Profession','zh-CN','专业技能','UserEntity','EntityProperty'),
('UserEntity@QQ','en-GB','QQ',NULL,'EntityProperty'),
('UserEntity@QQ','en-US','QQ',NULL,'EntityProperty'),
('UserEntity@QQ','zh-CN','QQ',NULL,'EntityProperty'),
('UserEntity@ResetToken','zh-CN','ResetToken','UserEntity','EntityProperty'),
('UserEntity@ResetTokenDate','zh-CN','ResetTokenDate','UserEntity','EntityProperty'),
('UserEntity@Roles','en-GB','Roles','UserEntity','EntityProperty'),
('UserEntity@Roles','en-US','Roles','UserEntity','EntityProperty'),
('UserEntity@Roles','zh-CN','角色','UserEntity','EntityProperty'),
('UserEntity@School','en-GB','School','UserEntity','EntityProperty'),
('UserEntity@School','en-US','School','UserEntity','EntityProperty'),
('UserEntity@School','zh-CN','学校','UserEntity','EntityProperty'),
('UserEntity@Sex','en-GB','Sex','UserEntity','EntityProperty'),
('UserEntity@Sex','en-US','Sex','UserEntity','EntityProperty'),
('UserEntity@Sex','zh-CN','性别','UserEntity','EntityProperty'),
('UserEntity@Status','en-GB','Status','UserEntity','EntityProperty'),
('UserEntity@Status','en-US','Status','UserEntity','EntityProperty'),
('UserEntity@Status','zh-CN','状态','UserEntity','EntityProperty'),
('UserEntity@Telephone','en-GB','Telephone','UserEntity','EntityProperty'),
('UserEntity@Telephone','en-US','Telephone','UserEntity','EntityProperty'),
('UserEntity@Telephone','zh-CN','联系电话','UserEntity','EntityProperty'),
('UserEntity@Timestamp','en-GB','Timestamp','UserEntity','EntityProperty'),
('UserEntity@Timestamp','en-US','Timestamp','UserEntity','EntityProperty'),
('UserEntity@Timestamp','zh-CN','Timestamp','UserEntity','EntityProperty'),
('UserEntity@Title','zh-CN','标题','UserEntity','EntityProperty'),
('UserEntity@UserID','en-GB','User','UserEntity','EntityProperty'),
('UserEntity@UserID','en-US','User','UserEntity','EntityProperty'),
('UserEntity@UserID','zh-CN','登录名','UserEntity','EntityProperty'),
('UserEntity@UserName','en-GB','User Name','UserEntity','EntityProperty'),
('UserEntity@UserName','en-US','User Name','UserEntity','EntityProperty'),
('UserEntity@UserName','zh-CN','用户名','UserEntity','EntityProperty'),
('UserEntity@UserTypeCD','en-GB','User Type',NULL,'EntityProperty'),
('UserEntity@UserTypeCD','en-US','User Type',NULL,'EntityProperty'),
('UserEntity@UserTypeCD','zh-CN','用户类别',NULL,'EntityProperty'),
('UserEntity@ZipCode','en-GB','Zip Code','UserEntity','EntityProperty'),
('UserEntity@ZipCode','en-US','Zip Code','UserEntity','EntityProperty'),
('UserEntity@ZipCode','zh-CN','邮编','UserEntity','EntityProperty'),
('Username','en-GB','Username',NULL,NULL),
('Username','en-US','Username',NULL,NULL),
('Username','zh-CN','姓名',NULL,NULL),
('UserRoleRelation@ActionType','zh-CN','ActionType','UserRoleRelation','EntityProperty'),
('UserRoleRelation@CreateBy','zh-CN','CreateBy','UserRoleRelation','EntityProperty'),
('UserRoleRelation@CreatebyName','zh-CN','创建人','UserRoleRelation','EntityProperty'),
('UserRoleRelation@CreateDate','zh-CN','创建日期','UserRoleRelation','EntityProperty'),
('UserRoleRelation@Description','zh-CN','描述','UserRoleRelation','EntityProperty'),
('UserRoleRelation@ID','zh-CN','ID','UserRoleRelation','EntityProperty'),
('UserRoleRelation@LastUpdateBy','zh-CN','LastUpdateBy','UserRoleRelation','EntityProperty'),
('UserRoleRelation@LastUpdateByName','zh-CN','更新人','UserRoleRelation','EntityProperty'),
('UserRoleRelation@LastUpdateDate','zh-CN','更新日期','UserRoleRelation','EntityProperty'),
('UserRoleRelation@RoleID','en-GB','Role','UserRoleRelation','EntityProperty'),
('UserRoleRelation@RoleID','en-US','Role','UserRoleRelation','EntityProperty'),
('UserRoleRelation@RoleID','zh-CN','角色','UserRoleRelation','EntityProperty'),
('UserRoleRelation@Status','zh-CN','状态','UserRoleRelation','EntityProperty'),
('UserRoleRelation@Title','zh-CN','标题','UserRoleRelation','EntityProperty'),
('UserRoleRelation@UserID','zh-CN','登录名','UserRoleRelation','EntityProperty'),
('Value','zh-CN','值',NULL,NULL),
('Version','en-GB','Version',NULL,NULL),
('Version','en-US','Version',NULL,NULL),
('Version','zh-CN','版本',NULL,NULL),
('Versions','en-GB','Versions',NULL,NULL),
('Versions','en-US','Versions',NULL,NULL),
('Versions','zh-CN','历史版本',NULL,NULL),
('Video','en-GB','Video',NULL,NULL),
('Video','en-US','Video',NULL,NULL),
('Video','zh-CN','视频',NULL,NULL),
('VideoWidget@ActionType','zh-CN','ActionType','VideoWidget','EntityProperty'),
('VideoWidget@AssemblyName','zh-CN','AssemblyName','VideoWidget','EntityProperty'),
('VideoWidget@Code','zh-CN','视频代码','VideoWidget','EntityProperty'),
('VideoWidget@CreateBy','zh-CN','CreateBy','VideoWidget','EntityProperty'),
('VideoWidget@CreatebyName','zh-CN','CreatebyName','VideoWidget','EntityProperty'),
('VideoWidget@CreateDate','zh-CN','CreateDate','VideoWidget','EntityProperty'),
('VideoWidget@CustomClass','zh-CN','CustomClass','VideoWidget','EntityProperty'),
('VideoWidget@CustomStyle','zh-CN','CustomStyle','VideoWidget','EntityProperty'),
('VideoWidget@Description','zh-CN','描述','VideoWidget','EntityProperty'),
('VideoWidget@ExtendFields','zh-CN','扩展属性','VideoWidget','EntityProperty'),
('VideoWidget@FormView','zh-CN','FormView','VideoWidget','EntityProperty'),
('VideoWidget@Height','zh-CN','高度(px)','VideoWidget','EntityProperty'),
('VideoWidget@ID','zh-CN','ID','VideoWidget','EntityProperty'),
('VideoWidget@IsSystem','zh-CN','IsSystem','VideoWidget','EntityProperty'),
('VideoWidget@IsTemplate','zh-CN','保存为模板','VideoWidget','EntityProperty'),
('VideoWidget@LastUpdateBy','zh-CN','LastUpdateBy','VideoWidget','EntityProperty'),
('VideoWidget@LastUpdateByName','zh-CN','LastUpdateByName','VideoWidget','EntityProperty'),
('VideoWidget@LastUpdateDate','zh-CN','LastUpdateDate','VideoWidget','EntityProperty'),
('VideoWidget@LayoutID','zh-CN','LayoutID','VideoWidget','EntityProperty'),
('VideoWidget@PageID','zh-CN','PageID','VideoWidget','EntityProperty'),
('VideoWidget@PartialView','zh-CN','显示模板','VideoWidget','EntityProperty'),
('VideoWidget@Position','zh-CN','排序','VideoWidget','EntityProperty'),
('VideoWidget@ServiceTypeName','zh-CN','ServiceTypeName','VideoWidget','EntityProperty'),
('VideoWidget@Status','zh-CN','状态','VideoWidget','EntityProperty'),
('VideoWidget@StyleClass','zh-CN','自定义样式','VideoWidget','EntityProperty'),
('VideoWidget@Thumbnail','zh-CN','缩略图','VideoWidget','EntityProperty'),
('VideoWidget@Title','zh-CN','标题','VideoWidget','EntityProperty'),
('VideoWidget@Url','zh-CN','视频地址(MP4)','VideoWidget','EntityProperty'),
('VideoWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','VideoWidget','EntityProperty'),
('VideoWidget@WidgetName','zh-CN','组件名称','VideoWidget','EntityProperty'),
('VideoWidget@Width','zh-CN','宽度(px)','VideoWidget','EntityProperty'),
('VideoWidget@ZoneID','zh-CN','区域','VideoWidget','EntityProperty'),
('View','en-GB','View',NULL,NULL),
('View','en-US','View',NULL,NULL),
('View','zh-CN','查看',NULL,NULL),
('View Article','zh-CN','查看文章',NULL,NULL),
('View Article Category','zh-CN','查看文章类别',NULL,NULL),
('View Carousel','zh-CN','查看焦点图',NULL,NULL),
('View Comments','zh-CN','查看评论',NULL,NULL),
('View Commits','zh-CN','查看评论',NULL,NULL),
('View Content','zh-CN','查看内容',NULL,NULL),
('View Content Template','zh-CN','查看内容模板',NULL,NULL),
('View Content Type','zh-CN','查看内容类型',NULL,NULL),
('View Detail','zh-CN','查看详细',NULL,NULL),
('View Form','zh-CN','查看表单',NULL,NULL),
('View Form Data','zh-CN','查看表单数据',NULL,NULL),
('View Layouts','en-GB','View Layouts',NULL,NULL),
('View Layouts','en-US','View Layouts',NULL,NULL),
('View Layouts','zh-CN','查看布局',NULL,NULL),
('View Log','zh-CN','查看错误日志',NULL,NULL),
('View Media','zh-CN','查看媒体库',NULL,NULL),
('View Message','zh-CN','查看留言',NULL,NULL),
('View Navigation','zh-CN','查看导航',NULL,NULL),
('View Order','zh-CN','查看订单',NULL,NULL),
('View Pages','en-GB','View Pages',NULL,NULL),
('View Pages','en-US','View Pages',NULL,NULL),
('View Pages','zh-CN','查看页面',NULL,NULL),
('View Pending Page','en-GB','View Pending Page',NULL,NULL),
('View Pending Page','en-US','View Pending Page',NULL,NULL),
('View Pending Page','zh-CN','预览编辑版本',NULL,NULL),
('View Product','zh-CN','查看产品',NULL,NULL),
('View Product Category','zh-CN','查看产品类别',NULL,NULL),
('View Product Tag','zh-CN','查看产品标签',NULL,NULL),
('View Published Page','en-GB','View Published Page',NULL,NULL),
('View Published Page','en-US','View Published Page',NULL,NULL),
('View Published Page','zh-CN','预览发布版本',NULL,NULL),
('View Refund','zh-CN','查看支付平台退款信息',NULL,NULL),
('View Role','zh-CN','查看角色',NULL,NULL),
('View Setting','zh-CN','查看设置',NULL,NULL),
('View Site','en-GB','View Site',NULL,NULL),
('View Site','en-US','View Site',NULL,NULL),
('View Site','zh-CN','查看站点',NULL,NULL),
('View Subscription','zh-CN','查看订阅',NULL,NULL),
('View Template','zh-CN','查看模板',NULL,NULL),
('View Theme','zh-CN','查看主题',NULL,NULL),
('View Transactions','zh-CN','查看支付平台支付信息',NULL,NULL),
('View URL Redirection','zh-CN','查看URL重定向',NULL,NULL),
('View Users','zh-CN','查看用户',NULL,NULL),
('View: View the published page','en-GB','View: View the published page',NULL,NULL),
('View: View the published page','en-US','View: View the published page',NULL,NULL),
('View: View the published page','zh-CN','查看：查看已发布版本',NULL,NULL),
('Visibility','zh-CN','可见性',NULL,NULL),
('Visible','zh-CN','可见',NULL,NULL),
('Wait','zh-CN','等待',NULL,NULL),
('Warning','zh-CN','警告',NULL,NULL),
('We have prepared a few links for you to get started:','en-GB','We have prepared a few links for you to get started:',NULL,NULL),
('We have prepared a few links for you to get started:','en-US','We have prepared a few links for you to get started:',NULL,NULL),
('We have prepared a few links for you to get started:','zh-CN','我们准备了几个链接供您开始：',NULL,NULL),
('We have sent the change password message to your email','zh-CN','我们已经给您的邮箱，发送了一封找回密码的邮件，请及时查收并修改密码。',NULL,NULL),
('WeChat','en-GB','WeChat',NULL,NULL),
('WeChat','en-US','WeChat',NULL,NULL),
('WeChat','zh-CN','微信',NULL,NULL),
('Wechat Config','zh-CN','配置微信登录',NULL,NULL),
('WeiBo','en-GB','WeiBo',NULL,NULL),
('WeiBo','en-US','WeiBo',NULL,NULL),
('WeiBo','zh-CN','微博',NULL,NULL),
('WeiBo Config','zh-CN','配置微博登录',NULL,NULL),
('Welcome','en-GB','Welcome',NULL,NULL),
('Welcome','en-US','Welcome',NULL,NULL),
('Welcome','zh-CN','欢迎',NULL,NULL),
('Welcome to use ZKEACMS','en-GB','Welcome to use ZKEACMS',NULL,NULL),
('Welcome to use ZKEACMS','en-US','Welcome to use ZKEACMS',NULL,NULL),
('Welcome to use ZKEACMS','zh-CN','欢迎使用ZKEACMS',NULL,NULL),
('Widget Setting','en-GB','Setting',NULL,NULL),
('Widget Setting','en-US','Setting',NULL,NULL),
('Widget Setting','zh-CN','组件设置',NULL,NULL),
('WidgetBase@ActionType','zh-CN','ActionType','WidgetBase','EntityProperty'),
('WidgetBase@AssemblyName','zh-CN','AssemblyName','WidgetBase','EntityProperty'),
('WidgetBase@CreateBy','zh-CN','CreateBy','WidgetBase','EntityProperty'),
('WidgetBase@CreatebyName','zh-CN','创建人','WidgetBase','EntityProperty'),
('WidgetBase@CreateDate','zh-CN','创建日期','WidgetBase','EntityProperty'),
('WidgetBase@CustomClass','zh-CN','CustomClass','WidgetBase','EntityProperty'),
('WidgetBase@CustomStyle','zh-CN','CustomStyle','WidgetBase','EntityProperty'),
('WidgetBase@Description','zh-CN','描述','WidgetBase','EntityProperty'),
('WidgetBase@ExtendFields','zh-CN','扩展属性','WidgetBase','EntityProperty'),
('WidgetBase@FormView','zh-CN','FormView','WidgetBase','EntityProperty'),
('WidgetBase@ID','zh-CN','ID','WidgetBase','EntityProperty'),
('WidgetBase@IsSystem','zh-CN','IsSystem','WidgetBase','EntityProperty'),
('WidgetBase@IsTemplate','zh-CN','保存为模板','WidgetBase','EntityProperty'),
('WidgetBase@LastUpdateBy','zh-CN','LastUpdateBy','WidgetBase','EntityProperty'),
('WidgetBase@LastUpdateByName','zh-CN','更新人','WidgetBase','EntityProperty'),
('WidgetBase@LastUpdateDate','zh-CN','更新日期','WidgetBase','EntityProperty'),
('WidgetBase@LayoutID','zh-CN','布局','WidgetBase','EntityProperty'),
('WidgetBase@PageID','zh-CN','页面','WidgetBase','EntityProperty'),
('WidgetBase@PartDriver','zh-CN','PartDriver','WidgetBase','EntityProperty'),
('WidgetBase@PartialView','zh-CN','显示模板','WidgetBase','EntityProperty'),
('WidgetBase@Position','zh-CN','排序','WidgetBase','EntityProperty'),
('WidgetBase@ServiceTypeName','zh-CN','ServiceTypeName','WidgetBase','EntityProperty'),
('WidgetBase@Status','zh-CN','状态','WidgetBase','EntityProperty'),
('WidgetBase@StyleClass','zh-CN','自定义样式','WidgetBase','EntityProperty'),
('WidgetBase@Thumbnail','zh-CN','缩略图','WidgetBase','EntityProperty'),
('WidgetBase@Title','zh-CN','标题','WidgetBase','EntityProperty'),
('WidgetBase@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetBase','EntityProperty'),
('WidgetBase@WidgetName','zh-CN','组件名称','WidgetBase','EntityProperty'),
('WidgetBase@ZoneID','zh-CN','区域','WidgetBase','EntityProperty'),
('WidgetName','zh-CN','组件名称',NULL,NULL),
('WidgetTemplateEntity@ActionType','zh-CN','ActionType','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@AssemblyName','zh-CN','AssemblyName','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@CreateBy','zh-CN','CreateBy','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@CreatebyName','zh-CN','创建人','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@CreateDate','zh-CN','创建日期','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@Description','zh-CN','描述','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@FormView','zh-CN','FormView','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@GroupName','zh-CN','组名','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@ID','zh-CN','ID','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@LastUpdateBy','zh-CN','LastUpdateBy','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@LastUpdateByName','zh-CN','更新人','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@LastUpdateDate','zh-CN','更新日期','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@Order','zh-CN','排序','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@PartialView','zh-CN','显示模板','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@ServiceTypeName','zh-CN','ServiceTypeName','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@Status','zh-CN','状态','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@Title','zh-CN','标题','WidgetTemplateEntity','EntityProperty'),
('WidgetTemplateEntity@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetTemplateEntity','EntityProperty'),
('Width / Height','zh-CN','宽 / 高',NULL,NULL),
('Width(px)','zh-CN','宽(px)',NULL,NULL),
('Word Spacing','zh-CN','词间距',NULL,NULL),
('w-resize','zh-CN','向左改变大小',NULL,NULL),
('XS Screen','zh-CN','超小屏幕',NULL,NULL),
('Yes','zh-CN','是',NULL,NULL),
('Your account has been created successfully','en-GB','Your account has been created successfully',NULL,NULL),
('Your account has been created successfully','en-US','Your account has been created successfully',NULL,NULL),
('Your account has been created successfully','zh-CN','您的账号已经创建成功',NULL,NULL),
('Your basket is empty','zh-CN','您的购物车是空的',NULL,NULL),
('Your email address','en-GB','Your email address',NULL,NULL),
('Your email address','en-US','Your email address',NULL,NULL),
('Your email address','zh-CN','输入您常使用的邮箱地址',NULL,NULL),
('Your name','zh-CN','你的名字',NULL,NULL),
('Zip Code','en-GB','Zip Code',NULL,NULL),
('Zip Code','en-US','Zip Code',NULL,NULL),
('Zip Code','zh-CN','邮政编码',NULL,NULL),
('Zone','zh-CN','区域',NULL,NULL),
('Zone Name','zh-CN','区域名称',NULL,NULL),
('ZoneEntity@ActionType','zh-CN','ActionType','ZoneEntity','EntityProperty'),
('ZoneEntity@CreateBy','zh-CN','CreateBy','ZoneEntity','EntityProperty'),
('ZoneEntity@CreatebyName','zh-CN','创建人','ZoneEntity','EntityProperty'),
('ZoneEntity@CreateDate','zh-CN','创建日期','ZoneEntity','EntityProperty'),
('ZoneEntity@Description','zh-CN','描述','ZoneEntity','EntityProperty'),
('ZoneEntity@HeadingCode','zh-CN','HeadingCode','ZoneEntity','EntityProperty'),
('ZoneEntity@ID','zh-CN','ID','ZoneEntity','EntityProperty'),
('ZoneEntity@LastUpdateBy','zh-CN','LastUpdateBy','ZoneEntity','EntityProperty'),
('ZoneEntity@LastUpdateByName','zh-CN','更新人','ZoneEntity','EntityProperty'),
('ZoneEntity@LastUpdateDate','zh-CN','更新日期','ZoneEntity','EntityProperty'),
('ZoneEntity@LayoutId','zh-CN','布局','ZoneEntity','EntityProperty'),
('ZoneEntity@Status','zh-CN','状态','ZoneEntity','EntityProperty'),
('ZoneEntity@Title','zh-CN','标题','ZoneEntity','EntityProperty'),
('ZoneEntity@ZoneName','zh-CN','ZoneName','ZoneEntity','EntityProperty'),
('ZoneID','zh-CN','区域',NULL,NULL),
('中等屏幕','zh-CN','MD Screen',NULL,NULL),
('主题管理','en-GB','Theme',NULL,NULL),
('主题管理','en-US','Theme',NULL,NULL),
('产品展示','en-GB','Product',NULL,NULL),
('产品展示','en-US','Product',NULL,NULL),
('使用QQ登录','en-GB','Sign in with QQ',NULL,NULL),
('使用QQ登录','en-US','Sign in with QQ',NULL,NULL),
('使用帮助','en-GB','Help',NULL,NULL),
('使用帮助','en-US','Help',NULL,NULL),
('使用微博登录','en-GB','Sign in with weibo',NULL,NULL),
('使用微博登录','en-US','Sign in with weibo',NULL,NULL),
('保存修改','en-GB','Save',NULL,NULL),
('保存修改','en-US','Save',NULL,NULL),
('全局内容','en-GB','Layer',NULL,NULL),
('全局内容','en-US','Layer',NULL,NULL),
('分隔符','en-GB','Separator',NULL,NULL),
('分隔符','en-US','Separator',NULL,NULL),
('商业授权','en-GB','Commercial',NULL,NULL),
('商业授权','en-US','Commercial',NULL,NULL),
('图例三','en-GB','Image Caption',NULL,NULL),
('图例三','en-US','Image Caption',NULL,NULL),
('图例三（圆）','en-GB','Image Caption',NULL,NULL),
('图例三（圆）','en-US','Image Caption',NULL,NULL),
('图例二','en-GB','Image Caption',NULL,NULL),
('图例二','en-US','Image Caption',NULL,NULL),
('图例二（圆）','en-GB','Image Caption',NULL,NULL),
('图例二（圆）','en-US','Image Caption',NULL,NULL),
('图片右','en-GB','Image Right',NULL,NULL),
('图片右','en-US','Image Right',NULL,NULL),
('图片右（圆）','en-GB','Image Right',NULL,NULL),
('图片右（圆）','en-US','Image Right',NULL,NULL),
('图片左','en-GB','Image Left',NULL,NULL),
('图片左','en-US','Image Left',NULL,NULL),
('图片左（圆）','en-GB','Image Left',NULL,NULL),
('图片左（圆）','en-US','Image Left',NULL,NULL),
('图片左（平分）','en-GB','Image Left',NULL,NULL),
('图片左（平分）','en-US','Image Left',NULL,NULL),
('姓名不能为空','en-GB','Username is required',NULL,NULL),
('姓名不能为空','en-US','Username is required',NULL,NULL),
('姓名的长度应小于50','en-GB','The length of the name should be less than 50',NULL,NULL),
('姓名的长度应小于50','en-US','The length of the name should be less than 50',NULL,NULL),
('字段名','en-GB','Display Name',NULL,NULL),
('字段名','en-US','Display Name',NULL,NULL),
('安全退出','en-GB','Sign out',NULL,NULL),
('安全退出','en-US','Sign out',NULL,NULL),
('密码不能为空','en-GB','Please input your password',NULL,NULL),
('密码不能为空','en-US','Please input your password',NULL,NULL),
('密码的长度应小于20','en-GB','The length of the password should be less than 20',NULL,NULL),
('密码的长度应小于20','en-US','The length of the password should be less than 20',NULL,NULL),
('属性','en-GB','Property',NULL,NULL),
('属性','en-US','Property',NULL,NULL),
('属性','zh-CN','属性',NULL,NULL),
('工具栏','en-GB','Toolbar',NULL,NULL),
('工具栏','en-US','Toolbar',NULL,NULL),
('巨幕','en-GB','Jumbotron',NULL,NULL),
('巨幕','en-US','Jumbotron',NULL,NULL),
('文字三列','en-GB','Three Column Text',NULL,NULL),
('文字三列','en-US','Three Column Text',NULL,NULL),
('文字二列','en-GB','Tow Column Text',NULL,NULL),
('文字二列','en-US','Tow Column Text',NULL,NULL),
('模板代码','en-GB','Code',NULL,NULL),
('模板代码','en-US','Code',NULL,NULL),
('用户名','en-GB','User Name',NULL,NULL),
('用户名','en-US','User Name',NULL,NULL),
('登录','en-GB','Sign In',NULL,NULL),
('登录','en-US','Sign In',NULL,NULL),
('登录邮箱不能为空','en-GB','Please input your email address',NULL,NULL),
('登录邮箱不能为空','en-US','Please input your email address',NULL,NULL),
('组件不能正确地显示在页面中，可能是因为您删除了原先的区域','zh-CN','组件不能正确地显示在页面中，可能是因为您删除了原先的区域',NULL,NULL),
('自定义样式','en-GB','Style',NULL,NULL),
('自定义样式','en-US','Style',NULL,NULL),
('自适应','en-GB','Fluid',NULL,NULL),
('自适应','en-US','Fluid',NULL,NULL),
('说明文档','en-GB','Document',NULL,NULL),
('说明文档','en-US','Document',NULL,NULL),
('请确认密码','en-GB','Please confirm your password',NULL,NULL),
('请确认密码','en-US','Please confirm your password',NULL,NULL),
('输入您注册时使用的邮箱地址','en-GB','Enter your email address',NULL,NULL),
('输入您注册时使用的邮箱地址','en-US','Enter your email address',NULL,NULL),
('输入您的密码','en-GB','Enter your password',NULL,NULL),
('输入您的密码','en-US','Enter your password',NULL,NULL),
('输入的邮件格式不正确','en-GB','The email you entered is not formatted correctly',NULL,NULL),
('输入的邮件格式不正确','en-US','The email you entered is not formatted correctly',NULL,NULL),
('输入的邮箱格式不正确','en-GB','The email you entered is not formatted correctly',NULL,NULL),
('输入的邮箱格式不正确','en-US','The email you entered is not formatted correctly',NULL,NULL),
('退出登录','en-GB','Sign Out',NULL,NULL),
('退出登录','en-US','Sign Out',NULL,NULL),
('选中产品类别，创建标签','en-GB','Click product category then add tag',NULL,NULL),
('选中产品类别，创建标签','en-US','Click product category then add tag',NULL,NULL),
('选择类别，进行手动排序','en-GB','Click category to sort the products',NULL,NULL),
('选择类别，进行手动排序','en-US','Click category to sort the products',NULL,NULL),
('邮箱的长度应小于200','en-GB','The length of the email should be less than 200',NULL,NULL),
('邮箱的长度应小于200','en-US','The length of the email should be less than 200',NULL,NULL),
('配置保存成功，但清空缓存时发生异常，请重试！','zh-CN','配置保存成功，但清空缓存时发生异常，请重试！',NULL,NULL),
('配置通知邮箱','en-GB','Notification',NULL,NULL),
('配置通知邮箱','en-US','Notification',NULL,NULL),
('间距','en-GB','Gap',NULL,NULL),
('间距','en-US','Gap',NULL,NULL),
('页头','en-GB','Header',NULL,NULL),
('页头','en-US','Header',NULL,NULL),
('须要处理','zh-CN','须要处理',NULL,NULL);
/*!40000 ALTER TABLE `Language` ENABLE KEYS */;

DROP TABLE IF EXISTS `Navigation`;
CREATE TABLE `Navigation` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`ParentId` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Url` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`IsMobile` TINYINT(1)  NULL,
	`Html` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`DisplayOrder` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `Navigation` DISABLE KEYS */;
INSERT INTO `Navigation` VALUES
('1061019b1bcd4bf3aeb3df647c74c309','#','~/javascript','JavaScript',0,NULL,NULL,1,3,'admin','ZKEASOFT','2016-03-10 23:33:03.000','admin','ZKEASOFT','2019-05-07 21:23:52.267'),
('20149bec32e54e3ea966d7c021d5c9f2','#','~/linux','Linux',0,NULL,NULL,1,6,'admin','ZKEASOFT','2018-04-03 10:41:51.000','admin','ZKEASOFT','2019-05-07 21:24:15.107'),
('6beb1a2a54b947179ec20dd331e375a2','#','~/index','首页',0,NULL,NULL,1,1,'admin',NULL,'2015-09-01 09:55:20.483','admin','ZKEASOFT','2017-10-15 18:05:28.820'),
('7b5bb24dea6d47618ed027190b4e5d94','#','~/sql','SQL',0,NULL,NULL,1,5,'admin','ZKEASOFT','2017-03-19 21:06:21.000','admin','ZKEASOFT','2019-05-07 21:24:09.250'),
('d122a50356bf46c8a8c8349612145e24','#','~/html-css','HTML / CSS',0,NULL,NULL,1,4,'admin','ZKEASOFT','2017-10-15 18:05:25.000','admin','ZKEASOFT','2019-05-07 21:24:03.937'),
('e4658e8af8434a05b773b666c6c67cd5','#','~/csharp','C#',0,NULL,NULL,1,2,'admin','ZKEASOFT','2016-03-10 23:32:53.000','admin','ZKEASOFT','2019-05-07 21:23:36.907');
/*!40000 ALTER TABLE `Navigation` ENABLE KEYS */;

DROP TABLE IF EXISTS `NavigationWidget`;
CREATE TABLE `NavigationWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`CustomerClass` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Logo` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`AlignClass` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`IsTopFix` TINYINT(1)  NULL,
	`RootID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`ShowBasket` TINYINT(1)  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_NavigationWidget_Widget` (`ID`),
	CONSTRAINT `FK_NavigationWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `NavigationWidget` DISABLE KEYS */;
INSERT INTO `NavigationWidget` VALUES
('a8259ee60a274b61834ff820f2299843','container',NULL,NULL,'navbar-left',NULL,'#',0);
/*!40000 ALTER TABLE `NavigationWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
	`ID` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`UserId` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`Contact` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`PhoneNumber` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Total` DECIMAL (18,4)  NOT NULL,
	`OrderStatus` INT  NOT NULL,
	`PayTime` DATETIME  NULL,
	`CompletePayTime` DATETIME  NULL,
	`TrackingNumber` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LogisticsCompany` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`ShippingAddress` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`PaymentGateway` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`PaymentID` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`RefundID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Refund` DECIMAL (18,4)  NULL,
	`RefundDate` DATETIME  NULL,
	`RefundReason` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `OrderItem`;
CREATE TABLE `OrderItem` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`OrderId` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`UserId` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`ImageUrl` VARCHAR(500) CHARACTER SET utf8mb4  NOT NULL,
	`Quantity` INT  NOT NULL,
	`Price` DECIMAL (18,4)  NOT NULL,
	`ProductId` INT  NOT NULL,
	`PromoCode` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NOT NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `PageView`;
CREATE TABLE `PageView` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`PageUrl` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`PageTitle` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`IPAddress` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`SessionID` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`UserAgent` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Referer` VARCHAR(1000) CHARACTER SET utf8mb4  NULL,
	`RefererName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`KeyWords` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission` (
	`PermissionKey` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`RoleId` INT  NOT NULL,
	`Title` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Module` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`PermissionKey`,`RoleId`),
	KEY `FK_Permission_Permission_Role` (`RoleId`),
	CONSTRAINT `FK_Permission_Permission_Role` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
INSERT INTO `Permission` VALUES
('ApplicationSetting_Manage',1,'管理系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2018-03-22 15:33:03.653'),
('ApplicationSetting_View',1,'查看系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2018-03-22 15:33:03.653'),
('Article_Manage',1,'管理文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:18:40.493','admin','ZKEASOFT','2018-03-22 15:33:03.653'),
('Article_Publish',1,'发布文章',NULL,'文章',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.820','admin','ZKEASOFT','2018-03-22 15:33:03.653'),
('Article_View',1,'查看文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:17:59.120','admin','ZKEASOFT','2018-03-22 15:33:03.653'),
('ArticleType_Manage',1,'管理文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:22:24.887','admin','ZKEASOFT','2018-03-22 15:33:03.653'),
('ArticleType_View',1,'查看文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:19:54.500','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Carousel_Manage',1,'管理焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:45:46.190','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Carousel_View',1,'查看焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.097','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Comments_Manage',1,'管理回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.053','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Comments_View',1,'查看回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.050','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('EventViewer_Manage',1,'查看错误日志',NULL,'设置',NULL,'admin','ZKEASOFT','2017-07-11 15:43:52.147','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Form_Manage',1,'管理表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Form_View',1,'查看表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.830','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('FormData_Export',1,'导出表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.853','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('FormData_Manage',1,'管理表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.850','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('FormData_View',1,'查看表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Language_Manage',1,'翻译',NULL,'设置',NULL,'admin','ZKEASOFT','2017-11-17 11:47:13.093','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Layout_Manage',1,'管理布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:43:52.697','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Layout_View',1,'查看布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.690','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Media_Manage',1,'管理媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.553','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Media_View',1,'查看媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.090','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Message_Manage',1,'管理留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.980','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Message_View',1,'查看留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.960','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Navigation_Manage',1,'管理导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:40:38.230','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Navigation_View',1,'查看导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:38:21.943','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Order_Manage',1,'管理订单',NULL,'商城',NULL,'admin','ZKEASOFT','2017-11-17 10:49:53.937','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Order_Refund',1,'退款',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.903','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Order_View',1,'查看订单',NULL,'商城',NULL,'admin','ZKEASOFT','2017-11-17 10:49:53.923','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Order_ViewOrderPayment',1,'查看支付平台支付信息',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.777','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Order_ViewOrderRefund',1,'查看支付平台退款信息',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.850','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Page_Manage',1,'管理页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 13:41:08.463','admin','ZKEASOFT','2018-03-22 15:33:03.657'),
('Page_View',1,'查看页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.683','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('Payment_Config_Manage',1,'支付集成设置',NULL,'商城',NULL,'admin','ZKEASOFT','2018-03-22 15:33:03.663','admin','ZKEASOFT','2018-03-22 15:33:03.663'),
('Product_Manage',1,'管理产品',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:27:58.400','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('Product_Publish',1,'发布产品',NULL,'产品',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.853','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('Product_View',1,'查看产品',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:27:41.483','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('ProductCategory_Manage',1,'管理产品类别',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:28:21.047','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('ProductCategory_View',1,'查看产品类别',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:28:08.737','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('ProductCategoryTag_Manage',1,'管理产品标签',NULL,'产品',NULL,'admin','ZKEASOFT','2017-11-11 15:43:52.953','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('ProductCategoryTag_View',1,'查看产品标签',NULL,'产品',NULL,'admin','ZKEASOFT','2017-11-11 15:43:52.947','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('Role_Manage',1,'管理角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('Role_View',1,'查看角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.660','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('Theme_Manage',1,'管理主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:42:48.600','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('Theme_View',1,'查看主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.083','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('UrlRedirect_Manage',1,'管理URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.170','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('UrlRedirect_View',1,'查看URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.120','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('User_Manage',1,'管理用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2018-03-22 15:33:03.660'),
('User_View',1,'查看用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2018-03-22 15:33:03.660');
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;

DROP TABLE IF EXISTS `PersistKey`;
CREATE TABLE `PersistKey` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`XML` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`CreationDate` DATETIME  NULL,
	`ActivationDate` DATETIME  NULL,
	`ExpirationDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `Product`;
CREATE TABLE `Product` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageThumbUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`BrandCD` INT  NULL,
	`ProductCategoryID` INT  NULL,
	`Color` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Price` DECIMAL (19,4)  NULL,
	`RebatePrice` DECIMAL (19,4)  NULL,
	`PurchasePrice` DECIMAL (19,4)  NULL,
	`Norm` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ShelfLife` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ProductContent` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Description` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`IsPublish` TINYINT(1)  NOT NULL,
	`PublishDate` DATETIME  NULL,
	`Status` INT  NULL,
	`SEOTitle` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`SEOKeyWord` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`SEODescription` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`OrderIndex` INT  NULL,
	`SourceFrom` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Url` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`TargetFrom` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`TargetUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`PartNumber` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_Product_ProductCategory` (`ProductCategoryID`),
	CONSTRAINT `FK_Product_ProductCategory` FOREIGN KEY (`ProductCategoryID`) REFERENCES `ProductCategory` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES
(1,'Cloud Revolver 游戏耳机','http://wx2.sinaimg.cn/mw690/005zTNGqgy1fn25uz5f9gj30bk0bkwek.jpg','http://wx2.sinaimg.cn/mw690/005zTNGqgy1fn25uz5f9gj30bk0bkwek.jpg',NULL,2,NULL,500.0000,399.0000,NULL,NULL,NULL,'<h1>HyperX Cloud Revolver</h1>
<p>如果您热爱游戏，那么一款可为您带来极大优势的耳机就是必不可少的装备。HyperX Cloud Revolver&trade; 是一款优质耳机，工艺精湛，可充分满足高级OC或家用机游戏玩家的需求。新一代驱动器可将低音、中音和高音明确区分开来，形成精准定位的优质音效。Revolver 系列具备立体声和即插即用的 Dolby&reg; 7.1 环绕立体声模式，可提供工作室级别的音场和新一代驱动器，在 FPS 和开放式环境下表现优异。两款耳机均采用结实耐用的实心钢质框架和标志性的 HyperX 记忆海绵，带来屡获殊荣的舒适度。如果您希望拥有无与伦比的舒适度、绝佳的音质和清晰顺畅的沟通，Cloud Revolver 耳机将是您的不二之选。</p>
<h3>即插即用 Dolby&reg; 环绕立体声 7.1&nbsp;</h3>
<p>模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效，无需安装软件或任何设置，即可将音频娱乐变成电影般的体验。<br />可在 Cloud Revolver S 上使用。</p>
<h3>先进的 USB 音频控制盒与 DSP 声卡&nbsp;</h3>
<p>USB 数字处理信号声卡可在任何机器上输出一致的优质音频。卡夹式音频控制盒设计有背光按钮，因此可以即时静音、启用 Dolby 音频，还可在三种预先设置的均衡器之间切换并调整麦克风和音量水平。<br />可在 Cloud Revolver S 上使用。</p>
<h3>新一代 50 毫米驱动器&nbsp;</h3>
<p>与双耳平行的 50mm 定向驱动器精准定位，超强低音效果让声音更加清脆动听。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>
<h3>HyperX 标志性记忆海绵&nbsp;</h3>
<p>屡获殊荣的 HyperX 记忆海绵，带来无与伦比的舒适度，让您更加舒适，更加尽兴地游戏。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>','模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'HX-HSCR-BK/AS','admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2017-11-17 15:25:05.127'),
(2,'Alloy FPS 机械游戏键盘','http://wx4.sinaimg.cn/mw690/005zTNGqgy1fn25wb061cj30bk0bkjsr.jpg','http://wx4.sinaimg.cn/mw690/005zTNGqgy1fn25wb061cj30bk0bkjsr.jpg',NULL,3,'黑色',500.0000,499.0000,NULL,NULL,NULL,'<h1>小巧便携，随时随地开始 FPS 游戏。</h1>
<p>HyperX&trade; Alloy FPS 键盘结实耐用，性能可靠，给玩家带来卓越的游戏体验。如果您需要一个全尺寸键盘，Alloy FPS 会满足您的所有需求。如果您喜欢 Tenkeyless (TKL) 模式，以便使用大多数基本按键，则 Alloy FPS Pro 键盘可充分满足您的需要。1每个键盘都能满足每位严肃的 FPS 游戏玩家对键盘的所有要求：可靠的 CHERRY&reg; MX 按键开关、实心钢架、可拆卸的线缆、游戏模式、100% 防按键冲突和全键无冲突功能无论您是专业的 FPS 玩家，又或者只是随便玩玩，HyperX Alloy FPS 键盘都可充分满足您的需求。</p>
<h3>极简设计小巧紧凑，是 FPS 游戏的完美搭档&nbsp;</h3>
<p>最大程度节省桌面空间，方便鼠标快速移动</p>
<h3>实心钢架&nbsp;</h3>
<p>可实现耐用性和稳定性。</p>
<h3>CHERRY&reg; MX 机械按键开关可靠耐用&nbsp;</h3>
<p>适用于 CHERRY MX Blue、Brown 或 Red 按键开关，带给您有口皆碑的可靠性和适合您的开关风格。</p>
<h3>超便携设计，带有可拆卸的线缆&nbsp;</h3>
<p>节省存储空间并减少可能的线缆损坏。</p>
<h3>HyperX 红色背光按键，实现动态的灯光效果</h3>
<p>让璀璨的背光彰显您的风格</p>','实心钢架,CHERRY® MX 机械按键开关,带有可拆卸的线缆',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'HX-KB4RD1-US/R1','admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2017-11-17 15:32:14.837');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;

DROP TABLE IF EXISTS `ProductCategory`;
CREATE TABLE `ProductCategory` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ParentID` INT  NULL,
	`Url` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`SEOTitle` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`SEOKeyWord` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`SEODescription` VARCHAR(300) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `ProductCategory` DISABLE KEYS */;
INSERT INTO `ProductCategory` VALUES
(1,'产品',NULL,0,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:32.000','admin','ZKEASOFT','2017-11-17 15:10:08.193'),
(2,'耳机',NULL,1,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:50.000','admin','ZKEASOFT','2017-11-17 15:10:14.940'),
(3,'键盘',NULL,1,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:07.000','admin','ZKEASOFT','2017-11-17 15:10:19.177');
/*!40000 ALTER TABLE `ProductCategory` ENABLE KEYS */;

DROP TABLE IF EXISTS `ProductCategoryTag`;
CREATE TABLE `ProductCategoryTag` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`ProductCategoryId` INT  NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`ParentId` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `ProductCategoryTag` DISABLE KEYS */;
INSERT INTO `ProductCategoryTag` VALUES
(1,2,'颜色',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:45.550'),
(2,2,'黑色',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:50.530'),
(3,2,'黑古银色',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:11:03.657'),
(4,3,'操作风格',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:07.707'),
(5,3,'点击',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:14.870'),
(6,3,'触觉',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:20.713'),
(7,3,'线性',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:28.660');
/*!40000 ALTER TABLE `ProductCategoryTag` ENABLE KEYS */;

DROP TABLE IF EXISTS `ProductCategoryWidget`;
CREATE TABLE `ProductCategoryWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`ProductCategoryID` INT  NULL,
	`TargetPage` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ProductCategoryWidget_Widget` (`ID`),
	CONSTRAINT `FK_ProductCategoryWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `ProductDetailWidget`;
CREATE TABLE `ProductDetailWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`CustomerClass` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ProductDetailWidget_Widget` (`ID`),
	CONSTRAINT `FK_ProductDetailWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `ProductImage`;
CREATE TABLE `ProductImage` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`ProductId` INT  NULL,
	`ImageUrl` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `ProductImage` DISABLE KEYS */;
INSERT INTO `ProductImage` VALUES
(1,1,'https://user-images.githubusercontent.com/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','HX-HSCR-BK/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.747'),
(2,1,'https://user-images.githubusercontent.com/6006218/56657706-58757e00-66cb-11e9-80b8-fdc32783ff68.png','HX-HSCRS-GM/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.750'),
(3,2,'https://user-images.githubusercontent.com/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010'),
(5,2,'https://user-images.githubusercontent.com/6006218/56657774-78a53d00-66cb-11e9-9ab9-c4b65f3cba22.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010'),
(6,2,'https://user-images.githubusercontent.com/6006218/56657795-85299580-66cb-11e9-9a3f-a1c5bde7b191.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010'),
(7,2,'https://user-images.githubusercontent.com/6006218/56657844-9a9ebf80-66cb-11e9-91ed-02001fab09c8.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
/*!40000 ALTER TABLE `ProductImage` ENABLE KEYS */;

DROP TABLE IF EXISTS `ProductListWidget`;
CREATE TABLE `ProductListWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`IsPageable` TINYINT(1)  NOT NULL,
	`ProductCategoryID` INT  NULL,
	`DetailPageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Columns` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`PageSize` INT  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ProductListWidget_Widget` (`ID`),
	CONSTRAINT `FK_ProductListWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `ProductTag`;
CREATE TABLE `ProductTag` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`ProductId` INT  NULL,
	`TagId` INT  NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `ProductTag` DISABLE KEYS */;
INSERT INTO `ProductTag` VALUES
(9,1,2,NULL),
(10,1,3,NULL),
(20,2,5,NULL),
(21,2,6,NULL),
(22,2,7,NULL);
/*!40000 ALTER TABLE `ProductTag` ENABLE KEYS */;

DROP TABLE IF EXISTS `Roles`;
CREATE TABLE `Roles` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES
(1,'超级管理员','超级管理员',1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:09:47.907');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;

DROP TABLE IF EXISTS `ScriptWidget`;
CREATE TABLE `ScriptWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Script` LONGTEXT CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ScriptWidget_CMS_WidgetBase` (`ID`),
	CONSTRAINT `FK_ScriptWidget_CMS_WidgetBase` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `SectionContent`;
CREATE TABLE `SectionContent` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionWidgetId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionGroupId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionContentType` INT  NULL,
	`Order` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_SectionContent_Widget` (`SectionWidgetId`),
	CONSTRAINT `FK_SectionContent_Widget` FOREIGN KEY (`SectionWidgetId`) REFERENCES `SectionWidget` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `SectionContent` DISABLE KEYS */;
INSERT INTO `SectionContent` VALUES
('105','f41174cfa4d247f4974c47f4d2b000fd','40',4,1,'admin','ZKEASOFT','2016-03-09 21:22:05.273','admin','ZKEASOFT','2016-03-09 21:22:05.273'),
('106','f41174cfa4d247f4974c47f4d2b000fd','40',3,2,'admin','ZKEASOFT','2016-03-09 21:22:14.723','admin','ZKEASOFT','2016-03-09 21:22:14.723'),
('107','f41174cfa4d247f4974c47f4d2b000fd','41',4,1,'admin','ZKEASOFT','2016-03-09 21:22:39.543','admin','ZKEASOFT','2016-03-09 21:22:39.543'),
('108','f41174cfa4d247f4974c47f4d2b000fd','41',3,2,'admin','ZKEASOFT','2016-03-09 21:22:46.500','admin','ZKEASOFT','2016-03-09 21:22:46.500'),
('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.287','admin','ZKEASOFT','2016-03-09 21:23:51.287'),
('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.290','admin','ZKEASOFT','2016-03-09 21:23:51.290'),
('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293'),
('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293'),
('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',4,1,'admin','ZKEASOFT','2016-03-09 21:24:36.340','admin','ZKEASOFT','2016-03-09 21:24:36.340'),
('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',3,2,'admin','ZKEASOFT','2016-03-09 21:24:43.533','admin','ZKEASOFT','2016-03-09 21:24:43.533'),
('13','2b3eb61307d24c50a6b3aaa75db3810e','5',2,1,'admin','ZKEASOFT','2016-03-09 14:07:06.270','admin','ZKEASOFT','2016-03-09 14:07:06.270'),
('14','2b3eb61307d24c50a6b3aaa75db3810e','5',4,2,'admin','ZKEASOFT','2016-03-09 14:07:14.397','admin','ZKEASOFT','2016-03-09 14:07:14.397'),
('15','2b3eb61307d24c50a6b3aaa75db3810e','5',3,3,'admin','ZKEASOFT','2016-03-09 14:07:22.330','admin','ZKEASOFT','2016-03-09 14:07:22.330'),
('16','00f62c5acfe840e0bee3ca2979f0f025','6',2,1,'admin','ZKEASOFT','2016-03-09 14:14:25.737','admin','ZKEASOFT','2016-03-09 14:14:25.737'),
('17','00f62c5acfe840e0bee3ca2979f0f025','6',4,2,'admin','ZKEASOFT','2016-03-09 14:14:33.683','admin','ZKEASOFT','2016-03-09 14:14:33.683'),
('18','00f62c5acfe840e0bee3ca2979f0f025','6',3,3,'admin','ZKEASOFT','2016-03-09 14:14:50.897','admin','ZKEASOFT','2016-03-09 14:14:50.897'),
('19','f6f11ba2fec844de883acf0a1fe3eb89','7',2,1,'admin','ZKEASOFT','2016-03-09 14:15:44.233','admin','ZKEASOFT','2016-03-09 14:15:44.233'),
('20','f6f11ba2fec844de883acf0a1fe3eb89','7',4,2,'admin','ZKEASOFT','2016-03-09 14:15:44.237','admin','ZKEASOFT','2016-03-09 14:15:44.237'),
('21','f6f11ba2fec844de883acf0a1fe3eb89','7',3,3,'admin','ZKEASOFT','2016-03-09 14:15:44.240','admin','ZKEASOFT','2016-03-09 14:15:44.240'),
('22','481574ebc98b4cdf9a07e3f20c1ab78d','8',2,1,'admin','ZKEASOFT','2016-03-09 14:15:48.877','admin','ZKEASOFT','2016-03-09 14:15:48.877'),
('23','481574ebc98b4cdf9a07e3f20c1ab78d','8',4,2,'admin','ZKEASOFT','2016-03-09 14:15:48.877','admin','ZKEASOFT','2016-03-09 14:15:48.877'),
('24','481574ebc98b4cdf9a07e3f20c1ab78d','8',3,3,'admin','ZKEASOFT','2016-03-09 14:15:48.880','admin','ZKEASOFT','2016-03-09 14:15:48.880'),
('25','b568ff7f4a894870adaf9afadf787bf9','9',2,1,'admin','ZKEASOFT','2016-03-09 14:21:44.433','admin','ZKEASOFT','2016-03-09 14:21:44.433'),
('26','b568ff7f4a894870adaf9afadf787bf9','9',3,2,'admin','ZKEASOFT','2016-03-09 14:21:53.837','admin','ZKEASOFT','2016-03-09 14:21:53.837'),
('27','b568ff7f4a894870adaf9afadf787bf9','10',2,1,'admin','ZKEASOFT','2016-03-09 14:22:35.620','admin','ZKEASOFT','2016-03-09 14:22:35.620'),
('28','b568ff7f4a894870adaf9afadf787bf9','10',3,2,'admin','ZKEASOFT','2016-03-09 14:24:34.193','admin','ZKEASOFT','2016-03-09 14:24:34.193'),
('29','55b73e54fd054de4847960bdac350c6d','11',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580'),
('30','55b73e54fd054de4847960bdac350c6d','11',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580'),
('31','55b73e54fd054de4847960bdac350c6d','12',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.587','admin','ZKEASOFT','2016-03-09 14:33:40.587'),
('32','55b73e54fd054de4847960bdac350c6d','12',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.587','admin','ZKEASOFT','2016-03-09 14:33:40.587'),
('33','55b73e54fd054de4847960bdac350c6d','11',4,2,'admin','ZKEASOFT','2016-03-09 14:34:38.457','admin','ZKEASOFT','2016-03-09 14:34:38.457'),
('34','55b73e54fd054de4847960bdac350c6d','12',4,2,'admin','ZKEASOFT','2016-03-09 14:34:51.847','admin','ZKEASOFT','2016-03-09 14:34:51.847'),
('35','ed837392097f4e60b812bc57111dd762','13',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470'),
('36','ed837392097f4e60b812bc57111dd762','13',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470'),
('37','ed837392097f4e60b812bc57111dd762','14',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.490','admin','ZKEASOFT','2016-03-09 14:36:24.490'),
('38','ed837392097f4e60b812bc57111dd762','14',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.493','admin','ZKEASOFT','2016-03-09 14:36:24.493'),
('39','ed837392097f4e60b812bc57111dd762','15',2,1,'admin','ZKEASOFT','2016-03-09 14:38:16.067','admin','ZKEASOFT','2016-03-09 14:38:16.067'),
('40','ed837392097f4e60b812bc57111dd762','15',3,2,'admin','ZKEASOFT','2016-03-09 14:38:27.630','admin','ZKEASOFT','2016-03-09 14:38:27.630'),
('41','1fb967867e3b440e86336bc5a51e8719','16',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.777','admin','ZKEASOFT','2016-03-09 14:40:26.777'),
('42','1fb967867e3b440e86336bc5a51e8719','16',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.780','admin','ZKEASOFT','2016-03-09 14:40:26.780'),
('43','1fb967867e3b440e86336bc5a51e8719','17',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783'),
('44','1fb967867e3b440e86336bc5a51e8719','17',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783'),
('45','1fb967867e3b440e86336bc5a51e8719','18',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.787','admin','ZKEASOFT','2016-03-09 14:40:26.787'),
('46','1fb967867e3b440e86336bc5a51e8719','18',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.787','admin','ZKEASOFT','2016-03-09 14:40:26.787'),
('47','1fb967867e3b440e86336bc5a51e8719','16',4,2,'admin','ZKEASOFT','2016-03-09 14:41:13.710','admin','ZKEASOFT','2016-03-09 14:41:13.710'),
('48','1fb967867e3b440e86336bc5a51e8719','17',4,2,'admin','ZKEASOFT','2016-03-09 14:42:01.137','admin','ZKEASOFT','2016-03-09 14:42:01.137'),
('49','1fb967867e3b440e86336bc5a51e8719','18',4,2,'admin','ZKEASOFT','2016-03-09 14:42:20.190','admin','ZKEASOFT','2016-03-09 14:42:20.190'),
('4bcbb5fa151c442aad313b61bf28f4bf','16a0f1e9a8294a05a7b988fb54e03f1d','2dd968aa41a44774b7aee6423ff7f837',2,1,'admin','ZKEASOFT','2019-05-07 21:21:00.067','admin','ZKEASOFT','2019-05-07 21:21:00.067'),
('583046a2039e458db87180b2e6d109cb','16a0f1e9a8294a05a7b988fb54e03f1d','f0baed3ec02145769a972e4d874f7842',3,1,'admin','ZKEASOFT','2019-05-07 21:21:00.103','admin','ZKEASOFT','2019-05-07 21:21:00.103');
/*!40000 ALTER TABLE `SectionContent` ENABLE KEYS */;

DROP TABLE IF EXISTS `SectionContentCallToAction`;
CREATE TABLE `SectionContentCallToAction` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionWidgetId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`InnerText` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Href` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `SectionContentImage`;
CREATE TABLE `SectionContentImage` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionWidgetId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`ImageSrc` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageAlt` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageTitle` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Href` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Width` INT  NULL,
	`Height` INT  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `SectionContentImage` DISABLE KEYS */;
INSERT INTO `SectionContentImage` VALUES
('13','2b3eb61307d24c50a6b3aaa75db3810e','~/images/01.jpg',NULL,NULL,NULL,NULL,NULL),
('16','00f62c5acfe840e0bee3ca2979f0f025','~/images/02.jpg',NULL,NULL,NULL,NULL,NULL),
('19','f6f11ba2fec844de883acf0a1fe3eb89','~/images/04.jpg',NULL,NULL,NULL,NULL,NULL),
('22','481574ebc98b4cdf9a07e3f20c1ab78d','~/images/03.jpg',NULL,NULL,NULL,NULL,NULL),
('25','b568ff7f4a894870adaf9afadf787bf9','~/images/05.jpg',NULL,NULL,NULL,NULL,NULL),
('27','b568ff7f4a894870adaf9afadf787bf9','~/images/06.jpg',NULL,NULL,NULL,NULL,NULL),
('29','55b73e54fd054de4847960bdac350c6d','~/images/07.jpg',NULL,NULL,NULL,NULL,NULL),
('31','55b73e54fd054de4847960bdac350c6d','~/images/08.jpg',NULL,NULL,NULL,NULL,NULL),
('35','ed837392097f4e60b812bc57111dd762','~/images/09.jpg',NULL,NULL,NULL,NULL,NULL),
('37','ed837392097f4e60b812bc57111dd762','~/images/10.jpg',NULL,NULL,NULL,NULL,NULL),
('39','ed837392097f4e60b812bc57111dd762','~/images/11.jpg',NULL,NULL,NULL,NULL,NULL),
('41','1fb967867e3b440e86336bc5a51e8719','~/images/12.jpg',NULL,NULL,NULL,NULL,NULL),
('43','1fb967867e3b440e86336bc5a51e8719','~/images/13.jpg',NULL,NULL,NULL,NULL,NULL),
('45','1fb967867e3b440e86336bc5a51e8719','~/images/14.jpg',NULL,NULL,NULL,NULL,NULL),
('4bcbb5fa151c442aad313b61bf28f4bf','16a0f1e9a8294a05a7b988fb54e03f1d','/themes/blog/images/head.jpg',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `SectionContentImage` ENABLE KEYS */;

DROP TABLE IF EXISTS `SectionContentParagraph`;
CREATE TABLE `SectionContentParagraph` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionWidgetId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`HtmlContent` LONGTEXT CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `SectionContentParagraph` DISABLE KEYS */;
INSERT INTO `SectionContentParagraph` VALUES
('106','f41174cfa4d247f4974c47f4d2b000fd','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a>是基于<a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>'),
('108','f41174cfa4d247f4974c47f4d2b000fd','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a>是基于<a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>'),
('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),
('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),
('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),
('15','2b3eb61307d24c50a6b3aaa75db3810e','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),
('18','00f62c5acfe840e0bee3ca2979f0f025','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),
('21','f6f11ba2fec844de883acf0a1fe3eb89','<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>'),
('24','481574ebc98b4cdf9a07e3f20c1ab78d','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),
('26','b568ff7f4a894870adaf9afadf787bf9','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),
('28','b568ff7f4a894870adaf9afadf787bf9','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),
('30','55b73e54fd054de4847960bdac350c6d','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),
('32','55b73e54fd054de4847960bdac350c6d','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),
('36','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>'),
('38','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>'),
('40','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>'),
('42','1fb967867e3b440e86336bc5a51e8719','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),
('44','1fb967867e3b440e86336bc5a51e8719','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>'),
('46','1fb967867e3b440e86336bc5a51e8719','<p><span>我国汽车工业的现状喜忧参半，</span><span>展望我国汽车工业的未来风险与机遇并存。</span></p>'),
('583046a2039e458db87180b2e6d109cb','16a0f1e9a8294a05a7b988fb54e03f1d','<h4>Half-Blood Programmer</h4>
<p class=\"small text-muted\">Life is easy to chronicle, but bewildering to practice.</p>');
/*!40000 ALTER TABLE `SectionContentParagraph` ENABLE KEYS */;

DROP TABLE IF EXISTS `SectionContentTitle`;
CREATE TABLE `SectionContentTitle` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionWidgetId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`InnerText` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Href` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`TitleLevel` VARCHAR(10) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `SectionContentTitle` DISABLE KEYS */;
INSERT INTO `SectionContentTitle` VALUES
('105','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL),
('107','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL),
('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL),
('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL),
('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL),
('14','2b3eb61307d24c50a6b3aaa75db3810e','WHY CHOOSE US?',NULL,NULL),
('17','00f62c5acfe840e0bee3ca2979f0f025','WHY CHOOSE US?',NULL,NULL),
('20','f6f11ba2fec844de883acf0a1fe3eb89','WHY CHOOSE US?',NULL,NULL),
('23','481574ebc98b4cdf9a07e3f20c1ab78d','WHY CHOOSE US?',NULL,NULL),
('33','55b73e54fd054de4847960bdac350c6d','建筑业',NULL,NULL),
('34','55b73e54fd054de4847960bdac350c6d','能源化工',NULL,NULL),
('47','1fb967867e3b440e86336bc5a51e8719','建筑业',NULL,NULL),
('48','1fb967867e3b440e86336bc5a51e8719','能源化工',NULL,NULL),
('49','1fb967867e3b440e86336bc5a51e8719','汽车业',NULL,NULL);
/*!40000 ALTER TABLE `SectionContentTitle` ENABLE KEYS */;

DROP TABLE IF EXISTS `SectionContentVideo`;
CREATE TABLE `SectionContentVideo` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`VideoTitle` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`Thumbnail` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`SectionWidgetId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Width` INT  NULL,
	`Height` INT  NULL,
	`Url` VARCHAR(256) CHARACTER SET utf8mb4  NULL,
	`Code` LONGTEXT CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `SectionGroup`;
CREATE TABLE `SectionGroup` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`GroupName` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`SectionWidgetId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`PartialView` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Order` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`PercentWidth` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_SectionGroup_SectionGroup_Template` (`PartialView`),
	CONSTRAINT `FK_SectionGroup_SectionGroup_Template` FOREIGN KEY (`PartialView`) REFERENCES `SectionTemplate` (`TemplateName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	KEY `FK_SectionGroup_SectionWidget` (`SectionWidgetId`),
	CONSTRAINT `FK_SectionGroup_SectionWidget` FOREIGN KEY (`SectionWidgetId`) REFERENCES `SectionWidget` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `SectionGroup` DISABLE KEYS */;
INSERT INTO `SectionGroup` VALUES
('10','右','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('11','左','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('12','右','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('13','左','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('14','中','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('15','右','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('16','左','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('17','中','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('18','右','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('2dd968aa41a44774b7aee6423ff7f837','组1','16a0f1e9a8294a05a7b988fb54e03f1d','SectionTemplate.Default',1,'admin','ZKEASOFT','2019-05-07 21:21:00.040','admin','ZKEASOFT','2019-05-07 21:21:00.040','col-sm-4'),
('40','左','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('41','右','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('42','左','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('43','右','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('44','中','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('5','G1','2b3eb61307d24c50a6b3aaa75db3810e','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('6','G1','00f62c5acfe840e0bee3ca2979f0f025','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('7','G1','f6f11ba2fec844de883acf0a1fe3eb89','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('8','G1','481574ebc98b4cdf9a07e3f20c1ab78d','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('9','左','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('f0baed3ec02145769a972e4d874f7842','组2','16a0f1e9a8294a05a7b988fb54e03f1d','SectionTemplate.Default',2,'admin','ZKEASOFT','2019-05-07 21:21:00.100','admin','ZKEASOFT','2019-05-07 21:21:00.100','col-sm-8');
/*!40000 ALTER TABLE `SectionGroup` ENABLE KEYS */;

DROP TABLE IF EXISTS `SectionTemplate`;
CREATE TABLE `SectionTemplate` (
	`TemplateName` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Thumbnail` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`ExampleData` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`TemplateName`)
);

/*!40000 ALTER TABLE `SectionTemplate` DISABLE KEYS */;
INSERT INTO `SectionTemplate` VALUES
('SectionTemplate.Column','左右','Thumbnail\SectionTemplate.Column.png','Thumbnail\SectionTemplate.Column.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Default','默认','Thumbnail\SectionTemplate.Default.png','Thumbnail\SectionTemplate.Default.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ImageRight','图片右','Thumbnail\SectionTemplate.ImageRight.png','Thumbnail\SectionTemplate.ImageRight.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.LinkGroup','链接组','Thumbnail\SectionTemplate.LinkGroup.png','Thumbnail\SectionTemplate.LinkGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ListGroup','列表组','Thumbnail\SectionTemplate.ListGroup.png','Thumbnail\SectionTemplate.ListGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ListView','媒体列表','Thumbnail\SectionTemplate.ListView.png','Thumbnail\SectionTemplate.ListView.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Thumbnail','缩略图','Thumbnail\SectionTemplate.Thumbnail.png','Thumbnail\SectionTemplate.Thumbnail.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `SectionTemplate` ENABLE KEYS */;

DROP TABLE IF EXISTS `SectionWidget`;
CREATE TABLE `SectionWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionTitle` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`IsHorizontal` TINYINT(1)  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_SectionWidget_CMS_WidgetBase` (`ID`),
	CONSTRAINT `FK_SectionWidget_CMS_WidgetBase` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `SectionWidget` DISABLE KEYS */;
INSERT INTO `SectionWidget` VALUES
('00f62c5acfe840e0bee3ca2979f0f025',NULL,NULL),
('0f66ab8ff0df44e2b5e57fd8d8c5d8ff',NULL,NULL),
('16a0f1e9a8294a05a7b988fb54e03f1d',NULL,NULL),
('1fb967867e3b440e86336bc5a51e8719',NULL,NULL),
('2b3eb61307d24c50a6b3aaa75db3810e',NULL,NULL),
('481574ebc98b4cdf9a07e3f20c1ab78d',NULL,NULL),
('55b73e54fd054de4847960bdac350c6d',NULL,NULL),
('b568ff7f4a894870adaf9afadf787bf9',NULL,NULL),
('ed837392097f4e60b812bc57111dd762',NULL,NULL),
('f41174cfa4d247f4974c47f4d2b000fd',NULL,NULL),
('f6f11ba2fec844de883acf0a1fe3eb89',NULL,NULL);
/*!40000 ALTER TABLE `SectionWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `StyleSheetWidget`;
CREATE TABLE `StyleSheetWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`StyleSheet` LONGTEXT CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_StyleSheetWidget_CMS_WidgetBase` (`ID`),
	CONSTRAINT `FK_StyleSheetWidget_CMS_WidgetBase` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


DROP TABLE IF EXISTS `Subscription`;
CREATE TABLE `Subscription` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Email` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Phone` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Referrer` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`IsValidate` TINYINT(1)  NULL,
	`Title` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `UserRoleRelation`;
CREATE TABLE `UserRoleRelation` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`RoleID` INT  NULL,
	`UserID` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_UserRoleRelation_Roles` (`RoleID`),
	CONSTRAINT `FK_UserRoleRelation_Roles` FOREIGN KEY (`RoleID`) REFERENCES `Roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	KEY `FK_UserRoleRelation_Users` (`UserID`),
	CONSTRAINT `FK_UserRoleRelation_Users` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `UserRoleRelation` DISABLE KEYS */;
INSERT INTO `UserRoleRelation` VALUES
(5,1,'admin');
/*!40000 ALTER TABLE `UserRoleRelation` ENABLE KEYS */;

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
	`UserID` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`PassWord` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ApiLoginToken` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`LastLoginDate` DATETIME  NULL,
	`LoginIP` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`PhotoUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Timestamp` BIGINT  NULL,
	`UserName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`UserTypeCD` INT  NULL,
	`Address` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Age` INT  NULL,
	`Birthday` DATETIME  NULL,
	`Birthplace` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Email` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`EnglishName` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`FirstName` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Hobby` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastName` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`MaritalStatus` INT  NULL,
	`MobilePhone` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`NickName` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Profession` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`QQ` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`School` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Sex` INT  NULL,
	`Telephone` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`ZipCode` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`Status` INT  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`ResetToken` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`ResetTokenDate` DATETIME  NULL,
	PRIMARY KEY (`UserID`)
);

/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES
('admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',NULL,'2020-04-05 10:11:51.617','::1','~/images/head.png',0,'ZKEASOFT',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Admin',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'admin','Admin','2020-04-05 10:11:51.630',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;

DROP TABLE IF EXISTS `VideoWidget`;
CREATE TABLE `VideoWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Width` INT  NULL,
	`Height` INT  NULL,
	`Url` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Code` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_VideoWidget_CMS_WidgetBase` (`ID`),
	CONSTRAINT `FK_VideoWidget_CMS_WidgetBase` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


SET FOREIGN_KEY_CHECKS=1;
