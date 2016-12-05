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
alter table Carousel alter column [Status] int null
GO
alter table DataDictionary alter column [Order] int null
GO
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