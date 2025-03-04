/* https://github.com/SeriaWei/mssql2mysql */


CREATE DATABASE  IF NOT EXISTS `ZKEACMS` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ZKEACMS`;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `ApplicationSetting`;
CREATE TABLE `ApplicationSetting` (
	`SettingKey` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`Value` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
('Animation_Widget_FadeInUp','false',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:10.083',NULL,NULL,'2022-07-29 20:42:10.083'),
('EnableCustomerAccount','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:31.003',NULL,NULL,'2022-07-29 20:42:31.003'),
('EnableResponsiveDesign','true',NULL,NULL,1,NULL,NULL,'2020-03-14 11:32:07.333',NULL,NULL,'2020-03-14 11:32:07.333'),
('ExpandAllPage','true',NULL,NULL,1,'admin','ZKEASOFT','2018-04-11 17:01:47.230','admin','ZKEASOFT','2018-04-11 17:01:47.233'),
('Favicon','~/favicon.ico',NULL,NULL,NULL,'admin','ZKEASOFT','2017-03-19 20:57:33.626','admin','ZKEASOFT','2017-03-19 20:57:33.626'),
('OuterChainPicture','false',NULL,NULL,1,NULL,NULL,'2019-07-31 12:09:28.430',NULL,NULL,'2019-07-31 12:09:28.430'),
('PinNavigation','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:10.386',NULL,NULL,'2022-07-29 20:42:10.386'),
('SiteInformation_Logo_Mini','/images/logo_min.png',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.370','admin','ZKEASOFT','2021-03-06 22:16:20.370'),
('SiteInformation_SiteName','ZKEASOFT',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.310','admin','ZKEASOFT','2021-03-06 22:16:20.310'),
('UseImageCaptcha','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:39.536',NULL,NULL,'2022-07-29 20:42:39.536');
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
(1,'Introduction to ZKEACMS','ZKEACMS is an open-source .Net CMS developed using ASP.NET MVC. ZKEACMS is a content management system.','ZKEACMS','ZKEACMS is an open-source .Net CMS developed using ASP.NET MVC. ZKEACMS is a content management system.',1,2,NULL,'<h3>Introduction</h3>
<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a> is an open-source .Net CMS developed using ASP .NET MVC based on <a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>.</p>
<p>ZKEACMS is a content management system. ZKEACMS not only manages content but also redefines layout, pages, and components, allowing users to freely plan the layout, pages, and content of the page.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, and allows direct design of pages on the preview page.</p>
<p>ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>
<h4><a href=\"http://www.zkea.net/zkeacms/createpage\" target=\"_blank\" rel=\"noopener\">Learn about our design philosophy</a></h4>
<h3>Development Environment</h3>
<p>Microsoft VisualStudio 2013</p>
<p><span>.Net 9</span></p>
<p>Microsoft Sql Server 2016 and above</p>
<h3>Intuitive Design</h3>
<p>ZKEACMS is an open-source CMS based on ASP.NET MVC, and WYSIWYG is a major feature of ZKEACMS.</p>
<p>Adding new pages or directly designing, editing, and adding content on existing pages is very simple.</p>
<p>With rich components and templates, as long as you can operate a computer, you can design a website.</p>
<h3>Easy Operation</h3>
<p>ZKEACMS adopts drag-and-drop operation design, simple and intuitive, directly dragging the template you see and like into the page.</p>
<p>In key places of user interaction, there will be prompts or previews, and ZKEASOFT provides detailed <a href=\"http://www.zkea.net/zkeacms/document\" target=\"_blank\" rel=\"noopener\">documentation</a></p>
<h3>Mobile Friendly</h3>
<p>ZKEACMS themes are designed based on the popular BootStrap, adopting modern responsive design, which can automatically adapt to different screen sizes and devices.</p>
<p>From PC, laptop, TV, tablet to mobile phone, the page will automatically respond and adapt.</p>
<h3>Layout Design</h3>
<p>Layout is used to divide the page into areas. Users use drag-and-drop \"rows\" and \"columns\" to design the layout. The layout division adopts rows and columns, which can be nested.</p>
<p>In a layout, you can add any number of rows, each row is divided into 12 equal parts for the grid, and can be divided into up to 12 columns. After the row and column division is completed, you need to add \"component areas\" in the columns to add components to the column.</p>
<h3>Overview Design</h3>
<p>The overview page is a thumbnail display of the page. In this page, users can directly see the layout of the page and the components in the page.</p>
<p>In the overview page, users can add components to any area. You can sort or drag and drop components in any area to another area for display.</p>
<h3>Extensibility</h3>
<p>ZKEACMS is designed with content and templates separated, allowing different display effects by switching templates without switching themes.</p>
<p>By continuously adding templates, the webpage becomes more diverse and modern.</p>
<p><span>ZKEACMS is designed with a plugin system, allowing new features to be obtained by continuously adding plugins. The default plugins are sufficient for daily use.</span></p>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:41:19.000','zkeacms','admin','ZKEASOFT','2017-11-19 23:41:19.000','admin','ZKEASOFT','2019-04-24 21:52:43.060'),
(2,'ZKEACMS For .Net Core','ZKEACMS Core is a full-featured implementation of ZKEACMS for .Net Core, achieving cross-platform with .Net Core, allowing you to run on Windows, MAC OS, Linux, Docker.','ZKEACMS .Net Core','ZKEACMS Core is a full-featured implementation of ZKEACMS for .Net Core, achieving cross-platform with .Net Core, allowing you to run on Windows, MAC OS, Linux, Docker.',1,3,NULL,'<h3>Full-featured Migration</h3>
<p>ZKEACMS Core is a full-featured implementation of ZKEACMS for .Net Core, achieving cross-platform with .Net Core, allowing you to run on Windows, MAC OS, Linux, Docker.</p>
<p>Currently, ZKEACMS Core has been officially released. It has all the features of ZKEACMS and is even better, performing better in all aspects such as performance. We recommend you use it.</p>
<p><img src=\"http://ww4.sinaimg.cn/mw690/005zTNGqgw1f5e6o2kejlg30dw08an3g.gif\" /></p>
<h3>Based on .NET Core</h3>
<p>.NET Core is the new generation version of .NET Framework, the first official version developed by Microsoft, an application framework with cross-platform (Windows, Mac OSX, Linux) capabilities. It will also support FreeBSD and Alpine platforms in the future. It is also an open-source software platform developed by Microsoft from the beginning, often compared with the existing open-source .NET platform Mono.</p>
<p>ZKEACMS Core is redesigned based on ASP .NET MVC Core. ZKEACMS v2.3 uses the earlier MVC4, now you can use all the new features of MVC Core, such as tag helper, etc., allowing you to fully utilize the advantages of cross-platform, with impressive performance and high reliability. Developers can quickly and directly obtain the .NET Core development environment.</p>
<h3>Redesign</h3>
<p>Due to the revolution of .Net Core, ZKEACMS Core has redesigned the underlying to adapt to ASP .NET Core. Although the underlying has been redesigned, ZKEASOFT still tries to ensure the completeness of the CMS functions of the Core version, and resources can be shared between the two versions.</p>
<p>The redesigned .Net core CMS will further reduce your entry cost. If you are familiar with ZKEACMS before, you can immediately start the development work of ZKEACMS Core.</p>
<h3>Entity Framework Core</h3>
<p>Entity Framework Core is the .Net Core version of Entity Framework. Entity Framework is an object-relational mapping (O/R Mapping) solution developed by Microsoft based on ADO.NET. Using Entity Framework, you can easily switch to different database instances, such as SQLServer, MySql, ORACLE, SQLite, etc.</p>
<p>ZKEACMS Core abandons the ORM system in EasyFramework and uses Entity Framework Core as the database access, reducing the learning and entry cost. With Entity Framework, you can quickly get started and easily choose different databases.</p>
<h3>Hot-pluggable Plugin Mechanism</h3>
<p>ZKEACMS Core has redesigned the plugin mechanism, separating each component assembly (DLL), making it more convenient for the independence and isolation of each component. As a result, hot-plugging of plugins has become possible.</p>
<p>Based on the plugin design, your program can be infinitely horizontally expanded, and functions can become richer without modifying the core functions.</p>
<div>
<div>
<div>
<div>
<p></p>
</div>
</div>
</div>
</div>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:53:23.000','zkeacms-core','admin','ZKEASOFT','2017-11-19 23:53:16.000','admin','ZKEASOFT','2019-04-24 21:52:54.903');
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
('3aa8b53e7ad143ff818855a7abcb3fdd',NULL),
('e8fd1019bab045e5927ec30abaaa1aba',NULL);
/*!40000 ALTER TABLE `ArticleDetailWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `ArticleGallery`;
CREATE TABLE `ArticleGallery` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`RawData` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


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
('416c5402962b41548c83fabaa5492b42',1,'~/article/detail',1,5),
('ca9f8809636d448cbd4f3beb418465b3',1,'~/article/detail',1,5);
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

/*!40000 ALTER TABLE `ArticleSummaryWidget` DISABLE KEYS */;
INSERT INTO `ArticleSummaryWidget` VALUES
('8c5b69f614b641c0a5f7a8e318de8df3','Introduction to ZKEACMS','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\" target=\"_blank\" rel=\"noopener\">ZKEACMS</a> Core is an open-source CMS developed based on .Net Core. Before you start using it, to protect your rights, please first check our open-source license <a href=\"http://www.zkea.net/licenses\" target=\"_blank\" rel=\"noopener\">http://www.zkea.net/licenses</a>.</p>
<p>ZKEACMS is a content management software. The main purpose of ZKEACMS is to quickly create pages and customize page content. Whether you are a professional developer or an ordinary user, you can quickly get started with ZKEACMS.</p>
<p>ZKEACMS uses visual editing design, WYSIWYG, and you can directly design the page you want on the page.</p>
<p>Setup environment: .Net Core 2.0</p>
<h3>Flagship Version</h3>
<p>Experience address: <a href=\"http://demo.zkea.net\" target=\"_blank\" rel=\"noopener\">http://demo.zkea.net</a></p>
<h3>Website Building System</h3>
<p>Cloud website building system based on ZKEACMS</p>
<p><a href=\"http://www.zkea.net/cloud\" target=\"_blank\" rel=\"noopener\">http://www.zkea.net/cloud</a></p>
<p></p>'),
('cd21a7bf68b44f6e8d178b153288a26e','Introduction to ZKEACMS','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\" target=\"_blank\" rel=\"noopener\">ZKEACMS</a> Core is an open-source CMS developed based on .Net Core. Before you start using it, to protect your rights, please first check our open-source license <a href=\"http://www.zkea.net/licenses\" target=\"_blank\" rel=\"noopener\">http://www.zkea.net/licenses</a>.</p>
<p>ZKEACMS is a content management software. The main purpose of ZKEACMS is to quickly create pages and customize page content. Whether you are a professional developer or an ordinary user, you can quickly get started with ZKEACMS.</p>
<p>ZKEACMS uses visual editing design, WYSIWYG, and you can directly design the page you want on the page.</p>
<p>Setup environment: .Net Core 2.0</p>
<h3>Flagship Version</h3>
<p>Experience address: <a href=\"http://demo.zkea.net\" target=\"_blank\" rel=\"noopener\">http://demo.zkea.net</a></p>
<h3>Website Building System</h3>
<p>Cloud website building system based on ZKEACMS</p>
<p><a href=\"http://www.zkea.net/cloud\" target=\"_blank\" rel=\"noopener\">http://www.zkea.net/cloud</a></p>
<p></p>');
/*!40000 ALTER TABLE `ArticleSummaryWidget` ENABLE KEYS */;

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
	`DisplayOrder` INT  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `ArticleType` DISABLE KEYS */;
INSERT INTO `ArticleType` VALUES
(1,'News',NULL,0,'news',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:18.000','admin','ZKEASOFT','2024-11-16 13:53:08.751',NULL),
(2,'Company',NULL,1,'company',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:24.000','admin','ZKEASOFT','2018-08-15 15:31:38.346',NULL),
(3,'Industry',NULL,1,'industry',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:29.000','admin','ZKEASOFT','2018-08-15 15:31:42.810',NULL);
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

/*!40000 ALTER TABLE `ArticleTypeWidget` DISABLE KEYS */;
INSERT INTO `ArticleTypeWidget` VALUES
('8df64186d2fd4d63a9f9bb3b6e34cd2a',1,NULL),
('de8d94fd51cb4e73b00518dbb2f134d3',1,NULL);
/*!40000 ALTER TABLE `ArticleTypeWidget` ENABLE KEYS */;

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
(1,'Sample',NULL,NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.203','admin','ZKEASOFT','2016-03-27 15:17:54.050');
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
(1,'Image 1',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg1.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.216','admin','ZKEASOFT','2016-03-27 15:17:54.053'),
(2,'Image 2',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg2.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.570','admin','ZKEASOFT','2016-03-27 15:17:54.420'),
(3,'Image 3',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg3.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.573','admin','ZKEASOFT','2016-03-27 15:17:54.433');
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

/*!40000 ALTER TABLE `CarouselWidget` DISABLE KEYS */;
INSERT INTO `CarouselWidget` VALUES
('19350341920b4827bf2a4e458ad24a58',1),
('41e075ab1b89453388494a539eec55b9',1);
/*!40000 ALTER TABLE `CarouselWidget` ENABLE KEYS */;

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
('0846a33e56bf45d5aae602ef40d87444','Other',NULL,'container',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:06:44.200','admin','ZKEASOFT','2016-03-10 21:06:44.200','~/images/layout.jpg','~/images/layout.jpg','Default'),
('1dae90cf6a8547538cc0c369b9943c01','Default',NULL,'container',1,NULL,NULL,NULL,'admin',NULL,'2015-08-31 11:56:31.750','admin',NULL,'2015-08-31 11:56:31.750','~/images/layout.jpg','~/images/layout.jpg','Default');
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
(219,'0846a33e56bf45d5aae602ef40d87444',NULL,'<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.063','admin','ZKEASOFT','2017-11-19 17:48:11.063'),
(220,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.333','admin','ZKEASOFT','2017-11-19 17:48:11.333'),
(221,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:11.336','admin','ZKEASOFT','2017-11-19 17:48:11.336'),
(222,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.340','admin','ZKEASOFT','2017-11-19 17:48:11.340'),
(223,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.346','admin','ZKEASOFT','2017-11-19 17:48:11.346'),
(224,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.350','admin','ZKEASOFT','2017-11-19 17:48:11.350'),
(225,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:11.353','admin','ZKEASOFT','2017-11-19 17:48:11.353'),
(226,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.356','admin','ZKEASOFT','2017-11-19 17:48:11.356'),
(227,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.370','admin','ZKEASOFT','2017-11-19 17:48:11.370'),
(228,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.373','admin','ZKEASOFT','2017-11-19 17:48:11.373'),
(229,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:11.646','admin','ZKEASOFT','2017-11-19 17:48:11.646'),
(230,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.650','admin','ZKEASOFT','2017-11-19 17:48:11.650'),
(231,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.650','admin','ZKEASOFT','2017-11-19 17:48:11.650'),
(232,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.666','admin','ZKEASOFT','2017-11-19 17:48:11.666'),
(233,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:11.950','admin','ZKEASOFT','2017-11-19 17:48:11.950'),
(234,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.983','admin','ZKEASOFT','2017-11-19 17:48:11.983'),
(235,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:11.986','admin','ZKEASOFT','2017-11-19 17:48:11.986'),
(236,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:12.223','admin','ZKEASOFT','2017-11-19 17:48:12.223'),
(237,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:12.270','admin','ZKEASOFT','2017-11-19 17:48:12.270'),
(238,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:12.500','admin','ZKEASOFT','2017-11-19 17:48:12.500'),
(239,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:12.756','admin','ZKEASOFT','2017-11-19 17:48:12.756'),
(240,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:39.996','admin','ZKEASOFT','2017-11-19 17:48:39.996'),
(241,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.013','admin','ZKEASOFT','2017-11-19 17:48:40.013'),
(242,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:40.016','admin','ZKEASOFT','2017-11-19 17:48:40.016'),
(243,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.023','admin','ZKEASOFT','2017-11-19 17:48:40.023'),
(244,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:40.023','admin','ZKEASOFT','2017-11-19 17:48:40.023'),
(245,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.026','admin','ZKEASOFT','2017-11-19 17:48:40.026'),
(246,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:40.026','admin','ZKEASOFT','2017-11-19 17:48:40.026'),
(247,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030'),
(248,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030'),
(249,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030'),
(250,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:40.043','admin','ZKEASOFT','2017-11-19 17:48:40.043'),
(251,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.043','admin','ZKEASOFT','2017-11-19 17:48:40.043'),
(252,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:40.046','admin','ZKEASOFT','2017-11-19 17:48:40.046'),
(253,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.046','admin','ZKEASOFT','2017-11-19 17:48:40.046'),
(254,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:40.046','admin','ZKEASOFT','2017-11-19 17:48:40.046'),
(255,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.053','admin','ZKEASOFT','2017-11-19 17:48:40.053'),
(256,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>
    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2017-11-19 17:48:40.056','admin','ZKEASOFT','2017-11-19 17:48:40.056'),
(257,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.056','admin','ZKEASOFT','2017-11-19 17:48:40.056'),
(258,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:40.063','admin','ZKEASOFT','2017-11-19 17:48:40.063'),
(259,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.063','admin','ZKEASOFT','2017-11-19 17:48:40.063'),
(260,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:40.073','admin','ZKEASOFT','2017-11-19 17:48:40.073'),
(261,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.053','admin','ZKEASOFT','2018-05-21 23:42:40.053'),
(262,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.110','admin','ZKEASOFT','2018-05-21 23:42:40.110'),
(263,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-0','admin','ZKEASOFT','2018-05-21 23:42:40.113','admin','ZKEASOFT','2018-05-21 23:42:40.113'),
(264,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.113','admin','ZKEASOFT','2018-05-21 23:42:40.113'),
(265,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.116','admin','ZKEASOFT','2018-05-21 23:42:40.116'),
(266,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.116','admin','ZKEASOFT','2018-05-21 23:42:40.116'),
(267,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-1','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120'),
(268,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120'),
(269,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120'),
(270,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.123','admin','ZKEASOFT','2018-05-21 23:42:40.123'),
(271,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-2','admin','ZKEASOFT','2018-05-21 23:42:40.123','admin','ZKEASOFT','2018-05-21 23:42:40.123'),
(272,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.126','admin','ZKEASOFT','2018-05-21 23:42:40.126'),
(273,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.126','admin','ZKEASOFT','2018-05-21 23:42:40.126'),
(274,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.130','admin','ZKEASOFT','2018-05-21 23:42:40.130'),
(275,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-3','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133'),
(276,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133'),
(277,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>
    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133'),
(278,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.136','admin','ZKEASOFT','2018-05-21 23:42:40.136'),
(279,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-4','admin','ZKEASOFT','2018-05-21 23:42:40.136','admin','ZKEASOFT','2018-05-21 23:42:40.136'),
(280,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.140','admin','ZKEASOFT','2018-05-21 23:42:40.140'),
(281,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:42:40.140','admin','ZKEASOFT','2018-05-21 23:42:40.140'),
(282,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:54.990','admin','ZKEASOFT','2018-05-21 23:45:54.990'),
(283,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.003','admin','ZKEASOFT','2018-05-21 23:45:55.003'),
(284,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-0','admin','ZKEASOFT','2018-05-21 23:45:55.006','admin','ZKEASOFT','2018-05-21 23:45:55.006'),
(285,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.010','admin','ZKEASOFT','2018-05-21 23:45:55.010'),
(286,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:55.013','admin','ZKEASOFT','2018-05-21 23:45:55.013'),
(287,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.013','admin','ZKEASOFT','2018-05-21 23:45:55.013'),
(288,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-1','admin','ZKEASOFT','2018-05-21 23:45:55.020','admin','ZKEASOFT','2018-05-21 23:45:55.020'),
(289,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.023','admin','ZKEASOFT','2018-05-21 23:45:55.023'),
(290,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:55.033','admin','ZKEASOFT','2018-05-21 23:45:55.033'),
(291,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.036','admin','ZKEASOFT','2018-05-21 23:45:55.036'),
(292,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-2','admin','ZKEASOFT','2018-05-21 23:45:55.050','admin','ZKEASOFT','2018-05-21 23:45:55.050'),
(293,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.050','admin','ZKEASOFT','2018-05-21 23:45:55.050'),
(294,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:55.053','admin','ZKEASOFT','2018-05-21 23:45:55.053'),
(295,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.060','admin','ZKEASOFT','2018-05-21 23:45:55.060'),
(296,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-3','admin','ZKEASOFT','2018-05-21 23:45:55.063','admin','ZKEASOFT','2018-05-21 23:45:55.063'),
(297,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.066','admin','ZKEASOFT','2018-05-21 23:45:55.066'),
(298,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>
    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:45:55.070','admin','ZKEASOFT','2018-05-21 23:45:55.070'),
(299,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.070','admin','ZKEASOFT','2018-05-21 23:45:55.070'),
(300,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-4','admin','ZKEASOFT','2018-05-21 23:45:55.073','admin','ZKEASOFT','2018-05-21 23:45:55.073'),
(301,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.076','admin','ZKEASOFT','2018-05-21 23:45:55.076'),
(302,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:45:55.086','admin','ZKEASOFT','2018-05-21 23:45:55.086'),
(303,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.366','admin','ZKEASOFT','2018-05-21 23:46:09.366'),
(304,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.373','admin','ZKEASOFT','2018-05-21 23:46:09.373'),
(305,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:09.380','admin','ZKEASOFT','2018-05-21 23:46:09.380'),
(306,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.380','admin','ZKEASOFT','2018-05-21 23:46:09.380'),
(307,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.383','admin','ZKEASOFT','2018-05-21 23:46:09.383'),
(308,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.383','admin','ZKEASOFT','2018-05-21 23:46:09.383'),
(309,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:09.386','admin','ZKEASOFT','2018-05-21 23:46:09.386'),
(310,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.390','admin','ZKEASOFT','2018-05-21 23:46:09.390'),
(311,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.393','admin','ZKEASOFT','2018-05-21 23:46:09.393'),
(312,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.393','admin','ZKEASOFT','2018-05-21 23:46:09.393'),
(313,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:09.396','admin','ZKEASOFT','2018-05-21 23:46:09.396'),
(314,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.396','admin','ZKEASOFT','2018-05-21 23:46:09.396'),
(315,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.400','admin','ZKEASOFT','2018-05-21 23:46:09.400'),
(316,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.400','admin','ZKEASOFT','2018-05-21 23:46:09.400'),
(317,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:09.406','admin','ZKEASOFT','2018-05-21 23:46:09.406'),
(318,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.410','admin','ZKEASOFT','2018-05-21 23:46:09.410'),
(319,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:09.416','admin','ZKEASOFT','2018-05-21 23:46:09.416'),
(320,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.420','admin','ZKEASOFT','2018-05-21 23:46:09.420'),
(321,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:09.423','admin','ZKEASOFT','2018-05-21 23:46:09.423'),
(322,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.426','admin','ZKEASOFT','2018-05-21 23:46:09.426'),
(323,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:09.426','admin','ZKEASOFT','2018-05-21 23:46:09.426'),
(324,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.003','admin','ZKEASOFT','2018-05-21 23:46:13.003'),
(325,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.010','admin','ZKEASOFT','2018-05-21 23:46:13.010'),
(326,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:13.010','admin','ZKEASOFT','2018-05-21 23:46:13.010'),
(327,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.013','admin','ZKEASOFT','2018-05-21 23:46:13.013'),
(328,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.013','admin','ZKEASOFT','2018-05-21 23:46:13.013'),
(329,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.016','admin','ZKEASOFT','2018-05-21 23:46:13.016'),
(330,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:13.016','admin','ZKEASOFT','2018-05-21 23:46:13.016'),
(331,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.016','admin','ZKEASOFT','2018-05-21 23:46:13.016'),
(332,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.020','admin','ZKEASOFT','2018-05-21 23:46:13.020'),
(333,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.020','admin','ZKEASOFT','2018-05-21 23:46:13.020'),
(334,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:13.023','admin','ZKEASOFT','2018-05-21 23:46:13.023'),
(335,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.023','admin','ZKEASOFT','2018-05-21 23:46:13.023'),
(336,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.026','admin','ZKEASOFT','2018-05-21 23:46:13.026'),
(337,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.026','admin','ZKEASOFT','2018-05-21 23:46:13.026'),
(338,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:13.030','admin','ZKEASOFT','2018-05-21 23:46:13.030'),
(339,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.030','admin','ZKEASOFT','2018-05-21 23:46:13.030'),
(340,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:13.033','admin','ZKEASOFT','2018-05-21 23:46:13.033'),
(341,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.033','admin','ZKEASOFT','2018-05-21 23:46:13.033'),
(342,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:13.036','admin','ZKEASOFT','2018-05-21 23:46:13.036'),
(343,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.036','admin','ZKEASOFT','2018-05-21 23:46:13.036'),
(344,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:13.036','admin','ZKEASOFT','2018-05-21 23:46:13.036'),
(345,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.126','admin','ZKEASOFT','2018-05-21 23:46:15.126'),
(346,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.130','admin','ZKEASOFT','2018-05-21 23:46:15.130'),
(347,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:15.133','admin','ZKEASOFT','2018-05-21 23:46:15.133'),
(348,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.133','admin','ZKEASOFT','2018-05-21 23:46:15.133'),
(349,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.136','admin','ZKEASOFT','2018-05-21 23:46:15.136'),
(350,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.136','admin','ZKEASOFT','2018-05-21 23:46:15.136'),
(351,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:15.140','admin','ZKEASOFT','2018-05-21 23:46:15.140'),
(352,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.140','admin','ZKEASOFT','2018-05-21 23:46:15.140'),
(353,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143'),
(354,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143'),
(355,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143'),
(356,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.146','admin','ZKEASOFT','2018-05-21 23:46:15.146'),
(357,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.146','admin','ZKEASOFT','2018-05-21 23:46:15.146'),
(358,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.150','admin','ZKEASOFT','2018-05-21 23:46:15.150'),
(359,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:15.150','admin','ZKEASOFT','2018-05-21 23:46:15.150'),
(360,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.153','admin','ZKEASOFT','2018-05-21 23:46:15.153'),
(361,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>
    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:15.156','admin','ZKEASOFT','2018-05-21 23:46:15.156'),
(362,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.160','admin','ZKEASOFT','2018-05-21 23:46:15.160'),
(363,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:15.166','admin','ZKEASOFT','2018-05-21 23:46:15.166'),
(364,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.166','admin','ZKEASOFT','2018-05-21 23:46:15.166'),
(365,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:15.173','admin','ZKEASOFT','2018-05-21 23:46:15.173'),
(366,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.316','admin','ZKEASOFT','2018-05-21 23:46:19.316'),
(367,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.320','admin','ZKEASOFT','2018-05-21 23:46:19.320'),
(368,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:19.323','admin','ZKEASOFT','2018-05-21 23:46:19.323'),
(369,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.323','admin','ZKEASOFT','2018-05-21 23:46:19.323'),
(370,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.326','admin','ZKEASOFT','2018-05-21 23:46:19.326'),
(371,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.330','admin','ZKEASOFT','2018-05-21 23:46:19.330'),
(372,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:19.330','admin','ZKEASOFT','2018-05-21 23:46:19.330'),
(373,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.336','admin','ZKEASOFT','2018-05-21 23:46:19.336'),
(374,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.336','admin','ZKEASOFT','2018-05-21 23:46:19.336'),
(375,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.340','admin','ZKEASOFT','2018-05-21 23:46:19.340'),
(376,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:19.340','admin','ZKEASOFT','2018-05-21 23:46:19.340'),
(377,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.343','admin','ZKEASOFT','2018-05-21 23:46:19.343'),
(378,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.343','admin','ZKEASOFT','2018-05-21 23:46:19.343'),
(379,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.346','admin','ZKEASOFT','2018-05-21 23:46:19.346'),
(380,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:19.346','admin','ZKEASOFT','2018-05-21 23:46:19.346'),
(381,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.350','admin','ZKEASOFT','2018-05-21 23:46:19.350'),
(382,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>
    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:19.350','admin','ZKEASOFT','2018-05-21 23:46:19.350'),
(383,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353'),
(384,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353'),
(385,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353'),
(386,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:19.356','admin','ZKEASOFT','2018-05-21 23:46:19.356'),
(387,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.740','admin','ZKEASOFT','2018-05-21 23:46:28.740'),
(388,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.746','admin','ZKEASOFT','2018-05-21 23:46:28.746'),
(389,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:28.746','admin','ZKEASOFT','2018-05-21 23:46:28.746'),
(390,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.753','admin','ZKEASOFT','2018-05-21 23:46:28.753'),
(391,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.753','admin','ZKEASOFT','2018-05-21 23:46:28.753'),
(392,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.760','admin','ZKEASOFT','2018-05-21 23:46:28.760'),
(393,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:28.760','admin','ZKEASOFT','2018-05-21 23:46:28.760'),
(394,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.763','admin','ZKEASOFT','2018-05-21 23:46:28.763'),
(395,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.763','admin','ZKEASOFT','2018-05-21 23:46:28.763'),
(396,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.766','admin','ZKEASOFT','2018-05-21 23:46:28.766'),
(397,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:28.770','admin','ZKEASOFT','2018-05-21 23:46:28.770'),
(398,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.780','admin','ZKEASOFT','2018-05-21 23:46:28.780'),
(399,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.783','admin','ZKEASOFT','2018-05-21 23:46:28.783'),
(400,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.790','admin','ZKEASOFT','2018-05-21 23:46:28.790'),
(401,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:28.790','admin','ZKEASOFT','2018-05-21 23:46:28.790'),
(402,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.796','admin','ZKEASOFT','2018-05-21 23:46:28.796'),
(403,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:28.796','admin','ZKEASOFT','2018-05-21 23:46:28.796'),
(404,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.803','admin','ZKEASOFT','2018-05-21 23:46:28.803'),
(405,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:28.810','admin','ZKEASOFT','2018-05-21 23:46:28.810'),
(406,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.810','admin','ZKEASOFT','2018-05-21 23:46:28.810'),
(407,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:28.816','admin','ZKEASOFT','2018-05-21 23:46:28.816'),
(408,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.763','admin','ZKEASOFT','2018-05-21 23:46:34.763'),
(409,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.766','admin','ZKEASOFT','2018-05-21 23:46:34.766'),
(410,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:34.770','admin','ZKEASOFT','2018-05-21 23:46:34.770'),
(411,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.773','admin','ZKEASOFT','2018-05-21 23:46:34.773'),
(412,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.773','admin','ZKEASOFT','2018-05-21 23:46:34.773'),
(413,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.776','admin','ZKEASOFT','2018-05-21 23:46:34.776'),
(414,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:34.776','admin','ZKEASOFT','2018-05-21 23:46:34.776'),
(415,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.783','admin','ZKEASOFT','2018-05-21 23:46:34.783'),
(416,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.783','admin','ZKEASOFT','2018-05-21 23:46:34.783'),
(417,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.796','admin','ZKEASOFT','2018-05-21 23:46:34.796'),
(418,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:34.800','admin','ZKEASOFT','2018-05-21 23:46:34.800'),
(419,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.800','admin','ZKEASOFT','2018-05-21 23:46:34.800'),
(420,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.803','admin','ZKEASOFT','2018-05-21 23:46:34.803'),
(421,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.810','admin','ZKEASOFT','2018-05-21 23:46:34.810'),
(422,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:34.816','admin','ZKEASOFT','2018-05-21 23:46:34.816'),
(423,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.820','admin','ZKEASOFT','2018-05-21 23:46:34.820'),
(424,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-21 23:46:34.820','admin','ZKEASOFT','2018-05-21 23:46:34.820'),
(425,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.826','admin','ZKEASOFT','2018-05-21 23:46:34.826'),
(426,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:34.826','admin','ZKEASOFT','2018-05-21 23:46:34.826'),
(427,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.833','admin','ZKEASOFT','2018-05-21 23:46:34.833'),
(428,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:34.833','admin','ZKEASOFT','2018-05-21 23:46:34.833'),
(429,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.443','admin','ZKEASOFT','2018-05-22 11:31:26.443'),
(430,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.453','admin','ZKEASOFT','2018-05-22 11:31:26.453'),
(431,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:26.453','admin','ZKEASOFT','2018-05-22 11:31:26.453'),
(432,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.456','admin','ZKEASOFT','2018-05-22 11:31:26.456'),
(433,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.456','admin','ZKEASOFT','2018-05-22 11:31:26.456'),
(434,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.456','admin','ZKEASOFT','2018-05-22 11:31:26.456'),
(435,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:26.460','admin','ZKEASOFT','2018-05-22 11:31:26.460'),
(436,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.463','admin','ZKEASOFT','2018-05-22 11:31:26.463'),
(437,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.463','admin','ZKEASOFT','2018-05-22 11:31:26.463'),
(438,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.466','admin','ZKEASOFT','2018-05-22 11:31:26.466'),
(439,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:26.466','admin','ZKEASOFT','2018-05-22 11:31:26.466'),
(440,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.470','admin','ZKEASOFT','2018-05-22 11:31:26.470'),
(441,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.473','admin','ZKEASOFT','2018-05-22 11:31:26.473'),
(442,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.473','admin','ZKEASOFT','2018-05-22 11:31:26.473'),
(443,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:26.476','admin','ZKEASOFT','2018-05-22 11:31:26.476'),
(444,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.480','admin','ZKEASOFT','2018-05-22 11:31:26.480'),
(445,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:26.480','admin','ZKEASOFT','2018-05-22 11:31:26.480'),
(446,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.483','admin','ZKEASOFT','2018-05-22 11:31:26.483'),
(447,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:26.483','admin','ZKEASOFT','2018-05-22 11:31:26.483'),
(448,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.486','admin','ZKEASOFT','2018-05-22 11:31:26.486'),
(449,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:26.486','admin','ZKEASOFT','2018-05-22 11:31:26.486'),
(450,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.516','admin','ZKEASOFT','2018-05-22 11:31:31.516'),
(451,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.520','admin','ZKEASOFT','2018-05-22 11:31:31.520'),
(452,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:31.536','admin','ZKEASOFT','2018-05-22 11:31:31.536'),
(453,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.546','admin','ZKEASOFT','2018-05-22 11:31:31.546'),
(454,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.560','admin','ZKEASOFT','2018-05-22 11:31:31.560'),
(455,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.580','admin','ZKEASOFT','2018-05-22 11:31:31.580'),
(456,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:31.593','admin','ZKEASOFT','2018-05-22 11:31:31.593'),
(457,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.606','admin','ZKEASOFT','2018-05-22 11:31:31.606'),
(458,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.616','admin','ZKEASOFT','2018-05-22 11:31:31.616'),
(459,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.620','admin','ZKEASOFT','2018-05-22 11:31:31.620'),
(460,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:31.620','admin','ZKEASOFT','2018-05-22 11:31:31.620'),
(461,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.626','admin','ZKEASOFT','2018-05-22 11:31:31.626'),
(462,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.640','admin','ZKEASOFT','2018-05-22 11:31:31.640'),
(463,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.653','admin','ZKEASOFT','2018-05-22 11:31:31.653'),
(464,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:31.663','admin','ZKEASOFT','2018-05-22 11:31:31.663'),
(465,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.676','admin','ZKEASOFT','2018-05-22 11:31:31.676'),
(466,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:31.686','admin','ZKEASOFT','2018-05-22 11:31:31.686'),
(467,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.700','admin','ZKEASOFT','2018-05-22 11:31:31.700'),
(468,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:31.713','admin','ZKEASOFT','2018-05-22 11:31:31.713'),
(469,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.723','admin','ZKEASOFT','2018-05-22 11:31:31.723'),
(470,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:31.736','admin','ZKEASOFT','2018-05-22 11:31:31.736'),
(471,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.700','admin','ZKEASOFT','2018-05-22 11:31:35.700'),
(472,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.700','admin','ZKEASOFT','2018-05-22 11:31:35.700'),
(473,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:35.713','admin','ZKEASOFT','2018-05-22 11:31:35.713'),
(474,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.723','admin','ZKEASOFT','2018-05-22 11:31:35.723'),
(475,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.736','admin','ZKEASOFT','2018-05-22 11:31:35.736'),
(476,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.750','admin','ZKEASOFT','2018-05-22 11:31:35.750'),
(477,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:35.763','admin','ZKEASOFT','2018-05-22 11:31:35.763'),
(478,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.773','admin','ZKEASOFT','2018-05-22 11:31:35.773'),
(479,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.786','admin','ZKEASOFT','2018-05-22 11:31:35.786'),
(480,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.800','admin','ZKEASOFT','2018-05-22 11:31:35.800'),
(481,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:35.813','admin','ZKEASOFT','2018-05-22 11:31:35.813'),
(482,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.823','admin','ZKEASOFT','2018-05-22 11:31:35.823'),
(483,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.836','admin','ZKEASOFT','2018-05-22 11:31:35.836'),
(484,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.850','admin','ZKEASOFT','2018-05-22 11:31:35.850'),
(485,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:35.860','admin','ZKEASOFT','2018-05-22 11:31:35.860'),
(486,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.873','admin','ZKEASOFT','2018-05-22 11:31:35.873'),
(487,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:35.886','admin','ZKEASOFT','2018-05-22 11:31:35.886'),
(488,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.896','admin','ZKEASOFT','2018-05-22 11:31:35.896'),
(489,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:35.910','admin','ZKEASOFT','2018-05-22 11:31:35.910'),
(490,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.923','admin','ZKEASOFT','2018-05-22 11:31:35.923'),
(491,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:35.936','admin','ZKEASOFT','2018-05-22 11:31:35.936'),
(492,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.900','admin','ZKEASOFT','2018-05-22 11:31:39.900'),
(493,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.900','admin','ZKEASOFT','2018-05-22 11:31:39.900'),
(494,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:39.903','admin','ZKEASOFT','2018-05-22 11:31:39.903'),
(495,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.903','admin','ZKEASOFT','2018-05-22 11:31:39.903'),
(496,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>
    <div class=\"container main\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.906','admin','ZKEASOFT','2018-05-22 11:31:39.906'),
(497,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.906','admin','ZKEASOFT','2018-05-22 11:31:39.906'),
(498,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:39.906','admin','ZKEASOFT','2018-05-22 11:31:39.906'),
(499,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.910','admin','ZKEASOFT','2018-05-22 11:31:39.910'),
(500,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-8\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.913','admin','ZKEASOFT','2018-05-22 11:31:39.913'),
(501,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.913','admin','ZKEASOFT','2018-05-22 11:31:39.913'),
(502,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:39.916','admin','ZKEASOFT','2018-05-22 11:31:39.916'),
(503,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.916','admin','ZKEASOFT','2018-05-22 11:31:39.916'),
(504,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div><div class=\"additional col-md-4\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.920','admin','ZKEASOFT','2018-05-22 11:31:39.920'),
(505,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.923','admin','ZKEASOFT','2018-05-22 11:31:39.923'),
(506,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:39.926','admin','ZKEASOFT','2018-05-22 11:31:39.926'),
(507,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.930','admin','ZKEASOFT','2018-05-22 11:31:39.930'),
(508,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div><div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:39.933','admin','ZKEASOFT','2018-05-22 11:31:39.933'),
(509,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.933','admin','ZKEASOFT','2018-05-22 11:31:39.933'),
(510,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:39.936','admin','ZKEASOFT','2018-05-22 11:31:39.936'),
(511,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.936','admin','ZKEASOFT','2018-05-22 11:31:39.936'),
(512,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:39.936','admin','ZKEASOFT','2018-05-22 11:31:39.936'),
(513,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.950','admin','ZKEASOFT','2018-05-22 11:31:43.950'),
(514,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.953','admin','ZKEASOFT','2018-05-22 11:31:43.953'),
(515,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:43.953','admin','ZKEASOFT','2018-05-22 11:31:43.953'),
(516,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.956','admin','ZKEASOFT','2018-05-22 11:31:43.956'),
(517,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.956','admin','ZKEASOFT','2018-05-22 11:31:43.956'),
(518,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.963','admin','ZKEASOFT','2018-05-22 11:31:43.963'),
(519,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:43.966','admin','ZKEASOFT','2018-05-22 11:31:43.966'),
(520,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.966','admin','ZKEASOFT','2018-05-22 11:31:43.966'),
(521,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.970','admin','ZKEASOFT','2018-05-22 11:31:43.970'),
(522,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.973','admin','ZKEASOFT','2018-05-22 11:31:43.973'),
(523,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:43.976','admin','ZKEASOFT','2018-05-22 11:31:43.976'),
(524,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.980','admin','ZKEASOFT','2018-05-22 11:31:43.980'),
(525,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.983','admin','ZKEASOFT','2018-05-22 11:31:43.983'),
(526,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.983','admin','ZKEASOFT','2018-05-22 11:31:43.983'),
(527,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:43.986','admin','ZKEASOFT','2018-05-22 11:31:43.986'),
(528,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.986','admin','ZKEASOFT','2018-05-22 11:31:43.986'),
(529,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>
    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:43.990','admin','ZKEASOFT','2018-05-22 11:31:43.990'),
(530,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.990','admin','ZKEASOFT','2018-05-22 11:31:43.990'),
(531,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:43.993','admin','ZKEASOFT','2018-05-22 11:31:43.993'),
(532,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.996','admin','ZKEASOFT','2018-05-22 11:31:43.996'),
(533,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:44.000','admin','ZKEASOFT','2018-05-22 11:31:44.000'),
(534,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<div class=\"main custom-style container-fluid\" style=\"\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.356','admin','ZKEASOFT','2018-05-22 11:31:49.356'),
(535,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.360','admin','ZKEASOFT','2018-05-22 11:31:49.360'),
(536,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:49.373','admin','ZKEASOFT','2018-05-22 11:31:49.373'),
(537,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.386','admin','ZKEASOFT','2018-05-22 11:31:49.386'),
(538,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div><div class=\"container main custom-style\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.396','admin','ZKEASOFT','2018-05-22 11:31:49.396'),
(539,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.410','admin','ZKEASOFT','2018-05-22 11:31:49.410'),
(540,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:49.426','admin','ZKEASOFT','2018-05-22 11:31:49.426'),
(541,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.440','admin','ZKEASOFT','2018-05-22 11:31:49.440'),
(542,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div><div class=\"additional row\"><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.453','admin','ZKEASOFT','2018-05-22 11:31:49.453'),
(543,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.463','admin','ZKEASOFT','2018-05-22 11:31:49.463'),
(544,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:49.476','admin','ZKEASOFT','2018-05-22 11:31:49.476'),
(545,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.490','admin','ZKEASOFT','2018-05-22 11:31:49.490'),
(546,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div><div class=\"additional col-md-6\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.503','admin','ZKEASOFT','2018-05-22 11:31:49.503'),
(547,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.516','admin','ZKEASOFT','2018-05-22 11:31:49.516'),
(548,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:49.526','admin','ZKEASOFT','2018-05-22 11:31:49.526'),
(549,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.540','admin','ZKEASOFT','2018-05-22 11:31:49.540'),
(550,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>
    <div class=\"main container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">','admin','ZKEASOFT','2018-05-22 11:31:49.553','admin','ZKEASOFT','2018-05-22 11:31:49.553'),
(551,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.566','admin','ZKEASOFT','2018-05-22 11:31:49.566'),
(552,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:49.580','admin','ZKEASOFT','2018-05-22 11:31:49.580'),
(553,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.593','admin','ZKEASOFT','2018-05-22 11:31:49.593'),
(554,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:49.606','admin','ZKEASOFT','2018-05-22 11:31:49.606');
/*!40000 ALTER TABLE `CMS_LayoutHtml` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Media`;
CREATE TABLE `CMS_Media` (
	`ID` VARCHAR(50) CHARACTER SET utf8mb4  NOT NULL,
	`ParentID` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
('6056810a7ede46bb94b55b2756323640','#','Image',1,NULL,NULL,'admin','ZKEASOFT','2016-04-01 21:42:14.960','admin','ZKEASOFT','2016-04-01 21:42:14.960',NULL);
/*!40000 ALTER TABLE `CMS_Media` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Message`;
CREATE TABLE `CMS_Message` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
(1,'ZKEASOFT','zkea@zkea.net','ZKEACMS is an open-source CMS developed based on ASP.NET 9, available for free download and learning.','KEACMS uses visual editing design, WYSIWYG, allowing you to design the page you want directly on the page.',1,'admin','ZKEASOFT','2017-03-19 21:02:34.260','admin','ZKEASOFT','2017-03-19 21:02:34.260',NULL),
(2,'ZKEASOFT','zkea@zkea.net','ZKEACMS uses visual editing design','ZKEACMS is a content management software (website), not only managing content but also redefining layout, pages, and components, allowing users to freely plan the layout, pages, and content.',1,'admin','ZKEASOFT','2017-03-19 21:03:09.966','admin','ZKEASOFT','2017-03-19 21:03:09.966',NULL);
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
	PRIMARY KEY (`ID`),
	KEY `FK_CMS_Page_CMS_Layout` (`LayoutId`),
	CONSTRAINT `FK_CMS_Page_CMS_Layout` FOREIGN KEY (`LayoutId`) REFERENCES `CMS_Layout` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `CMS_Page` DISABLE KEYS */;
INSERT INTO `CMS_Page` VALUES
('068c85b8de8744e7a81b1d1010583308','9d84599edb2443439a53e8d906815c8f',1,'#','Product',0,'~/product','0846a33e56bf45d5aae602ef40d87444','Product',NULL,4,NULL,1,0,'2016-05-15 20:56:40.843',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.843','admin','ZKEASOFT','2016-05-15 20:56:40.843'),
('0880a4dfdc184ff99b88c88325716d1b',NULL,0,'#','Home',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','Welcome to ZKEACMS for creation',NULL,1,NULL,1,0,'2017-10-15 18:11:36.000',NULL,NULL,'[]','[]','admin',NULL,'2015-08-31 13:27:16.000','admin','ZKEASOFT','2020-03-21 14:01:56.336'),
('1c93b61690ce49d7af8e1ea45ac58eb9',NULL,0,'#','Contact Us',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01','Contact Us',NULL,7,NULL,1,1,'2017-03-19 21:05:28.836','Contact Us','Contact Us',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:03:50.763','admin','ZKEASOFT','2017-03-19 21:05:16.280'),
('4b889b430aa44517bbad38a57c745cc5','a8d73e29b1eb4b7ea43420e2b6bf2c1b',1,'9d84599edb2443439a53e8d906815c8f','Product Details',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2016-03-10 23:24:38.776',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.780','admin','ZKEASOFT','2016-03-10 23:24:38.780'),
('50fa3579e7434555a22f095dcb4ea35e','0880a4dfdc184ff99b88c88325716d1b',1,'#','Home',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','Welcome to ZKEACMS for creation',NULL,1,NULL,1,0,'2017-10-15 18:11:36.273',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.276','admin','ZKEASOFT','2017-10-15 18:11:36.810'),
('534e07f396b14b7584a833d270356cb7','1c93b61690ce49d7af8e1ea45ac58eb9',1,'#','Contact Us',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01','Contact Us',NULL,7,NULL,1,0,'2017-03-19 21:05:30.803','Contact Us','Contact Us',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.833','admin','ZKEASOFT','2017-03-19 21:05:31.050'),
('9ce910ba45a24fd2af804d6d0de7bba3','be49e3ec3b5a4f5eae3edaf8ba64f185',1,'#','Questionnaire',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','Questionnaire | ZKEASOFT',NULL,5,NULL,1,0,'2017-10-15 18:20:42.203',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:20:42.206','admin','ZKEASOFT','2017-10-15 18:20:42.216'),
('9d84599edb2443439a53e8d906815c8f',NULL,0,'#','Product',0,'~/product','0846a33e56bf45d5aae602ef40d87444','Product',NULL,4,NULL,1,1,'2016-05-15 20:56:40.763',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:10.430','admin','ZKEASOFT','2016-05-14 15:01:42.696'),
('a3d735320eb04c63bf3258d7b44e30f8',NULL,0,'e371628aa3ff46c3a167f121c7a3f32b','Article Details',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2017-12-03 17:11:47.220',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:03.240','admin','ZKEASOFT','2017-12-03 17:11:47.223'),
('a8d73e29b1eb4b7ea43420e2b6bf2c1b',NULL,0,'9d84599edb2443439a53e8d906815c8f','Product Details',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2016-03-10 23:24:38.743',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:11.263','admin','ZKEASOFT','2016-03-10 23:24:38.736'),
('be49e3ec3b5a4f5eae3edaf8ba64f185',NULL,0,'#','Questionnaire',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','Questionnaire | ZKEASOFT',NULL,5,NULL,1,1,'2017-10-15 18:20:42.193',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:58:52.056','admin','ZKEASOFT','2017-10-15 18:20:42.193'),
('c5b97a044c9844529fc48383d141e73c','a3d735320eb04c63bf3258d7b44e30f8',1,'e371628aa3ff46c3a167f121c7a3f32b','Article Details',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2017-12-03 17:11:47.236',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.243','admin','ZKEASOFT','2017-12-03 17:11:47.306'),
('d070f202bb2f45ddbd35f0a7cfee1dfa','e371628aa3ff46c3a167f121c7a3f32b',1,'#','Article',0,'~/article','0846a33e56bf45d5aae602ef40d87444','Article',NULL,3,NULL,1,0,'2017-10-15 18:11:44.946',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.946','admin','ZKEASOFT','2017-10-15 18:11:45.366'),
('e371628aa3ff46c3a167f121c7a3f32b',NULL,0,'#','Article',0,'~/article','0846a33e56bf45d5aae602ef40d87444','Article',NULL,3,NULL,1,1,'2017-10-15 18:11:44.940',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-09 12:45:01.000','admin','ZKEASOFT','2017-10-15 18:11:44.940');
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
(1,'Home page','~/','~/index',0,NULL,1,'admin','ZKEASOFT','2017-08-14 14:58:06.000','admin','ZKEASOFT','2020-08-01 22:21:26.836',0);
/*!40000 ALTER TABLE `CMS_Redirection` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Rule`;
CREATE TABLE `CMS_Rule` (
	`RuleID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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

/*!40000 ALTER TABLE `CMS_Rule` DISABLE KEYS */;
INSERT INTO `CMS_Rule` VALUES
(1,'All Pages','Top','StartsWith(ValueOf(''Url''),''/'')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:34.623','admin','ZKEASOFT','2018-05-21 23:43:34.623','[{\"Condition\":\"and\",\"FunctionName\":\"StartsWith\",\"Property\":\"ValueOf(''Url'')\",\"Value\":\"/\",\"Title\":null,\"Description\":null,\"Status\":null,\"CreateBy\":null,\"CreatebyName\":null,\"CreateDate\":null,\"LastUpdateBy\":null,\"LastUpdateByName\":null,\"LastUpdateDate\":null,\"ActionType\":1}]'),
(2,'All Pages','Bottom','StartsWith(ValueOf(''Url''),''/'')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:52.343','admin','ZKEASOFT','2018-05-21 23:43:52.343','[{\"Condition\":\"and\",\"FunctionName\":\"StartsWith\",\"Property\":\"ValueOf(''Url'')\",\"Value\":\"/\",\"Title\":null,\"Description\":null,\"Status\":null,\"CreateBy\":null,\"CreatebyName\":null,\"CreateDate\":null,\"LastUpdateBy\":null,\"LastUpdateByName\":null,\"LastUpdateDate\":null,\"ActionType\":1}]');
/*!40000 ALTER TABLE `CMS_Rule` ENABLE KEYS */;

DROP TABLE IF EXISTS `CMS_Theme`;
CREATE TABLE `CMS_Theme` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
('Default','Default','~/themes/Default/css/Theme.min.css','~/themes/Default/css/Theme.css','~/themes/Default/thumbnail.jpg',1,1,NULL,'admin','ZKEASOFT','2016-04-04 22:17:10.790','admin','ZKEASOFT','2016-04-04 22:21:01.486');
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
('00f62c5acfe840e0bee3ca2979f0f025','Image Right',NULL,9,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:13:55.010','admin','ZKEASOFT','2016-06-29 14:13:22.936',NULL,NULL,1,'~/images/template%20(6).png',1,NULL,NULL),
('01b59004dd1e4f68afa98c9c80d86f4c','Form',NULL,1,NULL,'be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 17:59:05.133','admin','ZKEASOFT','2017-10-15 18:20:39.980',NULL,NULL,0,NULL,0,'{\"FormID\":\"5ed56d90ac154e73befa6fbc981ae3ae\",\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ActionType\":1}',NULL),
('02dd343bb4f24322bcf3daf8ada7565d','Message Board',NULL,2,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:31.030','admin','ZKEASOFT','2017-03-19 21:05:31.030',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{\"ID\":\"02dd343bb4f24322bcf3daf8ada7565d\",\"WidgetName\":\"Message Board\",\"Position\":2,\"LayoutID\":null,\"PageID\":\"534e07f396b14b7584a833d270356cb7\",\"ZoneID\":\"d5f02570e4814439acc86a1874cb8f07\",\"IsTemplate\":false,\"Thumbnail\":null,\"IsSystem\":false,\"PartialView\":\"Widget.MessageBox\",\"AssemblyName\":\"Easy.CMS.Message\",\"ServiceTypeName\":\"Easy.CMS.Message.Service.MessageBoxWidgetService\",\"ViewModelTypeName\":\"Easy.CMS.Message.Models.MessageBoxWidget\",\"FormView\":null,\"StyleClass\":null,\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ExtendData\":null,\"ExtendFields\":[],\"Title\":null,\"Description\":null,\"Status\":null,\"CreateBy\":\"admin\",\"CreatebyName\":\"ZKEASOFT\",\"CreateDate\":\"2017-03-19T21:04:44.953\",\"LastUpdateBy\":\"admin\",\"LastUpdateByName\":\"ZKEASOFT\",\"LastUpdateDate\":\"2017-03-19T21:04:44.953\",\"ActionType\":1}',NULL),
('062018a8e5cf48b4a0d90296e7f4e965','Separator',NULL,2,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-11 10:01:58.756','admin','ZKEASOFT','2016-03-11 10:01:58.756',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),
('09617f6142934daaadee6cfb9df6d66f','Paragraph',NULL,4,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:53:07.263','admin','ZKEASOFT','2016-03-24 10:49:44.100',NULL,NULL,1,'~/images/template%20(2).png',1,NULL,NULL),
('0f66ab8ff0df44e2b5e57fd8d8c5d8ff','3Col (text)',NULL,8,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:23:51.276','admin','ZKEASOFT','2016-06-29 14:12:54.386',NULL,NULL,1,'~/images/template (15).png',1,NULL,NULL),
('1433264e95f545ab97e6a481fa3747ea','Comment Box',NULL,2,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:36.466','admin','ZKEASOFT','2017-12-03 17:11:36.466',NULL,NULL,0,NULL,0,'{\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ActionType\":1}',NULL),
('155c6511dd9c4cc1b3ccb27d5ad4b8ab','Form',NULL,1,NULL,'9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 18:20:42.213','admin','ZKEASOFT','2017-10-15 18:20:42.213',NULL,NULL,0,NULL,0,'{\"FormID\":\"5ed56d90ac154e73befa6fbc981ae3ae\",\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ActionType\":1}',NULL),
('19350341920b4827bf2a4e458ad24a58','Carousel',NULL,1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,'','admin','ZKEASOFT','2016-03-27 15:14:34.676','admin','ZKEASOFT','2020-03-21 14:01:56.236',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL),
('1fb967867e3b440e86336bc5a51e8719','3 Image (Circle)',NULL,17,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:40:26.766','admin','ZKEASOFT','2016-06-29 14:19:30.776',NULL,NULL,1,'~/images/template%20(12).png',1,NULL,NULL),
('2b3eb61307d24c50a6b3aaa75db3810e','Image Left',NULL,11,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:06:17.636','admin','ZKEASOFT','2016-06-29 14:14:54.330',NULL,NULL,1,'~/images/template%20(5).png',1,NULL,NULL),
('2b510992f0174e668ca53116434e065c','Image',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:15:37.333','admin','ZKEASOFT','2017-10-15 18:00:21.586',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),
('3017aef0eabc451b81daebe6bae68857','Image',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.950','admin','ZKEASOFT','2017-10-15 18:11:44.950',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),
('34567e55bacd40dbaf9794d5032dd26e','Message Board',NULL,4,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.976','admin','ZKEASOFT','2017-03-19 21:05:30.976',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{\"FormView\":null,\"ExtendData\":null,\"Description\":null,\"Status\":null,\"CreateBy\":\"admin\",\"CreatebyName\":\"ZKEASOFT\",\"CreateDate\":\"2017-03-19T21:04:56.38\",\"LastUpdateBy\":\"admin\",\"LastUpdateByName\":\"ZKEASOFT\",\"LastUpdateDate\":\"2017-03-19T21:04:56.38\",\"ActionType\":1,\"ID\":\"34567e55bacd40dbaf9794d5032dd26e\",\"WidgetName\":\"Message Board\",\"Position\":4,\"LayoutID\":null,\"PageID\":\"534e07f396b14b7584a833d270356cb7\",\"ZoneID\":\"d5f02570e4814439acc86a1874cb8f07\",\"IsTemplate\":false,\"Thumbnail\":null,\"IsSystem\":false,\"PartialView\":\"Widget.Message\",\"AssemblyName\":\"Easy.CMS.Message\",\"ServiceTypeName\":\"Easy.CMS.Message.Service.MessageWidgetService\",\"ViewModelTypeName\":\"Easy.CMS.Message.Models.MessageWidget\",\"StyleClass\":null,\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ExtendFields\":[],\"Title\":null}',NULL),
('3466e616139645d2b1e1d9935d231922','Product Category','Product Category',1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.876','admin','ZKEASOFT','2016-05-15 20:56:40.876',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL),
('357a58069e8047a289e10b920061d57d','Separator',NULL,3,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.900','admin','ZKEASOFT','2017-03-19 21:05:30.900',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),
('3aa8b53e7ad143ff818855a7abcb3fdd','Article Content',NULL,1,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.290','admin','ZKEASOFT','2017-12-03 17:11:47.290',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL),
('3b8beb945c9f4c9390a6122d8b4788d5','Separator',NULL,2,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.346','admin','ZKEASOFT','2017-10-15 18:11:45.346',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),
('3e3783f4b7ca421488f2bf08d32fe2f0','Separator',NULL,2,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.850','admin','ZKEASOFT','2016-05-15 20:56:40.850',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),
('416c5402962b41548c83fabaa5492b42','Article List',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:20:31.666','admin','ZKEASOFT','2016-03-11 11:51:20.640',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL),
('41e075ab1b89453388494a539eec55b9','Carousel',NULL,1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.633','admin','ZKEASOFT','2017-10-15 18:11:36.633',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL),
('43bb869688ee4752a3127dd19ccc6caa','Image',NULL,1,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:20.406','admin','ZKEASOFT','2017-03-19 21:04:29.773',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),
('481574ebc98b4cdf9a07e3f20c1ab78d','Image Left (Circle)',NULL,12,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:48.870','admin','ZKEASOFT','2016-06-29 14:15:23.316',NULL,NULL,1,'~/images/template%20(7).png',1,NULL,NULL),
('4d67b2d10f4a425586e3b1115f7f7072','Separator',NULL,3,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:15.683','admin','ZKEASOFT','2017-03-19 21:05:15.683',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),
('50f810582d28440eb3bdff9ee5b1ef24','Image Left (Halves)',NULL,13,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:36:23.246','admin','ZKEASOFT','2016-06-29 14:16:05.733',NULL,NULL,1,'~/images/template (17).png',1,NULL,NULL),
('55b73e54fd054de4847960bdac350c6d','2 Image (Circle)',NULL,15,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:33:40.533','admin','ZKEASOFT','2016-06-29 14:17:49.736',NULL,NULL,1,'~/images/template%20(10).png',1,NULL,NULL),
('56991d0ff59d4c1db27aff3a50fcb382','Heading',NULL,2,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:51:35.576','admin','ZKEASOFT','2016-06-29 14:10:19.703',NULL,NULL,1,'~/images/template%20(1).png',1,NULL,NULL),
('604b2461f7c545e28dbb21fb15def5c7','Links','Links',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:13:42.000','admin','ZKEASOFT','2017-10-15 17:18:36.063',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL),
('62ca3b6b6ea644b4a64501021b02f13b','Separator',NULL,2,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:16:08.136','admin','ZKEASOFT','2017-10-15 18:00:21.613',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL),
('6bb06e46293c46f084e83751a0832d36','Product List',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.866','admin','ZKEASOFT','2016-05-15 20:56:40.866',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL),
('6ee67036e78b4b498d932ab2d76757fb','Navigation',NULL,1,NULL,NULL,'ZONE-0','Widget.Navigation','ZKEACMS','ZKEACMS.Common.Service.NavigationWidgetService','ZKEACMS.Common.Models.NavigationWidget',NULL,'full','admin','ZKEASOFT','2018-05-21 23:44:21.393','admin','ZKEASOFT','2020-03-21 13:44:19.636',NULL,NULL,0,NULL,0,NULL,1),
('7679a5060035444d85fe49dc3c02cada','Image',NULL,1,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.853','admin','ZKEASOFT','2017-03-19 21:05:30.853',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),
('787d9ad849dd40d0905f22ae072d8507','Product Content',NULL,1,NULL,'a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:19.903','admin','ZKEASOFT','2016-03-10 23:20:19.903',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL),
('7e7a1d5b8d644333a7b3341509fc960f','Register Account','Register Account',2,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.773','admin','ZKEASOFT','2017-10-15 18:11:36.773',NULL,NULL,0,NULL,0,NULL,NULL),
('7f77f09c3fcd4d498a4aa3b1c9508d7d','Register Account','Register Account',2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 17:03:14.000','admin','ZKEASOFT','2017-10-15 17:04:42.893',NULL,NULL,0,NULL,0,NULL,NULL),
('80f365c7991a49a0b04aa11006018814','Site Management','Admin',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:09:22.000','admin','ZKEASOFT','2017-10-15 17:03:50.206',NULL,0,0,NULL,0,NULL,NULL),
('88ab49212dee47bba878a52bec86f501','Site Management','Admin',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.793','admin','ZKEASOFT','2017-10-15 18:11:36.793',NULL,0,0,NULL,0,NULL,NULL),
('8c5b69f614b641c0a5f7a8e318de8df3','About ZKEACMS',NULL,2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin',NULL,'2015-09-01 09:54:38.000','admin','ZKEASOFT','2020-03-21 13:47:22.756',NULL,0,0,NULL,0,NULL,NULL),
('8cc061c2e2514ef9b85bbecdec3f84ab','Separator',NULL,5,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:55:12.376','admin','ZKEASOFT','2016-03-09 13:55:12.376',NULL,NULL,1,'~/images/template%20(3).png',1,NULL,NULL),
('8df64186d2fd4d63a9f9bb3b6e34cd2a','Article Category','Article Category',1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:21:20.526','admin','ZKEASOFT','2016-05-15 21:04:35.783',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL),
('8ea46d2923ad4d62958c565b19bb172d','Image',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.856','admin','ZKEASOFT','2016-05-15 20:56:40.856',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),
('942b4ac54f3e4dfca006172bf4122da4','Message Board',NULL,4,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:56.380','admin','ZKEASOFT','2017-03-19 21:04:56.380',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{\"FormView\":null,\"ExtendData\":null,\"Description\":null,\"Status\":null,\"CreateBy\":null,\"CreatebyName\":null,\"CreateDate\":null,\"LastUpdateBy\":null,\"LastUpdateByName\":null,\"LastUpdateDate\":null,\"ActionType\":1,\"ID\":\"942b4ac54f3e4dfca006172bf4122da4\",\"WidgetName\":\"Message Board\",\"Position\":1,\"LayoutID\":null,\"PageID\":\"1c93b61690ce49d7af8e1ea45ac58eb9\",\"ZoneID\":\"3ca302874c164b7b9691ca948300417b\",\"IsTemplate\":false,\"Thumbnail\":null,\"IsSystem\":false,\"PartialView\":\"Widget.Message\",\"AssemblyName\":\"Easy.CMS.Message\",\"ServiceTypeName\":\"Easy.CMS.Message.Service.MessageWidgetService\",\"ViewModelTypeName\":\"Easy.CMS.Message.Models.MessageWidget\",\"StyleClass\":null,\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ExtendFields\":null,\"Title\":null}',NULL),
('94624262dc00460cbbc1e0f51711e712','Product Content',NULL,1,NULL,'4b889b430aa44517bbad38a57c745cc5','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.783','admin','ZKEASOFT','2016-03-10 23:24:38.783',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL),
('a64ad266b3bd4e0eb4e2df09b550fe55','Message Board',NULL,2,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:44.953','admin','ZKEASOFT','2017-03-19 21:04:44.953',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{\"ID\":\"a64ad266b3bd4e0eb4e2df09b550fe55\",\"WidgetName\":\"Message Board\",\"Position\":1,\"LayoutID\":null,\"PageID\":\"1c93b61690ce49d7af8e1ea45ac58eb9\",\"ZoneID\":\"4cf5d05f2b954a7e8904713ad6781a61\",\"IsTemplate\":false,\"Thumbnail\":null,\"IsSystem\":false,\"PartialView\":\"Widget.MessageBox\",\"AssemblyName\":\"Easy.CMS.Message\",\"ServiceTypeName\":\"Easy.CMS.Message.Service.MessageBoxWidgetService\",\"ViewModelTypeName\":\"Easy.CMS.Message.Models.MessageBoxWidget\",\"FormView\":null,\"StyleClass\":null,\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ExtendData\":null,\"ExtendFields\":null,\"Title\":null,\"Description\":null,\"Status\":null,\"CreateBy\":null,\"CreatebyName\":null,\"CreateDate\":null,\"LastUpdateBy\":null,\"LastUpdateByName\":null,\"LastUpdateDate\":null,\"ActionType\":1}',NULL),
('a686b84212f94b3b8315093b2e8b883d','Copyright',NULL,NULL,NULL,NULL,'ZONE-X','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,'footer','admin','ZKEASOFT','2018-05-21 23:44:55.063','admin','ZKEASOFT','2018-05-21 23:44:55.063',NULL,NULL,0,NULL,0,NULL,2),
('b568ff7f4a894870adaf9afadf787bf9','2 Image',NULL,14,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:20:29.886','admin','ZKEASOFT','2016-06-29 14:16:58.140',NULL,NULL,1,'~/images/template%20(9).png',1,NULL,NULL),
('bb7dab4f077745ef8b5b425eaabb423c','Jumbotron',NULL,1,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:28:47.826','admin','ZKEASOFT','2016-06-29 14:09:41.596',NULL,NULL,1,'~/images/template (16).png',1,NULL,NULL),
('c71d1f1c48944d6a9e232b6813261e04','Comment Box',NULL,2,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.253','admin','ZKEASOFT','2017-12-03 17:11:47.253',NULL,NULL,0,NULL,0,'{\"CustomClass\":\"\",\"CustomStyle\":\"\",\"ActionType\":1}',NULL),
('ca9f8809636d448cbd4f3beb418465b3','Article List',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.316','admin','ZKEASOFT','2017-10-15 18:11:45.316',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL),
('cd21a7bf68b44f6e8d178b153288a26e','About ZKEACMS',NULL,3,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.806','admin','ZKEASOFT','2017-10-15 18:11:36.806',NULL,0,0,NULL,0,NULL,NULL),
('de8d94fd51cb4e73b00518dbb2f134d3','Article Category','Article Category',1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.366','admin','ZKEASOFT','2017-10-15 18:11:45.366',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL),
('e0783dbbcc564322a1f2e3ca2833dbd4','Links','Links',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.733','admin','ZKEASOFT','2017-10-15 18:11:36.733',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL),
('e5ba6adb117440959757b98e4289430f','Image',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:31:24.886','admin','ZKEASOFT','2016-03-27 15:16:41.790',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL),
('e88916cc41b3465b9ae954bafac5f796','Product List',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:21.906','admin','ZKEASOFT','2016-03-10 23:31:03.770',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL),
('e8fd1019bab045e5927ec30abaaa1aba','Article Content',NULL,1,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:12.856','admin','ZKEASOFT','2016-03-10 21:24:12.856',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL),
('eb7657f5bcbd4e98977a42950936e7ac','Product Category','Product Category',1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:28:35.323','admin','ZKEASOFT','2016-05-15 20:56:37.496',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL),
('ed837392097f4e60b812bc57111dd762','3 Image',NULL,16,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:36:24.463','admin','ZKEASOFT','2016-06-29 14:18:22.983',NULL,NULL,1,'~/images/template%20(11).png',1,NULL,NULL),
('f41174cfa4d247f4974c47f4d2b000fd','2 Col (text)',NULL,7,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:21:37.693','admin','ZKEASOFT','2016-06-29 14:11:06.066',NULL,NULL,1,'~/images/template (14).png',1,NULL,NULL),
('f6de0d62d3974ee2bf2ded3fbbc82c2b','Gap',NULL,6,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 14:00:46.400','admin','ZKEASOFT','2016-03-09 14:08:21.673',NULL,NULL,1,'~/images/template%20(4).png',1,NULL,NULL),
('f6f11ba2fec844de883acf0a1fe3eb89','Image Right (Circle)',NULL,10,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:44.226','admin','ZKEASOFT','2016-06-29 14:13:44.223',NULL,NULL,1,'~/images/template%20(8).png',1,NULL,NULL),
('fee7f4d7d7e641b0bfa74491a543d245','Image',NULL,3,NULL,NULL,NULL,'Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:14:46.133','admin','ZKEASOFT','2016-03-09 21:14:46.133',NULL,NULL,1,'~/images/template (13).png',1,NULL,NULL);
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
('0338e740ea064e5a88d6223fd476506f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.650','admin','ZKEASOFT','2018-05-21 23:45:46.650',NULL,NULL,'ZONE-0'),
('0387a1373f59466a91feb96bb69aadca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.986','admin','ZKEASOFT','2018-05-21 23:46:12.986',NULL,NULL,'ZONE-1'),
('07384e5dc4f34a199d4ca73b3317b1f2','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.190','admin','ZKEASOFT','2018-05-21 23:42:49.190',NULL,NULL,'ZONE-0'),
('095b8b8b28144248a2b0eff648e7fc48','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.930','admin','ZKEASOFT','2018-05-21 23:45:21.930',NULL,NULL,'ZONE-2'),
('0c44eb9149b34ffaaa44d6976d11e1d8','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.306','admin','ZKEASOFT','2018-05-21 23:46:19.306',NULL,NULL,'ZONE-4'),
('0e5c5a55882b4a34a77f3de1f0f36a4c','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.116','admin','ZKEASOFT','2018-05-21 23:46:15.116',NULL,NULL,'ZONE-2'),
('1319756527364a5da511499b37a1eed5','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.973','admin','ZKEASOFT','2018-05-21 23:42:39.973',NULL,NULL,'ZONE-0'),
('14a23e1671924f758113054ed008adec','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.726','admin','ZKEASOFT','2018-05-21 23:46:28.726',NULL,NULL,'ZONE-1'),
('17ef6a804c524ed298492e404ad5576b','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.303','admin','ZKEASOFT','2018-05-21 23:46:19.303',NULL,NULL,'ZONE-0'),
('18f2e25482b444ba8861238637861ba5','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.746','admin','ZKEASOFT','2018-05-21 23:46:34.746',NULL,NULL,'ZONE-1'),
('19d3d679eaf74a21bf4f123487eaee0d','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193','admin','ZKEASOFT','2018-05-21 23:42:49.193',NULL,NULL,'ZONE-4'),
('1c232c2d572f415082e74771e37e3580','0846a33e56bf45d5aae602ef40d87444',NULL,'Bottom',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893','admin','ZKEASOFT','2017-11-19 17:48:10.636',NULL,NULL,'ZONE-4'),
('1cd27416b7db429bb639d8950cc29793','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.196','admin','ZKEASOFT','2018-05-21 23:42:49.196',NULL,NULL,'ZONE-1'),
('23ec6afdd2ea49dd8fb5839ae2bec741','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.983','admin','ZKEASOFT','2018-05-21 23:42:39.983',NULL,NULL,'ZONE-4'),
('25ce97efa1484065995e6e5aaade9a83','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.160','admin','ZKEASOFT','2018-05-21 23:42:49.160',NULL,NULL,'ZONE-3'),
('2921f81e4531493694790faed3ed76e9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.310','admin','ZKEASOFT','2018-05-21 23:46:19.310',NULL,NULL,'ZONE-1'),
('294c86a5d87a46d49f41999c495344ea','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.730','admin','ZKEASOFT','2018-05-21 23:46:28.730',NULL,NULL,'ZONE-3'),
('2fd26e7c5a844bea8a2422d074d73109','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.330','admin','ZKEASOFT','2018-05-21 23:45:43.330',NULL,NULL,'ZONE-4'),
('302009d870f74aa1b5b55dc6f1c6385f','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810','admin','ZKEASOFT','2018-05-21 23:45:44.810',NULL,NULL,'ZONE-2'),
('34f9c91a64ee4986bec02073ea77035d','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.926','admin','ZKEASOFT','2018-05-21 23:45:21.926',NULL,NULL,'ZONE-0'),
('360d6da3007e41d68c521c3154173c7a','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.783','admin','ZKEASOFT','2018-05-21 23:45:45.783',NULL,NULL,'ZONE-0'),
('39af0cedd23a42d08c2c93e7b0dbaee0','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.356','admin','ZKEASOFT','2018-05-21 23:46:09.356',NULL,NULL,'ZONE-2'),
('3b3f74427bf84da999406f98f7d8cdd7','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.690','admin','ZKEASOFT','2018-05-21 23:45:46.690',NULL,NULL,'ZONE-4'),
('3ca302874c164b7b9691ca948300417b','1dae90cf6a8547538cc0c369b9943c01',NULL,'Content Right',NULL,'admin',NULL,'2015-08-31 11:58:54.256','admin','ZKEASOFT','2017-11-19 17:48:39.823',NULL,NULL,'ZONE-3'),
('3f166bd62afb4a888801ec561cbc15ef','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.986','admin','ZKEASOFT','2018-05-21 23:42:39.986',NULL,NULL,'ZONE-1'),
('40a562598d3a44a98646519094631628','1dae90cf6a8547538cc0c369b9943c01',NULL,'Top',NULL,'admin',NULL,'2015-08-31 11:58:54.253','admin','ZKEASOFT','2017-11-19 17:48:39.840',NULL,NULL,'ZONE-0'),
('4cf5d05f2b954a7e8904713ad6781a61','1dae90cf6a8547538cc0c369b9943c01',NULL,'Content Left',NULL,'admin',NULL,'2015-08-31 11:58:54.256','admin','ZKEASOFT','2017-11-19 17:48:39.846',NULL,NULL,'ZONE-2'),
('572963d3322b4cddb7d94d6bec2f08c7','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.343','admin','ZKEASOFT','2018-05-21 23:45:43.343',NULL,NULL,'ZONE-0'),
('57c4f0c9fb31439c913d0221c20a6343','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.113','admin','ZKEASOFT','2018-05-21 23:46:15.113',NULL,NULL,'ZONE-0'),
('58f65b43d383423a9456102ea06450c1','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.740','admin','ZKEASOFT','2018-05-21 23:46:34.740',NULL,NULL,'ZONE-4'),
('5d3fdb35e2c54313850c69c401548b4d','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.753','admin','ZKEASOFT','2018-05-21 23:46:34.753',NULL,NULL,'ZONE-0'),
('5d84136b25ea4bd4a65779e0bb7acc3d','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.680','admin','ZKEASOFT','2018-05-21 23:45:46.680',NULL,NULL,'ZONE-2'),
('6920822269c34d5781b7df72fa37df16','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.916','admin','ZKEASOFT','2018-05-21 23:45:21.916',NULL,NULL,'ZONE-4'),
('6bba8443507f4273b2b61048f7c71f40','0846a33e56bf45d5aae602ef40d87444',NULL,'Focal',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.886','admin','ZKEASOFT','2017-11-19 17:48:10.903',NULL,NULL,'ZONE-1'),
('7480ffc27b034c51aca983367316bb7c','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.353','admin','ZKEASOFT','2018-05-21 23:46:09.353',NULL,NULL,'ZONE-0'),
('7577ca3b1628498c8f38b42545f3c1b3','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.120','admin','ZKEASOFT','2018-05-21 23:46:15.120',NULL,NULL,'ZONE-1'),
('75be97a54a4b430ca6d26b8285bbce8d','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.346','admin','ZKEASOFT','2018-05-21 23:45:43.346',NULL,NULL,'ZONE-2'),
('787c9336ef3341d4b63e710f16281424','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350','admin','ZKEASOFT','2018-05-21 23:46:09.350',NULL,NULL,'ZONE-3'),
('7c1d057dff154fa0836ebe82b5f08b6b','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.786','admin','ZKEASOFT','2018-05-21 23:45:45.786',NULL,NULL,'ZONE-2'),
('7fe7ceb43d734faca8a21e78185995d6','1dae90cf6a8547538cc0c369b9943c01',NULL,'Bottom',NULL,'admin',NULL,'2015-08-31 11:58:54.260','admin','ZKEASOFT','2017-11-19 17:48:39.873',NULL,NULL,'ZONE-4'),
('82e28c8ca83c4a52847b2f759b4d1ab0','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.756','admin','ZKEASOFT','2018-05-21 23:46:34.756',NULL,NULL,'ZONE-2'),
('85b6e66b7b3345e9a482af084da307d3','0846a33e56bf45d5aae602ef40d87444',NULL,'Other',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.890','admin','ZKEASOFT','2017-11-19 17:48:10.963',NULL,NULL,'ZONE-3'),
('8b3a4cd737594c00a7e34c17c1bbc9fc','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.760','admin','ZKEASOFT','2018-05-21 23:45:45.760',NULL,NULL,'ZONE-4'),
('8d4f87b76dfa4c96ae71734ef5ad08fd','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.656','admin','ZKEASOFT','2018-05-21 23:45:47.656',NULL,NULL,'ZONE-3'),
('93ed2f72cef64bf891e0a1ef999c0ebc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.800','admin','ZKEASOFT','2018-05-21 23:45:44.800',NULL,NULL,'ZONE-3'),
('9774034c2832414e9ccaa39b43685710','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.670','admin','ZKEASOFT','2018-05-21 23:45:47.670',NULL,NULL,'ZONE-2'),
('9b5eab51ed78479f9a3b6cd88f30865c','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340','admin','ZKEASOFT','2018-05-21 23:45:43.340',NULL,NULL,'ZONE-3'),
('9c39ce55ae2b46fbaab97287436b651f','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340','admin','ZKEASOFT','2018-05-21 23:45:43.340',NULL,NULL,'ZONE-1'),
('9c87f7474bcf450a942838b42335a928','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993','admin','ZKEASOFT','2018-05-21 23:46:12.993',NULL,NULL,'ZONE-0'),
('9ccbb73c31ba46caa173b1ff5208cd4e','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193','admin','ZKEASOFT','2018-05-21 23:42:49.193',NULL,NULL,'ZONE-2'),
('a30b21857de2411982aa4f40e0fcba59','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993','admin','ZKEASOFT','2018-05-21 23:46:12.993',NULL,NULL,'ZONE-3'),
('a4bd66363b6a4f2ea1d21ed601c69866','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.796','admin','ZKEASOFT','2018-05-21 23:45:44.796',NULL,NULL,'ZONE-1'),
('a979c68e8f49405fa3c5cc21fafdb7b9','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.116','admin','ZKEASOFT','2018-05-21 23:46:15.116',NULL,NULL,'ZONE-4'),
('aae6dbf58fff429d9a32627933854a8f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.693','admin','ZKEASOFT','2018-05-21 23:45:46.693',NULL,NULL,'ZONE-1'),
('af49758840b345a6ab910d11a691fc99','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.666','admin','ZKEASOFT','2018-05-21 23:45:47.666',NULL,NULL,'ZONE-0'),
('b0a92bfb56704f8aaf7dade22c3db2d2','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.976','admin','ZKEASOFT','2018-05-21 23:42:39.976',NULL,NULL,'ZONE-2'),
('be7a1e6a999b4264aab2b5ac593909a8','0846a33e56bf45d5aae602ef40d87444',NULL,'Top',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.526','admin','ZKEASOFT','2017-11-19 17:48:10.966',NULL,NULL,'ZONE-0'),
('bed6101f906b4e50b3ba034bfe39d184','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.833','admin','ZKEASOFT','2018-05-21 23:42:39.833',NULL,NULL,'ZONE-3'),
('c1f4cb36e7924ff99ff38aeb3983eca3','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.343','admin','ZKEASOFT','2018-05-21 23:46:09.343',NULL,NULL,'ZONE-4'),
('c22c6484c2864c82932ec6ad0a20492a','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.923','admin','ZKEASOFT','2018-05-21 23:45:21.923',NULL,NULL,'ZONE-1'),
('c291af01f0b443c3ad59b5b289d97e1f','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.306','admin','ZKEASOFT','2018-05-21 23:46:19.306',NULL,NULL,'ZONE-2'),
('c7bcd0a9d172432bafbf9f5a986685f2','0846a33e56bf45d5aae602ef40d87444',NULL,'Main',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893','admin','ZKEASOFT','2017-11-19 17:48:10.966',NULL,NULL,'ZONE-2'),
('ca49f8b95d724a3bb1cc01a10ca72cb9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.296','admin','ZKEASOFT','2018-05-21 23:46:19.296',NULL,NULL,'ZONE-3'),
('d5a2daad909b4ecfb02988584d8903ad','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.776','admin','ZKEASOFT','2018-05-21 23:45:45.776',NULL,NULL,'ZONE-3'),
('d5f02570e4814439acc86a1874cb8f07','1dae90cf6a8547538cc0c369b9943c01',NULL,'Main',NULL,'admin',NULL,'2015-08-31 11:58:54.256','admin','ZKEASOFT','2017-11-19 17:48:39.886',NULL,NULL,'ZONE-1'),
('d79708e9937541c9833467ed6f31ebda','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.980','admin','ZKEASOFT','2018-05-21 23:46:12.980',NULL,NULL,'ZONE-4'),
('db297e847b15465cb4ee5d46cd7ca168','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673','admin','ZKEASOFT','2018-05-21 23:45:47.673',NULL,NULL,'ZONE-1'),
('de442cdec7044de895680750884b1eb4','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.773','admin','ZKEASOFT','2018-05-21 23:45:45.773',NULL,NULL,'ZONE-1'),
('df2ff4bd579d4e6cb8855b196ba2c322','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810','admin','ZKEASOFT','2018-05-21 23:45:44.810',NULL,NULL,'ZONE-0'),
('e333b823cf0e4d40a7999bc2787370b2','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.723','admin','ZKEASOFT','2018-05-21 23:46:28.723',NULL,NULL,'ZONE-4'),
('e74560705e8c414bbb284cc95dc54d8a','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733','admin','ZKEASOFT','2018-05-21 23:46:28.733',NULL,NULL,'ZONE-2'),
('ea3ca53e83924909bfab5e9242583a93','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.926','admin','ZKEASOFT','2018-05-21 23:45:21.926',NULL,NULL,'ZONE-3'),
('ea5cdd077bf44e16b8fc4a22433d63ca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.996','admin','ZKEASOFT','2018-05-21 23:46:12.996',NULL,NULL,'ZONE-2'),
('eaaf42be824141679c05866ad9a8acf2','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350','admin','ZKEASOFT','2018-05-21 23:46:09.350',NULL,NULL,'ZONE-1'),
('ee21c0c23a834cfaae370413da4630cc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.780','admin','ZKEASOFT','2018-05-21 23:45:44.780',NULL,NULL,'ZONE-4'),
('eeb31d7a5ee7485ea014708e14f66cac','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673','admin','ZKEASOFT','2018-05-21 23:45:47.673',NULL,NULL,'ZONE-4'),
('f41ee7803dc6431bafb45ff035fca916','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.636','admin','ZKEASOFT','2018-05-21 23:45:46.636',NULL,NULL,'ZONE-3'),
('f4f64f6755be449c8ccb6c5969749b19','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733','admin','ZKEASOFT','2018-05-21 23:46:28.733',NULL,NULL,'ZONE-0'),
('f844832366834170a8c8caeb8c64b96b','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.106','admin','ZKEASOFT','2018-05-21 23:46:15.106',NULL,NULL,'ZONE-3'),
('fb0f4ea5b0ed44289f665eec3b829ea2','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.750','admin','ZKEASOFT','2018-05-21 23:46:34.750',NULL,NULL,'ZONE-3');
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
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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


DROP TABLE IF EXISTS `Currency`;
CREATE TABLE `Currency` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Code` VARCHAR(10) CHARACTER SET utf8mb4  NULL,
	`Symbol` VARCHAR(10) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `Currency` DISABLE KEYS */;
INSERT INTO `Currency` VALUES
(1,'Australian Dollar',NULL,'AUD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'Brazilian Real',NULL,'BRL','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'Canadian Dollar',NULL,'CAD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'Chinese Renmenbi',NULL,'CNY','￥',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'Czech Koruna',NULL,'CZK','Kč',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'Danish Krone',NULL,'DKK','kr',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'Euro',NULL,'EUR','€',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'Hong Kong Dollar',NULL,'HKD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,'Hungarian Forint',NULL,'HUF','HUF',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'Indian Rupee',NULL,'INR','INR',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'Israeli New Shekel',NULL,'ILS','₪',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(12,'Japanese Yen',NULL,'JPY','￥',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13,'Malaysian Ringgit',NULL,'MYR','MYR',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(14,'Mexican Peso',NULL,'MXN','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(15,'New Taiwan Dollar',NULL,'TWD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(16,'New Zealand Dollar',NULL,'NZD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(17,'Norwegian Krone',NULL,'NOK','NOK',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(18,'Philippine Peso',NULL,'PHP','PHP',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(19,'Polish Zloty',NULL,'PLN','zł',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(20,'Pound Sterling',NULL,'GBP','£',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,'Russian Ruble',NULL,'RUB','RUB',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(22,'Singapore Dollar',NULL,'SGD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(23,'Swedish Krona',NULL,'SEK','SEK',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(24,'Swiss Franc',NULL,'CHF','CHF',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(25,'Thai Baht',NULL,'THB','฿',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(26,'United States Dollar',NULL,'USD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Currency` ENABLE KEYS */;

DROP TABLE IF EXISTS `DataArchived`;
CREATE TABLE `DataArchived` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Data` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
('Alipay.AopSdk.AspnetCore.AlipayOptions','{\"AppId\":null,\"Uid\":null,\"Gatewayurl\":null,\"PrivateKey\":null,\"AlipayPublicKey\":null,\"SignType\":\"RSA2\",\"CharSet\":\"UTF-8\",\"IsKeyFromFile\":false}',NULL,NULL,NULL,NULL,NULL,'2019-04-24 19:55:03.626',NULL,NULL,'2019-04-24 19:55:03.626'),
('ZKEACMS.Currency.CurrencyOption','{\"CurrencyID\":4,\"Name\":\"Chinese Renmenbi\",\"Code\":\"CNY\",\"Symbol\":\"￥\"}',NULL,NULL,NULL,'admin','ZKEASOFT','2021-03-06 22:16:39.503','admin','ZKEASOFT','2021-03-06 22:16:43.466'),
('ZKEACMS.GlobalScripts.Models.LiveChatScript','{\"Location\":0,\"Script\":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:35.293',NULL,NULL,'2019-04-07 16:38:35.293'),
('ZKEACMS.GlobalScripts.Models.StatisticsScript','{\"Location\":0,\"Script\":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:36.006',NULL,NULL,'2019-04-07 16:38:36.006'),
('ZKEACMS.Message.Models.MessageNotificationConfig','{\"MessageNotifyEmails\":null,\"CommentNotifyEmails\":null}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-08-15 15:25:53.916','admin','ZKEASOFT','2018-08-15 15:25:53.916'),
('ZKEACMS.Shop.AliPayConfigOptions','{\"AppId\":\"2016082000296332\",\"Uid\":\"2088102172250345\",\"Gatewayurl\":\"https://openapi.alipaydev.com/gateway.do\",\"PrivateKey\":\"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP\",\"AlipayPublicKey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB\",\"SignType\":\"RSA2\",\"CharSet\":\"UTF-8\",\"IsKeyFromFile\":false}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-11 17:02:14.576','admin','ZKEASOFT','2018-04-11 17:02:14.576');
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
(82,'CultureSetting@CultureMode','Standalone domain','2',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(83,'WidgetStatus','Visible','1',1,0,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),
(84,'WidgetStatus','Hidden','2',2,0,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),
(85,'WidgetStatus','Deleted','3',3,0,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
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
(1,4,2,0,0);
/*!40000 ALTER TABLE `DBVersion` ENABLE KEYS */;

DROP TABLE IF EXISTS `EA_ActionBody`;
CREATE TABLE `EA_ActionBody` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Body` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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

/*!40000 ALTER TABLE `EA_ActionBody` DISABLE KEYS */;
INSERT INTO `EA_ActionBody` VALUES
(1,'<div>
  <h3>
     New Message Received
  </h3>
  <table border=\"1\" cellspacing=\"0\" cellpadding=\"5\" style=\"border-color: #eee;\">
    <tbody>
      <tr>
        <td>Name</td>
        <td>{{this.Model.Title}}</td>
      </tr>
      <tr>
        <td>Email</td>
        <td>{{this.Model.Email}}</td>
      </tr>
      <tr>
        <td>Message Content</td>
        <td>{{this.Model.PostMessage}}</td>
      </tr>
    </tbody>
  </table>
</div>','Message Board Message Template',NULL,1,'admin','ZKEASOFT','2023-03-05 18:49:06.000','admin','ZKEASOFT','2023-03-16 22:04:16.673'),
(2,'<div>
  <h3>
    Reset Password
  </h3>
  <p>
    Click the link below or copy and paste the link into your browser.
  </p>
  <a href=\"{{this.Model.Link}}\" target=\"_blank\">{{this.Model.Link}}</a>
</div>','Reset Password Email Template',NULL,1,'admin','ZKEASOFT','2023-03-11 21:32:20.000','admin','ZKEASOFT','2023-03-16 22:03:47.810'),
(3,'<div>
  <h3>
    New Comment Received
  </h3>
  <table border=\"1\" cellspacing=\"0\" cellpadding=\"5\" style=\"border-color: #eee;\">
    <tbody>
      <tr>
        <td>Page Title</td>
        <td>{{this.Model.Title}}</td>
      </tr>
      <tr>
        <td>Username</td>
        <td>{{this.Model.UserName}}</td>
      </tr>
      <tr>
        <td>Comment Content</td>
        <td>{{this.Model.CommentContent}}</td>
      </tr>
      <tr>
        <td>Page URL</td>
        <td>{{this.Model.PagePath}}</td>
      </tr>
    </tbody>
  </table>
</div>','New Comment Email Template',NULL,1,'admin','ZKEASOFT','2023-03-11 21:44:54.000','admin','ZKEASOFT','2023-03-16 22:03:57.626'),
(4,'<div>
  <h3>
    {{this.Model.Form.Title}}
  </h3>
  <table border=\"1\" cellspacing=\"0\" cellpadding=\"5\" style=\"border-color: #eee;\">
    <thead>
      <tr>
        <th>Field</th>
        <th>Content</th>
      </tr>
    </thead>
    <tbody>
      {% for field in this.Model.Form.FormFields %}
        <tr>
          <td>
            {{field.DisplayName}}
          </td>
          <td>
            {{field.DisplayValue}}
          </td>
        </tr>
      {% endfor %}
    </tbody>
  </table>
</div>','Custom Form Email Template',NULL,1,'admin','ZKEASOFT','2023-03-11 22:06:21.000','admin','ZKEASOFT','2023-03-16 22:03:40.576');
/*!40000 ALTER TABLE `EA_ActionBody` ENABLE KEYS */;

DROP TABLE IF EXISTS `EA_EventAction`;
CREATE TABLE `EA_EventAction` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Event` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Actions` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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

/*!40000 ALTER TABLE `EA_EventAction` DISABLE KEYS */;
INSERT INTO `EA_EventAction` VALUES
(1,'ZKEACMS.Message.Events.OnMessageSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: New message received
    to: webmaster@zkea.net
    bodyContentId: 1','Send new message email notification',NULL,1,'admin','ZKEASOFT','2023-03-03 21:53:14.000','admin','ZKEASOFT','2023-03-12 21:12:14.786'),
(2,'ZKEACMS.Events.OnResetPassword','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: Reset password
    to: {{this.Model.Email}}
    bodyContentId: 2','Send reset password email notification',NULL,1,'admin','ZKEASOFT','2023-03-11 21:33:51.000','admin','ZKEASOFT','2023-03-16 21:59:47.366'),
(3,'ZKEACMS.Message.Events.OnCommentsSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: New comment received
    to: webmaster@zkea.net
    bodyContentId: 3','Send new comment email notification',NULL,1,'admin','ZKEASOFT','2023-03-11 21:44:02.000','admin','ZKEASOFT','2023-03-16 22:05:12.060'),
(4,'ZKEACMS.FormGenerator.Events.OnFormDataSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: New form submission received
    to: {{this.Model.Form.NotificationReceiver}}
    bodyContentId: 4','Send custom form email notification',NULL,1,'admin','ZKEASOFT','2023-03-11 22:07:27.000','admin','ZKEASOFT','2023-03-16 22:06:44.226');
/*!40000 ALTER TABLE `EA_EventAction` ENABLE KEYS */;

DROP TABLE IF EXISTS `EA_PendingTask`;
CREATE TABLE `EA_PendingTask` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Identifier` VARCHAR(200) CHARACTER SET utf8mb4  NOT NULL,
	`HandlerName` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Data` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`LogMessage` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`RetryCount` INT  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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


DROP TABLE IF EXISTS `FluidContentGroup`;
CREATE TABLE `FluidContentGroup` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Icon` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
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


DROP TABLE IF EXISTS `FluidContentTemplate`;
CREATE TABLE `FluidContentTemplate` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`ApplyTo` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Template` LONGTEXT CHARACTER SET utf8mb4  NULL,
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


DROP TABLE IF EXISTS `FluidContentType`;
CREATE TABLE `FluidContentType` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`ContentSchema` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`GroupID` INT  NULL,
	`RoleID` INT  NULL,
	`Icon` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `FluidContentValue`;
CREATE TABLE `FluidContentValue` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`ContentTypeID` INT  NULL,
	`Title` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Content` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`ContentID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CultureID` INT  NULL,
	`Url` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`SEOTitle` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`SEOKeyWord` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`SEODescription` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
('5ed56d90ac154e73befa6fbc981ae3ae','Survey','[{\"ID\":\"f05da60a6e3b448fadbf7c5c040a7d5c\",\"Name\":\"Label\",\"DisplayName\":\"Survey\",\"Value\":null,\"Description\":\"Welcome to use ZKEACMS, this is an custom form\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"41481e6eefa048feae380460b0cd5661\",\"Name\":\"SingleLine\",\"DisplayName\":\"Name\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-6\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"bfd1418684a64890a7099f764baa24b3\",\"Name\":\"Number\",\"DisplayName\":\"Phone\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-6\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"7e635c8fdd124b6b94f037d3bf112bc0\",\"Name\":\"Email\",\"DisplayName\":\"Email\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"4d61bb5f733c47778975cc6cfbc84123\",\"Name\":\"SingleLine\",\"DisplayName\":\"QQ\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"b85aeb9beaf64f509726f16ba582ec3c\",\"Name\":\"SingleLine\",\"DisplayName\":\"WeChat\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-4\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"a2aea72c496e4a458265f7ceadb3653a\",\"Name\":\"Address\",\"DisplayName\":\"Province\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"0932ca1f1f7f4af098d51e4b1ac18b94\",\"Name\":\"SingleLine\",\"DisplayName\":\"Address\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null},{\"ID\":\"572c61930769464d97f3d31771ecf65e\",\"Name\":\"Radio\",\"DisplayName\":\"How do you know ZKEACMS?\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":true,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"SE(search engine)\",\"Value\":\"70a915caf7a84e9086d5dbdf26ed3053\"},{\"DisplayText\":\"Blog\",\"Value\":\"419a7d1d91974282af5c26688fbe0e8c\"},{\"DisplayText\":\"From frends\",\"Value\":\"227f6d2f6b39479aaf2d5b79dbefdc5c\"},{\"DisplayText\":\"Other\",\"Value\":\"ef50fb3bccf74d6487320e53781fb1ec\"}],\"AdditionalSettings\":null},{\"ID\":\"845830a5c8be4b81866a8cef83049899\",\"Name\":\"Checkbox\",\"DisplayName\":\"What do you normally use ZKEACMS for\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"Web Site\",\"Value\":\"5f0fbb9faa0343e0958a896fe3cead4f\"},{\"DisplayText\":\"Blog\",\"Value\":\"65902e51d35142019c4aab8badff9e35\"},{\"DisplayText\":\"Other\",\"Value\":\"944343b3ed904b94a9db6950dbdcccf3\"}],\"AdditionalSettings\":null},{\"ID\":\"2fe6e4baf01e4cb897986991c920df56\",\"Name\":\"Dropdown\",\"DisplayName\":\"What do you think of ZKEACMS\",\"Value\":null,\"Description\":\"\",\"Placeholder\":null,\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":[{\"DisplayText\":\"Great\",\"Value\":\"fc3929826e364318b7a3436d991fb097\"},{\"DisplayText\":\"Good\",\"Value\":\"619e09c2864b41ae81f4f90e7cab92ba\"},{\"DisplayText\":\"Just so so\",\"Value\":\"fd1279a07150490f9a1f69c85298e22c\"},{\"DisplayText\":\"Bad\",\"Value\":\"ef19983754504a9482232dd6be01f34d\"}],\"AdditionalSettings\":null},{\"ID\":\"2868de2d8e9b4d269da891342e6dc95b\",\"Name\":\"Paragraph\",\"DisplayName\":\"Your comments or suggestions\",\"Value\":null,\"Description\":\"\",\"Placeholder\":\"\",\"IsRequired\":false,\"Size\":4,\"Column\":\"col-md-12\",\"FieldOptions\":null,\"AdditionalSettings\":null}]',NULL,NULL,'',NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:07:58.013');
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
('062018a8e5cf48b4a0d90296e7f4e965','<hr />'),
('09617f6142934daaadee6cfb9df6d66f','<p>This is a paragraph text. You can add headings, text, images, tables, lists, links, etc. within the paragraph. For example:</p>
<p>ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layouts, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, and allows direct page design on the preview page.</p>
<p>ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>'),
('357a58069e8047a289e10b920061d57d','<hr />'),
('3b8beb945c9f4c9390a6122d8b4788d5','<hr />'),
('3e3783f4b7ca421488f2bf08d32fe2f0','<hr />'),
('4d67b2d10f4a425586e3b1115f7f7072','<hr />'),
('50f810582d28440eb3bdff9ee5b1ef24','<div>
<div class=\"row\">
<div class=\"col-sm-6\"><img src=\"/Images/28.jpg\" alt=\"\" /></div>
<div class=\"col-sm-6\">
<h3>Why Choose Us?</h3>
<p>We mainly focus on multinational companies that have entered the Chinese market, industry-leading foreign enterprises, well-known Chinese large and medium-sized enterprises, and more rapidly growing emerging companies.</p>
<p>We are particularly good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>
<p>&nbsp;</p>
<p><a class=\"btn btn-info\" href=\"#\">Read More</a></p>
</div>
</div>
</div>'),
('56991d0ff59d4c1db27aff3a50fcb382','<div class=\"page-header\">
<h1>ZKEASOFT</h1>
</div>
<p>ZKEASOFT provides high-quality software services. We adhere to the principles of open source and openness, making software services better.</p>'),
('62ca3b6b6ea644b4a64501021b02f13b','<hr />'),
('8cc061c2e2514ef9b85bbecdec3f84ab','<hr />'),
('a686b84212f94b3b8315093b2e8b883d','<div id=\"footer\">ZKEACMS is open-source software, available for free download for learning and use
<p>Copyright @&nbsp;2015 ZKEASOFT. All Rights Reserved | <a href=\"http://www.zkea.net/\" target=\"_blank\" rel=\"noopener\">www.zkea.net</a></p>
</div>'),
('bb7dab4f077745ef8b5b425eaabb423c','<h1 style=\"text-align: center; font-size: 3em;\">ZKEASOFT</h1>
<p>&nbsp;</p>
<p style=\"text-align: center;\">ZKEASOFT provides high-quality software services. We adhere to the principles of open source and openness, making software services better.</p>
<p style=\"text-align: center;\"><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a> is an open-source CMS developed using ASP.NET MVC4, based on <a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>.</p>
<p style=\"text-align: center;\">ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layouts, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p style=\"text-align: center;\">ZKEACMS uses visual editing design, truly achieving WYSIWYG, and allows direct page design on the preview page.</p>
<p style=\"text-align: center;\">ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>
<p style=\"text-align: center;\">&nbsp;</p>
<p style=\"text-align: center;\"><a class=\"btn btn-info\" href=\"#\">Read More</a></p>'),
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
('2b510992f0174e668ca53116434e065c','~/images/bg4.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
('3017aef0eabc451b81daebe6bae68857','~/images/bg4.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
('43bb869688ee4752a3127dd19ccc6caa','http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
('7679a5060035444d85fe49dc3c02cada','http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
('8ea46d2923ad4d62958c565b19bb172d','~/images/bg3.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
('e5ba6adb117440959757b98e4289430f','~/images/bg3.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
('fee7f4d7d7e641b0bfa74491a543d245','~/images/30.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ImageWidget` ENABLE KEYS */;

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
('1061019b1bcd4bf3aeb3df647c74c309','#','~/product','Product',1,NULL,NULL,1,3,'admin','ZKEASOFT','2016-03-10 23:33:03.653','admin','ZKEASOFT','2017-10-15 18:05:28.830'),
('6beb1a2a54b947179ec20dd331e375a2','#','~/index','Home',0,NULL,NULL,1,1,'admin',NULL,'2015-09-01 09:55:20.483','admin','ZKEASOFT','2017-10-15 18:05:28.820'),
('7b5bb24dea6d47618ed027190b4e5d94','#','~/contact','Contact',0,NULL,NULL,1,5,'admin','ZKEASOFT','2017-03-19 21:06:21.360','admin','ZKEASOFT','2017-10-15 18:05:28.833'),
('d122a50356bf46c8a8c8349612145e24','#','~/questionnaire','Survey',0,NULL,NULL,1,4,'admin','ZKEASOFT','2017-10-15 18:05:25.946','admin','ZKEASOFT','2017-10-15 18:05:28.836'),
('e4658e8af8434a05b773b666c6c67cd5','#','~/article','News',1,NULL,NULL,1,2,'admin','ZKEASOFT','2016-03-10 23:32:53.000','admin','ZKEASOFT','2017-10-15 18:05:28.826');
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
('6ee67036e78b4b498d932ab2d76757fb','container',NULL,'~/images/logo_zkea.png','navbar-left',NULL,'#',0);
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
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
	`ShippingOption` INT  NULL,
	`SubTotal` DECIMAL (19,4)  NULL,
	`Tax` DECIMAL (19,4)  NULL,
	`Shipping` DECIMAL (19,4)  NULL,
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
	`BasketID` INT  NULL,
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
('ApplicationSetting_Manage',1,'Manage Application Settings',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.566','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('ApplicationSetting_View',1,'View Application Settings',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.646','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Article_Manage',1,'Manage Articles',NULL,'Articles',NULL,'admin','ZKEASOFT','2016-08-01 13:18:40.493','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Article_Publish',1,'Publish Articles',NULL,'Articles',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.820','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Article_View',1,'View Articles',NULL,'Articles',NULL,'admin','ZKEASOFT','2016-08-01 13:17:59.120','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('ArticleType_Manage',1,'Manage Article Categories',NULL,'Articles',NULL,'admin','ZKEASOFT','2016-08-01 13:22:24.886','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('ArticleType_View',1,'View Article Categories',NULL,'Articles',NULL,'admin','ZKEASOFT','2016-08-01 13:19:54.500','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Carousel_Manage',1,'Manage Carousels',NULL,'Carousel',NULL,'admin','ZKEASOFT','2016-08-01 13:45:46.190','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Carousel_View',1,'View Carousels',NULL,'Carousel',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.096','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Comments_Manage',1,'Manage Comments',NULL,'Message Board',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.053','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Comments_View',1,'View Comments',NULL,'Message Board',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.050','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Config_Currency',1,'Currency',NULL,'Settings',NULL,'admin','ZKEASOFT','2021-03-06 22:16:30.726','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('EventNotification_Manage',1,'Manage Event Notifications',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.766','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('EventNotification_View',1,'View Event Notifications',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.760','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('EventViewer_Manage',1,'View Error Logs',NULL,'Settings',NULL,'admin','ZKEASOFT','2017-07-11 15:43:52.146','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Form_Manage',1,'Manage Forms',NULL,'Custom Forms',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Form_View',1,'View Form',NULL,'Custom Form',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.830','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('FormData_Export',1,'Export Form Data',NULL,'Custom Form',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.853','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('FormData_Manage',1,'Manage Form Data',NULL,'Custom Form',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.850','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('FormData_View',1,'View Form Data',NULL,'Custom Form',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Language_Manage',1,'Translate',NULL,'Settings',NULL,'admin','ZKEASOFT','2017-11-17 11:47:13.093','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Layout_Manage',1,'Manage Layout',NULL,'Layout',NULL,'admin','ZKEASOFT','2016-08-01 12:43:52.696','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Layout_View',1,'View Layout',NULL,'Layout',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.690','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('LiveChatScript_Manage',1,'Set Online Customer Service Code',NULL,'Settings',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Media_Manage',1,'Manage Media Library',NULL,'Media Library',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.553','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Media_View',1,'View Media Library',NULL,'Media Library',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.090','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Message_Manage',1,'Manage Messages',NULL,'Message Board',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.980','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Message_View',1,'View Messages',NULL,'Message Board',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.960','admin','ZKEASOFT','2023-03-18 16:45:26.283'),
('Navigation_Manage',1,'Manage Navigation',NULL,'Navigation',NULL,'admin','ZKEASOFT','2016-08-01 13:40:38.230','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Navigation_View',1,'View Navigation',NULL,'Navigation',NULL,'admin','ZKEASOFT','2016-08-01 13:38:21.943','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('NotificationContent_Manage',1,'Manage Notification Content',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('NotificationContent_View',1,'View Notification Content',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Order_Manage',1,'Manage Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Order_Refund',1,'Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Order_View',1,'View Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Order_ViewOrderPayment',1,'View Transactions',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Order_ViewOrderRefund',1,'View Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Page_Manage',1,'Manage Page',NULL,'Page',NULL,'admin','ZKEASOFT','2016-08-01 13:41:08.463','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Page_View',1,'View Page',NULL,'Page',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.683','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Payment_Config_Manage',1,'Payment Setting',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('PendingTask_Manage',1,'Manage Pending Task',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('PendingTask_View',1,'View Pending Task',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Plugin_View',1,'Plugin',NULL,'Setting',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.726','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Product_Manage',1,'Manage Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Product_Publish',1,'Publish Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Product_View',1,'View Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.656','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('ProductCategory_Manage',1,'Manage Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('ProductCategory_View',1,'View Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('ProductCategoryTag_Manage',1,'Manage Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('ProductCategoryTag_View',1,'View Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('RobotsSetting',1,'Robots.txt',NULL,'Setting',NULL,'admin','ZKEASOFT','2018-08-12 22:51:30.340','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Role_Manage',1,'Manage Role',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.566','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Role_View',1,'View Role',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.660','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('SMTPSetting',1,'SMTP Settings',NULL,'Settings',NULL,'admin','ZKEASOFT','2018-06-12 19:13:49.496','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('StatisticsScript_Manage',1,'Set Visitor Statistics Code',NULL,'Settings',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Template_Manage',1,'Manage Templates',NULL,'Page Layout',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.306','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Template_View',1,'View Templates',NULL,'Page Layout',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.303','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('TemplateImporter_Import',1,'Import HTML Template',NULL,'Settings',NULL,'admin','ZKEASOFT','2020-03-14 11:41:54.510','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Theme_Manage',1,'Manage Themes',NULL,'Themes',NULL,'admin','ZKEASOFT','2016-08-01 13:42:48.600','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('Theme_View',1,'View Themes',NULL,'Themes',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.083','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('UrlRedirect_Manage',1,'Manage URL Redirects',NULL,'URL Redirects',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.170','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('UrlRedirect_View',1,'View URL Redirects',NULL,'URL Redirects',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.120','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('User_Manage',1,'Manage Users',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.566','admin','ZKEASOFT','2023-03-18 16:45:26.286'),
('User_View',1,'View Users',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.646','admin','ZKEASOFT','2023-03-18 16:45:26.286');
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
(1,'Cloud Revolver Gaming Headset','/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png',NULL,2,NULL,500.0000,399.0000,NULL,NULL,NULL,'<h1>HyperX Cloud Revolver</h1>
<p>If you love gaming, a headset that gives you a great advantage is essential. The HyperX Cloud Revolver™ is a premium headset, crafted to meet the needs of advanced OC or home gaming enthusiasts. The next-generation drivers separate bass, mid, and treble, creating a precise, high-quality sound. The Revolver series features stereo and plug-and-play Dolby® 7.1 surround sound modes, offering studio-grade soundstage and next-gen drivers, excelling in FPS and open environments. Both headsets feature a durable solid steel frame and signature HyperX memory foam for award-winning comfort. If you want unparalleled comfort, excellent sound quality, and clear communication, the Cloud Revolver headset is your best choice.</p>
<h3>Plug-and-play Dolby® Surround Sound 7.1</h3>
<p>Simulated 7 positional speakers create precise sound by distance and depth, turning audio entertainment into a cinematic experience without software or setup. Available on Cloud Revolver S.</p>
<h3>Advanced USB Audio Control Box with DSP Sound Card</h3>
<p>The USB digital signal processing sound card delivers consistent high-quality audio on any machine. The clip-on audio control box features backlit buttons for instant mute, Dolby audio activation, switching between three preset EQs, and adjusting mic and volume levels. Available on Cloud Revolver S.</p>
<h3>Next-Gen 50mm Drivers</h3>
<p>50mm directional drivers parallel to the ears for precise positioning and powerful bass. Available on Cloud Revolver and Cloud Revolver S.</p>
<h3>HyperX Signature Memory Foam</h3>
<p>Award-winning HyperX memory foam for unparalleled comfort, allowing you to game longer and more comfortably. Available on Cloud Revolver and Cloud Revolver S.</p>','Simulated 7 positional speakers create precise sound by distance and depth',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,'Cloud-Revolver',NULL,NULL,'HX-HSCR-BK/AS','admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 21:52:05.396'),
(2,'Alloy FPS Mechanical Gaming Keyboard','/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png','/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,3,'Black',500.0000,499.0000,NULL,NULL,NULL,'<h1>Compact and portable, start FPS gaming anytime, anywhere.</h1>
<p>The HyperX™ Alloy FPS keyboard is durable and reliable, providing gamers with an excellent gaming experience. If you need a full-size keyboard, the Alloy FPS will meet all your needs. If you prefer the Tenkeyless (TKL) mode for most essential keys, the Alloy FPS Pro keyboard will fully satisfy your needs. Each keyboard meets the demands of serious FPS gamers: reliable CHERRY® MX switches, solid steel frame, detachable cable, game mode, 100% anti-ghosting, and N-key rollover. Whether you are a professional FPS player or just a casual gamer, the HyperX Alloy FPS keyboard will meet your needs.</p>
<h3>Minimalist design, compact, perfect for FPS gaming</h3>
<p>Maximizes desktop space for quick mouse movements.</p>
<h3>Solid steel frame</h3>
<p>Ensures durability and stability.</p>
<h3>Reliable CHERRY® MX mechanical switches</h3>
<p>Available in CHERRY MX Blue, Brown, or Red switches, offering renowned reliability and your preferred switch style.</p>
<h3>Ultra-portable design with detachable cable</h3>
<p>Saves storage space and reduces potential cable damage.</p>
<h3>HyperX red backlit keys with dynamic lighting effects</h3>
<p>Show off your style with brilliant backlighting.</p>','Solid steel frame, CHERRY® MX mechanical switches, detachable cable',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,'Alloy-FPS',NULL,NULL,'HX-KB4RD1-US/R1','admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 21:52:25.420');
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
	`DisplayOrder` INT  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `ProductCategory` DISABLE KEYS */;
INSERT INTO `ProductCategory` VALUES
(1,'Product',NULL,0,'products',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:32.000','admin','ZKEASOFT','2024-11-16 13:53:22.181',NULL),
(2,'Headset',NULL,1,'headset',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:50.000','admin','ZKEASOFT','2018-08-15 15:30:59.233',NULL),
(3,'Keyboard',NULL,1,'keyboard',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:07.000','admin','ZKEASOFT','2018-08-15 15:31:08.063',NULL);
/*!40000 ALTER TABLE `ProductCategory` ENABLE KEYS */;

DROP TABLE IF EXISTS `ProductCategoryTag`;
CREATE TABLE `ProductCategoryTag` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`ProductCategoryId` INT  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
(1,2,'Color',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:45.550'),
(2,2,'Black',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:50.530'),
(3,2,'Black Silver',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:11:03.656'),
(4,3,'Operation Style',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:07.706'),
(5,3,'Click',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:14.870'),
(6,3,'Tactile',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:20.713'),
(7,3,'Linear',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:28.660');
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

/*!40000 ALTER TABLE `ProductCategoryWidget` DISABLE KEYS */;
INSERT INTO `ProductCategoryWidget` VALUES
('3466e616139645d2b1e1d9935d231922',1,NULL),
('eb7657f5bcbd4e98977a42950936e7ac',1,NULL);
/*!40000 ALTER TABLE `ProductCategoryWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `ProductDetailWidget`;
CREATE TABLE `ProductDetailWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`CustomerClass` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`),
	KEY `FK_ProductDetailWidget_Widget` (`ID`),
	CONSTRAINT `FK_ProductDetailWidget_Widget` FOREIGN KEY (`ID`) REFERENCES `CMS_WidgetBase` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*!40000 ALTER TABLE `ProductDetailWidget` DISABLE KEYS */;
INSERT INTO `ProductDetailWidget` VALUES
('787d9ad849dd40d0905f22ae072d8507',NULL),
('94624262dc00460cbbc1e0f51711e712',NULL);
/*!40000 ALTER TABLE `ProductDetailWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `ProductGallery`;
CREATE TABLE `ProductGallery` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`RawData` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
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
(1,1,'/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','HX-HSCR-BK/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.746'),
(2,1,'/images/6006218/56657706-58757e00-66cb-11e9-80b8-fdc32783ff68.png','HX-HSCRS-GM/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.750'),
(3,2,'/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010'),
(5,2,'/images/6006218/56657774-78a53d00-66cb-11e9-9ab9-c4b65f3cba22.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010'),
(6,2,'/images/6006218/56657795-85299580-66cb-11e9-9a3f-a1c5bde7b191.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010'),
(7,2,'/images/6006218/56657844-9a9ebf80-66cb-11e9-91ed-02001fab09c8.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
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

/*!40000 ALTER TABLE `ProductListWidget` DISABLE KEYS */;
INSERT INTO `ProductListWidget` VALUES
('6bb06e46293c46f084e83751a0832d36',1,1,'~/product/detail','col-xs-6 col-sm-4 col-md-4',9),
('e88916cc41b3465b9ae954bafac5f796',1,1,'~/product/detail','col-xs-6 col-sm-4 col-md-4',9);
/*!40000 ALTER TABLE `ProductListWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `ProductTag`;
CREATE TABLE `ProductTag` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`ProductId` INT  NULL,
	`TagId` INT  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `ProductTag` DISABLE KEYS */;
INSERT INTO `ProductTag` VALUES
(28,1,3,NULL),
(29,1,2,NULL),
(30,2,7,NULL),
(31,2,6,NULL),
(32,2,5,NULL);
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
(1,'Administrator','Administrator',1,NULL,NULL,NULL,'admin','ZKEASOFT','2023-03-18 16:45:26.703');
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
('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,7,'admin','ZKEASOFT','2017-10-15 18:11:36.766','admin','ZKEASOFT','2017-10-15 18:11:36.766'),
('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.800','admin','ZKEASOFT','2017-10-15 18:11:36.800'),
('1','80f365c7991a49a0b04aa11006018814','1',1,2,'admin',NULL,'2015-09-01 10:09:51.456','admin',NULL,'2015-09-01 10:12:05.036'),
('105','f41174cfa4d247f4974c47f4d2b000fd','40',4,1,'admin','ZKEASOFT','2016-03-09 21:22:05.273','admin','ZKEASOFT','2016-03-09 21:22:05.273'),
('106','f41174cfa4d247f4974c47f4d2b000fd','40',3,2,'admin','ZKEASOFT','2016-03-09 21:22:14.723','admin','ZKEASOFT','2016-03-09 21:22:14.723'),
('107','f41174cfa4d247f4974c47f4d2b000fd','41',4,1,'admin','ZKEASOFT','2016-03-09 21:22:39.543','admin','ZKEASOFT','2016-03-09 21:22:39.543'),
('108','f41174cfa4d247f4974c47f4d2b000fd','41',3,2,'admin','ZKEASOFT','2016-03-09 21:22:46.500','admin','ZKEASOFT','2016-03-09 21:22:46.500'),
('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.286','admin','ZKEASOFT','2016-03-09 21:23:51.286'),
('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.290','admin','ZKEASOFT','2016-03-09 21:23:51.290'),
('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293'),
('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293'),
('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',4,1,'admin','ZKEASOFT','2016-03-09 21:24:36.340','admin','ZKEASOFT','2016-03-09 21:24:36.340'),
('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',3,2,'admin','ZKEASOFT','2016-03-09 21:24:43.533','admin','ZKEASOFT','2016-03-09 21:24:43.533'),
('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,5,'admin','ZKEASOFT','2017-10-15 18:11:36.760','admin','ZKEASOFT','2017-10-15 18:11:36.760'),
('13','2b3eb61307d24c50a6b3aaa75db3810e','5',2,1,'admin','ZKEASOFT','2016-03-09 14:07:06.270','admin','ZKEASOFT','2016-03-09 14:07:06.270'),
('14','2b3eb61307d24c50a6b3aaa75db3810e','5',4,2,'admin','ZKEASOFT','2016-03-09 14:07:14.396','admin','ZKEASOFT','2016-03-09 14:07:14.396'),
('15','2b3eb61307d24c50a6b3aaa75db3810e','5',3,3,'admin','ZKEASOFT','2016-03-09 14:07:22.330','admin','ZKEASOFT','2016-03-09 14:07:22.330'),
('16','00f62c5acfe840e0bee3ca2979f0f025','6',2,1,'admin','ZKEASOFT','2016-03-09 14:14:25.736','admin','ZKEASOFT','2016-03-09 14:14:25.736'),
('163','604b2461f7c545e28dbb21fb15def5c7','2',1,4,'admin','ZKEASOFT','2017-03-19 20:58:41.646','admin','ZKEASOFT','2017-03-19 20:58:41.646'),
('164','604b2461f7c545e28dbb21fb15def5c7','2',1,7,'admin','ZKEASOFT','2017-03-19 20:59:12.036','admin','ZKEASOFT','2017-03-19 20:59:12.036'),
('165','80f365c7991a49a0b04aa11006018814','1',3,3,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:02:22.540'),
('17','00f62c5acfe840e0bee3ca2979f0f025','6',4,2,'admin','ZKEASOFT','2016-03-09 14:14:33.683','admin','ZKEASOFT','2016-03-09 14:14:33.683'),
('18','00f62c5acfe840e0bee3ca2979f0f025','6',3,3,'admin','ZKEASOFT','2016-03-09 14:14:50.896','admin','ZKEASOFT','2016-03-09 14:14:50.896'),
('19','f6f11ba2fec844de883acf0a1fe3eb89','7',2,1,'admin','ZKEASOFT','2016-03-09 14:15:44.233','admin','ZKEASOFT','2016-03-09 14:15:44.233'),
('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',1,1,'admin','ZKEASOFT','2017-10-15 17:03:36.226','admin','ZKEASOFT','2017-10-15 17:03:36.226'),
('20','f6f11ba2fec844de883acf0a1fe3eb89','7',4,2,'admin','ZKEASOFT','2016-03-09 14:15:44.236','admin','ZKEASOFT','2016-03-09 14:15:44.236'),
('21','f6f11ba2fec844de883acf0a1fe3eb89','7',3,3,'admin','ZKEASOFT','2016-03-09 14:15:44.240','admin','ZKEASOFT','2016-03-09 14:15:44.240'),
('22','481574ebc98b4cdf9a07e3f20c1ab78d','8',2,1,'admin','ZKEASOFT','2016-03-09 14:15:48.876','admin','ZKEASOFT','2016-03-09 14:15:48.876'),
('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,4,'admin','ZKEASOFT','2017-10-15 18:11:36.756','admin','ZKEASOFT','2017-10-15 18:11:36.756'),
('23','481574ebc98b4cdf9a07e3f20c1ab78d','8',4,2,'admin','ZKEASOFT','2016-03-09 14:15:48.876','admin','ZKEASOFT','2016-03-09 14:15:48.876'),
('24','481574ebc98b4cdf9a07e3f20c1ab78d','8',3,3,'admin','ZKEASOFT','2016-03-09 14:15:48.880','admin','ZKEASOFT','2016-03-09 14:15:48.880'),
('25','b568ff7f4a894870adaf9afadf787bf9','9',2,1,'admin','ZKEASOFT','2016-03-09 14:21:44.433','admin','ZKEASOFT','2016-03-09 14:21:44.433'),
('26','b568ff7f4a894870adaf9afadf787bf9','9',3,2,'admin','ZKEASOFT','2016-03-09 14:21:53.836','admin','ZKEASOFT','2016-03-09 14:21:53.836'),
('27','b568ff7f4a894870adaf9afadf787bf9','10',2,1,'admin','ZKEASOFT','2016-03-09 14:22:35.620','admin','ZKEASOFT','2016-03-09 14:22:35.620'),
('28','b568ff7f4a894870adaf9afadf787bf9','10',3,2,'admin','ZKEASOFT','2016-03-09 14:24:34.193','admin','ZKEASOFT','2016-03-09 14:24:34.193'),
('29','55b73e54fd054de4847960bdac350c6d','11',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580'),
('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','2',1,6,'admin','ZKEASOFT','2017-10-15 17:18:30.710','admin','ZKEASOFT','2017-10-15 17:18:30.710'),
('3','604b2461f7c545e28dbb21fb15def5c7','2',1,2,'admin',NULL,'2015-09-01 10:15:07.310','admin',NULL,'2015-09-01 10:15:07.310'),
('30','55b73e54fd054de4847960bdac350c6d','11',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580'),
('31','55b73e54fd054de4847960bdac350c6d','12',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.586','admin','ZKEASOFT','2016-03-09 14:33:40.586'),
('32','55b73e54fd054de4847960bdac350c6d','12',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.586','admin','ZKEASOFT','2016-03-09 14:33:40.586'),
('33','55b73e54fd054de4847960bdac350c6d','11',4,2,'admin','ZKEASOFT','2016-03-09 14:34:38.456','admin','ZKEASOFT','2016-03-09 14:34:38.456'),
('34','55b73e54fd054de4847960bdac350c6d','12',4,2,'admin','ZKEASOFT','2016-03-09 14:34:51.846','admin','ZKEASOFT','2016-03-09 14:34:51.846'),
('35','ed837392097f4e60b812bc57111dd762','13',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470'),
('36','ed837392097f4e60b812bc57111dd762','13',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470'),
('37','ed837392097f4e60b812bc57111dd762','14',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.490','admin','ZKEASOFT','2016-03-09 14:36:24.490'),
('38','ed837392097f4e60b812bc57111dd762','14',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.493','admin','ZKEASOFT','2016-03-09 14:36:24.493'),
('39','ed837392097f4e60b812bc57111dd762','15',2,1,'admin','ZKEASOFT','2016-03-09 14:38:16.066','admin','ZKEASOFT','2016-03-09 14:38:16.066'),
('4','604b2461f7c545e28dbb21fb15def5c7','2',1,5,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:18:02.196'),
('40','ed837392097f4e60b812bc57111dd762','15',3,2,'admin','ZKEASOFT','2016-03-09 14:38:27.630','admin','ZKEASOFT','2016-03-09 14:38:27.630'),
('41','1fb967867e3b440e86336bc5a51e8719','16',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.776','admin','ZKEASOFT','2016-03-09 14:40:26.776'),
('42','1fb967867e3b440e86336bc5a51e8719','16',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.780','admin','ZKEASOFT','2016-03-09 14:40:26.780'),
('43','1fb967867e3b440e86336bc5a51e8719','17',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783'),
('44','1fb967867e3b440e86336bc5a51e8719','17',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783'),
('45','1fb967867e3b440e86336bc5a51e8719','18',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.786','admin','ZKEASOFT','2016-03-09 14:40:26.786'),
('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,3,'admin','ZKEASOFT','2017-10-15 18:11:36.756','admin','ZKEASOFT','2017-10-15 18:11:36.756'),
('46','1fb967867e3b440e86336bc5a51e8719','18',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.786','admin','ZKEASOFT','2016-03-09 14:40:26.786'),
('47','1fb967867e3b440e86336bc5a51e8719','16',4,2,'admin','ZKEASOFT','2016-03-09 14:41:13.710','admin','ZKEASOFT','2016-03-09 14:41:13.710'),
('48','1fb967867e3b440e86336bc5a51e8719','17',4,2,'admin','ZKEASOFT','2016-03-09 14:42:01.136','admin','ZKEASOFT','2016-03-09 14:42:01.136'),
('49','1fb967867e3b440e86336bc5a51e8719','18',4,2,'admin','ZKEASOFT','2016-03-09 14:42:20.190','admin','ZKEASOFT','2016-03-09 14:42:20.190'),
('5','604b2461f7c545e28dbb21fb15def5c7','2',1,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:17:12.376'),
('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',3,3,'admin','ZKEASOFT','2017-10-15 18:11:36.803','admin','ZKEASOFT','2017-10-15 18:11:36.803'),
('6','604b2461f7c545e28dbb21fb15def5c7','2',1,3,'admin','ZKEASOFT','2016-03-01 10:45:25.393','admin','ZKEASOFT','2016-03-01 10:45:25.393'),
('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.753','admin','ZKEASOFT','2017-10-15 18:11:36.753'),
('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.746','admin','ZKEASOFT','2017-10-15 18:11:36.746'),
('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,6,'admin','ZKEASOFT','2017-10-15 18:11:36.763','admin','ZKEASOFT','2017-10-15 18:11:36.763'),
('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',3,2,'admin','ZKEASOFT','2017-10-15 18:11:36.783','admin','ZKEASOFT','2017-10-15 18:11:36.783'),
('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',3,2,'admin','ZKEASOFT','2017-10-15 17:04:41.026','admin','ZKEASOFT','2017-10-15 17:04:41.026'),
('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.783','admin','ZKEASOFT','2017-10-15 18:11:36.783');
/*!40000 ALTER TABLE `SectionContent` ENABLE KEYS */;

DROP TABLE IF EXISTS `SectionContentCallToAction`;
CREATE TABLE `SectionContentCallToAction` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`SectionWidgetId` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`InnerText` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Href` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `SectionContentCallToAction` DISABLE KEYS */;
INSERT INTO `SectionContentCallToAction` VALUES
('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','License','http://www.zkea.net/licenses'),
('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','Login','/admin'),
('1','80f365c7991a49a0b04aa11006018814','Login','/admin'),
('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms'),
('163','604b2461f7c545e28dbb21fb15def5c7','Commercial License','http://www.zkea.net/zkeacms/price'),
('164','604b2461f7c545e28dbb21fb15def5c7','License','http://www.zkea.net/licenses'),
('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','Personal Center','/Account'),
('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','Commercial License','http://www.zkea.net/zkeacms/price'),
('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','Developer Documentation','http://www.zkea.net/zkeacms/document'),
('3','604b2461f7c545e28dbb21fb15def5c7','GitHub','https://github.com/SeriaWei/ZKEACMS.Core'),
('4','604b2461f7c545e28dbb21fb15def5c7','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms'),
('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','Open Source China','http://git.oschina.net/seriawei/ZKEACMS.Core'),
('5','604b2461f7c545e28dbb21fb15def5c7','Official Website','http://www.zkea.net'),
('6','604b2461f7c545e28dbb21fb15def5c7','Open Source China','http://git.oschina.net/seriawei/ZKEACMS.Core'),
('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','GitHub','https://github.com/SeriaWei/ZKEACMS.Core'),
('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','Official Website','http://www.zkea.net'),
('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','Developer Documentation','http://www.zkea.net/zkeacms/document'),
('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','Personal Center','/Account');
/*!40000 ALTER TABLE `SectionContentCallToAction` ENABLE KEYS */;

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
('45','1fb967867e3b440e86336bc5a51e8719','~/images/14.jpg',NULL,NULL,NULL,NULL,NULL);
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
('106','f41174cfa4d247f4974c47f4d2b000fd','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a> is based on <a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>, developed using ASP.NET MVC4.</p>
<p>ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layout, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, allowing direct design on the preview page.</p>
<p>ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>'),
('108','f41174cfa4d247f4974c47f4d2b000fd','<p><a href=\"https://github.com/SeriaWei/ASP.NET-MVC-CMS\">ZKEACMS</a> is based on <a href=\"http://www.zkea.net/easyframework\">EasyFrameWork</a>, developed using ASP.NET MVC4.</p>
<p>ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layout, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, allowing direct design on the preview page.</p>
<p>ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>'),
('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>'),
('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>'),
('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>'),
('15','2b3eb61307d24c50a6b3aaa75db3810e','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>'),
('165','80f365c7991a49a0b04aa11006018814','<p>Username, password: admin</p>'),
('18','00f62c5acfe840e0bee3ca2979f0f025','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>'),
('21','f6f11ba2fec844de883acf0a1fe3eb89','<p>ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layout, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, allowing direct design on the preview page.</p>'),
('24','481574ebc98b4cdf9a07e3f20c1ab78d','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>'),
('26','b568ff7f4a894870adaf9afadf787bf9','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>'),
('28','b568ff7f4a894870adaf9afadf787bf9','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>'),
('30','55b73e54fd054de4847960bdac350c6d','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>'),
('32','55b73e54fd054de4847960bdac350c6d','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>'),
('36','ed837392097f4e60b812bc57111dd762','<p><span>Gasoline,</span><span> jet fuel, diesel, heavy oil, and other liquid fuels obtained from petroleum refining.</span></p>'),
('38','ed837392097f4e60b812bc57111dd762','<p><span>Gasoline,</span><span> jet fuel, diesel, heavy oil, and other liquid fuels obtained from petroleum refining.</span></p>'),
('40','ed837392097f4e60b812bc57111dd762','<p><span>Gasoline,</span><span> jet fuel, diesel, heavy oil, and other liquid fuels obtained from petroleum refining.</span></p>'),
('42','1fb967867e3b440e86336bc5a51e8719','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>'),
('44','1fb967867e3b440e86336bc5a51e8719','<p><span>Gasoline,</span><span> jet fuel, diesel, heavy oil, and other liquid fuels obtained from petroleum refining.</span></p>'),
('46','1fb967867e3b440e86336bc5a51e8719','<p><span>The current situation of China automobile industry is mixed,</span><span> looking forward to the future of China automobile industry, risks and opportunities coexist.</span></p>'),
('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','<p>Username, password: admin</p>'),
('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','<p>Frontend user registration, user management</p>'),
('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','<p>Frontend user registration, user management</p>');
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
('33','55b73e54fd054de4847960bdac350c6d','Construction Industry',NULL,NULL),
('34','55b73e54fd054de4847960bdac350c6d','Energy and Chemical Industry',NULL,NULL),
('47','1fb967867e3b440e86336bc5a51e8719','Construction Industry',NULL,NULL),
('48','1fb967867e3b440e86336bc5a51e8719','Energy and Chemical Industry',NULL,NULL),
('49','1fb967867e3b440e86336bc5a51e8719','Automobile Industry',NULL,NULL);
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
('0015be62210742c083c3a9dad4b72fb5','G1','e0783dbbcc564322a1f2e3ca2833dbd4','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.740','admin','ZKEASOFT','2017-10-15 18:11:36.740',NULL),
('1','G1','80f365c7991a49a0b04aa11006018814','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('10','Right','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('11','Left','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('12','Right','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('13','Left','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('14','Center','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('15','Right','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('16','Left','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('17','Center','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('18','Right','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('2','G1','604b2461f7c545e28dbb21fb15def5c7','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('40','Left','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('41','Right','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('42','Left','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('43','Right','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('44','Center','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4'),
('5','G1','2b3eb61307d24c50a6b3aaa75db3810e','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('50082fd30e01404fbb4fe6101353b1d5','G1','88ab49212dee47bba878a52bec86f501','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.800','admin','ZKEASOFT','2017-10-15 18:11:36.800',NULL),
('6','G1','00f62c5acfe840e0bee3ca2979f0f025','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('7','G1','f6f11ba2fec844de883acf0a1fe3eb89','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('8','G1','481574ebc98b4cdf9a07e3f20c1ab78d','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('80cb176412cf457a81ae7a1f9fa33ef6','G1','7f77f09c3fcd4d498a4aa3b1c9508d7d','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 17:03:17.246','admin','ZKEASOFT','2017-10-15 17:03:17.246',''),
('9','Left','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6'),
('9ce2c15af93c4fd782e17a1e7e35963f','G1','7e7a1d5b8d644333a7b3341509fc960f','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 18:11:36.780','admin','ZKEASOFT','2017-10-15 18:11:36.780','');
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
('SectionTemplate.Banner','Banner','Thumbnail\SectionTemplate.Banner.png','Thumbnail\SectionTemplate.Banner.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Brand','Brand','Thumbnail\SectionTemplate.Brand.png','Thumbnail\SectionTemplate.Brand.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.CalendarEvent','History','Thumbnail\SectionTemplate.CalendarEvent.png','Thumbnail\SectionTemplate.CalendarEvent.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Column','2Col','Thumbnail\SectionTemplate.Column.png','Thumbnail\SectionTemplate.Column.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Default','Default','Thumbnail\SectionTemplate.Default.png','Thumbnail\SectionTemplate.Default.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.GreyBox','Grey Bg','Thumbnail\SectionTemplate.GreyBox.png','Thumbnail\SectionTemplate.GreyBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ImageBox','Image Box','Thumbnail\SectionTemplate.ImageBox.png','Thumbnail\SectionTemplate.ImageBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ImageGreyBox','Image Grey Box','Thumbnail\SectionTemplate.ImageGreyBox.png','Thumbnail\SectionTemplate.ImageGreyBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ImageRight','Image Right','Thumbnail\SectionTemplate.ImageRight.png','Thumbnail\SectionTemplate.ImageRight.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.JCarousel','Carousel','Thumbnail\SectionTemplate.JCarousel.png','Thumbnail\SectionTemplate.JCarousel.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.LeftThreeIcon','Left 3 Icon','Thumbnail\SectionTemplate.LeftThreeIcon.png','Thumbnail\SectionTemplate.LeftThreeIcon.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.LifeStyle','Lift Style','Thumbnail\SectionTemplate.LifeStyle.png','Thumbnail\SectionTemplate.LifeStyle.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.LinkGroup','Links','Thumbnail\SectionTemplate.LinkGroup.png','Thumbnail\SectionTemplate.LinkGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ListGroup','List Group','Thumbnail\SectionTemplate.ListGroup.png','Thumbnail\SectionTemplate.ListGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ListView','Media List','Thumbnail\SectionTemplate.ListView.png','Thumbnail\SectionTemplate.ListView.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Portfolio','Portfolio','Thumbnail\SectionTemplate.Portfolio.png','Thumbnail\SectionTemplate.Portfolio.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ProductHero','Product Heading','Thumbnail\SectionTemplate.ProductHero.png','Thumbnail\SectionTemplate.ProductHero.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Quote','Quote','Thumbnail\SectionTemplate.Quote.png','Thumbnail\SectionTemplate.Quote.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.RightThreeIcon','Right 3 Icon','Thumbnail\SectionTemplate.RightThreeIcon.png','Thumbnail\SectionTemplate.RightThreeIcon.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.SalePrice','Quote','Thumbnail\SectionTemplate.SalePrice.png','Thumbnail\SectionTemplate.SalePrice.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.ShortcutNav','Shortcut Nav','Thumbnail\SectionTemplate.ShortcutNav.png','Thumbnail\SectionTemplate.ShortcutNav.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Tab','Tag','Thumbnail\SectionTemplate.Tab.png','Thumbnail\SectionTemplate.Tab.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('SectionTemplate.Thumbnail','Thumbnail','Thumbnail\SectionTemplate.Thumbnail.png','Thumbnail\SectionTemplate.Thumbnail.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
('1fb967867e3b440e86336bc5a51e8719',NULL,NULL),
('2b3eb61307d24c50a6b3aaa75db3810e',NULL,NULL),
('481574ebc98b4cdf9a07e3f20c1ab78d',NULL,NULL),
('55b73e54fd054de4847960bdac350c6d',NULL,NULL),
('604b2461f7c545e28dbb21fb15def5c7','Links',NULL),
('7e7a1d5b8d644333a7b3341509fc960f',NULL,NULL),
('7f77f09c3fcd4d498a4aa3b1c9508d7d',NULL,NULL),
('80f365c7991a49a0b04aa11006018814','Manage',NULL),
('88ab49212dee47bba878a52bec86f501','Manage',NULL),
('b568ff7f4a894870adaf9afadf787bf9',NULL,NULL),
('e0783dbbcc564322a1f2e3ca2833dbd4','Links',NULL),
('ed837392097f4e60b812bc57111dd762',NULL,NULL),
('f41174cfa4d247f4974c47f4d2b000fd',NULL,NULL),
('f6f11ba2fec844de883acf0a1fe3eb89',NULL,NULL);
/*!40000 ALTER TABLE `SectionWidget` ENABLE KEYS */;

DROP TABLE IF EXISTS `ShippingOption`;
CREATE TABLE `ShippingOption` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Price` DECIMAL (19,4)  NULL,
	`Rule` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`ContentID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CultureID` INT  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


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
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
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
('admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',NULL,'2024-11-16 13:52:55.285','::1','~/images/head.png',0,'ZKEASOFT',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Admin',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'admin','Admin','2024-11-16 13:52:55.291',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;

DROP TABLE IF EXISTS `Video`;
CREATE TABLE `Video` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Name` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Summary` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`MetaKeyWords` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`MetaDescription` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Counter` INT  NULL,
	`VideoTypeID` INT  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`VideoUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`VideoCode` VARCHAR(1000) CHARACTER SET utf8mb4  NULL,
	`Duration` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`ImageThumbUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ImageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`IsPublish` TINYINT(1)  NOT NULL,
	`PublishDate` DATETIME  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	`ContentID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CultureID` INT  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `VideoDetailWidget`;
CREATE TABLE `VideoDetailWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`CustomerClass` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `VideoGallery`;
CREATE TABLE `VideoGallery` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`RawData` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `VideoListWidget`;
CREATE TABLE `VideoListWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`VideoTypeID` INT  NULL,
	`DetailPageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`IsPageable` TINYINT(1)  NOT NULL,
	`PageSize` INT  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `VideoTopWidget`;
CREATE TABLE `VideoTopWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`VideoTypeID` INT  NULL,
	`Tops` INT  NULL,
	`SubTitle` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`MoreLink` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`DetailPageUrl` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `VideoType`;
CREATE TABLE `VideoType` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Name` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	`ParentID` INT  NULL,
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
	`ContentID` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CultureID` INT  NULL,
	`DisplayOrder` INT  NULL,
	PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `VideoTypeWidget`;
CREATE TABLE `VideoTypeWidget` (
	`ID` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`VideoTypeID` INT  NULL,
	`TargetPage` VARCHAR(255) CHARACTER SET utf8mb4  NULL,
	PRIMARY KEY (`ID`)
);


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
