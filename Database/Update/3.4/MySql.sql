CREATE TABLE IF NOT EXISTS `FluidContentTemplate` (
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

CREATE TABLE IF NOT EXISTS `FluidContentType` (
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
	PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `FluidContentValue` (
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

ALTER TABLE `FluidContentType` ADD `GroupID` int null;
ALTER TABLE `FluidContentType` ADD `RoleID` int null;
ALTER TABLE `FluidContentType` ADD `Icon` VARCHAR(255) CHARACTER SET utf8mb4  NULL;

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

DELETE FROM `Language` WHERE `LanKey` = 'CreatebyName' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('CreatebyName','zh-CN','创建人');

DELETE FROM `Language` WHERE `LanKey` = 'CreateDate' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('CreateDate','zh-CN','创建日期');

DELETE FROM `Language` WHERE `LanKey` = 'LastUpdateByName' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('LastUpdateByName','zh-CN','更新人');

DELETE FROM `Language` WHERE `LanKey` = 'LastUpdateDate' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('LastUpdateDate','zh-CN','更新日期');

DELETE FROM `Language` WHERE `LanKey` = 'Articles' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Articles','zh-CN','文章');

DELETE FROM `Language` WHERE `LanKey` = 'Products' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Products','zh-CN','产品');

DELETE FROM `Language` WHERE `LanKey` = 'Article Gallery' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Article Gallery','zh-CN','文章组');

DELETE FROM `Language` WHERE `LanKey` = 'Product Gallery' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Product Gallery','zh-CN','产品组');

DELETE FROM `Language` WHERE `LanKey` = 'ArticleGalleryWidget@DetailPageUrl' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ArticleGalleryWidget@DetailPageUrl','zh-CN','详细页面');

DELETE FROM `Language` WHERE `LanKey` = 'ArticleGalleryWidget@ArticleGalleryId' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ArticleGalleryWidget@ArticleGalleryId','zh-CN','文章组');

DELETE FROM `Language` WHERE `LanKey` = 'ProductGalleryWidget@DetailPageUrl' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductGalleryWidget@DetailPageUrl','zh-CN','详细页面');

DELETE FROM `Language` WHERE `LanKey` = 'ProductGalleryWidget@ProductGalleryId' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductGalleryWidget@ProductGalleryId','zh-CN','产品组');

DELETE FROM `Language` WHERE `LanKey` = 'Icon' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Icon','zh-CN','图标');

DELETE FROM `Language` WHERE `LanKey` = 'Content Group' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Content Group','zh-CN','内容分组');

DELETE FROM `Language` WHERE `LanKey` = 'GroupID' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('GroupID','zh-CN','分组');

DELETE FROM `Language` WHERE `LanKey` = 'RoleID' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('RoleID','zh-CN','角色');
