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

UPDATE dbo.CMS_WidgetTemplate SET AssemblyName=N'ZKEACMS.SectionWidget',ServiceTypeName=N'ZKEACMS.SectionWidget.Service.SectionWidgetService',ViewModelTypeName=N'ZKEACMS.SectionWidget.Models.SectionWidget' WHERE AssemblyName=N'Easy.CMS.Section'
GO
UPDATE dbo.CMS_WidgetBase SET AssemblyName=N'ZKEACMS.SectionWidget',ServiceTypeName=N'ZKEACMS.SectionWidget.Service.SectionWidgetService',ViewModelTypeName=N'ZKEACMS.SectionWidget.Models.SectionWidget' WHERE AssemblyName=N'Easy.CMS.Section'
GO
