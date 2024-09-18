CREATE TABLE IF NOT EXISTS `ArticleTypeRelation` (
    `ArticleId` VARCHAR(100) NOT NULL,
    `ArticleTypeId` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`ArticleId`, `ArticleTypeId`)
);

DELETE FROM `ArticleTypeRelation`;

INSERT INTO `ArticleTypeRelation` (ArticleId, ArticleTypeId)
SELECT DISTINCT IFNULL(ContentID, ID), ArticleTypeID FROM `Article`;

CREATE TABLE IF NOT EXISTS `CMS_WidgetArticleTypeRelation` (
    `WidgetId` VARCHAR(100) NOT NULL,
    `ArticleTypeId` INT NOT NULL,
    PRIMARY KEY (`WidgetId`, `ArticleTypeId`)
);

DELETE FROM `CMS_WidgetArticleTypeRelation`;

INSERT INTO `CMS_WidgetArticleTypeRelation` (WidgetId, ArticleTypeId)
SELECT T0.ID, T1.ID FROM `ArticleListWidget` T0
INNER JOIN `ArticleType` T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID = T1.ParentID
UNION
SELECT T0.ID, T1.ID FROM `ArticleTopWidget` T0
INNER JOIN `ArticleType` T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID = T1.ParentID
UNION
SELECT T0.ID, T1.ID FROM `ArticleTypeWidget` T0
INNER JOIN `ArticleType` T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID = T1.ParentID;

CREATE TABLE IF NOT EXISTS `ProductCategoryRelation` (
    `ProductId` VARCHAR(100) NOT NULL,
    `ProductCategoryId` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`ProductId`, `ProductCategoryId`)
);

DELETE FROM `ProductCategoryRelation`;

INSERT INTO `ProductCategoryRelation` (ProductId, ProductCategoryId)
SELECT DISTINCT IFNULL(ContentID, ID), ProductCategoryID FROM `Product`;

CREATE TABLE IF NOT EXISTS `CMS_WidgetProductCategoryRelation` (
    `WidgetId` VARCHAR(100) NOT NULL,
    `ProductCategoryId` INT NOT NULL,
    PRIMARY KEY (`WidgetId`, `ProductCategoryId`)
);

DELETE FROM `CMS_WidgetProductCategoryRelation`;

INSERT INTO `CMS_WidgetProductCategoryRelation` (WidgetId, ProductCategoryId)
SELECT T0.ID, T1.ID FROM `ProductListWidget` T0
INNER JOIN `ProductCategory` T1 ON T0.ProductCategoryID = T1.ID OR T0.ProductCategoryID = T1.ParentID
UNION
SELECT T0.ID, T1.ID FROM `ProductCategoryWidget` T0
INNER JOIN `ProductCategory` T1 ON T0.ProductCategoryID = T1.ID OR T0.ProductCategoryID = T1.ParentID;

CREATE TABLE IF NOT EXISTS `VideoTypeRelation` (
    `VideoId` VARCHAR(100) NOT NULL,
    `VideoTypeId` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`VideoId`, `VideoTypeId`)
);

DELETE FROM `VideoTypeRelation`;

INSERT INTO `VideoTypeRelation` (VideoId, VideoTypeId)
SELECT DISTINCT IFNULL(ContentID, ID), VideoTypeID FROM `Video`;

CREATE TABLE IF NOT EXISTS `CMS_WidgetVideoTypeRelation` (
    `WidgetId` VARCHAR(100) NOT NULL,
    `VideoTypeId` INT NOT NULL,
    PRIMARY KEY (`WidgetId`, `VideoTypeId`)
);

DELETE FROM `CMS_WidgetVideoTypeRelation`;

INSERT INTO `CMS_WidgetVideoTypeRelation` (WidgetId, VideoTypeId)
SELECT T0.ID, T1.ID FROM `VideoListWidget` T0
INNER JOIN `VideoType` T1 ON T0.VideoTypeID = T1.ID OR T0.VideoTypeID = T1.ParentID
UNION
SELECT T0.ID, T1.ID FROM `VideoTopWidget` T0
INNER JOIN `VideoType` T1 ON T0.VideoTypeID = T1.ID OR T0.VideoTypeID = T1.ParentID
UNION
SELECT T0.ID, T1.ID FROM `VideoTypeWidget` T0
INNER JOIN `VideoType` T1 ON T0.VideoTypeID = T1.ID OR T0.VideoTypeID = T1.ParentID;