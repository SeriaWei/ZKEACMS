SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationSetting](
	[SettingKey] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ApplicationSetting] PRIMARY KEY CLUSTERED 
(
	[SettingKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Summary] [nvarchar](255) NULL,
	[MetaKeyWords] [nvarchar](255) NULL,
	[MetaDescription] [nvarchar](255) NULL,
	[Counter] [int] NULL,
	[ArticleTypeID] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[ArticleContent] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[ImageThumbUrl] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[IsPublish] [bit] NOT NULL,
	[PublishDate] [datetime] NULL,
	[Url] [nvarchar](100) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleDetailWidget](
	[ID] [nvarchar](100) NOT NULL,
	[CustomerClass] [nvarchar](255) NULL,
 CONSTRAINT [PK_ArticleDetailWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleListWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ArticleTypeID] [int] NULL,
	[DetailPageUrl] [nvarchar](255) NULL,
	[IsPageable] [bit] NOT NULL,
	[PageSize] [int] NULL,
 CONSTRAINT [PK_ArticleListWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleSummaryWidget](
	[ID] [nvarchar](100) NOT NULL,
	[SubTitle] [nvarchar](255) NULL,
	[Style] [nvarchar](255) NULL,
	[DetailLink] [nvarchar](255) NULL,
	[Summary] [nvarchar](max) NULL,
 CONSTRAINT [PK_ArticleSummaryWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTopWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ArticleTypeID] [int] NULL,
	[Tops] [int] NULL,
	[SubTitle] [nvarchar](255) NULL,
	[MoreLink] [nvarchar](255) NULL,
	[DetailPageUrl] [nvarchar](255) NULL,
 CONSTRAINT [PK_ArticleTopWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Url] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[SEOTitle] [nvarchar](100) NULL,
	[SEOKeyWord] [nvarchar](100) NULL,
	[SEODescription] [nvarchar](300) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ArticleType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTypeWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ArticleTypeID] [int] NULL,
	[TargetPage] [nvarchar](255) NULL,
 CONSTRAINT [PK_ArticleTypeWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PromoCode] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carousel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Height] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Carousel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarouselItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[CarouselID] [int] NULL,
	[CarouselWidgetID] [nvarchar](100) NULL,
	[TargetLink] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CarouselItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarouselWidget](
	[ID] [nvarchar](100) NOT NULL,
	[CarouselID] [int] NULL,
 CONSTRAINT [PK_CarouselWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Layout](
	[ID] [nvarchar](100) NOT NULL,
	[LayoutName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[ContainerClass] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Script] [nvarchar](255) NULL,
	[Style] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[ImageThumbUrl] [nvarchar](255) NULL,
	[Theme] [nvarchar](255) NULL,
 CONSTRAINT [PK_CMS_Layout] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_LayoutHtml](
	[LayoutHtmlId] [int] IDENTITY(1,1) NOT NULL,
	[LayoutId] [nvarchar](100) NOT NULL,
	[PageId] [nvarchar](100) NULL,
	[Html] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CMS_LayoutHtml] PRIMARY KEY CLUSTERED 
(
	[LayoutHtmlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Media](
	[ID] [nvarchar](50) NOT NULL,
	[ParentID] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[MediaType] [int] NULL,
	[Url] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_CMS_Media] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PostMessage] [nvarchar](max) NOT NULL,
	[Reply] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_CMS_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Page](
	[ID] [nvarchar](100) NOT NULL,
	[ReferencePageID] [nvarchar](100) NULL,
	[IsPublishedPage] [bit] NULL,
	[ParentId] [nvarchar](100) NULL,
	[PageName] [nvarchar](100) NULL,
	[IsHomePage] [bit] NOT NULL,
	[Url] [nvarchar](255) NULL,
	[LayoutId] [nvarchar](100) NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[IsPublish] [bit] NOT NULL,
	[PublishDate] [datetime] NULL,
	[MetaKeyWorlds] [nvarchar](255) NULL,
	[MetaDescription] [nvarchar](255) NULL,
	[Script] [nvarchar](255) NULL,
	[Style] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CMS_Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Redirection](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[InComingUrl] [nvarchar](500) NOT NULL,
	[DestinationURL] [nvarchar](500) NOT NULL,
	[IsPermanent] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsPattern] [bit] NULL,
 CONSTRAINT [PK_CMS_Redirection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Rule](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[ZoneName] [nvarchar](50) NULL,
	[RuleExpression] [nvarchar](800) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[RuleItems] [nvarchar](max) NULL,
 CONSTRAINT [PK_CMS_Rule] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Theme](
	[ID] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Url] [nvarchar](100) NULL,
	[UrlDebugger] [nvarchar](100) NULL,
	[Thumbnail] [nvarchar](100) NULL,
	[IsActived] [bit] NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CMS_Theme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_WidgetBase](
	[ID] [nvarchar](100) NOT NULL,
	[WidgetName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[LayoutId] [nvarchar](100) NULL,
	[PageId] [nvarchar](100) NULL,
	[ZoneId] [nvarchar](100) NULL,
	[PartialView] [nvarchar](255) NULL,
	[AssemblyName] [nvarchar](255) NULL,
	[ServiceTypeName] [nvarchar](255) NULL,
	[ViewModelTypeName] [nvarchar](255) NULL,
	[FormView] [nvarchar](255) NULL,
	[StyleClass] [nvarchar](1000) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[IsTemplate] [bit] NULL,
	[Thumbnail] [nvarchar](200) NULL,
	[IsSystem] [bit] NULL,
	[ExtendData] [nvarchar](max) NULL,
	[RuleID] [int] NULL,
 CONSTRAINT [PK_CMS_WidgetBase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Zone](
	[ID] [nvarchar](100) NOT NULL,
	[LayoutId] [nvarchar](100) NULL,
	[PageId] [nvarchar](100) NULL,
	[ZoneName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[HeadingCode] [nvarchar](100) NULL,
 CONSTRAINT [PK_CMS_Zone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PagePath] [nvarchar](300) NULL,
	[UserId] [nvarchar](100) NULL,
	[Picture] [nvarchar](300) NULL,
	[UserName] [nvarchar](100) NULL,
	[CommentContent] [nvarchar](500) NULL,
	[Agrees] [int] NULL,
	[Disagrees] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Code] [nvarchar](10) NULL,
	[Symbol] [nvarchar](10) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataArchived](
	[ID] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DataArchived] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataDictionary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DicName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[DicValue] [nvarchar](255) NULL,
	[Order] [int] NULL,
	[Pid] [int] NULL,
	[IsSystem] [bit] NOT NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[ImageThumbUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DataDictionary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Major] [int] NULL,
	[Minor] [int] NULL,
	[Revision] [int] NULL,
	[Build] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_ActionBody](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ActionBody] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_EventAction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Event] [nvarchar](100) NULL,
	[Actions] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_EventAction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_PendingTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Identifier] [nvarchar](100) NOT NULL,
	[HandlerName] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LogMessage] [nvarchar](max) NULL,
	[RetryCount] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_EA_PendingTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtendField](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Value] [nvarchar](max) NULL,
	[OwnerModule] [nvarchar](50) NULL,
	[OwnerID] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_ExtendField] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidContentGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Icon] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidContentTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[ApplyTo] [nvarchar](100) NULL,
	[Template] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FluidContentTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidContentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[ContentSchema] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[GroupID] [int] NULL,
	[RoleID] [int] NULL,
	[Icon] [nvarchar](100) NULL,
 CONSTRAINT [PK_FluidContentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidContentValue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeID] [int] NULL,
	[Title] [nvarchar](100) NULL,
	[Content] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[ContentID] [nvarchar](100) NULL,
	[CultureID] [int] NULL,
	[Url] [nvarchar](200) NULL,
	[SEOTitle] [nvarchar](200) NULL,
	[SEOKeyWord] [nvarchar](200) NULL,
	[SEODescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_FluidContentValue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forms](
	[ID] [varchar](50) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[FieldsData] [nvarchar](max) NULL,
	[NotificationReceiver] [nvarchar](500) NULL,
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HtmlWidget](
	[ID] [nvarchar](100) NOT NULL,
	[HTML] [nvarchar](max) NULL,
 CONSTRAINT [PK_HtmlWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[AltText] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[ImageUrlMd] [nvarchar](225) NULL,
	[ImageUrlSm] [nvarchar](225) NULL,
 CONSTRAINT [PK_ImageWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navigation](
	[ID] [nvarchar](100) NOT NULL,
	[ParentId] [nvarchar](100) NULL,
	[Url] [nvarchar](255) NULL,
	[Title] [nvarchar](200) NULL,
	[IsMobile] [bit] NULL,
	[Html] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[DisplayOrder] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Navigation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavigationWidget](
	[ID] [nvarchar](100) NOT NULL,
	[CustomerClass] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Logo] [nvarchar](255) NULL,
	[AlignClass] [nvarchar](50) NULL,
	[IsTopFix] [bit] NULL,
	[RootID] [nvarchar](100) NULL,
	[ShowBasket] [bit] NULL,
 CONSTRAINT [PK_NavigationWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Total] [decimal](18, 4) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[PayTime] [datetime] NULL,
	[CompletePayTime] [datetime] NULL,
	[TrackingNumber] [nvarchar](50) NULL,
	[LogisticsCompany] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](500) NULL,
	[PaymentGateway] [nvarchar](50) NULL,
	[PaymentID] [nvarchar](500) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[RefundID] [nvarchar](100) NULL,
	[Refund] [decimal](18, 4) NULL,
	[RefundDate] [datetime] NULL,
	[RefundReason] [nvarchar](500) NULL,
	[ShippingOption] [int] NULL,
	[SubTotal] [money] NULL,
	[Tax] [money] NULL,
	[Shipping] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PromoCode] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[BasketID] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageView](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageUrl] [nvarchar](500) NULL,
	[PageTitle] [nvarchar](200) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[SessionID] [nvarchar](50) NULL,
	[UserAgent] [nvarchar](500) NULL,
	[Referer] [nvarchar](1000) NULL,
	[RefererName] [nvarchar](255) NULL,
	[KeyWords] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_PageView] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionKey] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Module] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK__Permission_PermissionKey_RoleId] PRIMARY KEY CLUSTERED 
(
	[PermissionKey] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistKey](
	[ID] [nvarchar](100) NOT NULL,
	[XML] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[ActivationDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[ImageThumbUrl] [nvarchar](255) NULL,
	[BrandCD] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Color] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[RebatePrice] [money] NULL,
	[PurchasePrice] [money] NULL,
	[Norm] [nvarchar](255) NULL,
	[ShelfLife] [nvarchar](255) NULL,
	[ProductContent] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsPublish] [bit] NOT NULL,
	[PublishDate] [datetime] NULL,
	[Status] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWord] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](max) NULL,
	[OrderIndex] [int] NULL,
	[SourceFrom] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[TargetFrom] [nvarchar](255) NULL,
	[TargetUrl] [nvarchar](255) NULL,
	[PartNumber] [nvarchar](200) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Url] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[SEOTitle] [nvarchar](100) NULL,
	[SEOKeyWord] [nvarchar](100) NULL,
	[SEODescription] [nvarchar](300) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategoryTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryId] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[ParentId] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProductCategoryTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategoryWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ProductCategoryID] [int] NULL,
	[TargetPage] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductCategoryWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetailWidget](
	[ID] [nvarchar](100) NOT NULL,
	[CustomerClass] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductDetailWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ImageUrl] [nvarchar](500) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductListWidget](
	[ID] [nvarchar](100) NOT NULL,
	[IsPageable] [bit] NOT NULL,
	[ProductCategoryID] [int] NULL,
	[DetailPageUrl] [nvarchar](255) NULL,
	[Columns] [nvarchar](255) NULL,
	[PageSize] [int] NULL,
 CONSTRAINT [PK_ProductListWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[TagId] [int] NULL,
	[Title] [nvarchar](200) NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScriptWidget](
	[ID] [nvarchar](100) NOT NULL,
	[Script] [nvarchar](max) NULL,
 CONSTRAINT [PK_ScriptWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContent](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[SectionGroupId] [nvarchar](100) NOT NULL,
	[SectionContentType] [int] NULL,
	[Order] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_SectionContent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentCallToAction](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[InnerText] [nvarchar](255) NULL,
	[Href] [nvarchar](255) NULL,
 CONSTRAINT [PK_SectionContentCallToAction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentImage](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[ImageSrc] [nvarchar](255) NULL,
	[ImageAlt] [nvarchar](255) NULL,
	[ImageTitle] [nvarchar](255) NULL,
	[Href] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
 CONSTRAINT [PK_SectionContentImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentParagraph](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[HtmlContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_SectionContentParagraph] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentTitle](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[InnerText] [nvarchar](255) NULL,
	[Href] [nvarchar](255) NULL,
	[TitleLevel] [nvarchar](10) NULL,
 CONSTRAINT [PK_SectionContentTitle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentVideo](
	[ID] [nvarchar](100) NOT NULL,
	[VideoTitle] [nvarchar](200) NULL,
	[Thumbnail] [nvarchar](200) NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Url] [nvarchar](256) NULL,
	[Code] [nvarchar](max) NULL,
 CONSTRAINT [PK_SectionContentVideo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionGroup](
	[ID] [nvarchar](100) NOT NULL,
	[GroupName] [nvarchar](255) NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[PartialView] [nvarchar](100) NULL,
	[Order] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[PercentWidth] [nvarchar](100) NULL,
 CONSTRAINT [PK_SectionGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTemplate](
	[TemplateName] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Thumbnail] [nvarchar](100) NULL,
	[ExampleData] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_SectionTemplate] PRIMARY KEY CLUSTERED 
(
	[TemplateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionWidget](
	[ID] [nvarchar](100) NOT NULL,
	[SectionTitle] [nvarchar](255) NULL,
	[IsHorizontal] [bit] NULL,
 CONSTRAINT [PK_SectionWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingOption](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[Rule] [nvarchar](max) NULL,
	[ContentID] [nvarchar](100) NULL,
	[CultureID] [int] NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StyleSheetWidget](
	[ID] [nvarchar](100) NOT NULL,
	[StyleSheet] [nvarchar](max) NULL,
 CONSTRAINT [PK_StyleSheetWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Referrer] [nvarchar](500) NULL,
	[IsValidate] [bit] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleRelation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](255) NULL,
	[ApiLoginToken] [nvarchar](255) NULL,
	[LastLoginDate] [datetime] NULL,
	[LoginIP] [nvarchar](50) NULL,
	[PhotoUrl] [nvarchar](255) NULL,
	[Timestamp] [bigint] NULL,
	[UserName] [nvarchar](100) NULL,
	[UserTypeCD] [int] NULL,
	[Address] [nvarchar](255) NULL,
	[Age] [int] NULL,
	[Birthday] [datetime] NULL,
	[Birthplace] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[EnglishName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Hobby] [nvarchar](100) NULL,
	[LastName] [nvarchar](50) NULL,
	[MaritalStatus] [int] NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[Profession] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[School] [nvarchar](50) NULL,
	[Sex] [int] NULL,
	[Telephone] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[ResetToken] [nvarchar](50) NULL,
	[ResetTokenDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoWidget](
	[ID] [nvarchar](100) NOT NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Url] [nvarchar](255) NULL,
	[Code] [nvarchar](500) NULL,
 CONSTRAINT [PK_VideoWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Animation_Widget_FadeInUp', N'false', NULL, NULL, 1, NULL, NULL, CAST(N'2022-07-29T20:42:10.083' AS DateTime), NULL, NULL, CAST(N'2022-07-29T20:42:10.083' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'EnableCustomerAccount', N'true', NULL, NULL, 1, NULL, NULL, CAST(N'2022-07-29T20:42:31.003' AS DateTime), NULL, NULL, CAST(N'2022-07-29T20:42:31.003' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'EnableResponsiveDesign', N'true', NULL, NULL, 1, NULL, NULL, CAST(N'2020-03-14T11:32:07.333' AS DateTime), NULL, NULL, CAST(N'2020-03-14T11:32:07.333' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ExpandAllPage', N'true', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2018-04-11T17:01:47.230' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-11T17:01:47.233' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Favicon', N'~/favicon.ico', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:57:33.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:57:33.627' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'OuterChainPicture', N'false', NULL, NULL, 1, NULL, NULL, CAST(N'2019-07-31T12:09:28.430' AS DateTime), NULL, NULL, CAST(N'2019-07-31T12:09:28.430' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'PinNavigation', N'true', NULL, NULL, 1, NULL, NULL, CAST(N'2022-07-29T20:42:10.387' AS DateTime), NULL, NULL, CAST(N'2022-07-29T20:42:10.387' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SiteInformation_Logo_Mini', N'/images/logo_min.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2021-03-06T22:16:20.370' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2021-03-06T22:16:20.370' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SiteInformation_SiteName', N'ZKEASOFT', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2021-03-06T22:16:20.310' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2021-03-06T22:16:20.310' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'UseImageCaptcha', N'true', NULL, NULL, 1, NULL, NULL, CAST(N'2022-07-29T20:42:39.537' AS DateTime), NULL, NULL, CAST(N'2022-07-29T20:42:39.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ID], [Title], [Summary], [MetaKeyWords], [MetaDescription], [Counter], [ArticleTypeID], [Description], [ArticleContent], [Status], [ImageThumbUrl], [ImageUrl], [IsPublish], [PublishDate], [Url], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'ZKEACMS 简介', N'ZKEACMS是基于EasyFrameWork，使用 ASP .NET MVC 开发的开源 .Net CMS。  ZKEACMS一个内容管理系统。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。', N'ZKEACMS', N'ZKEACMS是基于EasyFrameWork，使用 ASP .NET MVC 开发的开源 .Net CMS。  ZKEACMS一个内容管理系统。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。', 1, 2, NULL, N'<h3>简介</h3>
<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用 ASP .NET MVC 开发的开源 .Net CMS。</p>
<p>ZKEACMS一个内容管理系统。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>
<h4><a href="http://www.zkea.net/zkeacms/createpage" target="_blank" rel="noopener">了解我们的设计理念</a></h4>
<h3>开发环境</h3>
<p>Microsoft VisualStudio 2013</p>
<p><span>.Net FrameWork 4.0，MVC 4</span></p>
<p>Microsoft Sql Server 2008 以上</p>
<h3>直观设计</h3>
<p>ZKEACMS 是基于ASP.NET MVC设计的开源CMS，所见即所得是ZKEACMS的一大特点。</p>
<p>添加新的页面，或者在现有的页面上直接进行设计，编辑，添加内容，这些都很简单。</p>
<p>丰富的组件和模板，只要会操作电脑，就可以设计网站。</p>
<h3>操作简单</h3>
<p>ZKEACMS采用拖放操作设计，简单直观，将看到的模板，喜欢的样式直接拖入页面中即可。</p>
<p>在于用户交互的关键地方，都会给出提示或预览，并且ZKEASOFT提供了详细的<a href="http://www.zkea.net/zkeacms/document" target="_blank" rel="noopener">文档</a></p>
<h3>移动友好</h3>
<p>ZKEACMS基于流行的BootStrap设计的主题，采用了现代的响应式设计，可以自动适配不同大小的屏幕和设备。</p>
<p>从PC，笔记本，电视，平板到手机页面都会自动响应适应。</p>
<h3>布局设计</h3>
<p>布局，用于对页面做区域划分，用户使用拖拉&ldquo;行&rdquo;，&ldquo;列&rdquo;的方式进行布局的设计。布局的划分，采用行，列的方式进行划分，可嵌套。</p>
<p>一个布局里面，可以添加任意行，每一行使用12等分进行栅格，最多可划分为12列。行列划分完成以后，要在列中加入&ldquo;组件区域&rdquo;，才可以在该列中加入组件。</p>
<h3>概览设计</h3>
<p>概览页面，是页面的缩略显示。在这个页面里面，用户可以直接看到页面的布局，和页面中的组件。</p>
<p>在概览页面中，用户可以添加组件到任意区域。可以对任意区域内的组件进行排序或者拖放到别的区域显示。</p>
<h3>可扩展性</h3>
<p>ZKEACMS 设计内容与模板分离，可以在不切换主题的情况下，通过切换模板得到不同的显示效果。</p>
<p>通过不断地添加模板，网页显得更加多元化，现代化。</p>
<p><span>ZKEACMS 是插件式设计，可以通过不断地添加插件来获取新的功能，默认的插件已经足以满足日常使用。</span></p>', 1, N'/images/09.jpg', NULL, 1, CAST(N'2017-11-19T23:41:19.000' AS DateTime), N'zkeacms', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T23:41:19.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T21:52:43.060' AS DateTime))
INSERT [dbo].[Article] ([ID], [Title], [Summary], [MetaKeyWords], [MetaDescription], [Counter], [ArticleTypeID], [Description], [ArticleContent], [Status], [ImageThumbUrl], [ImageUrl], [IsPublish], [PublishDate], [Url], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'ZKEACMS For .Net Core', N'纸壳CMS（ZKEACMS Core） 是ZKEACMS对 .Net Core 版本的全功能实现 CMS，借助于 .Net Core 实现跨平台，您可以在 Windows, MAC OS, Linux, Docker 上运行。', N'ZKEACMS .Net Core', N'纸壳CMS（ZKEACMS Core） 是ZKEACMS对 .Net Core 版本的全功能实现 CMS，借助于 .Net Core 实现跨平台，您可以在 Windows, MAC OS, Linux, Docker 上运行。', 1, 3, NULL, N'<h3>全功能迁移</h3>
<p>纸壳CMS（ZKEACMS Core） 是ZKEACMS对 .Net Core 版本的全功能实现 CMS，借助于 .Net Core 实现跨平台，您可以在 Windows, MAC OS, Linux, Docker 上运行。</p>
<p>目前纸壳CMS（ZKEACMS Core）已经正式发布，它拥有ZKEACMS的所有功能，并且更加优秀，在性能等各方面的表现都优于ZKEACMS，我们推荐您使用。</p>
<p><img src="http://ww4.sinaimg.cn/mw690/005zTNGqgw1f5e6o2kejlg30dw08an3g.gif" /></p>
<h3>基于 .NET Core</h3>
<p>.NET Core 是.NET Framework的新一代版本，是微软开发的第一个官方版本，具有跨平台 (Windows、Mac OSX、Linux) 能力的应用程序开发框架 (Application Framework)，未来也将会支持&nbsp;FreeBSD&nbsp;与 Alpine 平台，也是微软在一开始发展时就开源的软件平台，它经常也会拿来和现有的开源 .NET 平台&nbsp;Mono&nbsp;比较。</p>
<p>ZKEACMS Core 基于ASP .NET MVC Core 重新设计，ZKEACMS v2.3使用的是较早的MVC4，现在您可以使用MVC Core的所有新特性了，像tag helper等等，这样您可以尽情使用跨平台的优势，并且具有引人注目的性能与高可靠度。开发人员能快速直接的获取 .NET Core 开发环境。</p>
<h3>重新设计</h3>
<p>由于.Net Core的革命，纸壳CMS（ZKEACMS Core） 重新设计了底层以适应 ASP .NET Core。虽然重新设计了底层，纸壳科技还是尽量保证 Core 版本的CMS的功能完整，并且资源可以在两个版本间共享。</p>
<p>重新设计的 .Net core CMS 将进一步降低您的入门成本。如果您对 ZKEACMS 之前有所了解，那么您将马上可以开始 纸壳CMS（ZKEACMS Core） 的开发工作。</p>
<h3>Entity Framework Core</h3>
<p>Entity Framework Core&nbsp;是 Entity Framework 的 .Net Core 版本。Entity Framework&nbsp;是微软以 ADO.NET 为基础所发展出来的对象关系对应 (O/R Mapping) 解决方案。使用Entity Framework，你可以轻松的切换使用不同的数据库实例。例如SQLServer，MySql，ORACLE，SQLite等。</p>
<p>纸壳CMS（ZKEACMS Core） 放弃了EasyFramework中的ORM系统，改为使用 Entity Framework Core 作为数据库访问，这样可以减少学习、入门的成本，会Entity Framework即可快速上手。并且可以轻松选择使用不同的数据库。</p>
<h3>热插拔的插件机制</h3>
<p>纸壳CMS（ZKEACMS Core） 重新设计了插件机制，分离各组件程序集（DLL），这样更方便各组件的独立与隔离。这样一来，插件的热插拔也成为了可能。</p>
<p>基于插件的设计，您的程序可以无限的横向扩展，功能可以变得越来越丰富，而不用去修改核心功能。</p>
<div>
<div>
<div>
<div>
<p></p>
</div>
</div>
</div>
</div>', 1, N'/images/09.jpg', NULL, 1, CAST(N'2017-11-19T23:53:23.000' AS DateTime), N'zkeacms-core', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T23:53:16.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T21:52:54.903' AS DateTime))
SET IDENTITY_INSERT [dbo].[Article] OFF
INSERT [dbo].[ArticleDetailWidget] ([ID], [CustomerClass]) VALUES (N'3aa8b53e7ad143ff818855a7abcb3fdd', NULL)
INSERT [dbo].[ArticleDetailWidget] ([ID], [CustomerClass]) VALUES (N'e8fd1019bab045e5927ec30abaaa1aba', NULL)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'416c5402962b41548c83fabaa5492b42', 1, N'~/article/detail', 1, 5)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'ca9f8809636d448cbd4f3beb418465b3', 1, N'~/article/detail', 1, 5)
INSERT [dbo].[ArticleSummaryWidget] ([ID], [SubTitle], [Style], [DetailLink], [Summary]) VALUES (N'8c5b69f614b641c0a5f7a8e318de8df3', N'ZKEACMS 简介', N'bs-callout-default', N'https://github.com/SeriaWei/ZKEACMS.Core', N'<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS" target="_blank" rel="noopener">ZKEACMS</a> Core 是基于.Net Core开发的开源CMS，在您开始使用之前，为了保障您的权益，请先查看我们的开源协议<a href="http://www.zkea.net/licenses" target="_blank" rel="noopener">http://www.zkea.net/licenses</a>。</p>
<p>ZKEACMS是一个内容管理软件，ZKEACMS的主旨在于快速创建页面和自定义页面内容。无论您是专业的开发人员还是普通的用户，都可以快速上手使用ZKEACMS。</p>
<p>ZKEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。</p>
<p>架设环境：.Net Core 2.0</p>
<h3>旗舰版</h3>
<p>体验地址：<a href="http://demo.zkea.net" target="_blank" rel="noopener">http://demo.zkea.net</a></p>
<h3>建站系统</h3>
<p>基于ZKEACMS的云建站系统</p>
<p><a href="http://www.zkea.net/cloud" target="_blank" rel="noopener">http://www.zkea.net/cloud</a></p>
<p></p>')
INSERT [dbo].[ArticleSummaryWidget] ([ID], [SubTitle], [Style], [DetailLink], [Summary]) VALUES (N'cd21a7bf68b44f6e8d178b153288a26e', N'ZKEACMS 简介', N'bs-callout-default', N'https://github.com/SeriaWei/ZKEACMS.Core', N'<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS" target="_blank" rel="noopener">ZKEACMS</a> Core 是基于.Net Core开发的开源CMS，在您开始使用之前，为了保障您的权益，请先查看我们的开源协议<a href="http://www.zkea.net/licenses" target="_blank" rel="noopener">http://www.zkea.net/licenses</a>。</p>
<p>ZKEACMS是一个内容管理软件，ZKEACMS的主旨在于快速创建页面和自定义页面内容。无论您是专业的开发人员还是普通的用户，都可以快速上手使用ZKEACMS。</p>
<p>ZKEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。</p>
<p>架设环境：.Net Core 2.0</p>
<h3>旗舰版</h3>
<p>体验地址：<a href="http://demo.zkea.net" target="_blank" rel="noopener">http://demo.zkea.net</a></p>
<h3>建站系统</h3>
<p>基于ZKEACMS的云建站系统</p>
<p><a href="http://www.zkea.net/cloud" target="_blank" rel="noopener">http://www.zkea.net/cloud</a></p>
<p></p>')
SET IDENTITY_INSERT [dbo].[ArticleType] ON 

INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'新闻', NULL, 0, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:50:18.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:18:33.430' AS DateTime))
INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'公司新闻', NULL, 1, N'company', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:50:24.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:31:38.347' AS DateTime))
INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'行业新闻', NULL, 1, N'industry', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:50:29.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:31:42.810' AS DateTime))
SET IDENTITY_INSERT [dbo].[ArticleType] OFF
INSERT [dbo].[ArticleTypeWidget] ([ID], [ArticleTypeID], [TargetPage]) VALUES (N'8df64186d2fd4d63a9f9bb3b6e34cd2a', 1, NULL)
INSERT [dbo].[ArticleTypeWidget] ([ID], [ArticleTypeID], [TargetPage]) VALUES (N'de8d94fd51cb4e73b00518dbb2f134d3', 1, NULL)
SET IDENTITY_INSERT [dbo].[Carousel] ON 

INSERT [dbo].[Carousel] ([ID], [Title], [Height], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'示例', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:17.203' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:17:54.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[Carousel] OFF
SET IDENTITY_INSERT [dbo].[CarouselItem] ON 

INSERT [dbo].[CarouselItem] ([ID], [Title], [CarouselID], [CarouselWidgetID], [TargetLink], [ImageUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'图1', 1, NULL, N'http://www.zkea.net/zkeacms/donate', N'~/images/bg1.jpg', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:17.217' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:17:54.053' AS DateTime))
INSERT [dbo].[CarouselItem] ([ID], [Title], [CarouselID], [CarouselWidgetID], [TargetLink], [ImageUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'图2', 1, NULL, N'http://www.zkea.net/zkeacms/donate', N'~/images/bg2.jpg', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:17.570' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:17:54.420' AS DateTime))
INSERT [dbo].[CarouselItem] ([ID], [Title], [CarouselID], [CarouselWidgetID], [TargetLink], [ImageUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'图3', 1, NULL, N'http://www.zkea.net/zkeacms/donate', N'~/images/bg3.jpg', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:17.573' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:17:54.433' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarouselItem] OFF
INSERT [dbo].[CarouselWidget] ([ID], [CarouselID]) VALUES (N'19350341920b4827bf2a4e458ad24a58', 1)
INSERT [dbo].[CarouselWidget] ([ID], [CarouselID]) VALUES (N'41e075ab1b89453388494a539eec55b9', 1)
INSERT [dbo].[CMS_Layout] ([ID], [LayoutName], [Title], [ContainerClass], [Status], [Description], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [ImageUrl], [ImageThumbUrl], [Theme]) VALUES (N'0846a33e56bf45d5aae602ef40d87444', N'其它', NULL, N'container', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:06:44.200' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:06:44.200' AS DateTime), N'~/images/layout.jpg', N'~/images/layout.jpg', N'Default')
INSERT [dbo].[CMS_Layout] ([ID], [LayoutName], [Title], [ContainerClass], [Status], [Description], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [ImageUrl], [ImageThumbUrl], [Theme]) VALUES (N'1dae90cf6a8547538cc0c369b9943c01', N'默认', NULL, N'container', 1, NULL, NULL, NULL, N'admin', NULL, CAST(N'2015-08-31T11:56:31.750' AS DateTime), N'admin', NULL, CAST(N'2015-08-31T11:56:31.750' AS DateTime), N'~/images/layout.jpg', N'~/images/layout.jpg', N'Default')
SET IDENTITY_INSERT [dbo].[CMS_LayoutHtml] ON 

INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (219, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.063' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.063' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (220, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.333' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.333' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (221, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.337' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.337' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (222, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.340' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (223, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.347' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.347' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (224, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.350' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.350' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (225, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.353' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.353' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (226, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.357' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.357' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (227, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.370' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.370' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (228, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.373' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.373' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (229, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.647' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (230, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.650' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.650' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (231, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.650' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.650' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (232, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.667' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.667' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (233, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.950' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.950' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (234, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.983' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.983' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (235, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.987' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:11.987' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (236, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:12.223' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:12.223' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (237, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:12.270' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:12.270' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (238, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:12.500' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:12.500' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (239, N'0846a33e56bf45d5aae602ef40d87444', NULL, N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:12.757' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:12.757' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (240, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:39.997' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:39.997' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (241, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.013' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.013' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (242, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.017' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.017' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (243, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.023' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.023' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (244, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.023' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.023' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (245, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.027' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.027' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (246, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.027' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.027' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (247, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.030' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.030' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (248, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.030' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.030' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (249, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.030' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.030' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (250, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.043' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.043' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (251, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.043' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.043' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (252, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.047' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.047' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (253, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.047' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.047' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (254, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.047' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.047' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (255, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.053' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.053' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (256, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.057' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.057' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (257, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.057' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.057' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (258, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.063' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.063' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (259, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.063' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.063' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (260, N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.073' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:40.073' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (261, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.053' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.053' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (262, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.110' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.110' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (263, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.113' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.113' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (264, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.113' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.113' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (265, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.117' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.117' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (266, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.117' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.117' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (267, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.120' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (268, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.120' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (269, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.120' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (270, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.123' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.123' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (271, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.123' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.123' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (272, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.127' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.127' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (273, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.127' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.127' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (274, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.130' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.130' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (275, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.133' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.133' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (276, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.133' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.133' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (277, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.133' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.133' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (278, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.137' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.137' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (279, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.137' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.137' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (280, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.140' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.140' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (281, N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.140' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:40.140' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (282, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:54.990' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:54.990' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (283, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.003' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.003' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (284, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.007' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.007' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (285, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.010' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.010' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (286, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.013' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.013' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (287, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.013' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.013' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (288, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.020' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.020' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (289, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.023' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.023' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (290, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.033' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.033' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (291, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.037' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.037' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (292, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.050' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.050' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (293, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.050' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.050' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (294, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.053' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.053' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (295, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.060' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.060' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (296, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.063' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.063' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (297, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.067' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.067' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (298, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.070' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.070' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (299, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.070' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.070' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (300, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.073' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.073' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (301, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.077' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.077' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (302, N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.087' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:55.087' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (303, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.367' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.367' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (304, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.373' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.373' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (305, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.380' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.380' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (306, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.380' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.380' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (307, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.383' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.383' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (308, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.383' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.383' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (309, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.387' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.387' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (310, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.390' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.390' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (311, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.393' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.393' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (312, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.393' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.393' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (313, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.397' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.397' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (314, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.397' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.397' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (315, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.400' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.400' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (316, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.400' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.400' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (317, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.407' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.407' AS DateTime))
GO
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (318, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.410' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.410' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (319, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.417' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.417' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (320, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.420' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.420' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (321, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.423' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.423' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (322, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.427' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.427' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (323, N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.427' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.427' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (324, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.003' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.003' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (325, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.010' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.010' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (326, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.010' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.010' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (327, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.013' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.013' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (328, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.013' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.013' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (329, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.017' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.017' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (330, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.017' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.017' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (331, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.017' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.017' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (332, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.020' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.020' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (333, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.020' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.020' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (334, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.023' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.023' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (335, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.023' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.023' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (336, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.027' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.027' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (337, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.027' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.027' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (338, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.030' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.030' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (339, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.030' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.030' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (340, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.033' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.033' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (341, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.033' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.033' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (342, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.037' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.037' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (343, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.037' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.037' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (344, N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.037' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:13.037' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (345, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.127' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.127' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (346, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.130' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.130' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (347, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.133' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.133' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (348, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.133' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.133' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (349, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.137' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.137' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (350, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.137' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.137' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (351, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.140' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.140' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (352, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.140' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.140' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (353, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.143' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.143' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (354, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.143' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.143' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (355, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.143' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.143' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (356, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.147' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.147' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (357, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.147' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.147' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (358, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.150' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.150' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (359, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.150' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.150' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (360, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.153' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.153' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (361, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.157' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.157' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (362, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.160' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.160' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (363, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.167' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.167' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (364, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.167' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.167' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (365, N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.173' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.173' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (366, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.317' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.317' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (367, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.320' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.320' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (368, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.323' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.323' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (369, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.323' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.323' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (370, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.327' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.327' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (371, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.330' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.330' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (372, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.330' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.330' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (373, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.337' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.337' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (374, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.337' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.337' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (375, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.340' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (376, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.340' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (377, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.343' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.343' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (378, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.343' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.343' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (379, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.347' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.347' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (380, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.347' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.347' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (381, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.350' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.350' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (382, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.350' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.350' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (383, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.353' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.353' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (384, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.353' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.353' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (385, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.353' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.353' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (386, N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.357' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.357' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (387, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.740' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.740' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (388, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.747' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.747' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (389, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.747' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.747' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (390, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.753' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.753' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (391, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.753' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.753' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (392, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.760' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.760' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (393, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.760' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.760' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (394, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.763' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.763' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (395, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.763' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.763' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (396, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.767' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.767' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (397, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.770' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.770' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (398, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.780' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.780' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (399, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.783' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (400, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.790' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.790' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (401, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.790' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.790' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (402, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.797' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.797' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (403, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.797' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.797' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (404, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.803' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.803' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (405, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.810' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.810' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (406, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.810' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.810' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (407, N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.817' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.817' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (408, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.763' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.763' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (409, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.767' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.767' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (410, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.770' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.770' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (411, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.773' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.773' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (412, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.773' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.773' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (413, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.777' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (414, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.777' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (415, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.783' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (416, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.783' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (417, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.797' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.797' AS DateTime))
GO
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (418, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.800' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (419, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.800' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (420, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.803' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.803' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (421, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.810' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.810' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (422, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.817' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.817' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (423, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.820' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (424, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.820' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (425, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.827' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.827' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (426, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.827' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.827' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (427, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.833' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.833' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (428, N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.833' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.833' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (429, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.443' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.443' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (430, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.453' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.453' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (431, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.453' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.453' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (432, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.457' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.457' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (433, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.457' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.457' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (434, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.457' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.457' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (435, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.460' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.460' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (436, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.463' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (437, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.463' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (438, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.467' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.467' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (439, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.467' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.467' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (440, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.470' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.470' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (441, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.473' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.473' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (442, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.473' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.473' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (443, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.477' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.477' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (444, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.480' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.480' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (445, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.480' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.480' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (446, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.483' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.483' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (447, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.483' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.483' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (448, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.487' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.487' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (449, N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.487' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:26.487' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (450, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.517' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.517' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (451, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.520' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.520' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (452, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.537' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.537' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (453, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.547' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.547' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (454, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.560' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.560' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (455, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.580' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (456, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.593' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.593' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (457, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.607' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.607' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (458, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.617' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.617' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (459, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.620' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (460, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.620' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (461, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.627' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (462, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.640' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.640' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (463, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.653' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.653' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (464, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.663' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.663' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (465, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.677' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (466, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.687' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.687' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (467, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.700' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.700' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (468, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.713' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.713' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (469, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.723' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.723' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (470, N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.737' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:31.737' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (471, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.700' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.700' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (472, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.700' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.700' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (473, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.713' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.713' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (474, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.723' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.723' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (475, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.737' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.737' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (476, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.750' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.750' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (477, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.763' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.763' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (478, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.773' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.773' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (479, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.787' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.787' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (480, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.800' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (481, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.813' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.813' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (482, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.823' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.823' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (483, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.837' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.837' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (484, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.850' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (485, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.860' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.860' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (486, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.873' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.873' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (487, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.887' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.887' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (488, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.897' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.897' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (489, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.910' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.910' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (490, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.923' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.923' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (491, N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:35.937' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (492, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.900' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.900' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (493, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.900' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.900' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (494, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.903' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.903' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (495, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.903' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.903' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (496, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.907' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.907' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (497, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.907' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.907' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (498, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.907' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.907' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (499, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.910' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.910' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (500, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.913' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.913' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (501, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.913' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.913' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (502, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.917' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.917' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (503, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.917' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.917' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (504, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.920' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.920' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (505, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.923' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.923' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (506, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.927' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.927' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (507, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.930' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.930' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (508, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.933' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.933' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (509, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.933' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.933' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (510, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.937' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (511, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.937' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (512, N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:39.937' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (513, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.950' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.950' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (514, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.953' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.953' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (515, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.953' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.953' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (516, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.957' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.957' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (517, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.957' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.957' AS DateTime))
GO
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (518, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.963' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.963' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (519, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.967' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.967' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (520, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.967' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.967' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (521, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.970' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.970' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (522, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.973' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.973' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (523, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.977' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.977' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (524, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.980' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.980' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (525, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.983' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.983' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (526, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.983' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.983' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (527, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.987' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.987' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (528, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.987' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.987' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (529, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.990' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.990' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (530, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.990' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.990' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (531, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.993' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.993' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (532, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.997' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:43.997' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (533, N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:44.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:44.000' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (534, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.357' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.357' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (535, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.360' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.360' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (536, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.373' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.373' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (537, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.387' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.387' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (538, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.397' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.397' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (539, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.410' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.410' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (540, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.427' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.427' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (541, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.440' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.440' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (542, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.453' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.453' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (543, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.463' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (544, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.477' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.477' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (545, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.490' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.490' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (546, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.503' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.503' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (547, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.517' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.517' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (548, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.527' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.527' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (549, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.540' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.540' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (550, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.553' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.553' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (551, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.567' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (552, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-4', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.580' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (553, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.593' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.593' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (554, N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'</div></div></div></div></div>', N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.607' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-22T11:31:49.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[CMS_LayoutHtml] OFF
INSERT [dbo].[CMS_Media] ([ID], [ParentID], [Title], [MediaType], [Url], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description]) VALUES (N'6056810a7ede46bb94b55b2756323640', N'#', N'图片', 1, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-04-01T21:42:14.960' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-04-01T21:42:14.960' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CMS_Message] ON 

INSERT [dbo].[CMS_Message] ([ID], [Title], [Email], [PostMessage], [Reply], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description]) VALUES (1, N'ZKEASOFT', N'zkea@zkea.net', N'ZKEACMS是基于ASP.NET MVC4开发的开源CMS，提供免费下载学习使用。', N'KEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。', 1, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:02:34.260' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:02:34.260' AS DateTime), NULL)
INSERT [dbo].[CMS_Message] ([ID], [Title], [Email], [PostMessage], [Reply], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description]) VALUES (2, N'ZKEASOFT', N'zkea@zkea.net', N'ZKEACMS使用可视化编辑设计', N'ZKEACMS是一个内容管理软件（网站），不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。', 1, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:03:09.967' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:03:09.967' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CMS_Message] OFF
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'068c85b8de8744e7a81b1d1010583308', N'9d84599edb2443439a53e8d906815c8f', 1, N'#', N'产品', 0, N'~/product', N'0846a33e56bf45d5aae602ef40d87444', N'产品', NULL, 4, NULL, 1, 0, CAST(N'2016-05-15T20:56:40.843' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.843' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'0880a4dfdc184ff99b88c88325716d1b', NULL, 0, N'#', N'主页', 1, N'~/index', N'1dae90cf6a8547538cc0c369b9943c01', N'欢迎使用ZKEACMS进行创作', NULL, 1, NULL, 1, 0, CAST(N'2017-10-15T18:11:36.000' AS DateTime), NULL, NULL, N'[]', N'[]', N'admin', NULL, CAST(N'2015-08-31T13:27:16.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2020-03-21T14:01:56.337' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'1c93b61690ce49d7af8e1ea45ac58eb9', NULL, 0, N'#', N'联系我们', 0, N'~/contact', N'1dae90cf6a8547538cc0c369b9943c01', N' 联系我们', NULL, 7, NULL, 1, 1, CAST(N'2017-03-19T21:05:28.837' AS DateTime), N' 联系我们', N' 联系我们', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:03:50.763' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:16.280' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'4b889b430aa44517bbad38a57c745cc5', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', 1, N'9d84599edb2443439a53e8d906815c8f', N'产品详细', 0, N'~/product/detail', N'0846a33e56bf45d5aae602ef40d87444', NULL, NULL, 1, NULL, 1, 0, CAST(N'2016-03-10T23:24:38.777' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:24:38.780' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:24:38.780' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'50fa3579e7434555a22f095dcb4ea35e', N'0880a4dfdc184ff99b88c88325716d1b', 1, N'#', N'主页', 1, N'~/index', N'1dae90cf6a8547538cc0c369b9943c01', N'欢迎使用ZKEACMS进行创作', NULL, 1, NULL, 1, 0, CAST(N'2017-10-15T18:11:36.273' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.277' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.810' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'534e07f396b14b7584a833d270356cb7', N'1c93b61690ce49d7af8e1ea45ac58eb9', 1, N'#', N'联系我们', 0, N'~/contact', N'1dae90cf6a8547538cc0c369b9943c01', N' 联系我们', NULL, 7, NULL, 1, 0, CAST(N'2017-03-19T21:05:30.803' AS DateTime), N' 联系我们', N' 联系我们', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.833' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:31.050' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'9ce910ba45a24fd2af804d6d0de7bba3', N'be49e3ec3b5a4f5eae3edaf8ba64f185', 1, N'#', N'问卷调查', 0, N'~/questionnaire', N'1dae90cf6a8547538cc0c369b9943c01', N'问卷调查 | ZKEASOFT', NULL, 5, NULL, 1, 0, CAST(N'2017-10-15T18:20:42.203' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:20:42.207' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:20:42.217' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'9d84599edb2443439a53e8d906815c8f', NULL, 0, N'#', N'产品', 0, N'~/product', N'0846a33e56bf45d5aae602ef40d87444', N'产品', NULL, 4, NULL, 1, 1, CAST(N'2016-05-15T20:56:40.763' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:18:10.430' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-05-14T15:01:42.697' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'a3d735320eb04c63bf3258d7b44e30f8', NULL, 0, N'e371628aa3ff46c3a167f121c7a3f32b', N'文章详细', 0, N'~/article/detail', N'0846a33e56bf45d5aae602ef40d87444', NULL, NULL, 1, NULL, 1, 1, CAST(N'2017-12-03T17:11:47.220' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:24:03.240' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:47.223' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', NULL, 0, N'9d84599edb2443439a53e8d906815c8f', N'产品详细', 0, N'~/product/detail', N'0846a33e56bf45d5aae602ef40d87444', NULL, NULL, 1, NULL, 1, 1, CAST(N'2016-03-10T23:24:38.743' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:20:11.263' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:24:38.737' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'be49e3ec3b5a4f5eae3edaf8ba64f185', NULL, 0, N'#', N'问卷调查', 0, N'~/questionnaire', N'1dae90cf6a8547538cc0c369b9943c01', N'问卷调查 | ZKEASOFT', NULL, 5, NULL, 1, 1, CAST(N'2017-10-15T18:20:42.193' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:58:52.057' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:20:42.193' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'c5b97a044c9844529fc48383d141e73c', N'a3d735320eb04c63bf3258d7b44e30f8', 1, N'e371628aa3ff46c3a167f121c7a3f32b', N'文章详细', 0, N'~/article/detail', N'0846a33e56bf45d5aae602ef40d87444', NULL, NULL, 1, NULL, 1, 0, CAST(N'2017-12-03T17:11:47.237' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:47.243' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:47.307' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'e371628aa3ff46c3a167f121c7a3f32b', 1, N'#', N'文章', 0, N'~/article', N'0846a33e56bf45d5aae602ef40d87444', N'文章', NULL, 3, NULL, 1, 0, CAST(N'2017-10-15T18:11:44.947' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:44.947' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:45.367' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'e371628aa3ff46c3a167f121c7a3f32b', NULL, 0, N'#', N'文章', 0, N'~/article', N'0846a33e56bf45d5aae602ef40d87444', N'文章', NULL, 3, NULL, 1, 1, CAST(N'2017-10-15T18:11:44.940' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T12:45:01.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:44.940' AS DateTime))
SET IDENTITY_INSERT [dbo].[CMS_Redirection] ON 

INSERT [dbo].[CMS_Redirection] ([ID], [Title], [InComingUrl], [DestinationURL], [IsPermanent], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [IsPattern]) VALUES (1, N'默认', N'~/', N'~/index', 0, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:58:06.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2020-08-01T22:21:26.837' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[CMS_Redirection] OFF
SET IDENTITY_INSERT [dbo].[CMS_Rule] ON 

INSERT [dbo].[CMS_Rule] ([RuleID], [Title], [ZoneName], [RuleExpression], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [RuleItems]) VALUES (1, N'所有页面', N'顶部', N'StartsWith(ValueOf(''Url''),''/'')', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:43:34.623' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:43:34.623' AS DateTime), N'[{"Condition":"and","FunctionName":"StartsWith","Property":"ValueOf(''Url'')","Value":"/","Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}]')
INSERT [dbo].[CMS_Rule] ([RuleID], [Title], [ZoneName], [RuleExpression], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [RuleItems]) VALUES (2, N'所有页面', N'底部', N'StartsWith(ValueOf(''Url''),''/'')', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:43:52.343' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:43:52.343' AS DateTime), N'[{"Condition":"and","FunctionName":"StartsWith","Property":"ValueOf(''Url'')","Value":"/","Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}]')
SET IDENTITY_INSERT [dbo].[CMS_Rule] OFF
INSERT [dbo].[CMS_Theme] ([ID], [Title], [Url], [UrlDebugger], [Thumbnail], [IsActived], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Default', N'默认', N'~/themes/Default/css/Theme.min.css', N'~/themes/Default/css/Theme.css', N'~/themes/Default/thumbnail.jpg', 1, 1, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-04-04T22:17:10.790' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-04-04T22:21:01.487' AS DateTime))
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'00f62c5acfe840e0bee3ca2979f0f025', N'图片右', NULL, 9, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:13:55.010' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:13:22.937' AS DateTime), NULL, NULL, 1, N'~/images/template%20(6).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'01b59004dd1e4f68afa98c9c80d86f4c', N'表单', NULL, 1, NULL, N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'ZONE-1', N'Widget.Form', N'ZKEACMS.FormGenerator', N'ZKEACMS.FormGenerator.Service.FormWidgetService', N'ZKEACMS.FormGenerator.Models.FormWidget', NULL, N'', N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:59:05.133' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:20:39.980' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"FormID":"5ed56d90ac154e73befa6fbc981ae3ae","CustomClass":"","CustomStyle":"","ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'02dd343bb4f24322bcf3daf8ada7565d', N'留言箱', NULL, 2, NULL, N'534e07f396b14b7584a833d270356cb7', N'ZONE-1', N'Widget.MessageBox', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.MessageBoxWidgetService', N'ZKEACMS.Message.Models.MessageBoxWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:31.030' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:31.030' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png', 0, N'{"ID":"02dd343bb4f24322bcf3daf8ada7565d","WidgetName":"留言箱","Position":2,"LayoutID":null,"PageID":"534e07f396b14b7584a833d270356cb7","ZoneID":"d5f02570e4814439acc86a1874cb8f07","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.MessageBox","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageBoxWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageBoxWidget","FormView":null,"StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendData":null,"ExtendFields":[],"Title":null,"Description":null,"Status":null,"CreateBy":"admin","CreatebyName":"ZKEASOFT","CreateDate":"2017-03-19T21:04:44.953","LastUpdateBy":"admin","LastUpdateByName":"ZKEASOFT","LastUpdateDate":"2017-03-19T21:04:44.953","ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'062018a8e5cf48b4a0d90296e7f4e965', N'分隔符', NULL, 2, NULL, N'9d84599edb2443439a53e8d906815c8f', N'ZONE-1', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-11T10:01:58.757' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-11T10:01:58.757' AS DateTime), NULL, NULL, 0, N'~/images/Widget.HTML.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'09617f6142934daaadee6cfb9df6d66f', N'段落', NULL, 4, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T13:53:07.263' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-24T10:49:44.100' AS DateTime), NULL, NULL, 1, N'~/images/template%20(2).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'文字三列', NULL, 8, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.277' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:12:54.387' AS DateTime), NULL, NULL, 1, N'~/images/template (15).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'1433264e95f545ab97e6a481fa3747ea', N'评论箱', NULL, 2, NULL, N'a3d735320eb04c63bf3258d7b44e30f8', N'ZONE-1', N'Widget.Comments', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.CommentsWidgetService', N'ZKEACMS.Message.Models.CommentsWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:36.467' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:36.467' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"CustomClass":"","CustomStyle":"","ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'155c6511dd9c4cc1b3ccb27d5ad4b8ab', N'表单', NULL, 1, NULL, N'9ce910ba45a24fd2af804d6d0de7bba3', N'ZONE-1', N'Widget.Form', N'ZKEACMS.FormGenerator', N'ZKEACMS.FormGenerator.Service.FormWidgetService', N'ZKEACMS.FormGenerator.Models.FormWidget', NULL, N'', N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:20:42.213' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:20:42.213' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"FormID":"5ed56d90ac154e73befa6fbc981ae3ae","CustomClass":"","CustomStyle":"","ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'19350341920b4827bf2a4e458ad24a58', N'焦点图', NULL, 1, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-1', N'Widget.Carousel', N'ZKEACMS', N'ZKEACMS.Common.Service.CarouselWidgetService', N'ZKEACMS.Common.Models.CarouselWidget', NULL, N'', N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:34.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2020-03-21T14:01:56.237' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Carousel.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'1fb967867e3b440e86336bc5a51e8719', N'图例三（圆）', NULL, 17, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'align-center image-circle', N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.767' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:19:30.777' AS DateTime), NULL, NULL, 1, N'~/images/template%20(12).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'2b3eb61307d24c50a6b3aaa75db3810e', N'图片左', NULL, 11, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:06:17.637' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:14:54.330' AS DateTime), NULL, NULL, 1, N'~/images/template%20(5).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'2b510992f0174e668ca53116434e065c', N'图片', NULL, 1, NULL, N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-1', N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:15:37.333' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:00:21.587' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Image.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'3017aef0eabc451b81daebe6bae68857', N'图片', NULL, 1, NULL, N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-1', N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:44.950' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:44.950' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Image.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'34567e55bacd40dbaf9794d5032dd26e', N'留言板', NULL, 4, NULL, N'534e07f396b14b7584a833d270356cb7', N'ZONE-1', N'Widget.Message', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.MessageWidgetService', N'ZKEACMS.Message.Models.MessageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.977' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.977' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png', 0, N'{"FormView":null,"ExtendData":null,"Description":null,"Status":null,"CreateBy":"admin","CreatebyName":"ZKEASOFT","CreateDate":"2017-03-19T21:04:56.38","LastUpdateBy":"admin","LastUpdateByName":"ZKEASOFT","LastUpdateDate":"2017-03-19T21:04:56.38","ActionType":1,"ID":"34567e55bacd40dbaf9794d5032dd26e","WidgetName":"留言板","Position":4,"LayoutID":null,"PageID":"534e07f396b14b7584a833d270356cb7","ZoneID":"d5f02570e4814439acc86a1874cb8f07","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.Message","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageWidget","StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendFields":[],"Title":null}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'3466e616139645d2b1e1d9935d231922', N'产品类别', N'产品类别', 1, NULL, N'068c85b8de8744e7a81b1d1010583308', N'ZONE-3', N'Widget.ProductCategory', N'ZKEACMS.Product', N'ZKEACMS.Product.Service.ProductCategoryWidgetService', N'ZKEACMS.Product.Models.ProductCategoryWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.877' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.877' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'357a58069e8047a289e10b920061d57d', N'分隔符', NULL, 3, NULL, N'534e07f396b14b7584a833d270356cb7', N'ZONE-1', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.900' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.900' AS DateTime), NULL, NULL, 0, N'~/images/Widget.HTML.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'3aa8b53e7ad143ff818855a7abcb3fdd', N'文章内容', NULL, 1, NULL, N'c5b97a044c9844529fc48383d141e73c', N'ZONE-1', N'Widget.ArticleDetail', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleDetailWidgetService', N'ZKEACMS.Article.Models.ArticleDetailWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:47.290' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:47.290' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'3b8beb945c9f4c9390a6122d8b4788d5', N'分隔符', NULL, 2, NULL, N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-1', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:45.347' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:45.347' AS DateTime), NULL, NULL, 0, N'~/images/Widget.HTML.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'3e3783f4b7ca421488f2bf08d32fe2f0', N'分隔符', NULL, 2, NULL, N'068c85b8de8744e7a81b1d1010583308', N'ZONE-1', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.850' AS DateTime), NULL, NULL, 0, N'~/images/Widget.HTML.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'416c5402962b41548c83fabaa5492b42', N'文章列表', NULL, 1, NULL, N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-2', N'Widget.ArticleList', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:20:31.667' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-11T11:51:20.640' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'41e075ab1b89453388494a539eec55b9', N'焦点图', NULL, 1, NULL, N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-1', N'Widget.Carousel', N'ZKEACMS', N'ZKEACMS.Common.Service.CarouselWidgetService', N'ZKEACMS.Common.Models.CarouselWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.633' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.633' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Carousel.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'43bb869688ee4752a3127dd19ccc6caa', N'图片', NULL, 1, NULL, N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-1', N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:04:20.407' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:04:29.773' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Image.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'481574ebc98b4cdf9a07e3f20c1ab78d', N'图片左（圆）', NULL, 12, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'image-circle', N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.870' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:15:23.317' AS DateTime), NULL, NULL, 1, N'~/images/template%20(7).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'4d67b2d10f4a425586e3b1115f7f7072', N'分隔符', NULL, 3, NULL, N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-1', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:15.683' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:15.683' AS DateTime), NULL, NULL, 0, N'~/images/Widget.HTML.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'50f810582d28440eb3bdff9ee5b1ef24', N'图片左（平分）', NULL, 13, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:36:23.247' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:16:05.733' AS DateTime), NULL, NULL, 1, N'~/images/template (17).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'55b73e54fd054de4847960bdac350c6d', N'图例二（圆）', NULL, 15, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'align-center image-circle', N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.533' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:17:49.737' AS DateTime), NULL, NULL, 1, N'~/images/template%20(10).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'56991d0ff59d4c1db27aff3a50fcb382', N'页头', NULL, 2, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T13:51:35.577' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:10:19.703' AS DateTime), NULL, NULL, 1, N'~/images/template%20(1).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'604b2461f7c545e28dbb21fb15def5c7', N'相关链接', N'相关链接', 1, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-2', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', NULL, CAST(N'2015-09-01T10:13:42.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:18:36.063' AS DateTime), NULL, 0, 0, N'~/images/Widget.Section.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'62ca3b6b6ea644b4a64501021b02f13b', N'分隔符', NULL, 2, NULL, N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-1', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:16:08.137' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:00:21.613' AS DateTime), NULL, NULL, 0, N'~/images/Widget.HTML.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'6bb06e46293c46f084e83751a0832d36', N'产品列表', NULL, 1, NULL, N'068c85b8de8744e7a81b1d1010583308', N'ZONE-2', N'Widget.ProductList', N'ZKEACMS.Product', N'ZKEACMS.Product.Service.ProductListWidgetService', N'ZKEACMS.Product.Models.ProductListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.867' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.867' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'6ee67036e78b4b498d932ab2d76757fb', N'导航', NULL, 1, NULL, NULL, N'ZONE-0', N'Widget.Navigation', N'ZKEACMS', N'ZKEACMS.Common.Service.NavigationWidgetService', N'ZKEACMS.Common.Models.NavigationWidget', NULL, N'full', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:44:21.393' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2020-03-21T13:44:19.637' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, 1)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'7679a5060035444d85fe49dc3c02cada', N'图片', NULL, 1, NULL, N'534e07f396b14b7584a833d270356cb7', N'ZONE-1', N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.853' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Image.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'787d9ad849dd40d0905f22ae072d8507', N'产品内容', NULL, 1, NULL, N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'ZONE-1', N'Widget.ProductDetail', N'ZKEACMS.Product', N'ZKEACMS.Product.Service.ProductDetailWidgetService', N'ZKEACMS.Product.Models.ProductDetailWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:20:19.903' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:20:19.903' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'7e7a1d5b8d644333a7b3341509fc960f', N'注册用户', N'注册用户', 2, NULL, N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-3', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.773' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.773' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'7f77f09c3fcd4d498a4aa3b1c9508d7d', N'注册用户', N'注册用户', 2, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-3', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:03:14.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:04:42.893' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'80f365c7991a49a0b04aa11006018814', N'网站管理', N'后台管理', 1, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-3', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', NULL, CAST(N'2015-09-01T10:09:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:03:50.207' AS DateTime), NULL, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'88ab49212dee47bba878a52bec86f501', N'网站管理', N'后台管理', 1, NULL, N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-3', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.793' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.793' AS DateTime), NULL, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'8c5b69f614b641c0a5f7a8e318de8df3', N'ZKEACMS 简介', NULL, 2, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-1', N'Widget.ArticleSummary', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleSummaryWidgetService', N'ZKEACMS.Article.Models.ArticleSummaryWidget', NULL, NULL, N'admin', NULL, CAST(N'2015-09-01T09:54:38.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2020-03-21T13:47:22.757' AS DateTime), NULL, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'8cc061c2e2514ef9b85bbecdec3f84ab', N'分隔符', NULL, 5, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T13:55:12.377' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T13:55:12.377' AS DateTime), NULL, NULL, 1, N'~/images/template%20(3).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'8df64186d2fd4d63a9f9bb3b6e34cd2a', N'文章类别', N'文章类别', 1, NULL, N'e371628aa3ff46c3a167f121c7a3f32b', N'ZONE-3', N'Widget.ArticleType', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleTypeWidgetService', N'ZKEACMS.Article.Models.ArticleTypeWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:21:20.527' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-05-15T21:04:35.783' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'8ea46d2923ad4d62958c565b19bb172d', N'图片', NULL, 1, NULL, N'068c85b8de8744e7a81b1d1010583308', N'ZONE-1', N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.857' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:40.857' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Image.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'942b4ac54f3e4dfca006172bf4122da4', N'留言板', NULL, 4, NULL, N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-1', N'Widget.Message', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.MessageWidgetService', N'ZKEACMS.Message.Models.MessageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:04:56.380' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:04:56.380' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png', 0, N'{"FormView":null,"ExtendData":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1,"ID":"942b4ac54f3e4dfca006172bf4122da4","WidgetName":"留言板","Position":1,"LayoutID":null,"PageID":"1c93b61690ce49d7af8e1ea45ac58eb9","ZoneID":"3ca302874c164b7b9691ca948300417b","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.Message","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageWidget","StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendFields":null,"Title":null}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'94624262dc00460cbbc1e0f51711e712', N'产品内容', NULL, 1, NULL, N'4b889b430aa44517bbad38a57c745cc5', N'ZONE-1', N'Widget.ProductDetail', N'ZKEACMS.Product', N'ZKEACMS.Product.Service.ProductDetailWidgetService', N'ZKEACMS.Product.Models.ProductDetailWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:24:38.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:24:38.783' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'a64ad266b3bd4e0eb4e2df09b550fe55', N'留言箱', NULL, 2, NULL, N'1c93b61690ce49d7af8e1ea45ac58eb9', N'ZONE-1', N'Widget.MessageBox', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.MessageBoxWidgetService', N'ZKEACMS.Message.Models.MessageBoxWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:04:44.953' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:04:44.953' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png', 0, N'{"ID":"a64ad266b3bd4e0eb4e2df09b550fe55","WidgetName":"留言箱","Position":1,"LayoutID":null,"PageID":"1c93b61690ce49d7af8e1ea45ac58eb9","ZoneID":"4cf5d05f2b954a7e8904713ad6781a61","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.MessageBox","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageBoxWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageBoxWidget","FormView":null,"StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendData":null,"ExtendFields":null,"Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'a686b84212f94b3b8315093b2e8b883d', N'版权申明', NULL, NULL, NULL, NULL, N'ZONE-X', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, N'footer', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:44:55.063' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:44:55.063' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, 2)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'b568ff7f4a894870adaf9afadf787bf9', N'图例二', NULL, 14, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:20:29.887' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:16:58.140' AS DateTime), NULL, NULL, 1, N'~/images/template%20(9).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'bb7dab4f077745ef8b5b425eaabb423c', N'巨幕', NULL, 1, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:28:47.827' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:09:41.597' AS DateTime), NULL, NULL, 1, N'~/images/template (16).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'c71d1f1c48944d6a9e232b6813261e04', N'评论箱', NULL, 2, NULL, N'c5b97a044c9844529fc48383d141e73c', N'ZONE-1', N'Widget.Comments', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.CommentsWidgetService', N'ZKEACMS.Message.Models.CommentsWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:47.253' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:11:47.253' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"CustomClass":"","CustomStyle":"","ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'ca9f8809636d448cbd4f3beb418465b3', N'文章列表', NULL, 1, NULL, N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-2', N'Widget.ArticleList', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:45.317' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:45.317' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'cd21a7bf68b44f6e8d178b153288a26e', N'ZKEACMS 简介', NULL, 3, NULL, N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-1', N'Widget.ArticleSummary', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleSummaryWidgetService', N'ZKEACMS.Article.Models.ArticleSummaryWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.807' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.807' AS DateTime), NULL, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'de8d94fd51cb4e73b00518dbb2f134d3', N'文章类别', N'文章类别', 1, NULL, N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'ZONE-3', N'Widget.ArticleType', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleTypeWidgetService', N'ZKEACMS.Article.Models.ArticleTypeWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:45.367' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:45.367' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'e0783dbbcc564322a1f2e3ca2833dbd4', N'相关链接', N'相关链接', 1, NULL, N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-2', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.733' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.733' AS DateTime), NULL, 0, 0, N'~/images/Widget.Section.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'e5ba6adb117440959757b98e4289430f', N'图片', NULL, 1, NULL, N'9d84599edb2443439a53e8d906815c8f', N'ZONE-1', N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:31:24.887' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:16:41.790' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Image.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'e88916cc41b3465b9ae954bafac5f796', N'产品列表', NULL, 1, NULL, N'9d84599edb2443439a53e8d906815c8f', N'ZONE-2', N'Widget.ProductList', N'ZKEACMS.Product', N'ZKEACMS.Product.Service.ProductListWidgetService', N'ZKEACMS.Product.Models.ProductListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:18:21.907' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:31:03.770' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'e8fd1019bab045e5927ec30abaaa1aba', N'文章内容', NULL, 1, NULL, N'a3d735320eb04c63bf3258d7b44e30f8', N'ZONE-1', N'Widget.ArticleDetail', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleDetailWidgetService', N'ZKEACMS.Article.Models.ArticleDetailWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:24:12.857' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:24:12.857' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'eb7657f5bcbd4e98977a42950936e7ac', N'产品类别', N'产品类别', 1, NULL, N'9d84599edb2443439a53e8d906815c8f', N'ZONE-3', N'Widget.ProductCategory', N'ZKEACMS.Product', N'ZKEACMS.Product.Service.ProductCategoryWidgetService', N'ZKEACMS.Product.Models.ProductCategoryWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:28:35.323' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-05-15T20:56:37.497' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'ed837392097f4e60b812bc57111dd762', N'图例三', NULL, 16, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:18:22.983' AS DateTime), NULL, NULL, 1, N'~/images/template%20(11).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'f41174cfa4d247f4974c47f4d2b000fd', N'文字二列', NULL, 7, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:21:37.693' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:11:06.067' AS DateTime), NULL, NULL, 1, N'~/images/template (14).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'f6de0d62d3974ee2bf2ded3fbbc82c2b', N'间距', NULL, 6, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:00:46.400' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:08:21.673' AS DateTime), NULL, NULL, 1, N'~/images/template%20(4).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'f6f11ba2fec844de883acf0a1fe3eb89', N'图片右（圆）', NULL, 10, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'image-circle', N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.227' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:13:44.223' AS DateTime), NULL, NULL, 1, N'~/images/template%20(8).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'fee7f4d7d7e641b0bfa74491a543d245', N'图片', NULL, 3, NULL, NULL, NULL, N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:14:46.133' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:14:46.133' AS DateTime), NULL, NULL, 1, N'~/images/template (13).png', 1, NULL, NULL)
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'0338e740ea064e5a88d6223fd476506f', N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.650' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.650' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'0387a1373f59466a91feb96bb69aadca', N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.987' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.987' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'07384e5dc4f34a199d4ca73b3317b1f2', N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.190' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.190' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'095b8b8b28144248a2b0eff648e7fc48', N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.930' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.930' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'0c44eb9149b34ffaaa44d6976d11e1d8', N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.307' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.307' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'0e5c5a55882b4a34a77f3de1f0f36a4c', N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'内容左', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.117' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.117' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'1319756527364a5da511499b37a1eed5', N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.973' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.973' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'14a23e1671924f758113054ed008adec', N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.727' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.727' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'17ef6a804c524ed298492e404ad5576b', N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.303' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.303' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'18f2e25482b444ba8861238637861ba5', N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.747' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.747' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'19d3d679eaf74a21bf4f123487eaee0d', N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.193' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.193' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'1c232c2d572f415082e74771e37e3580', N'0846a33e56bf45d5aae602ef40d87444', NULL, N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:08:20.893' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:10.637' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'1cd27416b7db429bb639d8950cc29793', N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.197' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.197' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'23ec6afdd2ea49dd8fb5839ae2bec741', N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.983' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.983' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'25ce97efa1484065995e6e5aaade9a83', N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'内容右', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.160' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.160' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'2921f81e4531493694790faed3ed76e9', N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.310' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.310' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'294c86a5d87a46d49f41999c495344ea', N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.730' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.730' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'2fd26e7c5a844bea8a2422d074d73109', N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.330' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.330' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'302009d870f74aa1b5b55dc6f1c6385f', N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.810' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.810' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'34f9c91a64ee4986bec02073ea77035d', N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.927' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.927' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'360d6da3007e41d68c521c3154173c7a', N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.783' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'39af0cedd23a42d08c2c93e7b0dbaee0', N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.357' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.357' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'3b3f74427bf84da999406f98f7d8cdd7', N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.690' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.690' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'3ca302874c164b7b9691ca948300417b', N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'内容右', NULL, N'admin', NULL, CAST(N'2015-08-31T11:58:54.257' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:39.823' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'3f166bd62afb4a888801ec561cbc15ef', N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.987' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.987' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'40a562598d3a44a98646519094631628', N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'顶部', NULL, N'admin', NULL, CAST(N'2015-08-31T11:58:54.253' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:39.840' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'4cf5d05f2b954a7e8904713ad6781a61', N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'内容左', NULL, N'admin', NULL, CAST(N'2015-08-31T11:58:54.257' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:39.847' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'572963d3322b4cddb7d94d6bec2f08c7', N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.343' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.343' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'57c4f0c9fb31439c913d0221c20a6343', N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.113' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.113' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'58f65b43d383423a9456102ea06450c1', N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.740' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.740' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'5d3fdb35e2c54313850c69c401548b4d', N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.753' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.753' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'5d84136b25ea4bd4a65779e0bb7acc3d', N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'内容左', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.680' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'6920822269c34d5781b7df72fa37df16', N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.917' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.917' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'6bba8443507f4273b2b61048f7c71f40', N'0846a33e56bf45d5aae602ef40d87444', NULL, N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:08:20.887' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:10.903' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'7480ffc27b034c51aca983367316bb7c', N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.353' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.353' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'7577ca3b1628498c8f38b42545f3c1b3', N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.120' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'75be97a54a4b430ca6d26b8285bbce8d', N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.347' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.347' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'787c9336ef3341d4b63e710f16281424', N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.350' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.350' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'7c1d057dff154fa0836ebe82b5f08b6b', N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.787' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.787' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'7fe7ceb43d734faca8a21e78185995d6', N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'底部', NULL, N'admin', NULL, CAST(N'2015-08-31T11:58:54.260' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:39.873' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'82e28c8ca83c4a52847b2f759b4d1ab0', N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.757' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.757' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'85b6e66b7b3345e9a482af084da307d3', N'0846a33e56bf45d5aae602ef40d87444', NULL, N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:08:20.890' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:10.963' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'8b3a4cd737594c00a7e34c17c1bbc9fc', N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.760' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.760' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'8d4f87b76dfa4c96ae71734ef5ad08fd', N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'内容右', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.657' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.657' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'93ed2f72cef64bf891e0a1ef999c0ebc', N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.800' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9774034c2832414e9ccaa39b43685710', N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'内容左', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.670' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.670' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9b5eab51ed78479f9a3b6cd88f30865c', N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.340' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9c39ce55ae2b46fbaab97287436b651f', N'0846a33e56bf45d5aae602ef40d87444', N'a3d735320eb04c63bf3258d7b44e30f8', N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:43.340' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9c87f7474bcf450a942838b42335a928', N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.993' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.993' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9ccbb73c31ba46caa173b1ff5208cd4e', N'1dae90cf6a8547538cc0c369b9943c01', N'0880a4dfdc184ff99b88c88325716d1b', N'内容左', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.193' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:49.193' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'a30b21857de2411982aa4f40e0fcba59', N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.993' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.993' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'a4bd66363b6a4f2ea1d21ed601c69866', N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.797' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.797' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'a979c68e8f49405fa3c5cc21fafdb7b9', N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.117' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.117' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'aae6dbf58fff429d9a32627933854a8f', N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.693' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.693' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'af49758840b345a6ab910d11a691fc99', N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.667' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.667' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'b0a92bfb56704f8aaf7dade22c3db2d2', N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'内容左', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.977' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.977' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'be7a1e6a999b4264aab2b5ac593909a8', N'0846a33e56bf45d5aae602ef40d87444', NULL, N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:08:20.527' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:10.967' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'bed6101f906b4e50b3ba034bfe39d184', N'1dae90cf6a8547538cc0c369b9943c01', N'50fa3579e7434555a22f095dcb4ea35e', N'内容右', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.833' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:42:39.833' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'c1f4cb36e7924ff99ff38aeb3983eca3', N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.343' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.343' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'c22c6484c2864c82932ec6ad0a20492a', N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.923' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.923' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'c291af01f0b443c3ad59b5b289d97e1f', N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'内容左', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.307' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.307' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'c7bcd0a9d172432bafbf9f5a986685f2', N'0846a33e56bf45d5aae602ef40d87444', NULL, N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T21:08:20.893' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:10.967' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'ca49f8b95d724a3bb1cc01a10ca72cb9', N'1dae90cf6a8547538cc0c369b9943c01', N'534e07f396b14b7584a833d270356cb7', N'内容右', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.297' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:19.297' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'd5a2daad909b4ecfb02988584d8903ad', N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.777' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'd5f02570e4814439acc86a1874cb8f07', N'1dae90cf6a8547538cc0c369b9943c01', NULL, N'主内容', NULL, N'admin', NULL, CAST(N'2015-08-31T11:58:54.257' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-19T17:48:39.887' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'd79708e9937541c9833467ed6f31ebda', N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.980' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.980' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'db297e847b15465cb4ee5d46cd7ca168', N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.673' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.673' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'de442cdec7044de895680750884b1eb4', N'0846a33e56bf45d5aae602ef40d87444', N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.773' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:45.773' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'df2ff4bd579d4e6cb8855b196ba2c322', N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.810' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.810' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'e333b823cf0e4d40a7999bc2787370b2', N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.723' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.723' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'e74560705e8c414bbb284cc95dc54d8a', N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.733' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.733' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'ea3ca53e83924909bfab5e9242583a93', N'0846a33e56bf45d5aae602ef40d87444', N'e371628aa3ff46c3a167f121c7a3f32b', N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.927' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:21.927' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'ea5cdd077bf44e16b8fc4a22433d63ca', N'0846a33e56bf45d5aae602ef40d87444', N'068c85b8de8744e7a81b1d1010583308', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.997' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:12.997' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'eaaf42be824141679c05866ad9a8acf2', N'0846a33e56bf45d5aae602ef40d87444', N'd070f202bb2f45ddbd35f0a7cfee1dfa', N'焦点', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.350' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:09.350' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'ee21c0c23a834cfaae370413da4630cc', N'0846a33e56bf45d5aae602ef40d87444', N'9d84599edb2443439a53e8d906815c8f', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.780' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:44.780' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'eeb31d7a5ee7485ea014708e14f66cac', N'1dae90cf6a8547538cc0c369b9943c01', N'1c93b61690ce49d7af8e1ea45ac58eb9', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.673' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:47.673' AS DateTime), NULL, NULL, N'ZONE-4')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'f41ee7803dc6431bafb45ff035fca916', N'1dae90cf6a8547538cc0c369b9943c01', N'be49e3ec3b5a4f5eae3edaf8ba64f185', N'内容右', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.637' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:45:46.637' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'f4f64f6755be449c8ccb6c5969749b19', N'0846a33e56bf45d5aae602ef40d87444', N'c5b97a044c9844529fc48383d141e73c', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.733' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:28.733' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'f844832366834170a8c8caeb8c64b96b', N'1dae90cf6a8547538cc0c369b9943c01', N'9ce910ba45a24fd2af804d6d0de7bba3', N'内容右', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.107' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:15.107' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'fb0f4ea5b0ed44289f665eec3b829ea2', N'0846a33e56bf45d5aae602ef40d87444', N'4b889b430aa44517bbad38a57c745cc5', N'其它', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.750' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:34.750' AS DateTime), NULL, NULL, N'ZONE-3')
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'Australian Dollar', NULL, N'AUD', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'Brazilian Real', NULL, N'BRL', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'Canadian Dollar', NULL, N'CAD', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'Chinese Renmenbi', NULL, N'CNY', N'￥', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, N'Czech Koruna', NULL, N'CZK', N'Kč', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, N'Danish Krone', NULL, N'DKK', N'kr', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, N'Euro', NULL, N'EUR', N'€', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (8, N'Hong Kong Dollar', NULL, N'HKD', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (9, N'Hungarian Forint', NULL, N'HUF', N'HUF', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (10, N'Indian Rupee', NULL, N'INR', N'INR', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (11, N'Israeli New Shekel', NULL, N'ILS', N'₪', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (12, N'Japanese Yen', NULL, N'JPY', N'￥', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (13, N'Malaysian Ringgit', NULL, N'MYR', N'MYR', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (14, N'Mexican Peso', NULL, N'MXN', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (15, N'New Taiwan Dollar', NULL, N'TWD', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (16, N'New Zealand Dollar', NULL, N'NZD', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (17, N'Norwegian Krone', NULL, N'NOK', N'NOK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (18, N'Philippine Peso', NULL, N'PHP', N'PHP', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (19, N'Polish Zloty', NULL, N'PLN', N'zł', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (20, N'Pound Sterling', NULL, N'GBP', N'£', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (21, N'Russian Ruble', NULL, N'RUB', N'RUB', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (22, N'Singapore Dollar', NULL, N'SGD', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (23, N'Swedish Krona', NULL, N'SEK', N'SEK', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (24, N'Swiss Franc', NULL, N'CHF', N'CHF', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (25, N'Thai Baht', NULL, N'THB', N'฿', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([ID], [Title], [Description], [Code], [Symbol], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (26, N'United States Dollar', NULL, N'USD', N'$', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Currency] OFF
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Alipay.AopSdk.AspnetCore.AlipayOptions', N'{"AppId":null,"Uid":null,"Gatewayurl":null,"PrivateKey":null,"AlipayPublicKey":null,"SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}', NULL, NULL, NULL, NULL, NULL, CAST(N'2019-04-24T19:55:03.627' AS DateTime), NULL, NULL, CAST(N'2019-04-24T19:55:03.627' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.Currency.CurrencyOption', N'{"CurrencyID":4,"Name":"Chinese Renmenbi","Code":"CNY","Symbol":"￥"}', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2021-03-06T22:16:39.503' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2021-03-06T22:16:43.467' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.GlobalScripts.Models.LiveChatScript', N'{"Location":0,"Script":null}', NULL, NULL, NULL, NULL, NULL, CAST(N'2019-04-07T16:38:35.293' AS DateTime), NULL, NULL, CAST(N'2019-04-07T16:38:35.293' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.GlobalScripts.Models.StatisticsScript', N'{"Location":0,"Script":null}', NULL, NULL, NULL, NULL, NULL, CAST(N'2019-04-07T16:38:36.007' AS DateTime), NULL, NULL, CAST(N'2019-04-07T16:38:36.007' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.Message.Models.MessageNotificationConfig', N'{"MessageNotifyEmails":null,"CommentNotifyEmails":null}', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:25:53.917' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:25:53.917' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.Shop.AliPayConfigOptions', N'{"AppId":"2016082000296332","Uid":"2088102172250345","Gatewayurl":"https://openapi.alipaydev.com/gateway.do","PrivateKey":"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP","AlipayPublicKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB","SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-11T17:02:14.577' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-11T17:02:14.577' AS DateTime))
SET IDENTITY_INSERT [dbo].[DataDictionary] ON 

INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'RecordStatus', N'Active', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'RecordStatus', N'Inactive', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'ArticleCategory', N'News', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'ArticleCategory', N'Company News', N'2', 2, 3, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, N'ArticleCategory', N'Industry News', N'3', 3, 3, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, N'UserEntity@Sex', N'Male', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, N'UserEntity@Sex', N'Female', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (8, N'UserEntity@MaritalStatus', N'Unmarried', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (9, N'UserEntity@MaritalStatus', N'Married', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (11, N'UserEntity@UserTypeCD', N'Administrator', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (12, N'ArticleTopWidget@PartialView', N'Default', N'Widget.ArticleTops', 1, 0, 1, NULL, N'~/images/article/005.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (13, N'ArticleListWidget@PartialView', N'Default', N'Widget.ArticleList', 1, 0, 1, NULL, N'~/images/article/000.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (14, N'ArticleListWidget@PartialView', N'Banner', N'Widget.ArticleList-Snippet', 2, 0, 1, NULL, N'~/images/article/001.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (15, N'ProductListWidget@PartialView', N'Default', N'Widget.ProductList', 1, 0, 1, NULL, N'~/images/product/003.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (16, N'ProductListWidget@Columns', N'3 Columns', N'col-xs-12 col-sm-6 col-md-4', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (17, N'ProductListWidget@Columns', N'4 Columns', N'col-xs-12 col-sm-6 col-md-4 col-lg-3', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (18, N'CarouselWidget@PartialView', N'Default', N'Widget.Carousel', 1, 0, 1, NULL, N'~/images/carousel/000.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (19, N'ArticleSummaryWidget@Style', N'Default', N'bs-callout-default', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (20, N'ArticleSummaryWidget@Style', N'Danger', N'bs-callout-danger', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (21, N'ArticleSummaryWidget@Style', N'Warning', N'bs-callout-warning', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (22, N'ArticleSummaryWidget@Style', N'Information', N'bs-callout-info', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (23, N'ArticleSummaryWidget@Style', N'Success', N'bs-callout-success', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (24, N'ArticleSummaryWidget@PartialView', N'Default', N'Widget.ArticleSummary', 1, 0, 1, NULL, N'~/images/article/012.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (25, N'ProductCategoryWidget@PartialView', N'Default', N'Widget.ProductCategory', 1, 0, 1, NULL, N'~/images/product/000.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (26, N'ArticleTypeWidget@PartialView', N'Default', N'Widget.ArticleType', 1, 0, 1, NULL, N'~/images/article/009.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (27, N'UserEntity@UserTypeCD', N'Customer', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (28, N'Order@OrderStatus', N'Unpaid', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (29, N'Order@OrderStatus', N'Cancel', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (30, N'Order@OrderStatus', N'Paid', N'3', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (31, N'Order@OrderStatus', N'Shipped', N'4', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (32, N'Order@OrderStatus', N'Traid Finished', N'5', 5, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (33, N'Order@OrderStatus', N'Refunded', N'6', 6, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (34, N'Order@OrderStatus', N'Refunding', N'7', 7, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (35, N'ProductListWidget@PartialView', N'List', N'Widget.ProductList.A', 2, 0, 1, NULL, N'~/images/product/004.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (36, N'RuleItem@Condition', N'And', N'and', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (37, N'RuleItem@Condition', N'Or', N'or', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (38, N'RuleItem@FunctionName', N'Equals', N'Equals', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (39, N'RuleItem@FunctionName', N'Not Equals', N'NotEquals', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (40, N'RuleItem@FunctionName', N'Greater Than', N'GreaterThan', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (41, N'RuleItem@FunctionName', N'Greater Than Or Equals', N'GreaterThanOrEquals', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (42, N'RuleItem@FunctionName', N'Less Than', N'LessThan', 5, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (43, N'RuleItem@FunctionName', N'Less Than Or Equals', N'LessThanOrEquals', 6, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (44, N'RuleItem@FunctionName', N'Starts With', N'StartsWith', 7, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (45, N'RuleItem@FunctionName', N'Ends With', N'EndsWith', 8, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (46, N'RuleItem@FunctionName', N'Not Starts With', N'NotStartsWith', 9, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (47, N'RuleItem@FunctionName', N'Not Ends With', N'NotEndsWith', 10, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (48, N'RuleItem@FunctionName', N'Contains', N'Contains', 11, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (49, N'RuleItem@FunctionName', N'Not Contains', N'NotContains', 12, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (50, N'RuleItem@FunctionName', N'In', N'In', 13, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (51, N'RuleItem@FunctionName', N'Not In', N'NotIn', 14, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (52, N'RuleItem@Property', N'Url', N'ValueOf(''Url'')', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (53, N'RuleItem@Property', N'Query String', N'ValueOf(''QueryString'')', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (54, N'RuleItem@Property', N'User-Agent', N'ValueOf(''UserAgent'')', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (55, N'RuleItem@Property', N'Today', N'ValueOf(''Now'')', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (56, N'NavigationWidget@PartialView', N'Default', N'Widget.Navigation', 1, 0, 1, NULL, N'~/images/navigation/000.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (57, N'NavigationWidget@PartialView', N'Style A', N'Widget.Navigation.A', 2, 0, 1, NULL, N'~/images/navigation/001.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (58, N'NavigationWidget@PartialView', N'Style B', N'Widget.Navigation.B', 3, 0, 1, NULL, N'~/images/navigation/002.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (59, N'NavigationWidget@PartialView', N'Style C', N'Widget.Navigation.C', 4, 0, 1, NULL, N'~/images/navigation/003.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (60, N'NavigationWidget@PartialView', N'Style D', N'Widget.Navigation.D', 5, 0, 1, NULL, N'~/images/navigation/004.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (61, N'NavigationWidget@PartialView', N'Style E', N'Widget.Navigation.E', 6, 0, 1, NULL, N'~/images/navigation/005.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (62, N'NavigationWidget@PartialView', N'Style F', N'Widget.Navigation.F', 7, 0, 1, NULL, N'~/images/navigation/006.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (63, N'NavigationWidget@PartialView', N'Style G', N'Widget.Navigation.G', 8, 0, 1, NULL, N'~/images/navigation/007.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (64, N'ArticleListWidget@PartialView', N'Style A', N'Widget.ArticleList.A', 3, 0, 1, NULL, N'~/images/article/002.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (65, N'ArticleListWidget@PartialView', N'Style B', N'Widget.ArticleList.B', 4, 0, 1, NULL, N'~/images/article/003.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (66, N'ArticleListWidget@PartialView', N'Style C', N'Widget.ArticleList.C', 5, 0, 1, NULL, N'~/images/article/004.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (67, N'ArticleTopWidget@PartialView', N'Style A', N'Widget.ArticleTops.A', 2, 0, 1, NULL, N'~/images/article/006.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (68, N'ArticleTopWidget@PartialView', N'Style B', N'Widget.ArticleTops.B', 3, 0, 1, NULL, N'~/images/article/007.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (69, N'ArticleTopWidget@PartialView', N'Style C', N'Widget.ArticleTops.C', 4, 0, 1, NULL, N'~/images/article/008.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (70, N'ArticleTypeWidget@PartialView', N'Style A', N'Widget.ArticleType.A', 2, 0, 1, NULL, N'~/images/article/010.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (71, N'ArticleTypeWidget@PartialView', N'Style B', N'Widget.ArticleType.B', 3, 0, 1, NULL, N'~/images/article/011.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (72, N'ArticleSummaryWidget@PartialView', N'Style A', N'Widget.ArticleSummary.A', 2, 0, 1, NULL, N'~/images/article/013.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (73, N'ArticleSummaryWidget@PartialView', N'Style B', N'Widget.ArticleSummary.B', 3, 0, 1, NULL, N'~/images/article/014.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (74, N'ArticleSummaryWidget@PartialView', N'Style C', N'Widget.ArticleSummary.C', 4, 0, 1, NULL, N'~/images/article/015.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (75, N'ProductCategoryWidget@PartialView', N'Style A', N'Widget.ProductCategory.A', 2, 0, 1, NULL, N'~/images/product/001.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (76, N'ProductCategoryWidget@PartialView', N'Style B', N'Widget.ProductCategory.B', 3, 0, 1, NULL, N'~/images/product/002.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (77, N'CarouselWidget@PartialView', N'Style A', N'Widget.Carousel.A', 2, 0, 1, NULL, N'~/images/carousel/001.png', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (78, N'StaticPageSetting@CacheProvider', N'Memory Cache', N'MemoryCache', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (79, N'StaticPageSetting@CacheProvider', N'Database Cache', N'Database', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (80, N'StaticPageSetting@CacheProvider', N'File Cache', N'File', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (81, N'CultureSetting@CultureMode', N'Single domain', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (82, N'CultureSetting@CultureMode', N'Standalone domain', N'2', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DataDictionary] OFF
SET IDENTITY_INSERT [dbo].[DBVersion] ON 

INSERT [dbo].[DBVersion] ([ID], [Major], [Minor], [Revision], [Build]) VALUES (1, 3, 7, 0, 0)
SET IDENTITY_INSERT [dbo].[DBVersion] OFF
SET IDENTITY_INSERT [dbo].[EA_ActionBody] ON 

INSERT [dbo].[EA_ActionBody] ([ID], [Body], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'<div>
    <h3>
       收到新留言
    </h3>
    <table border="1" cellspacing="0" cellpadding="5" bgcolor="" style="border-color: #eee;">
        <tbody>
            <tr>
                <td>姓名</td>
                <td>{{this.Model.Title}}</td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td>{{this.Model.Email}}</td>
            </tr>
            <tr>
                <td>留言内容</td>
                <td>{{this.Model.PostMessage}}</td>
            </tr>
        </tbody>
    </table>
</div>', N'收到留言板留言模板', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-05T18:49:06.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:04:16.673' AS DateTime))
INSERT [dbo].[EA_ActionBody] ([ID], [Body], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'<div>
    <h3>
        重置密码
    </h3>
    <p>
        点击下方链接，或者复制链接到浏览器打开
    </p>
    <a href="{{this.Model.Link}}" target="_blank">{{this.Model.Link}}</a>
</div>', N'重置密码邮件模板', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T21:32:20.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:03:47.810' AS DateTime))
INSERT [dbo].[EA_ActionBody] ([ID], [Body], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'<div>
    <h3>
        收到新评论
    </h3>
    <table border="1" cellspacing="0" cellpadding="5" bgcolor="" style="border-color: #eee;">
        <tbody>
            <tr>
                <td>页面标题</td>
                <td>{{this.Model.Title}}</td>
            </tr>
            <tr>
                <td>用户名</td>
                <td>{{this.Model.UserName}}</td>
            </tr>
            <tr>
                <td>评论内容</td>
                <td>{{this.Model.CommentContent}}</td>
            </tr>
            <tr>
                <td>页面地址</td>
                <td>{{this.Model.PagePath}}</a></td>
            </tr>
        </tbody>
    </table>
</div>', N'收到新评论邮件模板', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T21:44:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:03:57.627' AS DateTime))
INSERT [dbo].[EA_ActionBody] ([ID], [Body], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'<div>
    <h3>
        {{this.Model.Form.Title}}
    </h3>
    <table border="1" cellspacing="0" cellpadding="5" bgcolor="" style="border-color: #eee; ">
        <thead>
            <tr>
                <th>字段</th>
                <th>内容</th>
            </tr>
        </thead>
        <tbody>
            {% for field in this.Model.Form.FormFields %}
                <tr>
                    <td>
                        {{field.DisplayName}}
                    </td>
                    <td>
                        {{field.DisplayValue}}
                    </td>
                </tr>
            {% endfor %}
        </tbody>
    </table>
</div>', N'自定义表单邮件模板', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T22:06:21.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:03:40.577' AS DateTime))
SET IDENTITY_INSERT [dbo].[EA_ActionBody] OFF
SET IDENTITY_INSERT [dbo].[EA_EventAction] ON 

INSERT [dbo].[EA_EventAction] ([ID], [Event], [Actions], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'ZKEACMS.Message.Events.OnMessageSubmitted', N'actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 收到新留言
    to: webmaster@zkea.net
    bodyContentId: 1', N'发送新留言邮件通知', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-03T21:53:14.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-12T21:12:14.787' AS DateTime))
INSERT [dbo].[EA_EventAction] ([ID], [Event], [Actions], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'ZKEACMS.Events.OnResetPassword', N'actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 重置密码
    to: {{this.Model.Email}}
    bodyContentId: 2', N'发送重置密码发送邮件通知', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T21:33:51.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T21:59:47.367' AS DateTime))
INSERT [dbo].[EA_EventAction] ([ID], [Event], [Actions], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'ZKEACMS.Message.Events.OnCommentsSubmitted', N'actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 有新评论
    to: webmaster@zkea.net
    bodyContentId: 3', N'发送新评论邮件通知', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T21:44:02.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:05:12.060' AS DateTime))
INSERT [dbo].[EA_EventAction] ([ID], [Event], [Actions], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'ZKEACMS.FormGenerator.Events.OnFormDataSubmitted', N'actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 收到新的表单提交
    to: {{this.Model.Form.NotificationReceiver}}
    bodyContentId: 4', N'发送自定义表单邮件通知', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T22:07:27.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:06:44.227' AS DateTime))
SET IDENTITY_INSERT [dbo].[EA_EventAction] OFF
INSERT [dbo].[Forms] ([ID], [Title], [FieldsData], [NotificationReceiver], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'5ed56d90ac154e73befa6fbc981ae3ae', N'问卷调查', N'[{"ID":"f05da60a6e3b448fadbf7c5c040a7d5c","Name":"Label","DisplayName":"一个简单的问卷调查","Value":null,"Description":"欢迎您使用ZKEACMS，这是一个自定义表单","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"41481e6eefa048feae380460b0cd5661","Name":"SingleLine","DisplayName":"姓名","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"bfd1418684a64890a7099f764baa24b3","Name":"Number","DisplayName":"电话","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"7e635c8fdd124b6b94f037d3bf112bc0","Name":"Email","DisplayName":"邮箱地址","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"4d61bb5f733c47778975cc6cfbc84123","Name":"SingleLine","DisplayName":"QQ","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"b85aeb9beaf64f509726f16ba582ec3c","Name":"SingleLine","DisplayName":"微信","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"a2aea72c496e4a458265f7ceadb3653a","Name":"Address","DisplayName":"省份地址","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"0932ca1f1f7f4af098d51e4b1ac18b94","Name":"SingleLine","DisplayName":"详细地址","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"572c61930769464d97f3d31771ecf65e","Name":"Radio","DisplayName":"您从哪里了解到ZKEACMS","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"搜索引擎","Value":"70a915caf7a84e9086d5dbdf26ed3053"},{"DisplayText":"博客园","Value":"419a7d1d91974282af5c26688fbe0e8c"},{"DisplayText":"朋友介绍","Value":"227f6d2f6b39479aaf2d5b79dbefdc5c"},{"DisplayText":"其它论坛","Value":"ef50fb3bccf74d6487320e53781fb1ec"}],"AdditionalSettings":null},{"ID":"845830a5c8be4b81866a8cef83049899","Name":"Checkbox","DisplayName":"您一般使用ZKEACMS做什么","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"网站","Value":"5f0fbb9faa0343e0958a896fe3cead4f"},{"DisplayText":"博客","Value":"65902e51d35142019c4aab8badff9e35"},{"DisplayText":"其它","Value":"944343b3ed904b94a9db6950dbdcccf3"}],"AdditionalSettings":null},{"ID":"2fe6e4baf01e4cb897986991c920df56","Name":"Dropdown","DisplayName":"您觉得ZKEACMS怎么样","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"很不错","Value":"fc3929826e364318b7a3436d991fb097"},{"DisplayText":"还可以","Value":"619e09c2864b41ae81f4f90e7cab92ba"},{"DisplayText":"有待提高","Value":"fd1279a07150490f9a1f69c85298e22c"},{"DisplayText":"不怎么样","Value":"ef19983754504a9482232dd6be01f34d"}],"AdditionalSettings":null},{"ID":"2868de2d8e9b4d269da891342e6dc95b","Name":"Paragraph","DisplayName":"您的意见或建议","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null}]', NULL, NULL, N'', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:07:58.013' AS DateTime))
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'062018a8e5cf48b4a0d90296e7f4e965', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'09617f6142934daaadee6cfb9df6d66f', N'<p>这是文本段落，你可以在段里面加入标题，文字，图片，表格，列表，链接等等。例如：</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'357a58069e8047a289e10b920061d57d', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'3b8beb945c9f4c9390a6122d8b4788d5', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'3e3783f4b7ca421488f2bf08d32fe2f0', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'4d67b2d10f4a425586e3b1115f7f7072', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'50f810582d28440eb3bdff9ee5b1ef24', N'<div>
<div class="row">
<div class="col-sm-6"><img src="/Images/28.jpg" alt="" /></div>
<div class="col-sm-6">
<h3>为什么选择我们？</h3>
<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>
<p>&nbsp;</p>
<p><a class="btn btn-info" href="#">Read More</a></p>
</div>
</div>
</div>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'56991d0ff59d4c1db27aff3a50fcb382', N'<div class="page-header">
<h1>ZKEASOFT</h1>
</div>
<p>ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'62ca3b6b6ea644b4a64501021b02f13b', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'8cc061c2e2514ef9b85bbecdec3f84ab', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'a686b84212f94b3b8315093b2e8b883d', N'<div id="footer">ZKEACMS是开源软件，提供免费下载学习使用
<p>Copyright @&nbsp;2015 ZKEASOFT. All Rights Reserved | <a href="http://www.zkea.net/" target="_blank" rel="noopener">www.zkea.net</a></p>
</div>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'bb7dab4f077745ef8b5b425eaabb423c', N'<h1 style="text-align: center; font-size: 3em;">ZKEASOFT</h1>
<p>&nbsp;</p>
<p style="text-align: center;">ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>
<p style="text-align: center;"><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p style="text-align: center;">ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p style="text-align: center;">ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p style="text-align: center;">ZKEACMS采用插件式设计，支持扩展新插件。</p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;"><a class="btn btn-info" href="#">Read More</a></p>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'f6de0d62d3974ee2bf2ded3fbbc82c2b', N'<div class="space">&nbsp;</div>')
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link], [ImageUrlMd], [ImageUrlSm]) VALUES (N'2b510992f0174e668ca53116434e065c', N'~/images/bg4.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link], [ImageUrlMd], [ImageUrlSm]) VALUES (N'3017aef0eabc451b81daebe6bae68857', N'~/images/bg4.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link], [ImageUrlMd], [ImageUrlSm]) VALUES (N'43bb869688ee4752a3127dd19ccc6caa', N'http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link], [ImageUrlMd], [ImageUrlSm]) VALUES (N'7679a5060035444d85fe49dc3c02cada', N'http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link], [ImageUrlMd], [ImageUrlSm]) VALUES (N'8ea46d2923ad4d62958c565b19bb172d', N'~/images/bg3.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link], [ImageUrlMd], [ImageUrlSm]) VALUES (N'e5ba6adb117440959757b98e4289430f', N'~/images/bg3.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link], [ImageUrlMd], [ImageUrlSm]) VALUES (N'fee7f4d7d7e641b0bfa74491a543d245', N'~/images/30.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'1061019b1bcd4bf3aeb3df647c74c309', N'#', N'~/product', N'产品', 1, NULL, NULL, 1, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:33:03.653' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.830' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'6beb1a2a54b947179ec20dd331e375a2', N'#', N'~/index', N'首页', 0, NULL, NULL, 1, 1, N'admin', NULL, CAST(N'2015-09-01T09:55:20.483' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.820' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'7b5bb24dea6d47618ed027190b4e5d94', N'#', N'~/contact', N'联系我们', 0, NULL, NULL, 1, 5, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:06:21.360' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.833' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'd122a50356bf46c8a8c8349612145e24', N'#', N'~/questionnaire', N'问卷调查', 0, NULL, NULL, 1, 4, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:25.947' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.837' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'e4658e8af8434a05b773b666c6c67cd5', N'#', N'~/article', N'新闻', 1, NULL, NULL, 1, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:32:53.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.827' AS DateTime))
INSERT [dbo].[NavigationWidget] ([ID], [CustomerClass], [Title], [Logo], [AlignClass], [IsTopFix], [RootID], [ShowBasket]) VALUES (N'6ee67036e78b4b498d932ab2d76757fb', N'container', NULL, N'~/images/logo_zkea.png', N'navbar-left', NULL, N'#', 0)
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ApplicationSetting_Manage', 1, N'管理系统设置', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ApplicationSetting_View', 1, N'查看系统设置', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_Manage', 1, N'管理文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:18:40.493' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_Publish', 1, N'发布文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-05-25T12:36:10.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_View', 1, N'查看文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:17:59.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ArticleType_Manage', 1, N'管理文章类别', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:22:24.887' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ArticleType_View', 1, N'查看文章类别', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:19:54.500' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Carousel_Manage', 1, N'管理焦点图', NULL, N'焦点图', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:45:46.190' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Carousel_View', 1, N'查看焦点图', NULL, N'焦点图', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.097' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Comments_Manage', 1, N'管理回复', NULL, N'留言评论', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:09:48.053' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Comments_View', 1, N'查看回复', NULL, N'留言评论', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:09:48.050' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Config_Currency', 1, N'Currency', NULL, N'Setting', NULL, N'admin', N'ZKEASOFT', CAST(N'2021-03-06T22:16:30.727' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'EventNotification_Manage', 1, N'Manage Event Notification', NULL, N'EventAction', NULL, N'admin', N'ZKEASOFT', CAST(N'2023-03-14T21:04:42.767' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'EventNotification_View', 1, N'View Event Notification', NULL, N'EventAction', NULL, N'admin', N'ZKEASOFT', CAST(N'2023-03-14T21:04:42.760' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'EventViewer_Manage', 1, N'查看错误日志', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-07-11T15:43:52.147' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Form_Manage', 1, N'管理表单', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Form_View', 1, N'查看表单', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.830' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_Export', 1, N'导出表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_Manage', 1, N'管理表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_View', 1, N'查看表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Language_Manage', 1, N'翻译', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T11:47:13.093' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Layout_Manage', 1, N'管理布局', NULL, N'布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:43:52.697' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Layout_View', 1, N'查看布局', NULL, N'布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:37:56.690' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'LiveChatScript_Manage', 1, N'设置在线客服代码', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-04-07T16:39:16.730' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Media_Manage', 1, N'管理媒体库', NULL, N'媒体库', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.553' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Media_View', 1, N'查看媒体库', NULL, N'媒体库', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.090' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Message_Manage', 1, N'管理留言', NULL, N'留言板', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:01:14.980' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Message_View', 1, N'查看留言', NULL, N'留言板', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:01:14.960' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.283' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Navigation_Manage', 1, N'管理导航', NULL, N'导航', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:40:38.230' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Navigation_View', 1, N'查看导航', NULL, N'导航', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:38:21.943' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'NotificationContent_Manage', 1, N'Manage Notification Content', NULL, N'EventAction', NULL, N'admin', N'ZKEASOFT', CAST(N'2023-03-14T21:04:42.770' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'NotificationContent_View', 1, N'View Notification Content', NULL, N'EventAction', NULL, N'admin', N'ZKEASOFT', CAST(N'2023-03-14T21:04:42.770' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_Manage', 1, N'Manage Order', NULL, N'Shop', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_Refund', 1, N'Refund', NULL, N'Shop', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_View', 1, N'View Order', NULL, N'Shop', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_ViewOrderPayment', 1, N'View Transactions', NULL, N'Shop', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_ViewOrderRefund', 1, N'View Refund', NULL, N'Shop', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Page_Manage', 1, N'管理页面', NULL, N'页面', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:41:08.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Page_View', 1, N'查看页面', NULL, N'页面', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:37:56.683' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Payment_Config_Manage', 1, N'Payment Setting', NULL, N'Shop', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'PendingTask_Manage', 1, N'Manage Pending Task', NULL, N'EventAction', NULL, N'admin', N'ZKEASOFT', CAST(N'2023-03-14T21:04:42.770' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'PendingTask_View', 1, N'View Pending Task', NULL, N'EventAction', NULL, N'admin', N'ZKEASOFT', CAST(N'2023-03-14T21:04:42.770' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Plugin_View', 1, N'插件', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-04-07T16:39:16.727' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_Manage', 1, N'Manage Product', NULL, N'Product', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_Publish', 1, N'Publish Product', NULL, N'Product', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_View', 1, N'View Product', NULL, N'Product', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.657' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategory_Manage', 1, N'Manage Product Category', NULL, N'Product', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategory_View', 1, N'View Product Category', NULL, N'Product', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategoryTag_Manage', 1, N'Manage Product Tag', NULL, N'Product', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategoryTag_View', 1, N'View Product Tag', NULL, N'Product', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-17T21:48:04.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'RobotsSetting', 1, N'Robots.txt', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-08-12T22:51:30.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Role_Manage', 1, N'管理角色', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Role_View', 1, N'查看角色', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.660' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SMTPSetting', 1, N'邮箱设置', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-06-12T19:13:49.497' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'StatisticsScript_Manage', 1, N'设置访客统计代码', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-04-07T16:39:16.730' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Template_Manage', 1, N'管理模板', NULL, N'页面布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.307' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Template_View', 1, N'管理模板', NULL, N'页面布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.303' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'TemplateImporter_Import', 1, N'Import Html Template', NULL, N'Setting', NULL, N'admin', N'ZKEASOFT', CAST(N'2020-03-14T11:41:54.510' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Theme_Manage', 1, N'管理主题', NULL, N'主题', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:42:48.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Theme_View', 1, N'查看主题', NULL, N'主题', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.083' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'UrlRedirect_Manage', 1, N'管理URL 重定向', NULL, N'URL 重定向', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:55:58.170' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'UrlRedirect_View', 1, N'查看URL 重定向', NULL, N'URL 重定向', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:55:58.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'User_Manage', 1, N'管理用户', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'User_View', 1, N'查看用户', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.287' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ImageUrl], [ImageThumbUrl], [BrandCD], [ProductCategoryID], [Color], [Price], [RebatePrice], [PurchasePrice], [Norm], [ShelfLife], [ProductContent], [Description], [IsPublish], [PublishDate], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [OrderIndex], [SourceFrom], [Url], [TargetFrom], [TargetUrl], [PartNumber], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'Cloud Revolver 游戏耳机', N'/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png', N'/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png', NULL, 2, NULL, 500.0000, 399.0000, NULL, NULL, NULL, N'<h1>HyperX Cloud Revolver</h1>
<p>如果您热爱游戏，那么一款可为您带来极大优势的耳机就是必不可少的装备。HyperX Cloud Revolver&trade; 是一款优质耳机，工艺精湛，可充分满足高级OC或家用机游戏玩家的需求。新一代驱动器可将低音、中音和高音明确区分开来，形成精准定位的优质音效。Revolver 系列具备立体声和即插即用的 Dolby&reg; 7.1 环绕立体声模式，可提供工作室级别的音场和新一代驱动器，在 FPS 和开放式环境下表现优异。两款耳机均采用结实耐用的实心钢质框架和标志性的 HyperX 记忆海绵，带来屡获殊荣的舒适度。如果您希望拥有无与伦比的舒适度、绝佳的音质和清晰顺畅的沟通，Cloud Revolver 耳机将是您的不二之选。</p>
<h3>即插即用 Dolby&reg; 环绕立体声 7.1&nbsp;</h3>
<p>模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效，无需安装软件或任何设置，即可将音频娱乐变成电影般的体验。<br />可在 Cloud Revolver S 上使用。</p>
<h3>先进的 USB 音频控制盒与 DSP 声卡&nbsp;</h3>
<p>USB 数字处理信号声卡可在任何机器上输出一致的优质音频。卡夹式音频控制盒设计有背光按钮，因此可以即时静音、启用 Dolby 音频，还可在三种预先设置的均衡器之间切换并调整麦克风和音量水平。<br />可在 Cloud Revolver S 上使用。</p>
<h3>新一代 50 毫米驱动器&nbsp;</h3>
<p>与双耳平行的 50mm 定向驱动器精准定位，超强低音效果让声音更加清脆动听。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>
<h3>HyperX 标志性记忆海绵&nbsp;</h3>
<p>屡获殊荣的 HyperX 记忆海绵，带来无与伦比的舒适度，让您更加舒适，更加尽兴地游戏。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>', N'模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效', 1, CAST(N'2017-11-17T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, N'Cloud-Revolver', NULL, NULL, N'HX-HSCR-BK/AS', N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T21:52:05.397' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [ImageUrl], [ImageThumbUrl], [BrandCD], [ProductCategoryID], [Color], [Price], [RebatePrice], [PurchasePrice], [Norm], [ShelfLife], [ProductContent], [Description], [IsPublish], [PublishDate], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [OrderIndex], [SourceFrom], [Url], [TargetFrom], [TargetUrl], [PartNumber], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'Alloy FPS 机械游戏键盘', N'/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png', N'/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png', NULL, 3, N'黑色', 500.0000, 499.0000, NULL, NULL, NULL, N'<h1>小巧便携，随时随地开始 FPS 游戏。</h1>
<p>HyperX&trade; Alloy FPS 键盘结实耐用，性能可靠，给玩家带来卓越的游戏体验。如果您需要一个全尺寸键盘，Alloy FPS 会满足您的所有需求。如果您喜欢 Tenkeyless (TKL) 模式，以便使用大多数基本按键，则 Alloy FPS Pro 键盘可充分满足您的需要。1每个键盘都能满足每位严肃的 FPS 游戏玩家对键盘的所有要求：可靠的 CHERRY&reg; MX 按键开关、实心钢架、可拆卸的线缆、游戏模式、100% 防按键冲突和全键无冲突功能无论您是专业的 FPS 玩家，又或者只是随便玩玩，HyperX Alloy FPS 键盘都可充分满足您的需求。</p>
<h3>极简设计小巧紧凑，是 FPS 游戏的完美搭档&nbsp;</h3>
<p>最大程度节省桌面空间，方便鼠标快速移动</p>
<h3>实心钢架&nbsp;</h3>
<p>可实现耐用性和稳定性。</p>
<h3>CHERRY&reg; MX 机械按键开关可靠耐用&nbsp;</h3>
<p>适用于 CHERRY MX Blue、Brown 或 Red 按键开关，带给您有口皆碑的可靠性和适合您的开关风格。</p>
<h3>超便携设计，带有可拆卸的线缆&nbsp;</h3>
<p>节省存储空间并减少可能的线缆损坏。</p>
<h3>HyperX 红色背光按键，实现动态的灯光效果</h3>
<p>让璀璨的背光彰显您的风格</p>', N'实心钢架,CHERRY® MX 机械按键开关,带有可拆卸的线缆', 1, CAST(N'2017-11-17T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, N'Alloy-FPS', NULL, NULL, N'HX-KB4RD1-US/R1', N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T21:52:25.420' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'产品', NULL, 0, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:49:32.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:10:08.193' AS DateTime))
INSERT [dbo].[ProductCategory] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'耳机', NULL, 1, N'headset', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:49:50.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:30:59.233' AS DateTime))
INSERT [dbo].[ProductCategory] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'键盘', NULL, 1, N'keyboard', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:50:07.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:31:08.063' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[ProductCategoryTag] ON 

INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, 2, N'颜色', NULL, NULL, 0, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:10:45.550' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, 2, N'黑色', NULL, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:10:50.530' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, 2, N'黑古银色', NULL, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:11:03.657' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, 3, N'操作风格', NULL, NULL, 0, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:12:07.707' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, 3, N'点击', NULL, NULL, 4, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:12:14.870' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, 3, N'触觉', NULL, NULL, 4, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:12:20.713' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, 3, N'线性', NULL, NULL, 4, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:12:28.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductCategoryTag] OFF
INSERT [dbo].[ProductCategoryWidget] ([ID], [ProductCategoryID], [TargetPage]) VALUES (N'3466e616139645d2b1e1d9935d231922', 1, NULL)
INSERT [dbo].[ProductCategoryWidget] ([ID], [ProductCategoryID], [TargetPage]) VALUES (N'eb7657f5bcbd4e98977a42950936e7ac', 1, NULL)
INSERT [dbo].[ProductDetailWidget] ([ID], [CustomerClass]) VALUES (N'787d9ad849dd40d0905f22ae072d8507', NULL)
INSERT [dbo].[ProductDetailWidget] ([ID], [CustomerClass]) VALUES (N'94624262dc00460cbbc1e0f51711e712', NULL)
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, 1, N'/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png', N'HX-HSCR-BK/AS', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T19:58:48.747' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, 1, N'/images/6006218/56657706-58757e00-66cb-11e9-80b8-fdc32783ff68.png', N'HX-HSCRS-GM/AS', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T19:58:48.750' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, 2, N'/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, 2, N'/images/6006218/56657774-78a53d00-66cb-11e9-9ab9-c4b65f3cba22.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, 2, N'/images/6006218/56657795-85299580-66cb-11e9-9a3f-a1c5bde7b191.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, 2, N'/images/6006218/56657844-9a9ebf80-66cb-11e9-91ed-02001fab09c8.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
INSERT [dbo].[ProductListWidget] ([ID], [IsPageable], [ProductCategoryID], [DetailPageUrl], [Columns], [PageSize]) VALUES (N'6bb06e46293c46f084e83751a0832d36', 1, 1, N'~/product/detail', N'col-xs-6 col-sm-4 col-md-4', 9)
INSERT [dbo].[ProductListWidget] ([ID], [IsPageable], [ProductCategoryID], [DetailPageUrl], [Columns], [PageSize]) VALUES (N'e88916cc41b3465b9ae954bafac5f796', 1, 1, N'~/product/detail', N'col-xs-6 col-sm-4 col-md-4', 9)
SET IDENTITY_INSERT [dbo].[ProductTag] ON 

INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (28, 1, 3, NULL)
INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (29, 1, 2, NULL)
INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (30, 2, 7, NULL)
INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (31, 2, 6, NULL)
INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (32, 2, 5, NULL)
SET IDENTITY_INSERT [dbo].[ProductTag] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'超级管理员', N'超级管理员', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2023-03-18T16:45:26.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'083536d64b2f4840aa548e7117eb5c8d', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'0015be62210742c083c3a9dad4b72fb5', 1, 7, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.767' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.767' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'08f659a819194f7ca0a41b668a2dee13', N'88ab49212dee47bba878a52bec86f501', N'50082fd30e01404fbb4fe6101353b1d5', 1, 2, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.800' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'1', N'80f365c7991a49a0b04aa11006018814', N'1', 1, 2, N'admin', NULL, CAST(N'2015-09-01T10:09:51.457' AS DateTime), N'admin', NULL, CAST(N'2015-09-01T10:12:05.037' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'105', N'f41174cfa4d247f4974c47f4d2b000fd', N'40', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:05.273' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:05.273' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'106', N'f41174cfa4d247f4974c47f4d2b000fd', N'40', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:14.723' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:14.723' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'107', N'f41174cfa4d247f4974c47f4d2b000fd', N'41', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:39.543' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:39.543' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'108', N'f41174cfa4d247f4974c47f4d2b000fd', N'41', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:46.500' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:46.500' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'109', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'42', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.287' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.287' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'110', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'42', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.290' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.290' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'111', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'43', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.293' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.293' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'112', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'43', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.293' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.293' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'113', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'44', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:24:36.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:24:36.340' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'114', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'44', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:24:43.533' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:24:43.533' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'11fb7122ccd24686876238c6138aead2', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'0015be62210742c083c3a9dad4b72fb5', 1, 5, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.760' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.760' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'13', N'2b3eb61307d24c50a6b3aaa75db3810e', N'5', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:06.270' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:06.270' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'14', N'2b3eb61307d24c50a6b3aaa75db3810e', N'5', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:14.397' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:14.397' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'15', N'2b3eb61307d24c50a6b3aaa75db3810e', N'5', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:22.330' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:22.330' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'16', N'00f62c5acfe840e0bee3ca2979f0f025', N'6', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:25.737' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:25.737' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'163', N'604b2461f7c545e28dbb21fb15def5c7', N'2', 1, 4, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:58:41.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:58:41.647' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'164', N'604b2461f7c545e28dbb21fb15def5c7', N'2', 1, 7, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:59:12.037' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:59:12.037' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'165', N'80f365c7991a49a0b04aa11006018814', N'1', 3, 3, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:02:22.540' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'17', N'00f62c5acfe840e0bee3ca2979f0f025', N'6', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:33.683' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:33.683' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'18', N'00f62c5acfe840e0bee3ca2979f0f025', N'6', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:50.897' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:50.897' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'19', N'f6f11ba2fec844de883acf0a1fe3eb89', N'7', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.233' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.233' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'1c8ddf59f53f453188ce9c115f648a85', N'7f77f09c3fcd4d498a4aa3b1c9508d7d', N'80cb176412cf457a81ae7a1f9fa33ef6', 1, 1, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:03:36.227' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:03:36.227' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'20', N'f6f11ba2fec844de883acf0a1fe3eb89', N'7', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.237' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.237' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'21', N'f6f11ba2fec844de883acf0a1fe3eb89', N'7', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.240' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.240' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'22', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'8', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.877' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.877' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'2261e8417e5541d5bbde6c743cdcfb7c', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'0015be62210742c083c3a9dad4b72fb5', 1, 4, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.757' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.757' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'23', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'8', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.877' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.877' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'24', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'8', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.880' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.880' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'25', N'b568ff7f4a894870adaf9afadf787bf9', N'9', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:21:44.433' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:21:44.433' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'26', N'b568ff7f4a894870adaf9afadf787bf9', N'9', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:21:53.837' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:21:53.837' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'27', N'b568ff7f4a894870adaf9afadf787bf9', N'10', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:22:35.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:22:35.620' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'28', N'b568ff7f4a894870adaf9afadf787bf9', N'10', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:24:34.193' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:24:34.193' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'29', N'55b73e54fd054de4847960bdac350c6d', N'11', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.580' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'2fde1f872b9d423d87866cb4e1d4e9fb', N'604b2461f7c545e28dbb21fb15def5c7', N'2', 1, 6, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:18:30.710' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:18:30.710' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'3', N'604b2461f7c545e28dbb21fb15def5c7', N'2', 1, 2, N'admin', NULL, CAST(N'2015-09-01T10:15:07.310' AS DateTime), N'admin', NULL, CAST(N'2015-09-01T10:15:07.310' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'30', N'55b73e54fd054de4847960bdac350c6d', N'11', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.580' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'31', N'55b73e54fd054de4847960bdac350c6d', N'12', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.587' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'32', N'55b73e54fd054de4847960bdac350c6d', N'12', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.587' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'33', N'55b73e54fd054de4847960bdac350c6d', N'11', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:34:38.457' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:34:38.457' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'34', N'55b73e54fd054de4847960bdac350c6d', N'12', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:34:51.847' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:34:51.847' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'35', N'ed837392097f4e60b812bc57111dd762', N'13', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.470' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.470' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'36', N'ed837392097f4e60b812bc57111dd762', N'13', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.470' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.470' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'37', N'ed837392097f4e60b812bc57111dd762', N'14', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.490' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.490' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'38', N'ed837392097f4e60b812bc57111dd762', N'14', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.493' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.493' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'39', N'ed837392097f4e60b812bc57111dd762', N'15', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:38:16.067' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:38:16.067' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'4', N'604b2461f7c545e28dbb21fb15def5c7', N'2', 1, 5, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:18:02.197' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'40', N'ed837392097f4e60b812bc57111dd762', N'15', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:38:27.630' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:38:27.630' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'41', N'1fb967867e3b440e86336bc5a51e8719', N'16', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.777' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'42', N'1fb967867e3b440e86336bc5a51e8719', N'16', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.780' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.780' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'43', N'1fb967867e3b440e86336bc5a51e8719', N'17', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.783' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'44', N'1fb967867e3b440e86336bc5a51e8719', N'17', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.783' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'45', N'1fb967867e3b440e86336bc5a51e8719', N'18', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.787' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.787' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'45add364d0574b3687908dea124e429f', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'0015be62210742c083c3a9dad4b72fb5', 1, 3, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.757' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.757' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'46', N'1fb967867e3b440e86336bc5a51e8719', N'18', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.787' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.787' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'47', N'1fb967867e3b440e86336bc5a51e8719', N'16', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:41:13.710' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:41:13.710' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'48', N'1fb967867e3b440e86336bc5a51e8719', N'17', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:42:01.137' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:42:01.137' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'49', N'1fb967867e3b440e86336bc5a51e8719', N'18', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:42:20.190' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:42:20.190' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'5', N'604b2461f7c545e28dbb21fb15def5c7', N'2', 1, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:17:12.377' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'513f11827367468a9fc870ac534cbc6a', N'88ab49212dee47bba878a52bec86f501', N'50082fd30e01404fbb4fe6101353b1d5', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.803' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.803' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'6', N'604b2461f7c545e28dbb21fb15def5c7', N'2', 1, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-01T10:45:25.393' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-01T10:45:25.393' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'6c34eb97f4d142cf92485f496aa7749b', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'0015be62210742c083c3a9dad4b72fb5', 1, 2, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.753' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.753' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'81f7765ff0e649c1b7912c482be6195c', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'0015be62210742c083c3a9dad4b72fb5', 1, 1, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.747' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.747' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'8308cd484f8d450da9bfadc11398b302', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'0015be62210742c083c3a9dad4b72fb5', 1, 6, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.763' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.763' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'cfa29c5af91141598e9ade186f1ba4ba', N'7e7a1d5b8d644333a7b3341509fc960f', N'9ce2c15af93c4fd782e17a1e7e35963f', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.783' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'e748a75135904442860c52822af33c7d', N'7f77f09c3fcd4d498a4aa3b1c9508d7d', N'80cb176412cf457a81ae7a1f9fa33ef6', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:04:41.027' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:04:41.027' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'e8b4787cc6f240a8bfcae2ac26e06d79', N'7e7a1d5b8d644333a7b3341509fc960f', N'9ce2c15af93c4fd782e17a1e7e35963f', 1, 1, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.783' AS DateTime))
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'083536d64b2f4840aa548e7117eb5c8d', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'许可协议', N'http://www.zkea.net/licenses')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'08f659a819194f7ca0a41b668a2dee13', N'88ab49212dee47bba878a52bec86f501', N'登录后台', N'/admin')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'1', N'80f365c7991a49a0b04aa11006018814', N'登录后台', N'/admin')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'11fb7122ccd24686876238c6138aead2', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'ZKEACMS(.Net4)', N'http://www.zkea.net/zkeacms')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'163', N'604b2461f7c545e28dbb21fb15def5c7', N'商业授权', N'http://www.zkea.net/zkeacms/price')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'164', N'604b2461f7c545e28dbb21fb15def5c7', N'许可协议', N'http://www.zkea.net/licenses')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'1c8ddf59f53f453188ce9c115f648a85', N'7f77f09c3fcd4d498a4aa3b1c9508d7d', N'个人中心', N'/Account')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'2261e8417e5541d5bbde6c743cdcfb7c', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'商业授权', N'http://www.zkea.net/zkeacms/price')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'2fde1f872b9d423d87866cb4e1d4e9fb', N'604b2461f7c545e28dbb21fb15def5c7', N'开发文档', N'http://www.zkea.net/zkeacms/document')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'3', N'604b2461f7c545e28dbb21fb15def5c7', N'GitHub', N'https://github.com/SeriaWei/ZKEACMS.Core')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'4', N'604b2461f7c545e28dbb21fb15def5c7', N'ZKEACMS(.Net4)', N'http://www.zkea.net/zkeacms')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'45add364d0574b3687908dea124e429f', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'开源中国', N'http://git.oschina.net/seriawei/ZKEACMS.Core')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'5', N'604b2461f7c545e28dbb21fb15def5c7', N'官方网站', N'http://www.zkea.net')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'6', N'604b2461f7c545e28dbb21fb15def5c7', N'开源中国', N'http://git.oschina.net/seriawei/ZKEACMS.Core')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'6c34eb97f4d142cf92485f496aa7749b', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'GitHub', N'https://github.com/SeriaWei/ZKEACMS.Core')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'81f7765ff0e649c1b7912c482be6195c', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'官方网站', N'http://www.zkea.net')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'8308cd484f8d450da9bfadc11398b302', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'开发文档', N'http://www.zkea.net/zkeacms/document')
INSERT [dbo].[SectionContentCallToAction] ([ID], [SectionWidgetId], [InnerText], [Href]) VALUES (N'e8b4787cc6f240a8bfcae2ac26e06d79', N'7e7a1d5b8d644333a7b3341509fc960f', N'个人中心', N'/Account')
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'13', N'2b3eb61307d24c50a6b3aaa75db3810e', N'~/images/01.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'16', N'00f62c5acfe840e0bee3ca2979f0f025', N'~/images/02.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'19', N'f6f11ba2fec844de883acf0a1fe3eb89', N'~/images/04.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'22', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'~/images/03.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'25', N'b568ff7f4a894870adaf9afadf787bf9', N'~/images/05.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'27', N'b568ff7f4a894870adaf9afadf787bf9', N'~/images/06.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'29', N'55b73e54fd054de4847960bdac350c6d', N'~/images/07.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'31', N'55b73e54fd054de4847960bdac350c6d', N'~/images/08.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'35', N'ed837392097f4e60b812bc57111dd762', N'~/images/09.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'37', N'ed837392097f4e60b812bc57111dd762', N'~/images/10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'39', N'ed837392097f4e60b812bc57111dd762', N'~/images/11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'41', N'1fb967867e3b440e86336bc5a51e8719', N'~/images/12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'43', N'1fb967867e3b440e86336bc5a51e8719', N'~/images/13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'45', N'1fb967867e3b440e86336bc5a51e8719', N'~/images/14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'106', N'f41174cfa4d247f4974c47f4d2b000fd', N'<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'108', N'f41174cfa4d247f4974c47f4d2b000fd', N'<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'110', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'112', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'114', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'15', N'2b3eb61307d24c50a6b3aaa75db3810e', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'165', N'80f365c7991a49a0b04aa11006018814', N'<p>用户名,密码:admin</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'18', N'00f62c5acfe840e0bee3ca2979f0f025', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'21', N'f6f11ba2fec844de883acf0a1fe3eb89', N'<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'24', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'26', N'b568ff7f4a894870adaf9afadf787bf9', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'28', N'b568ff7f4a894870adaf9afadf787bf9', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'30', N'55b73e54fd054de4847960bdac350c6d', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'32', N'55b73e54fd054de4847960bdac350c6d', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'36', N'ed837392097f4e60b812bc57111dd762', N'<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'38', N'ed837392097f4e60b812bc57111dd762', N'<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'40', N'ed837392097f4e60b812bc57111dd762', N'<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'42', N'1fb967867e3b440e86336bc5a51e8719', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'44', N'1fb967867e3b440e86336bc5a51e8719', N'<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'46', N'1fb967867e3b440e86336bc5a51e8719', N'<p><span>我国汽车工业的现状喜忧参半，</span><span>展望我国汽车工业的未来风险与机遇并存。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'513f11827367468a9fc870ac534cbc6a', N'88ab49212dee47bba878a52bec86f501', N'<p>用户名,密码:admin</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'cfa29c5af91141598e9ade186f1ba4ba', N'7e7a1d5b8d644333a7b3341509fc960f', N'<p>前端用户注册，用户管理</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'e748a75135904442860c52822af33c7d', N'7f77f09c3fcd4d498a4aa3b1c9508d7d', N'<p>前端用户注册，用户管理</p>')
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'105', N'f41174cfa4d247f4974c47f4d2b000fd', N'ZKEACMS', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'107', N'f41174cfa4d247f4974c47f4d2b000fd', N'ZKEACMS', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'109', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'111', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'113', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'14', N'2b3eb61307d24c50a6b3aaa75db3810e', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'17', N'00f62c5acfe840e0bee3ca2979f0f025', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'20', N'f6f11ba2fec844de883acf0a1fe3eb89', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'23', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'33', N'55b73e54fd054de4847960bdac350c6d', N'建筑业', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'34', N'55b73e54fd054de4847960bdac350c6d', N'能源化工', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'47', N'1fb967867e3b440e86336bc5a51e8719', N'建筑业', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'48', N'1fb967867e3b440e86336bc5a51e8719', N'能源化工', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'49', N'1fb967867e3b440e86336bc5a51e8719', N'汽车业', NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'0015be62210742c083c3a9dad4b72fb5', N'组1', N'e0783dbbcc564322a1f2e3ca2833dbd4', N'SectionTemplate.Default', 0, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.740' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.740' AS DateTime), NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'1', N'组1', N'80f365c7991a49a0b04aa11006018814', N'SectionTemplate.Default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'10', N'右', N'b568ff7f4a894870adaf9afadf787bf9', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'11', N'左', N'55b73e54fd054de4847960bdac350c6d', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'12', N'右', N'55b73e54fd054de4847960bdac350c6d', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'13', N'左', N'ed837392097f4e60b812bc57111dd762', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'14', N'中', N'ed837392097f4e60b812bc57111dd762', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'15', N'右', N'ed837392097f4e60b812bc57111dd762', N'SectionTemplate.Default', 3, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'16', N'左', N'1fb967867e3b440e86336bc5a51e8719', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'17', N'中', N'1fb967867e3b440e86336bc5a51e8719', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'18', N'右', N'1fb967867e3b440e86336bc5a51e8719', N'SectionTemplate.Default', 3, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'2', N'组1', N'604b2461f7c545e28dbb21fb15def5c7', N'SectionTemplate.Default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'40', N'左', N'f41174cfa4d247f4974c47f4d2b000fd', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'41', N'右', N'f41174cfa4d247f4974c47f4d2b000fd', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'42', N'左', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'43', N'右', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'SectionTemplate.Default', 3, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'44', N'中', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'5', N'G1', N'2b3eb61307d24c50a6b3aaa75db3810e', N'SectionTemplate.ListView', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'50082fd30e01404fbb4fe6101353b1d5', N'组1', N'88ab49212dee47bba878a52bec86f501', N'SectionTemplate.Default', 0, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.800' AS DateTime), NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'6', N'G1', N'00f62c5acfe840e0bee3ca2979f0f025', N'SectionTemplate.ImageRight', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'7', N'G1', N'f6f11ba2fec844de883acf0a1fe3eb89', N'SectionTemplate.ImageRight', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'8', N'G1', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'SectionTemplate.ListView', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'80cb176412cf457a81ae7a1f9fa33ef6', N'组1', N'7f77f09c3fcd4d498a4aa3b1c9508d7d', N'SectionTemplate.Default', 1, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:03:17.247' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:03:17.247' AS DateTime), N'')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'9', N'左', N'b568ff7f4a894870adaf9afadf787bf9', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'9ce2c15af93c4fd782e17a1e7e35963f', N'组1', N'7e7a1d5b8d644333a7b3341509fc960f', N'SectionTemplate.Default', 1, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.780' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.780' AS DateTime), N'')
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Banner', N'横幅广告', N'Thumbnail\SectionTemplate.Banner.png', N'Thumbnail\SectionTemplate.Banner.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Brand', N'品牌', N'Thumbnail\SectionTemplate.Brand.png', N'Thumbnail\SectionTemplate.Brand.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.CalendarEvent', N'日历事件', N'Thumbnail\SectionTemplate.CalendarEvent.png', N'Thumbnail\SectionTemplate.CalendarEvent.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Column', N'左右', N'Thumbnail\SectionTemplate.Column.png', N'Thumbnail\SectionTemplate.Column.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Default', N'默认', N'Thumbnail\SectionTemplate.Default.png', N'Thumbnail\SectionTemplate.Default.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.GreyBox', N'背景灰', N'Thumbnail\SectionTemplate.GreyBox.png', N'Thumbnail\SectionTemplate.GreyBox.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ImageBox', N'图片框', N'Thumbnail\SectionTemplate.ImageBox.png', N'Thumbnail\SectionTemplate.ImageBox.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ImageGreyBox', N'图片框', N'Thumbnail\SectionTemplate.ImageGreyBox.png', N'Thumbnail\SectionTemplate.ImageGreyBox.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ImageRight', N'图片右', N'Thumbnail\SectionTemplate.ImageRight.png', N'Thumbnail\SectionTemplate.ImageRight.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.JCarousel', N'滚动图', N'Thumbnail\SectionTemplate.JCarousel.png', N'Thumbnail\SectionTemplate.JCarousel.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.LeftThreeIcon', N'左三图标', N'Thumbnail\SectionTemplate.LeftThreeIcon.png', N'Thumbnail\SectionTemplate.LeftThreeIcon.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.LifeStyle', N'生活格调', N'Thumbnail\SectionTemplate.LifeStyle.png', N'Thumbnail\SectionTemplate.LifeStyle.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.LinkGroup', N'链接组', N'Thumbnail\SectionTemplate.LinkGroup.png', N'Thumbnail\SectionTemplate.LinkGroup.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ListGroup', N'列表组', N'Thumbnail\SectionTemplate.ListGroup.png', N'Thumbnail\SectionTemplate.ListGroup.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ListView', N'媒体列表', N'Thumbnail\SectionTemplate.ListView.png', N'Thumbnail\SectionTemplate.ListView.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Portfolio', N'品牌案例', N'Thumbnail\SectionTemplate.Portfolio.png', N'Thumbnail\SectionTemplate.Portfolio.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ProductHero', N'产品页头', N'Thumbnail\SectionTemplate.ProductHero.png', N'Thumbnail\SectionTemplate.ProductHero.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Quote', N'引用', N'Thumbnail\SectionTemplate.Quote.png', N'Thumbnail\SectionTemplate.Quote.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.RightThreeIcon', N'右三图标', N'Thumbnail\SectionTemplate.RightThreeIcon.png', N'Thumbnail\SectionTemplate.RightThreeIcon.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.SalePrice', N'销售报价', N'Thumbnail\SectionTemplate.SalePrice.png', N'Thumbnail\SectionTemplate.SalePrice.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ShortcutNav', N'快捷导航', N'Thumbnail\SectionTemplate.ShortcutNav.png', N'Thumbnail\SectionTemplate.ShortcutNav.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Tab', N'标签页', N'Thumbnail\SectionTemplate.Tab.png', N'Thumbnail\SectionTemplate.Tab.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Thumbnail', N'缩略图', N'Thumbnail\SectionTemplate.Thumbnail.png', N'Thumbnail\SectionTemplate.Thumbnail.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'00f62c5acfe840e0bee3ca2979f0f025', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'1fb967867e3b440e86336bc5a51e8719', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'2b3eb61307d24c50a6b3aaa75db3810e', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'481574ebc98b4cdf9a07e3f20c1ab78d', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'55b73e54fd054de4847960bdac350c6d', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'604b2461f7c545e28dbb21fb15def5c7', N'相关链接', NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'7e7a1d5b8d644333a7b3341509fc960f', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'7f77f09c3fcd4d498a4aa3b1c9508d7d', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'80f365c7991a49a0b04aa11006018814', N'管理', NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'88ab49212dee47bba878a52bec86f501', N'管理', NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'b568ff7f4a894870adaf9afadf787bf9', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'e0783dbbcc564322a1f2e3ca2833dbd4', N'相关链接', NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'ed837392097f4e60b812bc57111dd762', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'f41174cfa4d247f4974c47f4d2b000fd', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'f6f11ba2fec844de883acf0a1fe3eb89', NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserRoleRelation] ON 

INSERT [dbo].[UserRoleRelation] ([ID], [RoleID], [UserID]) VALUES (5, 1, N'admin')
SET IDENTITY_INSERT [dbo].[UserRoleRelation] OFF
INSERT [dbo].[Users] ([UserID], [PassWord], [ApiLoginToken], [LastLoginDate], [LoginIP], [PhotoUrl], [Timestamp], [UserName], [UserTypeCD], [Address], [Age], [Birthday], [Birthplace], [Email], [EnglishName], [FirstName], [Hobby], [LastName], [MaritalStatus], [MobilePhone], [NickName], [Profession], [QQ], [School], [Sex], [Telephone], [ZipCode], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Status], [Description], [ResetToken], [ResetTokenDate]) VALUES (N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, CAST(N'2020-11-10T21:40:58.163' AS DateTime), N'::1', N'~/images/head.png', 0, N'ZKEASOFT', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, N'Admin', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, N'admin', N'Admin', CAST(N'2020-11-10T21:40:58.183' AS DateTime), 1, NULL, NULL, NULL)
ALTER TABLE [dbo].[CMS_WidgetBase] ADD  CONSTRAINT [DF_CMS_WidgetBase_IsTemplate]  DEFAULT ((0)) FOR [IsTemplate]
GO
ALTER TABLE [dbo].[CMS_WidgetBase] ADD  CONSTRAINT [DF_CMS_WidgetBase_IsSystem]  DEFAULT ((0)) FOR [IsSystem]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleCategory] FOREIGN KEY([ArticleTypeID])
REFERENCES [dbo].[ArticleType] ([ID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleCategory]
GO
ALTER TABLE [dbo].[ArticleDetailWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleDetailWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleDetailWidget] CHECK CONSTRAINT [FK_ArticleDetailWidget_Widget]
GO
ALTER TABLE [dbo].[ArticleListWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleListWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleListWidget] CHECK CONSTRAINT [FK_ArticleListWidget_Widget]
GO
ALTER TABLE [dbo].[ArticleSummaryWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleSummaryWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleSummaryWidget] CHECK CONSTRAINT [FK_ArticleSummaryWidget_Widget]
GO
ALTER TABLE [dbo].[ArticleTopWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTopWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleTopWidget] CHECK CONSTRAINT [FK_ArticleTopWidget_Widget]
GO
ALTER TABLE [dbo].[ArticleTypeWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTypeWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleTypeWidget] CHECK CONSTRAINT [FK_ArticleTypeWidget_Widget]
GO
ALTER TABLE [dbo].[CarouselItem]  WITH CHECK ADD  CONSTRAINT [FK_CarouselItem_CarouselWidget] FOREIGN KEY([CarouselWidgetID])
REFERENCES [dbo].[CarouselWidget] ([ID])
GO
ALTER TABLE [dbo].[CarouselItem] CHECK CONSTRAINT [FK_CarouselItem_CarouselWidget]
GO
ALTER TABLE [dbo].[CarouselWidget]  WITH CHECK ADD  CONSTRAINT [FK_CarouselWidget_Carousel] FOREIGN KEY([CarouselID])
REFERENCES [dbo].[Carousel] ([ID])
GO
ALTER TABLE [dbo].[CarouselWidget] CHECK CONSTRAINT [FK_CarouselWidget_Carousel]
GO
ALTER TABLE [dbo].[CarouselWidget]  WITH CHECK ADD  CONSTRAINT [FK_CarouselWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[CarouselWidget] CHECK CONSTRAINT [FK_CarouselWidget_Widget]
GO
ALTER TABLE [dbo].[CMS_LayoutHtml]  WITH CHECK ADD  CONSTRAINT [FK_CMS_LayoutHtml_CMS_Layout] FOREIGN KEY([LayoutId])
REFERENCES [dbo].[CMS_Layout] ([ID])
GO
ALTER TABLE [dbo].[CMS_LayoutHtml] CHECK CONSTRAINT [FK_CMS_LayoutHtml_CMS_Layout]
GO
ALTER TABLE [dbo].[CMS_Page]  WITH CHECK ADD  CONSTRAINT [FK_CMS_Page_CMS_Layout] FOREIGN KEY([LayoutId])
REFERENCES [dbo].[CMS_Layout] ([ID])
GO
ALTER TABLE [dbo].[CMS_Page] CHECK CONSTRAINT [FK_CMS_Page_CMS_Layout]
GO
ALTER TABLE [dbo].[CMS_Zone]  WITH CHECK ADD  CONSTRAINT [FK_CMS_Zone_CMS_Layout] FOREIGN KEY([LayoutId])
REFERENCES [dbo].[CMS_Layout] ([ID])
GO
ALTER TABLE [dbo].[CMS_Zone] CHECK CONSTRAINT [FK_CMS_Zone_CMS_Layout]
GO
ALTER TABLE [dbo].[HtmlWidget]  WITH CHECK ADD  CONSTRAINT [FK_HtmlWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[HtmlWidget] CHECK CONSTRAINT [FK_HtmlWidget_Widget]
GO
ALTER TABLE [dbo].[ImageWidget]  WITH CHECK ADD  CONSTRAINT [FK_ImageWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ImageWidget] CHECK CONSTRAINT [FK_ImageWidget_Widget]
GO
ALTER TABLE [dbo].[NavigationWidget]  WITH CHECK ADD  CONSTRAINT [FK_NavigationWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[NavigationWidget] CHECK CONSTRAINT [FK_NavigationWidget_Widget]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Permission_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Permission_Role]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[ProductCategoryWidget]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategoryWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ProductCategoryWidget] CHECK CONSTRAINT [FK_ProductCategoryWidget_Widget]
GO
ALTER TABLE [dbo].[ProductDetailWidget]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetailWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ProductDetailWidget] CHECK CONSTRAINT [FK_ProductDetailWidget_Widget]
GO
ALTER TABLE [dbo].[ProductListWidget]  WITH CHECK ADD  CONSTRAINT [FK_ProductListWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ProductListWidget] CHECK CONSTRAINT [FK_ProductListWidget_Widget]
GO
ALTER TABLE [dbo].[ScriptWidget]  WITH CHECK ADD  CONSTRAINT [FK_ScriptWidget_CMS_WidgetBase] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ScriptWidget] CHECK CONSTRAINT [FK_ScriptWidget_CMS_WidgetBase]
GO
ALTER TABLE [dbo].[SectionContent]  WITH CHECK ADD  CONSTRAINT [FK_SectionContent_Widget] FOREIGN KEY([SectionWidgetId])
REFERENCES [dbo].[SectionWidget] ([ID])
GO
ALTER TABLE [dbo].[SectionContent] CHECK CONSTRAINT [FK_SectionContent_Widget]
GO
ALTER TABLE [dbo].[SectionGroup]  WITH CHECK ADD  CONSTRAINT [FK_SectionGroup_SectionGroup_Template] FOREIGN KEY([PartialView])
REFERENCES [dbo].[SectionTemplate] ([TemplateName])
GO
ALTER TABLE [dbo].[SectionGroup] CHECK CONSTRAINT [FK_SectionGroup_SectionGroup_Template]
GO
ALTER TABLE [dbo].[SectionGroup]  WITH CHECK ADD  CONSTRAINT [FK_SectionGroup_SectionWidget] FOREIGN KEY([SectionWidgetId])
REFERENCES [dbo].[SectionWidget] ([ID])
GO
ALTER TABLE [dbo].[SectionGroup] CHECK CONSTRAINT [FK_SectionGroup_SectionWidget]
GO
ALTER TABLE [dbo].[SectionWidget]  WITH CHECK ADD  CONSTRAINT [FK_SectionWidget_CMS_WidgetBase] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[SectionWidget] CHECK CONSTRAINT [FK_SectionWidget_CMS_WidgetBase]
GO
ALTER TABLE [dbo].[StyleSheetWidget]  WITH CHECK ADD  CONSTRAINT [FK_StyleSheetWidget_CMS_WidgetBase] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[StyleSheetWidget] CHECK CONSTRAINT [FK_StyleSheetWidget_CMS_WidgetBase]
GO
ALTER TABLE [dbo].[UserRoleRelation]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleRelation_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserRoleRelation] CHECK CONSTRAINT [FK_UserRoleRelation_Roles]
GO
ALTER TABLE [dbo].[UserRoleRelation]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleRelation_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRoleRelation] CHECK CONSTRAINT [FK_UserRoleRelation_Users]
GO
ALTER TABLE [dbo].[VideoWidget]  WITH CHECK ADD  CONSTRAINT [FK_VideoWidget_CMS_WidgetBase] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[VideoWidget] CHECK CONSTRAINT [FK_VideoWidget_CMS_WidgetBase]
GO
