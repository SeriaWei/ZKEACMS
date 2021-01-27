CREATE TABLE IF NOT EXISTS [FluidContentValue] (
  [ID] INTEGER NOT NULL
, [ContentTypeID] int NULL
, [Title] nvarchar(100) NULL
, [Content] ntext NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [ContentID] nvarchar(100) NULL
, [CultureID] int NULL
, [Url] nvarchar(200) NULL
, [SEOTitle] nvarchar(200) NULL
, [SEOKeyWord] nvarchar(200) NULL
, [SEODescription] nvarchar(200) NULL
, CONSTRAINT [PK_FluidContentValue] PRIMARY KEY ([ID])
);
CREATE TABLE IF NOT EXISTS [FluidContentType] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(100) NULL
, [ContentSchema] ntext NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_FluidContentType] PRIMARY KEY ([ID])
);
CREATE TABLE IF NOT EXISTS [FluidContentTemplate] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(100) NULL
, [ApplyTo] nvarchar(100) NULL
, [Template] ntext NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ContentTemplate] PRIMARY KEY ([ID])
);

CREATE TABLE [FluidContentGroup] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Icon] nvarchar(100) NULL
, [Description] nvarchar(255) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__ArticleG__3214EC27E8B2FD3C] PRIMARY KEY ([ID])
);

ALTER TABLE FluidContentType ADD GroupID int null;
ALTER TABLE FluidContentType ADD RoleID int null;
ALTER TABLE FluidContentType ADD Icon nvarchar(255) NULL;


CREATE TABLE [ArticleGallery] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [RawData] ntext NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__ArticleG__3214EC27E8B2FD3C] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductGallery] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [RawData] ntext NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__ProductG__3214EC270743593F] PRIMARY KEY ([ID])
);

DELETE FROM [Language] WHERE LanKey = 'CreatebyName' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('CreatebyName','zh-CN','创建人');

DELETE FROM [Language] WHERE LanKey = 'CreateDate' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('CreateDate','zh-CN','创建日期');

DELETE FROM [Language] WHERE LanKey = 'LastUpdateByName' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('LastUpdateByName','zh-CN','更新人');

DELETE FROM [Language] WHERE LanKey = 'LastUpdateDate' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('LastUpdateDate','zh-CN','更新日期');

DELETE FROM [Language] WHERE LanKey = 'Articles' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Articles','zh-CN','文章');

DELETE FROM [Language] WHERE LanKey = 'Products' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Products','zh-CN','产品');

DELETE FROM [Language] WHERE LanKey = 'Article Gallery' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Article Gallery','zh-CN','文章组');

DELETE FROM [Language] WHERE LanKey = 'Product Gallery' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Product Gallery','zh-CN','产品组');

DELETE FROM [Language] WHERE LanKey = 'ArticleGalleryWidget@DetailPageUrl' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('ArticleGalleryWidget@DetailPageUrl','zh-CN','详细页面');

DELETE FROM [Language] WHERE LanKey = 'ArticleGalleryWidget@ArticleGalleryId' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('ArticleGalleryWidget@ArticleGalleryId','zh-CN','文章组');

DELETE FROM [Language] WHERE LanKey = 'ProductGalleryWidget@DetailPageUrl' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('ProductGalleryWidget@DetailPageUrl','zh-CN','详细页面');

DELETE FROM [Language] WHERE LanKey = 'ProductGalleryWidget@ProductGalleryId' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('ProductGalleryWidget@ProductGalleryId','zh-CN','产品组');

DELETE FROM [Language] WHERE LanKey = 'Icon' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Icon','zh-CN','图标');

DELETE FROM [Language] WHERE LanKey = 'Content Group' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Content Group','zh-CN','内容分组');

DELETE FROM [Language] WHERE LanKey = 'GroupID' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('GroupID','zh-CN','分组');

DELETE FROM [Language] WHERE LanKey = 'RoleID' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('RoleID','zh-CN','角色');
