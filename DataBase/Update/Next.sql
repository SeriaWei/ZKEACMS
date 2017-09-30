
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[Forms]
    (
      [ID] [VARCHAR](50) NOT NULL ,
      [Title] [NVARCHAR](500) NULL ,
      [FieldsData] [NVARCHAR](MAX) NULL ,
      [Status] [INT] NULL ,
      [Description] [NVARCHAR](500) NULL ,
      [CreateBy] [NVARCHAR](50) NULL ,
      [CreatebyName] [NVARCHAR](100) NULL ,
      [CreateDate] [DATETIME] NULL ,
      [LastUpdateBy] [NVARCHAR](50) NULL ,
      [LastUpdateByName] [NVARCHAR](100) NULL ,
      [LastUpdateDate] [DATETIME] NULL ,
      CONSTRAINT [PK_Forms] PRIMARY KEY CLUSTERED ( [ID] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FormData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[FormId] [varchar](50) NOT NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FormData_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FormDataItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormDataId] [int] NOT NULL,
	[FieldId] [varchar](50) NULL,
	[FieldText] [nvarchar](1000) NULL,
	[FieldValue] [nvarchar](max) NULL,
	[OptionValue] [varchar](50) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FormData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




INSERT  INTO CMS_WidgetTemplate
        ( Title ,
          GroupName ,
          PartialView ,
          AssemblyName ,
          ServiceTypeName ,
          ViewModelTypeName ,
          Thumbnail ,
          [Order] ,
          [Status]
        )
VALUES  ( N'表单' ,
          N'1.通用' ,
          N'Widget.Form' ,
          N'ZKEACMS.FormGenerator' ,
          N'ZKEACMS.FormGenerator.Service.FormWidgetService' ,
          N'ZKEACMS.FormGenerator.Models.FormWidget' ,
          N'~/Plugins/ZKEACMS.FormGenerator/Content/images/Widget.Form.png' ,
          12 ,
          1
        );

GO
INSERT INTO [Language](LanKey,CultureName,LanValue,Module,LanType)
VALUES(N'FormWidget@FormID',N'zh-CN',N'表单',N'FormWidget',N'EntityProperty')