IF NOT EXISTS (SELECT * 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
               AND  TABLE_NAME = 'ArticleTypeRelation')
BEGIN
	CREATE TABLE [dbo].[ArticleTypeRelation](
		[ArticleId] [nvarchar](100) NOT NULL,
		[ArticleTypeId] [nvarchar](100) NOT NULL,
	 CONSTRAINT [PK_ArticleTypeRelation] PRIMARY KEY CLUSTERED 
	(
		[ArticleId] ASC,
		[ArticleTypeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
TRUNCATE TABLE [dbo].[ArticleTypeRelation]
GO
INSERT INTO [dbo].[ArticleTypeRelation] (ArticleId, ArticleTypeId)
SELECT DISTINCT ISNULL(ContentID,ID),ArticleTypeID FROM dbo.[Article]
GO

IF NOT EXISTS (SELECT * 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
               AND  TABLE_NAME = 'CMS_WidgetArticleTypeRelation')
BEGIN
	CREATE TABLE [dbo].[CMS_WidgetArticleTypeRelation](
		[WidgetId] [nvarchar](100) NOT NULL,
		[ArticleTypeId] [int] NOT NULL,
	 CONSTRAINT [PK_CMS_WidgetArticleTypeRelation] PRIMARY KEY CLUSTERED 
	(
		[WidgetId] ASC,
		[ArticleTypeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
TRUNCATE TABLE dbo.CMS_WidgetArticleTypeRelation
GO
INSERT INTO [dbo].[CMS_WidgetArticleTypeRelation](WidgetId,ArticleTypeId)
SELECT T0.ID, T1.ID FROM dbo.ArticleListWidget T0
INNER JOIN dbo.ArticleType T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID =T1.ParentID 
UNION
SELECT T0.ID, T1.ID FROM dbo.ArticleTopWidget T0
INNER JOIN dbo.ArticleType T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID =T1.ParentID 
UNION
SELECT T0.ID, T1.ID FROM dbo.ArticleTypeWidget T0
INNER JOIN dbo.ArticleType T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID = T1.ParentID 
GO


IF NOT EXISTS (SELECT * 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
               AND  TABLE_NAME = 'ProductCategoryRelation')
BEGIN
	CREATE TABLE [dbo].[ProductCategoryRelation](
		[ProductId] [nvarchar](100) NOT NULL,
		[ProductCategoryId] [nvarchar](100) NOT NULL,
	 CONSTRAINT [PK_ProductCategoryRelation] PRIMARY KEY CLUSTERED 
	(
		[ProductId] ASC,
		[ProductCategoryId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
TRUNCATE TABLE [dbo].[ProductCategoryRelation]
GO
INSERT INTO [dbo].[ProductCategoryRelation] (ProductId, ProductCategoryId)
SELECT DISTINCT ISNULL(ContentID,ID), ProductCategoryID FROM dbo.[Product]
GO

IF NOT EXISTS (SELECT * 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
               AND  TABLE_NAME = 'CMS_WidgetProductCategoryRelation')
BEGIN
	CREATE TABLE [dbo].[CMS_WidgetProductCategoryRelation](
		[WidgetId] [nvarchar](100) NOT NULL,
		[ProductCategoryId] [int] NOT NULL,
	 CONSTRAINT [PK_CMS_WidgetProductCategoryRelation] PRIMARY KEY CLUSTERED 
	(
		[WidgetId] ASC,
		[ProductCategoryId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
TRUNCATE TABLE dbo.[CMS_WidgetProductCategoryRelation]
GO
INSERT INTO [dbo].[CMS_WidgetProductCategoryRelation](WidgetId, ProductCategoryId)
SELECT T0.ID, T1.ID FROM dbo.ProductListWidget T0
INNER JOIN dbo.ProductCategory T1 ON T0.ProductCategoryID = T1.ID OR T0.ProductCategoryID =T1.ParentID 
UNION
SELECT T0.ID, T1.ID FROM dbo.ProductCategoryWidget T0
INNER JOIN dbo.ProductCategory T1 ON T0.ProductCategoryID = T1.ID OR T0.ProductCategoryID = T1.ParentID 
GO

IF NOT EXISTS (SELECT * 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
               AND  TABLE_NAME = 'VideoTypeRelation')
BEGIN
	CREATE TABLE [dbo].[VideoTypeRelation](
		[VideoId] [nvarchar](100) NOT NULL,
		[VideoTypeId] [nvarchar](100) NOT NULL,
	 CONSTRAINT [PK_VideoTypeRelation] PRIMARY KEY CLUSTERED 
	(
		[VideoId] ASC,
		[VideoTypeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
TRUNCATE TABLE [dbo].[VideoTypeRelation]
GO
INSERT INTO [dbo].[VideoTypeRelation] (VideoId, VideoTypeId)
SELECT DISTINCT ISNULL(ContentID,ID),VideoTypeID FROM dbo.[Video]
GO

IF NOT EXISTS (SELECT * 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
               AND  TABLE_NAME = 'CMS_WidgetVideoTypeRelation')
BEGIN
	CREATE TABLE [dbo].[CMS_WidgetVideoTypeRelation](
		[WidgetId] [nvarchar](100) NOT NULL,
		[VideoTypeId] [int] NOT NULL,
	 CONSTRAINT [PK_CMS_WidgetVideoTypeRelation] PRIMARY KEY CLUSTERED 
	(
		[WidgetId] ASC,
		[VideoTypeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
TRUNCATE TABLE dbo.CMS_WidgetVideoTypeRelation
GO
INSERT INTO [dbo].[CMS_WidgetVideoTypeRelation](WidgetId,VideoTypeId)
SELECT T0.ID, T1.ID FROM dbo.VideoListWidget T0
INNER JOIN dbo.VideoType T1 ON T0.VideoTypeID = T1.ID OR T0.VideoTypeID =T1.ParentID 
UNION
SELECT T0.ID, T1.ID FROM dbo.VideoTopWidget T0
INNER JOIN dbo.VideoType T1 ON T0.VideoTypeID = T1.ID OR T0.VideoTypeID =T1.ParentID 
UNION
SELECT T0.ID, T1.ID FROM dbo.VideoTypeWidget T0
INNER JOIN dbo.VideoType T1 ON T0.VideoTypeID = T1.ID OR T0.VideoTypeID = T1.ParentID 
GO