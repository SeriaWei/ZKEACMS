CREATE TABLE [dbo].[ArticleGallery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[RawData] [nvarchar](max) NULL,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[ProductGallery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[RawData] [nvarchar](max) NULL,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


DELETE FROM [Language] WHERE LanKey = N'CreatebyName' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'CreatebyName',N'zh-CN',N'创建人');

DELETE FROM [Language] WHERE LanKey = N'CreateDate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'CreateDate',N'zh-CN',N'创建日期');

DELETE FROM [Language] WHERE LanKey = N'LastUpdateByName' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'LastUpdateByName',N'zh-CN',N'更新人');

DELETE FROM [Language] WHERE LanKey = N'LastUpdateDate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'LastUpdateDate',N'zh-CN',N'更新日期');

DELETE FROM [Language] WHERE LanKey = N'Articles' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Articles',N'zh-CN',N'文章');

DELETE FROM [Language] WHERE LanKey = N'Products' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Products',N'zh-CN',N'产品');

DELETE FROM [Language] WHERE LanKey = N'Article Gallery' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Article Gallery',N'zh-CN',N'文章组');

DELETE FROM [Language] WHERE LanKey = N'Product Gallery' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Product Gallery',N'zh-CN',N'产品组');

DELETE FROM [Language] WHERE LanKey = N'ArticleGalleryWidget@DetailPageUrl' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ArticleGalleryWidget@DetailPageUrl',N'zh-CN',N'详细页面');

DELETE FROM [Language] WHERE LanKey = N'ArticleGalleryWidget@ArticleGalleryId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ArticleGalleryWidget@ArticleGalleryId',N'zh-CN',N'文章组');

DELETE FROM [Language] WHERE LanKey = N'ProductGalleryWidget@DetailPageUrl' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductGalleryWidget@DetailPageUrl',N'zh-CN',N'详细页面');

DELETE FROM [Language] WHERE LanKey = N'ProductGalleryWidget@ProductGalleryId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductGalleryWidget@ProductGalleryId',N'zh-CN',N'产品组');
