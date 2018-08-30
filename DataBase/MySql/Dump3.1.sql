CREATE DATABASE  IF NOT EXISTS `zkeacms_core` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zkeacms_core`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: zkeacms_core
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applicationsetting`
--

DROP TABLE IF EXISTS `applicationsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicationsetting` (
  `SettingKey` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`SettingKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicationsetting`
--

LOCK TABLES `applicationsetting` WRITE;
/*!40000 ALTER TABLE `applicationsetting` DISABLE KEYS */;
INSERT INTO `applicationsetting` VALUES ('ExpandAllPage','true',NULL,NULL,1,'admin','ZKEASOFT','2018-04-11 17:01:47.230000','admin','ZKEASOFT','2018-04-11 17:01:47.233000'),('Favicon','~/favicon.ico',NULL,NULL,NULL,'admin','ZKEASOFT','2017-03-19 20:57:33.627000','admin','ZKEASOFT','2017-03-19 20:57:33.627000');
/*!40000 ALTER TABLE `applicationsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Summary` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `MetaKeyWords` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `MetaDescription` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Counter` int(11) DEFAULT NULL,
  `ArticleTypeID` int(11) DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ArticleContent` longtext CHARACTER SET utf8mb4,
  `Status` int(11) DEFAULT NULL,
  `ImageThumbUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ImageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsPublish` tinyint(1) NOT NULL,
  `PublishDate` datetime(6) DEFAULT NULL,
  `Url` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Article_ArticleCategory` (`ArticleTypeID`),
  CONSTRAINT `FK_Article_ArticleCategory` FOREIGN KEY (`ArticleTypeID`) REFERENCES `articletype` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'ZKEACMS 简介','ZKEACMS是基于EasyFrameWork，使用 ASP .NET MVC 开发的开源 .Net CMS。  ZKEACMS一个内容管理系统。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。','ZKEACMS','ZKEACMS是基于EasyFrameWork，使用 ASP .NET MVC 开发的开源 .Net CMS。  ZKEACMS一个内容管理系统。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。',1,2,NULL,'<h3>简介</h3>\r\n<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a>是基于<a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>，使用 ASP .NET MVC 开发的开源 .Net CMS。</p>\r\n<p>ZKEACMS一个内容管理系统。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>\r\n<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>\r\n<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>\r\n<h4><a href=\"http://www.zkea.net/zkeacms/createpage\" target=\"_blank\" rel=\"noopener\">了解我们的设计理念</a></h4>\r\n<h3>开发环境</h3>\r\n<p>Microsoft VisualStudio 2013</p>\r\n<p><span>.Net FrameWork 4.0，MVC 4</span></p>\r\n<p>Microsoft Sql Server 2008 以上</p>\r\n<h3>直观设计</h3>\r\n<p>ZKEACMS 是基于ASP.NET MVC设计的开源CMS，所见即所得是ZKEACMS的一大特点。</p>\r\n<p>添加新的页面，或者在现有的页面上直接进行设计，编辑，添加内容，这些都很简单。</p>\r\n<p>丰富的组件和模板，只要会操作电脑，就可以设计网站。</p>\r\n<p><img src=\"http://ww4.sinaimg.cn/mw690/005zTNGqgw1f5e6o2kejlg30dw08an3g.gif\" alt=\"ZKEACMS设计\" /></p>\r\n<h3>操作简单</h3>\r\n<p>ZKEACMS采用拖放操作设计，简单直观，将看到的模板，喜欢的样式直接拖入页面中即可。</p>\r\n<p>在于用户交互的关键地方，都会给出提示或预览，并且ZKEASOFT提供了详细的<a href=\"http://www.zkea.net/zkeacms/document\" target=\"_blank\" rel=\"noopener\">文档</a></p>\r\n<p><img src=\"http://ww3.sinaimg.cn/mw690/005zTNGqgw1f4wcc6gjqqg30dw08g4jr.gif\" alt=\"ZKEACMS添加内容\" /></p>\r\n<h3>移动友好</h3>\r\n<p>ZKEACMS基于流行的BootStrap设计的主题，采用了现代的响应式设计，可以自动适配不同大小的屏幕和设备。</p>\r\n<p>从PC，笔记本，电视，平板到手机页面都会自动响应适应。</p>\r\n<p><img src=\"http://ww2.sinaimg.cn/large/005zTNGqgw1f7l2aq95fvj30ae0fswf2.jpg\" alt=\"ZKEACMS手机预览\" /></p>\r\n<h3>布局设计</h3>\r\n<p>布局，用于对页面做区域划分，用户使用拖拉&ldquo;行&rdquo;，&ldquo;列&rdquo;的方式进行布局的设计。布局的划分，采用行，列的方式进行划分，可嵌套。</p>\r\n<p>一个布局里面，可以添加任意行，每一行使用12等分进行栅格，最多可划分为12列。行列划分完成以后，要在列中加入&ldquo;组件区域&rdquo;，才可以在该列中加入组件。</p>\r\n<p><img class=\"thumbnail\" src=\"http://ww1.sinaimg.cn/large/005zTNGqjw1f57a9zuz5aj31hk0qgah0.jpg\" caption=\"false\" width=\"500\" /></p>\r\n<h3>概览设计</h3>\r\n<p>概览页面，是页面的缩略显示。在这个页面里面，用户可以直接看到页面的布局，和页面中的组件。</p>\r\n<p>在概览页面中，用户可以添加组件到任意区域。可以对任意区域内的组件进行排序或者拖放到别的区域显示。</p>\r\n<p><img class=\"thumbnail\" src=\"http://ww4.sinaimg.cn/large/005zTNGqgw1f3v94xasyzj31370f6q7z.jpg\" caption=\"false\" width=\"500\" /></p>\r\n<h3>可扩展性</h3>\r\n<p>ZKEACMS 设计内容与模板分离，可以在不切换主题的情况下，通过切换模板得到不同的显示效果。</p>\r\n<p>通过不断地添加模板，网页显得更加多元化，现代化。</p>\r\n<p><span>ZKEACMS 是插件式设计，可以通过不断地添加插件来获取新的功能，默认的插件已经足以满足日常使用。</span></p>\r\n<div class=\"section-group-tab\">\r\n<div class=\"tab-content\">\r\n<div role=\"tabpanel\" class=\"tab-pane active\" id=\"d940c40031744497b20408fb370d0843-0\"><img src=\"http://www.zkea.net/UpLoad/Images/201703/a3ff1e5e9d454b0bacba0ccce3d821c6.jpg\" alt=\"\" width=\"500\" height=\"350\" /></div>\r\n<div role=\"tabpanel\" class=\"tab-pane \" id=\"d940c40031744497b20408fb370d0843-1\">\r\n<p style=\"text-align: center;\"></p>\r\n<p style=\"text-align: center;\">ZKEACMS采用拖放操作设计，简单直观，将看到的模板，喜欢的样式直接拖入页面中即可。</p>\r\n<p style=\"text-align: center;\">在于用户交互的关键地方，都会给出提示或预览，并且ZKEASOFT提供了详细的<a href=\"/zkeacms/document\" target=\"_blank\" rel=\"noopener\">文档</a></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p><img src=\"http://ww3.sinaimg.cn/mw690/005zTNGqgw1f4wcc6gjqqg30dw08g4jr.gif\" alt=\"ZKEACMS添加内容\" style=\"display: block; margin-left: auto; margin-right: auto;\" /></p>\r\n</div>\r\n<div role=\"tabpanel\" class=\"tab-pane \" id=\"d940c40031744497b20408fb370d0843-2\">\r\n<p style=\"text-align: center;\">ZKEACMS基于流行的BootStrap设计的主题，采用了现代的响应式设计，可以自动适配不同大小的屏幕和设备。</p>\r\n<p style=\"text-align: center;\">从PC，笔记本，电视，平板到手机页面都会自动响应适应。</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><img src=\"http://ww2.sinaimg.cn/large/005zTNGqgw1f7l2aq95fvj30ae0fswf2.jpg\" alt=\"ZKEACMS手机预览\" /></p>\r\n</div>\r\n<div role=\"tabpanel\" class=\"tab-pane \" id=\"d940c40031744497b20408fb370d0843-3\">\r\n<p style=\"text-align: center;\">布局，用于对页面做区域划分，用户使用拖拉&ldquo;行&rdquo;，&ldquo;列&rdquo;的方式进行布局的设计。布局的划分，采用行，列的方式进行划分，可嵌套。</p>\r\n<p style=\"text-align: center;\">一个布局里面，可以添加任意行，每一行使用12等分进行栅格，最多可划分为12列。行列划分完成以后，要在列中加入&ldquo;组件区域&rdquo;，才可以在该列中加入组件。</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p><img class=\"thumbnail\" style=\"width: 500px; margin: 0 auto;\" src=\"http://ww1.sinaimg.cn/large/005zTNGqjw1f57a9zuz5aj31hk0qgah0.jpg\" caption=\"false\" /></p>\r\n</div>\r\n<div role=\"tabpanel\" class=\"tab-pane \" id=\"d940c40031744497b20408fb370d0843-4\">\r\n<p style=\"text-align: center;\">概览页面，是页面的缩略显示。在这个页面里面，用户可以直接看到页面的布局，和页面中的组件。</p>\r\n<p style=\"text-align: center;\">在概览页面中，用户可以添加组件到任意区域。可以对任意区域内的组件进行排序或者拖放到别的区域显示。</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p><img class=\"thumbnail\" style=\"width: 500px; margin: 0 auto;\" src=\"http://ww4.sinaimg.cn/large/005zTNGqgw1f3v94xasyzj31370f6q7z.jpg\" caption=\"false\" /></p>\r\n</div>\r\n<div role=\"tabpanel\" class=\"tab-pane \" id=\"d940c40031744497b20408fb370d0843-5\">\r\n<h1 style=\"text-align: center;\">模板扩展</h1>\r\n<p style=\"text-align: center;\">ZKEACMS 设计内容与模板分离，可以在不切换主题的情况下，通过切换模板得到不同的显示效果。</p>\r\n<p style=\"text-align: center;\">通过不断地添加模板，网页显得更加多元化，现代化。</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><img class=\"thumbnail\" style=\"margin: 0 auto;\" src=\"http://www.zkea.net/UpLoad/Images/201703/a3ff1e5e9d454b0bacba0ccce3d821c6.jpg\" /></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<h1 style=\"text-align: center;\">插件扩展</h1>\r\n<p style=\"text-align: center;\">ZKEACMS 是插件式设计，可以通过不断地添加插件来获取新的功能，默认的插件已经足以满足日常使用。</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><img src=\"http://www.zkea.net/UpLoad/Images/20160422/131058082331821250.jpg\" width=\"500\" caption=\"false\" /></p>\r\n<p></p>\r\n</div>\r\n</div>\r\n</div>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:41:19.000000','zkeacms','admin','ZKEASOFT','2017-11-19 23:41:19.000000','admin','ZKEASOFT','2018-08-15 15:32:18.393000'),(2,'ZKEACMS For .Net Core','纸壳CMS（ZKEACMS Core） 是ZKEACMS对 .Net Core 版本的全功能实现 CMS，借助于 .Net Core 实现跨平台，您可以在 Windows, MAC OS, Linux, Docker 上运行。','ZKEACMS .Net Core','纸壳CMS（ZKEACMS Core） 是ZKEACMS对 .Net Core 版本的全功能实现 CMS，借助于 .Net Core 实现跨平台，您可以在 Windows, MAC OS, Linux, Docker 上运行。',1,3,NULL,'<h3>全功能迁移</h3>\r\n<p>纸壳CMS（ZKEACMS Core） 是ZKEACMS对 .Net Core 版本的全功能实现 CMS，借助于 .Net Core 实现跨平台，您可以在 Windows, MAC OS, Linux, Docker 上运行。</p>\r\n<p>目前纸壳CMS（ZKEACMS Core）已经正式发布，它拥有ZKEACMS的所有功能，并且更加优秀，在性能等各方面的表现都优于ZKEACMS，我们推荐您使用。</p>\r\n<p><img src=\"http://ww4.sinaimg.cn/mw690/005zTNGqgw1f5e6o2kejlg30dw08an3g.gif\" /></p>\r\n<h3>基于 .NET Core</h3>\r\n<p>.NET Core 是.NET Framework的新一代版本，是微软开发的第一个官方版本，具有跨平台 (Windows、Mac OSX、Linux) 能力的应用程序开发框架 (Application Framework)，未来也将会支持&nbsp;FreeBSD&nbsp;与 Alpine 平台，也是微软在一开始发展时就开源的软件平台，它经常也会拿来和现有的开源 .NET 平台&nbsp;Mono&nbsp;比较。</p>\r\n<p>ZKEACMS Core 基于ASP .NET MVC Core 重新设计，ZKEACMS v2.3使用的是较早的MVC4，现在您可以使用MVC Core的所有新特性了，像tag helper等等，这样您可以尽情使用跨平台的优势，并且具有引人注目的性能与高可靠度。开发人员能快速直接的获取 .NET Core 开发环境。</p>\r\n<p><img src=\"http://o7lwfq2j6.bkt.clouddn.com/NETCore.jpg\" width=\"500\" caption=\"false\" /></p>\r\n<h3>重新设计</h3>\r\n<p>由于.Net Core的革命，纸壳CMS（ZKEACMS Core） 重新设计了底层以适应 ASP .NET Core。虽然重新设计了底层，纸壳科技还是尽量保证 Core 版本的CMS的功能完整，并且资源可以在两个版本间共享。</p>\r\n<p>重新设计的 .Net core CMS 将进一步降低您的入门成本。如果您对 ZKEACMS 之前有所了解，那么您将马上可以开始 纸壳CMS（ZKEACMS Core） 的开发工作。</p>\r\n<p><img src=\"http://o7lwfq2j6.bkt.clouddn.com/code-refactoringd.jpg\" /></p>\r\n<h3>Entity Framework Core</h3>\r\n<p>Entity Framework Core&nbsp;是 Entity Framework 的 .Net Core 版本。Entity Framework&nbsp;是微软以 ADO.NET 为基础所发展出来的对象关系对应 (O/R Mapping) 解决方案。使用Entity Framework，你可以轻松的切换使用不同的数据库实例。例如SQLServer，MySql，ORACLE，SQLite等。</p>\r\n<p>纸壳CMS（ZKEACMS Core） 放弃了EasyFramework中的ORM系统，改为使用 Entity Framework Core 作为数据库访问，这样可以减少学习、入门的成本，会Entity Framework即可快速上手。并且可以轻松选择使用不同的数据库。</p>\r\n<p><img src=\"http://o7lwfq2j6.bkt.clouddn.com/Microsoft-e1467354180645.png\" width=\"500\" caption=\"false\" /></p>\r\n<h3>热插拔的插件机制</h3>\r\n<p>纸壳CMS（ZKEACMS Core） 重新设计了插件机制，分离各组件程序集（DLL），这样更方便各组件的独立与隔离。这样一来，插件的热插拔也成为了可能。</p>\r\n<p>基于插件的设计，您的程序可以无限的横向扩展，功能可以变得越来越丰富，而不用去修改核心功能。</p>\r\n<p><img src=\"http://o7lwfq2j6.bkt.clouddn.com/plugin.png\" width=\"500\" caption=\"false\" /></p>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<p></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:53:23.000000','zkeacms-core','admin','ZKEASOFT','2017-11-19 23:53:16.000000','admin','ZKEASOFT','2018-08-15 15:32:10.050000');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articledetailwidget`
--

DROP TABLE IF EXISTS `articledetailwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articledetailwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `CustomerClass` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_ArticleDetailWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articledetailwidget`
--

LOCK TABLES `articledetailwidget` WRITE;
/*!40000 ALTER TABLE `articledetailwidget` DISABLE KEYS */;
INSERT INTO `articledetailwidget` VALUES ('3aa8b53e7ad143ff818855a7abcb3fdd',NULL),('e8fd1019bab045e5927ec30abaaa1aba',NULL);
/*!40000 ALTER TABLE `articledetailwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlelistwidget`
--

DROP TABLE IF EXISTS `articlelistwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlelistwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ArticleTypeID` int(11) DEFAULT NULL,
  `DetailPageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsPageable` tinyint(1) NOT NULL,
  `PageSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_ArticleListWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articlelistwidget`
--

LOCK TABLES `articlelistwidget` WRITE;
/*!40000 ALTER TABLE `articlelistwidget` DISABLE KEYS */;
INSERT INTO `articlelistwidget` VALUES ('416c5402962b41548c83fabaa5492b42',1,'~/article/detail',1,5),('ca9f8809636d448cbd4f3beb418465b3',1,'~/article/detail',1,5);
/*!40000 ALTER TABLE `articlelistwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlesummarywidget`
--

DROP TABLE IF EXISTS `articlesummarywidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlesummarywidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SubTitle` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `DetailLink` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Summary` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_ArticleSummaryWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articlesummarywidget`
--

LOCK TABLES `articlesummarywidget` WRITE;
/*!40000 ALTER TABLE `articlesummarywidget` DISABLE KEYS */;
INSERT INTO `articlesummarywidget` VALUES ('8c5b69f614b641c0a5f7a8e318de8df3','ZKEACMS 简介','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\" target=\"_blank\" rel=\"noopener\">ZKEACMS</a> Core 是基于.Net Core开发的开源CMS，在您开始使用之前，为了保障您的权益，请先查看我们的开源协议<a href=\"http://www.zkea.net/licenses\" target=\"_blank\" rel=\"noopener\">http://www.zkea.net/licenses</a>。</p>\r\n<p>ZKEACMS是一个内容管理软件，ZKEACMS的主旨在于快速创建页面和自定义页面内容。无论您是专业的开发人员还是普通的用户，都可以快速上手使用ZKEACMS。</p>\r\n<p>ZKEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。</p>\r\n<p>架设环境：.Net Core 2.0</p>\r\n<h3>旗舰版</h3>\r\n<p>体验地址：<a href=\"http://demo.zkea.net\" target=\"_blank\" rel=\"noopener\">http://demo.zkea.net</a></p>\r\n<h3>建站系统</h3>\r\n<p>基于ZKEACMS的云建站系统</p>\r\n<p><a href=\"http://www.zkea.net/cloud\" target=\"_blank\" rel=\"noopener\">http://www.zkea.net/cloud</a></p>\r\n<p></p>'),('cd21a7bf68b44f6e8d178b153288a26e','ZKEACMS 简介','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\" target=\"_blank\" rel=\"noopener\">ZKEACMS</a> Core 是基于.Net Core开发的开源CMS，在您开始使用之前，为了保障您的权益，请先查看我们的开源协议<a href=\"http://www.zkea.net/licenses\" target=\"_blank\" rel=\"noopener\">http://www.zkea.net/licenses</a>。</p>\r\n<p>ZKEACMS是一个内容管理软件，ZKEACMS的主旨在于快速创建页面和自定义页面内容。无论您是专业的开发人员还是普通的用户，都可以快速上手使用ZKEACMS。</p>\r\n<p>ZKEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。</p>\r\n<p>架设环境：.Net Core 2.0</p>\r\n<h3>旗舰版</h3>\r\n<p>体验地址：<a href=\"http://demo.zkea.net\" target=\"_blank\" rel=\"noopener\">http://demo.zkea.net</a></p>\r\n<h3>建站系统</h3>\r\n<p>基于ZKEACMS的云建站系统</p>\r\n<p><a href=\"http://www.zkea.net/cloud\" target=\"_blank\" rel=\"noopener\">http://www.zkea.net/cloud</a></p>\r\n<p></p>');
/*!40000 ALTER TABLE `articlesummarywidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articletopwidget`
--

DROP TABLE IF EXISTS `articletopwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articletopwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ArticleTypeID` int(11) DEFAULT NULL,
  `Tops` int(11) DEFAULT NULL,
  `SubTitle` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `MoreLink` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `DetailPageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_ArticleTopWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articletopwidget`
--

LOCK TABLES `articletopwidget` WRITE;
/*!40000 ALTER TABLE `articletopwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `articletopwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articletype`
--

DROP TABLE IF EXISTS `articletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articletype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `Url` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articletype`
--

LOCK TABLES `articletype` WRITE;
/*!40000 ALTER TABLE `articletype` DISABLE KEYS */;
INSERT INTO `articletype` VALUES (1,'新闻',NULL,0,NULL,1,'admin','ZKEASOFT','2016-03-10 13:50:18.000000','admin','ZKEASOFT','2017-10-15 18:18:33.430000'),(2,'公司新闻',NULL,1,'company',1,'admin','ZKEASOFT','2016-03-10 13:50:24.000000','admin','ZKEASOFT','2018-08-15 15:31:38.347000'),(3,'行业新闻',NULL,1,'industry',1,'admin','ZKEASOFT','2016-03-10 13:50:29.000000','admin','ZKEASOFT','2018-08-15 15:31:42.810000');
/*!40000 ALTER TABLE `articletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articletypewidget`
--

DROP TABLE IF EXISTS `articletypewidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articletypewidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ArticleTypeID` int(11) DEFAULT NULL,
  `TargetPage` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ArticleTypeWidget_ArticleType` (`ArticleTypeID`),
  CONSTRAINT `FK_ArticleTypeWidget_ArticleType` FOREIGN KEY (`ArticleTypeID`) REFERENCES `articletype` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ArticleTypeWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articletypewidget`
--

LOCK TABLES `articletypewidget` WRITE;
/*!40000 ALTER TABLE `articletypewidget` DISABLE KEYS */;
INSERT INTO `articletypewidget` VALUES ('8df64186d2fd4d63a9f9bb3b6e34cd2a',1,NULL),('de8d94fd51cb4e73b00518dbb2f134d3',1,NULL);
/*!40000 ALTER TABLE `articletypewidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `ImageUrl` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(18,4) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `PromoCode` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carousel`
--

DROP TABLE IF EXISTS `carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carousel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carousel`
--

LOCK TABLES `carousel` WRITE;
/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
INSERT INTO `carousel` VALUES (1,'示例',NULL,NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.203000','admin','ZKEASOFT','2016-03-27 15:17:54.050000');
/*!40000 ALTER TABLE `carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carouselitem`
--

DROP TABLE IF EXISTS `carouselitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carouselitem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CarouselID` int(11) DEFAULT NULL,
  `CarouselWidgetID` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TargetLink` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ImageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CarouselItem_CarouselWidget` (`CarouselWidgetID`),
  CONSTRAINT `FK_CarouselItem_CarouselWidget` FOREIGN KEY (`CarouselWidgetID`) REFERENCES `carouselwidget` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carouselitem`
--

LOCK TABLES `carouselitem` WRITE;
/*!40000 ALTER TABLE `carouselitem` DISABLE KEYS */;
INSERT INTO `carouselitem` VALUES (1,'图1',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg1.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.217000','admin','ZKEASOFT','2016-03-27 15:17:54.053000'),(2,'图2',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg2.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.570000','admin','ZKEASOFT','2016-03-27 15:17:54.420000'),(3,'图3',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg3.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.573000','admin','ZKEASOFT','2016-03-27 15:17:54.433000');
/*!40000 ALTER TABLE `carouselitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carouselwidget`
--

DROP TABLE IF EXISTS `carouselwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carouselwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `CarouselID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CarouselWidget_Carousel` (`CarouselID`),
  CONSTRAINT `FK_CarouselWidget_Carousel` FOREIGN KEY (`CarouselID`) REFERENCES `carousel` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CarouselWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carouselwidget`
--

LOCK TABLES `carouselwidget` WRITE;
/*!40000 ALTER TABLE `carouselwidget` DISABLE KEYS */;
INSERT INTO `carouselwidget` VALUES ('19350341920b4827bf2a4e458ad24a58',1),('41e075ab1b89453388494a539eec55b9',1);
/*!40000 ALTER TABLE `carouselwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_layout`
--

DROP TABLE IF EXISTS `cms_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_layout` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `LayoutName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ContainerClass` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4,
  `Script` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `ImageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ImageThumbUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Theme` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_layout`
--

LOCK TABLES `cms_layout` WRITE;
/*!40000 ALTER TABLE `cms_layout` DISABLE KEYS */;
INSERT INTO `cms_layout` VALUES ('0846a33e56bf45d5aae602ef40d87444','其它',NULL,'container',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:06:44.200000','admin','ZKEASOFT','2016-03-10 21:06:44.200000','~/images/layout.jpg','~/images/layout.jpg','Default'),('1dae90cf6a8547538cc0c369b9943c01','默认',NULL,'container',1,NULL,NULL,NULL,'admin',NULL,'2015-08-31 11:56:31.750000','admin',NULL,'2015-08-31 11:56:31.750000','~/images/layout.jpg','~/images/layout.jpg','Default');
/*!40000 ALTER TABLE `cms_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_layouthtml`
--

DROP TABLE IF EXISTS `cms_layouthtml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_layouthtml` (
  `LayoutHtmlId` int(11) NOT NULL AUTO_INCREMENT,
  `LayoutId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `PageId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Html` longtext CHARACTER SET utf8mb4,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`LayoutHtmlId`),
  KEY `FK_CMS_LayoutHtml_CMS_Layout` (`LayoutId`),
  CONSTRAINT `FK_CMS_LayoutHtml_CMS_Layout` FOREIGN KEY (`LayoutId`) REFERENCES `cms_layout` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=555 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_layouthtml`
--

LOCK TABLES `cms_layouthtml` WRITE;
/*!40000 ALTER TABLE `cms_layouthtml` DISABLE KEYS */;
INSERT INTO `cms_layouthtml` VALUES (219,'0846a33e56bf45d5aae602ef40d87444',NULL,'<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.063000','admin','ZKEASOFT','2017-11-19 17:48:11.063000'),(220,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.333000','admin','ZKEASOFT','2017-11-19 17:48:11.333000'),(221,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:11.337000','admin','ZKEASOFT','2017-11-19 17:48:11.337000'),(222,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.340000','admin','ZKEASOFT','2017-11-19 17:48:11.340000'),(223,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.347000','admin','ZKEASOFT','2017-11-19 17:48:11.347000'),(224,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.350000','admin','ZKEASOFT','2017-11-19 17:48:11.350000'),(225,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:11.353000','admin','ZKEASOFT','2017-11-19 17:48:11.353000'),(226,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.357000','admin','ZKEASOFT','2017-11-19 17:48:11.357000'),(227,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.370000','admin','ZKEASOFT','2017-11-19 17:48:11.370000'),(228,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.373000','admin','ZKEASOFT','2017-11-19 17:48:11.373000'),(229,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:11.647000','admin','ZKEASOFT','2017-11-19 17:48:11.647000'),(230,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.650000','admin','ZKEASOFT','2017-11-19 17:48:11.650000'),(231,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.650000','admin','ZKEASOFT','2017-11-19 17:48:11.650000'),(232,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.667000','admin','ZKEASOFT','2017-11-19 17:48:11.667000'),(233,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:11.950000','admin','ZKEASOFT','2017-11-19 17:48:11.950000'),(234,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.983000','admin','ZKEASOFT','2017-11-19 17:48:11.983000'),(235,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.987000','admin','ZKEASOFT','2017-11-19 17:48:11.987000'),(236,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:12.223000','admin','ZKEASOFT','2017-11-19 17:48:12.223000'),(237,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:12.270000','admin','ZKEASOFT','2017-11-19 17:48:12.270000'),(238,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:12.500000','admin','ZKEASOFT','2017-11-19 17:48:12.500000'),(239,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:12.757000','admin','ZKEASOFT','2017-11-19 17:48:12.757000'),(240,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:39.997000','admin','ZKEASOFT','2017-11-19 17:48:39.997000'),(241,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.013000','admin','ZKEASOFT','2017-11-19 17:48:40.013000'),(242,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:40.017000','admin','ZKEASOFT','2017-11-19 17:48:40.017000'),(243,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.023000','admin','ZKEASOFT','2017-11-19 17:48:40.023000'),(244,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:40.023000','admin','ZKEASOFT','2017-11-19 17:48:40.023000'),(245,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.027000','admin','ZKEASOFT','2017-11-19 17:48:40.027000'),(246,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:40.027000','admin','ZKEASOFT','2017-11-19 17:48:40.027000'),(247,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030000','admin','ZKEASOFT','2017-11-19 17:48:40.030000'),(248,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:40.030000','admin','ZKEASOFT','2017-11-19 17:48:40.030000'),(249,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030000','admin','ZKEASOFT','2017-11-19 17:48:40.030000'),(250,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:40.043000','admin','ZKEASOFT','2017-11-19 17:48:40.043000'),(251,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.043000','admin','ZKEASOFT','2017-11-19 17:48:40.043000'),(252,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:40.047000','admin','ZKEASOFT','2017-11-19 17:48:40.047000'),(253,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.047000','admin','ZKEASOFT','2017-11-19 17:48:40.047000'),(254,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:40.047000','admin','ZKEASOFT','2017-11-19 17:48:40.047000'),(255,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.053000','admin','ZKEASOFT','2017-11-19 17:48:40.053000'),(256,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>\r\n    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:40.057000','admin','ZKEASOFT','2017-11-19 17:48:40.057000'),(257,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.057000','admin','ZKEASOFT','2017-11-19 17:48:40.057000'),(258,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:40.063000','admin','ZKEASOFT','2017-11-19 17:48:40.063000'),(259,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.063000','admin','ZKEASOFT','2017-11-19 17:48:40.063000'),(260,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:40.073000','admin','ZKEASOFT','2017-11-19 17:48:40.073000'),(261,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.053000','admin','ZKEASOFT','2018-05-21 23:42:40.053000'),(262,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.110000','admin','ZKEASOFT','2018-05-21 23:42:40.110000'),(263,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-0','admin','ZKEASOFT','2018-05-21 23:42:40.113000','admin','ZKEASOFT','2018-05-21 23:42:40.113000'),(264,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.113000','admin','ZKEASOFT','2018-05-21 23:42:40.113000'),(265,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.117000','admin','ZKEASOFT','2018-05-21 23:42:40.117000'),(266,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.117000','admin','ZKEASOFT','2018-05-21 23:42:40.117000'),(267,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-1','admin','ZKEASOFT','2018-05-21 23:42:40.120000','admin','ZKEASOFT','2018-05-21 23:42:40.120000'),(268,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.120000','admin','ZKEASOFT','2018-05-21 23:42:40.120000'),(269,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.120000','admin','ZKEASOFT','2018-05-21 23:42:40.120000'),(270,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.123000','admin','ZKEASOFT','2018-05-21 23:42:40.123000'),(271,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-2','admin','ZKEASOFT','2018-05-21 23:42:40.123000','admin','ZKEASOFT','2018-05-21 23:42:40.123000'),(272,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.127000','admin','ZKEASOFT','2018-05-21 23:42:40.127000'),(273,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.127000','admin','ZKEASOFT','2018-05-21 23:42:40.127000'),(274,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.130000','admin','ZKEASOFT','2018-05-21 23:42:40.130000'),(275,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-3','admin','ZKEASOFT','2018-05-21 23:42:40.133000','admin','ZKEASOFT','2018-05-21 23:42:40.133000'),(276,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.133000','admin','ZKEASOFT','2018-05-21 23:42:40.133000'),(277,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>\r\n    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.133000','admin','ZKEASOFT','2018-05-21 23:42:40.133000'),(278,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.137000','admin','ZKEASOFT','2018-05-21 23:42:40.137000'),(279,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-4','admin','ZKEASOFT','2018-05-21 23:42:40.137000','admin','ZKEASOFT','2018-05-21 23:42:40.137000'),(280,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.140000','admin','ZKEASOFT','2018-05-21 23:42:40.140000'),(281,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:42:40.140000','admin','ZKEASOFT','2018-05-21 23:42:40.140000'),(282,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:54.990000','admin','ZKEASOFT','2018-05-21 23:45:54.990000'),(283,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.003000','admin','ZKEASOFT','2018-05-21 23:45:55.003000'),(284,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-0','admin','ZKEASOFT','2018-05-21 23:45:55.007000','admin','ZKEASOFT','2018-05-21 23:45:55.007000'),(285,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.010000','admin','ZKEASOFT','2018-05-21 23:45:55.010000'),(286,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:55.013000','admin','ZKEASOFT','2018-05-21 23:45:55.013000'),(287,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.013000','admin','ZKEASOFT','2018-05-21 23:45:55.013000'),(288,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-1','admin','ZKEASOFT','2018-05-21 23:45:55.020000','admin','ZKEASOFT','2018-05-21 23:45:55.020000'),(289,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.023000','admin','ZKEASOFT','2018-05-21 23:45:55.023000'),(290,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:55.033000','admin','ZKEASOFT','2018-05-21 23:45:55.033000'),(291,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.037000','admin','ZKEASOFT','2018-05-21 23:45:55.037000'),(292,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-2','admin','ZKEASOFT','2018-05-21 23:45:55.050000','admin','ZKEASOFT','2018-05-21 23:45:55.050000'),(293,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.050000','admin','ZKEASOFT','2018-05-21 23:45:55.050000'),(294,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:55.053000','admin','ZKEASOFT','2018-05-21 23:45:55.053000'),(295,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.060000','admin','ZKEASOFT','2018-05-21 23:45:55.060000'),(296,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-3','admin','ZKEASOFT','2018-05-21 23:45:55.063000','admin','ZKEASOFT','2018-05-21 23:45:55.063000'),(297,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.067000','admin','ZKEASOFT','2018-05-21 23:45:55.067000'),(298,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>\r\n    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:55.070000','admin','ZKEASOFT','2018-05-21 23:45:55.070000'),(299,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.070000','admin','ZKEASOFT','2018-05-21 23:45:55.070000'),(300,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-4','admin','ZKEASOFT','2018-05-21 23:45:55.073000','admin','ZKEASOFT','2018-05-21 23:45:55.073000'),(301,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.077000','admin','ZKEASOFT','2018-05-21 23:45:55.077000'),(302,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:45:55.087000','admin','ZKEASOFT','2018-05-21 23:45:55.087000'),(303,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.367000','admin','ZKEASOFT','2018-05-21 23:46:09.367000'),(304,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.373000','admin','ZKEASOFT','2018-05-21 23:46:09.373000'),(305,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:09.380000','admin','ZKEASOFT','2018-05-21 23:46:09.380000'),(306,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.380000','admin','ZKEASOFT','2018-05-21 23:46:09.380000'),(307,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.383000','admin','ZKEASOFT','2018-05-21 23:46:09.383000'),(308,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.383000','admin','ZKEASOFT','2018-05-21 23:46:09.383000'),(309,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:09.387000','admin','ZKEASOFT','2018-05-21 23:46:09.387000'),(310,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.390000','admin','ZKEASOFT','2018-05-21 23:46:09.390000'),(311,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.393000','admin','ZKEASOFT','2018-05-21 23:46:09.393000'),(312,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.393000','admin','ZKEASOFT','2018-05-21 23:46:09.393000'),(313,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:09.397000','admin','ZKEASOFT','2018-05-21 23:46:09.397000'),(314,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.397000','admin','ZKEASOFT','2018-05-21 23:46:09.397000'),(315,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.400000','admin','ZKEASOFT','2018-05-21 23:46:09.400000'),(316,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.400000','admin','ZKEASOFT','2018-05-21 23:46:09.400000'),(317,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:09.407000','admin','ZKEASOFT','2018-05-21 23:46:09.407000'),(318,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.410000','admin','ZKEASOFT','2018-05-21 23:46:09.410000'),(319,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.417000','admin','ZKEASOFT','2018-05-21 23:46:09.417000'),(320,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.420000','admin','ZKEASOFT','2018-05-21 23:46:09.420000'),(321,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:09.423000','admin','ZKEASOFT','2018-05-21 23:46:09.423000'),(322,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.427000','admin','ZKEASOFT','2018-05-21 23:46:09.427000'),(323,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:09.427000','admin','ZKEASOFT','2018-05-21 23:46:09.427000'),(324,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.003000','admin','ZKEASOFT','2018-05-21 23:46:13.003000'),(325,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.010000','admin','ZKEASOFT','2018-05-21 23:46:13.010000'),(326,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:13.010000','admin','ZKEASOFT','2018-05-21 23:46:13.010000'),(327,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.013000','admin','ZKEASOFT','2018-05-21 23:46:13.013000'),(328,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.013000','admin','ZKEASOFT','2018-05-21 23:46:13.013000'),(329,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.017000','admin','ZKEASOFT','2018-05-21 23:46:13.017000'),(330,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:13.017000','admin','ZKEASOFT','2018-05-21 23:46:13.017000'),(331,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.017000','admin','ZKEASOFT','2018-05-21 23:46:13.017000'),(332,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.020000','admin','ZKEASOFT','2018-05-21 23:46:13.020000'),(333,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.020000','admin','ZKEASOFT','2018-05-21 23:46:13.020000'),(334,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:13.023000','admin','ZKEASOFT','2018-05-21 23:46:13.023000'),(335,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.023000','admin','ZKEASOFT','2018-05-21 23:46:13.023000'),(336,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.027000','admin','ZKEASOFT','2018-05-21 23:46:13.027000'),(337,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.027000','admin','ZKEASOFT','2018-05-21 23:46:13.027000'),(338,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:13.030000','admin','ZKEASOFT','2018-05-21 23:46:13.030000'),(339,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.030000','admin','ZKEASOFT','2018-05-21 23:46:13.030000'),(340,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.033000','admin','ZKEASOFT','2018-05-21 23:46:13.033000'),(341,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.033000','admin','ZKEASOFT','2018-05-21 23:46:13.033000'),(342,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:13.037000','admin','ZKEASOFT','2018-05-21 23:46:13.037000'),(343,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.037000','admin','ZKEASOFT','2018-05-21 23:46:13.037000'),(344,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:13.037000','admin','ZKEASOFT','2018-05-21 23:46:13.037000'),(345,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.127000','admin','ZKEASOFT','2018-05-21 23:46:15.127000'),(346,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.130000','admin','ZKEASOFT','2018-05-21 23:46:15.130000'),(347,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:15.133000','admin','ZKEASOFT','2018-05-21 23:46:15.133000'),(348,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.133000','admin','ZKEASOFT','2018-05-21 23:46:15.133000'),(349,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.137000','admin','ZKEASOFT','2018-05-21 23:46:15.137000'),(350,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.137000','admin','ZKEASOFT','2018-05-21 23:46:15.137000'),(351,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:15.140000','admin','ZKEASOFT','2018-05-21 23:46:15.140000'),(352,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.140000','admin','ZKEASOFT','2018-05-21 23:46:15.140000'),(353,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.143000','admin','ZKEASOFT','2018-05-21 23:46:15.143000'),(354,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.143000','admin','ZKEASOFT','2018-05-21 23:46:15.143000'),(355,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:15.143000','admin','ZKEASOFT','2018-05-21 23:46:15.143000'),(356,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.147000','admin','ZKEASOFT','2018-05-21 23:46:15.147000'),(357,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.147000','admin','ZKEASOFT','2018-05-21 23:46:15.147000'),(358,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.150000','admin','ZKEASOFT','2018-05-21 23:46:15.150000'),(359,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:15.150000','admin','ZKEASOFT','2018-05-21 23:46:15.150000'),(360,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.153000','admin','ZKEASOFT','2018-05-21 23:46:15.153000'),(361,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>\r\n    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.157000','admin','ZKEASOFT','2018-05-21 23:46:15.157000'),(362,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.160000','admin','ZKEASOFT','2018-05-21 23:46:15.160000'),(363,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:15.167000','admin','ZKEASOFT','2018-05-21 23:46:15.167000'),(364,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.167000','admin','ZKEASOFT','2018-05-21 23:46:15.167000'),(365,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:15.173000','admin','ZKEASOFT','2018-05-21 23:46:15.173000'),(366,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.317000','admin','ZKEASOFT','2018-05-21 23:46:19.317000'),(367,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.320000','admin','ZKEASOFT','2018-05-21 23:46:19.320000'),(368,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:19.323000','admin','ZKEASOFT','2018-05-21 23:46:19.323000'),(369,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.323000','admin','ZKEASOFT','2018-05-21 23:46:19.323000'),(370,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.327000','admin','ZKEASOFT','2018-05-21 23:46:19.327000'),(371,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.330000','admin','ZKEASOFT','2018-05-21 23:46:19.330000'),(372,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:19.330000','admin','ZKEASOFT','2018-05-21 23:46:19.330000'),(373,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.337000','admin','ZKEASOFT','2018-05-21 23:46:19.337000'),(374,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.337000','admin','ZKEASOFT','2018-05-21 23:46:19.337000'),(375,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.340000','admin','ZKEASOFT','2018-05-21 23:46:19.340000'),(376,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:19.340000','admin','ZKEASOFT','2018-05-21 23:46:19.340000'),(377,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.343000','admin','ZKEASOFT','2018-05-21 23:46:19.343000'),(378,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.343000','admin','ZKEASOFT','2018-05-21 23:46:19.343000'),(379,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.347000','admin','ZKEASOFT','2018-05-21 23:46:19.347000'),(380,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:19.347000','admin','ZKEASOFT','2018-05-21 23:46:19.347000'),(381,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.350000','admin','ZKEASOFT','2018-05-21 23:46:19.350000'),(382,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>\r\n    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.350000','admin','ZKEASOFT','2018-05-21 23:46:19.350000'),(383,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353000','admin','ZKEASOFT','2018-05-21 23:46:19.353000'),(384,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:19.353000','admin','ZKEASOFT','2018-05-21 23:46:19.353000'),(385,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353000','admin','ZKEASOFT','2018-05-21 23:46:19.353000'),(386,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:19.357000','admin','ZKEASOFT','2018-05-21 23:46:19.357000'),(387,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.740000','admin','ZKEASOFT','2018-05-21 23:46:28.740000'),(388,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.747000','admin','ZKEASOFT','2018-05-21 23:46:28.747000'),(389,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:28.747000','admin','ZKEASOFT','2018-05-21 23:46:28.747000'),(390,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.753000','admin','ZKEASOFT','2018-05-21 23:46:28.753000'),(391,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.753000','admin','ZKEASOFT','2018-05-21 23:46:28.753000'),(392,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.760000','admin','ZKEASOFT','2018-05-21 23:46:28.760000'),(393,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:28.760000','admin','ZKEASOFT','2018-05-21 23:46:28.760000'),(394,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.763000','admin','ZKEASOFT','2018-05-21 23:46:28.763000'),(395,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.763000','admin','ZKEASOFT','2018-05-21 23:46:28.763000'),(396,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.767000','admin','ZKEASOFT','2018-05-21 23:46:28.767000'),(397,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:28.770000','admin','ZKEASOFT','2018-05-21 23:46:28.770000'),(398,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.780000','admin','ZKEASOFT','2018-05-21 23:46:28.780000'),(399,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.783000','admin','ZKEASOFT','2018-05-21 23:46:28.783000'),(400,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.790000','admin','ZKEASOFT','2018-05-21 23:46:28.790000'),(401,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:28.790000','admin','ZKEASOFT','2018-05-21 23:46:28.790000'),(402,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.797000','admin','ZKEASOFT','2018-05-21 23:46:28.797000'),(403,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.797000','admin','ZKEASOFT','2018-05-21 23:46:28.797000'),(404,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.803000','admin','ZKEASOFT','2018-05-21 23:46:28.803000'),(405,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:28.810000','admin','ZKEASOFT','2018-05-21 23:46:28.810000'),(406,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.810000','admin','ZKEASOFT','2018-05-21 23:46:28.810000'),(407,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:28.817000','admin','ZKEASOFT','2018-05-21 23:46:28.817000'),(408,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.763000','admin','ZKEASOFT','2018-05-21 23:46:34.763000'),(409,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.767000','admin','ZKEASOFT','2018-05-21 23:46:34.767000'),(410,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:34.770000','admin','ZKEASOFT','2018-05-21 23:46:34.770000'),(411,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.773000','admin','ZKEASOFT','2018-05-21 23:46:34.773000'),(412,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.773000','admin','ZKEASOFT','2018-05-21 23:46:34.773000'),(413,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.777000','admin','ZKEASOFT','2018-05-21 23:46:34.777000'),(414,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:34.777000','admin','ZKEASOFT','2018-05-21 23:46:34.777000'),(415,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.783000','admin','ZKEASOFT','2018-05-21 23:46:34.783000'),(416,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.783000','admin','ZKEASOFT','2018-05-21 23:46:34.783000'),(417,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.797000','admin','ZKEASOFT','2018-05-21 23:46:34.797000'),(418,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:34.800000','admin','ZKEASOFT','2018-05-21 23:46:34.800000'),(419,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.800000','admin','ZKEASOFT','2018-05-21 23:46:34.800000'),(420,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.803000','admin','ZKEASOFT','2018-05-21 23:46:34.803000'),(421,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.810000','admin','ZKEASOFT','2018-05-21 23:46:34.810000'),(422,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:34.817000','admin','ZKEASOFT','2018-05-21 23:46:34.817000'),(423,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.820000','admin','ZKEASOFT','2018-05-21 23:46:34.820000'),(424,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.820000','admin','ZKEASOFT','2018-05-21 23:46:34.820000'),(425,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.827000','admin','ZKEASOFT','2018-05-21 23:46:34.827000'),(426,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:34.827000','admin','ZKEASOFT','2018-05-21 23:46:34.827000'),(427,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.833000','admin','ZKEASOFT','2018-05-21 23:46:34.833000'),(428,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:34.833000','admin','ZKEASOFT','2018-05-21 23:46:34.833000'),(429,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.443000','admin','ZKEASOFT','2018-05-22 11:31:26.443000'),(430,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.453000','admin','ZKEASOFT','2018-05-22 11:31:26.453000'),(431,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:26.453000','admin','ZKEASOFT','2018-05-22 11:31:26.453000'),(432,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.457000','admin','ZKEASOFT','2018-05-22 11:31:26.457000'),(433,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.457000','admin','ZKEASOFT','2018-05-22 11:31:26.457000'),(434,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.457000','admin','ZKEASOFT','2018-05-22 11:31:26.457000'),(435,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:26.460000','admin','ZKEASOFT','2018-05-22 11:31:26.460000'),(436,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.463000','admin','ZKEASOFT','2018-05-22 11:31:26.463000'),(437,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.463000','admin','ZKEASOFT','2018-05-22 11:31:26.463000'),(438,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.467000','admin','ZKEASOFT','2018-05-22 11:31:26.467000'),(439,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:26.467000','admin','ZKEASOFT','2018-05-22 11:31:26.467000'),(440,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.470000','admin','ZKEASOFT','2018-05-22 11:31:26.470000'),(441,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.473000','admin','ZKEASOFT','2018-05-22 11:31:26.473000'),(442,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.473000','admin','ZKEASOFT','2018-05-22 11:31:26.473000'),(443,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:26.477000','admin','ZKEASOFT','2018-05-22 11:31:26.477000'),(444,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.480000','admin','ZKEASOFT','2018-05-22 11:31:26.480000'),(445,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.480000','admin','ZKEASOFT','2018-05-22 11:31:26.480000'),(446,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.483000','admin','ZKEASOFT','2018-05-22 11:31:26.483000'),(447,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:26.483000','admin','ZKEASOFT','2018-05-22 11:31:26.483000'),(448,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.487000','admin','ZKEASOFT','2018-05-22 11:31:26.487000'),(449,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:26.487000','admin','ZKEASOFT','2018-05-22 11:31:26.487000'),(450,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.517000','admin','ZKEASOFT','2018-05-22 11:31:31.517000'),(451,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.520000','admin','ZKEASOFT','2018-05-22 11:31:31.520000'),(452,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:31.537000','admin','ZKEASOFT','2018-05-22 11:31:31.537000'),(453,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.547000','admin','ZKEASOFT','2018-05-22 11:31:31.547000'),(454,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.560000','admin','ZKEASOFT','2018-05-22 11:31:31.560000'),(455,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.580000','admin','ZKEASOFT','2018-05-22 11:31:31.580000'),(456,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:31.593000','admin','ZKEASOFT','2018-05-22 11:31:31.593000'),(457,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.607000','admin','ZKEASOFT','2018-05-22 11:31:31.607000'),(458,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.617000','admin','ZKEASOFT','2018-05-22 11:31:31.617000'),(459,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.620000','admin','ZKEASOFT','2018-05-22 11:31:31.620000'),(460,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:31.620000','admin','ZKEASOFT','2018-05-22 11:31:31.620000'),(461,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.627000','admin','ZKEASOFT','2018-05-22 11:31:31.627000'),(462,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.640000','admin','ZKEASOFT','2018-05-22 11:31:31.640000'),(463,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.653000','admin','ZKEASOFT','2018-05-22 11:31:31.653000'),(464,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:31.663000','admin','ZKEASOFT','2018-05-22 11:31:31.663000'),(465,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.677000','admin','ZKEASOFT','2018-05-22 11:31:31.677000'),(466,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.687000','admin','ZKEASOFT','2018-05-22 11:31:31.687000'),(467,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.700000','admin','ZKEASOFT','2018-05-22 11:31:31.700000'),(468,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:31.713000','admin','ZKEASOFT','2018-05-22 11:31:31.713000'),(469,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.723000','admin','ZKEASOFT','2018-05-22 11:31:31.723000'),(470,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:31.737000','admin','ZKEASOFT','2018-05-22 11:31:31.737000'),(471,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.700000','admin','ZKEASOFT','2018-05-22 11:31:35.700000'),(472,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.700000','admin','ZKEASOFT','2018-05-22 11:31:35.700000'),(473,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:35.713000','admin','ZKEASOFT','2018-05-22 11:31:35.713000'),(474,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.723000','admin','ZKEASOFT','2018-05-22 11:31:35.723000'),(475,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.737000','admin','ZKEASOFT','2018-05-22 11:31:35.737000'),(476,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.750000','admin','ZKEASOFT','2018-05-22 11:31:35.750000'),(477,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:35.763000','admin','ZKEASOFT','2018-05-22 11:31:35.763000'),(478,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.773000','admin','ZKEASOFT','2018-05-22 11:31:35.773000'),(479,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.787000','admin','ZKEASOFT','2018-05-22 11:31:35.787000'),(480,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.800000','admin','ZKEASOFT','2018-05-22 11:31:35.800000'),(481,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:35.813000','admin','ZKEASOFT','2018-05-22 11:31:35.813000'),(482,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.823000','admin','ZKEASOFT','2018-05-22 11:31:35.823000'),(483,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.837000','admin','ZKEASOFT','2018-05-22 11:31:35.837000'),(484,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.850000','admin','ZKEASOFT','2018-05-22 11:31:35.850000'),(485,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:35.860000','admin','ZKEASOFT','2018-05-22 11:31:35.860000'),(486,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.873000','admin','ZKEASOFT','2018-05-22 11:31:35.873000'),(487,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.887000','admin','ZKEASOFT','2018-05-22 11:31:35.887000'),(488,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.897000','admin','ZKEASOFT','2018-05-22 11:31:35.897000'),(489,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:35.910000','admin','ZKEASOFT','2018-05-22 11:31:35.910000'),(490,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.923000','admin','ZKEASOFT','2018-05-22 11:31:35.923000'),(491,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:35.937000','admin','ZKEASOFT','2018-05-22 11:31:35.937000'),(492,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.900000','admin','ZKEASOFT','2018-05-22 11:31:39.900000'),(493,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.900000','admin','ZKEASOFT','2018-05-22 11:31:39.900000'),(494,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:39.903000','admin','ZKEASOFT','2018-05-22 11:31:39.903000'),(495,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.903000','admin','ZKEASOFT','2018-05-22 11:31:39.903000'),(496,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>\r\n    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.907000','admin','ZKEASOFT','2018-05-22 11:31:39.907000'),(497,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.907000','admin','ZKEASOFT','2018-05-22 11:31:39.907000'),(498,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:39.907000','admin','ZKEASOFT','2018-05-22 11:31:39.907000'),(499,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.910000','admin','ZKEASOFT','2018-05-22 11:31:39.910000'),(500,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.913000','admin','ZKEASOFT','2018-05-22 11:31:39.913000'),(501,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.913000','admin','ZKEASOFT','2018-05-22 11:31:39.913000'),(502,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:39.917000','admin','ZKEASOFT','2018-05-22 11:31:39.917000'),(503,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.917000','admin','ZKEASOFT','2018-05-22 11:31:39.917000'),(504,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.920000','admin','ZKEASOFT','2018-05-22 11:31:39.920000'),(505,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.923000','admin','ZKEASOFT','2018-05-22 11:31:39.923000'),(506,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:39.927000','admin','ZKEASOFT','2018-05-22 11:31:39.927000'),(507,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.930000','admin','ZKEASOFT','2018-05-22 11:31:39.930000'),(508,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.933000','admin','ZKEASOFT','2018-05-22 11:31:39.933000'),(509,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.933000','admin','ZKEASOFT','2018-05-22 11:31:39.933000'),(510,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:39.937000','admin','ZKEASOFT','2018-05-22 11:31:39.937000'),(511,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.937000','admin','ZKEASOFT','2018-05-22 11:31:39.937000'),(512,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:39.937000','admin','ZKEASOFT','2018-05-22 11:31:39.937000'),(513,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.950000','admin','ZKEASOFT','2018-05-22 11:31:43.950000'),(514,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.953000','admin','ZKEASOFT','2018-05-22 11:31:43.953000'),(515,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:43.953000','admin','ZKEASOFT','2018-05-22 11:31:43.953000'),(516,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.957000','admin','ZKEASOFT','2018-05-22 11:31:43.957000'),(517,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.957000','admin','ZKEASOFT','2018-05-22 11:31:43.957000'),(518,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.963000','admin','ZKEASOFT','2018-05-22 11:31:43.963000'),(519,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:43.967000','admin','ZKEASOFT','2018-05-22 11:31:43.967000'),(520,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.967000','admin','ZKEASOFT','2018-05-22 11:31:43.967000'),(521,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.970000','admin','ZKEASOFT','2018-05-22 11:31:43.970000'),(522,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.973000','admin','ZKEASOFT','2018-05-22 11:31:43.973000'),(523,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:43.977000','admin','ZKEASOFT','2018-05-22 11:31:43.977000'),(524,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.980000','admin','ZKEASOFT','2018-05-22 11:31:43.980000'),(525,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.983000','admin','ZKEASOFT','2018-05-22 11:31:43.983000'),(526,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.983000','admin','ZKEASOFT','2018-05-22 11:31:43.983000'),(527,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:43.987000','admin','ZKEASOFT','2018-05-22 11:31:43.987000'),(528,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.987000','admin','ZKEASOFT','2018-05-22 11:31:43.987000'),(529,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>\r\n    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.990000','admin','ZKEASOFT','2018-05-22 11:31:43.990000'),(530,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.990000','admin','ZKEASOFT','2018-05-22 11:31:43.990000'),(531,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:43.993000','admin','ZKEASOFT','2018-05-22 11:31:43.993000'),(532,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.997000','admin','ZKEASOFT','2018-05-22 11:31:43.997000'),(533,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:44.000000','admin','ZKEASOFT','2018-05-22 11:31:44.000000'),(534,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.357000','admin','ZKEASOFT','2018-05-22 11:31:49.357000'),(535,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.360000','admin','ZKEASOFT','2018-05-22 11:31:49.360000'),(536,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:49.373000','admin','ZKEASOFT','2018-05-22 11:31:49.373000'),(537,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.387000','admin','ZKEASOFT','2018-05-22 11:31:49.387000'),(538,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.397000','admin','ZKEASOFT','2018-05-22 11:31:49.397000'),(539,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.410000','admin','ZKEASOFT','2018-05-22 11:31:49.410000'),(540,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:49.427000','admin','ZKEASOFT','2018-05-22 11:31:49.427000'),(541,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.440000','admin','ZKEASOFT','2018-05-22 11:31:49.440000'),(542,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.453000','admin','ZKEASOFT','2018-05-22 11:31:49.453000'),(543,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.463000','admin','ZKEASOFT','2018-05-22 11:31:49.463000'),(544,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:49.477000','admin','ZKEASOFT','2018-05-22 11:31:49.477000'),(545,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.490000','admin','ZKEASOFT','2018-05-22 11:31:49.490000'),(546,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.503000','admin','ZKEASOFT','2018-05-22 11:31:49.503000'),(547,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.517000','admin','ZKEASOFT','2018-05-22 11:31:49.517000'),(548,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:49.527000','admin','ZKEASOFT','2018-05-22 11:31:49.527000'),(549,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.540000','admin','ZKEASOFT','2018-05-22 11:31:49.540000'),(550,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>\r\n    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.553000','admin','ZKEASOFT','2018-05-22 11:31:49.553000'),(551,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.567000','admin','ZKEASOFT','2018-05-22 11:31:49.567000'),(552,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:49.580000','admin','ZKEASOFT','2018-05-22 11:31:49.580000'),(553,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.593000','admin','ZKEASOFT','2018-05-22 11:31:49.593000'),(554,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:49.607000','admin','ZKEASOFT','2018-05-22 11:31:49.607000');
/*!40000 ALTER TABLE `cms_layouthtml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_media`
--

DROP TABLE IF EXISTS `cms_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_media` (
  `ID` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `ParentID` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `MediaType` int(11) DEFAULT NULL,
  `Url` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_media`
--

LOCK TABLES `cms_media` WRITE;
/*!40000 ALTER TABLE `cms_media` DISABLE KEYS */;
INSERT INTO `cms_media` VALUES ('6056810a7ede46bb94b55b2756323640','#','图片',1,NULL,NULL,'admin','ZKEASOFT','2016-04-01 21:42:14.960000','admin','ZKEASOFT','2016-04-01 21:42:14.960000',NULL);
/*!40000 ALTER TABLE `cms_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_message`
--

DROP TABLE IF EXISTS `cms_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `PostMessage` longtext CHARACTER SET utf8mb4 NOT NULL,
  `Reply` longtext CHARACTER SET utf8mb4,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_message`
--

LOCK TABLES `cms_message` WRITE;
/*!40000 ALTER TABLE `cms_message` DISABLE KEYS */;
INSERT INTO `cms_message` VALUES (1,'ZKEASOFT','zkea@zkea.net','ZKEACMS是基于ASP.NET MVC4开发的开源CMS，提供免费下载学习使用。','KEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。',1,'admin','ZKEASOFT','2017-03-19 21:02:34.260000','admin','ZKEASOFT','2017-03-19 21:02:34.260000',NULL),(2,'ZKEASOFT','zkea@zkea.net','ZKEACMS使用可视化编辑设计','ZKEACMS是一个内容管理软件（网站），不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。',1,'admin','ZKEASOFT','2017-03-19 21:03:09.967000','admin','ZKEASOFT','2017-03-19 21:03:09.967000',NULL);
/*!40000 ALTER TABLE `cms_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ReferencePageID` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsPublishedPage` tinyint(1) DEFAULT NULL,
  `ParentId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PageName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsHomePage` tinyint(1) NOT NULL,
  `Url` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LayoutId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Content` longtext CHARACTER SET utf8mb4,
  `DisplayOrder` int(11) DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4,
  `Status` int(11) DEFAULT NULL,
  `IsPublish` tinyint(1) NOT NULL,
  `PublishDate` datetime(6) DEFAULT NULL,
  `MetaKeyWorlds` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `MetaDescription` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Script` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CMS_Page_CMS_Layout` (`LayoutId`),
  CONSTRAINT `FK_CMS_Page_CMS_Layout` FOREIGN KEY (`LayoutId`) REFERENCES `cms_layout` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES ('068c85b8de8744e7a81b1d1010583308','9d84599edb2443439a53e8d906815c8f',1,'#','产品',0,'~/product','0846a33e56bf45d5aae602ef40d87444','产品',NULL,4,NULL,1,0,'2016-05-15 20:56:40.843000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.843000','admin','ZKEASOFT','2016-05-15 20:56:40.843000'),('0880a4dfdc184ff99b88c88325716d1b',NULL,0,'#','主页',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','欢迎使用ZKEACMS进行创作',NULL,1,NULL,1,1,'2017-10-15 18:11:36.267000',NULL,NULL,NULL,NULL,'admin',NULL,'2015-08-31 13:27:16.110000','admin','ZKEASOFT','2017-10-15 18:11:36.267000'),('1c93b61690ce49d7af8e1ea45ac58eb9',NULL,0,'#','联系我们',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01',' 联系我们',NULL,7,NULL,1,1,'2017-03-19 21:05:28.837000',' 联系我们',' 联系我们',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:03:50.763000','admin','ZKEASOFT','2017-03-19 21:05:16.280000'),('4b889b430aa44517bbad38a57c745cc5','a8d73e29b1eb4b7ea43420e2b6bf2c1b',1,'9d84599edb2443439a53e8d906815c8f','产品详细',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2016-03-10 23:24:38.777000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.780000','admin','ZKEASOFT','2016-03-10 23:24:38.780000'),('50fa3579e7434555a22f095dcb4ea35e','0880a4dfdc184ff99b88c88325716d1b',1,'#','主页',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','欢迎使用ZKEACMS进行创作',NULL,1,NULL,1,0,'2017-10-15 18:11:36.273000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.277000','admin','ZKEASOFT','2017-10-15 18:11:36.810000'),('534e07f396b14b7584a833d270356cb7','1c93b61690ce49d7af8e1ea45ac58eb9',1,'#','联系我们',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01',' 联系我们',NULL,7,NULL,1,0,'2017-03-19 21:05:30.803000',' 联系我们',' 联系我们',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.833000','admin','ZKEASOFT','2017-03-19 21:05:31.050000'),('9ce910ba45a24fd2af804d6d0de7bba3','be49e3ec3b5a4f5eae3edaf8ba64f185',1,'#','问卷调查',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','问卷调查 | ZKEASOFT',NULL,5,NULL,1,0,'2017-10-15 18:20:42.203000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:20:42.207000','admin','ZKEASOFT','2017-10-15 18:20:42.217000'),('9d84599edb2443439a53e8d906815c8f',NULL,0,'#','产品',0,'~/product','0846a33e56bf45d5aae602ef40d87444','产品',NULL,4,NULL,1,1,'2016-05-15 20:56:40.763000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:10.430000','admin','ZKEASOFT','2016-05-14 15:01:42.697000'),('a3d735320eb04c63bf3258d7b44e30f8',NULL,0,'e371628aa3ff46c3a167f121c7a3f32b','文章详细',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2017-12-03 17:11:47.220000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:03.240000','admin','ZKEASOFT','2017-12-03 17:11:47.223000'),('a8d73e29b1eb4b7ea43420e2b6bf2c1b',NULL,0,'9d84599edb2443439a53e8d906815c8f','产品详细',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2016-03-10 23:24:38.743000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:11.263000','admin','ZKEASOFT','2016-03-10 23:24:38.737000'),('be49e3ec3b5a4f5eae3edaf8ba64f185',NULL,0,'#','问卷调查',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','问卷调查 | ZKEASOFT',NULL,5,NULL,1,1,'2017-10-15 18:20:42.193000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:58:52.057000','admin','ZKEASOFT','2017-10-15 18:20:42.193000'),('c5b97a044c9844529fc48383d141e73c','a3d735320eb04c63bf3258d7b44e30f8',1,'e371628aa3ff46c3a167f121c7a3f32b','文章详细',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2017-12-03 17:11:47.237000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.243000','admin','ZKEASOFT','2017-12-03 17:11:47.307000'),('d070f202bb2f45ddbd35f0a7cfee1dfa','e371628aa3ff46c3a167f121c7a3f32b',1,'#','文章',0,'~/article','0846a33e56bf45d5aae602ef40d87444','文章',NULL,3,NULL,1,0,'2017-10-15 18:11:44.947000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.947000','admin','ZKEASOFT','2017-10-15 18:11:45.367000'),('e371628aa3ff46c3a167f121c7a3f32b',NULL,0,'#','文章',0,'~/article','0846a33e56bf45d5aae602ef40d87444','文章',NULL,3,NULL,1,1,'2017-10-15 18:11:44.940000',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-09 12:45:01.000000','admin','ZKEASOFT','2017-10-15 18:11:44.940000');
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_redirection`
--

DROP TABLE IF EXISTS `cms_redirection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_redirection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `InComingUrl` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `DestinationURL` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `IsPermanent` tinyint(1) NOT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_redirection`
--

LOCK TABLES `cms_redirection` WRITE;
/*!40000 ALTER TABLE `cms_redirection` DISABLE KEYS */;
INSERT INTO `cms_redirection` VALUES (1,'默认','~/','~/index',0,NULL,1,'admin','ZKEASOFT','2017-08-14 14:58:06.000000','admin','ZKEASOFT','2017-08-14 15:53:01.387000');
/*!40000 ALTER TABLE `cms_redirection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_rule`
--

DROP TABLE IF EXISTS `cms_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_rule` (
  `RuleID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ZoneName` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `RuleExpression` varchar(800) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `RuleItems` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`RuleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_rule`
--

LOCK TABLES `cms_rule` WRITE;
/*!40000 ALTER TABLE `cms_rule` DISABLE KEYS */;
INSERT INTO `cms_rule` VALUES (1,'所有页面','顶部','StartsWith(ValueOf(\'Url\'),\'/\')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:34.623000','admin','ZKEASOFT','2018-05-21 23:43:34.623000','[{\"Condition\":\"and\",\"FunctionName\":\"StartsWith\",\"Property\":\"ValueOf(\'Url\')\",\"Value\":\"/\",\"Title\":null,\"Description\":null,\"Status\":null,\"CreateBy\":null,\"CreatebyName\":null,\"CreateDate\":null,\"LastUpdateBy\":null,\"LastUpdateByName\":null,\"LastUpdateDate\":null,\"ActionType\":1}]'),(2,'所有页面','底部','StartsWith(ValueOf(\'Url\'),\'/\')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:52.343000','admin','ZKEASOFT','2018-05-21 23:43:52.343000','[{\"Condition\":\"and\",\"FunctionName\":\"StartsWith\",\"Property\":\"ValueOf(\'Url\')\",\"Value\":\"/\",\"Title\":null,\"Description\":null,\"Status\":null,\"CreateBy\":null,\"CreatebyName\":null,\"CreateDate\":null,\"LastUpdateBy\":null,\"LastUpdateByName\":null,\"LastUpdateDate\":null,\"ActionType\":1}]');
/*!40000 ALTER TABLE `cms_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme`
--

DROP TABLE IF EXISTS `cms_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Url` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `UrlDebugger` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Thumbnail` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsActived` tinyint(1) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme`
--

LOCK TABLES `cms_theme` WRITE;
/*!40000 ALTER TABLE `cms_theme` DISABLE KEYS */;
INSERT INTO `cms_theme` VALUES ('Default','默认','~/themes/Default/css/Theme.min.css','~/themes/Default/css/Theme.css','~/themes/Default/thumbnail.jpg',1,1,NULL,'admin','ZKEASOFT','2016-04-04 22:17:10.790000','admin','ZKEASOFT','2016-04-04 22:21:01.487000');
/*!40000 ALTER TABLE `cms_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_widgetbase`
--

DROP TABLE IF EXISTS `cms_widgetbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_widgetbase` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `WidgetName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Position` int(11) DEFAULT NULL,
  `LayoutId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PageId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ZoneId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PartialView` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `AssemblyName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ServiceTypeName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ViewModelTypeName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `FormView` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `StyleClass` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4,
  `Status` int(11) DEFAULT NULL,
  `IsTemplate` tinyint(1) DEFAULT '0',
  `Thumbnail` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsSystem` tinyint(1) DEFAULT '0',
  `ExtendData` longtext CHARACTER SET utf8mb4,
  `RuleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_widgetbase`
--

LOCK TABLES `cms_widgetbase` WRITE;
/*!40000 ALTER TABLE `cms_widgetbase` DISABLE KEYS */;
INSERT INTO `cms_widgetbase` VALUES ('00f62c5acfe840e0bee3ca2979f0f025','图片右',NULL,9,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:13:55.010000','admin','ZKEASOFT','2016-06-29 14:13:22.937000',NULL,NULL,1,'~/images/template%20(6).png',1,NULL,NULL),('01b59004dd1e4f68afa98c9c80d86f4c','表单',NULL,1,NULL,'be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 17:59:05.133000','admin','ZKEASOFT','2017-10-15 18:20:39.980000',NULL,NULL,0,NULL,0,'{\"FormID\":\"5ed56d90ac154e73befa6fbc981ae3ae\",\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ActionType\":1}',NULL),('02dd343bb4f24322bcf3daf8ada7565d','留言箱',NULL,2,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:31.030000','admin','ZKEASOFT','2017-03-19 21:05:31.030000',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{\"ID\":\"02dd343bb4f24322bcf3daf8ada7565d\",\"WidgetName\":\"留言箱\",\"Position\":2,\"LayoutID\":null,\"PageID\":\"534e07f396b14b7584a833d270356cb7\",\"ZoneID\":\"d5f02570e4814439acc86a1874cb8f07\",\"IsTemplate\":false,\"Thumbnail\":null,\"IsSystem\":false,\"PartialView\":\"Widget.MessageBox\",\"AssemblyName\":\"Easy.CMS.Message\",\"ServiceTypeName\":\"Easy.CMS.Message.Service.MessageBoxWidgetService\",\"ViewModelTypeName\":\"Easy.CMS.Message.Models.MessageBoxWidget\",\"FormView\":null,\"StyleClass\":null,\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ExtendData\":null,\"ExtendFields\":[],\"Title\":null,\"Description\":null,\"Status\":null,\"CreateBy\":\"admin\",\"CreatebyName\":\"ZKEASOFT\",\"CreateDate\":\"2017-03-19T21:04:44.953\",\"LastUpdateBy\":\"admin\",\"LastUpdateByName\":\"ZKEASOFT\",\"LastUpdateDate\":\"2017-03-19T21:04:44.953\",\"ActionType\":1}',NULL),('062018a8e5cf48b4a0d90296e7f4e965','分隔符',NULL,2,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-11 10:01:58.757000','admin','ZKEASOFT','2016-03-11 10:01:58.757000',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),('09617f6142934daaadee6cfb9df6d66f','段落',NULL,4,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:53:07.263000','admin','ZKEASOFT','2016-03-24 10:49:44.100000',NULL,NULL,1,'~/images/template%20(2).png',1,NULL,NULL),('0f66ab8ff0df44e2b5e57fd8d8c5d8ff','文字三列',NULL,8,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:23:51.277000','admin','ZKEASOFT','2016-06-29 14:12:54.387000',NULL,NULL,1,'~/images/template (15).png',1,NULL,NULL),('1433264e95f545ab97e6a481fa3747ea','评论箱',NULL,2,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:36.467000','admin','ZKEASOFT','2017-12-03 17:11:36.467000',NULL,NULL,0,NULL,0,'{\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ActionType\":1}',NULL),('155c6511dd9c4cc1b3ccb27d5ad4b8ab','表单',NULL,1,NULL,'9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 18:20:42.213000','admin','ZKEASOFT','2017-10-15 18:20:42.213000',NULL,NULL,0,NULL,0,'{\"FormID\":\"5ed56d90ac154e73befa6fbc981ae3ae\",\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ActionType\":1}',NULL),('19350341920b4827bf2a4e458ad24a58','焦点图',NULL,1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-27 15:14:34.677000','admin','ZKEASOFT','2017-03-21 22:44:54.987000',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL),('1fb967867e3b440e86336bc5a51e8719','图例三（圆）',NULL,17,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:40:26.767000','admin','ZKEASOFT','2016-06-29 14:19:30.777000',NULL,NULL,1,'~/images/template%20(12).png',1,NULL,NULL),('2b3eb61307d24c50a6b3aaa75db3810e','图片左',NULL,11,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:06:17.637000','admin','ZKEASOFT','2016-06-29 14:14:54.330000',NULL,NULL,1,'~/images/template%20(5).png',1,NULL,NULL),('2b510992f0174e668ca53116434e065c','图片',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:15:37.333000','admin','ZKEASOFT','2017-10-15 18:00:21.587000',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),('3017aef0eabc451b81daebe6bae68857','图片',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.950000','admin','ZKEASOFT','2017-10-15 18:11:44.950000',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),('34567e55bacd40dbaf9794d5032dd26e','留言板',NULL,4,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.977000','admin','ZKEASOFT','2017-03-19 21:05:30.977000',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{\"FormView\":null,\"ExtendData\":null,\"Description\":null,\"Status\":null,\"CreateBy\":\"admin\",\"CreatebyName\":\"ZKEASOFT\",\"CreateDate\":\"2017-03-19T21:04:56.38\",\"LastUpdateBy\":\"admin\",\"LastUpdateByName\":\"ZKEASOFT\",\"LastUpdateDate\":\"2017-03-19T21:04:56.38\",\"ActionType\":1,\"ID\":\"34567e55bacd40dbaf9794d5032dd26e\",\"WidgetName\":\"留言板\",\"Position\":4,\"LayoutID\":null,\"PageID\":\"534e07f396b14b7584a833d270356cb7\",\"ZoneID\":\"d5f02570e4814439acc86a1874cb8f07\",\"IsTemplate\":false,\"Thumbnail\":null,\"IsSystem\":false,\"PartialView\":\"Widget.Message\",\"AssemblyName\":\"Easy.CMS.Message\",\"ServiceTypeName\":\"Easy.CMS.Message.Service.MessageWidgetService\",\"ViewModelTypeName\":\"Easy.CMS.Message.Models.MessageWidget\",\"StyleClass\":null,\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ExtendFields\":[],\"Title\":null}',NULL),('3466e616139645d2b1e1d9935d231922','产品类别','产品类别',1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.877000','admin','ZKEASOFT','2016-05-15 20:56:40.877000',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL),('357a58069e8047a289e10b920061d57d','分隔符',NULL,3,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.900000','admin','ZKEASOFT','2017-03-19 21:05:30.900000',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),('3aa8b53e7ad143ff818855a7abcb3fdd','文章内容',NULL,1,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.290000','admin','ZKEASOFT','2017-12-03 17:11:47.290000',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL),('3b8beb945c9f4c9390a6122d8b4788d5','分隔符',NULL,2,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.347000','admin','ZKEASOFT','2017-10-15 18:11:45.347000',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),('3e3783f4b7ca421488f2bf08d32fe2f0','分隔符',NULL,2,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.850000','admin','ZKEASOFT','2016-05-15 20:56:40.850000',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),('416c5402962b41548c83fabaa5492b42','文章列表',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:20:31.667000','admin','ZKEASOFT','2016-03-11 11:51:20.640000',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL),('41e075ab1b89453388494a539eec55b9','焦点图',NULL,1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.633000','admin','ZKEASOFT','2017-10-15 18:11:36.633000',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL),('43bb869688ee4752a3127dd19ccc6caa','图片',NULL,1,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:20.407000','admin','ZKEASOFT','2017-03-19 21:04:29.773000',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),('481574ebc98b4cdf9a07e3f20c1ab78d','图片左（圆）',NULL,12,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:48.870000','admin','ZKEASOFT','2016-06-29 14:15:23.317000',NULL,NULL,1,'~/images/template%20(7).png',1,NULL,NULL),('4d67b2d10f4a425586e3b1115f7f7072','分隔符',NULL,3,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:15.683000','admin','ZKEASOFT','2017-03-19 21:05:15.683000',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),('50f810582d28440eb3bdff9ee5b1ef24','图片左（平分）',NULL,13,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:36:23.247000','admin','ZKEASOFT','2016-06-29 14:16:05.733000',NULL,NULL,1,'~/images/template (17).png',1,NULL,NULL),('55b73e54fd054de4847960bdac350c6d','图例二（圆）',NULL,15,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:33:40.533000','admin','ZKEASOFT','2016-06-29 14:17:49.737000',NULL,NULL,1,'~/images/template%20(10).png',1,NULL,NULL),('56991d0ff59d4c1db27aff3a50fcb382','页头',NULL,2,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:51:35.577000','admin','ZKEASOFT','2016-06-29 14:10:19.703000',NULL,NULL,1,'~/images/template%20(1).png',1,NULL,NULL),('604b2461f7c545e28dbb21fb15def5c7','相关链接','相关链接',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:13:42.000000','admin','ZKEASOFT','2017-10-15 17:18:36.063000',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL),('62ca3b6b6ea644b4a64501021b02f13b','分隔符',NULL,2,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:16:08.137000','admin','ZKEASOFT','2017-10-15 18:00:21.613000',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),('6bb06e46293c46f084e83751a0832d36','产品列表',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.867000','admin','ZKEASOFT','2016-05-15 20:56:40.867000',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL),('6ee67036e78b4b498d932ab2d76757fb','导航',NULL,NULL,NULL,NULL,'ZONE-X','Widget.Navigation','ZKEACMS','ZKEACMS.Common.Service.NavigationWidgetService','ZKEACMS.Common.Models.NavigationWidget',NULL,'full','admin','ZKEASOFT','2018-05-21 23:44:21.393000','admin','ZKEASOFT','2018-05-21 23:46:00.573000',NULL,NULL,0,NULL,0,NULL,1),('7679a5060035444d85fe49dc3c02cada','图片',NULL,1,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.853000','admin','ZKEASOFT','2017-03-19 21:05:30.853000',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),('787d9ad849dd40d0905f22ae072d8507','产品内容',NULL,1,NULL,'a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:19.903000','admin','ZKEASOFT','2016-03-10 23:20:19.903000',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL),('7e7a1d5b8d644333a7b3341509fc960f','注册用户','注册用户',2,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.773000','admin','ZKEASOFT','2017-10-15 18:11:36.773000',NULL,NULL,0,NULL,0,NULL,NULL),('7f77f09c3fcd4d498a4aa3b1c9508d7d','注册用户','注册用户',2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 17:03:14.000000','admin','ZKEASOFT','2017-10-15 17:04:42.893000',NULL,NULL,0,NULL,0,NULL,NULL),('80f365c7991a49a0b04aa11006018814','网站管理','后台管理',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:09:22.000000','admin','ZKEASOFT','2017-10-15 17:03:50.207000',NULL,0,0,NULL,0,NULL,NULL),('88ab49212dee47bba878a52bec86f501','网站管理','后台管理',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.793000','admin','ZKEASOFT','2017-10-15 18:11:36.793000',NULL,0,0,NULL,0,NULL,NULL),('8c5b69f614b641c0a5f7a8e318de8df3','ZKEACMS 简介',NULL,3,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin',NULL,'2015-09-01 09:54:38.000000','admin','ZKEASOFT','2017-10-15 17:12:08.850000',NULL,0,0,NULL,0,NULL,NULL),('8cc061c2e2514ef9b85bbecdec3f84ab','分隔符',NULL,5,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:55:12.377000','admin','ZKEASOFT','2016-03-09 13:55:12.377000',NULL,NULL,1,'~/images/template%20(3).png',1,NULL,NULL),('8df64186d2fd4d63a9f9bb3b6e34cd2a','文章类别','文章类别',1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:21:20.527000','admin','ZKEASOFT','2016-05-15 21:04:35.783000',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL),('8ea46d2923ad4d62958c565b19bb172d','图片',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.857000','admin','ZKEASOFT','2016-05-15 20:56:40.857000',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),('942b4ac54f3e4dfca006172bf4122da4','留言板',NULL,4,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:56.380000','admin','ZKEASOFT','2017-03-19 21:04:56.380000',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{\"FormView\":null,\"ExtendData\":null,\"Description\":null,\"Status\":null,\"CreateBy\":null,\"CreatebyName\":null,\"CreateDate\":null,\"LastUpdateBy\":null,\"LastUpdateByName\":null,\"LastUpdateDate\":null,\"ActionType\":1,\"ID\":\"942b4ac54f3e4dfca006172bf4122da4\",\"WidgetName\":\"留言板\",\"Position\":1,\"LayoutID\":null,\"PageID\":\"1c93b61690ce49d7af8e1ea45ac58eb9\",\"ZoneID\":\"3ca302874c164b7b9691ca948300417b\",\"IsTemplate\":false,\"Thumbnail\":null,\"IsSystem\":false,\"PartialView\":\"Widget.Message\",\"AssemblyName\":\"Easy.CMS.Message\",\"ServiceTypeName\":\"Easy.CMS.Message.Service.MessageWidgetService\",\"ViewModelTypeName\":\"Easy.CMS.Message.Models.MessageWidget\",\"StyleClass\":null,\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ExtendFields\":null,\"Title\":null}',NULL),('94624262dc00460cbbc1e0f51711e712','产品内容',NULL,1,NULL,'4b889b430aa44517bbad38a57c745cc5','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.783000','admin','ZKEASOFT','2016-03-10 23:24:38.783000',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL),('a64ad266b3bd4e0eb4e2df09b550fe55','留言箱',NULL,2,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:44.953000','admin','ZKEASOFT','2017-03-19 21:04:44.953000',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{\"ID\":\"a64ad266b3bd4e0eb4e2df09b550fe55\",\"WidgetName\":\"留言箱\",\"Position\":1,\"LayoutID\":null,\"PageID\":\"1c93b61690ce49d7af8e1ea45ac58eb9\",\"ZoneID\":\"4cf5d05f2b954a7e8904713ad6781a61\",\"IsTemplate\":false,\"Thumbnail\":null,\"IsSystem\":false,\"PartialView\":\"Widget.MessageBox\",\"AssemblyName\":\"Easy.CMS.Message\",\"ServiceTypeName\":\"Easy.CMS.Message.Service.MessageBoxWidgetService\",\"ViewModelTypeName\":\"Easy.CMS.Message.Models.MessageBoxWidget\",\"FormView\":null,\"StyleClass\":null,\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ExtendData\":null,\"ExtendFields\":null,\"Title\":null,\"Description\":null,\"Status\":null,\"CreateBy\":null,\"CreatebyName\":null,\"CreateDate\":null,\"LastUpdateBy\":null,\"LastUpdateByName\":null,\"LastUpdateDate\":null,\"ActionType\":1}',NULL),('a686b84212f94b3b8315093b2e8b883d','版权申明',NULL,NULL,NULL,NULL,'ZONE-X','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,'footer','admin','ZKEASOFT','2018-05-21 23:44:55.063000','admin','ZKEASOFT','2018-05-21 23:44:55.063000',NULL,NULL,0,NULL,0,NULL,2),('b568ff7f4a894870adaf9afadf787bf9','图例二',NULL,14,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:20:29.887000','admin','ZKEASOFT','2016-06-29 14:16:58.140000',NULL,NULL,1,'~/images/template%20(9).png',1,NULL,NULL),('bb7dab4f077745ef8b5b425eaabb423c','巨幕',NULL,1,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:28:47.827000','admin','ZKEASOFT','2016-06-29 14:09:41.597000',NULL,NULL,1,'~/images/template (16).png',1,NULL,NULL),('c71d1f1c48944d6a9e232b6813261e04','评论箱',NULL,2,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.253000','admin','ZKEASOFT','2017-12-03 17:11:47.253000',NULL,NULL,0,NULL,0,'{\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ActionType\":1}',NULL),('ca9f8809636d448cbd4f3beb418465b3','文章列表',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.317000','admin','ZKEASOFT','2017-10-15 18:11:45.317000',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL),('cd21a7bf68b44f6e8d178b153288a26e','ZKEACMS 简介',NULL,3,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.807000','admin','ZKEASOFT','2017-10-15 18:11:36.807000',NULL,0,0,NULL,0,NULL,NULL),('de8d94fd51cb4e73b00518dbb2f134d3','文章类别','文章类别',1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.367000','admin','ZKEASOFT','2017-10-15 18:11:45.367000',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL),('e0783dbbcc564322a1f2e3ca2833dbd4','相关链接','相关链接',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.733000','admin','ZKEASOFT','2017-10-15 18:11:36.733000',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL),('e5ba6adb117440959757b98e4289430f','图片',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:31:24.887000','admin','ZKEASOFT','2016-03-27 15:16:41.790000',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),('e88916cc41b3465b9ae954bafac5f796','产品列表',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:21.907000','admin','ZKEASOFT','2016-03-10 23:31:03.770000',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL),('e8fd1019bab045e5927ec30abaaa1aba','文章内容',NULL,1,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:12.857000','admin','ZKEASOFT','2016-03-10 21:24:12.857000',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL),('eb7657f5bcbd4e98977a42950936e7ac','产品类别','产品类别',1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:28:35.323000','admin','ZKEASOFT','2016-05-15 20:56:37.497000',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL),('ed837392097f4e60b812bc57111dd762','图例三',NULL,16,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:36:24.463000','admin','ZKEASOFT','2016-06-29 14:18:22.983000',NULL,NULL,1,'~/images/template%20(11).png',1,NULL,NULL),('f41174cfa4d247f4974c47f4d2b000fd','文字二列',NULL,7,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:21:37.693000','admin','ZKEASOFT','2016-06-29 14:11:06.067000',NULL,NULL,1,'~/images/template (14).png',1,NULL,NULL),('f6de0d62d3974ee2bf2ded3fbbc82c2b','间距',NULL,6,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 14:00:46.400000','admin','ZKEASOFT','2016-03-09 14:08:21.673000',NULL,NULL,1,'~/images/template%20(4).png',1,NULL,NULL),('f6f11ba2fec844de883acf0a1fe3eb89','图片右（圆）',NULL,10,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:44.227000','admin','ZKEASOFT','2016-06-29 14:13:44.223000',NULL,NULL,1,'~/images/template%20(8).png',1,NULL,NULL),('fee7f4d7d7e641b0bfa74491a543d245','图片',NULL,3,NULL,NULL,NULL,'Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:14:46.133000','admin','ZKEASOFT','2016-03-09 21:14:46.133000',NULL,NULL,1,'~/images/template (13).png',1,NULL,NULL);
/*!40000 ALTER TABLE `cms_widgetbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_zone`
--

DROP TABLE IF EXISTS `cms_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_zone` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `LayoutId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PageId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ZoneName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4,
  `Status` int(11) DEFAULT NULL,
  `HeadingCode` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CMS_Zone_CMS_Layout` (`LayoutId`),
  CONSTRAINT `FK_CMS_Zone_CMS_Layout` FOREIGN KEY (`LayoutId`) REFERENCES `cms_layout` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_zone`
--

LOCK TABLES `cms_zone` WRITE;
/*!40000 ALTER TABLE `cms_zone` DISABLE KEYS */;
INSERT INTO `cms_zone` VALUES ('0338e740ea064e5a88d6223fd476506f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.650000','admin','ZKEASOFT','2018-05-21 23:45:46.650000',NULL,NULL,'ZONE-0'),('0387a1373f59466a91feb96bb69aadca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.987000','admin','ZKEASOFT','2018-05-21 23:46:12.987000',NULL,NULL,'ZONE-1'),('07384e5dc4f34a199d4ca73b3317b1f2','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.190000','admin','ZKEASOFT','2018-05-21 23:42:49.190000',NULL,NULL,'ZONE-0'),('095b8b8b28144248a2b0eff648e7fc48','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.930000','admin','ZKEASOFT','2018-05-21 23:45:21.930000',NULL,NULL,'ZONE-2'),('0c44eb9149b34ffaaa44d6976d11e1d8','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.307000','admin','ZKEASOFT','2018-05-21 23:46:19.307000',NULL,NULL,'ZONE-4'),('0e5c5a55882b4a34a77f3de1f0f36a4c','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.117000','admin','ZKEASOFT','2018-05-21 23:46:15.117000',NULL,NULL,'ZONE-2'),('1319756527364a5da511499b37a1eed5','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.973000','admin','ZKEASOFT','2018-05-21 23:42:39.973000',NULL,NULL,'ZONE-0'),('14a23e1671924f758113054ed008adec','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.727000','admin','ZKEASOFT','2018-05-21 23:46:28.727000',NULL,NULL,'ZONE-1'),('17ef6a804c524ed298492e404ad5576b','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.303000','admin','ZKEASOFT','2018-05-21 23:46:19.303000',NULL,NULL,'ZONE-0'),('18f2e25482b444ba8861238637861ba5','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.747000','admin','ZKEASOFT','2018-05-21 23:46:34.747000',NULL,NULL,'ZONE-1'),('19d3d679eaf74a21bf4f123487eaee0d','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193000','admin','ZKEASOFT','2018-05-21 23:42:49.193000',NULL,NULL,'ZONE-4'),('1c232c2d572f415082e74771e37e3580','0846a33e56bf45d5aae602ef40d87444',NULL,'底部',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893000','admin','ZKEASOFT','2017-11-19 17:48:10.637000',NULL,NULL,'ZONE-4'),('1cd27416b7db429bb639d8950cc29793','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.197000','admin','ZKEASOFT','2018-05-21 23:42:49.197000',NULL,NULL,'ZONE-1'),('23ec6afdd2ea49dd8fb5839ae2bec741','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.983000','admin','ZKEASOFT','2018-05-21 23:42:39.983000',NULL,NULL,'ZONE-4'),('25ce97efa1484065995e6e5aaade9a83','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.160000','admin','ZKEASOFT','2018-05-21 23:42:49.160000',NULL,NULL,'ZONE-3'),('2921f81e4531493694790faed3ed76e9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.310000','admin','ZKEASOFT','2018-05-21 23:46:19.310000',NULL,NULL,'ZONE-1'),('294c86a5d87a46d49f41999c495344ea','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.730000','admin','ZKEASOFT','2018-05-21 23:46:28.730000',NULL,NULL,'ZONE-3'),('2fd26e7c5a844bea8a2422d074d73109','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.330000','admin','ZKEASOFT','2018-05-21 23:45:43.330000',NULL,NULL,'ZONE-4'),('302009d870f74aa1b5b55dc6f1c6385f','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810000','admin','ZKEASOFT','2018-05-21 23:45:44.810000',NULL,NULL,'ZONE-2'),('34f9c91a64ee4986bec02073ea77035d','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.927000','admin','ZKEASOFT','2018-05-21 23:45:21.927000',NULL,NULL,'ZONE-0'),('360d6da3007e41d68c521c3154173c7a','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.783000','admin','ZKEASOFT','2018-05-21 23:45:45.783000',NULL,NULL,'ZONE-0'),('39af0cedd23a42d08c2c93e7b0dbaee0','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.357000','admin','ZKEASOFT','2018-05-21 23:46:09.357000',NULL,NULL,'ZONE-2'),('3b3f74427bf84da999406f98f7d8cdd7','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.690000','admin','ZKEASOFT','2018-05-21 23:45:46.690000',NULL,NULL,'ZONE-4'),('3ca302874c164b7b9691ca948300417b','1dae90cf6a8547538cc0c369b9943c01',NULL,'内容右',NULL,'admin',NULL,'2015-08-31 11:58:54.257000','admin','ZKEASOFT','2017-11-19 17:48:39.823000',NULL,NULL,'ZONE-3'),('3f166bd62afb4a888801ec561cbc15ef','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.987000','admin','ZKEASOFT','2018-05-21 23:42:39.987000',NULL,NULL,'ZONE-1'),('40a562598d3a44a98646519094631628','1dae90cf6a8547538cc0c369b9943c01',NULL,'顶部',NULL,'admin',NULL,'2015-08-31 11:58:54.253000','admin','ZKEASOFT','2017-11-19 17:48:39.840000',NULL,NULL,'ZONE-0'),('4cf5d05f2b954a7e8904713ad6781a61','1dae90cf6a8547538cc0c369b9943c01',NULL,'内容左',NULL,'admin',NULL,'2015-08-31 11:58:54.257000','admin','ZKEASOFT','2017-11-19 17:48:39.847000',NULL,NULL,'ZONE-2'),('572963d3322b4cddb7d94d6bec2f08c7','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.343000','admin','ZKEASOFT','2018-05-21 23:45:43.343000',NULL,NULL,'ZONE-0'),('57c4f0c9fb31439c913d0221c20a6343','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.113000','admin','ZKEASOFT','2018-05-21 23:46:15.113000',NULL,NULL,'ZONE-0'),('58f65b43d383423a9456102ea06450c1','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.740000','admin','ZKEASOFT','2018-05-21 23:46:34.740000',NULL,NULL,'ZONE-4'),('5d3fdb35e2c54313850c69c401548b4d','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.753000','admin','ZKEASOFT','2018-05-21 23:46:34.753000',NULL,NULL,'ZONE-0'),('5d84136b25ea4bd4a65779e0bb7acc3d','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.680000','admin','ZKEASOFT','2018-05-21 23:45:46.680000',NULL,NULL,'ZONE-2'),('6920822269c34d5781b7df72fa37df16','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.917000','admin','ZKEASOFT','2018-05-21 23:45:21.917000',NULL,NULL,'ZONE-4'),('6bba8443507f4273b2b61048f7c71f40','0846a33e56bf45d5aae602ef40d87444',NULL,'焦点',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.887000','admin','ZKEASOFT','2017-11-19 17:48:10.903000',NULL,NULL,'ZONE-1'),('7480ffc27b034c51aca983367316bb7c','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.353000','admin','ZKEASOFT','2018-05-21 23:46:09.353000',NULL,NULL,'ZONE-0'),('7577ca3b1628498c8f38b42545f3c1b3','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.120000','admin','ZKEASOFT','2018-05-21 23:46:15.120000',NULL,NULL,'ZONE-1'),('75be97a54a4b430ca6d26b8285bbce8d','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.347000','admin','ZKEASOFT','2018-05-21 23:45:43.347000',NULL,NULL,'ZONE-2'),('787c9336ef3341d4b63e710f16281424','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350000','admin','ZKEASOFT','2018-05-21 23:46:09.350000',NULL,NULL,'ZONE-3'),('7c1d057dff154fa0836ebe82b5f08b6b','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.787000','admin','ZKEASOFT','2018-05-21 23:45:45.787000',NULL,NULL,'ZONE-2'),('7fe7ceb43d734faca8a21e78185995d6','1dae90cf6a8547538cc0c369b9943c01',NULL,'底部',NULL,'admin',NULL,'2015-08-31 11:58:54.260000','admin','ZKEASOFT','2017-11-19 17:48:39.873000',NULL,NULL,'ZONE-4'),('82e28c8ca83c4a52847b2f759b4d1ab0','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.757000','admin','ZKEASOFT','2018-05-21 23:46:34.757000',NULL,NULL,'ZONE-2'),('85b6e66b7b3345e9a482af084da307d3','0846a33e56bf45d5aae602ef40d87444',NULL,'其它',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.890000','admin','ZKEASOFT','2017-11-19 17:48:10.963000',NULL,NULL,'ZONE-3'),('8b3a4cd737594c00a7e34c17c1bbc9fc','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.760000','admin','ZKEASOFT','2018-05-21 23:45:45.760000',NULL,NULL,'ZONE-4'),('8d4f87b76dfa4c96ae71734ef5ad08fd','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.657000','admin','ZKEASOFT','2018-05-21 23:45:47.657000',NULL,NULL,'ZONE-3'),('93ed2f72cef64bf891e0a1ef999c0ebc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.800000','admin','ZKEASOFT','2018-05-21 23:45:44.800000',NULL,NULL,'ZONE-3'),('9774034c2832414e9ccaa39b43685710','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.670000','admin','ZKEASOFT','2018-05-21 23:45:47.670000',NULL,NULL,'ZONE-2'),('9b5eab51ed78479f9a3b6cd88f30865c','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340000','admin','ZKEASOFT','2018-05-21 23:45:43.340000',NULL,NULL,'ZONE-3'),('9c39ce55ae2b46fbaab97287436b651f','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340000','admin','ZKEASOFT','2018-05-21 23:45:43.340000',NULL,NULL,'ZONE-1'),('9c87f7474bcf450a942838b42335a928','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993000','admin','ZKEASOFT','2018-05-21 23:46:12.993000',NULL,NULL,'ZONE-0'),('9ccbb73c31ba46caa173b1ff5208cd4e','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193000','admin','ZKEASOFT','2018-05-21 23:42:49.193000',NULL,NULL,'ZONE-2'),('a30b21857de2411982aa4f40e0fcba59','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993000','admin','ZKEASOFT','2018-05-21 23:46:12.993000',NULL,NULL,'ZONE-3'),('a4bd66363b6a4f2ea1d21ed601c69866','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.797000','admin','ZKEASOFT','2018-05-21 23:45:44.797000',NULL,NULL,'ZONE-1'),('a979c68e8f49405fa3c5cc21fafdb7b9','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.117000','admin','ZKEASOFT','2018-05-21 23:46:15.117000',NULL,NULL,'ZONE-4'),('aae6dbf58fff429d9a32627933854a8f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.693000','admin','ZKEASOFT','2018-05-21 23:45:46.693000',NULL,NULL,'ZONE-1'),('af49758840b345a6ab910d11a691fc99','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.667000','admin','ZKEASOFT','2018-05-21 23:45:47.667000',NULL,NULL,'ZONE-0'),('b0a92bfb56704f8aaf7dade22c3db2d2','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.977000','admin','ZKEASOFT','2018-05-21 23:42:39.977000',NULL,NULL,'ZONE-2'),('be7a1e6a999b4264aab2b5ac593909a8','0846a33e56bf45d5aae602ef40d87444',NULL,'顶部',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.527000','admin','ZKEASOFT','2017-11-19 17:48:10.967000',NULL,NULL,'ZONE-0'),('bed6101f906b4e50b3ba034bfe39d184','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.833000','admin','ZKEASOFT','2018-05-21 23:42:39.833000',NULL,NULL,'ZONE-3'),('c1f4cb36e7924ff99ff38aeb3983eca3','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.343000','admin','ZKEASOFT','2018-05-21 23:46:09.343000',NULL,NULL,'ZONE-4'),('c22c6484c2864c82932ec6ad0a20492a','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.923000','admin','ZKEASOFT','2018-05-21 23:45:21.923000',NULL,NULL,'ZONE-1'),('c291af01f0b443c3ad59b5b289d97e1f','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.307000','admin','ZKEASOFT','2018-05-21 23:46:19.307000',NULL,NULL,'ZONE-2'),('c7bcd0a9d172432bafbf9f5a986685f2','0846a33e56bf45d5aae602ef40d87444',NULL,'主内容',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893000','admin','ZKEASOFT','2017-11-19 17:48:10.967000',NULL,NULL,'ZONE-2'),('ca49f8b95d724a3bb1cc01a10ca72cb9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.297000','admin','ZKEASOFT','2018-05-21 23:46:19.297000',NULL,NULL,'ZONE-3'),('d5a2daad909b4ecfb02988584d8903ad','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.777000','admin','ZKEASOFT','2018-05-21 23:45:45.777000',NULL,NULL,'ZONE-3'),('d5f02570e4814439acc86a1874cb8f07','1dae90cf6a8547538cc0c369b9943c01',NULL,'主内容',NULL,'admin',NULL,'2015-08-31 11:58:54.257000','admin','ZKEASOFT','2017-11-19 17:48:39.887000',NULL,NULL,'ZONE-1'),('d79708e9937541c9833467ed6f31ebda','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.980000','admin','ZKEASOFT','2018-05-21 23:46:12.980000',NULL,NULL,'ZONE-4'),('db297e847b15465cb4ee5d46cd7ca168','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673000','admin','ZKEASOFT','2018-05-21 23:45:47.673000',NULL,NULL,'ZONE-1'),('de442cdec7044de895680750884b1eb4','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.773000','admin','ZKEASOFT','2018-05-21 23:45:45.773000',NULL,NULL,'ZONE-1'),('df2ff4bd579d4e6cb8855b196ba2c322','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810000','admin','ZKEASOFT','2018-05-21 23:45:44.810000',NULL,NULL,'ZONE-0'),('e333b823cf0e4d40a7999bc2787370b2','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.723000','admin','ZKEASOFT','2018-05-21 23:46:28.723000',NULL,NULL,'ZONE-4'),('e74560705e8c414bbb284cc95dc54d8a','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733000','admin','ZKEASOFT','2018-05-21 23:46:28.733000',NULL,NULL,'ZONE-2'),('ea3ca53e83924909bfab5e9242583a93','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.927000','admin','ZKEASOFT','2018-05-21 23:45:21.927000',NULL,NULL,'ZONE-3'),('ea5cdd077bf44e16b8fc4a22433d63ca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.997000','admin','ZKEASOFT','2018-05-21 23:46:12.997000',NULL,NULL,'ZONE-2'),('eaaf42be824141679c05866ad9a8acf2','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350000','admin','ZKEASOFT','2018-05-21 23:46:09.350000',NULL,NULL,'ZONE-1'),('ee21c0c23a834cfaae370413da4630cc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.780000','admin','ZKEASOFT','2018-05-21 23:45:44.780000',NULL,NULL,'ZONE-4'),('eeb31d7a5ee7485ea014708e14f66cac','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673000','admin','ZKEASOFT','2018-05-21 23:45:47.673000',NULL,NULL,'ZONE-4'),('f41ee7803dc6431bafb45ff035fca916','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.637000','admin','ZKEASOFT','2018-05-21 23:45:46.637000',NULL,NULL,'ZONE-3'),('f4f64f6755be449c8ccb6c5969749b19','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733000','admin','ZKEASOFT','2018-05-21 23:46:28.733000',NULL,NULL,'ZONE-0'),('f844832366834170a8c8caeb8c64b96b','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.107000','admin','ZKEASOFT','2018-05-21 23:46:15.107000',NULL,NULL,'ZONE-3'),('fb0f4ea5b0ed44289f665eec3b829ea2','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.750000','admin','ZKEASOFT','2018-05-21 23:46:34.750000',NULL,NULL,'ZONE-3');
/*!40000 ALTER TABLE `cms_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PagePath` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL,
  `UserId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Picture` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CommentContent` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Agrees` int(11) DEFAULT NULL,
  `Disagrees` int(11) DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataarchived`
--

DROP TABLE IF EXISTS `dataarchived`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataarchived` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Data` longtext CHARACTER SET utf8mb4,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataarchived`
--

LOCK TABLES `dataarchived` WRITE;
/*!40000 ALTER TABLE `dataarchived` DISABLE KEYS */;
INSERT INTO `dataarchived` VALUES ('ZKEACMS.Message.Models.MessageNotificationConfig','{\"MessageNotifyEmails\":null,\"CommentNotifyEmails\":null}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-08-15 15:25:53.917000','admin','ZKEASOFT','2018-08-15 15:25:53.917000'),('ZKEACMS.Shop.AliPayConfigOptions','{\"AppId\":\"2016082000296332\",\"Uid\":\"2088102172250345\",\"Gatewayurl\":\"https://openapi.alipaydev.com/gateway.do\",\"PrivateKey\":\"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP\",\"AlipayPublicKey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB\",\"SignType\":\"RSA2\",\"CharSet\":\"UTF-8\",\"IsKeyFromFile\":false}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-11 17:02:14.577000','admin','ZKEASOFT','2018-04-11 17:02:14.577000');
/*!40000 ALTER TABLE `dataarchived` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datadictionary`
--

DROP TABLE IF EXISTS `datadictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datadictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DicName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `DicValue` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `Pid` int(11) DEFAULT NULL,
  `IsSystem` tinyint(1) NOT NULL,
  `ImageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ImageThumbUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datadictionary`
--

LOCK TABLES `datadictionary` WRITE;
/*!40000 ALTER TABLE `datadictionary` DISABLE KEYS */;
INSERT INTO `datadictionary` VALUES (1,'RecordStatus','有效','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(2,'RecordStatus','无效','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(3,'ArticleCategory','新闻','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(4,'ArticleCategory','公司新闻','2',2,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(5,'ArticleCategory','行业新闻','3',3,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(6,'UserEntity@Sex','男','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(7,'UserEntity@Sex','女','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(8,'UserEntity@MaritalStatus','未婚','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(9,'UserEntity@MaritalStatus','已婚','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(11,'UserEntity@UserTypeCD','后台管理员','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(12,'ArticleTopWidget@PartialView','默认','Widget.ArticleTops',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(13,'ArticleListWidget@PartialView','默认','Widget.ArticleList',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(14,'ArticleListWidget@PartialView','横幅','Widget.ArticleList-Snippet',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(15,'ProductListWidget@PartialView','默认','Widget.ProductList',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(16,'ProductListWidget@Columns','3 列','col-xs-12 col-sm-6 col-md-4',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(17,'ProductListWidget@Columns','4 列','col-xs-12 col-sm-6 col-md-4 col-lg-3',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(18,'CarouselWidget@PartialView','默认','Widget.Carousel',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(19,'ArticleSummaryWidget@Style','默认','bs-callout-default',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(20,'ArticleSummaryWidget@Style','危险','bs-callout-danger',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(21,'ArticleSummaryWidget@Style','警告','bs-callout-warning',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(22,'ArticleSummaryWidget@Style','信息','bs-callout-info',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(23,'ArticleSummaryWidget@Style','成功','bs-callout-success',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(24,'ArticleSummaryWidget@PartialView','默认','Widget.ArticleSummary',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(25,'ProductCategoryWidget@PartialView','默认','Widget.ProductCategory',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(26,'ArticleTypeWidget@PartialView','默认','Widget.ArticleType',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(27,'UserEntity@UserTypeCD','前端用户','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(28,'Order@OrderStatus','未支付','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(29,'Order@OrderStatus','取消','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(30,'Order@OrderStatus','已支付','3',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(31,'Order@OrderStatus','已发货','4',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(32,'Order@OrderStatus','交易完成','5',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(33,'Order@OrderStatus','已退款','6',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(34,'Order@OrderStatus','退款中','7',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(35,'ProductListWidget@PartialView','列表','Widget.ProductList.A',2,0,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),(36,'RuleItem@Condition','并且','and',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(37,'RuleItem@Condition','或者','or',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(38,'RuleItem@FunctionName','等于','Equals',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(39,'RuleItem@FunctionName','不等于','NotEquals',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(40,'RuleItem@FunctionName','大于','GreaterThan',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(41,'RuleItem@FunctionName','大于等于','GreaterThanOrEquals',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(42,'RuleItem@FunctionName','小于','LessThan',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(43,'RuleItem@FunctionName','小于等于','LessThanOrEquals',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(44,'RuleItem@FunctionName','以…开头','StartsWith',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(45,'RuleItem@FunctionName','以...结尾','EndsWith',8,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(46,'RuleItem@FunctionName','不以…开头','NotStartsWith',9,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(47,'RuleItem@FunctionName','不以...结尾','NotEndsWith',10,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(48,'RuleItem@FunctionName','包含','Contains',11,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(49,'RuleItem@FunctionName','不包含','NotContains',12,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(50,'RuleItem@FunctionName','在...里','In',13,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(51,'RuleItem@FunctionName','不在...里','NotIn',14,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(52,'RuleItem@Property','Url','ValueOf(\'Url\')',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(53,'RuleItem@Property','Url参数','ValueOf(\'QueryString\')',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(54,'RuleItem@Property','User-Agent','ValueOf(\'UserAgent\')',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(55,'RuleItem@Property','当前日期','ValueOf(\'Now\')',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `datadictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extendfield`
--

DROP TABLE IF EXISTS `extendfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extendfield` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Value` longtext CHARACTER SET utf8mb4,
  `OwnerModule` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `OwnerID` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extendfield`
--

LOCK TABLES `extendfield` WRITE;
/*!40000 ALTER TABLE `extendfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `extendfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formdata`
--

DROP TABLE IF EXISTS `formdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formdata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `FormId` varchar(50) NOT NULL,
  `Status` int(11) DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formdata`
--

LOCK TABLES `formdata` WRITE;
/*!40000 ALTER TABLE `formdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `formdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formdataitem`
--

DROP TABLE IF EXISTS `formdataitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formdataitem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FormDataId` int(11) NOT NULL,
  `FieldId` varchar(50) DEFAULT NULL,
  `FieldText` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `FieldValue` longtext CHARACTER SET utf8mb4,
  `OptionValue` varchar(50) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formdataitem`
--

LOCK TABLES `formdataitem` WRITE;
/*!40000 ALTER TABLE `formdataitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `formdataitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `ID` varchar(50) NOT NULL,
  `Title` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `FieldsData` longtext CHARACTER SET utf8mb4,
  `NotificationReceiver` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES ('5ed56d90ac154e73befa6fbc981ae3ae','问卷调查','[{\"ID\":\"f05da60a6e3b448fadbf7c5c040a7d5c\",\"Name\":\"Label\",\"DisplayName\":\"一个简单的问卷调查\",\"Value\":null,\"Description\":\"欢迎您使用ZKEACMS，这是一个自定义表单\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"41481e6eefa048feae380460b0cd5661\",\"Name\":\"SingleLine\",\"DisplayName\":\"姓名\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-6\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"bfd1418684a64890a7099f764baa24b3\",\"Name\":\"Number\",\"DisplayName\":\"电话\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-6\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"7e635c8fdd124b6b94f037d3bf112bc0\",\"Name\":\"Email\",\"DisplayName\":\"邮箱地址\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"4d61bb5f733c47778975cc6cfbc84123\",\"Name\":\"SingleLine\",\"DisplayName\":\"QQ\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"b85aeb9beaf64f509726f16ba582ec3c\",\"Name\":\"SingleLine\",\"DisplayName\":\"微信\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"a2aea72c496e4a458265f7ceadb3653a\",\"Name\":\"Address\",\"DisplayName\":\"省份地址\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"0932ca1f1f7f4af098d51e4b1ac18b94\",\"Name\":\"SingleLine\",\"DisplayName\":\"详细地址\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"572c61930769464d97f3d31771ecf65e\",\"Name\":\"Radio\",\"DisplayName\":\"您从哪里了解到ZKEACMS\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"搜索引擎\",\"Value\":\"70a915caf7a84e9086d5dbdf26ed3053\"},{\"DisplayText\":\"博客园\",\"Value\":\"419a7d1d91974282af5c26688fbe0e8c\"},{\"DisplayText\":\"朋友介绍\",\"Value\":\"227f6d2f6b39479aaf2d5b79dbefdc5c\"},{\"DisplayText\":\"其它论坛\",\"Value\":\"ef50fb3bccf74d6487320e53781fb1ec\"}],\"AdditionalSettings\":null},{\"ID\":\"845830a5c8be4b81866a8cef83049899\",\"Name\":\"Checkbox\",\"DisplayName\":\"您一般使用ZKEACMS做什么\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"网站\",\"Value\":\"5f0fbb9faa0343e0958a896fe3cead4f\"},{\"DisplayText\":\"博客\",\"Value\":\"65902e51d35142019c4aab8badff9e35\"},{\"DisplayText\":\"其它\",\"Value\":\"944343b3ed904b94a9db6950dbdcccf3\"}],\"AdditionalSettings\":null},{\"ID\":\"2fe6e4baf01e4cb897986991c920df56\",\"Name\":\"Dropdown\",\"DisplayName\":\"您觉得ZKEACMS怎么样\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"很不错\",\"Value\":\"fc3929826e364318b7a3436d991fb097\"},{\"DisplayText\":\"还可以\",\"Value\":\"619e09c2864b41ae81f4f90e7cab92ba\"},{\"DisplayText\":\"有待提高\",\"Value\":\"fd1279a07150490f9a1f69c85298e22c\"},{\"DisplayText\":\"不怎么样\",\"Value\":\"ef19983754504a9482232dd6be01f34d\"}],\"AdditionalSettings\":null},{\"ID\":\"2868de2d8e9b4d269da891342e6dc95b\",\"Name\":\"Paragraph\",\"DisplayName\":\"您的意见或建议\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null}]',NULL,NULL,'',NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:07:58.013000');
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htmlwidget`
--

DROP TABLE IF EXISTS `htmlwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htmlwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `HTML` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_HtmlWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htmlwidget`
--

LOCK TABLES `htmlwidget` WRITE;
/*!40000 ALTER TABLE `htmlwidget` DISABLE KEYS */;
INSERT INTO `htmlwidget` VALUES ('062018a8e5cf48b4a0d90296e7f4e965','<hr />'),('09617f6142934daaadee6cfb9df6d66f','<p>这是文本段落，你可以在段里面加入标题，文字，图片，表格，列表，链接等等。例如：</p>\r\n<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>\r\n<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>\r\n<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>'),('357a58069e8047a289e10b920061d57d','<hr />'),('3b8beb945c9f4c9390a6122d8b4788d5','<hr />'),('3e3783f4b7ca421488f2bf08d32fe2f0','<hr />'),('4d67b2d10f4a425586e3b1115f7f7072','<hr />'),('50f810582d28440eb3bdff9ee5b1ef24','<div>\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\"><img src=\"/Images/28.jpg\" alt=\"\" /></div>\r\n<div class=\"col-sm-6\">\r\n<h3>为什么选择我们？</h3>\r\n<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>\r\n<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>\r\n<p>&nbsp;</p>\r\n<p><a class=\"btn btn-info\" href=\"#\">Read More</a></p>\r\n</div>\r\n</div>\r\n</div>'),('56991d0ff59d4c1db27aff3a50fcb382','<div class=\"page-header\">\r\n<h1>ZKEASOFT</h1>\r\n</div>\r\n<p>ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>'),('62ca3b6b6ea644b4a64501021b02f13b','<hr />'),('8cc061c2e2514ef9b85bbecdec3f84ab','<hr />'),('a686b84212f94b3b8315093b2e8b883d','<div id=\"footer\">ZKEACMS是开源软件，提供免费下载学习使用\r\n<p>Copyright @&nbsp;2015 ZKEASOFT. All Rights Reserved | <a href=\"http://www.zkea.net/\" target=\"_blank\" rel=\"noopener\">www.zkea.net</a></p>\r\n</div>'),('bb7dab4f077745ef8b5b425eaabb423c','<h1 style=\"text-align: center; font-size: 3em;\">ZKEASOFT</h1>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\">ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>\r\n<p style=\"text-align: center;\"><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a>是基于<a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>\r\n<p style=\"text-align: center;\">ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>\r\n<p style=\"text-align: center;\">ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>\r\n<p style=\"text-align: center;\">ZKEACMS采用插件式设计，支持扩展新插件。</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><a class=\"btn btn-info\" href=\"#\">Read More</a></p>'),('f6de0d62d3974ee2bf2ded3fbbc82c2b','<div class=\"space\">&nbsp;</div>');
/*!40000 ALTER TABLE `htmlwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagewidget`
--

DROP TABLE IF EXISTS `imagewidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagewidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ImageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `AltText` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Link` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_ImageWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagewidget`
--

LOCK TABLES `imagewidget` WRITE;
/*!40000 ALTER TABLE `imagewidget` DISABLE KEYS */;
INSERT INTO `imagewidget` VALUES ('2b510992f0174e668ca53116434e065c','~/images/bg4.jpg',NULL,NULL,NULL,NULL),('3017aef0eabc451b81daebe6bae68857','~/images/bg4.jpg',NULL,NULL,NULL,NULL),('43bb869688ee4752a3127dd19ccc6caa','http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg',NULL,NULL,NULL,NULL),('7679a5060035444d85fe49dc3c02cada','http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg',NULL,NULL,NULL,NULL),('8ea46d2923ad4d62958c565b19bb172d','~/images/bg3.jpg',NULL,NULL,NULL,NULL),('e5ba6adb117440959757b98e4289430f','~/images/bg3.jpg',NULL,NULL,NULL,NULL),('fee7f4d7d7e641b0bfa74491a543d245','~/images/30.jpg',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `imagewidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `LanKey` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `CultureName` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `LanValue` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Module` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LanType` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`LanKey`,`CultureName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES ('AlipayOptions@AppId','zh-CN','AppId','AlipayOptions','EntityProperty'),('AlipayOptions@IsKeyFromFile','zh-CN','IsKeyFromFile','AlipayOptions','EntityProperty'),('AlipayOptions@SignType','zh-CN','SignType','AlipayOptions','EntityProperty'),('ApplicationSetting@ActionType','zh-CN','ActionType','ApplicationSetting','EntityProperty'),('ApplicationSetting@CreateBy','zh-CN','CreateBy','ApplicationSetting','EntityProperty'),('ApplicationSetting@CreatebyName','zh-CN','创建人','ApplicationSetting','EntityProperty'),('ApplicationSetting@CreateDate','zh-CN','创建日期','ApplicationSetting','EntityProperty'),('ApplicationSetting@Description','zh-CN','描述','ApplicationSetting','EntityProperty'),('ApplicationSetting@LastUpdateBy','zh-CN','LastUpdateBy','ApplicationSetting','EntityProperty'),('ApplicationSetting@LastUpdateByName','zh-CN','更新人','ApplicationSetting','EntityProperty'),('ApplicationSetting@LastUpdateDate','zh-CN','更新日期','ApplicationSetting','EntityProperty'),('ApplicationSetting@SettingKey','zh-CN','键','ApplicationSetting','EntityProperty'),('ApplicationSetting@Status','zh-CN','状态','ApplicationSetting','EntityProperty'),('ApplicationSetting@Title','zh-CN','标题','ApplicationSetting','EntityProperty'),('ApplicationSetting@Value','zh-CN','值','ApplicationSetting','EntityProperty'),('ArticleDetailWidget@ActionType','zh-CN','ActionType','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@AssemblyName','zh-CN','AssemblyName','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@CreateBy','zh-CN','CreateBy','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@CreatebyName','zh-CN','创建人','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@CreateDate','zh-CN','创建日期','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@CustomClass','zh-CN','CustomClass','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@CustomerClass','zh-CN','CustomerClass','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@CustomStyle','zh-CN','CustomStyle','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@Description','zh-CN','描述','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@ExtendData','zh-CN','ExtendData','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@ExtendFields','zh-CN','扩展属性','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@FormView','zh-CN','FormView','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@ID','zh-CN','ID','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@IsSystem','zh-CN','IsSystem','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@IsTemplate','zh-CN','保存为模板','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@LastUpdateByName','zh-CN','更新人','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@LastUpdateDate','zh-CN','更新日期','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@LayoutID','zh-CN','LayoutID','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@PageID','zh-CN','PageID','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@PartialView','zh-CN','显示模板','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@Position','zh-CN','排序','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@Status','zh-CN','状态','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@StyleClass','zh-CN','自定义样式','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@Thumbnail','zh-CN','模板缩略图','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@Title','zh-CN','标题','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@WidgetName','zh-CN','组件名称','ArticleDetailWidget','EntityProperty'),('ArticleDetailWidget@ZoneID','zh-CN','区域','ArticleDetailWidget','EntityProperty'),('ArticleEntity@ActionType','zh-CN','ActionType','ArticleEntity','EntityProperty'),('ArticleEntity@ArticleContent','zh-CN','文章内容','ArticleEntity','EntityProperty'),('ArticleEntity@ArticleTypeID','zh-CN','文章类别','ArticleEntity','EntityProperty'),('ArticleEntity@Counter','zh-CN','阅读次数','ArticleEntity','EntityProperty'),('ArticleEntity@CreateBy','zh-CN','CreateBy','ArticleEntity','EntityProperty'),('ArticleEntity@CreatebyName','zh-CN','创建人','ArticleEntity','EntityProperty'),('ArticleEntity@CreateDate','zh-CN','创建日期','ArticleEntity','EntityProperty'),('ArticleEntity@Description','zh-CN','描述','ArticleEntity','EntityProperty'),('ArticleEntity@ExtendFields','zh-CN','扩展属性','ArticleEntity','EntityProperty'),('ArticleEntity@ID','zh-CN','ID','ArticleEntity','EntityProperty'),('ArticleEntity@ImageThumbUrl','zh-CN','缩略图','ArticleEntity','EntityProperty'),('ArticleEntity@ImageUrl','zh-CN','图片','ArticleEntity','EntityProperty'),('ArticleEntity@IsPublish','zh-CN','已发布?','ArticleEntity','EntityProperty'),('ArticleEntity@LastUpdateBy','zh-CN','LastUpdateBy','ArticleEntity','EntityProperty'),('ArticleEntity@LastUpdateByName','zh-CN','更新人','ArticleEntity','EntityProperty'),('ArticleEntity@LastUpdateDate','zh-CN','更新日期','ArticleEntity','EntityProperty'),('ArticleEntity@MetaDescription','zh-CN','SEO描述','ArticleEntity','EntityProperty'),('ArticleEntity@MetaKeyWords','zh-CN','SEO关键字','ArticleEntity','EntityProperty'),('ArticleEntity@PublishDate','zh-CN','发布日期','ArticleEntity','EntityProperty'),('ArticleEntity@ReturnUrl','zh-CN','ReturnUrl','ArticleEntity','EntityProperty'),('ArticleEntity@Status','zh-CN','状态','ArticleEntity','EntityProperty'),('ArticleEntity@Summary','zh-CN','概述','ArticleEntity','EntityProperty'),('ArticleEntity@Title','zh-CN','标题','ArticleEntity','EntityProperty'),('ArticleEntity@Url','zh-CN','Url','ArticleEntity','EntityProperty'),('ArticleListWidget@ActionType','zh-CN','ActionType','ArticleListWidget','EntityProperty'),('ArticleListWidget@ArticleCategoryID','zh-CN','ArticleCategoryID','ArticleListWidget','EntityProperty'),('ArticleListWidget@ArticleTypeID','zh-CN','文章类别','ArticleListWidget','EntityProperty'),('ArticleListWidget@AssemblyName','zh-CN','AssemblyName','ArticleListWidget','EntityProperty'),('ArticleListWidget@CreateBy','zh-CN','CreateBy','ArticleListWidget','EntityProperty'),('ArticleListWidget@CreatebyName','zh-CN','创建人','ArticleListWidget','EntityProperty'),('ArticleListWidget@CreateDate','zh-CN','创建日期','ArticleListWidget','EntityProperty'),('ArticleListWidget@CustomClass','zh-CN','CustomClass','ArticleListWidget','EntityProperty'),('ArticleListWidget@CustomStyle','zh-CN','CustomStyle','ArticleListWidget','EntityProperty'),('ArticleListWidget@Description','zh-CN','描述','ArticleListWidget','EntityProperty'),('ArticleListWidget@DetailPageUrl','zh-CN','详细页面','ArticleListWidget','EntityProperty'),('ArticleListWidget@ExtendData','zh-CN','ExtendData','ArticleListWidget','EntityProperty'),('ArticleListWidget@ExtendFields','zh-CN','扩展属性','ArticleListWidget','EntityProperty'),('ArticleListWidget@FormView','zh-CN','FormView','ArticleListWidget','EntityProperty'),('ArticleListWidget@ID','zh-CN','ID','ArticleListWidget','EntityProperty'),('ArticleListWidget@IsPageable','zh-CN','分页?','ArticleListWidget','EntityProperty'),('ArticleListWidget@IsSystem','zh-CN','IsSystem','ArticleListWidget','EntityProperty'),('ArticleListWidget@IsTemplate','zh-CN','保存为模板','ArticleListWidget','EntityProperty'),('ArticleListWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleListWidget','EntityProperty'),('ArticleListWidget@LastUpdateByName','zh-CN','更新人','ArticleListWidget','EntityProperty'),('ArticleListWidget@LastUpdateDate','zh-CN','更新日期','ArticleListWidget','EntityProperty'),('ArticleListWidget@LayoutID','zh-CN','LayoutID','ArticleListWidget','EntityProperty'),('ArticleListWidget@PageID','zh-CN','PageID','ArticleListWidget','EntityProperty'),('ArticleListWidget@PageSize','zh-CN','分页大小','ArticleListWidget','EntityProperty'),('ArticleListWidget@PartialView','zh-CN','显示模板','ArticleListWidget','EntityProperty'),('ArticleListWidget@Position','zh-CN','排序','ArticleListWidget','EntityProperty'),('ArticleListWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleListWidget','EntityProperty'),('ArticleListWidget@Status','zh-CN','状态','ArticleListWidget','EntityProperty'),('ArticleListWidget@StyleClass','zh-CN','自定义样式','ArticleListWidget','EntityProperty'),('ArticleListWidget@Thumbnail','zh-CN','模板缩略图','ArticleListWidget','EntityProperty'),('ArticleListWidget@Title','zh-CN','标题','ArticleListWidget','EntityProperty'),('ArticleListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleListWidget','EntityProperty'),('ArticleListWidget@WidgetName','zh-CN','组件名称','ArticleListWidget','EntityProperty'),('ArticleListWidget@ZoneID','zh-CN','区域','ArticleListWidget','EntityProperty'),('ArticleSummaryWidget@ActionType','zh-CN','ActionType','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@AssemblyName','zh-CN','AssemblyName','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@CreateBy','zh-CN','CreateBy','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@CreatebyName','zh-CN','创建人','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@CreateDate','zh-CN','创建日期','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@CustomClass','zh-CN','CustomClass','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@CustomStyle','zh-CN','CustomStyle','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@Description','zh-CN','描述','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@DetailLink','zh-CN','详细页面','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@ExtendData','zh-CN','ExtendData','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@ExtendFields','zh-CN','扩展属性','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@FormView','zh-CN','FormView','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@ID','zh-CN','ID','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@IsSystem','zh-CN','IsSystem','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@IsTemplate','zh-CN','保存为模板','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@LastUpdateByName','zh-CN','更新人','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@LastUpdateDate','zh-CN','更新日期','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@LayoutID','zh-CN','布局','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@PageID','zh-CN','页面','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@PartDriver','zh-CN','PartDriver','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@PartialView','zh-CN','显示模板','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@Position','zh-CN','排序','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@Status','zh-CN','状态','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@Style','zh-CN','样式','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@StyleClass','zh-CN','自定义样式','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@SubTitle','zh-CN','子标题','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@Summary','zh-CN','概述','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@Thumbnail','zh-CN','模板缩略图','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@Title','zh-CN','标题','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@WidgetName','zh-CN','组件名称','ArticleSummaryWidget','EntityProperty'),('ArticleSummaryWidget@ZoneID','zh-CN','区域','ArticleSummaryWidget','EntityProperty'),('ArticleTopWidget@ActionType','zh-CN','ActionType','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@ArticleTypeID','zh-CN','文章类别','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@AssemblyName','zh-CN','AssemblyName','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@CreateBy','zh-CN','CreateBy','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@CreatebyName','zh-CN','创建人','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@CreateDate','zh-CN','创建日期','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@CustomClass','zh-CN','CustomClass','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@CustomStyle','zh-CN','CustomStyle','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@Description','zh-CN','描述','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@DetailPageUrl','zh-CN','详细页面','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@ExtendData','zh-CN','ExtendData','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@ExtendFields','zh-CN','扩展属性','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@FormView','zh-CN','FormView','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@ID','zh-CN','ID','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@IsSystem','zh-CN','IsSystem','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@IsTemplate','zh-CN','保存为模板','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@LastUpdateByName','zh-CN','更新人','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@LastUpdateDate','zh-CN','更新日期','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@LayoutID','zh-CN','LayoutID','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@MoreLink','zh-CN','更多页面','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@PageID','zh-CN','PageID','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@PartDriver','zh-CN','PartDriver','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@PartialView','zh-CN','显示模板','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@Position','zh-CN','排序','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@Status','zh-CN','状态','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@StyleClass','zh-CN','自定义样式','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@SubTitle','zh-CN','子标题','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@Thumbnail','zh-CN','模板缩略图','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@Title','zh-CN','标题','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@Tops','zh-CN','置顶数','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@WidgetName','zh-CN','组件名称','ArticleTopWidget','EntityProperty'),('ArticleTopWidget@ZoneID','zh-CN','区域','ArticleTopWidget','EntityProperty'),('ArticleType@ActionType','zh-CN','ActionType','ArticleType','EntityProperty'),('ArticleType@CreateBy','zh-CN','CreateBy','ArticleType','EntityProperty'),('ArticleType@CreatebyName','zh-CN','创建人','ArticleType','EntityProperty'),('ArticleType@CreateDate','zh-CN','创建日期','ArticleType','EntityProperty'),('ArticleType@Description','zh-CN','描述','ArticleType','EntityProperty'),('ArticleType@ID','zh-CN','ID','ArticleType','EntityProperty'),('ArticleType@LastUpdateBy','zh-CN','LastUpdateBy','ArticleType','EntityProperty'),('ArticleType@LastUpdateByName','zh-CN','更新人','ArticleType','EntityProperty'),('ArticleType@LastUpdateDate','zh-CN','更新日期','ArticleType','EntityProperty'),('ArticleType@ParentID','zh-CN','ParentID','ArticleType','EntityProperty'),('ArticleType@Status','zh-CN','状态','ArticleType','EntityProperty'),('ArticleType@Title','zh-CN','标题','ArticleType','EntityProperty'),('ArticleType@Url','zh-CN','Url','ArticleType','EntityProperty'),('ArticleTypeWidget@ActionType','zh-CN','ActionType','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@ArticleTypeID','zh-CN','文章类别','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@AssemblyName','zh-CN','AssemblyName','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@CreateBy','zh-CN','CreateBy','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@CreatebyName','zh-CN','创建人','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@CreateDate','zh-CN','创建日期','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@CustomClass','zh-CN','CustomClass','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@CustomStyle','zh-CN','CustomStyle','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@Description','zh-CN','描述','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@ExtendFields','zh-CN','扩展属性','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@FormView','zh-CN','FormView','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@ID','zh-CN','ID','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@IsSystem','zh-CN','IsSystem','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@IsTemplate','zh-CN','保存为模板','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@LastUpdateByName','zh-CN','更新人','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@LastUpdateDate','zh-CN','更新日期','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@LayoutID','zh-CN','LayoutID','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@PageID','zh-CN','PageID','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@PartialView','zh-CN','显示模板','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@Position','zh-CN','排序','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@Status','zh-CN','状态','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@StyleClass','zh-CN','自定义样式','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@TargetPage','zh-CN','详细页面','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@Thumbnail','zh-CN','模板缩略图','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@Title','zh-CN','标题','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@WidgetName','zh-CN','组件名称','ArticleTypeWidget','EntityProperty'),('ArticleTypeWidget@ZoneID','zh-CN','区域','ArticleTypeWidget','EntityProperty'),('BreadcrumbWidget@ActionType','zh-CN','ActionType','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@AssemblyName','zh-CN','AssemblyName','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@CreateBy','zh-CN','CreateBy','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@CreatebyName','zh-CN','创建人','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@CreateDate','zh-CN','创建日期','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@CustomClass','zh-CN','CustomClass','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@CustomStyle','zh-CN','CustomStyle','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@Description','zh-CN','描述','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@ExtendData','zh-CN','ExtendData','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@ExtendFields','zh-CN','扩展属性','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@FormView','zh-CN','FormView','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@ID','zh-CN','ID','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@IsLinkAble','zh-CN','IsLinkAble','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@IsSystem','zh-CN','IsSystem','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@IsTemplate','zh-CN','保存为模板','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@LastUpdateBy','zh-CN','LastUpdateBy','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@LastUpdateByName','zh-CN','更新人','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@LastUpdateDate','zh-CN','更新日期','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@LayoutID','zh-CN','布局','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@PageID','zh-CN','页面','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@PartialView','zh-CN','显示模板','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@Position','zh-CN','排序','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@ServiceTypeName','zh-CN','ServiceTypeName','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@Status','zh-CN','状态','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@StyleClass','zh-CN','自定义样式','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@Thumbnail','zh-CN','模板缩略图','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@Title','zh-CN','标题','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@WidgetName','zh-CN','组件名称','BreadcrumbWidget','EntityProperty'),('BreadcrumbWidget@ZoneID','zh-CN','区域','BreadcrumbWidget','EntityProperty'),('CarouselEntity@ActionType','zh-CN','ActionType','CarouselEntity','EntityProperty'),('CarouselEntity@CarouselItems','zh-CN','滚动图','CarouselEntity','EntityProperty'),('CarouselEntity@CreateBy','zh-CN','CreateBy','CarouselEntity','EntityProperty'),('CarouselEntity@CreatebyName','zh-CN','创建人','CarouselEntity','EntityProperty'),('CarouselEntity@CreateDate','zh-CN','创建日期','CarouselEntity','EntityProperty'),('CarouselEntity@Description','zh-CN','描述','CarouselEntity','EntityProperty'),('CarouselEntity@Height','zh-CN','高度(px)','CarouselEntity','EntityProperty'),('CarouselEntity@ID','zh-CN','ID','CarouselEntity','EntityProperty'),('CarouselEntity@LastUpdateBy','zh-CN','LastUpdateBy','CarouselEntity','EntityProperty'),('CarouselEntity@LastUpdateByName','zh-CN','更新人','CarouselEntity','EntityProperty'),('CarouselEntity@LastUpdateDate','zh-CN','更新日期','CarouselEntity','EntityProperty'),('CarouselEntity@Status','zh-CN','状态','CarouselEntity','EntityProperty'),('CarouselEntity@Title','zh-CN','标题','CarouselEntity','EntityProperty'),('CarouselItemEntity@ActionType','zh-CN','ActionType','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@CarouselID','zh-CN','焦点图','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@CarouselWidgetID','zh-CN','CarouselWidgetID','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@CreateBy','zh-CN','CreateBy','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@CreatebyName','zh-CN','创建人','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@CreateDate','zh-CN','创建日期','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@Description','zh-CN','描述','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@ID','zh-CN','ID','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@ImageUrl','zh-CN','图片','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@LastUpdateBy','zh-CN','LastUpdateBy','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@LastUpdateByName','zh-CN','更新人','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@LastUpdateDate','zh-CN','更新日期','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@Status','zh-CN','状态','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@TargetLink','zh-CN','链接','CarouselItemEntity','EntityProperty'),('CarouselItemEntity@Title','zh-CN','标题','CarouselItemEntity','EntityProperty'),('CarouselWidget@ActionType','zh-CN','ActionType','CarouselWidget','EntityProperty'),('CarouselWidget@AssemblyName','zh-CN','AssemblyName','CarouselWidget','EntityProperty'),('CarouselWidget@CarouselID','zh-CN','共享焦点图','CarouselWidget','EntityProperty'),('CarouselWidget@CarouselItems','zh-CN','滚动图','CarouselWidget','EntityProperty'),('CarouselWidget@CreateBy','zh-CN','CreateBy','CarouselWidget','EntityProperty'),('CarouselWidget@CreatebyName','zh-CN','创建人','CarouselWidget','EntityProperty'),('CarouselWidget@CreateDate','zh-CN','创建日期','CarouselWidget','EntityProperty'),('CarouselWidget@CustomClass','zh-CN','CustomClass','CarouselWidget','EntityProperty'),('CarouselWidget@CustomStyle','zh-CN','CustomStyle','CarouselWidget','EntityProperty'),('CarouselWidget@Description','zh-CN','描述','CarouselWidget','EntityProperty'),('CarouselWidget@ExtendFields','zh-CN','扩展属性','CarouselWidget','EntityProperty'),('CarouselWidget@FormView','zh-CN','FormView','CarouselWidget','EntityProperty'),('CarouselWidget@ID','zh-CN','ID','CarouselWidget','EntityProperty'),('CarouselWidget@IsSystem','zh-CN','IsSystem','CarouselWidget','EntityProperty'),('CarouselWidget@IsTemplate','zh-CN','保存为模板','CarouselWidget','EntityProperty'),('CarouselWidget@LastUpdateBy','zh-CN','LastUpdateBy','CarouselWidget','EntityProperty'),('CarouselWidget@LastUpdateByName','zh-CN','更新人','CarouselWidget','EntityProperty'),('CarouselWidget@LastUpdateDate','zh-CN','更新日期','CarouselWidget','EntityProperty'),('CarouselWidget@LayoutID','zh-CN','LayoutID','CarouselWidget','EntityProperty'),('CarouselWidget@PageID','zh-CN','PageID','CarouselWidget','EntityProperty'),('CarouselWidget@PartialView','zh-CN','显示模板','CarouselWidget','EntityProperty'),('CarouselWidget@Position','zh-CN','排序','CarouselWidget','EntityProperty'),('CarouselWidget@ServiceTypeName','zh-CN','ServiceTypeName','CarouselWidget','EntityProperty'),('CarouselWidget@Status','zh-CN','状态','CarouselWidget','EntityProperty'),('CarouselWidget@StyleClass','zh-CN','自定义样式','CarouselWidget','EntityProperty'),('CarouselWidget@Thumbnail','zh-CN','模板缩略图','CarouselWidget','EntityProperty'),('CarouselWidget@Title','zh-CN','标题','CarouselWidget','EntityProperty'),('CarouselWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CarouselWidget','EntityProperty'),('CarouselWidget@WidgetName','zh-CN','组件名称','CarouselWidget','EntityProperty'),('CarouselWidget@ZoneID','zh-CN','区域','CarouselWidget','EntityProperty'),('Comments@ActionType','zh-CN','ActionType','Comments','EntityProperty'),('Comments@Agrees','zh-CN','赞同数','Comments','EntityProperty'),('Comments@CommentContent','zh-CN','评论内容','Comments','EntityProperty'),('Comments@CreateBy','zh-CN','CreateBy','Comments','EntityProperty'),('Comments@CreatebyName','zh-CN','创建人','Comments','EntityProperty'),('Comments@CreateDate','zh-CN','创建日期','Comments','EntityProperty'),('Comments@Description','zh-CN','描述','Comments','EntityProperty'),('Comments@Disagrees','zh-CN','反对数','Comments','EntityProperty'),('Comments@ID','zh-CN','ID','Comments','EntityProperty'),('Comments@LastUpdateBy','zh-CN','LastUpdateBy','Comments','EntityProperty'),('Comments@LastUpdateByName','zh-CN','更新人','Comments','EntityProperty'),('Comments@LastUpdateDate','zh-CN','更新日期','Comments','EntityProperty'),('Comments@PagePath','zh-CN','页面地址','Comments','EntityProperty'),('Comments@Picture','zh-CN','Picture','Comments','EntityProperty'),('Comments@Status','zh-CN','状态','Comments','EntityProperty'),('Comments@Title','zh-CN','标题','Comments','EntityProperty'),('Comments@UserId','zh-CN','登录名','Comments','EntityProperty'),('Comments@UserName','zh-CN','用户名','Comments','EntityProperty'),('CommentsWidget@ActionType','zh-CN','ActionType','CommentsWidget','EntityProperty'),('CommentsWidget@AssemblyName','zh-CN','AssemblyName','CommentsWidget','EntityProperty'),('CommentsWidget@CreateBy','zh-CN','CreateBy','CommentsWidget','EntityProperty'),('CommentsWidget@CreatebyName','zh-CN','创建人','CommentsWidget','EntityProperty'),('CommentsWidget@CreateDate','zh-CN','创建日期','CommentsWidget','EntityProperty'),('CommentsWidget@CustomClass','zh-CN','CustomClass','CommentsWidget','EntityProperty'),('CommentsWidget@CustomStyle','zh-CN','CustomStyle','CommentsWidget','EntityProperty'),('CommentsWidget@Description','zh-CN','描述','CommentsWidget','EntityProperty'),('CommentsWidget@ExtendData','zh-CN','ExtendData','CommentsWidget','EntityProperty'),('CommentsWidget@FormView','zh-CN','FormView','CommentsWidget','EntityProperty'),('CommentsWidget@ID','zh-CN','ID','CommentsWidget','EntityProperty'),('CommentsWidget@IsSystem','zh-CN','IsSystem','CommentsWidget','EntityProperty'),('CommentsWidget@IsTemplate','zh-CN','保存为模板','CommentsWidget','EntityProperty'),('CommentsWidget@LastUpdateBy','zh-CN','LastUpdateBy','CommentsWidget','EntityProperty'),('CommentsWidget@LastUpdateByName','zh-CN','更新人','CommentsWidget','EntityProperty'),('CommentsWidget@LastUpdateDate','zh-CN','更新日期','CommentsWidget','EntityProperty'),('CommentsWidget@LayoutID','zh-CN','LayoutID','CommentsWidget','EntityProperty'),('CommentsWidget@PageID','zh-CN','PageID','CommentsWidget','EntityProperty'),('CommentsWidget@PartialView','zh-CN','显示模板','CommentsWidget','EntityProperty'),('CommentsWidget@Position','zh-CN','排序','CommentsWidget','EntityProperty'),('CommentsWidget@ServiceTypeName','zh-CN','ServiceTypeName','CommentsWidget','EntityProperty'),('CommentsWidget@Status','zh-CN','状态','CommentsWidget','EntityProperty'),('CommentsWidget@StyleClass','zh-CN','自定义样式','CommentsWidget','EntityProperty'),('CommentsWidget@Thumbnail','zh-CN','模板缩略图','CommentsWidget','EntityProperty'),('CommentsWidget@Title','zh-CN','标题','CommentsWidget','EntityProperty'),('CommentsWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CommentsWidget','EntityProperty'),('CommentsWidget@WidgetName','zh-CN','组件名称','CommentsWidget','EntityProperty'),('CommentsWidget@ZoneID','zh-CN','区域','CommentsWidget','EntityProperty'),('DataDictionaryEntity@CreateBy','zh-CN','CreateBy','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@CreatebyName','zh-CN','创建人','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@CreateDate','zh-CN','创建日期','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@Description','zh-CN','描述','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@DicName','zh-CN','DicName','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@DicValue','zh-CN','DicValue','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@ID','zh-CN','ID','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@ImageThumbUrl','zh-CN','缩略图','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@ImageUrl','zh-CN','图片','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@IsSystem','zh-CN','IsSystem','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@LastUpdateBy','zh-CN','LastUpdateBy','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@LastUpdateByName','zh-CN','更新人','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@LastUpdateDate','zh-CN','更新日期','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@Order','zh-CN','排序','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@Pid','zh-CN','Pid','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@Status','zh-CN','状态','DataDictionaryEntity','EntityProperty'),('DataDictionaryEntity@Title','zh-CN','标题','DataDictionaryEntity','EntityProperty'),('ExtendFieldEntity@ActionType','zh-CN','ActionType','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@CreateBy','zh-CN','CreateBy','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@CreatebyName','zh-CN','创建人','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@CreateDate','zh-CN','创建日期','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@Description','zh-CN','描述','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@ID','zh-CN','ID','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@LastUpdateBy','zh-CN','LastUpdateBy','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@LastUpdateByName','zh-CN','更新人','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@LastUpdateDate','zh-CN','更新日期','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@OwnerID','zh-CN','OwnerID','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@OwnerModule','zh-CN','OwnerModule','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@Status','zh-CN','状态','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@Title','zh-CN','名称','ExtendFieldEntity','EntityProperty'),('ExtendFieldEntity@Value','zh-CN','值','ExtendFieldEntity','EntityProperty'),('Form@ActionType','zh-CN','ActionType','Form','EntityProperty'),('Form@CreateBy','zh-CN','CreateBy','Form','EntityProperty'),('Form@CreatebyName','zh-CN','创建人','Form','EntityProperty'),('Form@CreateDate','zh-CN','创建日期','Form','EntityProperty'),('Form@Description','zh-CN','描述','Form','EntityProperty'),('Form@FieldsData','zh-CN','FieldsData','Form','EntityProperty'),('Form@FormFields','zh-CN','FormFields','Form','EntityProperty'),('Form@ID','zh-CN','ID','Form','EntityProperty'),('Form@LastUpdateBy','zh-CN','LastUpdateBy','Form','EntityProperty'),('Form@LastUpdateByName','zh-CN','更新人','Form','EntityProperty'),('Form@LastUpdateDate','zh-CN','更新日期','Form','EntityProperty'),('Form@Status','zh-CN','状态','Form','EntityProperty'),('Form@Title','zh-CN','标题','Form','EntityProperty'),('FormData@ActionType','zh-CN','ActionType','FormData','EntityProperty'),('FormData@CreateBy','zh-CN','CreateBy','FormData','EntityProperty'),('FormData@CreatebyName','zh-CN','创建人','FormData','EntityProperty'),('FormData@CreateDate','zh-CN','创建日期','FormData','EntityProperty'),('FormData@Datas','zh-CN','Datas','FormData','EntityProperty'),('FormData@Description','zh-CN','描述','FormData','EntityProperty'),('FormData@Form','zh-CN','Form','FormData','EntityProperty'),('FormData@FormId','zh-CN','表单','FormWidget','EntityProperty'),('FormData@ID','zh-CN','ID','FormData','EntityProperty'),('FormData@LastUpdateBy','zh-CN','LastUpdateBy','FormData','EntityProperty'),('FormData@LastUpdateByName','zh-CN','更新人','FormData','EntityProperty'),('FormData@LastUpdateDate','zh-CN','更新日期','FormData','EntityProperty'),('FormData@Status','zh-CN','状态','FormData','EntityProperty'),('FormData@Title','zh-CN','标题','FormData','EntityProperty'),('FormWidget@ActionType','zh-CN','ActionType','FormWidget','EntityProperty'),('FormWidget@AssemblyName','zh-CN','AssemblyName','FormWidget','EntityProperty'),('FormWidget@CreateBy','zh-CN','CreateBy','FormWidget','EntityProperty'),('FormWidget@CreatebyName','zh-CN','创建人','FormWidget','EntityProperty'),('FormWidget@CreateDate','zh-CN','创建日期','FormWidget','EntityProperty'),('FormWidget@CustomClass','zh-CN','CustomClass','FormWidget','EntityProperty'),('FormWidget@CustomStyle','zh-CN','CustomStyle','FormWidget','EntityProperty'),('FormWidget@Description','zh-CN','描述','FormWidget','EntityProperty'),('FormWidget@ExtendData','zh-CN','ExtendData','FormWidget','EntityProperty'),('FormWidget@FormID','zh-CN','表单','FormWidget','EntityProperty'),('FormWidget@FormView','zh-CN','FormView','FormWidget','EntityProperty'),('FormWidget@ID','zh-CN','ID','FormWidget','EntityProperty'),('FormWidget@IsSystem','zh-CN','IsSystem','FormWidget','EntityProperty'),('FormWidget@IsTemplate','zh-CN','保存为模板','FormWidget','EntityProperty'),('FormWidget@LastUpdateBy','zh-CN','LastUpdateBy','FormWidget','EntityProperty'),('FormWidget@LastUpdateByName','zh-CN','更新人','FormWidget','EntityProperty'),('FormWidget@LastUpdateDate','zh-CN','更新日期','FormWidget','EntityProperty'),('FormWidget@LayoutID','zh-CN','LayoutID','FormWidget','EntityProperty'),('FormWidget@PageID','zh-CN','PageID','FormWidget','EntityProperty'),('FormWidget@PartialView','zh-CN','显示模板','FormWidget','EntityProperty'),('FormWidget@Position','zh-CN','排序','FormWidget','EntityProperty'),('FormWidget@ServiceTypeName','zh-CN','ServiceTypeName','FormWidget','EntityProperty'),('FormWidget@Status','zh-CN','状态','FormWidget','EntityProperty'),('FormWidget@StyleClass','zh-CN','自定义样式','FormWidget','EntityProperty'),('FormWidget@Thumbnail','zh-CN','模板缩略图','FormWidget','EntityProperty'),('FormWidget@Title','zh-CN','标题','FormWidget','EntityProperty'),('FormWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','FormWidget','EntityProperty'),('FormWidget@WidgetName','zh-CN','组件名称','FormWidget','EntityProperty'),('FormWidget@ZoneID','zh-CN','区域','FormWidget','EntityProperty'),('HtmlWidget@ActionType','zh-CN','ActionType','HtmlWidget','EntityProperty'),('HtmlWidget@AssemblyName','zh-CN','AssemblyName','HtmlWidget','EntityProperty'),('HtmlWidget@CreateBy','zh-CN','CreateBy','HtmlWidget','EntityProperty'),('HtmlWidget@CreatebyName','zh-CN','创建人','HtmlWidget','EntityProperty'),('HtmlWidget@CreateDate','zh-CN','创建日期','HtmlWidget','EntityProperty'),('HtmlWidget@CustomClass','zh-CN','CustomClass','HtmlWidget','EntityProperty'),('HtmlWidget@CustomStyle','zh-CN','CustomStyle','HtmlWidget','EntityProperty'),('HtmlWidget@Description','zh-CN','描述','HtmlWidget','EntityProperty'),('HtmlWidget@ExtendData','zh-CN','ExtendData','HtmlWidget','EntityProperty'),('HtmlWidget@ExtendFields','zh-CN','扩展属性','HtmlWidget','EntityProperty'),('HtmlWidget@FormView','zh-CN','FormView','HtmlWidget','EntityProperty'),('HtmlWidget@HTML','zh-CN','内容','HtmlWidget','EntityProperty'),('HtmlWidget@ID','zh-CN','ID','HtmlWidget','EntityProperty'),('HtmlWidget@IsSystem','zh-CN','IsSystem','HtmlWidget','EntityProperty'),('HtmlWidget@IsTemplate','zh-CN','保存为模板','HtmlWidget','EntityProperty'),('HtmlWidget@LastUpdateBy','zh-CN','LastUpdateBy','HtmlWidget','EntityProperty'),('HtmlWidget@LastUpdateByName','zh-CN','更新人','HtmlWidget','EntityProperty'),('HtmlWidget@LastUpdateDate','zh-CN','更新日期','HtmlWidget','EntityProperty'),('HtmlWidget@LayoutID','zh-CN','布局','HtmlWidget','EntityProperty'),('HtmlWidget@PageID','zh-CN','页面','HtmlWidget','EntityProperty'),('HtmlWidget@PartDriver','zh-CN','PartDriver','HtmlWidget','EntityProperty'),('HtmlWidget@PartialView','zh-CN','显示模板','HtmlWidget','EntityProperty'),('HtmlWidget@Position','zh-CN','排序','HtmlWidget','EntityProperty'),('HtmlWidget@ServiceTypeName','zh-CN','ServiceTypeName','HtmlWidget','EntityProperty'),('HtmlWidget@Status','zh-CN','状态','HtmlWidget','EntityProperty'),('HtmlWidget@StyleClass','zh-CN','自定义样式','HtmlWidget','EntityProperty'),('HtmlWidget@Thumbnail','zh-CN','模板缩略图','HtmlWidget','EntityProperty'),('HtmlWidget@Title','zh-CN','标题','HtmlWidget','EntityProperty'),('HtmlWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','HtmlWidget','EntityProperty'),('HtmlWidget@WidgetName','zh-CN','组件名称','HtmlWidget','EntityProperty'),('HtmlWidget@ZoneID','zh-CN','区域','HtmlWidget','EntityProperty'),('ImageWidget@ActionType','zh-CN','ActionType','ImageWidget','EntityProperty'),('ImageWidget@AltText','zh-CN','说明','ImageWidget','EntityProperty'),('ImageWidget@AssemblyName','zh-CN','AssemblyName','ImageWidget','EntityProperty'),('ImageWidget@CreateBy','zh-CN','CreateBy','ImageWidget','EntityProperty'),('ImageWidget@CreatebyName','zh-CN','创建人','ImageWidget','EntityProperty'),('ImageWidget@CreateDate','zh-CN','创建日期','ImageWidget','EntityProperty'),('ImageWidget@CustomClass','zh-CN','CustomClass','ImageWidget','EntityProperty'),('ImageWidget@CustomStyle','zh-CN','CustomStyle','ImageWidget','EntityProperty'),('ImageWidget@Description','zh-CN','描述','ImageWidget','EntityProperty'),('ImageWidget@ExtendFields','zh-CN','扩展属性','ImageWidget','EntityProperty'),('ImageWidget@FormView','zh-CN','FormView','ImageWidget','EntityProperty'),('ImageWidget@Height','zh-CN','高度(px)','ImageWidget','EntityProperty'),('ImageWidget@ID','zh-CN','ID','ImageWidget','EntityProperty'),('ImageWidget@ImageUrl','zh-CN','图片','ImageWidget','EntityProperty'),('ImageWidget@IsSystem','zh-CN','IsSystem','ImageWidget','EntityProperty'),('ImageWidget@IsTemplate','zh-CN','保存为模板','ImageWidget','EntityProperty'),('ImageWidget@LastUpdateBy','zh-CN','LastUpdateBy','ImageWidget','EntityProperty'),('ImageWidget@LastUpdateByName','zh-CN','更新人','ImageWidget','EntityProperty'),('ImageWidget@LastUpdateDate','zh-CN','更新日期','ImageWidget','EntityProperty'),('ImageWidget@LayoutID','zh-CN','布局','ImageWidget','EntityProperty'),('ImageWidget@Link','zh-CN','链接','ImageWidget','EntityProperty'),('ImageWidget@PageID','zh-CN','页面','ImageWidget','EntityProperty'),('ImageWidget@PartDriver','zh-CN','PartDriver','ImageWidget','EntityProperty'),('ImageWidget@PartialView','zh-CN','显示模板','ImageWidget','EntityProperty'),('ImageWidget@Position','zh-CN','排序','ImageWidget','EntityProperty'),('ImageWidget@ServiceTypeName','zh-CN','ServiceTypeName','ImageWidget','EntityProperty'),('ImageWidget@Status','zh-CN','状态','ImageWidget','EntityProperty'),('ImageWidget@StyleClass','zh-CN','自定义样式','ImageWidget','EntityProperty'),('ImageWidget@Thumbnail','zh-CN','模板缩略图','ImageWidget','EntityProperty'),('ImageWidget@Title','zh-CN','标题','ImageWidget','EntityProperty'),('ImageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ImageWidget','EntityProperty'),('ImageWidget@WidgetName','zh-CN','组件名称','ImageWidget','EntityProperty'),('ImageWidget@Width','zh-CN','宽度(px)','ImageWidget','EntityProperty'),('ImageWidget@ZoneID','zh-CN','区域','ImageWidget','EntityProperty'),('LanguageEntity@CultureName','zh-CN','语言缩写','LanguageEntity','EntityProperty'),('LanguageEntity@LanKey','zh-CN','翻译键','LanguageEntity','EntityProperty'),('LanguageEntity@LanType','zh-CN','对象','LanguageEntity','EntityProperty'),('LanguageEntity@LanValue','zh-CN','翻译值','LanguageEntity','EntityProperty'),('LanguageEntity@Module','zh-CN','模块','LanguageEntity','EntityProperty'),('LayoutEntity@ActionType','zh-CN','ActionType','LayoutEntity','EntityProperty'),('LayoutEntity@ContainerClass','zh-CN','ContainerClass','LayoutEntity','EntityProperty'),('LayoutEntity@CreateBy','zh-CN','CreateBy','LayoutEntity','EntityProperty'),('LayoutEntity@CreatebyName','zh-CN','创建人','LayoutEntity','EntityProperty'),('LayoutEntity@CreateDate','zh-CN','创建日期','LayoutEntity','EntityProperty'),('LayoutEntity@CurrentTheme','zh-CN','CurrentTheme','LayoutEntity','EntityProperty'),('LayoutEntity@Description','zh-CN','描述','LayoutEntity','EntityProperty'),('LayoutEntity@Html','zh-CN','内容','LayoutEntity','EntityProperty'),('LayoutEntity@ID','zh-CN','ID','LayoutEntity','EntityProperty'),('LayoutEntity@ImageThumbUrl','zh-CN','缩略图','LayoutEntity','EntityProperty'),('LayoutEntity@ImageUrl','zh-CN','图片','LayoutEntity','EntityProperty'),('LayoutEntity@LastUpdateBy','zh-CN','LastUpdateBy','LayoutEntity','EntityProperty'),('LayoutEntity@LastUpdateByName','zh-CN','更新人','LayoutEntity','EntityProperty'),('LayoutEntity@LastUpdateDate','zh-CN','更新日期','LayoutEntity','EntityProperty'),('LayoutEntity@Layout','zh-CN','Layout','LayoutEntity','EntityProperty'),('LayoutEntity@LayoutName','zh-CN','名称','LayoutEntity','EntityProperty'),('LayoutEntity@Page','zh-CN','Page','LayoutEntity','EntityProperty'),('LayoutEntity@PreViewPage','zh-CN','PreViewPage','LayoutEntity','EntityProperty'),('LayoutEntity@Script','zh-CN','脚本','LayoutEntity','EntityProperty'),('LayoutEntity@Status','zh-CN','状态','LayoutEntity','EntityProperty'),('LayoutEntity@Style','zh-CN','样式','LayoutEntity','EntityProperty'),('LayoutEntity@Templates','zh-CN','Templates','LayoutEntity','EntityProperty'),('LayoutEntity@Theme','zh-CN','主题','LayoutEntity','EntityProperty'),('LayoutEntity@Title','zh-CN','标题','LayoutEntity','EntityProperty'),('LayoutEntity@Zones','zh-CN','Zones','LayoutEntity','EntityProperty'),('LayoutEntity@ZoneWidgets','zh-CN','ZoneWidgets','LayoutEntity','EntityProperty'),('LayoutHtml@ActionType','zh-CN','ActionType','LayoutHtml','EntityProperty'),('LayoutHtml@CreateBy','zh-CN','CreateBy','LayoutHtml','EntityProperty'),('LayoutHtml@CreatebyName','zh-CN','创建人','LayoutHtml','EntityProperty'),('LayoutHtml@CreateDate','zh-CN','创建日期','LayoutHtml','EntityProperty'),('LayoutHtml@Description','zh-CN','描述','LayoutHtml','EntityProperty'),('LayoutHtml@Html','zh-CN','内容','LayoutHtml','EntityProperty'),('LayoutHtml@LastUpdateBy','zh-CN','LastUpdateBy','LayoutHtml','EntityProperty'),('LayoutHtml@LastUpdateByName','zh-CN','更新人','LayoutHtml','EntityProperty'),('LayoutHtml@LastUpdateDate','zh-CN','更新日期','LayoutHtml','EntityProperty'),('LayoutHtml@LayoutHtmlId','zh-CN','LayoutHtmlId','LayoutHtml','EntityProperty'),('LayoutHtml@LayoutId','zh-CN','布局','LayoutHtml','EntityProperty'),('LayoutHtml@Status','zh-CN','状态','LayoutHtml','EntityProperty'),('LayoutHtml@Title','zh-CN','标题','LayoutHtml','EntityProperty'),('MediaEntity@ActionType','zh-CN','ActionType','MediaEntity','EntityProperty'),('MediaEntity@CreateBy','zh-CN','CreateBy','MediaEntity','EntityProperty'),('MediaEntity@CreatebyName','zh-CN','CreatebyName','MediaEntity','EntityProperty'),('MediaEntity@CreateDate','zh-CN','CreateDate','MediaEntity','EntityProperty'),('MediaEntity@Description','zh-CN','描述','MediaEntity','EntityProperty'),('MediaEntity@ID','zh-CN','ID','MediaEntity','EntityProperty'),('MediaEntity@LastUpdateBy','zh-CN','LastUpdateBy','MediaEntity','EntityProperty'),('MediaEntity@LastUpdateByName','zh-CN','LastUpdateByName','MediaEntity','EntityProperty'),('MediaEntity@LastUpdateDate','zh-CN','LastUpdateDate','MediaEntity','EntityProperty'),('MediaEntity@MediaType','zh-CN','MediaType','MediaEntity','EntityProperty'),('MediaEntity@MediaTypeImage','zh-CN','MediaTypeImage','MediaEntity','EntityProperty'),('MediaEntity@ParentID','zh-CN','ParentID','MediaEntity','EntityProperty'),('MediaEntity@Status','zh-CN','状态','MediaEntity','EntityProperty'),('MediaEntity@Title','zh-CN','标题','MediaEntity','EntityProperty'),('MediaEntity@Url','zh-CN','Url','MediaEntity','EntityProperty'),('MessageEntity@ActionType','zh-CN','ActionType','MessageEntity','EntityProperty'),('MessageEntity@CreateBy','zh-CN','CreateBy','MessageEntity','EntityProperty'),('MessageEntity@CreatebyName','zh-CN','创建人','MessageEntity','EntityProperty'),('MessageEntity@CreateDate','zh-CN','创建日期','MessageEntity','EntityProperty'),('MessageEntity@Description','zh-CN','描述','MessageEntity','EntityProperty'),('MessageEntity@Email','zh-CN','邮箱','MessageEntity','EntityProperty'),('MessageEntity@ID','zh-CN','ID','MessageEntity','EntityProperty'),('MessageEntity@LastUpdateBy','zh-CN','LastUpdateBy','MessageEntity','EntityProperty'),('MessageEntity@LastUpdateByName','zh-CN','更新人','MessageEntity','EntityProperty'),('MessageEntity@LastUpdateDate','zh-CN','更新日期','MessageEntity','EntityProperty'),('MessageEntity@PostMessage','zh-CN','留言内容','MessageEntity','EntityProperty'),('MessageEntity@Reply','zh-CN','回复','MessageEntity','EntityProperty'),('MessageEntity@Status','zh-CN','状态','MessageEntity','EntityProperty'),('MessageEntity@Title','zh-CN','姓名','MessageEntity','EntityProperty'),('MessageNotificationConfig@CommentNotifyEmails','zh-CN','新评论通知邮箱','MessageNotificationConfig','EntityProperty'),('MessageNotificationConfig@MessageNotifyEmails','zh-CN','新留言通知邮箱','MessageNotificationConfig','EntityProperty'),('MessageWidget@ActionType','zh-CN','ActionType','MessageWidget','EntityProperty'),('MessageWidget@AssemblyName','zh-CN','AssemblyName','MessageWidget','EntityProperty'),('MessageWidget@CreateBy','zh-CN','CreateBy','MessageWidget','EntityProperty'),('MessageWidget@CreatebyName','zh-CN','创建人','MessageWidget','EntityProperty'),('MessageWidget@CreateDate','zh-CN','创建日期','MessageWidget','EntityProperty'),('MessageWidget@CustomClass','zh-CN','CustomClass','MessageWidget','EntityProperty'),('MessageWidget@CustomStyle','zh-CN','CustomStyle','MessageWidget','EntityProperty'),('MessageWidget@Description','zh-CN','描述','MessageWidget','EntityProperty'),('MessageWidget@ExtendData','zh-CN','ExtendData','MessageWidget','EntityProperty'),('MessageWidget@ExtendFields','zh-CN','扩展属性','MessageWidget','EntityProperty'),('MessageWidget@FormView','zh-CN','FormView','MessageWidget','EntityProperty'),('MessageWidget@ID','zh-CN','ID','MessageWidget','EntityProperty'),('MessageWidget@IsSystem','zh-CN','IsSystem','MessageWidget','EntityProperty'),('MessageWidget@IsTemplate','zh-CN','保存为模板','MessageWidget','EntityProperty'),('MessageWidget@LastUpdateBy','zh-CN','LastUpdateBy','MessageWidget','EntityProperty'),('MessageWidget@LastUpdateByName','zh-CN','更新人','MessageWidget','EntityProperty'),('MessageWidget@LastUpdateDate','zh-CN','更新日期','MessageWidget','EntityProperty'),('MessageWidget@LayoutID','zh-CN','LayoutID','MessageWidget','EntityProperty'),('MessageWidget@PageID','zh-CN','PageID','MessageWidget','EntityProperty'),('MessageWidget@PartialView','zh-CN','显示模板','MessageWidget','EntityProperty'),('MessageWidget@Position','zh-CN','排序','MessageWidget','EntityProperty'),('MessageWidget@ServiceTypeName','zh-CN','ServiceTypeName','MessageWidget','EntityProperty'),('MessageWidget@Status','zh-CN','状态','MessageWidget','EntityProperty'),('MessageWidget@StyleClass','zh-CN','自定义样式','MessageWidget','EntityProperty'),('MessageWidget@Thumbnail','zh-CN','模板缩略图','MessageWidget','EntityProperty'),('MessageWidget@Title','zh-CN','标题','MessageWidget','EntityProperty'),('MessageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','MessageWidget','EntityProperty'),('MessageWidget@WidgetName','zh-CN','组件名称','MessageWidget','EntityProperty'),('MessageWidget@ZoneID','zh-CN','区域','MessageWidget','EntityProperty'),('NavigationEntity@ActionType','zh-CN','ActionType','NavigationEntity','EntityProperty'),('NavigationEntity@CreateBy','zh-CN','CreateBy','NavigationEntity','EntityProperty'),('NavigationEntity@CreatebyName','zh-CN','创建人','NavigationEntity','EntityProperty'),('NavigationEntity@CreateDate','zh-CN','创建日期','NavigationEntity','EntityProperty'),('NavigationEntity@Description','zh-CN','描述','NavigationEntity','EntityProperty'),('NavigationEntity@DisplayOrder','zh-CN','排序','NavigationEntity','EntityProperty'),('NavigationEntity@Html','zh-CN','HTML内容','NavigationEntity','EntityProperty'),('NavigationEntity@ID','zh-CN','ID','NavigationEntity','EntityProperty'),('NavigationEntity@IsCurrent','zh-CN','IsCurrent','NavigationEntity','EntityProperty'),('NavigationEntity@IsMobile','zh-CN','手机导航','NavigationEntity','EntityProperty'),('NavigationEntity@LastUpdateBy','zh-CN','LastUpdateBy','NavigationEntity','EntityProperty'),('NavigationEntity@LastUpdateByName','zh-CN','更新人','NavigationEntity','EntityProperty'),('NavigationEntity@LastUpdateDate','zh-CN','更新日期','NavigationEntity','EntityProperty'),('NavigationEntity@ParentId','zh-CN','ParentId','NavigationEntity','EntityProperty'),('NavigationEntity@Status','zh-CN','状态','NavigationEntity','EntityProperty'),('NavigationEntity@Title','zh-CN','标题','NavigationEntity','EntityProperty'),('NavigationEntity@Url','zh-CN','Url','NavigationEntity','EntityProperty'),('NavigationWidget@ActionType','zh-CN','ActionType','NavigationWidget','EntityProperty'),('NavigationWidget@AlignClass','zh-CN','对齐','NavigationWidget','EntityProperty'),('NavigationWidget@AssemblyName','zh-CN','AssemblyName','NavigationWidget','EntityProperty'),('NavigationWidget@CreateBy','zh-CN','CreateBy','NavigationWidget','EntityProperty'),('NavigationWidget@CreatebyName','zh-CN','创建人','NavigationWidget','EntityProperty'),('NavigationWidget@CreateDate','zh-CN','创建日期','NavigationWidget','EntityProperty'),('NavigationWidget@CustomClass','zh-CN','CustomClass','NavigationWidget','EntityProperty'),('NavigationWidget@CustomerClass','zh-CN','契合度','NavigationWidget','EntityProperty'),('NavigationWidget@CustomStyle','zh-CN','契合度','NavigationWidget','EntityProperty'),('NavigationWidget@Description','zh-CN','描述','NavigationWidget','EntityProperty'),('NavigationWidget@ExtendData','zh-CN','ExtendData','NavigationWidget','EntityProperty'),('NavigationWidget@ExtendFields','zh-CN','扩展属性','NavigationWidget','EntityProperty'),('NavigationWidget@FormView','zh-CN','FormView','NavigationWidget','EntityProperty'),('NavigationWidget@ID','zh-CN','ID','NavigationWidget','EntityProperty'),('NavigationWidget@IsSystem','zh-CN','IsSystem','NavigationWidget','EntityProperty'),('NavigationWidget@IsTemplate','zh-CN','保存为模板','NavigationWidget','EntityProperty'),('NavigationWidget@IsTopFix','zh-CN','顶部固定','NavigationWidget','EntityProperty'),('NavigationWidget@LastUpdateBy','zh-CN','LastUpdateBy','NavigationWidget','EntityProperty'),('NavigationWidget@LastUpdateByName','zh-CN','更新人','NavigationWidget','EntityProperty'),('NavigationWidget@LastUpdateDate','zh-CN','更新日期','NavigationWidget','EntityProperty'),('NavigationWidget@LayoutID','zh-CN','布局','NavigationWidget','EntityProperty'),('NavigationWidget@Logo','zh-CN','Logo','NavigationWidget','EntityProperty'),('NavigationWidget@PageID','zh-CN','页面','NavigationWidget','EntityProperty'),('NavigationWidget@PartDriver','zh-CN','PartDriver','NavigationWidget','EntityProperty'),('NavigationWidget@PartialView','zh-CN','显示模板','NavigationWidget','EntityProperty'),('NavigationWidget@Position','zh-CN','排序','NavigationWidget','EntityProperty'),('NavigationWidget@RootID','zh-CN','根结点','NavigationWidget','EntityProperty'),('NavigationWidget@ServiceTypeName','zh-CN','ServiceTypeName','NavigationWidget','EntityProperty'),('NavigationWidget@ShowBasket','zh-CN','显示购物车？','NavigationWidget','EntityProperty'),('NavigationWidget@Status','zh-CN','状态','NavigationWidget','EntityProperty'),('NavigationWidget@StyleClass','zh-CN','自定义样式','NavigationWidget','EntityProperty'),('NavigationWidget@Thumbnail','zh-CN','模板缩略图','NavigationWidget','EntityProperty'),('NavigationWidget@Title','zh-CN','标题','NavigationWidget','EntityProperty'),('NavigationWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','NavigationWidget','EntityProperty'),('NavigationWidget@WidgetName','zh-CN','组件名称','NavigationWidget','EntityProperty'),('NavigationWidget@ZoneID','zh-CN','区域','NavigationWidget','EntityProperty'),('Order@ActionType','zh-CN','ActionType','Order','EntityProperty'),('Order@CompletePayTime','zh-CN','完成支付时间','Order','EntityProperty'),('Order@Contact','zh-CN','联系人','Order','EntityProperty'),('Order@CreateBy','zh-CN','CreateBy','Order','EntityProperty'),('Order@CreatebyName','zh-CN','创建人','Order','EntityProperty'),('Order@CreateDate','zh-CN','创建日期','Order','EntityProperty'),('Order@Description','zh-CN','描述','Order','EntityProperty'),('Order@ID','zh-CN','订单号','Order','EntityProperty'),('Order@LastUpdateBy','zh-CN','LastUpdateBy','Order','EntityProperty'),('Order@LastUpdateByName','zh-CN','更新人','Order','EntityProperty'),('Order@LastUpdateDate','zh-CN','更新日期','Order','EntityProperty'),('Order@LogisticsCompany','zh-CN','快递公司','Order','EntityProperty'),('Order@OrderStatus','zh-CN','订单状态','Order','EntityProperty'),('Order@PaymentGateway','zh-CN','支付方式','Order','EntityProperty'),('Order@PaymentID','zh-CN','支付ID','Order','EntityProperty'),('Order@PayTime','zh-CN','发起支付时间','Order','EntityProperty'),('Order@PhoneNumber','zh-CN','电话','Order','EntityProperty'),('Order@Refund','zh-CN','退款金额','Order','EntityProperty'),('Order@RefundDate','zh-CN','退款日期','Order','EntityProperty'),('Order@RefundID','zh-CN','退款流水号','Order','EntityProperty'),('Order@RefundReason','zh-CN','退款原因','Order','EntityProperty'),('Order@ShippingAddress','zh-CN','收货地址','Order','EntityProperty'),('Order@Status','zh-CN','状态','Order','EntityProperty'),('Order@Title','zh-CN','标题','Order','EntityProperty'),('Order@Total','zh-CN','总价','Order','EntityProperty'),('Order@TrackingNumber','zh-CN','快递单号','Order','EntityProperty'),('Order@UserId','zh-CN','登录名','Order','EntityProperty'),('PageEntity@ActionType','zh-CN','ActionType','PageEntity','EntityProperty'),('PageEntity@Content','zh-CN','Content','PageEntity','EntityProperty'),('PageEntity@CreateBy','zh-CN','CreateBy','PageEntity','EntityProperty'),('PageEntity@CreatebyName','zh-CN','创建人','PageEntity','EntityProperty'),('PageEntity@CreateDate','zh-CN','创建日期','PageEntity','EntityProperty'),('PageEntity@Description','zh-CN','描述','PageEntity','EntityProperty'),('PageEntity@DisplayOrder','zh-CN','排序','PageEntity','EntityProperty'),('PageEntity@ExtendFields','zh-CN','扩展属性','PageEntity','EntityProperty'),('PageEntity@Favicon','zh-CN','Favicon','PageEntity','EntityProperty'),('PageEntity@ID','zh-CN','ID','PageEntity','EntityProperty'),('PageEntity@IsHomePage','zh-CN','首页?','PageEntity','EntityProperty'),('PageEntity@IsPublish','zh-CN','已发布?','PageEntity','EntityProperty'),('PageEntity@IsPublishedPage','zh-CN','IsPublishedPage','PageEntity','EntityProperty'),('PageEntity@LastUpdateBy','zh-CN','LastUpdateBy','PageEntity','EntityProperty'),('PageEntity@LastUpdateByName','zh-CN','更新人','PageEntity','EntityProperty'),('PageEntity@LastUpdateDate','zh-CN','更新日期','PageEntity','EntityProperty'),('PageEntity@LayoutId','zh-CN','布局','PageEntity','EntityProperty'),('PageEntity@MetaDescription','zh-CN','SEO描述','PageEntity','EntityProperty'),('PageEntity@MetaKeyWorlds','zh-CN','SEO关键字','PageEntity','EntityProperty'),('PageEntity@PageName','zh-CN','名称','PageEntity','EntityProperty'),('PageEntity@PageUrl','zh-CN','页面地址','PageEntity','EntityProperty'),('PageEntity@ParentId','zh-CN','ParentId','PageEntity','EntityProperty'),('PageEntity@PublishDate','zh-CN','发布日期','PageEntity','EntityProperty'),('PageEntity@ReferencePageID','zh-CN','ReferencePageID','PageEntity','EntityProperty'),('PageEntity@Script','zh-CN','脚本','PageEntity','EntityProperty'),('PageEntity@Status','zh-CN','状态','PageEntity','EntityProperty'),('PageEntity@Style','zh-CN','样式','PageEntity','EntityProperty'),('PageEntity@Title','zh-CN','标题','PageEntity','EntityProperty'),('PageEntity@Url','zh-CN','Url','PageEntity','EntityProperty'),('ProductCategory@ActionType','zh-CN','ActionType','ProductCategory','EntityProperty'),('ProductCategory@CreateBy','zh-CN','CreateBy','ProductCategory','EntityProperty'),('ProductCategory@CreatebyName','zh-CN','创建人','ProductCategory','EntityProperty'),('ProductCategory@CreateDate','zh-CN','创建日期','ProductCategory','EntityProperty'),('ProductCategory@Description','zh-CN','描述','ProductCategory','EntityProperty'),('ProductCategory@ID','zh-CN','ID','ProductCategory','EntityProperty'),('ProductCategory@LastUpdateBy','zh-CN','LastUpdateBy','ProductCategory','EntityProperty'),('ProductCategory@LastUpdateByName','zh-CN','更新人','ProductCategory','EntityProperty'),('ProductCategory@LastUpdateDate','zh-CN','更新日期','ProductCategory','EntityProperty'),('ProductCategory@ParentID','zh-CN','ParentID','ProductCategory','EntityProperty'),('ProductCategory@Status','zh-CN','状态','ProductCategory','EntityProperty'),('ProductCategory@Title','zh-CN','标题','ProductCategory','EntityProperty'),('ProductCategory@Url','zh-CN','Url','ProductCategory','EntityProperty'),('ProductCategoryWidget@ActionType','zh-CN','ActionType','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@AssemblyName','zh-CN','AssemblyName','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@CreateBy','zh-CN','CreateBy','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@CreatebyName','zh-CN','创建人','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@CreateDate','zh-CN','创建日期','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@CustomClass','zh-CN','CustomClass','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@CustomStyle','zh-CN','CustomStyle','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@Description','zh-CN','描述','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@ExtendFields','zh-CN','扩展属性','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@FormView','zh-CN','FormView','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@ID','zh-CN','ID','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@IsSystem','zh-CN','IsSystem','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@IsTemplate','zh-CN','保存为模板','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@LastUpdateByName','zh-CN','更新人','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@LastUpdateDate','zh-CN','更新日期','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@LayoutID','zh-CN','LayoutID','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@PageID','zh-CN','PageID','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@PartialView','zh-CN','显示模板','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@Position','zh-CN','排序','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@ProductCategoryID','zh-CN','产品类别','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@Status','zh-CN','状态','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@StyleClass','zh-CN','自定义样式','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@TargetPage','zh-CN','详细页面','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@Thumbnail','zh-CN','模板缩略图','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@Title','zh-CN','标题','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@WidgetName','zh-CN','组件名称','ProductCategoryWidget','EntityProperty'),('ProductCategoryWidget@ZoneID','zh-CN','区域','ProductCategoryWidget','EntityProperty'),('ProductDetailWidget@ActionType','zh-CN','ActionType','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@AssemblyName','zh-CN','AssemblyName','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@CreateBy','zh-CN','CreateBy','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@CreatebyName','zh-CN','创建人','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@CreateDate','zh-CN','创建日期','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@CustomClass','zh-CN','CustomClass','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@CustomerClass','zh-CN','CustomerClass','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@CustomStyle','zh-CN','CustomStyle','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@Description','zh-CN','描述','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@ExtendFields','zh-CN','扩展属性','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@FormView','zh-CN','FormView','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@ID','zh-CN','ID','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@IsSystem','zh-CN','IsSystem','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@IsTemplate','zh-CN','保存为模板','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@LastUpdateByName','zh-CN','更新人','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@LastUpdateDate','zh-CN','更新日期','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@LayoutID','zh-CN','LayoutID','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@PageID','zh-CN','PageID','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@PartialView','zh-CN','显示模板','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@Position','zh-CN','排序','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@Status','zh-CN','状态','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@StyleClass','zh-CN','自定义样式','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@Thumbnail','zh-CN','模板缩略图','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@Title','zh-CN','标题','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@WidgetName','zh-CN','组件名称','ProductDetailWidget','EntityProperty'),('ProductDetailWidget@ZoneID','zh-CN','区域','ProductDetailWidget','EntityProperty'),('ProductEntity@ActionType','zh-CN','ActionType','ProductEntity','EntityProperty'),('ProductEntity@BrandCD','zh-CN','BrandCD','ProductEntity','EntityProperty'),('ProductEntity@Color','zh-CN','颜色','ProductEntity','EntityProperty'),('ProductEntity@CreateBy','zh-CN','CreateBy','ProductEntity','EntityProperty'),('ProductEntity@CreatebyName','zh-CN','创建人','ProductEntity','EntityProperty'),('ProductEntity@CreateDate','zh-CN','创建日期','ProductEntity','EntityProperty'),('ProductEntity@Description','zh-CN','描述','ProductEntity','EntityProperty'),('ProductEntity@ExtendFields','zh-CN','扩展属性','ProductEntity','EntityProperty'),('ProductEntity@ID','zh-CN','ID','ProductEntity','EntityProperty'),('ProductEntity@ImageThumbUrl','zh-CN','缩略图','ProductEntity','EntityProperty'),('ProductEntity@ImageUrl','zh-CN','图片','ProductEntity','EntityProperty'),('ProductEntity@IsPublish','zh-CN','已发布?','ProductEntity','EntityProperty'),('ProductEntity@LastUpdateBy','zh-CN','LastUpdateBy','ProductEntity','EntityProperty'),('ProductEntity@LastUpdateByName','zh-CN','更新人','ProductEntity','EntityProperty'),('ProductEntity@LastUpdateDate','zh-CN','更新日期','ProductEntity','EntityProperty'),('ProductEntity@Norm','zh-CN','规格','ProductEntity','EntityProperty'),('ProductEntity@OrderIndex','zh-CN','排序','ProductEntity','EntityProperty'),('ProductEntity@PartNumber','zh-CN','型号','ProductEntity','EntityProperty'),('ProductEntity@Price','zh-CN','价格','ProductEntity','EntityProperty'),('ProductEntity@ProductCategoryID','zh-CN','产品类别','ProductEntity','EntityProperty'),('ProductEntity@ProductContent','zh-CN','详细内容','ProductEntity','EntityProperty'),('ProductEntity@ProductEntityCategory','zh-CN','产品类别','ProductEntity','EntityProperty'),('ProductEntity@ProductEntityCategoryID','zh-CN','产品类别','ProductEntity','EntityProperty'),('ProductEntity@ProductEntityContent','zh-CN','描述','ProductEntity','EntityProperty'),('ProductEntity@ProductImages','zh-CN','展示图','ProductEntity','EntityProperty'),('ProductEntity@ProductTags','zh-CN','标签','ProductEntity','EntityProperty'),('ProductEntity@PublishDate','zh-CN','发布日期','ProductEntity','EntityProperty'),('ProductEntity@PurchasePrice','zh-CN','成本价','ProductEntity','EntityProperty'),('ProductEntity@RebatePrice','zh-CN','折扣价','ProductEntity','EntityProperty'),('ProductEntity@SEODescription','zh-CN','SEO描述','ProductEntity','EntityProperty'),('ProductEntity@SEOKeyWord','zh-CN','SEO关键字','ProductEntity','EntityProperty'),('ProductEntity@SEOTitle','zh-CN','SEO标题','ProductEntity','EntityProperty'),('ProductEntity@ShelfLife','zh-CN','保质期','ProductEntity','EntityProperty'),('ProductEntity@SourceFrom','zh-CN','来源','ProductEntity','EntityProperty'),('ProductEntity@Status','zh-CN','状态','ProductEntity','EntityProperty'),('ProductEntity@TargetFrom','zh-CN','其它网站','ProductEntity','EntityProperty'),('ProductEntity@TargetUrl','zh-CN','网站网址','ProductEntity','EntityProperty'),('ProductEntity@Title','zh-CN','标题','ProductEntity','EntityProperty'),('ProductEntity@Url','zh-CN','Url','ProductEntity','EntityProperty'),('ProductImage@ActionType','zh-CN','ActionType','ProductImage','EntityProperty'),('ProductImage@CreateBy','zh-CN','CreateBy','ProductImage','EntityProperty'),('ProductImage@CreatebyName','zh-CN','创建人','ProductImage','EntityProperty'),('ProductImage@CreateDate','zh-CN','创建日期','ProductImage','EntityProperty'),('ProductImage@Description','zh-CN','描述','ProductImage','EntityProperty'),('ProductImage@ID','zh-CN','ID','ProductImage','EntityProperty'),('ProductImage@ImageUrl','zh-CN','图片','ProductImage','EntityProperty'),('ProductImage@LastUpdateBy','zh-CN','LastUpdateBy','ProductImage','EntityProperty'),('ProductImage@LastUpdateByName','zh-CN','更新人','ProductImage','EntityProperty'),('ProductImage@LastUpdateDate','zh-CN','更新日期','ProductImage','EntityProperty'),('ProductImage@ProductId','zh-CN','ProductId','ProductImage','EntityProperty'),('ProductImage@Status','zh-CN','状态','ProductImage','EntityProperty'),('ProductImage@Title','zh-CN','标题','ProductImage','EntityProperty'),('ProductListWidget@ActionType','zh-CN','ActionType','ProductListWidget','EntityProperty'),('ProductListWidget@AssemblyName','zh-CN','AssemblyName','ProductListWidget','EntityProperty'),('ProductListWidget@Columns','zh-CN','显示列','ProductListWidget','EntityProperty'),('ProductListWidget@CreateBy','zh-CN','CreateBy','ProductListWidget','EntityProperty'),('ProductListWidget@CreatebyName','zh-CN','创建人','ProductListWidget','EntityProperty'),('ProductListWidget@CreateDate','zh-CN','创建日期','ProductListWidget','EntityProperty'),('ProductListWidget@CustomClass','zh-CN','CustomClass','ProductListWidget','EntityProperty'),('ProductListWidget@CustomStyle','zh-CN','CustomStyle','ProductListWidget','EntityProperty'),('ProductListWidget@Description','zh-CN','描述','ProductListWidget','EntityProperty'),('ProductListWidget@DetailPageUrl','zh-CN','详细页面','ProductListWidget','EntityProperty'),('ProductListWidget@ExtendData','zh-CN','ExtendData','ProductListWidget','EntityProperty'),('ProductListWidget@ExtendFields','zh-CN','扩展属性','ProductListWidget','EntityProperty'),('ProductListWidget@FormView','zh-CN','FormView','ProductListWidget','EntityProperty'),('ProductListWidget@ID','zh-CN','ID','ProductListWidget','EntityProperty'),('ProductListWidget@IsPageable','zh-CN','分页?','ProductListWidget','EntityProperty'),('ProductListWidget@IsSystem','zh-CN','IsSystem','ProductListWidget','EntityProperty'),('ProductListWidget@IsTemplate','zh-CN','保存为模板','ProductListWidget','EntityProperty'),('ProductListWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductListWidget','EntityProperty'),('ProductListWidget@LastUpdateByName','zh-CN','更新人','ProductListWidget','EntityProperty'),('ProductListWidget@LastUpdateDate','zh-CN','更新日期','ProductListWidget','EntityProperty'),('ProductListWidget@LayoutID','zh-CN','LayoutID','ProductListWidget','EntityProperty'),('ProductListWidget@PageID','zh-CN','PageID','ProductListWidget','EntityProperty'),('ProductListWidget@PageSize','zh-CN','分页大小','ProductListWidget','EntityProperty'),('ProductListWidget@PartialView','zh-CN','显示模板','ProductListWidget','EntityProperty'),('ProductListWidget@Position','zh-CN','排序','ProductListWidget','EntityProperty'),('ProductListWidget@ProductCategoryID','zh-CN','产品类别','ProductListWidget','EntityProperty'),('ProductListWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductListWidget','EntityProperty'),('ProductListWidget@Status','zh-CN','状态','ProductListWidget','EntityProperty'),('ProductListWidget@StyleClass','zh-CN','自定义样式','ProductListWidget','EntityProperty'),('ProductListWidget@Thumbnail','zh-CN','模板缩略图','ProductListWidget','EntityProperty'),('ProductListWidget@Title','zh-CN','标题','ProductListWidget','EntityProperty'),('ProductListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductListWidget','EntityProperty'),('ProductListWidget@WidgetName','zh-CN','组件名称','ProductListWidget','EntityProperty'),('ProductListWidget@ZoneID','zh-CN','区域','ProductListWidget','EntityProperty'),('Robots@Content','zh-CN','内容','Robots','EntityProperty'),('RoleEntity@ActionType','zh-CN','ActionType','RoleEntity','EntityProperty'),('RoleEntity@CreateBy','zh-CN','CreateBy','RoleEntity','EntityProperty'),('RoleEntity@CreatebyName','zh-CN','创建人','RoleEntity','EntityProperty'),('RoleEntity@CreateDate','zh-CN','创建日期','RoleEntity','EntityProperty'),('RoleEntity@Description','zh-CN','描述','RoleEntity','EntityProperty'),('RoleEntity@ID','zh-CN','ID','RoleEntity','EntityProperty'),('RoleEntity@LastUpdateBy','zh-CN','LastUpdateBy','RoleEntity','EntityProperty'),('RoleEntity@LastUpdateByName','zh-CN','更新人','RoleEntity','EntityProperty'),('RoleEntity@LastUpdateDate','zh-CN','更新日期','RoleEntity','EntityProperty'),('RoleEntity@Permissions','zh-CN','Permissions','RoleEntity','EntityProperty'),('RoleEntity@Status','zh-CN','状态','RoleEntity','EntityProperty'),('RoleEntity@Title','zh-CN','标题','RoleEntity','EntityProperty'),('Rule@Description','zh-CN','描述','Rule','EntityProperty'),('Rule@RuleID','zh-CN','RuleID','Rule','EntityProperty'),('Rule@RuleItemList','zh-CN','条件组','Rule','EntityProperty'),('Rule@Status','zh-CN','状态','Rule','EntityProperty'),('Rule@Title','zh-CN','标题','Rule','EntityProperty'),('Rule@ZoneName','zh-CN','显示区域','Rule','EntityProperty'),('RuleItem@Condition','zh-CN','条件','RuleItem','EntityProperty'),('RuleItem@FunctionName','zh-CN','运算方式','RuleItem','EntityProperty'),('RuleItem@Property','zh-CN','属性','RuleItem','EntityProperty'),('RuleItem@Value','zh-CN','值','RuleItem','EntityProperty'),('ScriptWidget@ActionType','zh-CN','ActionType','ScriptWidget','EntityProperty'),('ScriptWidget@AssemblyName','zh-CN','AssemblyName','ScriptWidget','EntityProperty'),('ScriptWidget@CreateBy','zh-CN','CreateBy','ScriptWidget','EntityProperty'),('ScriptWidget@CreatebyName','zh-CN','创建人','ScriptWidget','EntityProperty'),('ScriptWidget@CreateDate','zh-CN','创建日期','ScriptWidget','EntityProperty'),('ScriptWidget@CustomClass','zh-CN','CustomClass','ScriptWidget','EntityProperty'),('ScriptWidget@CustomStyle','zh-CN','CustomStyle','ScriptWidget','EntityProperty'),('ScriptWidget@Description','zh-CN','描述','ScriptWidget','EntityProperty'),('ScriptWidget@ExtendFields','zh-CN','扩展属性','ScriptWidget','EntityProperty'),('ScriptWidget@FormView','zh-CN','FormView','ScriptWidget','EntityProperty'),('ScriptWidget@ID','zh-CN','ID','ScriptWidget','EntityProperty'),('ScriptWidget@IsSystem','zh-CN','IsSystem','ScriptWidget','EntityProperty'),('ScriptWidget@IsTemplate','zh-CN','保存为模板','ScriptWidget','EntityProperty'),('ScriptWidget@LastUpdateBy','zh-CN','LastUpdateBy','ScriptWidget','EntityProperty'),('ScriptWidget@LastUpdateByName','zh-CN','更新人','ScriptWidget','EntityProperty'),('ScriptWidget@LastUpdateDate','zh-CN','更新日期','ScriptWidget','EntityProperty'),('ScriptWidget@LayoutID','zh-CN','LayoutID','ScriptWidget','EntityProperty'),('ScriptWidget@PageID','zh-CN','PageID','ScriptWidget','EntityProperty'),('ScriptWidget@PartialView','zh-CN','显示模板','ScriptWidget','EntityProperty'),('ScriptWidget@Position','zh-CN','排序','ScriptWidget','EntityProperty'),('ScriptWidget@Script','zh-CN','脚本','ScriptWidget','EntityProperty'),('ScriptWidget@ServiceTypeName','zh-CN','ServiceTypeName','ScriptWidget','EntityProperty'),('ScriptWidget@Status','zh-CN','状态','ScriptWidget','EntityProperty'),('ScriptWidget@StyleClass','zh-CN','自定义样式','ScriptWidget','EntityProperty'),('ScriptWidget@Thumbnail','zh-CN','模板缩略图','ScriptWidget','EntityProperty'),('ScriptWidget@Title','zh-CN','标题','ScriptWidget','EntityProperty'),('ScriptWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ScriptWidget','EntityProperty'),('ScriptWidget@WidgetName','zh-CN','组件名称','ScriptWidget','EntityProperty'),('ScriptWidget@ZoneID','zh-CN','区域','ScriptWidget','EntityProperty'),('SectionContent@ActionType','zh-CN','ActionType','SectionContent','EntityProperty'),('SectionContent@CreateBy','zh-CN','CreateBy','SectionContent','EntityProperty'),('SectionContent@CreatebyName','zh-CN','创建人','SectionContent','EntityProperty'),('SectionContent@CreateDate','zh-CN','创建日期','SectionContent','EntityProperty'),('SectionContent@Description','zh-CN','描述','SectionContent','EntityProperty'),('SectionContent@ID','zh-CN','ID','SectionContent','EntityProperty'),('SectionContent@LastUpdateBy','zh-CN','LastUpdateBy','SectionContent','EntityProperty'),('SectionContent@LastUpdateByName','zh-CN','更新人','SectionContent','EntityProperty'),('SectionContent@LastUpdateDate','zh-CN','更新日期','SectionContent','EntityProperty'),('SectionContent@Order','zh-CN','排序','SectionContent','EntityProperty'),('SectionContent@SectionContentType','zh-CN','SectionContentType','SectionContent','EntityProperty'),('SectionContent@SectionGroupId','zh-CN','SectionGroupId','SectionContent','EntityProperty'),('SectionContent@SectionWidgetId','zh-CN','SectionWidgetId','SectionContent','EntityProperty'),('SectionContent@Status','zh-CN','状态','SectionContent','EntityProperty'),('SectionContent@Title','zh-CN','标题','SectionContent','EntityProperty'),('SectionContentCallToAction@ActionType','zh-CN','ActionType','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@CreateBy','zh-CN','CreateBy','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@CreatebyName','zh-CN','创建人','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@CreateDate','zh-CN','创建日期','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@Description','zh-CN','描述','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@Href','zh-CN','链接','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@ID','zh-CN','ID','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@InnerText','zh-CN','标题','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@LastUpdateByName','zh-CN','更新人','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@LastUpdateDate','zh-CN','更新日期','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@Order','zh-CN','排序','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@SectionContentType','zh-CN','SectionContentType','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@SectionGroupId','zh-CN','SectionGroupId','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@Status','zh-CN','状态','SectionContentCallToAction','EntityProperty'),('SectionContentCallToAction@Title','zh-CN','标题','SectionContentCallToAction','EntityProperty'),('SectionContentImage@ActionType','zh-CN','ActionType','SectionContentImage','EntityProperty'),('SectionContentImage@CreateBy','zh-CN','CreateBy','SectionContentImage','EntityProperty'),('SectionContentImage@CreatebyName','zh-CN','创建人','SectionContentImage','EntityProperty'),('SectionContentImage@CreateDate','zh-CN','创建日期','SectionContentImage','EntityProperty'),('SectionContentImage@Description','zh-CN','描述','SectionContentImage','EntityProperty'),('SectionContentImage@Height','zh-CN','高度(px)','SectionContentImage','EntityProperty'),('SectionContentImage@Href','zh-CN','链接','SectionContentImage','EntityProperty'),('SectionContentImage@ID','zh-CN','ID','SectionContentImage','EntityProperty'),('SectionContentImage@ImageAlt','zh-CN','说明','SectionContentImage','EntityProperty'),('SectionContentImage@ImageSrc','zh-CN','图片','SectionContentImage','EntityProperty'),('SectionContentImage@ImageTitle','zh-CN','标题','SectionContentImage','EntityProperty'),('SectionContentImage@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentImage','EntityProperty'),('SectionContentImage@LastUpdateByName','zh-CN','更新人','SectionContentImage','EntityProperty'),('SectionContentImage@LastUpdateDate','zh-CN','更新日期','SectionContentImage','EntityProperty'),('SectionContentImage@Order','zh-CN','排序','SectionContentImage','EntityProperty'),('SectionContentImage@SectionContentType','zh-CN','SectionContentType','SectionContentImage','EntityProperty'),('SectionContentImage@SectionGroupId','zh-CN','SectionGroupId','SectionContentImage','EntityProperty'),('SectionContentImage@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentImage','EntityProperty'),('SectionContentImage@Status','zh-CN','状态','SectionContentImage','EntityProperty'),('SectionContentImage@Title','zh-CN','标题','SectionContentImage','EntityProperty'),('SectionContentImage@Width','zh-CN','宽度(px)','SectionContentImage','EntityProperty'),('SectionContentParagraph@ActionType','zh-CN','ActionType','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@CreateBy','zh-CN','CreateBy','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@CreatebyName','zh-CN','创建人','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@CreateDate','zh-CN','创建日期','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@Description','zh-CN','描述','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@HtmlContent','zh-CN','内容','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@ID','zh-CN','ID','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@LastUpdateByName','zh-CN','更新人','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@LastUpdateDate','zh-CN','更新日期','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@Order','zh-CN','排序','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@SectionContentType','zh-CN','SectionContentType','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@SectionGroupId','zh-CN','SectionGroupId','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@Status','zh-CN','状态','SectionContentParagraph','EntityProperty'),('SectionContentParagraph@Title','zh-CN','标题','SectionContentParagraph','EntityProperty'),('SectionContentTitle@ActionType','zh-CN','ActionType','SectionContentTitle','EntityProperty'),('SectionContentTitle@CreateBy','zh-CN','CreateBy','SectionContentTitle','EntityProperty'),('SectionContentTitle@CreatebyName','zh-CN','创建人','SectionContentTitle','EntityProperty'),('SectionContentTitle@CreateDate','zh-CN','创建日期','SectionContentTitle','EntityProperty'),('SectionContentTitle@Description','zh-CN','描述','SectionContentTitle','EntityProperty'),('SectionContentTitle@Href','zh-CN','链接','SectionContentTitle','EntityProperty'),('SectionContentTitle@ID','zh-CN','ID','SectionContentTitle','EntityProperty'),('SectionContentTitle@InnerText','zh-CN','标题','SectionContentTitle','EntityProperty'),('SectionContentTitle@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentTitle','EntityProperty'),('SectionContentTitle@LastUpdateByName','zh-CN','更新人','SectionContentTitle','EntityProperty'),('SectionContentTitle@LastUpdateDate','zh-CN','更新日期','SectionContentTitle','EntityProperty'),('SectionContentTitle@Order','zh-CN','排序','SectionContentTitle','EntityProperty'),('SectionContentTitle@SectionContentType','zh-CN','SectionContentType','SectionContentTitle','EntityProperty'),('SectionContentTitle@SectionGroupId','zh-CN','SectionGroupId','SectionContentTitle','EntityProperty'),('SectionContentTitle@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentTitle','EntityProperty'),('SectionContentTitle@Status','zh-CN','状态','SectionContentTitle','EntityProperty'),('SectionContentTitle@Title','zh-CN','标题','SectionContentTitle','EntityProperty'),('SectionContentTitle@TitleLevel','zh-CN','等级','SectionContentTitle','EntityProperty'),('SectionContentVideo@ActionType','zh-CN','ActionType','SectionContentVideo','EntityProperty'),('SectionContentVideo@Code','zh-CN','视频代码','SectionContentVideo','EntityProperty'),('SectionContentVideo@CreateBy','zh-CN','CreateBy','SectionContentVideo','EntityProperty'),('SectionContentVideo@CreatebyName','zh-CN','CreatebyName','SectionContentVideo','EntityProperty'),('SectionContentVideo@CreateDate','zh-CN','CreateDate','SectionContentVideo','EntityProperty'),('SectionContentVideo@Description','zh-CN','描述','SectionContentVideo','EntityProperty'),('SectionContentVideo@Height','zh-CN','高度(px)','SectionContentVideo','EntityProperty'),('SectionContentVideo@ID','zh-CN','ID','SectionContentVideo','EntityProperty'),('SectionContentVideo@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentVideo','EntityProperty'),('SectionContentVideo@LastUpdateByName','zh-CN','LastUpdateByName','SectionContentVideo','EntityProperty'),('SectionContentVideo@LastUpdateDate','zh-CN','LastUpdateDate','SectionContentVideo','EntityProperty'),('SectionContentVideo@Order','zh-CN','Order','SectionContentVideo','EntityProperty'),('SectionContentVideo@SectionContentType','zh-CN','SectionContentType','SectionContentVideo','EntityProperty'),('SectionContentVideo@SectionGroupId','zh-CN','SectionGroupId','SectionContentVideo','EntityProperty'),('SectionContentVideo@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentVideo','EntityProperty'),('SectionContentVideo@Status','zh-CN','状态','SectionContentVideo','EntityProperty'),('SectionContentVideo@Thumbnail','zh-CN','缩略图','SectionContentVideo','EntityProperty'),('SectionContentVideo@Title','zh-CN','Title','SectionContentVideo','EntityProperty'),('SectionContentVideo@Url','zh-CN','视频地址(MP4)','SectionContentVideo','EntityProperty'),('SectionContentVideo@VideoTitle','zh-CN','标题','SectionContentVideo','EntityProperty'),('SectionContentVideo@Width','zh-CN','宽度(px)','SectionContentVideo','EntityProperty'),('SectionGroup@ActionType','zh-CN','ActionType','SectionGroup','EntityProperty'),('SectionGroup@CallToAction','zh-CN','CallToAction','SectionGroup','EntityProperty'),('SectionGroup@CallToActions','zh-CN','CallToActions','SectionGroup','EntityProperty'),('SectionGroup@CreateBy','zh-CN','CreateBy','SectionGroup','EntityProperty'),('SectionGroup@CreatebyName','zh-CN','创建人','SectionGroup','EntityProperty'),('SectionGroup@CreateDate','zh-CN','创建日期','SectionGroup','EntityProperty'),('SectionGroup@Description','zh-CN','描述','SectionGroup','EntityProperty'),('SectionGroup@GroupName','zh-CN','组名','SectionGroup','EntityProperty'),('SectionGroup@ID','zh-CN','ID','SectionGroup','EntityProperty'),('SectionGroup@IsLoadDefaultData','zh-CN','IsLoadDefaultData','SectionGroup','EntityProperty'),('SectionGroup@LastUpdateBy','zh-CN','LastUpdateBy','SectionGroup','EntityProperty'),('SectionGroup@LastUpdateByName','zh-CN','更新人','SectionGroup','EntityProperty'),('SectionGroup@LastUpdateDate','zh-CN','更新日期','SectionGroup','EntityProperty'),('SectionGroup@Order','zh-CN','排序','SectionGroup','EntityProperty'),('SectionGroup@Paragraph','zh-CN','Paragraph','SectionGroup','EntityProperty'),('SectionGroup@Paragraphs','zh-CN','Paragraphs','SectionGroup','EntityProperty'),('SectionGroup@PartialView','zh-CN','显示模板','SectionGroup','EntityProperty'),('SectionGroup@PercentWidth','zh-CN','栅格列','SectionGroup','EntityProperty'),('SectionGroup@SectionContents','zh-CN','SectionContents','SectionGroup','EntityProperty'),('SectionGroup@SectionImage','zh-CN','SectionImage','SectionGroup','EntityProperty'),('SectionGroup@SectionImages','zh-CN','SectionImages','SectionGroup','EntityProperty'),('SectionGroup@SectionTitle','zh-CN','SectionTitle','SectionGroup','EntityProperty'),('SectionGroup@SectionTitles','zh-CN','SectionTitles','SectionGroup','EntityProperty'),('SectionGroup@SectionWidgetId','zh-CN','SectionWidgetId','SectionGroup','EntityProperty'),('SectionGroup@Status','zh-CN','状态','SectionGroup','EntityProperty'),('SectionGroup@Title','zh-CN','标题','SectionGroup','EntityProperty'),('SectionWidget@ActionType','zh-CN','ActionType','SectionWidget','EntityProperty'),('SectionWidget@AssemblyName','zh-CN','AssemblyName','SectionWidget','EntityProperty'),('SectionWidget@CreateBy','zh-CN','CreateBy','SectionWidget','EntityProperty'),('SectionWidget@CreatebyName','zh-CN','创建人','SectionWidget','EntityProperty'),('SectionWidget@CreateDate','zh-CN','创建日期','SectionWidget','EntityProperty'),('SectionWidget@CustomClass','zh-CN','CustomClass','SectionWidget','EntityProperty'),('SectionWidget@CustomStyle','zh-CN','CustomStyle','SectionWidget','EntityProperty'),('SectionWidget@Description','zh-CN','描述','SectionWidget','EntityProperty'),('SectionWidget@ExtendData','zh-CN','ExtendData','SectionWidget','EntityProperty'),('SectionWidget@ExtendFields','zh-CN','扩展属性','SectionWidget','EntityProperty'),('SectionWidget@FormView','zh-CN','FormView','SectionWidget','EntityProperty'),('SectionWidget@Groups','zh-CN','Groups','SectionWidget','EntityProperty'),('SectionWidget@ID','zh-CN','ID','SectionWidget','EntityProperty'),('SectionWidget@IsHorizontal','zh-CN','水平分组','SectionWidget','EntityProperty'),('SectionWidget@IsSystem','zh-CN','IsSystem','SectionWidget','EntityProperty'),('SectionWidget@IsTemplate','zh-CN','保存为模板','SectionWidget','EntityProperty'),('SectionWidget@LastUpdateBy','zh-CN','LastUpdateBy','SectionWidget','EntityProperty'),('SectionWidget@LastUpdateByName','zh-CN','更新人','SectionWidget','EntityProperty'),('SectionWidget@LastUpdateDate','zh-CN','更新日期','SectionWidget','EntityProperty'),('SectionWidget@LayoutID','zh-CN','布局','SectionWidget','EntityProperty'),('SectionWidget@PageID','zh-CN','页面','SectionWidget','EntityProperty'),('SectionWidget@PartDriver','zh-CN','PartDriver','SectionWidget','EntityProperty'),('SectionWidget@PartialView','zh-CN','显示模板','SectionWidget','EntityProperty'),('SectionWidget@Position','zh-CN','排序','SectionWidget','EntityProperty'),('SectionWidget@SectionTitle','zh-CN','标题','SectionWidget','EntityProperty'),('SectionWidget@ServiceTypeName','zh-CN','ServiceTypeName','SectionWidget','EntityProperty'),('SectionWidget@Status','zh-CN','状态','SectionWidget','EntityProperty'),('SectionWidget@StyleClass','zh-CN','自定义样式','SectionWidget','EntityProperty'),('SectionWidget@Template','zh-CN','Template','SectionWidget','EntityProperty'),('SectionWidget@Thumbnail','zh-CN','模板缩略图','SectionWidget','EntityProperty'),('SectionWidget@Title','zh-CN','标题','SectionWidget','EntityProperty'),('SectionWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SectionWidget','EntityProperty'),('SectionWidget@WidgetName','zh-CN','组件名称','SectionWidget','EntityProperty'),('SectionWidget@ZoneID','zh-CN','区域','SectionWidget','EntityProperty'),('SmtpSetting@Email','zh-CN','邮箱','SmtpSetting','EntityProperty'),('SmtpSetting@EnableSsl','zh-CN','启用SSL','SmtpSetting','EntityProperty'),('SmtpSetting@Host','zh-CN','服务器','SmtpSetting','EntityProperty'),('SmtpSetting@PassWord','zh-CN','密码','SmtpSetting','EntityProperty'),('SmtpSetting@Port','zh-CN','端口','SmtpSetting','EntityProperty'),('Statistics@ActionType','zh-CN','ActionType','Statistics','EntityProperty'),('Statistics@ContactName','zh-CN','ContactName','Statistics','EntityProperty'),('Statistics@CreateBy','zh-CN','CreateBy','Statistics','EntityProperty'),('Statistics@CreatebyName','zh-CN','CreatebyName','Statistics','EntityProperty'),('Statistics@CreateDate','zh-CN','CreateDate','Statistics','EntityProperty'),('Statistics@Description','zh-CN','描述','Statistics','EntityProperty'),('Statistics@Host','zh-CN','Host','Statistics','EntityProperty'),('Statistics@IpAddress','zh-CN','IpAddress','Statistics','EntityProperty'),('Statistics@LastUpdateBy','zh-CN','LastUpdateBy','Statistics','EntityProperty'),('Statistics@LastUpdateByName','zh-CN','LastUpdateByName','Statistics','EntityProperty'),('Statistics@LastUpdateDate','zh-CN','LastUpdateDate','Statistics','EntityProperty'),('Statistics@StatisticsId','zh-CN','StatisticsId','Statistics','EntityProperty'),('Statistics@Status','zh-CN','状态','Statistics','EntityProperty'),('Statistics@Tel','zh-CN','Tel','Statistics','EntityProperty'),('Statistics@Title','zh-CN','标题','Statistics','EntityProperty'),('StyleSheetWidget@ActionType','zh-CN','ActionType','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@AssemblyName','zh-CN','AssemblyName','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@CreateBy','zh-CN','CreateBy','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@CreatebyName','zh-CN','创建人','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@CreateDate','zh-CN','创建日期','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@CustomClass','zh-CN','CustomClass','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@CustomStyle','zh-CN','CustomStyle','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@Description','zh-CN','描述','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@ExtendFields','zh-CN','扩展属性','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@FormView','zh-CN','FormView','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@ID','zh-CN','ID','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@IsSystem','zh-CN','IsSystem','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@IsTemplate','zh-CN','保存为模板','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@LastUpdateBy','zh-CN','LastUpdateBy','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@LastUpdateByName','zh-CN','更新人','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@LastUpdateDate','zh-CN','更新日期','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@LayoutID','zh-CN','LayoutID','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@PageID','zh-CN','PageID','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@PartDriver','zh-CN','PartDriver','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@PartialView','zh-CN','显示模板','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@Position','zh-CN','排序','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@ServiceTypeName','zh-CN','ServiceTypeName','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@Status','zh-CN','状态','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@StyleClass','zh-CN','自定义样式','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@StyleSheet','zh-CN','样式','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@Thumbnail','zh-CN','模板缩略图','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@Title','zh-CN','标题','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@WidgetName','zh-CN','组件名称','StyleSheetWidget','EntityProperty'),('StyleSheetWidget@ZoneID','zh-CN','区域','StyleSheetWidget','EntityProperty'),('ThemeEntity@ActionType','zh-CN','ActionType','ThemeEntity','EntityProperty'),('ThemeEntity@CreateBy','zh-CN','CreateBy','ThemeEntity','EntityProperty'),('ThemeEntity@CreatebyName','zh-CN','CreatebyName','ThemeEntity','EntityProperty'),('ThemeEntity@CreateDate','zh-CN','CreateDate','ThemeEntity','EntityProperty'),('ThemeEntity@Description','zh-CN','描述','ThemeEntity','EntityProperty'),('ThemeEntity@ID','zh-CN','ID','ThemeEntity','EntityProperty'),('ThemeEntity@IsActived','zh-CN','IsActived','ThemeEntity','EntityProperty'),('ThemeEntity@IsPreView','zh-CN','IsPreView','ThemeEntity','EntityProperty'),('ThemeEntity@LastUpdateBy','zh-CN','LastUpdateBy','ThemeEntity','EntityProperty'),('ThemeEntity@LastUpdateByName','zh-CN','LastUpdateByName','ThemeEntity','EntityProperty'),('ThemeEntity@LastUpdateDate','zh-CN','LastUpdateDate','ThemeEntity','EntityProperty'),('ThemeEntity@Status','zh-CN','状态','ThemeEntity','EntityProperty'),('ThemeEntity@Thumbnail','zh-CN','Thumbnail','ThemeEntity','EntityProperty'),('ThemeEntity@Title','zh-CN','标题','ThemeEntity','EntityProperty'),('ThemeEntity@Url','zh-CN','Url','ThemeEntity','EntityProperty'),('ThemeEntity@UrlDebugger','zh-CN','UrlDebugger','ThemeEntity','EntityProperty'),('UrlRedirect@ActionType','zh-CN','ActionType','UrlRedirect','EntityProperty'),('UrlRedirect@CreateBy','zh-CN','CreateBy','UrlRedirect','EntityProperty'),('UrlRedirect@CreatebyName','zh-CN','创建人','UrlRedirect','EntityProperty'),('UrlRedirect@CreateDate','zh-CN','创建日期','UrlRedirect','EntityProperty'),('UrlRedirect@Description','zh-CN','描述','UrlRedirect','EntityProperty'),('UrlRedirect@DestinationURL','zh-CN','跳转地址','UrlRedirect','EntityProperty'),('UrlRedirect@ID','zh-CN','ID','UrlRedirect','EntityProperty'),('UrlRedirect@InComingUrl','zh-CN','访问地址','UrlRedirect','EntityProperty'),('UrlRedirect@IsPermanent','zh-CN','永久？','UrlRedirect','EntityProperty'),('UrlRedirect@LastUpdateBy','zh-CN','LastUpdateBy','UrlRedirect','EntityProperty'),('UrlRedirect@LastUpdateByName','zh-CN','更新人','UrlRedirect','EntityProperty'),('UrlRedirect@LastUpdateDate','zh-CN','更新日期','UrlRedirect','EntityProperty'),('UrlRedirect@Status','zh-CN','状态','UrlRedirect','EntityProperty'),('UrlRedirect@Title','zh-CN','标题','UrlRedirect','EntityProperty'),('UserEntity@ActionType','zh-CN','ActionType','UserEntity','EntityProperty'),('UserEntity@Address','zh-CN','地址','UserEntity','EntityProperty'),('UserEntity@Age','zh-CN','年龄','UserEntity','EntityProperty'),('UserEntity@ApiLoginToken','zh-CN','ApiLoginToken','UserEntity','EntityProperty'),('UserEntity@AuthenticationType','zh-CN','AuthenticationType','UserEntity','EntityProperty'),('UserEntity@Birthday','zh-CN','出生日期','UserEntity','EntityProperty'),('UserEntity@Birthplace','zh-CN','出生地','UserEntity','EntityProperty'),('UserEntity@CreateBy','zh-CN','CreateBy','UserEntity','EntityProperty'),('UserEntity@CreatebyName','zh-CN','创建人','UserEntity','EntityProperty'),('UserEntity@CreateDate','zh-CN','创建日期','UserEntity','EntityProperty'),('UserEntity@Description','zh-CN','描述','UserEntity','EntityProperty'),('UserEntity@Email','zh-CN','邮箱','UserEntity','EntityProperty'),('UserEntity@EnglishName','zh-CN','英文名','UserEntity','EntityProperty'),('UserEntity@FirstName','zh-CN','名','UserEntity','EntityProperty'),('UserEntity@Hobby','zh-CN','爱好','UserEntity','EntityProperty'),('UserEntity@ID','zh-CN','ID','UserEntity','EntityProperty'),('UserEntity@IsAuthenticated','zh-CN','IsAuthenticated','UserEntity','EntityProperty'),('UserEntity@LastLoginDate','zh-CN','最后登录时间','UserEntity','EntityProperty'),('UserEntity@LastName','zh-CN','姓','UserEntity','EntityProperty'),('UserEntity@LastUpdateBy','zh-CN','LastUpdateBy','UserEntity','EntityProperty'),('UserEntity@LastUpdateByName','zh-CN','更新人','UserEntity','EntityProperty'),('UserEntity@LastUpdateDate','zh-CN','更新日期','UserEntity','EntityProperty'),('UserEntity@LoginIP','zh-CN','LoginIP','UserEntity','EntityProperty'),('UserEntity@MaritalStatus','zh-CN','婚姻情况','UserEntity','EntityProperty'),('UserEntity@MobilePhone','zh-CN','手机号码','UserEntity','EntityProperty'),('UserEntity@Name','zh-CN','Name','UserEntity','EntityProperty'),('UserEntity@NickName','zh-CN','昵称','UserEntity','EntityProperty'),('UserEntity@PassWord','zh-CN','PassWord','UserEntity','EntityProperty'),('UserEntity@PassWordNew','zh-CN','密码','UserEntity','EntityProperty'),('UserEntity@PhotoUrl','zh-CN','头像','UserEntity','EntityProperty'),('UserEntity@Profession','zh-CN','专业技能','UserEntity','EntityProperty'),('UserEntity@QQ','zh-CN','QQ','UserEntity','EntityProperty'),('UserEntity@ResetToken','zh-CN','ResetToken','UserEntity','EntityProperty'),('UserEntity@ResetTokenDate','zh-CN','ResetTokenDate','UserEntity','EntityProperty'),('UserEntity@Roles','zh-CN','角色','UserEntity','EntityProperty'),('UserEntity@School','zh-CN','学校','UserEntity','EntityProperty'),('UserEntity@Sex','zh-CN','性别','UserEntity','EntityProperty'),('UserEntity@Status','zh-CN','状态','UserEntity','EntityProperty'),('UserEntity@Telephone','zh-CN','联系电话','UserEntity','EntityProperty'),('UserEntity@Timestamp','zh-CN','Timestamp','UserEntity','EntityProperty'),('UserEntity@Title','zh-CN','标题','UserEntity','EntityProperty'),('UserEntity@UserID','zh-CN','登录名','UserEntity','EntityProperty'),('UserEntity@UserName','zh-CN','用户名','UserEntity','EntityProperty'),('UserEntity@UserTypeCD','zh-CN','用户类别','UserEntity','EntityProperty'),('UserEntity@ZipCode','zh-CN','邮编','UserEntity','EntityProperty'),('UserRoleRelation@ActionType','zh-CN','ActionType','UserRoleRelation','EntityProperty'),('UserRoleRelation@CreateBy','zh-CN','CreateBy','UserRoleRelation','EntityProperty'),('UserRoleRelation@CreatebyName','zh-CN','创建人','UserRoleRelation','EntityProperty'),('UserRoleRelation@CreateDate','zh-CN','创建日期','UserRoleRelation','EntityProperty'),('UserRoleRelation@Description','zh-CN','描述','UserRoleRelation','EntityProperty'),('UserRoleRelation@ID','zh-CN','ID','UserRoleRelation','EntityProperty'),('UserRoleRelation@LastUpdateBy','zh-CN','LastUpdateBy','UserRoleRelation','EntityProperty'),('UserRoleRelation@LastUpdateByName','zh-CN','更新人','UserRoleRelation','EntityProperty'),('UserRoleRelation@LastUpdateDate','zh-CN','更新日期','UserRoleRelation','EntityProperty'),('UserRoleRelation@RoleID','zh-CN','角色','UserRoleRelation','EntityProperty'),('UserRoleRelation@Status','zh-CN','状态','UserRoleRelation','EntityProperty'),('UserRoleRelation@Title','zh-CN','标题','UserRoleRelation','EntityProperty'),('UserRoleRelation@UserID','zh-CN','登录名','UserRoleRelation','EntityProperty'),('VideoWidget@ActionType','zh-CN','ActionType','VideoWidget','EntityProperty'),('VideoWidget@AssemblyName','zh-CN','AssemblyName','VideoWidget','EntityProperty'),('VideoWidget@Code','zh-CN','视频代码','VideoWidget','EntityProperty'),('VideoWidget@CreateBy','zh-CN','CreateBy','VideoWidget','EntityProperty'),('VideoWidget@CreatebyName','zh-CN','CreatebyName','VideoWidget','EntityProperty'),('VideoWidget@CreateDate','zh-CN','CreateDate','VideoWidget','EntityProperty'),('VideoWidget@CustomClass','zh-CN','CustomClass','VideoWidget','EntityProperty'),('VideoWidget@CustomStyle','zh-CN','CustomStyle','VideoWidget','EntityProperty'),('VideoWidget@Description','zh-CN','描述','VideoWidget','EntityProperty'),('VideoWidget@ExtendFields','zh-CN','扩展属性','VideoWidget','EntityProperty'),('VideoWidget@FormView','zh-CN','FormView','VideoWidget','EntityProperty'),('VideoWidget@Height','zh-CN','高度(px)','VideoWidget','EntityProperty'),('VideoWidget@ID','zh-CN','ID','VideoWidget','EntityProperty'),('VideoWidget@IsSystem','zh-CN','IsSystem','VideoWidget','EntityProperty'),('VideoWidget@IsTemplate','zh-CN','保存为模板','VideoWidget','EntityProperty'),('VideoWidget@LastUpdateBy','zh-CN','LastUpdateBy','VideoWidget','EntityProperty'),('VideoWidget@LastUpdateByName','zh-CN','LastUpdateByName','VideoWidget','EntityProperty'),('VideoWidget@LastUpdateDate','zh-CN','LastUpdateDate','VideoWidget','EntityProperty'),('VideoWidget@LayoutID','zh-CN','LayoutID','VideoWidget','EntityProperty'),('VideoWidget@PageID','zh-CN','PageID','VideoWidget','EntityProperty'),('VideoWidget@PartialView','zh-CN','显示模板','VideoWidget','EntityProperty'),('VideoWidget@Position','zh-CN','排序','VideoWidget','EntityProperty'),('VideoWidget@ServiceTypeName','zh-CN','ServiceTypeName','VideoWidget','EntityProperty'),('VideoWidget@Status','zh-CN','状态','VideoWidget','EntityProperty'),('VideoWidget@StyleClass','zh-CN','自定义样式','VideoWidget','EntityProperty'),('VideoWidget@Thumbnail','zh-CN','模板缩略图','VideoWidget','EntityProperty'),('VideoWidget@Title','zh-CN','标题','VideoWidget','EntityProperty'),('VideoWidget@Url','zh-CN','视频地址(MP4)','VideoWidget','EntityProperty'),('VideoWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','VideoWidget','EntityProperty'),('VideoWidget@WidgetName','zh-CN','组件名称','VideoWidget','EntityProperty'),('VideoWidget@Width','zh-CN','宽度(px)','VideoWidget','EntityProperty'),('VideoWidget@ZoneID','zh-CN','区域','VideoWidget','EntityProperty'),('WidgetBase@ActionType','zh-CN','ActionType','WidgetBase','EntityProperty'),('WidgetBase@AssemblyName','zh-CN','AssemblyName','WidgetBase','EntityProperty'),('WidgetBase@CreateBy','zh-CN','CreateBy','WidgetBase','EntityProperty'),('WidgetBase@CreatebyName','zh-CN','创建人','WidgetBase','EntityProperty'),('WidgetBase@CreateDate','zh-CN','创建日期','WidgetBase','EntityProperty'),('WidgetBase@CustomClass','zh-CN','CustomClass','WidgetBase','EntityProperty'),('WidgetBase@CustomStyle','zh-CN','CustomStyle','WidgetBase','EntityProperty'),('WidgetBase@Description','zh-CN','描述','WidgetBase','EntityProperty'),('WidgetBase@ExtendFields','zh-CN','扩展属性','WidgetBase','EntityProperty'),('WidgetBase@FormView','zh-CN','FormView','WidgetBase','EntityProperty'),('WidgetBase@ID','zh-CN','ID','WidgetBase','EntityProperty'),('WidgetBase@IsSystem','zh-CN','IsSystem','WidgetBase','EntityProperty'),('WidgetBase@IsTemplate','zh-CN','保存为模板','WidgetBase','EntityProperty'),('WidgetBase@LastUpdateBy','zh-CN','LastUpdateBy','WidgetBase','EntityProperty'),('WidgetBase@LastUpdateByName','zh-CN','更新人','WidgetBase','EntityProperty'),('WidgetBase@LastUpdateDate','zh-CN','更新日期','WidgetBase','EntityProperty'),('WidgetBase@LayoutID','zh-CN','布局','WidgetBase','EntityProperty'),('WidgetBase@PageID','zh-CN','页面','WidgetBase','EntityProperty'),('WidgetBase@PartDriver','zh-CN','PartDriver','WidgetBase','EntityProperty'),('WidgetBase@PartialView','zh-CN','显示模板','WidgetBase','EntityProperty'),('WidgetBase@Position','zh-CN','排序','WidgetBase','EntityProperty'),('WidgetBase@ServiceTypeName','zh-CN','ServiceTypeName','WidgetBase','EntityProperty'),('WidgetBase@Status','zh-CN','状态','WidgetBase','EntityProperty'),('WidgetBase@StyleClass','zh-CN','自定义样式','WidgetBase','EntityProperty'),('WidgetBase@Thumbnail','zh-CN','模板缩略图','WidgetBase','EntityProperty'),('WidgetBase@Title','zh-CN','标题','WidgetBase','EntityProperty'),('WidgetBase@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetBase','EntityProperty'),('WidgetBase@WidgetName','zh-CN','组件名称','WidgetBase','EntityProperty'),('WidgetBase@ZoneID','zh-CN','区域','WidgetBase','EntityProperty'),('WidgetTemplateEntity@ActionType','zh-CN','ActionType','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@AssemblyName','zh-CN','AssemblyName','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@CreateBy','zh-CN','CreateBy','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@CreatebyName','zh-CN','创建人','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@CreateDate','zh-CN','创建日期','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@Description','zh-CN','描述','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@FormView','zh-CN','FormView','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@GroupName','zh-CN','组名','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@ID','zh-CN','ID','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@LastUpdateBy','zh-CN','LastUpdateBy','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@LastUpdateByName','zh-CN','更新人','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@LastUpdateDate','zh-CN','更新日期','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@Order','zh-CN','排序','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@PartialView','zh-CN','显示模板','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@ServiceTypeName','zh-CN','ServiceTypeName','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@Status','zh-CN','状态','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@Thumbnail','zh-CN','Thumbnail','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@Title','zh-CN','标题','WidgetTemplateEntity','EntityProperty'),('WidgetTemplateEntity@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetTemplateEntity','EntityProperty'),('ZoneEntity@ActionType','zh-CN','ActionType','ZoneEntity','EntityProperty'),('ZoneEntity@CreateBy','zh-CN','CreateBy','ZoneEntity','EntityProperty'),('ZoneEntity@CreatebyName','zh-CN','创建人','ZoneEntity','EntityProperty'),('ZoneEntity@CreateDate','zh-CN','创建日期','ZoneEntity','EntityProperty'),('ZoneEntity@Description','zh-CN','描述','ZoneEntity','EntityProperty'),('ZoneEntity@HeadingCode','zh-CN','HeadingCode','ZoneEntity','EntityProperty'),('ZoneEntity@ID','zh-CN','ID','ZoneEntity','EntityProperty'),('ZoneEntity@LastUpdateBy','zh-CN','LastUpdateBy','ZoneEntity','EntityProperty'),('ZoneEntity@LastUpdateByName','zh-CN','更新人','ZoneEntity','EntityProperty'),('ZoneEntity@LastUpdateDate','zh-CN','更新日期','ZoneEntity','EntityProperty'),('ZoneEntity@LayoutId','zh-CN','布局','ZoneEntity','EntityProperty'),('ZoneEntity@Status','zh-CN','状态','ZoneEntity','EntityProperty'),('ZoneEntity@Title','zh-CN','标题','ZoneEntity','EntityProperty'),('ZoneEntity@ZoneName','zh-CN','ZoneName','ZoneEntity','EntityProperty');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ParentId` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Url` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsMobile` tinyint(1) DEFAULT NULL,
  `Html` longtext CHARACTER SET utf8mb4,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `DisplayOrder` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES ('1061019b1bcd4bf3aeb3df647c74c309','#','~/product','产品',1,NULL,NULL,1,3,'admin','ZKEASOFT','2016-03-10 23:33:03.653000','admin','ZKEASOFT','2017-10-15 18:05:28.830000'),('6beb1a2a54b947179ec20dd331e375a2','#','~/index','首页',0,NULL,NULL,1,1,'admin',NULL,'2015-09-01 09:55:20.483000','admin','ZKEASOFT','2017-10-15 18:05:28.820000'),('7b5bb24dea6d47618ed027190b4e5d94','#','~/contact','联系我们',0,NULL,NULL,1,5,'admin','ZKEASOFT','2017-03-19 21:06:21.360000','admin','ZKEASOFT','2017-10-15 18:05:28.833000'),('d122a50356bf46c8a8c8349612145e24','#','~/questionnaire','问卷调查',0,NULL,NULL,1,4,'admin','ZKEASOFT','2017-10-15 18:05:25.947000','admin','ZKEASOFT','2017-10-15 18:05:28.837000'),('e4658e8af8434a05b773b666c6c67cd5','#','~/article','新闻',1,NULL,NULL,1,2,'admin','ZKEASOFT','2016-03-10 23:32:53.000000','admin','ZKEASOFT','2017-10-15 18:05:28.827000');
/*!40000 ALTER TABLE `navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigationwidget`
--

DROP TABLE IF EXISTS `navigationwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigationwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `CustomerClass` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Logo` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `AlignClass` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsTopFix` tinyint(1) DEFAULT NULL,
  `RootID` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ShowBasket` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_NavigationWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigationwidget`
--

LOCK TABLES `navigationwidget` WRITE;
/*!40000 ALTER TABLE `navigationwidget` DISABLE KEYS */;
INSERT INTO `navigationwidget` VALUES ('6ee67036e78b4b498d932ab2d76757fb','container',NULL,'~/images/logo_zkea.png','navbar-left',NULL,'root',0);
/*!40000 ALTER TABLE `navigationwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ID` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `UserId` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Contact` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PhoneNumber` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Total` decimal(18,4) NOT NULL,
  `OrderStatus` int(11) NOT NULL,
  `PayTime` datetime(6) DEFAULT NULL,
  `CompletePayTime` datetime(6) DEFAULT NULL,
  `TrackingNumber` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LogisticsCompany` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ShippingAddress` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PaymentGateway` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PaymentID` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `RefundID` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Refund` decimal(18,4) DEFAULT NULL,
  `RefundDate` datetime(6) DEFAULT NULL,
  `RefundReason` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `UserId` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `ImageUrl` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(18,4) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `PromoCode` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pageview`
--

DROP TABLE IF EXISTS `pageview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pageview` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PageUrl` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PageTitle` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IPAddress` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SessionID` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `UserAgent` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Referer` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `RefererName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `KeyWords` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageview`
--

LOCK TABLES `pageview` WRITE;
/*!40000 ALTER TABLE `pageview` DISABLE KEYS */;
/*!40000 ALTER TABLE `pageview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `PermissionKey` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `RoleId` int(11) NOT NULL,
  `Title` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Module` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PermissionKey`,`RoleId`),
  KEY `FK_Permission_Permission_Role` (`RoleId`),
  CONSTRAINT `FK_Permission_Permission_Role` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('ApplicationSetting_Manage',1,'管理系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567000','admin','ZKEASOFT','2018-08-15 15:25:42.613000'),('ApplicationSetting_View',1,'查看系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('ArticleType_Manage',1,'管理文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:22:24.887000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('ArticleType_View',1,'查看文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:19:54.500000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Article_Manage',1,'管理文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:18:40.493000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Article_Publish',1,'发布文章',NULL,'文章',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.820000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Article_View',1,'查看文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:17:59.120000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Carousel_Manage',1,'管理焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:45:46.190000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Carousel_View',1,'查看焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.097000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Comments_Manage',1,'管理回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.053000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Comments_View',1,'查看回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.050000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('EventViewer_Manage',1,'查看错误日志',NULL,'设置',NULL,'admin','ZKEASOFT','2017-07-11 15:43:52.147000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('FormData_Export',1,'导出表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.853000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('FormData_Manage',1,'管理表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.850000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('FormData_View',1,'查看表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Form_Manage',1,'管理表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Form_View',1,'查看表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.830000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Language_Manage',1,'翻译',NULL,'设置',NULL,'admin','ZKEASOFT','2017-11-17 11:47:13.093000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Layout_Manage',1,'管理布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:43:52.697000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Layout_View',1,'查看布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.690000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Media_Manage',1,'管理媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.553000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Media_View',1,'查看媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.090000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('MessageNotification_Manage',1,'管理通知邮箱',NULL,'留言评论',NULL,'admin','ZKEASOFT','2018-08-15 15:25:42.620000','admin','ZKEASOFT','2018-08-15 15:25:42.620000'),('Message_Manage',1,'管理留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.980000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Message_View',1,'查看留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.960000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Navigation_Manage',1,'管理导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:40:38.230000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Navigation_View',1,'查看导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:38:21.943000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Order_Manage',1,'管理订单',NULL,'商城',NULL,'admin','ZKEASOFT','2017-11-17 10:49:53.937000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Order_Refund',1,'退款',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.903000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Order_View',1,'查看订单',NULL,'商城',NULL,'admin','ZKEASOFT','2017-11-17 10:49:53.923000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Order_ViewOrderPayment',1,'查看支付平台支付信息',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.777000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Order_ViewOrderRefund',1,'查看支付平台退款信息',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.850000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Page_Manage',1,'管理页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 13:41:08.463000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Page_View',1,'查看页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.683000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Payment_Config_Manage',1,'支付集成设置',NULL,'商城',NULL,'admin','ZKEASOFT','2018-03-22 15:33:03.663000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('ProductCategoryTag_Manage',1,'管理产品标签',NULL,'产品',NULL,'admin','ZKEASOFT','2017-11-11 15:43:52.953000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('ProductCategoryTag_View',1,'查看产品标签',NULL,'产品',NULL,'admin','ZKEASOFT','2017-11-11 15:43:52.947000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('ProductCategory_Manage',1,'管理产品类别',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:28:21.047000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('ProductCategory_View',1,'查看产品类别',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:28:08.737000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Product_Manage',1,'管理产品',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:27:58.400000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Product_Publish',1,'发布产品',NULL,'产品',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.853000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Product_View',1,'查看产品',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:27:41.483000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('RobotsSetting',1,'Robots.txt',NULL,'设置',NULL,'admin','ZKEASOFT','2018-08-12 22:51:30.340000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Role_Manage',1,'管理角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Role_View',1,'查看角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.660000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('SMTPSetting',1,'邮箱设置',NULL,'设置',NULL,'admin','ZKEASOFT','2018-06-12 19:13:49.497000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Theme_Manage',1,'管理主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:42:48.600000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('Theme_View',1,'查看主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.083000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('UrlRedirect_Manage',1,'管理URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.170000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('UrlRedirect_View',1,'查看URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.120000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('User_Manage',1,'管理用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567000','admin','ZKEASOFT','2018-08-15 15:25:42.617000'),('User_View',1,'查看用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647000','admin','ZKEASOFT','2018-08-15 15:25:42.617000');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ImageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ImageThumbUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `BrandCD` int(11) DEFAULT NULL,
  `ProductCategoryID` int(11) DEFAULT NULL,
  `Color` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Price` decimal(19,4) DEFAULT NULL,
  `RebatePrice` decimal(19,4) DEFAULT NULL,
  `PurchasePrice` decimal(19,4) DEFAULT NULL,
  `Norm` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ShelfLife` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ProductContent` longtext CHARACTER SET utf8mb4,
  `Description` longtext CHARACTER SET utf8mb4,
  `IsPublish` tinyint(1) NOT NULL,
  `PublishDate` datetime(6) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `SEOTitle` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SEOKeyWord` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SEODescription` longtext CHARACTER SET utf8mb4,
  `OrderIndex` int(11) DEFAULT NULL,
  `SourceFrom` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Url` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TargetFrom` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TargetUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PartNumber` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Product_ProductCategory` (`ProductCategoryID`),
  CONSTRAINT `FK_Product_ProductCategory` FOREIGN KEY (`ProductCategoryID`) REFERENCES `productcategory` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Cloud Revolver 游戏耳机','http://wx2.sinaimg.cn/mw690/005zTNGqgy1fn25uz5f9gj30bk0bkwek.jpg','http://wx2.sinaimg.cn/mw690/005zTNGqgy1fn25uz5f9gj30bk0bkwek.jpg',NULL,2,NULL,500.0000,399.0000,NULL,NULL,NULL,'<h1>HyperX Cloud Revolver</h1>\r\n<p>如果您热爱游戏，那么一款可为您带来极大优势的耳机就是必不可少的装备。HyperX Cloud Revolver&trade; 是一款优质耳机，工艺精湛，可充分满足高级OC或家用机游戏玩家的需求。新一代驱动器可将低音、中音和高音明确区分开来，形成精准定位的优质音效。Revolver 系列具备立体声和即插即用的 Dolby&reg; 7.1 环绕立体声模式，可提供工作室级别的音场和新一代驱动器，在 FPS 和开放式环境下表现优异。两款耳机均采用结实耐用的实心钢质框架和标志性的 HyperX 记忆海绵，带来屡获殊荣的舒适度。如果您希望拥有无与伦比的舒适度、绝佳的音质和清晰顺畅的沟通，Cloud Revolver 耳机将是您的不二之选。</p>\r\n<h3>即插即用 Dolby&reg; 环绕立体声 7.1&nbsp;</h3>\r\n<p>模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效，无需安装软件或任何设置，即可将音频娱乐变成电影般的体验。<br />可在 Cloud Revolver S 上使用。</p>\r\n<h3>先进的 USB 音频控制盒与 DSP 声卡&nbsp;</h3>\r\n<p>USB 数字处理信号声卡可在任何机器上输出一致的优质音频。卡夹式音频控制盒设计有背光按钮，因此可以即时静音、启用 Dolby 音频，还可在三种预先设置的均衡器之间切换并调整麦克风和音量水平。<br />可在 Cloud Revolver S 上使用。</p>\r\n<h3>新一代 50 毫米驱动器&nbsp;</h3>\r\n<p>与双耳平行的 50mm 定向驱动器精准定位，超强低音效果让声音更加清脆动听。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>\r\n<h3>HyperX 标志性记忆海绵&nbsp;</h3>\r\n<p>屡获殊荣的 HyperX 记忆海绵，带来无与伦比的舒适度，让您更加舒适，更加尽兴地游戏。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>','模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效',1,'2017-11-17 00:00:00.000000',1,NULL,NULL,NULL,NULL,NULL,'Cloud-Revolver',NULL,NULL,'HX-HSCR-BK/AS','admin','ZKEASOFT','2017-11-17 15:18:54.000000','admin','ZKEASOFT','2018-08-15 15:31:28.990000'),(2,'Alloy FPS 机械游戏键盘','http://wx4.sinaimg.cn/mw690/005zTNGqgy1fn25wb061cj30bk0bkjsr.jpg','http://wx4.sinaimg.cn/mw690/005zTNGqgy1fn25wb061cj30bk0bkjsr.jpg',NULL,3,'黑色',500.0000,499.0000,NULL,NULL,NULL,'<h1>小巧便携，随时随地开始 FPS 游戏。</h1>\r\n<p>HyperX&trade; Alloy FPS 键盘结实耐用，性能可靠，给玩家带来卓越的游戏体验。如果您需要一个全尺寸键盘，Alloy FPS 会满足您的所有需求。如果您喜欢 Tenkeyless (TKL) 模式，以便使用大多数基本按键，则 Alloy FPS Pro 键盘可充分满足您的需要。1每个键盘都能满足每位严肃的 FPS 游戏玩家对键盘的所有要求：可靠的 CHERRY&reg; MX 按键开关、实心钢架、可拆卸的线缆、游戏模式、100% 防按键冲突和全键无冲突功能无论您是专业的 FPS 玩家，又或者只是随便玩玩，HyperX Alloy FPS 键盘都可充分满足您的需求。</p>\r\n<h3>极简设计小巧紧凑，是 FPS 游戏的完美搭档&nbsp;</h3>\r\n<p>最大程度节省桌面空间，方便鼠标快速移动</p>\r\n<h3>实心钢架&nbsp;</h3>\r\n<p>可实现耐用性和稳定性。</p>\r\n<h3>CHERRY&reg; MX 机械按键开关可靠耐用&nbsp;</h3>\r\n<p>适用于 CHERRY MX Blue、Brown 或 Red 按键开关，带给您有口皆碑的可靠性和适合您的开关风格。</p>\r\n<h3>超便携设计，带有可拆卸的线缆&nbsp;</h3>\r\n<p>节省存储空间并减少可能的线缆损坏。</p>\r\n<h3>HyperX 红色背光按键，实现动态的灯光效果</h3>\r\n<p>让璀璨的背光彰显您的风格</p>','实心钢架,CHERRY® MX 机械按键开关,带有可拆卸的线缆',1,'2017-11-17 00:00:00.000000',1,NULL,NULL,NULL,NULL,NULL,'Alloy-FPS',NULL,NULL,'HX-KB4RD1-US/R1','admin','ZKEASOFT','2017-11-17 15:30:22.000000','admin','ZKEASOFT','2018-08-15 15:31:22.627000');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productcategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `Url` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,'产品',NULL,0,NULL,1,'admin','ZKEASOFT','2016-03-10 13:49:32.000000','admin','ZKEASOFT','2017-11-17 15:10:08.193000'),(2,'耳机',NULL,1,'headset',1,'admin','ZKEASOFT','2016-03-10 13:49:50.000000','admin','ZKEASOFT','2018-08-15 15:30:59.233000'),(3,'键盘',NULL,1,'keyboard',1,'admin','ZKEASOFT','2016-03-10 13:50:07.000000','admin','ZKEASOFT','2018-08-15 15:31:08.063000');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategorytag`
--

DROP TABLE IF EXISTS `productcategorytag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productcategorytag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategoryId` int(11) DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategorytag`
--

LOCK TABLES `productcategorytag` WRITE;
/*!40000 ALTER TABLE `productcategorytag` DISABLE KEYS */;
INSERT INTO `productcategorytag` VALUES (1,2,'颜色',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:45.550000'),(2,2,'黑色',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:50.530000'),(3,2,'黑古银色',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:11:03.657000'),(4,3,'操作风格',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:07.707000'),(5,3,'点击',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:14.870000'),(6,3,'触觉',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:20.713000'),(7,3,'线性',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:28.660000');
/*!40000 ALTER TABLE `productcategorytag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategorywidget`
--

DROP TABLE IF EXISTS `productcategorywidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productcategorywidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ProductCategoryID` int(11) DEFAULT NULL,
  `TargetPage` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ProductCategoryWidget_ProductCategory` (`ProductCategoryID`),
  CONSTRAINT `FK_ProductCategoryWidget_ProductCategory` FOREIGN KEY (`ProductCategoryID`) REFERENCES `productcategory` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProductCategoryWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategorywidget`
--

LOCK TABLES `productcategorywidget` WRITE;
/*!40000 ALTER TABLE `productcategorywidget` DISABLE KEYS */;
INSERT INTO `productcategorywidget` VALUES ('3466e616139645d2b1e1d9935d231922',1,NULL),('eb7657f5bcbd4e98977a42950936e7ac',1,NULL);
/*!40000 ALTER TABLE `productcategorywidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetailwidget`
--

DROP TABLE IF EXISTS `productdetailwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productdetailwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `CustomerClass` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_ProductDetailWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetailwidget`
--

LOCK TABLES `productdetailwidget` WRITE;
/*!40000 ALTER TABLE `productdetailwidget` DISABLE KEYS */;
INSERT INTO `productdetailwidget` VALUES ('787d9ad849dd40d0905f22ae072d8507',NULL),('94624262dc00460cbbc1e0f51711e712',NULL);
/*!40000 ALTER TABLE `productdetailwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productimage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) DEFAULT NULL,
  `ImageUrl` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimage`
--

LOCK TABLES `productimage` WRITE;
/*!40000 ALTER TABLE `productimage` DISABLE KEYS */;
INSERT INTO `productimage` VALUES (1,1,'http://wx2.sinaimg.cn/mw690/005zTNGqgy1fn25uz5f9gj30bk0bkwek.jpg','HX-HSCR-BK/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.437000','admin','ZKEASOFT','2017-11-17 15:18:54.437000'),(2,1,'http://wx3.sinaimg.cn/mw690/005zTNGqgy1fn25y36ttwj30bk0bk748.jpg','HX-HSCRS-GM/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.463000','admin','ZKEASOFT','2017-11-17 15:18:54.463000'),(3,2,'http://wx4.sinaimg.cn/mw690/005zTNGqgy1fn25wb061cj30bk0bkjsr.jpg',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.987000','admin','ZKEASOFT','2017-11-17 15:30:22.987000'),(5,2,'http://wx1.sinaimg.cn/mw690/005zTNGqgy1fn25zcsm4rj30bk0bkt94.jpg',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.993000','admin','ZKEASOFT','2017-11-17 15:30:22.993000'),(6,2,'http://wx4.sinaimg.cn/mw690/005zTNGqgy1fn25zgfp1cj30bk0bkaa4.jpg',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.993000','admin','ZKEASOFT','2017-11-17 15:30:22.993000'),(7,2,'http://wx3.sinaimg.cn/mw690/005zTNGqgy1fn25zk7mm5j30bk0bkjry.jpg',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.997000','admin','ZKEASOFT','2017-11-17 15:30:22.997000');
/*!40000 ALTER TABLE `productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productlistwidget`
--

DROP TABLE IF EXISTS `productlistwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productlistwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `IsPageable` tinyint(1) NOT NULL,
  `ProductCategoryID` int(11) DEFAULT NULL,
  `DetailPageUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Columns` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PageSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_ProductListWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productlistwidget`
--

LOCK TABLES `productlistwidget` WRITE;
/*!40000 ALTER TABLE `productlistwidget` DISABLE KEYS */;
INSERT INTO `productlistwidget` VALUES ('6bb06e46293c46f084e83751a0832d36',1,1,'~/product/detail','col-xs-6 col-sm-4 col-md-4',9),('e88916cc41b3465b9ae954bafac5f796',1,1,'~/product/detail','col-xs-6 col-sm-4 col-md-4',9);
/*!40000 ALTER TABLE `productlistwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttag`
--

DROP TABLE IF EXISTS `producttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) DEFAULT NULL,
  `TagId` int(11) DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttag`
--

LOCK TABLES `producttag` WRITE;
/*!40000 ALTER TABLE `producttag` DISABLE KEYS */;
INSERT INTO `producttag` VALUES (23,2,7,NULL),(24,2,6,NULL),(25,2,5,NULL),(26,1,3,NULL),(27,1,2,NULL);
/*!40000 ALTER TABLE `producttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'超级管理员','超级管理员',1,NULL,NULL,NULL,'admin','ZKEASOFT','2018-08-15 15:25:42.550000');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scriptwidget`
--

DROP TABLE IF EXISTS `scriptwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scriptwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Script` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_ScriptWidget_CMS_WidgetBase` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scriptwidget`
--

LOCK TABLES `scriptwidget` WRITE;
/*!40000 ALTER TABLE `scriptwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `scriptwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectioncontent`
--

DROP TABLE IF EXISTS `sectioncontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectioncontent` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SectionWidgetId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SectionGroupId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SectionContentType` int(11) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SectionContent_Widget` (`SectionWidgetId`),
  CONSTRAINT `FK_SectionContent_Widget` FOREIGN KEY (`SectionWidgetId`) REFERENCES `sectionwidget` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectioncontent`
--

LOCK TABLES `sectioncontent` WRITE;
/*!40000 ALTER TABLE `sectioncontent` DISABLE KEYS */;
INSERT INTO `sectioncontent` VALUES ('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,7,'admin','ZKEASOFT','2017-10-15 18:11:36.767000','admin','ZKEASOFT','2017-10-15 18:11:36.767000'),('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.800000','admin','ZKEASOFT','2017-10-15 18:11:36.800000'),('1','80f365c7991a49a0b04aa11006018814','1',1,2,'admin',NULL,'2015-09-01 10:09:51.457000','admin',NULL,'2015-09-01 10:12:05.037000'),('105','f41174cfa4d247f4974c47f4d2b000fd','40',4,1,'admin','ZKEASOFT','2016-03-09 21:22:05.273000','admin','ZKEASOFT','2016-03-09 21:22:05.273000'),('106','f41174cfa4d247f4974c47f4d2b000fd','40',3,2,'admin','ZKEASOFT','2016-03-09 21:22:14.723000','admin','ZKEASOFT','2016-03-09 21:22:14.723000'),('107','f41174cfa4d247f4974c47f4d2b000fd','41',4,1,'admin','ZKEASOFT','2016-03-09 21:22:39.543000','admin','ZKEASOFT','2016-03-09 21:22:39.543000'),('108','f41174cfa4d247f4974c47f4d2b000fd','41',3,2,'admin','ZKEASOFT','2016-03-09 21:22:46.500000','admin','ZKEASOFT','2016-03-09 21:22:46.500000'),('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.287000','admin','ZKEASOFT','2016-03-09 21:23:51.287000'),('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.290000','admin','ZKEASOFT','2016-03-09 21:23:51.290000'),('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.293000','admin','ZKEASOFT','2016-03-09 21:23:51.293000'),('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.293000','admin','ZKEASOFT','2016-03-09 21:23:51.293000'),('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',4,1,'admin','ZKEASOFT','2016-03-09 21:24:36.340000','admin','ZKEASOFT','2016-03-09 21:24:36.340000'),('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',3,2,'admin','ZKEASOFT','2016-03-09 21:24:43.533000','admin','ZKEASOFT','2016-03-09 21:24:43.533000'),('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,5,'admin','ZKEASOFT','2017-10-15 18:11:36.760000','admin','ZKEASOFT','2017-10-15 18:11:36.760000'),('13','2b3eb61307d24c50a6b3aaa75db3810e','5',2,1,'admin','ZKEASOFT','2016-03-09 14:07:06.270000','admin','ZKEASOFT','2016-03-09 14:07:06.270000'),('14','2b3eb61307d24c50a6b3aaa75db3810e','5',4,2,'admin','ZKEASOFT','2016-03-09 14:07:14.397000','admin','ZKEASOFT','2016-03-09 14:07:14.397000'),('15','2b3eb61307d24c50a6b3aaa75db3810e','5',3,3,'admin','ZKEASOFT','2016-03-09 14:07:22.330000','admin','ZKEASOFT','2016-03-09 14:07:22.330000'),('16','00f62c5acfe840e0bee3ca2979f0f025','6',2,1,'admin','ZKEASOFT','2016-03-09 14:14:25.737000','admin','ZKEASOFT','2016-03-09 14:14:25.737000'),('163','604b2461f7c545e28dbb21fb15def5c7','2',1,4,'admin','ZKEASOFT','2017-03-19 20:58:41.647000','admin','ZKEASOFT','2017-03-19 20:58:41.647000'),('164','604b2461f7c545e28dbb21fb15def5c7','2',1,7,'admin','ZKEASOFT','2017-03-19 20:59:12.037000','admin','ZKEASOFT','2017-03-19 20:59:12.037000'),('165','80f365c7991a49a0b04aa11006018814','1',3,3,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:02:22.540000'),('17','00f62c5acfe840e0bee3ca2979f0f025','6',4,2,'admin','ZKEASOFT','2016-03-09 14:14:33.683000','admin','ZKEASOFT','2016-03-09 14:14:33.683000'),('18','00f62c5acfe840e0bee3ca2979f0f025','6',3,3,'admin','ZKEASOFT','2016-03-09 14:14:50.897000','admin','ZKEASOFT','2016-03-09 14:14:50.897000'),('19','f6f11ba2fec844de883acf0a1fe3eb89','7',2,1,'admin','ZKEASOFT','2016-03-09 14:15:44.233000','admin','ZKEASOFT','2016-03-09 14:15:44.233000'),('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',1,1,'admin','ZKEASOFT','2017-10-15 17:03:36.227000','admin','ZKEASOFT','2017-10-15 17:03:36.227000'),('20','f6f11ba2fec844de883acf0a1fe3eb89','7',4,2,'admin','ZKEASOFT','2016-03-09 14:15:44.237000','admin','ZKEASOFT','2016-03-09 14:15:44.237000'),('21','f6f11ba2fec844de883acf0a1fe3eb89','7',3,3,'admin','ZKEASOFT','2016-03-09 14:15:44.240000','admin','ZKEASOFT','2016-03-09 14:15:44.240000'),('22','481574ebc98b4cdf9a07e3f20c1ab78d','8',2,1,'admin','ZKEASOFT','2016-03-09 14:15:48.877000','admin','ZKEASOFT','2016-03-09 14:15:48.877000'),('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,4,'admin','ZKEASOFT','2017-10-15 18:11:36.757000','admin','ZKEASOFT','2017-10-15 18:11:36.757000'),('23','481574ebc98b4cdf9a07e3f20c1ab78d','8',4,2,'admin','ZKEASOFT','2016-03-09 14:15:48.877000','admin','ZKEASOFT','2016-03-09 14:15:48.877000'),('24','481574ebc98b4cdf9a07e3f20c1ab78d','8',3,3,'admin','ZKEASOFT','2016-03-09 14:15:48.880000','admin','ZKEASOFT','2016-03-09 14:15:48.880000'),('25','b568ff7f4a894870adaf9afadf787bf9','9',2,1,'admin','ZKEASOFT','2016-03-09 14:21:44.433000','admin','ZKEASOFT','2016-03-09 14:21:44.433000'),('26','b568ff7f4a894870adaf9afadf787bf9','9',3,2,'admin','ZKEASOFT','2016-03-09 14:21:53.837000','admin','ZKEASOFT','2016-03-09 14:21:53.837000'),('27','b568ff7f4a894870adaf9afadf787bf9','10',2,1,'admin','ZKEASOFT','2016-03-09 14:22:35.620000','admin','ZKEASOFT','2016-03-09 14:22:35.620000'),('28','b568ff7f4a894870adaf9afadf787bf9','10',3,2,'admin','ZKEASOFT','2016-03-09 14:24:34.193000','admin','ZKEASOFT','2016-03-09 14:24:34.193000'),('29','55b73e54fd054de4847960bdac350c6d','11',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.580000','admin','ZKEASOFT','2016-03-09 14:33:40.580000'),('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','2',1,6,'admin','ZKEASOFT','2017-10-15 17:18:30.710000','admin','ZKEASOFT','2017-10-15 17:18:30.710000'),('3','604b2461f7c545e28dbb21fb15def5c7','2',1,2,'admin',NULL,'2015-09-01 10:15:07.310000','admin',NULL,'2015-09-01 10:15:07.310000'),('30','55b73e54fd054de4847960bdac350c6d','11',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.580000','admin','ZKEASOFT','2016-03-09 14:33:40.580000'),('31','55b73e54fd054de4847960bdac350c6d','12',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.587000','admin','ZKEASOFT','2016-03-09 14:33:40.587000'),('32','55b73e54fd054de4847960bdac350c6d','12',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.587000','admin','ZKEASOFT','2016-03-09 14:33:40.587000'),('33','55b73e54fd054de4847960bdac350c6d','11',4,2,'admin','ZKEASOFT','2016-03-09 14:34:38.457000','admin','ZKEASOFT','2016-03-09 14:34:38.457000'),('34','55b73e54fd054de4847960bdac350c6d','12',4,2,'admin','ZKEASOFT','2016-03-09 14:34:51.847000','admin','ZKEASOFT','2016-03-09 14:34:51.847000'),('35','ed837392097f4e60b812bc57111dd762','13',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.470000','admin','ZKEASOFT','2016-03-09 14:36:24.470000'),('36','ed837392097f4e60b812bc57111dd762','13',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.470000','admin','ZKEASOFT','2016-03-09 14:36:24.470000'),('37','ed837392097f4e60b812bc57111dd762','14',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.490000','admin','ZKEASOFT','2016-03-09 14:36:24.490000'),('38','ed837392097f4e60b812bc57111dd762','14',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.493000','admin','ZKEASOFT','2016-03-09 14:36:24.493000'),('39','ed837392097f4e60b812bc57111dd762','15',2,1,'admin','ZKEASOFT','2016-03-09 14:38:16.067000','admin','ZKEASOFT','2016-03-09 14:38:16.067000'),('4','604b2461f7c545e28dbb21fb15def5c7','2',1,5,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:18:02.197000'),('40','ed837392097f4e60b812bc57111dd762','15',3,2,'admin','ZKEASOFT','2016-03-09 14:38:27.630000','admin','ZKEASOFT','2016-03-09 14:38:27.630000'),('41','1fb967867e3b440e86336bc5a51e8719','16',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.777000','admin','ZKEASOFT','2016-03-09 14:40:26.777000'),('42','1fb967867e3b440e86336bc5a51e8719','16',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.780000','admin','ZKEASOFT','2016-03-09 14:40:26.780000'),('43','1fb967867e3b440e86336bc5a51e8719','17',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.783000','admin','ZKEASOFT','2016-03-09 14:40:26.783000'),('44','1fb967867e3b440e86336bc5a51e8719','17',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.783000','admin','ZKEASOFT','2016-03-09 14:40:26.783000'),('45','1fb967867e3b440e86336bc5a51e8719','18',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.787000','admin','ZKEASOFT','2016-03-09 14:40:26.787000'),('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,3,'admin','ZKEASOFT','2017-10-15 18:11:36.757000','admin','ZKEASOFT','2017-10-15 18:11:36.757000'),('46','1fb967867e3b440e86336bc5a51e8719','18',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.787000','admin','ZKEASOFT','2016-03-09 14:40:26.787000'),('47','1fb967867e3b440e86336bc5a51e8719','16',4,2,'admin','ZKEASOFT','2016-03-09 14:41:13.710000','admin','ZKEASOFT','2016-03-09 14:41:13.710000'),('48','1fb967867e3b440e86336bc5a51e8719','17',4,2,'admin','ZKEASOFT','2016-03-09 14:42:01.137000','admin','ZKEASOFT','2016-03-09 14:42:01.137000'),('49','1fb967867e3b440e86336bc5a51e8719','18',4,2,'admin','ZKEASOFT','2016-03-09 14:42:20.190000','admin','ZKEASOFT','2016-03-09 14:42:20.190000'),('5','604b2461f7c545e28dbb21fb15def5c7','2',1,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:17:12.377000'),('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',3,3,'admin','ZKEASOFT','2017-10-15 18:11:36.803000','admin','ZKEASOFT','2017-10-15 18:11:36.803000'),('6','604b2461f7c545e28dbb21fb15def5c7','2',1,3,'admin','ZKEASOFT','2016-03-01 10:45:25.393000','admin','ZKEASOFT','2016-03-01 10:45:25.393000'),('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.753000','admin','ZKEASOFT','2017-10-15 18:11:36.753000'),('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.747000','admin','ZKEASOFT','2017-10-15 18:11:36.747000'),('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,6,'admin','ZKEASOFT','2017-10-15 18:11:36.763000','admin','ZKEASOFT','2017-10-15 18:11:36.763000'),('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',3,2,'admin','ZKEASOFT','2017-10-15 18:11:36.783000','admin','ZKEASOFT','2017-10-15 18:11:36.783000'),('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',3,2,'admin','ZKEASOFT','2017-10-15 17:04:41.027000','admin','ZKEASOFT','2017-10-15 17:04:41.027000'),('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.783000','admin','ZKEASOFT','2017-10-15 18:11:36.783000');
/*!40000 ALTER TABLE `sectioncontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectioncontentcalltoaction`
--

DROP TABLE IF EXISTS `sectioncontentcalltoaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectioncontentcalltoaction` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SectionWidgetId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `InnerText` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectioncontentcalltoaction`
--

LOCK TABLES `sectioncontentcalltoaction` WRITE;
/*!40000 ALTER TABLE `sectioncontentcalltoaction` DISABLE KEYS */;
INSERT INTO `sectioncontentcalltoaction` VALUES ('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','许可协议','http://www.zkea.net/licenses'),('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','登录后台','~/admin'),('1','80f365c7991a49a0b04aa11006018814','登录后台','~/admin'),('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms'),('163','604b2461f7c545e28dbb21fb15def5c7','商业授权','http://www.zkea.net/zkeacms/price'),('164','604b2461f7c545e28dbb21fb15def5c7','许可协议','http://www.zkea.net/licenses'),('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','个人中心','/Account'),('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','商业授权','http://www.zkea.net/zkeacms/price'),('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','开发文档','http://www.zkea.net/zkeacms/document'),('3','604b2461f7c545e28dbb21fb15def5c7','GitHub','https://github.com/SeriaWei/ZKEACMS.Core'),('4','604b2461f7c545e28dbb21fb15def5c7','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms'),('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','开源中国','http://git.oschina.net/seriawei/ZKEACMS.Core'),('5','604b2461f7c545e28dbb21fb15def5c7','官方网站','http://www.zkea.net'),('6','604b2461f7c545e28dbb21fb15def5c7','开源中国','http://git.oschina.net/seriawei/ZKEACMS.Core'),('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','GitHub','https://github.com/SeriaWei/ZKEACMS.Core'),('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','官方网站','http://www.zkea.net'),('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','开发文档','http://www.zkea.net/zkeacms/document'),('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','个人中心','/Account');
/*!40000 ALTER TABLE `sectioncontentcalltoaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectioncontentimage`
--

DROP TABLE IF EXISTS `sectioncontentimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectioncontentimage` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SectionWidgetId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ImageSrc` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ImageAlt` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ImageTitle` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectioncontentimage`
--

LOCK TABLES `sectioncontentimage` WRITE;
/*!40000 ALTER TABLE `sectioncontentimage` DISABLE KEYS */;
INSERT INTO `sectioncontentimage` VALUES ('13','2b3eb61307d24c50a6b3aaa75db3810e','~/images/01.jpg',NULL,NULL,NULL,NULL,NULL),('16','00f62c5acfe840e0bee3ca2979f0f025','~/images/02.jpg',NULL,NULL,NULL,NULL,NULL),('19','f6f11ba2fec844de883acf0a1fe3eb89','~/images/04.jpg',NULL,NULL,NULL,NULL,NULL),('22','481574ebc98b4cdf9a07e3f20c1ab78d','~/images/03.jpg',NULL,NULL,NULL,NULL,NULL),('25','b568ff7f4a894870adaf9afadf787bf9','~/images/05.jpg',NULL,NULL,NULL,NULL,NULL),('27','b568ff7f4a894870adaf9afadf787bf9','~/images/06.jpg',NULL,NULL,NULL,NULL,NULL),('29','55b73e54fd054de4847960bdac350c6d','~/images/07.jpg',NULL,NULL,NULL,NULL,NULL),('31','55b73e54fd054de4847960bdac350c6d','~/images/08.jpg',NULL,NULL,NULL,NULL,NULL),('35','ed837392097f4e60b812bc57111dd762','~/images/09.jpg',NULL,NULL,NULL,NULL,NULL),('37','ed837392097f4e60b812bc57111dd762','~/images/10.jpg',NULL,NULL,NULL,NULL,NULL),('39','ed837392097f4e60b812bc57111dd762','~/images/11.jpg',NULL,NULL,NULL,NULL,NULL),('41','1fb967867e3b440e86336bc5a51e8719','~/images/12.jpg',NULL,NULL,NULL,NULL,NULL),('43','1fb967867e3b440e86336bc5a51e8719','~/images/13.jpg',NULL,NULL,NULL,NULL,NULL),('45','1fb967867e3b440e86336bc5a51e8719','~/images/14.jpg',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sectioncontentimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectioncontentparagraph`
--

DROP TABLE IF EXISTS `sectioncontentparagraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectioncontentparagraph` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SectionWidgetId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `HtmlContent` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectioncontentparagraph`
--

LOCK TABLES `sectioncontentparagraph` WRITE;
/*!40000 ALTER TABLE `sectioncontentparagraph` DISABLE KEYS */;
INSERT INTO `sectioncontentparagraph` VALUES ('106','f41174cfa4d247f4974c47f4d2b000fd','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a>是基于<a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>\r\n<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>\r\n<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>\r\n<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>'),('108','f41174cfa4d247f4974c47f4d2b000fd','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a>是基于<a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>\r\n<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>\r\n<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>\r\n<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>'),('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>\r\n<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>\r\n<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>\r\n<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),('15','2b3eb61307d24c50a6b3aaa75db3810e','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>\r\n<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),('165','80f365c7991a49a0b04aa11006018814','<p>用户名,密码:admin</p>'),('18','00f62c5acfe840e0bee3ca2979f0f025','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>\r\n<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),('21','f6f11ba2fec844de883acf0a1fe3eb89','<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>\r\n<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>'),('24','481574ebc98b4cdf9a07e3f20c1ab78d','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>\r\n<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>'),('26','b568ff7f4a894870adaf9afadf787bf9','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),('28','b568ff7f4a894870adaf9afadf787bf9','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),('30','55b73e54fd054de4847960bdac350c6d','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),('32','55b73e54fd054de4847960bdac350c6d','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),('36','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>'),('38','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>'),('40','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>'),('42','1fb967867e3b440e86336bc5a51e8719','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>'),('44','1fb967867e3b440e86336bc5a51e8719','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>'),('46','1fb967867e3b440e86336bc5a51e8719','<p><span>我国汽车工业的现状喜忧参半，</span><span>展望我国汽车工业的未来风险与机遇并存。</span></p>'),('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','<p>用户名,密码:admin</p>'),('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','<p>前端用户注册，用户管理</p>'),('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','<p>前端用户注册，用户管理</p>');
/*!40000 ALTER TABLE `sectioncontentparagraph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectioncontenttitle`
--

DROP TABLE IF EXISTS `sectioncontenttitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectioncontenttitle` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SectionWidgetId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `InnerText` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TitleLevel` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectioncontenttitle`
--

LOCK TABLES `sectioncontenttitle` WRITE;
/*!40000 ALTER TABLE `sectioncontenttitle` DISABLE KEYS */;
INSERT INTO `sectioncontenttitle` VALUES ('105','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL),('107','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL),('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL),('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL),('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL),('14','2b3eb61307d24c50a6b3aaa75db3810e','WHY CHOOSE US?',NULL,NULL),('17','00f62c5acfe840e0bee3ca2979f0f025','WHY CHOOSE US?',NULL,NULL),('20','f6f11ba2fec844de883acf0a1fe3eb89','WHY CHOOSE US?',NULL,NULL),('23','481574ebc98b4cdf9a07e3f20c1ab78d','WHY CHOOSE US?',NULL,NULL),('33','55b73e54fd054de4847960bdac350c6d','建筑业',NULL,NULL),('34','55b73e54fd054de4847960bdac350c6d','能源化工',NULL,NULL),('47','1fb967867e3b440e86336bc5a51e8719','建筑业',NULL,NULL),('48','1fb967867e3b440e86336bc5a51e8719','能源化工',NULL,NULL),('49','1fb967867e3b440e86336bc5a51e8719','汽车业',NULL,NULL);
/*!40000 ALTER TABLE `sectioncontenttitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectioncontentvideo`
--

DROP TABLE IF EXISTS `sectioncontentvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectioncontentvideo` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `VideoTitle` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Thumbnail` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SectionWidgetId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Width` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Url` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Code` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectioncontentvideo`
--

LOCK TABLES `sectioncontentvideo` WRITE;
/*!40000 ALTER TABLE `sectioncontentvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sectioncontentvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectiongroup`
--

DROP TABLE IF EXISTS `sectiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectiongroup` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `GroupName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SectionWidgetId` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `PartialView` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `PercentWidth` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SectionGroup_SectionGroup_Template` (`PartialView`),
  KEY `FK_SectionGroup_SectionWidget` (`SectionWidgetId`),
  CONSTRAINT `FK_SectionGroup_SectionGroup_Template` FOREIGN KEY (`PartialView`) REFERENCES `sectiontemplate` (`TemplateName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SectionGroup_SectionWidget` FOREIGN KEY (`SectionWidgetId`) REFERENCES `sectionwidget` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectiongroup`
--

LOCK TABLES `sectiongroup` WRITE;
/*!40000 ALTER TABLE `sectiongroup` DISABLE KEYS */;
INSERT INTO `sectiongroup` VALUES ('0015be62210742c083c3a9dad4b72fb5','组1','e0783dbbcc564322a1f2e3ca2833dbd4','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.740000','admin','ZKEASOFT','2017-10-15 18:11:36.740000',NULL),('1','组1','80f365c7991a49a0b04aa11006018814','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('10','右','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),('11','左','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),('12','右','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),('13','左','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('14','中','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('15','右','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('16','左','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('17','中','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('18','右','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('2','组1','604b2461f7c545e28dbb21fb15def5c7','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('40','左','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),('41','右','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),('42','左','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('43','右','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('44','中','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),('5','G1','2b3eb61307d24c50a6b3aaa75db3810e','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('50082fd30e01404fbb4fe6101353b1d5','组1','88ab49212dee47bba878a52bec86f501','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.800000','admin','ZKEASOFT','2017-10-15 18:11:36.800000',NULL),('6','G1','00f62c5acfe840e0bee3ca2979f0f025','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('7','G1','f6f11ba2fec844de883acf0a1fe3eb89','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8','G1','481574ebc98b4cdf9a07e3f20c1ab78d','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('80cb176412cf457a81ae7a1f9fa33ef6','组1','7f77f09c3fcd4d498a4aa3b1c9508d7d','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 17:03:17.247000','admin','ZKEASOFT','2017-10-15 17:03:17.247000',''),('9','左','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),('9ce2c15af93c4fd782e17a1e7e35963f','组1','7e7a1d5b8d644333a7b3341509fc960f','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 18:11:36.780000','admin','ZKEASOFT','2017-10-15 18:11:36.780000','');
/*!40000 ALTER TABLE `sectiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectiontemplate`
--

DROP TABLE IF EXISTS `sectiontemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectiontemplate` (
  `TemplateName` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Thumbnail` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ExampleData` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`TemplateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectiontemplate`
--

LOCK TABLES `sectiontemplate` WRITE;
/*!40000 ALTER TABLE `sectiontemplate` DISABLE KEYS */;
INSERT INTO `sectiontemplate` VALUES ('SectionTemplate.Column','左右','Thumbnail\\SectionTemplate.Column.png','Thumbnail\\SectionTemplate.Column.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('SectionTemplate.Default','默认','Thumbnail\\SectionTemplate.Default.png','Thumbnail\\SectionTemplate.Default.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('SectionTemplate.ImageRight','图片右','Thumbnail\\SectionTemplate.ImageRight.png','Thumbnail\\SectionTemplate.ImageRight.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('SectionTemplate.LinkGroup','链接组','Thumbnail\\SectionTemplate.LinkGroup.png','Thumbnail\\SectionTemplate.LinkGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('SectionTemplate.ListGroup','列表组','Thumbnail\\SectionTemplate.ListGroup.png','Thumbnail\\SectionTemplate.ListGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('SectionTemplate.ListView','媒体列表','Thumbnail\\SectionTemplate.ListView.png','Thumbnail\\SectionTemplate.ListView.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('SectionTemplate.Thumbnail','缩略图','Thumbnail\\SectionTemplate.Thumbnail.png','Thumbnail\\SectionTemplate.Thumbnail.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sectiontemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectionwidget`
--

DROP TABLE IF EXISTS `sectionwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectionwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SectionTitle` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsHorizontal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_SectionWidget_CMS_WidgetBase` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectionwidget`
--

LOCK TABLES `sectionwidget` WRITE;
/*!40000 ALTER TABLE `sectionwidget` DISABLE KEYS */;
INSERT INTO `sectionwidget` VALUES ('00f62c5acfe840e0bee3ca2979f0f025',NULL,NULL),('0f66ab8ff0df44e2b5e57fd8d8c5d8ff',NULL,NULL),('1fb967867e3b440e86336bc5a51e8719',NULL,NULL),('2b3eb61307d24c50a6b3aaa75db3810e',NULL,NULL),('481574ebc98b4cdf9a07e3f20c1ab78d',NULL,NULL),('55b73e54fd054de4847960bdac350c6d',NULL,NULL),('604b2461f7c545e28dbb21fb15def5c7','相关链接',NULL),('7e7a1d5b8d644333a7b3341509fc960f',NULL,NULL),('7f77f09c3fcd4d498a4aa3b1c9508d7d',NULL,NULL),('80f365c7991a49a0b04aa11006018814','管理',NULL),('88ab49212dee47bba878a52bec86f501','管理',NULL),('b568ff7f4a894870adaf9afadf787bf9',NULL,NULL),('e0783dbbcc564322a1f2e3ca2833dbd4','相关链接',NULL),('ed837392097f4e60b812bc57111dd762',NULL,NULL),('f41174cfa4d247f4974c47f4d2b000fd',NULL,NULL),('f6f11ba2fec844de883acf0a1fe3eb89',NULL,NULL);
/*!40000 ALTER TABLE `sectionwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stylesheetwidget`
--

DROP TABLE IF EXISTS `stylesheetwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stylesheetwidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `StyleSheet` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_StyleSheetWidget_CMS_WidgetBase` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stylesheetwidget`
--

LOCK TABLES `stylesheetwidget` WRITE;
/*!40000 ALTER TABLE `stylesheetwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `stylesheetwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrolerelation`
--

DROP TABLE IF EXISTS `userrolerelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrolerelation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) DEFAULT NULL,
  `UserID` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_UserRoleRelation_Users` (`UserID`),
  KEY `FK_UserRoleRelation_Roles` (`RoleID`),
  CONSTRAINT `FK_UserRoleRelation_Roles` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserRoleRelation_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrolerelation`
--

LOCK TABLES `userrolerelation` WRITE;
/*!40000 ALTER TABLE `userrolerelation` DISABLE KEYS */;
INSERT INTO `userrolerelation` VALUES (5,1,'admin');
/*!40000 ALTER TABLE `userrolerelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `PassWord` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ApiLoginToken` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastLoginDate` datetime(6) DEFAULT NULL,
  `LoginIP` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PhotoUrl` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Timestamp` bigint(20) DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `UserTypeCD` int(11) DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Birthday` datetime(6) DEFAULT NULL,
  `Birthplace` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `EnglishName` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Hobby` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `MaritalStatus` int(11) DEFAULT NULL,
  `MobilePhone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `NickName` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Profession` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `QQ` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `School` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Sex` int(11) DEFAULT NULL,
  `Telephone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ZipCode` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreatebyName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CreateDate` datetime(6) DEFAULT NULL,
  `LastUpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateByName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LastUpdateDate` datetime(6) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ResetToken` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ResetTokenDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',NULL,'2018-08-15 15:30:40.430000','::1','~/images/head.png',0,'ZKEASOFT',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Admin',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'admin','Admin','2018-08-15 15:30:40.553000',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videowidget`
--

DROP TABLE IF EXISTS `videowidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videowidget` (
  `ID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Width` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Url` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Code` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_VideoWidget_CMS_WidgetBase` FOREIGN KEY (`ID`) REFERENCES `cms_widgetbase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videowidget`
--

LOCK TABLES `videowidget` WRITE;
/*!40000 ALTER TABLE `videowidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `videowidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-15 15:43:24
