CREATE TABLE [VideoTypeWidget] (
  [ID] nvarchar(100) NOT NULL
, [VideoTypeID] int NULL
, [TargetPage] nvarchar(255) NULL
, CONSTRAINT [PK_VideoTypeWidget] PRIMARY KEY ([ID])
);
CREATE TABLE [VideoType] (
  [ID] INTEGER NOT NULL
, [Name] nvarchar(100) NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [ParentID] int NULL
, [Status] int NULL
, [SEOTitle] nvarchar(100) NULL
, [SEOKeyWord] nvarchar(100) NULL
, [SEODescription] nvarchar(300) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [ContentID] nvarchar(100) NULL
, [CultureID] int NULL
, CONSTRAINT [PK_VideoType] PRIMARY KEY ([ID])
);
CREATE TABLE [VideoTopWidget] (
  [ID] nvarchar(100) NOT NULL
, [VideoTypeID] int NULL
, [Tops] int NULL
, [SubTitle] nvarchar(255) NULL
, [MoreLink] nvarchar(255) NULL
, [DetailPageUrl] nvarchar(255) NULL
, CONSTRAINT [PK_VideoTopWidget] PRIMARY KEY ([ID])
);
CREATE TABLE [VideoListWidget] (
  [ID] nvarchar(100) NOT NULL
, [VideoTypeID] int NULL
, [DetailPageUrl] nvarchar(255) NULL
, [IsPageable] bit NOT NULL
, [PageSize] int NULL
, CONSTRAINT [PK_VideoListWidget] PRIMARY KEY ([ID])
);
CREATE TABLE [VideoGallery] (
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
, CONSTRAINT [PK__VideoGal__3214EC271AA83EC0] PRIMARY KEY ([ID])
);
CREATE TABLE [VideoDetailWidget] (
  [ID] nvarchar(100) NOT NULL
, [CustomerClass] nvarchar(255) NULL
, CONSTRAINT [PK_VideoDetailWidget] PRIMARY KEY ([ID])
);
CREATE TABLE [Video] (
  [ID] INTEGER NOT NULL
, [Name] nvarchar(100) NULL
, [Title] nvarchar(255) NULL
, [Summary] nvarchar(255) NULL
, [MetaKeyWords] nvarchar(255) NULL
, [MetaDescription] nvarchar(255) NULL
, [Counter] int NULL
, [VideoTypeID] int NULL
, [Description] nvarchar(255) NULL
, [VideoUrl] nvarchar(255) NULL
, [VideoCode] nvarchar(1000) NULL
, [Duration] nvarchar(100) NULL
, [Status] int NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [ImageUrl] nvarchar(255) NULL
, [IsPublish] bit NOT NULL
, [PublishDate] datetime NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [ContentID] nvarchar(100) NULL
, [CultureID] int NULL
, CONSTRAINT [PK_Video] PRIMARY KEY ([ID])
);