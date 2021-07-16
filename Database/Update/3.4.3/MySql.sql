DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEOTitle' AND `CultureName` = 'en-US';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEOTitle','en-US','SEO Title');

DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEOTitle' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEOTitle','zh-CN','SEO标题');

DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEOTitle' AND `CultureName` = 'zh-TW';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEOTitle','zh-TW','SEO標題');

DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEOKeyWord' AND `CultureName` = 'en-US';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEOKeyWord','en-US','SEO Key Word');

DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEOKeyWord' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEOKeyWord','zh-CN','SEO关键字');

DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEOKeyWord' AND `CultureName` = 'zh-TW';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEOKeyWord','zh-TW','SEO關鍵字');

DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEODescription' AND `CultureName` = 'en-US';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEODescription','en-US','SEO Description');

DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEODescription' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEODescription','zh-CN','SEO描述');

DELETE FROM `Language` WHERE `LanKey` = 'ProductCategory@SEODescription' AND `CultureName` = 'zh-TW';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ProductCategory@SEODescription','zh-TW','SEO描述');

