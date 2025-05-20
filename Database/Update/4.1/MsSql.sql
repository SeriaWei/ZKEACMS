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
SELECT DISTINCT ContentID,ArticleTypeID FROM [Article]
GO

IF NOT EXISTS (SELECT * 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
               AND  TABLE_NAME = 'WidgetArticleTypeRelation')
BEGIN
	CREATE TABLE [dbo].[WidgetArticleTypeRelation](
		[WidgetId] [nvarchar](100) NOT NULL,
		[ArticleTypeId] [int] NOT NULL,
	 CONSTRAINT [PK_WidgetArticleTypeRelation] PRIMARY KEY CLUSTERED 
	(
		[WidgetId] ASC,
		[ArticleTypeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
TRUNCATE TABLE dbo.WidgetArticleTypeRelation
GO
INSERT INTO [dbo].[WidgetArticleTypeRelation](WidgetId,ArticleTypeId)
SELECT T0.ID, T1.ID FROM ArticleListWidget T0
INNER JOIN ArticleType T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID =T1.ParentID 
UNION
SELECT T0.ID, T1.ID FROM ArticleTopWidget T0
INNER JOIN ArticleType T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID =T1.ParentID 
UNION
SELECT T0.ID, T1.ID FROM ArticleTypeWidget T0
INNER JOIN ArticleType T1 ON T0.ArticleTypeID = T1.ID OR T0.ArticleTypeID = T1.ParentID 
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
SELECT DISTINCT ContentID, ProductCategoryID FROM dbo.[Product]
GO

IF NOT EXISTS (SELECT * 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
               AND  TABLE_NAME = 'WidgetProductCategoryRelation')
BEGIN
	CREATE TABLE [dbo].[WidgetProductCategoryRelation](
		[WidgetId] [nvarchar](100) NOT NULL,
		[ProductCategoryId] [int] NOT NULL,
	 CONSTRAINT [PK_WidgetProductCategoryRelation] PRIMARY KEY CLUSTERED 
	(
		[WidgetId] ASC,
		[ProductCategoryId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
TRUNCATE TABLE dbo.[WidgetProductCategoryRelation]
GO
INSERT INTO [dbo].[WidgetProductCategoryRelation](WidgetId, ProductCategoryId)
SELECT T0.ID, T1.ID FROM ProductListWidget T0
INNER JOIN ProductCategory T1 ON T0.ProductCategoryID = T1.ID OR T0.ProductCategoryID =T1.ParentID 
UNION
SELECT T0.ID, T1.ID FROM ProductCategoryWidget T0
INNER JOIN ProductCategory T1 ON T0.ProductCategoryID = T1.ID OR T0.ProductCategoryID = T1.ParentID 
GO