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

ALTER TABLE `Order` ADD ShippingOption int null;
ALTER TABLE `Order` ADD SubTotal DECIMAL (19,4) null;
ALTER TABLE `Order` ADD Tax DECIMAL (19,4) null;
ALTER TABLE `Order` ADD Shipping DECIMAL (19,4) null;
ALTER TABLE `OrderItem` ADD BasketID int null;

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

DELETE FROM `Language` WHERE `LanKey` = 'Subtotal' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Subtotal','zh-CN','小计');

DELETE FROM `Language` WHERE `LanKey` = 'Shipping' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Shipping','zh-CN','运费');

DELETE FROM `Language` WHERE `LanKey` = 'Tax' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Tax','zh-CN','税');

DELETE FROM `Language` WHERE `LanKey` = 'ShippingOption' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ShippingOption','zh-CN','物流选项');

DELETE FROM `Language` WHERE `LanKey` = 'Shipping Option' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Shipping Option','zh-CN','物流选项');

DELETE FROM `Language` WHERE `LanKey` = 'Contact Info' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Contact Info','zh-CN','联系人信息');

DELETE FROM `Language` WHERE `LanKey` = 'Secure Payment' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Secure Payment','zh-CN','安全支付');

DELETE FROM `Language` WHERE `LanKey` = 'Summary' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Summary','zh-CN','摘要');

DELETE FROM `Language` WHERE `LanKey` = 'TaxRate' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('TaxRate','zh-CN','税率');

DELETE FROM `Language` WHERE `LanKey` = 'Tax Rate' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Tax Rate','zh-CN','税率');

DELETE FROM `Language` WHERE `LanKey` = 'Price' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Price','zh-CN','价格');

DELETE FROM `Language` WHERE `LanKey` = 'Currency' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Currency','zh-CN','货币');

DELETE FROM `Language` WHERE `LanKey` = 'CurrencyOption@CurrencyID' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('CurrencyOption@CurrencyID','zh-CN','货币');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPay Setting' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPay Setting','zh-CN','微信支付集成设置');

DELETE FROM `Language` WHERE `LanKey` = 'Environment' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Environment','zh-CN','环境');

DELETE FROM `Language` WHERE `LanKey` = 'IsEnable' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('IsEnable','zh-CN','是否启用');

DELETE FROM `Language` WHERE `LanKey` = 'AliPay' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('AliPay','zh-CN','支付宝支付');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPay' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPay','zh-CN','微信支付');


DELETE FROM `Language` WHERE `LanKey` = 'AlipayOptions@Environment' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('AlipayOptions@Environment','zh-CN','环境');

DELETE FROM `Language` WHERE `LanKey` = 'AlipayOptions@IsEnable' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('AlipayOptions@IsEnable','zh-CN','是否启用');

DELETE FROM `Language` WHERE `LanKey` = 'AlipayOptions@AppId' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('AlipayOptions@AppId','zh-CN','AppId');

DELETE FROM `Language` WHERE `LanKey` = 'AlipayOptions@PublicKey' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('AlipayOptions@PublicKey','zh-CN','应用公钥');

DELETE FROM `Language` WHERE `LanKey` = 'AlipayOptions@PrivateKey' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('AlipayOptions@PrivateKey','zh-CN','应用私钥');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@IsEnable' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@IsEnable','zh-CN','是否启用');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@AppId' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@AppId','zh-CN','AppId');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@MchId' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@MchId','zh-CN','商户ID');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@Key' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@Key','zh-CN','API密钥');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@V3Key' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@V3Key','zh-CN','APIv3密钥');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@Certificate' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@Certificate','zh-CN','API证书');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@CertificatePassword' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@CertificatePassword','zh-CN','证书密码');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@RsaPublicKey' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@RsaPublicKey','zh-CN','RSA公钥');

DELETE FROM `Language` WHERE `LanKey` = 'WeChatPayOptions@AppSecret' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('WeChatPayOptions@AppSecret','zh-CN','应用密钥');

DELETE FROM `Language` WHERE `LanKey` = 'PayPalOptions@Environment' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('PayPalOptions@Environment','zh-CN','环境');

DELETE FROM `Language` WHERE `LanKey` = 'PayPalOptions@IsEnable' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('PayPalOptions@IsEnable','zh-CN','是否启用');

DELETE FROM `Language` WHERE `LanKey` = 'PayPalOptions@ClientID' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('PayPalOptions@ClientID','zh-CN','Client ID');

DELETE FROM `Language` WHERE `LanKey` = 'PayPalOptions@ClientSecretID' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('PayPalOptions@ClientSecretID','zh-CN','Client Secret ID');

DELETE FROM `Language` WHERE `LanKey` = 'Complete' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Complete','zh-CN','完成');

DELETE FROM `Language` WHERE `LanKey` = 'Shiped' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Shiped','zh-CN','已发货');