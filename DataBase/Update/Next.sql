
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Forms](
	[ID] [varchar](50) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[FieldsData] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Forms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


insert into CMS_WidgetTemplate(Title,GroupName,PartialView,AssemblyName,ServiceTypeName,ViewModelTypeName,Thumbnail,[Order],[Status]) values
(N'表单',N'1.通用',N'Widget.Form',N'ZKEACMS.FormGenerator',N'ZKEACMS.FormGenerator.Service.FormWidgetService',N'ZKEACMS.FormGenerator.Models.FormWidget',N'~/Plugins/ZKEACMS.FormGenerator/Content/Image/Widget.Form.png',12,1)

