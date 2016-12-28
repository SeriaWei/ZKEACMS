UPDATE  CMS_WidgetTemplate
SET     AssemblyName = N'ZKEACMS' ,
        ServiceTypeName = REPLACE(ServiceTypeName, N'Easy.CMS', N'ZKEACMS') ,
        ViewModelTypeName = REPLACE(ViewModelTypeName, N'Easy.CMS', N'ZKEACMS')
WHERE   AssemblyName = N'Easy.CMS.Common';


UPDATE  CMS_WidgetBase
SET     AssemblyName = N'ZKEACMS' ,
        ServiceTypeName = REPLACE(ServiceTypeName, N'Easy.CMS', N'ZKEACMS') ,
        ViewModelTypeName = REPLACE(ViewModelTypeName, N'Easy.CMS', N'ZKEACMS')
WHERE   AssemblyName = N'Easy.CMS.Common';

UPDATE  CMS_WidgetBase
SET     AssemblyName = N'ZKEACMS' ,
        ServiceTypeName = REPLACE(ServiceTypeName, N'Easy.Web.CMS.Widget',
                                  N'ZKEACMS.Common.Service') ,
        ViewModelTypeName = REPLACE(ViewModelTypeName, N'Easy.Web.CMS.Widget',
                                    N'ZKEACMS.Common.Models')
WHERE   AssemblyName = N'Easy.Web.CMS';

UPDATE  CMS_WidgetTemplate
SET     AssemblyName = N'ZKEACMS' ,
        ServiceTypeName = REPLACE(ServiceTypeName, N'Easy.Web.CMS.Widget',
                                  N'ZKEACMS.Common.Service') ,
        ViewModelTypeName = REPLACE(ViewModelTypeName, N'Easy.Web.CMS.Widget',
                                    N'ZKEACMS.Common.Models')
WHERE   AssemblyName = N'Easy.Web.CMS';

UPDATE  dbo.CMS_Layout
SET     ImageUrl = N'~/images/layout.jpg' ,
        ImageThumbUrl = N'~/images/layout.jpg';
GO
SELECT  LanKey ,
        N'zh-CN' AS CultureName ,
        LanValue ,
        Module ,
        LanType
INTO    LanguageBackUp
FROM    dbo.Language;
GO
DROP TABLE dbo.Language;
GO
CREATE TABLE [Language]
    (
      LanKey NVARCHAR(50),
      CultureName NVARCHAR(10),
      LanValue NVARCHAR(500) ,
      Module NVARCHAR(50) ,
      LanType NVARCHAR(50),
	  CONSTRAINT PK_Language PRIMARY KEY (LanKey,CultureName)
    );
INSERT INTO dbo.Language
        ( LanKey ,
          CultureName ,
          LanValue ,
          Module ,
          LanType
        )
SELECT LanKey ,
        CultureName ,
        LanValue ,
        Module ,
        LanType
FROM    LanguageBackUp
GO
DROP TABLE LanguageBackUp
ALTER TABLE Carousel ALTER COLUMN [Status] int NULL
GO
ALTER TABLE DataDictionary ALTER COLUMN [Order] int null
GO
------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[SectionContentCallToAction] DROP CONSTRAINT [PK_SectionContentCallToAction]
ALTER TABLE [dbo].[SectionContentCallToAction] DROP CONSTRAINT [FK_SectionContentCallToAction_SectionContent]
ALTER TABLE [dbo].[SectionContentCallToAction] DROP CONSTRAINT [FK_SectionContentCallToAction_SectionWidget]

ALTER TABLE [dbo].[SectionContentImage] DROP CONSTRAINT [PK_SectionContentImage]
ALTER TABLE [dbo].[SectionContentImage] DROP CONSTRAINT [FK_SectionContentImage_SectionContent]
ALTER TABLE [dbo].[SectionContentImage] DROP CONSTRAINT [FK_SectionContentImage_SectionWidget]

ALTER TABLE [dbo].[SectionContentParagraph] DROP CONSTRAINT [PK_SectionContentParagraph]
ALTER TABLE [dbo].[SectionContentParagraph] DROP CONSTRAINT [FK_SectionContentParagraph_SectionContent]
ALTER TABLE [dbo].[SectionContentParagraph] DROP CONSTRAINT [FK_SectionContentParagraph_SectionWidget]

ALTER TABLE [dbo].[SectionContentTitle] DROP CONSTRAINT [PK_SectionContentTitle]
ALTER TABLE [dbo].[SectionContentTitle] DROP CONSTRAINT [FK_SectionContentTitle_SectionContent]
ALTER TABLE [dbo].[SectionContentTitle] DROP CONSTRAINT [FK_SectionContentTitle_SectionWidget]

ALTER TABLE [dbo].[SectionContentVideo] DROP CONSTRAINT [PK_SectionContentVideo]
ALTER TABLE [dbo].[SectionContentVideo] DROP CONSTRAINT [FK_SectionContentVideo_SectionContent]
ALTER TABLE [dbo].[SectionContentVideo] DROP CONSTRAINT [FK_SectionContentVideo_SectionWidget]

ALTER TABLE [dbo].[SectionContent] DROP CONSTRAINT [PK_SectionContent]
GO
ALTER table dbo.SectionContent ADD IDStr NVARCHAR(100)
GO
UPDATE dbo.SectionContent SET [IDStr]=[ID]
GO
ALTER TABLE dbo.SectionContent DROP COLUMN [ID]
ALTER TABLE dbo.SectionContent ADD [ID] NVARCHAR(100)
GO
UPDATE dbo.SectionContent SET [ID]=[IDStr]
GO
ALTER TABLE dbo.SectionContent DROP COLUMN [IDStr]
GO
ALTER TABLE dbo.SectionContentCallToAction alter column [ID] NVARCHAR(100)
ALTER TABLE dbo.SectionContentImage alter column [ID] NVARCHAR(100)
ALTER TABLE dbo.SectionContentParagraph alter column [ID] NVARCHAR(100)
ALTER TABLE dbo.SectionContentTitle alter column [ID] NVARCHAR(100)
ALTER TABLE dbo.SectionContentVideo alter column [ID] NVARCHAR(100)
GO
ALTER TABLE dbo.SectionContent ALTER COLUMN [ID]  NVARCHAR(100) NOT NULL
ALTER TABLE dbo.SectionContentCallToAction ALTER COLUMN ID  NVARCHAR(100) NOT NULL
ALTER TABLE dbo.SectionContentImage ALTER COLUMN ID  NVARCHAR(100) NOT NULL
ALTER TABLE dbo.SectionContentParagraph ALTER COLUMN ID  NVARCHAR(100) NOT NULL
ALTER TABLE dbo.SectionContentTitle ALTER COLUMN ID  NVARCHAR(100) NOT NULL
ALTER TABLE dbo.SectionContentVideo ALTER COLUMN ID  NVARCHAR(100) NOT NULL
GO
ALTER TABLE dbo.SectionContent ADD CONSTRAINT PK_SectionContent PRIMARY KEY(ID)
ALTER TABLE dbo.SectionContentCallToAction ADD CONSTRAINT PK_SectionContentCallToAction PRIMARY KEY(ID)
ALTER TABLE dbo.SectionContentImage ADD CONSTRAINT PK_SectionContentImage PRIMARY KEY(ID)
ALTER TABLE dbo.SectionContentParagraph ADD CONSTRAINT PK_SectionContentParagraph PRIMARY KEY(ID)
ALTER TABLE dbo.SectionContentTitle ADD CONSTRAINT PK_SectionContentTitle PRIMARY KEY(ID)
ALTER TABLE dbo.SectionContentVideo ADD CONSTRAINT PK_SectionContentVideo PRIMARY KEY(ID)
GO

ALTER TABLE [dbo].[SectionContent] DROP CONSTRAINT [FK_SectionContent_SectionGroup]
ALTER TABLE [dbo].[SectionGroup] DROP CONSTRAINT [PK_SectionGroup]

GO
ALTER table dbo.SectionGroup ADD [IDStr] NVARCHAR(100)
GO
UPDATE dbo.SectionGroup SET [IDStr]=ID
GO
ALTER TABLE dbo.SectionGroup DROP COLUMN [ID]
ALTER TABLE dbo.SectionGroup ADD [ID] NVARCHAR(100)
GO
UPDATE dbo.SectionGroup SET ID=[IDStr]
ALTER TABLE dbo.SectionGroup DROP COLUMN [IDStr]
GO
ALTER TABLE dbo.SectionGroup ALTER COLUMN [ID]  NVARCHAR(100) NOT NULL
ALTER TABLE dbo.SectionContent ALTER COLUMN SectionGroupId  NVARCHAR(100) NOT NULL
GO

ALTER TABLE dbo.SectionGroup ADD CONSTRAINT PK_SectionGroup PRIMARY KEY(ID)
GO
------------------------------------------------------------------------------------------------------------
UPDATE dbo.CMS_WidgetTemplate SET AssemblyName=N'ZKEACMS.SectionWidget',ServiceTypeName=N'ZKEACMS.SectionWidget.Service.SectionWidgetService',ViewModelTypeName=N'ZKEACMS.SectionWidget.Models.SectionWidget' WHERE AssemblyName=N'Easy.CMS.Section'
GO
UPDATE dbo.CMS_WidgetBase SET AssemblyName=N'ZKEACMS.SectionWidget',ServiceTypeName=N'ZKEACMS.SectionWidget.Service.SectionWidgetService',ViewModelTypeName=N'ZKEACMS.SectionWidget.Models.SectionWidget' WHERE AssemblyName=N'Easy.CMS.Section'
GO
UPDATE dbo.Users set [PassWord]=N'admin'
GO


UPDATE dbo.CMS_WidgetTemplate SET 
AssemblyName=N'ZKEACMS.Product',
ServiceTypeName=N'ZKEACMS.Product.Service.ProductListWidgetService',
ViewModelTypeName=N'ZKEACMS.Product.Models.ProductListWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Product.Service.ProductListWidgetService'
GO
UPDATE dbo.CMS_WidgetTemplate SET 
AssemblyName=N'ZKEACMS.Product',
ServiceTypeName=N'ZKEACMS.Product.Service.ProductCategoryWidgetService',
ViewModelTypeName=N'ZKEACMS.Product.Models.ProductCategoryWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Product.Service.ProductCategoryWidgetService'
GO
UPDATE dbo.CMS_WidgetTemplate SET 
AssemblyName=N'ZKEACMS.Product',
ServiceTypeName=N'ZKEACMS.Product.Service.ProductDetailWidgetService',
ViewModelTypeName=N'ZKEACMS.Product.Models.ProductDetailWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Product.Service.ProductDetailWidgetService'
GO
-------------------------------------------------------------------------------
UPDATE dbo.CMS_WidgetBase SET 
AssemblyName=N'ZKEACMS.Product',
ServiceTypeName=N'ZKEACMS.Product.Service.ProductListWidgetService',
ViewModelTypeName=N'ZKEACMS.Product.Models.ProductListWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Product.Service.ProductListWidgetService'
GO
UPDATE dbo.CMS_WidgetBase SET 
AssemblyName=N'ZKEACMS.Product',
ServiceTypeName=N'ZKEACMS.Product.Service.ProductCategoryWidgetService',
ViewModelTypeName=N'ZKEACMS.Product.Models.ProductCategoryWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Product.Service.ProductCategoryWidgetService'
GO
UPDATE dbo.CMS_WidgetBase SET 
AssemblyName=N'ZKEACMS.Product',
ServiceTypeName=N'ZKEACMS.Product.Service.ProductDetailWidgetService',
ViewModelTypeName=N'ZKEACMS.Product.Models.ProductDetailWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Product.Service.ProductDetailWidgetService'
GO
---------------------------------------------------------------------------

UPDATE dbo.CMS_WidgetTemplate SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleListWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleListWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleListWidgetService'
GO
UPDATE dbo.CMS_WidgetTemplate SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleDetailWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleDetailWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleDetailWidgetService'
GO
UPDATE dbo.CMS_WidgetTemplate SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleTopWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleTopWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleTopWidgetService'
GO
UPDATE dbo.CMS_WidgetTemplate SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleSummaryWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleSummaryWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleSummaryWidgetService'
GO
UPDATE dbo.CMS_WidgetTemplate SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleTypeWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleTypeWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleTypeWidgetService'
GO
---------------------------------------------------------------------------
UPDATE dbo.CMS_WidgetBase SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleListWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleListWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleListWidgetService'
GO
UPDATE dbo.CMS_WidgetBase SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleDetailWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleDetailWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleDetailWidgetService'
GO
UPDATE dbo.CMS_WidgetBase SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleTopWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleTopWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleTopWidgetService'
GO
UPDATE dbo.CMS_WidgetBase SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleSummaryWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleSummaryWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleSummaryWidgetService'
GO
UPDATE dbo.CMS_WidgetBase SET 
AssemblyName=N'ZKEACMS.Article',
ServiceTypeName=N'ZKEACMS.Article.Service.ArticleTypeWidgetService',
ViewModelTypeName=N'ZKEACMS.Article.Models.ArticleTypeWidget' 
WHERE ServiceTypeName=N'Easy.CMS.Article.Service.ArticleTypeWidgetService'
GO

UPDATE dbo.NavigationWidget SET Logo=N'~/images/logo_zkea.png'
GO
UPDATE dbo.CMS_WidgetTemplate SET Thumbnail=REPLACE(Thumbnail,N'~/Content/Images/',N'~/images/')
GO
UPDATE dbo.CMS_WidgetTemplate SET Thumbnail=REPLACE(Thumbnail,N'~/images/',N'~/Plugins/ZKEACMS.Product/Content/Image/') WHERE AssemblyName=N'ZKEACMS.Product'
GO
UPDATE dbo.CMS_WidgetTemplate SET Thumbnail=REPLACE(Thumbnail,N'~/images/',N'~/Plugins/ZKEACMS.Article/Content/Image/') WHERE AssemblyName=N'ZKEACMS.Article'
GO