USE [master]
DROP DATABASE IF EXISTS [ZKEACMS]
GO
CREATE DATABASE [ZKEACMS]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZKEACMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZKEACMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZKEACMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZKEACMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZKEACMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZKEACMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZKEACMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZKEACMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZKEACMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZKEACMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZKEACMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZKEACMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZKEACMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZKEACMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZKEACMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZKEACMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZKEACMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZKEACMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZKEACMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZKEACMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZKEACMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZKEACMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZKEACMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZKEACMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ZKEACMS] SET  MULTI_USER 
GO
ALTER DATABASE [ZKEACMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZKEACMS] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ZKEACMS', N'ON'
GO
USE [ZKEACMS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationSetting](
	[SettingKey] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Title] [nvarchar](50) NULL,
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
	[Title] [nvarchar](50) NULL,
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
	[Title] [nvarchar](50) NULL,
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
	[Title] [nvarchar](50) NULL,
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
	[Title] [nvarchar](50) NULL,
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
	[Title] [nvarchar](50) NULL,
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
CREATE TABLE [dbo].[DataArchived](
	[ID] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[Title] [nvarchar](50) NULL,
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
CREATE TABLE [dbo].[Language](
	[LanKey] [nvarchar](190) NOT NULL,
	[CultureName] [nvarchar](10) NOT NULL,
	[LanValue] [nvarchar](max) NULL,
	[Module] [nvarchar](50) NULL,
	[LanType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanKey] ASC,
	[CultureName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
	[Title] [nvarchar](50) NULL,
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
	[Title] [nvarchar](50) NULL,
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
	[Title] [nvarchar](50) NULL,
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
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ExpandAllPage', N'true', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2018-04-11T17:01:47.230' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-11T17:01:47.233' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Favicon', N'~/favicon.ico', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:57:33.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:57:33.627' AS DateTime))
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
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'0880a4dfdc184ff99b88c88325716d1b', NULL, 0, N'#', N'主页', 1, N'~/index', N'1dae90cf6a8547538cc0c369b9943c01', N'欢迎使用ZKEACMS进行创作', NULL, 1, NULL, 1, 1, CAST(N'2017-10-15T18:11:36.267' AS DateTime), NULL, NULL, NULL, NULL, N'admin', NULL, CAST(N'2015-08-31T13:27:16.110' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.267' AS DateTime))
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

INSERT [dbo].[CMS_Redirection] ([ID], [Title], [InComingUrl], [DestinationURL], [IsPermanent], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'默认', N'~/', N'~/index', 0, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:58:06.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-08-14T15:53:01.387' AS DateTime))
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
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'19350341920b4827bf2a4e458ad24a58', N'焦点图', NULL, 1, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-1', N'Widget.Carousel', N'ZKEACMS', N'ZKEACMS.Common.Service.CarouselWidgetService', N'ZKEACMS.Common.Models.CarouselWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:34.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-21T22:44:54.987' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Carousel.png', 0, NULL, NULL)
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
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'6ee67036e78b4b498d932ab2d76757fb', N'导航', NULL, NULL, NULL, NULL, N'ZONE-X', N'Widget.Navigation', N'ZKEACMS', N'ZKEACMS.Common.Service.NavigationWidgetService', N'ZKEACMS.Common.Models.NavigationWidget', NULL, N'full', N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:44:21.393' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-05-21T23:46:00.573' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, 1)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'7679a5060035444d85fe49dc3c02cada', N'图片', NULL, 1, NULL, N'534e07f396b14b7584a833d270356cb7', N'ZONE-1', N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:05:30.853' AS DateTime), NULL, NULL, 0, N'~/images/Widget.Image.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'787d9ad849dd40d0905f22ae072d8507', N'产品内容', NULL, 1, NULL, N'a8d73e29b1eb4b7ea43420e2b6bf2c1b', N'ZONE-1', N'Widget.ProductDetail', N'ZKEACMS.Product', N'ZKEACMS.Product.Service.ProductDetailWidgetService', N'ZKEACMS.Product.Models.ProductDetailWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:20:19.903' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:20:19.903' AS DateTime), NULL, NULL, 0, N'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png', 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'7e7a1d5b8d644333a7b3341509fc960f', N'注册用户', N'注册用户', 2, NULL, N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-3', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.773' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.773' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'7f77f09c3fcd4d498a4aa3b1c9508d7d', N'注册用户', N'注册用户', 2, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-3', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:03:14.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:04:42.893' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'80f365c7991a49a0b04aa11006018814', N'网站管理', N'后台管理', 1, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-3', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', NULL, CAST(N'2015-09-01T10:09:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:03:50.207' AS DateTime), NULL, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'88ab49212dee47bba878a52bec86f501', N'网站管理', N'后台管理', 1, NULL, N'50fa3579e7434555a22f095dcb4ea35e', N'ZONE-3', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.793' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:11:36.793' AS DateTime), NULL, 0, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'8c5b69f614b641c0a5f7a8e318de8df3', N'ZKEACMS 简介', NULL, 3, NULL, N'0880a4dfdc184ff99b88c88325716d1b', N'ZONE-1', N'Widget.ArticleSummary', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleSummaryWidgetService', N'ZKEACMS.Article.Models.ArticleSummaryWidget', NULL, NULL, N'admin', NULL, CAST(N'2015-09-01T09:54:38.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T17:12:08.850' AS DateTime), NULL, 0, 0, NULL, 0, NULL, NULL)
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
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Alipay.AopSdk.AspnetCore.AlipayOptions', N'{"AppId":null,"Uid":null,"Gatewayurl":null,"PrivateKey":null,"AlipayPublicKey":null,"SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}', NULL, NULL, NULL, NULL, NULL, CAST(N'2019-04-24T19:55:03.627' AS DateTime), NULL, NULL, CAST(N'2019-04-24T19:55:03.627' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.GlobalScripts.Models.LiveChatScript', N'{"Location":0,"Script":null}', NULL, NULL, NULL, NULL, NULL, CAST(N'2019-04-07T16:38:35.293' AS DateTime), NULL, NULL, CAST(N'2019-04-07T16:38:35.293' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.GlobalScripts.Models.StatisticsScript', N'{"Location":0,"Script":null}', NULL, NULL, NULL, NULL, NULL, CAST(N'2019-04-07T16:38:36.007' AS DateTime), NULL, NULL, CAST(N'2019-04-07T16:38:36.007' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.Message.Models.MessageNotificationConfig', N'{"MessageNotifyEmails":null,"CommentNotifyEmails":null}', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:25:53.917' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:25:53.917' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.Shop.AliPayConfigOptions', N'{"AppId":"2016082000296332","Uid":"2088102172250345","Gatewayurl":"https://openapi.alipaydev.com/gateway.do","PrivateKey":"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP","AlipayPublicKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB","SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-11T17:02:14.577' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-11T17:02:14.577' AS DateTime))
SET IDENTITY_INSERT [dbo].[DataDictionary] ON 

INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'RecordStatus', N'有效', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'RecordStatus', N'无效', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'ArticleCategory', N'新闻', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'ArticleCategory', N'公司新闻', N'2', 2, 3, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, N'ArticleCategory', N'行业新闻', N'3', 3, 3, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, N'UserEntity@Sex', N'男', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, N'UserEntity@Sex', N'女', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (8, N'UserEntity@MaritalStatus', N'未婚', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (9, N'UserEntity@MaritalStatus', N'已婚', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (11, N'UserEntity@UserTypeCD', N'后台管理员', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (12, N'ArticleTopWidget@PartialView', N'默认', N'Widget.ArticleTops', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (13, N'ArticleListWidget@PartialView', N'默认', N'Widget.ArticleList', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (14, N'ArticleListWidget@PartialView', N'横幅', N'Widget.ArticleList-Snippet', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (15, N'ProductListWidget@PartialView', N'默认', N'Widget.ProductList', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (16, N'ProductListWidget@Columns', N'3 列', N'col-xs-12 col-sm-6 col-md-4', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (17, N'ProductListWidget@Columns', N'4 列', N'col-xs-12 col-sm-6 col-md-4 col-lg-3', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (18, N'CarouselWidget@PartialView', N'默认', N'Widget.Carousel', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (19, N'ArticleSummaryWidget@Style', N'默认', N'bs-callout-default', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (20, N'ArticleSummaryWidget@Style', N'危险', N'bs-callout-danger', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (21, N'ArticleSummaryWidget@Style', N'警告', N'bs-callout-warning', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (22, N'ArticleSummaryWidget@Style', N'信息', N'bs-callout-info', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (23, N'ArticleSummaryWidget@Style', N'成功', N'bs-callout-success', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (24, N'ArticleSummaryWidget@PartialView', N'默认', N'Widget.ArticleSummary', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (25, N'ProductCategoryWidget@PartialView', N'默认', N'Widget.ProductCategory', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (26, N'ArticleTypeWidget@PartialView', N'默认', N'Widget.ArticleType', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (27, N'UserEntity@UserTypeCD', N'前端用户', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (28, N'Order@OrderStatus', N'未支付', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (29, N'Order@OrderStatus', N'取消', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (30, N'Order@OrderStatus', N'已支付', N'3', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (31, N'Order@OrderStatus', N'已发货', N'4', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (32, N'Order@OrderStatus', N'交易完成', N'5', 5, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (33, N'Order@OrderStatus', N'已退款', N'6', 6, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (34, N'Order@OrderStatus', N'退款中', N'7', 7, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (35, N'ProductListWidget@PartialView', N'列表', N'Widget.ProductList.A', 2, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (36, N'RuleItem@Condition', N'并且', N'and', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (37, N'RuleItem@Condition', N'或者', N'or', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (38, N'RuleItem@FunctionName', N'等于', N'Equals', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (39, N'RuleItem@FunctionName', N'不等于', N'NotEquals', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (40, N'RuleItem@FunctionName', N'大于', N'GreaterThan', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (41, N'RuleItem@FunctionName', N'大于等于', N'GreaterThanOrEquals', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (42, N'RuleItem@FunctionName', N'小于', N'LessThan', 5, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (43, N'RuleItem@FunctionName', N'小于等于', N'LessThanOrEquals', 6, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (44, N'RuleItem@FunctionName', N'以…开头', N'StartsWith', 7, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (45, N'RuleItem@FunctionName', N'以...结尾', N'EndsWith', 8, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (46, N'RuleItem@FunctionName', N'不以…开头', N'NotStartsWith', 9, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (47, N'RuleItem@FunctionName', N'不以...结尾', N'NotEndsWith', 10, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (48, N'RuleItem@FunctionName', N'包含', N'Contains', 11, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (49, N'RuleItem@FunctionName', N'不包含', N'NotContains', 12, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (50, N'RuleItem@FunctionName', N'在...里', N'In', 13, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (51, N'RuleItem@FunctionName', N'不在...里', N'NotIn', 14, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (52, N'RuleItem@Property', N'Url', N'ValueOf(''Url'')', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (53, N'RuleItem@Property', N'Url参数', N'ValueOf(''QueryString'')', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (54, N'RuleItem@Property', N'User-Agent', N'ValueOf(''UserAgent'')', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (55, N'RuleItem@Property', N'当前日期', N'ValueOf(''Now'')', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DataDictionary] OFF
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
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link]) VALUES (N'2b510992f0174e668ca53116434e065c', N'~/images/bg4.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link]) VALUES (N'3017aef0eabc451b81daebe6bae68857', N'~/images/bg4.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link]) VALUES (N'43bb869688ee4752a3127dd19ccc6caa', N'http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link]) VALUES (N'7679a5060035444d85fe49dc3c02cada', N'http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link]) VALUES (N'8ea46d2923ad4d62958c565b19bb172d', N'~/images/bg3.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link]) VALUES (N'e5ba6adb117440959757b98e4289430f', N'~/images/bg3.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link]) VALUES (N'fee7f4d7d7e641b0bfa74491a543d245', N'~/images/30.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'"M" 表示该导航会在手机上显示。<strong>右键</strong>可创建子导航。', N'en-GB', N'"M" means the navigation will be displayed on the phone. <strong>Right Click</strong> can add sub item.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'"M" 表示该导航会在手机上显示。<strong>右键</strong>可创建子导航。', N'en-US', N'"M" means the navigation will be displayed on the phone. <strong>Right Click</strong> can add sub item.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'{{0}}的长度应大于{0}且小于{1}', N'en-GB', N'The length of {{0}} should between {0} and {1}', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'{{0}}的长度应大于{0}且小于{1}', N'en-US', N'The length of {{0}} should between {0} and {1}', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'{{0}}的长度应小于{0}', N'en-GB', N'The length of {{0}} should less than {0}', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'{{0}}的长度应小于{0}', N'en-US', N'The length of {{0}} should less than {0}', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'{{0}}的值范围应在{0}-{1}之间', N'en-GB', N'The value of {{0}} should between {0} and {1}', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'{{0}}的值范围应在{0}-{1}之间', N'en-US', N'The value of {{0}} should between {0} and {1}', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'{0}的输入的值不符合要求', N'en-GB', N'The value of {0} is not valid.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'{0}的输入的值不符合要求', N'en-US', N'The value of {0} is not valid.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@AlipayPublicKey', N'en-GB', N'Alipay Public Key', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@AlipayPublicKey', N'en-US', N'Alipay Public Key', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@AlipayPublicKey', N'zh-CN', N'应用公钥', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@AppId', N'en-GB', N'App', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@AppId', N'en-US', N'App', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@AppId', N'zh-CN', N'AppId', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@Gatewayurl', N'en-GB', N'Gatewayurl', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@Gatewayurl', N'en-US', N'Gatewayurl', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@Gatewayurl', N'zh-CN', N'支付宝网关', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@IsKeyFromFile', N'en-GB', N'Is Key From File', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@IsKeyFromFile', N'en-US', N'Is Key From File', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@IsKeyFromFile', N'zh-CN', N'IsKeyFromFile', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@PrivateKey', N'en-GB', N'Private Key', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@PrivateKey', N'en-US', N'Private Key', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@PrivateKey', N'zh-CN', N'应用私钥', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@SignType', N'en-GB', N'Sign Type', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@SignType', N'en-US', N'Sign Type', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@SignType', N'zh-CN', N'SignType', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@Uid', N'en-GB', N'Uid', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@Uid', N'en-US', N'Uid', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AlipayOptions@Uid', N'zh-CN', N'商户UID', N'AlipayOptions', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@ActionType', N'zh-CN', N'ActionType', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@CreateBy', N'zh-CN', N'CreateBy', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@CreatebyName', N'zh-CN', N'创建人', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@CreateDate', N'zh-CN', N'创建日期', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@Description', N'zh-CN', N'描述', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@LastUpdateByName', N'zh-CN', N'更新人', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@LastUpdateDate', N'zh-CN', N'更新日期', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@SettingKey', N'zh-CN', N'键', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@Status', N'zh-CN', N'状态', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@Title', N'zh-CN', N'标题', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@Value', N'zh-CN', N'值', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CustomerClass', N'zh-CN', N'CustomerClass', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Description', N'zh-CN', N'描述', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ExtendData', N'zh-CN', N'ExtendData', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@FormView', N'zh-CN', N'FormView', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ID', N'zh-CN', N'ID', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@LayoutID', N'zh-CN', N'LayoutID', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@PageID', N'zh-CN', N'PageID', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Position', N'zh-CN', N'排序', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Status', N'zh-CN', N'状态', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Title', N'zh-CN', N'标题', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ZoneID', N'zh-CN', N'区域', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ActionType', N'zh-CN', N'ActionType', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ArticleContent', N'zh-CN', N'文章内容', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ArticleTypeID', N'en-GB', N'Article Type', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ArticleTypeID', N'en-US', N'Article Type', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ArticleTypeID', N'zh-CN', N'文章类别', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Counter', N'zh-CN', N'阅读次数', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreateBy', N'zh-CN', N'CreateBy', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreatebyName', N'en-GB', N'Createby Name', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreatebyName', N'en-US', N'Createby Name', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreatebyName', N'zh-CN', N'创建人', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreateDate', N'en-GB', N'Create Date', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreateDate', N'en-US', N'Create Date', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreateDate', N'zh-CN', N'创建日期', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Description', N'zh-CN', N'描述', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ID', N'zh-CN', N'ID', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ImageThumbUrl', N'zh-CN', N'缩略图', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ImageUrl', N'zh-CN', N'图片', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@IsPublish', N'en-GB', N'Is Publish', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@IsPublish', N'en-US', N'Is Publish', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@IsPublish', N'zh-CN', N'已发布?', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateByName', N'en-GB', N'Last Update By Name', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateByName', N'en-US', N'Last Update By Name', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateDate', N'en-GB', N'Last Update Date', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateDate', N'en-US', N'Last Update Date', N'ArticleEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@MetaDescription', N'zh-CN', N'SEO描述', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@MetaKeyWords', N'zh-CN', N'SEO关键字', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@PublishDate', N'zh-CN', N'发布日期', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ReturnUrl', N'zh-CN', N'ReturnUrl', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Status', N'zh-CN', N'状态', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Summary', N'zh-CN', N'概述', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Title', N'en-GB', N'Title', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Title', N'en-US', N'Title', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Title', N'zh-CN', N'标题', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Url', N'zh-CN', N'英文名', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ArticleCategoryID', N'zh-CN', N'ArticleCategoryID', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ArticleTypeID', N'zh-CN', N'文章类别', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Description', N'zh-CN', N'描述', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@DetailPageUrl', N'zh-CN', N'详细页面', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ExtendData', N'zh-CN', N'ExtendData', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@FormView', N'zh-CN', N'FormView', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ID', N'zh-CN', N'ID', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@IsPageable', N'zh-CN', N'分页?', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@LayoutID', N'zh-CN', N'LayoutID', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@PageID', N'zh-CN', N'PageID', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@PageSize', N'zh-CN', N'分页大小', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Position', N'zh-CN', N'排序', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Status', N'zh-CN', N'状态', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Title', N'zh-CN', N'标题', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ZoneID', N'zh-CN', N'区域', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@ArticleId', N'zh-CN', N'文章ID', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@ArticleName', N'zh-CN', N'文章英文名', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@Position', N'zh-CN', N'排序', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@Title', N'zh-CN', N'标题', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSpecialDetailWidget@ZoneID', N'zh-CN', N'区域', N'ArticleSpecialDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Description', N'zh-CN', N'描述', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@DetailLink', N'zh-CN', N'详细页面', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ExtendData', N'zh-CN', N'ExtendData', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@FormView', N'zh-CN', N'FormView', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ID', N'zh-CN', N'ID', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@LayoutID', N'zh-CN', N'布局', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@PageID', N'zh-CN', N'页面', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@PartDriver', N'zh-CN', N'PartDriver', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Position', N'zh-CN', N'排序', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Status', N'zh-CN', N'状态', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Style', N'zh-CN', N'样式', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@SubTitle', N'zh-CN', N'子标题', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Summary', N'zh-CN', N'概述', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Title', N'zh-CN', N'标题', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ZoneID', N'zh-CN', N'区域', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ArticleTypeID', N'zh-CN', N'文章类别', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleTopWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Description', N'zh-CN', N'描述', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@DetailPageUrl', N'zh-CN', N'详细页面', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ExtendData', N'zh-CN', N'ExtendData', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@FormView', N'zh-CN', N'FormView', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ID', N'zh-CN', N'ID', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@LayoutID', N'zh-CN', N'LayoutID', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@MoreLink', N'zh-CN', N'更多页面', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@PageID', N'zh-CN', N'PageID', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@PartDriver', N'zh-CN', N'PartDriver', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Position', N'zh-CN', N'排序', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Status', N'zh-CN', N'状态', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@SubTitle', N'zh-CN', N'子标题', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Title', N'zh-CN', N'标题', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Tops', N'zh-CN', N'置顶数', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ZoneID', N'zh-CN', N'区域', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@ActionType', N'zh-CN', N'ActionType', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@CreateBy', N'zh-CN', N'CreateBy', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@CreatebyName', N'zh-CN', N'创建人', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@CreateDate', N'zh-CN', N'创建日期', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@Description', N'zh-CN', N'描述', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@ID', N'zh-CN', N'ID', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@ParentID', N'zh-CN', N'ParentID', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@Status', N'zh-CN', N'状态', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@Title', N'zh-CN', N'标题', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@Url', N'zh-CN', N'英文名', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ArticleTypeID', N'zh-CN', N'文章类别', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Description', N'zh-CN', N'描述', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@FormView', N'zh-CN', N'FormView', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ID', N'zh-CN', N'ID', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@LayoutID', N'zh-CN', N'LayoutID', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@PageID', N'zh-CN', N'PageID', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Position', N'zh-CN', N'排序', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Status', N'zh-CN', N'状态', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@TargetPage', N'zh-CN', N'详细页面', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Title', N'zh-CN', N'标题', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ZoneID', N'zh-CN', N'区域', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AuthOption@ClientId', N'en-GB', N'Client', N'AuthOption', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AuthOption@ClientId', N'en-US', N'Client', N'AuthOption', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AuthOption@ClientId', N'zh-CN', N'APP ID', N'AuthOption', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AuthOption@ClientSecret', N'en-GB', N'Client Secret', N'AuthOption', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AuthOption@ClientSecret', N'en-US', N'Client Secret', N'AuthOption', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'AuthOption@ClientSecret', N'zh-CN', N'APP Key', N'AuthOption', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BaiduMapWidget@ApplicationKey', N'zh-CN', N'服务密钥(AK)', N'BaiduMapWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BaiduMapWidget@Height', N'zh-CN', N'地图高度(px)', N'BaiduMapWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BaiduMapWidget@Instruction', N'zh-CN', N'相关链接', N'BaiduMapWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BaiduMapWidget@LocationPoint', N'zh-CN', N'位置坐标', N'BaiduMapWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BaiduMapWidget@TagSummary', N'zh-CN', N'标注说明', N'BaiduMapWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BaiduMapWidget@TagTitle', N'zh-CN', N'标注', N'BaiduMapWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BiographyWidget@Content', N'zh-CN', N'详细信息', N'BiographyWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BiographyWidget@Name', N'zh-CN', N'名称', N'BiographyWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BiographyWidget@Others', N'zh-CN', N'其它', N'BiographyWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BiographyWidget@Photo', N'zh-CN', N'照片', N'BiographyWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ActionType', N'zh-CN', N'ActionType', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CreateBy', N'zh-CN', N'CreateBy', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CreatebyName', N'zh-CN', N'创建人', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CreateDate', N'zh-CN', N'创建日期', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CustomClass', N'zh-CN', N'CustomClass', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Description', N'zh-CN', N'描述', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ExtendData', N'zh-CN', N'ExtendData', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ExtendFields', N'zh-CN', N'扩展属性', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@FormView', N'zh-CN', N'FormView', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ID', N'zh-CN', N'ID', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@IsLinkAble', N'zh-CN', N'IsLinkAble', N'BreadcrumbWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@IsSystem', N'zh-CN', N'IsSystem', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@IsTemplate', N'zh-CN', N'保存为模板', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@LastUpdateByName', N'zh-CN', N'更新人', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@LayoutID', N'zh-CN', N'布局', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@PageID', N'zh-CN', N'页面', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@PartialView', N'zh-CN', N'显示模板', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Position', N'zh-CN', N'排序', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Status', N'zh-CN', N'状态', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@StyleClass', N'zh-CN', N'自定义样式', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Title', N'zh-CN', N'标题', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@WidgetName', N'zh-CN', N'组件名称', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ZoneID', N'zh-CN', N'区域', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@ActionType', N'zh-CN', N'ActionType', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CarouselItems', N'en-GB', N'Carousel Items', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CarouselItems', N'en-US', N'Carousel Items', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CarouselItems', N'zh-CN', N'滚动图', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreateBy', N'zh-CN', N'CreateBy', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreatebyName', N'en-GB', N'Createby Name', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreatebyName', N'en-US', N'Createby Name', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreatebyName', N'zh-CN', N'创建人', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreateDate', N'en-GB', N'Create Date', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreateDate', N'en-US', N'Create Date', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreateDate', N'zh-CN', N'创建日期', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Description', N'en-GB', N'Description', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Description', N'en-US', N'Description', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Description', N'zh-CN', N'描述', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Height', N'zh-CN', N'高度(px)', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@ID', N'zh-CN', N'ID', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateByName', N'en-GB', N'Last Update By Name', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateByName', N'en-US', N'Last Update By Name', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateByName', N'zh-CN', N'更新人', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateDate', N'en-GB', N'Last Update Date', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateDate', N'en-US', N'Last Update Date', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Status', N'en-GB', N'Status', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Status', N'en-US', N'Status', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Status', N'zh-CN', N'状态', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Title', N'en-GB', N'Title', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Title', N'en-US', N'Title', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Title', N'zh-CN', N'标题', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@ActionType', N'zh-CN', N'ActionType', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CarouselID', N'en-GB', N'Carousel', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CarouselID', N'en-US', N'Carousel', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CarouselID', N'zh-CN', N'焦点图', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CarouselWidgetID', N'zh-CN', N'CarouselWidgetID', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CreateBy', N'zh-CN', N'CreateBy', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CreatebyName', N'zh-CN', N'创建人', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CreateDate', N'zh-CN', N'创建日期', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Description', N'zh-CN', N'描述', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@ID', N'zh-CN', N'ID', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@ImageUrl', N'en-GB', N'Image Url', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@ImageUrl', N'en-US', N'Image Url', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@ImageUrl', N'zh-CN', N'图片', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@LastUpdateByName', N'zh-CN', N'更新人', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Status', N'en-GB', N'Status', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Status', N'en-US', N'Status', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Status', N'zh-CN', N'状态', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@TargetLink', N'en-GB', N'Target Link', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@TargetLink', N'en-US', N'Target Link', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@TargetLink', N'zh-CN', N'链接', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Title', N'en-GB', N'Title', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Title', N'en-US', N'Title', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Title', N'zh-CN', N'标题', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ActionType', N'zh-CN', N'ActionType', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CarouselID', N'zh-CN', N'共享焦点图', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CarouselItems', N'zh-CN', N'滚动图', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CreateBy', N'zh-CN', N'CreateBy', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CreatebyName', N'zh-CN', N'创建人', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CreateDate', N'zh-CN', N'创建日期', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CustomClass', N'zh-CN', N'CustomClass', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Description', N'zh-CN', N'描述', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ExtendFields', N'zh-CN', N'扩展属性', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@FormView', N'zh-CN', N'FormView', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ID', N'zh-CN', N'ID', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@IsSystem', N'zh-CN', N'IsSystem', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@IsTemplate', N'zh-CN', N'保存为模板', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@LastUpdateByName', N'zh-CN', N'更新人', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@LayoutID', N'zh-CN', N'LayoutID', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@PageID', N'zh-CN', N'PageID', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@PartialView', N'zh-CN', N'显示模板', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Position', N'zh-CN', N'排序', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Status', N'zh-CN', N'状态', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@StyleClass', N'zh-CN', N'自定义样式', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Title', N'zh-CN', N'标题', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@WidgetName', N'zh-CN', N'组件名称', N'CarouselWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ZoneID', N'zh-CN', N'区域', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@ActionType', N'zh-CN', N'ActionType', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Agrees', N'zh-CN', N'赞同数', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CommentContent', N'en-GB', N'Comment Content', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CommentContent', N'en-US', N'Comment Content', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CommentContent', N'zh-CN', N'评论内容', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreateBy', N'zh-CN', N'CreateBy', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreatebyName', N'en-GB', N'Createby Name', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreatebyName', N'en-US', N'Createby Name', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreatebyName', N'zh-CN', N'创建人', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreateDate', N'en-GB', N'Create Date', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreateDate', N'en-US', N'Create Date', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreateDate', N'zh-CN', N'创建日期', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Description', N'zh-CN', N'描述', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Disagrees', N'zh-CN', N'反对数', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@ID', N'zh-CN', N'ID', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateByName', N'en-GB', N'Last Update By Name', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateByName', N'en-US', N'Last Update By Name', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateByName', N'zh-CN', N'更新人', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateDate', N'en-GB', N'Last Update Date', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateDate', N'en-US', N'Last Update Date', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateDate', N'zh-CN', N'更新日期', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@PagePath', N'zh-CN', N'页面地址', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Picture', N'zh-CN', N'Picture', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Status', N'en-GB', N'Status', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Status', N'en-US', N'Status', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Status', N'zh-CN', N'状态', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Title', N'en-GB', N'Title', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Title', N'en-US', N'Title', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Title', N'zh-CN', N'标题', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@UserId', N'zh-CN', N'登录名', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@UserName', N'zh-CN', N'用户名', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ActionType', N'zh-CN', N'ActionType', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CreateBy', N'zh-CN', N'CreateBy', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CreatebyName', N'zh-CN', N'创建人', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CreateDate', N'zh-CN', N'创建日期', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CustomClass', N'zh-CN', N'CustomClass', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Description', N'zh-CN', N'描述', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ExtendData', N'zh-CN', N'ExtendData', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@FormView', N'zh-CN', N'FormView', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ID', N'zh-CN', N'ID', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@IsSystem', N'zh-CN', N'IsSystem', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@IsTemplate', N'zh-CN', N'保存为模板', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@LastUpdateByName', N'zh-CN', N'更新人', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@LayoutID', N'zh-CN', N'LayoutID', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@PageID', N'zh-CN', N'PageID', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@PartialView', N'zh-CN', N'显示模板', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Position', N'zh-CN', N'排序', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Status', N'zh-CN', N'状态', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@StyleClass', N'zh-CN', N'自定义样式', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Title', N'zh-CN', N'标题', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@WidgetName', N'zh-CN', N'组件名称', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ZoneID', N'zh-CN', N'区域', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentField@FieldType', N'zh-CN', N'字段类型', N'ContentField', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentField@Name', N'zh-CN', N'属性名', N'ContentField', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentField@Status', N'en-GB', N'Status', N'ContentField', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentField@Status', N'en-US', N'Status', N'ContentField', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentField@Title', N'zh-CN', N'字段名', N'ContentField', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@CreatebyName', N'en-GB', N'Createby Name', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@CreatebyName', N'en-US', N'Createby Name', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@CreateDate', N'en-GB', N'Create Date', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@CreateDate', N'en-US', N'Create Date', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@Description', N'en-GB', N'Description', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@Description', N'en-US', N'Description', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@LastUpdateByName', N'en-GB', N'Last Update By Name', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@LastUpdateByName', N'en-US', N'Last Update By Name', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@LastUpdateDate', N'en-GB', N'Last Update Date', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@LastUpdateDate', N'en-US', N'Last Update Date', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@Status', N'en-GB', N'Status', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@Status', N'en-US', N'Status', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@Template', N'zh-CN', N'模板代码', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@Title', N'en-GB', N'Title', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentTemplate@Title', N'en-US', N'Title', N'ContentTemplate', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@CreatebyName', N'en-GB', N'Createby Name', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@CreatebyName', N'en-US', N'Createby Name', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@CreateDate', N'en-GB', N'Create Date', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@CreateDate', N'en-US', N'Create Date', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@Description', N'en-GB', N'Description', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@Description', N'en-US', N'Description', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@Fields', N'zh-CN', N'字段', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@LastUpdateByName', N'en-GB', N'Last Update By Name', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@LastUpdateByName', N'en-US', N'Last Update By Name', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@LastUpdateDate', N'en-GB', N'Last Update Date', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@LastUpdateDate', N'en-US', N'Last Update Date', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@Status', N'en-GB', N'Status', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@Status', N'en-US', N'Status', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@Title', N'en-GB', N'Title', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ContentType@Title', N'en-US', N'Title', N'ContentType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@CreatebyName', N'zh-CN', N'创建人', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@CreateDate', N'zh-CN', N'创建日期', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@CultureCode', N'zh-CN', N'语言缩写', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@CultureID', N'zh-CN', N'CultureID', N'Culture', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@Description', N'zh-CN', N'描述', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@DisplayName', N'zh-CN', N'显示名称', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@Domain', N'zh-CN', N'域名', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@EnglishName', N'zh-CN', N'英文名', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@Flag', N'zh-CN', N'旗帜', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@LastUpdateByName', N'zh-CN', N'更新人', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@LastUpdateDate', N'zh-CN', N'更新日期', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@LCID', N'zh-CN', N'LCID', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@Status', N'zh-CN', N'状态', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@Title', N'zh-CN', N'标题', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Culture@UrlCode', N'zh-CN', N'Url缩写', N'Culture', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@CultureMode', N'en-GB', N'Culture Mode', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@CultureMode', N'en-US', N'Culture Mode', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@CultureMode', N'zh-CN', N'多语言模式', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@DefaultCulture', N'en-GB', N'Default Culture', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@DefaultCulture', N'en-US', N'Default Culture', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@DefaultCulture', N'zh-CN', N'默认语言', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@IsEnable', N'en-GB', N'Is Enable', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@IsEnable', N'en-US', N'Is Enable', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@IsEnable', N'zh-CN', N'是否启用？', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@IsShowDefault', N'en-GB', N'Is Show Default', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@IsShowDefault', N'en-US', N'Is Show Default', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CultureSetting@IsShowDefault', N'zh-CN', N'无内容时使用默认语言？', N'CultureSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@CreateBy', N'zh-CN', N'CreateBy', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@CreatebyName', N'zh-CN', N'创建人', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@CreateDate', N'zh-CN', N'创建日期', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Description', N'zh-CN', N'描述', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@DicName', N'zh-CN', N'DicName', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@DicValue', N'zh-CN', N'DicValue', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@ID', N'zh-CN', N'ID', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@ImageThumbUrl', N'zh-CN', N'缩略图', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@ImageUrl', N'zh-CN', N'图片', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@IsSystem', N'zh-CN', N'IsSystem', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@LastUpdateByName', N'zh-CN', N'更新人', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Order', N'zh-CN', N'排序', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Pid', N'zh-CN', N'Pid', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Status', N'zh-CN', N'状态', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Title', N'zh-CN', N'标题', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@ActionType', N'zh-CN', N'ActionType', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@CreateBy', N'zh-CN', N'CreateBy', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@CreatebyName', N'zh-CN', N'创建人', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@CreateDate', N'zh-CN', N'创建日期', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@Description', N'zh-CN', N'描述', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@ID', N'zh-CN', N'ID', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@LastUpdateByName', N'zh-CN', N'更新人', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@OwnerID', N'zh-CN', N'OwnerID', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@OwnerModule', N'zh-CN', N'OwnerModule', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@Status', N'zh-CN', N'状态', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@Title', N'zh-CN', N'名称', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@Value', N'zh-CN', N'值', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FluidContentListWidget@ContentTemplateID', N'zh-CN', N'显示模板', N'FluidContentListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FluidContentListWidget@ContentTypeID', N'zh-CN', N'自定义内容类型', N'FluidContentListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FluidContentWidget@ContentTemplateID', N'zh-CN', N'显示模板', N'FluidContentWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FluidContentWidget@ContentValueID', N'zh-CN', N'自定义内容', N'FluidContentWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FluidContentWidget@IsSupportQueryID', N'zh-CN', N'动态内容', N'FluidContentWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@ActionType', N'zh-CN', N'ActionType', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreateBy', N'zh-CN', N'CreateBy', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreatebyName', N'en-GB', N'Createby Name', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreatebyName', N'en-US', N'Createby Name', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreatebyName', N'zh-CN', N'创建人', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreateDate', N'en-GB', N'Create Date', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreateDate', N'en-US', N'Create Date', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreateDate', N'zh-CN', N'创建日期', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@Description', N'zh-CN', N'描述', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@FieldsData', N'zh-CN', N'FieldsData', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@FormFields', N'zh-CN', N'FormFields', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@ID', N'zh-CN', N'ID', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateByName', N'en-GB', N'Last Update By Name', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateByName', N'en-US', N'Last Update By Name', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateByName', N'zh-CN', N'更新人', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateDate', N'en-GB', N'Last Update Date', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateDate', N'en-US', N'Last Update Date', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateDate', N'zh-CN', N'更新日期', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@Status', N'zh-CN', N'状态', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@Title', N'en-GB', N'Title', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@Title', N'en-US', N'Title', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@Title', N'zh-CN', N'标题', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@ActionType', N'zh-CN', N'ActionType', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreateBy', N'zh-CN', N'CreateBy', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreatebyName', N'en-GB', N'Createby Name', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreatebyName', N'en-US', N'Createby Name', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreatebyName', N'zh-CN', N'创建人', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreateDate', N'en-GB', N'Create Date', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreateDate', N'en-US', N'Create Date', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreateDate', N'zh-CN', N'创建日期', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Datas', N'zh-CN', N'Datas', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Description', N'zh-CN', N'描述', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Form', N'zh-CN', N'Form', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@FormId', N'en-GB', N'Form', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@FormId', N'en-US', N'Form', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@FormId', N'zh-CN', N'表单', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@ID', N'zh-CN', N'ID', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateByName', N'en-GB', N'Last Update By Name', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateByName', N'en-US', N'Last Update By Name', N'FormData', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateByName', N'zh-CN', N'更新人', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateDate', N'en-GB', N'Last Update Date', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateDate', N'en-US', N'Last Update Date', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateDate', N'zh-CN', N'更新日期', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Status', N'zh-CN', N'状态', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Title', N'en-GB', N'Title', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Title', N'en-US', N'Title', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Title', N'zh-CN', N'标题', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ActionType', N'zh-CN', N'ActionType', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CreateBy', N'zh-CN', N'CreateBy', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CreatebyName', N'zh-CN', N'创建人', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CreateDate', N'zh-CN', N'创建日期', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CustomClass', N'zh-CN', N'CustomClass', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Description', N'zh-CN', N'描述', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ExtendData', N'zh-CN', N'ExtendData', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@FormID', N'zh-CN', N'表单', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@FormView', N'zh-CN', N'FormView', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ID', N'zh-CN', N'ID', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@IsSystem', N'zh-CN', N'IsSystem', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@IsTemplate', N'zh-CN', N'保存为模板', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@LastUpdateByName', N'zh-CN', N'更新人', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@LayoutID', N'zh-CN', N'LayoutID', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@PageID', N'zh-CN', N'PageID', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@PartialView', N'zh-CN', N'显示模板', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Position', N'zh-CN', N'排序', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Status', N'zh-CN', N'状态', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@StyleClass', N'zh-CN', N'自定义样式', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Title', N'zh-CN', N'标题', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@WidgetName', N'zh-CN', N'组件名称', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ZoneID', N'zh-CN', N'区域', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HistoryEventItem@Description', N'zh-CN', N'事件', N'HistoryEventItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HistoryEventItem@Title', N'zh-CN', N'年份', N'HistoryEventItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HistoryEventWidget@Events', N'zh-CN', N'历史事件', N'HistoryEventWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ActionType', N'zh-CN', N'ActionType', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CreateBy', N'zh-CN', N'CreateBy', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CreatebyName', N'zh-CN', N'创建人', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CreateDate', N'zh-CN', N'创建日期', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CustomClass', N'zh-CN', N'CustomClass', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Description', N'zh-CN', N'描述', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ExtendData', N'zh-CN', N'ExtendData', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ExtendFields', N'zh-CN', N'扩展属性', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@FormView', N'zh-CN', N'FormView', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@HTML', N'zh-CN', N'内容', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ID', N'zh-CN', N'ID', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@IsSystem', N'zh-CN', N'IsSystem', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@IsTemplate', N'zh-CN', N'保存为模板', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@LastUpdateByName', N'zh-CN', N'更新人', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@LayoutID', N'zh-CN', N'布局', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@PageID', N'zh-CN', N'页面', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@PartDriver', N'zh-CN', N'PartDriver', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@PartialView', N'zh-CN', N'显示模板', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Position', N'zh-CN', N'排序', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Status', N'zh-CN', N'状态', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@StyleClass', N'zh-CN', N'自定义样式', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Title', N'zh-CN', N'标题', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@WidgetName', N'zh-CN', N'组件名称', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ZoneID', N'zh-CN', N'区域', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ActionType', N'zh-CN', N'ActionType', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@AltText', N'zh-CN', N'说明', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CreateBy', N'zh-CN', N'CreateBy', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CreatebyName', N'zh-CN', N'创建人', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CreateDate', N'zh-CN', N'创建日期', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CustomClass', N'zh-CN', N'CustomClass', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Description', N'zh-CN', N'描述', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@FormView', N'zh-CN', N'FormView', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Height', N'zh-CN', N'高度(px)', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ID', N'zh-CN', N'ID', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ImageUrl', N'zh-CN', N'图片', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@IsSystem', N'zh-CN', N'IsSystem', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@LayoutID', N'zh-CN', N'布局', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Link', N'zh-CN', N'链接', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@PageID', N'zh-CN', N'页面', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@PartDriver', N'zh-CN', N'PartDriver', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@PartialView', N'zh-CN', N'显示模板', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Position', N'zh-CN', N'排序', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Status', N'zh-CN', N'状态', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@StyleClass', N'zh-CN', N'自定义样式', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ImageWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Title', N'zh-CN', N'标题', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@WidgetName', N'zh-CN', N'组件名称', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Width', N'zh-CN', N'宽度(px)', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ZoneID', N'zh-CN', N'区域', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@Action', N'en-GB', N'Action', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@Action', N'en-US', N'Action', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@MetaDescription', N'en-GB', N'Meta Description', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@MetaDescription', N'en-US', N'Meta Description', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@MetaKeyWords', N'en-GB', N'Meta Key Words', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@MetaKeyWords', N'en-US', N'Meta Key Words', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@MetaKeyWorlds', N'en-GB', N'Meta Key Worlds', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@MetaKeyWorlds', N'en-US', N'Meta Key Worlds', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@Title', N'en-GB', N'Title', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@Title', N'en-US', N'Title', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@Url', N'en-GB', N'Url', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Keywords@Url', N'en-US', N'Url', N'Keywords', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@CultureName', N'en-GB', N'Culture Name', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@CultureName', N'en-US', N'Culture Name', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@CultureName', N'zh-CN', N'语言缩写', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanKey', N'en-GB', N'Lan Key', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanKey', N'en-US', N'Lan Key', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanKey', N'zh-CN', N'翻译键', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanType', N'zh-CN', N'对象', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanValue', N'en-GB', N'Lan Value', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanValue', N'en-US', N'Lan Value', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanValue', N'zh-CN', N'翻译值', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@Module', N'zh-CN', N'模块', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ActionType', N'zh-CN', N'ActionType', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ContainerClass', N'zh-CN', N'ContainerClass', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@CreateBy', N'zh-CN', N'CreateBy', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@CreatebyName', N'zh-CN', N'创建人', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@CreateDate', N'zh-CN', N'创建日期', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@CurrentTheme', N'zh-CN', N'CurrentTheme', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Description', N'en-GB', N'Description', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Description', N'en-US', N'Description', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Description', N'zh-CN', N'描述', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Html', N'zh-CN', N'内容', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ID', N'zh-CN', N'ID', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ImageThumbUrl', N'zh-CN', N'缩略图', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ImageUrl', N'zh-CN', N'图片', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@IsTemplate', N'en-GB', N'Is Template', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@IsTemplate', N'en-US', N'Is Template', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@IsTemplate', N'zh-CN', N'保存为模板', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LastUpdateByName', N'zh-CN', N'更新人', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Layout', N'zh-CN', N'Layout', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LayoutName', N'en-GB', N'Layout Name', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LayoutName', N'en-US', N'Layout Name', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LayoutName', N'zh-CN', N'名称', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Page', N'zh-CN', N'Page', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@PreViewPage', N'zh-CN', N'PreViewPage', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Script', N'en-GB', N'Script', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Script', N'en-US', N'Script', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Script', N'zh-CN', N'脚本', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Status', N'en-GB', N'Status', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Status', N'en-US', N'Status', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Status', N'zh-CN', N'状态', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Style', N'en-GB', N'Style', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Style', N'en-US', N'Style', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Style', N'zh-CN', N'样式', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Templates', N'zh-CN', N'Templates', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Theme', N'zh-CN', N'主题', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Title', N'zh-CN', N'标题', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Zones', N'zh-CN', N'Zones', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ZoneWidgets', N'zh-CN', N'ZoneWidgets', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@ActionType', N'zh-CN', N'ActionType', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@CreateBy', N'zh-CN', N'CreateBy', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@CreatebyName', N'zh-CN', N'创建人', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@CreateDate', N'zh-CN', N'创建日期', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@Description', N'zh-CN', N'描述', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@Html', N'zh-CN', N'内容', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LastUpdateByName', N'zh-CN', N'更新人', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LastUpdateDate', N'zh-CN', N'更新日期', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LayoutHtmlId', N'zh-CN', N'LayoutHtmlId', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LayoutId', N'zh-CN', N'布局', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@Status', N'zh-CN', N'状态', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@Title', N'zh-CN', N'标题', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LiveChatScript@Location', N'zh-CN', N'位置', N'GlobalScripts', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LiveChatScript@Script', N'zh-CN', N'脚本', N'LiveChatScript', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@ActionType', N'zh-CN', N'ActionType', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@CreateBy', N'zh-CN', N'CreateBy', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@CreatebyName', N'zh-CN', N'CreatebyName', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@CreateDate', N'zh-CN', N'CreateDate', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@Description', N'zh-CN', N'描述', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@ID', N'zh-CN', N'ID', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@MediaType', N'zh-CN', N'MediaType', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@MediaTypeImage', N'zh-CN', N'MediaTypeImage', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@ParentID', N'zh-CN', N'ParentID', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@Status', N'zh-CN', N'状态', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@Title', N'zh-CN', N'标题', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@Url', N'zh-CN', N'Url', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@ActionType', N'zh-CN', N'ActionType', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreateBy', N'zh-CN', N'CreateBy', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreatebyName', N'en-GB', N'Createby Name', N'MessageEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreatebyName', N'en-US', N'Createby Name', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreatebyName', N'zh-CN', N'创建人', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreateDate', N'en-GB', N'Create Date', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreateDate', N'en-US', N'Create Date', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreateDate', N'zh-CN', N'创建日期', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Description', N'zh-CN', N'描述', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Email', N'en-GB', N'Email', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Email', N'en-US', N'Email', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Email', N'zh-CN', N'邮箱', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@ID', N'zh-CN', N'ID', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateByName', N'en-GB', N'Last Update By Name', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateByName', N'en-US', N'Last Update By Name', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateByName', N'zh-CN', N'更新人', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateDate', N'en-GB', N'Last Update Date', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateDate', N'en-US', N'Last Update Date', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@PostMessage', N'zh-CN', N'留言内容', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Reply', N'zh-CN', N'回复', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Status', N'en-GB', N'Status', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Status', N'en-US', N'Status', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Status', N'zh-CN', N'状态', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Title', N'en-GB', N'Title', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Title', N'en-US', N'Title', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Title', N'zh-CN', N'姓名', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@CommentNotifyEmails', N'en-GB', N'Comment Notify Emails', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@CommentNotifyEmails', N'en-US', N'Comment Notify Emails', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@CommentNotifyEmails', N'zh-CN', N'新评论通知邮箱', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@MessageNotifyEmails', N'en-GB', N'Message Notify Emails', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@MessageNotifyEmails', N'en-US', N'Message Notify Emails', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@MessageNotifyEmails', N'zh-CN', N'新留言通知邮箱', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ActionType', N'zh-CN', N'ActionType', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CreateBy', N'zh-CN', N'CreateBy', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CreatebyName', N'zh-CN', N'创建人', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CreateDate', N'zh-CN', N'创建日期', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CustomClass', N'zh-CN', N'CustomClass', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Description', N'zh-CN', N'描述', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ExtendData', N'zh-CN', N'ExtendData', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ExtendFields', N'zh-CN', N'扩展属性', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@FormView', N'zh-CN', N'FormView', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ID', N'zh-CN', N'ID', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@IsSystem', N'zh-CN', N'IsSystem', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@IsTemplate', N'zh-CN', N'保存为模板', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@LastUpdateByName', N'zh-CN', N'更新人', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@LayoutID', N'zh-CN', N'LayoutID', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@PageID', N'zh-CN', N'PageID', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@PartialView', N'zh-CN', N'显示模板', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Position', N'zh-CN', N'排序', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Status', N'zh-CN', N'状态', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@StyleClass', N'zh-CN', N'自定义样式', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Title', N'zh-CN', N'标题', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@WidgetName', N'zh-CN', N'组件名称', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ZoneID', N'zh-CN', N'区域', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@ActionType', N'zh-CN', N'ActionType', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@CreateBy', N'zh-CN', N'CreateBy', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@CreatebyName', N'zh-CN', N'创建人', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@CreateDate', N'zh-CN', N'创建日期', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Description', N'en-GB', N'Description', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Description', N'en-US', N'Description', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Description', N'zh-CN', N'描述', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@DisplayOrder', N'zh-CN', N'排序', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Html', N'en-GB', N'Html', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Html', N'en-US', N'Html', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Html', N'zh-CN', N'HTML内容', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@ID', N'zh-CN', N'ID', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@IsCurrent', N'en-GB', N'Is Current', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@IsCurrent', N'en-US', N'Is Current', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@IsCurrent', N'zh-CN', N'IsCurrent', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@IsMobile', N'en-GB', N'Is Mobile', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@IsMobile', N'en-US', N'Is Mobile', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@IsMobile', N'zh-CN', N'手机一级导航', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@LastUpdateByName', N'zh-CN', N'更新人', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@ParentId', N'zh-CN', N'ParentId', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Status', N'en-GB', N'Status', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Status', N'en-US', N'Status', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Status', N'zh-CN', N'状态', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Title', N'en-GB', N'Title', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Title', N'en-US', N'Title', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Title', N'zh-CN', N'标题', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Url', N'en-GB', N'Url', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Url', N'en-US', N'Url', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Url', N'zh-CN', N'Url', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ActionType', N'zh-CN', N'ActionType', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@AlignClass', N'en-GB', N'Align Class', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@AlignClass', N'en-US', N'Align Class', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@AlignClass', N'zh-CN', N'对齐', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@AssemblyName', N'en-GB', N'Assembly Name', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@AssemblyName', N'en-US', N'Assembly Name', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CreateBy', N'zh-CN', N'CreateBy', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CreatebyName', N'zh-CN', N'创建人', N'NavigationWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CreateDate', N'zh-CN', N'创建日期', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CustomClass', N'zh-CN', N'CustomClass', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CustomerClass', N'en-GB', N'Customer Class', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CustomerClass', N'en-US', N'Customer Class', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CustomerClass', N'zh-CN', N'契合度', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CustomStyle', N'zh-CN', N'契合度', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Description', N'zh-CN', N'描述', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ExtendData', N'zh-CN', N'ExtendData', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ExtendFields', N'zh-CN', N'扩展属性', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@FormView', N'zh-CN', N'FormView', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ID', N'zh-CN', N'ID', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsSystem', N'en-GB', N'Is System', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsSystem', N'en-US', N'Is System', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsSystem', N'zh-CN', N'IsSystem', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsTemplate', N'en-GB', N'Is Template', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsTemplate', N'en-US', N'Is Template', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsTemplate', N'zh-CN', N'保存为模板', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsTopFix', N'zh-CN', N'顶部固定', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@LastUpdateByName', N'zh-CN', N'更新人', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@LayoutID', N'zh-CN', N'布局', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Logo', N'en-GB', N'Logo', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Logo', N'en-US', N'Logo', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Logo', N'zh-CN', N'Logo', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@PageID', N'zh-CN', N'页面', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@PartDriver', N'zh-CN', N'PartDriver', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@PartialView', N'en-GB', N'Partial View', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@PartialView', N'en-US', N'Partial View', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@PartialView', N'zh-CN', N'显示模板', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Position', N'en-GB', N'Position', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Position', N'en-US', N'Position', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Position', N'zh-CN', N'排序', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@RootID', N'en-GB', N'Root', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@RootID', N'en-US', N'Root', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@RootID', N'zh-CN', N'根结点', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ServiceTypeName', N'en-GB', N'Service Type Name', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ServiceTypeName', N'en-US', N'Service Type Name', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ShowBasket', N'en-GB', N'Show Basket', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ShowBasket', N'en-US', N'Show Basket', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ShowBasket', N'zh-CN', N'显示购物车？', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Status', N'zh-CN', N'状态', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@StyleClass', N'en-GB', N'Style Class', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@StyleClass', N'en-US', N'Style Class', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@StyleClass', N'zh-CN', N'自定义样式', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Thumbnail', N'en-GB', N'Thumbnail', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Thumbnail', N'en-US', N'Thumbnail', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Title', N'en-GB', N'Title', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Title', N'en-US', N'Title', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Title', N'zh-CN', N'标题', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ViewModelTypeName', N'en-GB', N'View Model Type Name', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ViewModelTypeName', N'en-US', N'View Model Type Name', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@WidgetName', N'en-GB', N'Widget Name', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@WidgetName', N'en-US', N'Widget Name', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@WidgetName', N'zh-CN', N'组件名称', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ZoneID', N'en-GB', N'Zone', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ZoneID', N'en-US', N'Zone', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ZoneID', N'zh-CN', N'区域', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'OAuthWidget@QQ', N'zh-CN', N'QQ?', N'OAuthWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'OAuthWidget@Redirect', N'zh-CN', N'跳转地址', N'OAuthWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'OAuthWidget@WeChat', N'zh-CN', N'微信?', N'OAuthWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'OAuthWidget@WeiBo', N'zh-CN', N'微博?', N'OAuthWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ActionType', N'zh-CN', N'ActionType', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CompletePayTime', N'zh-CN', N'完成支付时间', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Contact', N'en-GB', N'Contact', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Contact', N'en-US', N'Contact', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Contact', N'zh-CN', N'联系人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreateBy', N'zh-CN', N'CreateBy', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreatebyName', N'zh-CN', N'创建人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreateDate', N'en-GB', N'Create Date', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreateDate', N'en-US', N'Create Date', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreateDate', N'zh-CN', N'创建日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Description', N'zh-CN', N'描述', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ID', N'zh-CN', N'订单号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateByName', N'en-GB', N'Last Update By Name', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateByName', N'en-US', N'Last Update By Name', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateByName', N'zh-CN', N'更新人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateDate', N'en-GB', N'Last Update Date', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateDate', N'en-US', N'Last Update Date', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateDate', N'zh-CN', N'更新日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LogisticsCompany', N'zh-CN', N'快递公司', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@OrderStatus', N'en-GB', N'Order Status', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@OrderStatus', N'en-US', N'Order Status', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@OrderStatus', N'zh-CN', N'订单状态', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PaymentGateway', N'zh-CN', N'支付方式', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PaymentID', N'zh-CN', N'支付ID', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PayTime', N'zh-CN', N'发起支付时间', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PhoneNumber', N'en-GB', N'Phone Number', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PhoneNumber', N'en-US', N'Phone Number', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PhoneNumber', N'zh-CN', N'电话', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Refund', N'zh-CN', N'退款金额', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundDate', N'zh-CN', N'退款日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundID', N'zh-CN', N'退款流水号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundReason', N'zh-CN', N'退款原因', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ShippingAddress', N'en-GB', N'Shipping Address', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ShippingAddress', N'en-US', N'Shipping Address', N'Order', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ShippingAddress', N'zh-CN', N'收货地址', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Status', N'zh-CN', N'状态', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Title', N'zh-CN', N'标题', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Total', N'en-GB', N'Total', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Total', N'en-US', N'Total', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Total', N'zh-CN', N'总价', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@TrackingNumber', N'zh-CN', N'快递单号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@UserId', N'zh-CN', N'登录名', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ActionType', N'zh-CN', N'ActionType', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Content', N'zh-CN', N'Content', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@CreateBy', N'zh-CN', N'CreateBy', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@CreatebyName', N'zh-CN', N'创建人', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@CreateDate', N'zh-CN', N'创建日期', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Description', N'en-GB', N'Description', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Description', N'en-US', N'Description', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Description', N'zh-CN', N'描述', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@DisplayOrder', N'zh-CN', N'排序', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ExtendFields', N'zh-CN', N'扩展属性', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Favicon', N'zh-CN', N'Favicon', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ID', N'zh-CN', N'ID', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsHomePage', N'en-GB', N'Is Home Page', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsHomePage', N'en-US', N'Is Home Page', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsHomePage', N'zh-CN', N'首页?', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsPublish', N'en-GB', N'Is Publish', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsPublish', N'en-US', N'Is Publish', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsPublish', N'zh-CN', N'已发布?', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsPublishedPage', N'en-GB', N'Is Published Page', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsPublishedPage', N'en-US', N'Is Published Page', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsPublishedPage', N'zh-CN', N'IsPublishedPage', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsTemplate', N'en-GB', N'Is Template', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsTemplate', N'en-US', N'Is Template', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsTemplate', N'zh-CN', N'保存为模板', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LastUpdateByName', N'zh-CN', N'更新人', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LayoutId', N'en-GB', N'Layout', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LayoutId', N'en-US', N'Layout', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LayoutId', N'zh-CN', N'布局', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@MetaDescription', N'en-GB', N'Meta Description', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@MetaDescription', N'en-US', N'Meta Description', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@MetaDescription', N'zh-CN', N'SEO描述', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@MetaKeyWorlds', N'en-GB', N'Meta Key Worlds', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@MetaKeyWorlds', N'en-US', N'Meta Key Worlds', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@MetaKeyWorlds', N'zh-CN', N'SEO关键字', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PageName', N'en-GB', N'Page Name', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PageName', N'en-US', N'Page Name', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PageName', N'zh-CN', N'名称', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PageUrl', N'en-GB', N'Page Url', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PageUrl', N'en-US', N'Page Url', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PageUrl', N'zh-CN', N'页面地址', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ParentId', N'zh-CN', N'ParentId', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PublishDate', N'zh-CN', N'发布日期', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ReferencePageID', N'zh-CN', N'ReferencePageID', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Script', N'en-GB', N'Script', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Script', N'en-US', N'Script', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Script', N'zh-CN', N'脚本', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Status', N'en-GB', N'Status', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Status', N'en-US', N'Status', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Status', N'zh-CN', N'状态', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Style', N'en-GB', N'Style', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Style', N'en-US', N'Style', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Style', N'zh-CN', N'样式', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Title', N'en-GB', N'Title', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Title', N'en-US', N'Title', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Title', N'zh-CN', N'标题', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Url', N'zh-CN', N'Url', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ParallaxWidget@ImageUrl', N'zh-CN', N'图片', N'ParallaxWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@ActionType', N'zh-CN', N'ActionType', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@CreateBy', N'zh-CN', N'CreateBy', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@CreatebyName', N'zh-CN', N'创建人', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@CreateDate', N'zh-CN', N'创建日期', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Description', N'en-GB', N'Description', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Description', N'en-US', N'Description', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Description', N'zh-CN', N'描述', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@ID', N'zh-CN', N'ID', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@LastUpdateByName', N'zh-CN', N'更新人', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@ParentID', N'en-GB', N'Parent', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@ParentID', N'en-US', N'Parent', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@ParentID', N'zh-CN', N'ParentID', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Status', N'en-GB', N'Status', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Status', N'en-US', N'Status', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Status', N'zh-CN', N'状态', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Title', N'en-GB', N'Title', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Title', N'en-US', N'Title', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Title', N'zh-CN', N'标题', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Url', N'en-GB', N'Url', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Url', N'en-US', N'Url', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Url', N'zh-CN', N'英文名', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ActionType', N'zh-CN', N'ActionType', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CreateBy', N'zh-CN', N'CreateBy', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CreatebyName', N'zh-CN', N'创建人', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CreateDate', N'zh-CN', N'创建日期', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CustomClass', N'zh-CN', N'CustomClass', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Description', N'zh-CN', N'描述', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@FormView', N'zh-CN', N'FormView', N'ProductCategoryWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ID', N'zh-CN', N'ID', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@IsSystem', N'zh-CN', N'IsSystem', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@LayoutID', N'zh-CN', N'LayoutID', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@PageID', N'zh-CN', N'PageID', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@PartialView', N'zh-CN', N'显示模板', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Position', N'zh-CN', N'排序', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ProductCategoryID', N'zh-CN', N'产品类别', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Status', N'zh-CN', N'状态', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@StyleClass', N'zh-CN', N'自定义样式', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@TargetPage', N'zh-CN', N'详细页面', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Title', N'zh-CN', N'标题', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@WidgetName', N'zh-CN', N'组件名称', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ZoneID', N'zh-CN', N'区域', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ActionType', N'zh-CN', N'ActionType', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CreateBy', N'zh-CN', N'CreateBy', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CreatebyName', N'zh-CN', N'创建人', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CreateDate', N'zh-CN', N'创建日期', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CustomClass', N'zh-CN', N'CustomClass', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CustomerClass', N'zh-CN', N'CustomerClass', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Description', N'zh-CN', N'描述', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@FormView', N'zh-CN', N'FormView', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ID', N'zh-CN', N'ID', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@IsSystem', N'zh-CN', N'IsSystem', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@LayoutID', N'zh-CN', N'LayoutID', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@PageID', N'zh-CN', N'PageID', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@PartialView', N'zh-CN', N'显示模板', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Position', N'zh-CN', N'排序', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Status', N'zh-CN', N'状态', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@StyleClass', N'zh-CN', N'自定义样式', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Title', N'zh-CN', N'标题', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@WidgetName', N'zh-CN', N'组件名称', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ZoneID', N'zh-CN', N'区域', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ActionType', N'zh-CN', N'ActionType', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@BrandCD', N'zh-CN', N'BrandCD', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Color', N'zh-CN', N'颜色', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreateBy', N'zh-CN', N'CreateBy', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreatebyName', N'en-GB', N'Createby Name', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreatebyName', N'en-US', N'Createby Name', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreatebyName', N'zh-CN', N'创建人', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreateDate', N'en-GB', N'Create Date', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreateDate', N'en-US', N'Create Date', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreateDate', N'zh-CN', N'创建日期', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Description', N'zh-CN', N'描述', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ExtendFields', N'zh-CN', N'扩展属性', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ID', N'zh-CN', N'ID', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ImageThumbUrl', N'zh-CN', N'缩略图', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ImageUrl', N'zh-CN', N'图片', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@IsPublish', N'zh-CN', N'已发布?', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateByName', N'en-GB', N'Last Update By Name', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateByName', N'en-US', N'Last Update By Name', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateByName', N'zh-CN', N'更新人', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateDate', N'en-GB', N'Last Update Date', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateDate', N'en-US', N'Last Update Date', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Norm', N'zh-CN', N'规格', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@OrderIndex', N'zh-CN', N'排序', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@PartNumber', N'en-GB', N'Part Number', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@PartNumber', N'en-US', N'Part Number', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@PartNumber', N'zh-CN', N'型号', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Price', N'zh-CN', N'价格', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductCategoryID', N'en-GB', N'Product Category', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductCategoryID', N'en-US', N'Product Category', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductCategoryID', N'zh-CN', N'产品类别', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductContent', N'zh-CN', N'详细内容', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductEntityCategory', N'zh-CN', N'产品类别', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductEntityCategoryID', N'zh-CN', N'产品类别', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductEntityContent', N'zh-CN', N'描述', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductImages', N'zh-CN', N'展示图', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductTags', N'zh-CN', N'标签', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@PublishDate', N'zh-CN', N'发布日期', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@PurchasePrice', N'zh-CN', N'成本价', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@RebatePrice', N'zh-CN', N'折扣价', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@SEODescription', N'zh-CN', N'SEO描述', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@SEOKeyWord', N'zh-CN', N'SEO关键字', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@SEOTitle', N'zh-CN', N'SEO标题', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ShelfLife', N'zh-CN', N'保质期', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@SourceFrom', N'zh-CN', N'来源', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Status', N'en-GB', N'Status', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Status', N'en-US', N'Status', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Status', N'zh-CN', N'状态', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@TargetFrom', N'zh-CN', N'其它网站', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@TargetUrl', N'zh-CN', N'网站网址', N'ProductEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Title', N'en-GB', N'Title', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Title', N'en-US', N'Title', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Title', N'zh-CN', N'标题', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Url', N'zh-CN', N'英文名', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ActionType', N'zh-CN', N'ActionType', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@CreateBy', N'zh-CN', N'CreateBy', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@CreatebyName', N'zh-CN', N'创建人', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@CreateDate', N'zh-CN', N'创建日期', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Description', N'zh-CN', N'描述', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ID', N'zh-CN', N'ID', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ImageUrl', N'zh-CN', N'图片', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@LastUpdateByName', N'zh-CN', N'更新人', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ProductId', N'zh-CN', N'ProductId', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Status', N'zh-CN', N'状态', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Title', N'zh-CN', N'标题', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ActionType', N'zh-CN', N'ActionType', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Columns', N'zh-CN', N'显示列', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CreateBy', N'zh-CN', N'CreateBy', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CreatebyName', N'zh-CN', N'创建人', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CreateDate', N'zh-CN', N'创建日期', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CustomClass', N'zh-CN', N'CustomClass', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Description', N'zh-CN', N'描述', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@DetailPageUrl', N'zh-CN', N'详细页面', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ExtendData', N'zh-CN', N'ExtendData', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@FormView', N'zh-CN', N'FormView', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ID', N'zh-CN', N'ID', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@IsPageable', N'zh-CN', N'分页?', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@IsSystem', N'zh-CN', N'IsSystem', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@LayoutID', N'zh-CN', N'LayoutID', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@PageID', N'zh-CN', N'PageID', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@PageSize', N'zh-CN', N'分页大小', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@PartialView', N'zh-CN', N'显示模板', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Position', N'zh-CN', N'排序', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ProductCategoryID', N'zh-CN', N'产品类别', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Status', N'zh-CN', N'状态', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@StyleClass', N'zh-CN', N'自定义样式', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Title', N'zh-CN', N'标题', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@WidgetName', N'zh-CN', N'组件名称', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ZoneID', N'zh-CN', N'区域', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Robots@Content', N'zh-CN', N'内容', N'Robots', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@ActionType', N'zh-CN', N'ActionType', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreateBy', N'zh-CN', N'CreateBy', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreatebyName', N'en-GB', N'Createby Name', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreatebyName', N'en-US', N'Createby Name', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreatebyName', N'zh-CN', N'创建人', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreateDate', N'en-GB', N'Create Date', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreateDate', N'en-US', N'Create Date', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreateDate', N'zh-CN', N'创建日期', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Description', N'zh-CN', N'描述', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@ID', N'zh-CN', N'ID', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateByName', N'en-GB', N'Last Update By Name', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateByName', N'en-US', N'Last Update By Name', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateByName', N'zh-CN', N'更新人', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateDate', N'en-GB', N'Last Update Date', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateDate', N'en-US', N'Last Update Date', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Permissions', N'zh-CN', N'Permissions', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Status', N'en-GB', N'Status', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Status', N'en-US', N'Status', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Status', N'zh-CN', N'状态', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Title', N'en-GB', N'Title', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Title', N'en-US', N'Title', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Title', N'zh-CN', N'标题', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Description', N'en-GB', N'Description', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Description', N'en-US', N'Description', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Description', N'zh-CN', N'描述', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleID', N'en-GB', N'Rule', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleID', N'en-US', N'Rule', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleID', N'zh-CN', N'RuleID', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleItemList', N'en-GB', N'Rule Item List', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleItemList', N'en-US', N'Rule Item List', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleItemList', N'zh-CN', N'条件组', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Status', N'en-GB', N'Status', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Status', N'en-US', N'Status', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Status', N'zh-CN', N'状态', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Title', N'en-GB', N'Title', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Title', N'en-US', N'Title', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Title', N'zh-CN', N'标题', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@ZoneName', N'en-GB', N'Zone Name', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@ZoneName', N'en-US', N'Zone Name', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@ZoneName', N'zh-CN', N'显示区域', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Condition', N'en-GB', N'Condition', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Condition', N'en-US', N'Condition', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Condition', N'zh-CN', N'条件', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@FunctionName', N'en-GB', N'Function Name', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@FunctionName', N'en-US', N'Function Name', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@FunctionName', N'zh-CN', N'运算方式', N'RuleItem', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Property', N'en-GB', N'Property', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Property', N'en-US', N'Property', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Property', N'zh-CN', N'属性', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Value', N'en-GB', N'Value', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Value', N'en-US', N'Value', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Value', N'zh-CN', N'值', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ActionType', N'zh-CN', N'ActionType', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CreateBy', N'zh-CN', N'CreateBy', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CreatebyName', N'zh-CN', N'创建人', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CreateDate', N'zh-CN', N'创建日期', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CustomClass', N'zh-CN', N'CustomClass', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Description', N'zh-CN', N'描述', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@FormView', N'zh-CN', N'FormView', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ID', N'zh-CN', N'ID', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@IsSystem', N'zh-CN', N'IsSystem', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@LayoutID', N'zh-CN', N'LayoutID', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@PageID', N'zh-CN', N'PageID', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@PartialView', N'zh-CN', N'显示模板', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Position', N'zh-CN', N'排序', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Script', N'zh-CN', N'脚本', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Status', N'zh-CN', N'状态', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@StyleClass', N'zh-CN', N'自定义样式', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Title', N'zh-CN', N'标题', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@WidgetName', N'zh-CN', N'组件名称', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ZoneID', N'zh-CN', N'区域', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@ActionType', N'zh-CN', N'ActionType', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@CreateBy', N'zh-CN', N'CreateBy', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@CreatebyName', N'zh-CN', N'创建人', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@CreateDate', N'zh-CN', N'创建日期', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@Description', N'zh-CN', N'描述', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@ID', N'zh-CN', N'ID', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@Order', N'zh-CN', N'排序', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@Status', N'zh-CN', N'状态', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@Title', N'zh-CN', N'标题', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@ActionType', N'zh-CN', N'ActionType', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@CreatebyName', N'zh-CN', N'创建人', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@CreateDate', N'zh-CN', N'创建日期', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Description', N'zh-CN', N'描述', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Href', N'zh-CN', N'链接', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@ID', N'zh-CN', N'ID', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@InnerText', N'zh-CN', N'标题', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Order', N'zh-CN', N'排序', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Status', N'zh-CN', N'状态', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Title', N'zh-CN', N'标题', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ActionType', N'zh-CN', N'ActionType', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@CreatebyName', N'zh-CN', N'创建人', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@CreateDate', N'zh-CN', N'创建日期', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Description', N'zh-CN', N'描述', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Height', N'zh-CN', N'高度(px)', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Href', N'zh-CN', N'链接', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ID', N'zh-CN', N'ID', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ImageAlt', N'zh-CN', N'说明', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ImageSrc', N'zh-CN', N'图片', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ImageTitle', N'zh-CN', N'标题', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Order', N'zh-CN', N'排序', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Status', N'zh-CN', N'状态', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Title', N'zh-CN', N'标题', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Width', N'zh-CN', N'宽度(px)', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@ActionType', N'zh-CN', N'ActionType', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@CreatebyName', N'zh-CN', N'创建人', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@CreateDate', N'zh-CN', N'创建日期', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@Description', N'zh-CN', N'描述', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@HtmlContent', N'zh-CN', N'内容', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@ID', N'zh-CN', N'ID', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@Order', N'zh-CN', N'排序', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentParagraph', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@Status', N'zh-CN', N'状态', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@Title', N'zh-CN', N'标题', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@ActionType', N'zh-CN', N'ActionType', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@CreatebyName', N'zh-CN', N'创建人', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@CreateDate', N'zh-CN', N'创建日期', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Description', N'zh-CN', N'描述', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Href', N'zh-CN', N'链接', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@ID', N'zh-CN', N'ID', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@InnerText', N'zh-CN', N'标题', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Order', N'zh-CN', N'排序', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Status', N'zh-CN', N'状态', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Title', N'zh-CN', N'标题', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@TitleLevel', N'zh-CN', N'等级', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@ActionType', N'zh-CN', N'ActionType', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Code', N'zh-CN', N'视频代码', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@CreatebyName', N'zh-CN', N'CreatebyName', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@CreateDate', N'zh-CN', N'CreateDate', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Description', N'zh-CN', N'描述', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Height', N'zh-CN', N'高度(px)', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@ID', N'zh-CN', N'ID', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Order', N'zh-CN', N'Order', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Status', N'zh-CN', N'状态', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Thumbnail', N'zh-CN', N'缩略图', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Title', N'zh-CN', N'Title', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Url', N'zh-CN', N'视频地址(MP4)', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@VideoTitle', N'zh-CN', N'标题', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Width', N'zh-CN', N'宽度(px)', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@ActionType', N'zh-CN', N'ActionType', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CallToAction', N'zh-CN', N'CallToAction', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CallToActions', N'zh-CN', N'CallToActions', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CreateBy', N'zh-CN', N'CreateBy', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CreatebyName', N'zh-CN', N'创建人', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CreateDate', N'zh-CN', N'创建日期', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Description', N'zh-CN', N'描述', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@GroupName', N'zh-CN', N'组名', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@ID', N'zh-CN', N'ID', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@IsLoadDefaultData', N'zh-CN', N'IsLoadDefaultData', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@LastUpdateByName', N'zh-CN', N'更新人', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Order', N'zh-CN', N'排序', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Paragraph', N'zh-CN', N'Paragraph', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Paragraphs', N'zh-CN', N'Paragraphs', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@PartialView', N'zh-CN', N'显示模板', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@PercentWidth', N'zh-CN', N'栅格列', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionContents', N'zh-CN', N'SectionContents', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionImage', N'zh-CN', N'SectionImage', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionImages', N'zh-CN', N'SectionImages', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionTitle', N'zh-CN', N'SectionTitle', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionTitles', N'zh-CN', N'SectionTitles', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Status', N'zh-CN', N'状态', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Title', N'zh-CN', N'标题', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ActionType', N'zh-CN', N'ActionType', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CreateBy', N'zh-CN', N'CreateBy', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CreatebyName', N'zh-CN', N'创建人', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CreateDate', N'zh-CN', N'创建日期', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CustomClass', N'zh-CN', N'CustomClass', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Description', N'zh-CN', N'描述', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ExtendData', N'zh-CN', N'ExtendData', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ExtendFields', N'zh-CN', N'扩展属性', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@FormView', N'zh-CN', N'FormView', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Groups', N'zh-CN', N'Groups', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ID', N'zh-CN', N'ID', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@IsHorizontal', N'zh-CN', N'水平分组', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@IsSystem', N'zh-CN', N'IsSystem', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@IsTemplate', N'zh-CN', N'保存为模板', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@LastUpdateByName', N'zh-CN', N'更新人', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@LayoutID', N'zh-CN', N'布局', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@PageID', N'zh-CN', N'页面', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@PartDriver', N'zh-CN', N'PartDriver', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@PartialView', N'zh-CN', N'显示模板', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Position', N'zh-CN', N'排序', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@SectionTitle', N'zh-CN', N'标题', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Status', N'zh-CN', N'状态', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@StyleClass', N'zh-CN', N'自定义样式', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Template', N'zh-CN', N'Template', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Title', N'zh-CN', N'标题', N'SectionWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@WidgetName', N'zh-CN', N'组件名称', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ZoneID', N'zh-CN', N'区域', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SEO优化', N'en-GB', N'SEO', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SEO优化', N'en-US', N'SEO', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@IsSystem', N'zh-CN', N'IsSystem', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@IsTemplate', N'zh-CN', N'保存为模板', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@PartialView', N'zh-CN', N'显示模板', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@Position', N'zh-CN', N'排序', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@SearchEngine', N'zh-CN', N'搜索引擎', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@SearchQuery', N'zh-CN', N'Search Query', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@StyleClass', N'zh-CN', N'自定义样式', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@Title', N'zh-CN', N'标题', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@WidgetName', N'zh-CN', N'组件名称', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@ZoneID', N'zh-CN', N'区域', N'SiteSearchWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@Email', N'zh-CN', N'邮箱', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@EnableSsl', N'zh-CN', N'启用SSL', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@Host', N'zh-CN', N'服务器', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@PassWord', N'zh-CN', N'密码', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@Port', N'zh-CN', N'端口', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@ActionType', N'zh-CN', N'ActionType', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@ContactName', N'zh-CN', N'ContactName', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@CreateBy', N'zh-CN', N'CreateBy', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@CreatebyName', N'zh-CN', N'CreatebyName', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@CreateDate', N'zh-CN', N'CreateDate', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Description', N'zh-CN', N'描述', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Host', N'zh-CN', N'Host', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@IpAddress', N'zh-CN', N'IpAddress', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@StatisticsId', N'zh-CN', N'StatisticsId', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Status', N'zh-CN', N'状态', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Tel', N'zh-CN', N'Tel', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Title', N'zh-CN', N'标题', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StatisticsScript@Location', N'zh-CN', N'位置', N'GlobalScripts', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StatisticsScript@Script', N'zh-CN', N'脚本', N'StatisticsScript', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StrongPoint@Description', N'zh-CN', N'描述', N'StrongPoint', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StrongPoint@Title', N'zh-CN', N'名称', N'StrongPoint', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ActionType', N'zh-CN', N'ActionType', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CreateBy', N'zh-CN', N'CreateBy', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CreatebyName', N'zh-CN', N'创建人', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CreateDate', N'zh-CN', N'创建日期', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CustomClass', N'zh-CN', N'CustomClass', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Description', N'zh-CN', N'描述', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ExtendFields', N'zh-CN', N'扩展属性', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@FormView', N'zh-CN', N'FormView', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ID', N'zh-CN', N'ID', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@IsSystem', N'zh-CN', N'IsSystem', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@IsTemplate', N'zh-CN', N'保存为模板', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@LastUpdateByName', N'zh-CN', N'更新人', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@LayoutID', N'zh-CN', N'LayoutID', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@PageID', N'zh-CN', N'PageID', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@PartDriver', N'zh-CN', N'PartDriver', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@PartialView', N'zh-CN', N'显示模板', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Position', N'zh-CN', N'排序', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Status', N'zh-CN', N'状态', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@StyleClass', N'zh-CN', N'自定义样式', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@StyleSheet', N'zh-CN', N'样式', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Title', N'zh-CN', N'标题', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@WidgetName', N'zh-CN', N'组件名称', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ZoneID', N'zh-CN', N'区域', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'TemplateFile@Content', N'zh-CN', N'模板代码', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'TemplateFile@Id', N'zh-CN', N'ID', N'TemplateFile', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'TemplateFile@LastUpdateTime', N'zh-CN', N'最后更新时间', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'TemplateFile@Name', N'zh-CN', N'名称', N'TemplateFile', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'TemplateFile@RelativePath', N'zh-CN', N'模板路径', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'TemplateFile@ThemeName', N'zh-CN', N'主题', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@ActionType', N'zh-CN', N'ActionType', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@CreateBy', N'zh-CN', N'CreateBy', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@CreatebyName', N'zh-CN', N'CreatebyName', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@CreateDate', N'zh-CN', N'CreateDate', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Description', N'zh-CN', N'描述', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@ID', N'zh-CN', N'ID', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@IsActived', N'zh-CN', N'IsActived', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@IsPreView', N'zh-CN', N'IsPreView', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Status', N'zh-CN', N'状态', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Thumbnail', N'zh-CN', N'Thumbnail', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Title', N'zh-CN', N'标题', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Url', N'zh-CN', N'Url', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@UrlDebugger', N'zh-CN', N'UrlDebugger', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@ActionType', N'zh-CN', N'ActionType', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreateBy', N'zh-CN', N'CreateBy', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreatebyName', N'en-GB', N'Createby Name', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreatebyName', N'en-US', N'Createby Name', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreatebyName', N'zh-CN', N'创建人', N'UrlRedirect', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreateDate', N'en-GB', N'Create Date', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreateDate', N'en-US', N'Create Date', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreateDate', N'zh-CN', N'创建日期', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Description', N'en-GB', N'Description', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Description', N'en-US', N'Description', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Description', N'zh-CN', N'描述', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@DestinationURL', N'en-GB', N'Destination Url', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@DestinationURL', N'en-US', N'Destination Url', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@DestinationURL', N'zh-CN', N'跳转地址', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@ID', N'zh-CN', N'ID', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@InComingUrl', N'en-GB', N'In Coming Url', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@InComingUrl', N'en-US', N'In Coming Url', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@InComingUrl', N'zh-CN', N'访问地址', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@IsPermanent', N'en-GB', N'Is Permanent', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@IsPermanent', N'en-US', N'Is Permanent', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@IsPermanent', N'zh-CN', N'永久？', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateByName', N'en-GB', N'Last Update By Name', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateByName', N'en-US', N'Last Update By Name', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateByName', N'zh-CN', N'更新人', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateDate', N'en-GB', N'Last Update Date', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateDate', N'en-US', N'Last Update Date', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateDate', N'zh-CN', N'更新日期', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Status', N'en-GB', N'Status', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Status', N'en-US', N'Status', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Status', N'zh-CN', N'状态', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Title', N'en-GB', N'Title', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Title', N'en-US', N'Title', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Title', N'zh-CN', N'标题', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Url参数', N'en-GB', N'Query String', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Url参数', N'en-US', N'Query String', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'URL重定向', N'en-GB', N'Url  Redirect', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'URL重定向', N'en-US', N'Url  Redirect', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ActionType', N'zh-CN', N'ActionType', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Address', N'en-GB', N'Address', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Address', N'en-US', N'Address', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Address', N'zh-CN', N'地址', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Age', N'en-GB', N'Age', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Age', N'en-US', N'Age', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Age', N'zh-CN', N'年龄', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ApiLoginToken', N'zh-CN', N'ApiLoginToken', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@AuthenticationType', N'zh-CN', N'AuthenticationType', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Birthday', N'en-GB', N'Birthday', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Birthday', N'en-US', N'Birthday', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Birthday', N'zh-CN', N'出生日期', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Birthplace', N'en-GB', N'Birthplace', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Birthplace', N'en-US', N'Birthplace', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Birthplace', N'zh-CN', N'出生地', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreateBy', N'zh-CN', N'CreateBy', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreatebyName', N'en-GB', N'Createby Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreatebyName', N'en-US', N'Createby Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreatebyName', N'zh-CN', N'创建人', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreateDate', N'en-GB', N'Create Date', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreateDate', N'en-US', N'Create Date', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreateDate', N'zh-CN', N'创建日期', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Description', N'en-GB', N'Description', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Description', N'en-US', N'Description', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Description', N'zh-CN', N'描述', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Email', N'en-GB', N'Email', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Email', N'en-US', N'Email', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Email', N'zh-CN', N'邮箱', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@EnglishName', N'en-GB', N'English Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@EnglishName', N'en-US', N'English Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@EnglishName', N'zh-CN', N'英文名', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@FirstName', N'en-GB', N'First Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@FirstName', N'en-US', N'First Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@FirstName', N'zh-CN', N'名', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Hobby', N'en-GB', N'Hobby', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Hobby', N'en-US', N'Hobby', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Hobby', N'zh-CN', N'爱好', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ID', N'zh-CN', N'ID', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@IsAuthenticated', N'zh-CN', N'IsAuthenticated', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastLoginDate', N'zh-CN', N'最后登录时间', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastName', N'en-GB', N'Last Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastName', N'en-US', N'Last Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastName', N'zh-CN', N'姓', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateByName', N'en-GB', N'Last Update By Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateByName', N'en-US', N'Last Update By Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateByName', N'zh-CN', N'更新人', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateDate', N'en-GB', N'Last Update Date', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateDate', N'en-US', N'Last Update Date', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LoginIP', N'zh-CN', N'LoginIP', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@MaritalStatus', N'en-GB', N'Marital Status', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@MaritalStatus', N'en-US', N'Marital Status', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@MaritalStatus', N'zh-CN', N'婚姻情况', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@MobilePhone', N'en-GB', N'Mobile Phone', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@MobilePhone', N'en-US', N'Mobile Phone', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@MobilePhone', N'zh-CN', N'手机号码', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Name', N'zh-CN', N'Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@NickName', N'en-GB', N'Nick Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@NickName', N'en-US', N'Nick Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@NickName', N'zh-CN', N'昵称', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PassWord', N'zh-CN', N'PassWord', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PassWordNew', N'en-GB', N'Pass Word New', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PassWordNew', N'en-US', N'Pass Word New', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PassWordNew', N'zh-CN', N'密码', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PhotoUrl', N'en-GB', N'Photo Url', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PhotoUrl', N'en-US', N'Photo Url', N'UserEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PhotoUrl', N'zh-CN', N'头像', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Profession', N'en-GB', N'Profession', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Profession', N'en-US', N'Profession', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Profession', N'zh-CN', N'专业技能', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@QQ', N'en-GB', N'QQ', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@QQ', N'en-US', N'QQ', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@QQ', N'zh-CN', N'QQ', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ResetToken', N'zh-CN', N'ResetToken', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ResetTokenDate', N'zh-CN', N'ResetTokenDate', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Roles', N'en-GB', N'Roles', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Roles', N'en-US', N'Roles', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Roles', N'zh-CN', N'角色', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@School', N'en-GB', N'School', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@School', N'en-US', N'School', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@School', N'zh-CN', N'学校', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Sex', N'en-GB', N'Sex', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Sex', N'en-US', N'Sex', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Sex', N'zh-CN', N'性别', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Status', N'en-GB', N'Status', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Status', N'en-US', N'Status', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Status', N'zh-CN', N'状态', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Telephone', N'en-GB', N'Telephone', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Telephone', N'en-US', N'Telephone', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Telephone', N'zh-CN', N'联系电话', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Timestamp', N'en-GB', N'Timestamp', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Timestamp', N'en-US', N'Timestamp', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Timestamp', N'zh-CN', N'Timestamp', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Title', N'zh-CN', N'标题', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserID', N'en-GB', N'User', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserID', N'en-US', N'User', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserID', N'zh-CN', N'登录名', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserName', N'en-GB', N'User Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserName', N'en-US', N'User Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserName', N'zh-CN', N'用户名', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserTypeCD', N'en-GB', N'User Type', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserTypeCD', N'en-US', N'User Type', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserTypeCD', N'zh-CN', N'用户类别', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ZipCode', N'en-GB', N'Zip Code', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ZipCode', N'en-US', N'Zip Code', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ZipCode', N'zh-CN', N'邮编', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@ActionType', N'zh-CN', N'ActionType', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@CreateBy', N'zh-CN', N'CreateBy', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@CreatebyName', N'zh-CN', N'创建人', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@CreateDate', N'zh-CN', N'创建日期', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@Description', N'zh-CN', N'描述', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@ID', N'zh-CN', N'ID', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@LastUpdateByName', N'zh-CN', N'更新人', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@LastUpdateDate', N'zh-CN', N'更新日期', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@RoleID', N'en-GB', N'Role', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@RoleID', N'en-US', N'Role', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@RoleID', N'zh-CN', N'角色', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@Status', N'zh-CN', N'状态', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@Title', N'zh-CN', N'标题', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@UserID', N'zh-CN', N'登录名', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ActionType', N'zh-CN', N'ActionType', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Code', N'zh-CN', N'视频代码', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CreateBy', N'zh-CN', N'CreateBy', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CreatebyName', N'zh-CN', N'CreatebyName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CreateDate', N'zh-CN', N'CreateDate', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CustomClass', N'zh-CN', N'CustomClass', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Description', N'zh-CN', N'描述', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ExtendFields', N'zh-CN', N'扩展属性', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@FormView', N'zh-CN', N'FormView', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Height', N'zh-CN', N'高度(px)', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ID', N'zh-CN', N'ID', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@IsSystem', N'zh-CN', N'IsSystem', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@IsTemplate', N'zh-CN', N'保存为模板', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@LayoutID', N'zh-CN', N'LayoutID', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@PageID', N'zh-CN', N'PageID', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@PartialView', N'zh-CN', N'显示模板', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Position', N'zh-CN', N'排序', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Status', N'zh-CN', N'状态', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@StyleClass', N'zh-CN', N'自定义样式', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Title', N'zh-CN', N'标题', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Url', N'zh-CN', N'视频地址(MP4)', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@WidgetName', N'zh-CN', N'组件名称', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Width', N'zh-CN', N'宽度(px)', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ZoneID', N'zh-CN', N'区域', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ActionType', N'zh-CN', N'ActionType', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@AssemblyName', N'zh-CN', N'AssemblyName', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CreateBy', N'zh-CN', N'CreateBy', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CreatebyName', N'zh-CN', N'创建人', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CreateDate', N'zh-CN', N'创建日期', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CustomClass', N'zh-CN', N'CustomClass', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CustomStyle', N'zh-CN', N'CustomStyle', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Description', N'zh-CN', N'描述', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ExtendFields', N'zh-CN', N'扩展属性', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@FormView', N'zh-CN', N'FormView', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ID', N'zh-CN', N'ID', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@IsSystem', N'zh-CN', N'IsSystem', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@IsTemplate', N'zh-CN', N'保存为模板', N'WidgetBase', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@LastUpdateByName', N'zh-CN', N'更新人', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@LastUpdateDate', N'zh-CN', N'更新日期', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@LayoutID', N'zh-CN', N'布局', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@PageID', N'zh-CN', N'页面', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@PartDriver', N'zh-CN', N'PartDriver', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@PartialView', N'zh-CN', N'显示模板', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Position', N'zh-CN', N'排序', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Status', N'zh-CN', N'状态', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@StyleClass', N'zh-CN', N'自定义样式', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Thumbnail', N'zh-CN', N'模板缩略图', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Title', N'zh-CN', N'标题', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@WidgetName', N'zh-CN', N'组件名称', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ZoneID', N'zh-CN', N'区域', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@ActionType', N'zh-CN', N'ActionType', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@AssemblyName', N'zh-CN', N'AssemblyName', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@CreateBy', N'zh-CN', N'CreateBy', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@CreatebyName', N'zh-CN', N'创建人', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@CreateDate', N'zh-CN', N'创建日期', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Description', N'zh-CN', N'描述', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@FormView', N'zh-CN', N'FormView', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@GroupName', N'zh-CN', N'组名', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@ID', N'zh-CN', N'ID', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@LastUpdateByName', N'zh-CN', N'更新人', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Order', N'zh-CN', N'排序', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@PartialView', N'zh-CN', N'显示模板', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Status', N'zh-CN', N'状态', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Thumbnail', N'zh-CN', N'Thumbnail', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Title', N'zh-CN', N'标题', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@ActionType', N'zh-CN', N'ActionType', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@CreateBy', N'zh-CN', N'CreateBy', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@CreatebyName', N'zh-CN', N'创建人', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@CreateDate', N'zh-CN', N'创建日期', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@Description', N'zh-CN', N'描述', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@HeadingCode', N'zh-CN', N'HeadingCode', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@ID', N'zh-CN', N'ID', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@LastUpdateByName', N'zh-CN', N'更新人', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@LayoutId', N'zh-CN', N'布局', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@Status', N'zh-CN', N'状态', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@Title', N'zh-CN', N'标题', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@ZoneName', N'zh-CN', N'ZoneName', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'爱好', N'en-GB', N'Hobby', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'爱好', N'en-US', N'Hobby', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'安全退出', N'en-GB', N'Sign out', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'安全退出', N'en-US', N'Sign out', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'安装板块', N'en-GB', N'Upload Section', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'安装板块', N'en-US', N'Upload Section', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'安装主题', N'en-GB', N'Install', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'安装主题', N'en-US', N'Install', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'按回车保存', N'en-GB', N'Press Enter to save', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'按回车保存', N'en-US', N'Press Enter to save', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'百度地图', N'en-GB', N'Map', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'百度地图', N'en-US', N'Map', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'版本', N'en-GB', N'Version', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'版本', N'en-US', N'Version', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'包含', N'en-GB', N'Contains', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'包含', N'en-US', N'Contains', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'保存', N'en-GB', N'Save', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'保存', N'en-US', N'Save', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'保存修改', N'en-GB', N'Save', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'保存修改', N'en-US', N'Save', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'边框(显示空区域)', N'en-GB', N'Border(Empty Zone)', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'边框(显示空区域)', N'en-US', N'Border(Empty Zone)', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑', N'en-GB', N'Edit', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑', N'en-US', N'Edit', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑：进入页面的设计模式，编辑内容', N'en-GB', N'Edit: Design page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑：进入页面的设计模式，编辑内容', N'en-US', N'Edit: Design page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑布局', N'en-GB', N'Layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑布局', N'en-US', N'Layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑内容', N'en-GB', N'Edit', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑内容', N'en-US', N'Edit', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑设置', N'en-GB', N'Edit', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑设置', N'en-US', N'Edit', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑页面', N'en-GB', N'Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'编辑页面', N'en-US', N'Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'标签', N'en-GB', N'Tag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'标签', N'en-US', N'Tag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'表单', N'en-GB', N'Form', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'表单', N'en-US', N'Form', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'表单数据', N'en-GB', N'Form Data', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'表单数据', N'en-US', N'Form Data', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'并且', N'en-GB', N'And', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'并且', N'en-US', N'And', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不包含', N'en-GB', N'Not Contains', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不包含', N'en-US', N'Not Contains', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不等于', N'en-GB', N'Not Equals', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不等于', N'en-US', N'Not Equals', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不以...结尾', N'en-GB', N'Not Ends With', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不以...结尾', N'en-US', N'Not Ends With', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不以…开头', N'en-GB', N'Not Starts With', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不以…开头', N'en-US', N'Not Starts With', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不在...里', N'en-GB', N'Not In', NULL, NULL)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'不在...里', N'en-US', N'Not In', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局', N'en-GB', N'Layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局', N'en-US', N'Layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局：修改页面布局', N'en-GB', N'Layout: Edit page layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局：修改页面布局', N'en-US', N'Layout: Edit page layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局概览', N'en-GB', N'Overview', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局概览', N'en-US', N'Overview', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局列表', N'en-GB', N'Layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局列表', N'en-US', N'Layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局内容', N'en-GB', N'Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局内容', N'en-US', N'Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局设计', N'en-GB', N'Design', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局设计', N'en-US', N'Design', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局组件', N'en-GB', N'Layout Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'布局组件', N'en-US', N'Layout Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'操作', N'en-GB', N'Action', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'操作', N'en-US', N'Action', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看', N'en-GB', N'View', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看', N'en-US', N'View', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看：查看已发布版本', N'en-GB', N'View: View the published page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看：查看已发布版本', N'en-US', N'View: View the published page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看布局', N'en-GB', N'View Layouts', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看布局', N'en-US', N'View Layouts', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看导航', N'en-GB', N'View Navigation', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看导航', N'en-US', N'View Navigation', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看页面', N'en-GB', N'View Pages', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看页面', N'en-US', N'View Pages', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看站点', N'en-GB', N'View Site', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'查看站点', N'en-US', N'View Site', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品', N'en-GB', N'Product', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品', N'en-US', N'Product', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品标签', N'en-GB', N'Product Tag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品标签', N'en-US', N'Product Tag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品关键字', N'en-GB', N'Product keywords', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品关键字', N'en-US', N'Product keywords', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品管理', N'en-GB', N'Product', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品管理', N'en-US', N'Product', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品类别', N'en-GB', N'Product Category', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品类别', N'en-US', N'Product Category', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品列表', N'en-GB', N'Product List', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品列表', N'en-US', N'Product List', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品内容', N'en-GB', N'Product Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品内容', N'en-US', N'Product Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品排序', N'en-GB', N'Sort', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品排序', N'en-US', N'Sort', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品展示', N'en-GB', N'Product', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'产品展示', N'en-US', N'Product', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'成品模板', N'en-GB', N'Templates', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'成品模板', N'en-US', N'Templates', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'创建布局', N'en-GB', N'New Layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'创建布局', N'en-US', N'New Layout', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'创建文件夹', N'en-GB', N'New Folder', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'创建文件夹', N'en-US', N'New Folder', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'创建页面', N'en-GB', N'New Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'创建页面', N'en-US', N'New Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'错误日志', N'en-GB', N'Log', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'错误日志', N'en-US', N'Log', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'大于', N'en-GB', N'Greater Than', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'大于', N'en-US', N'Greater Than', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'大于等于', N'en-GB', N'Greater Than Or Equals', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'大于等于', N'en-US', N'Greater Than Or Equals', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'单域名模式', N'en-GB', N'Single domain', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'单域名模式', N'en-US', N'Single domain', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'当前日期', N'en-GB', N'Today', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'当前日期', N'en-US', N'Today', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'导航', N'en-GB', N'Navigation', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'导航', N'en-US', N'Navigation', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'导航管理', N'en-GB', N'Navigation', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'导航管理', N'en-US', N'Navigation', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'登录', N'en-GB', N'Sign In', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'登录', N'en-US', N'Sign In', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'登录邮箱不能为空', N'en-GB', N'Please input your email address', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'登录邮箱不能为空', N'en-US', N'Please input your email address', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'等于', N'en-GB', N'Equals', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'等于', N'en-US', N'Equals', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'地图', N'en-GB', N'Map', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'地图', N'en-US', N'Map', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'第三方登录', N'en-GB', N'OAuth', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'第三方登录', N'en-US', N'OAuth', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'点击单选框进行主题切换', N'en-GB', N'Click the radio button to switch the theme', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'点击单选框进行主题切换', N'en-US', N'Click the radio button to switch the theme', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'点击主题“缩略图”可进行进行预览，在预览页面右上角点击“退出主题预览”可回到该页面', N'en-GB', N'Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to the page.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'点击主题“缩略图”可进行进行预览，在预览页面右上角点击“退出主题预览”可回到该页面', N'en-US', N'Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to the page.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'电话', N'en-GB', N'Phone', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'电话', N'en-US', N'Phone', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'电子商务', N'en-GB', N'E-commerce', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'电子商务', N'en-US', N'E-commerce', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'订单', N'en-GB', N'Order', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'订单', N'en-US', N'Order', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'定义条件', N'en-GB', N'Rule', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'定义条件', N'en-US', N'Rule', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'动态', N'en-GB', N'Dynamic', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'动态', N'en-US', N'Dynamic', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'独立域名模式', N'en-GB', N'Standalone domain', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'独立域名模式', N'en-US', N'Standalone domain', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'段落', N'en-GB', N'Paragraph', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'段落', N'en-US', N'Paragraph', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'多语言', N'en-GB', N'Multi-language', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'多语言', N'en-US', N'Multi-language', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'多语言设置', N'en-GB', N'Multi-language Config', NULL, NULL)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'多语言设置', N'en-US', N'Multi-language Config', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'发布', N'en-GB', N'Publish', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'发布', N'en-US', N'Publish', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'发布：将页面发布到前端可查看', N'en-GB', N'Publish: Publish page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'发布：将页面发布到前端可查看', N'en-US', N'Publish: Publish page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'发布人', N'en-GB', N'Publish By', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'发布人', N'en-US', N'Publish By', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'发布日期', N'en-GB', N'Publish Date', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'发布日期', N'en-US', N'Publish Date', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'翻译', N'en-GB', N'Translate', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'翻译', N'en-US', N'Translate', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'翻译键', N'en-GB', N'Key', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'翻译键', N'en-US', N'Key', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'翻译内容', N'en-GB', N'Translate', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'翻译内容', N'en-US', N'Translate', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'分隔符', N'en-GB', N'Separator', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'分隔符', N'en-US', N'Separator', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'复制', N'en-GB', N'Copy', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'复制', N'en-US', N'Copy', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'概览', N'en-GB', N'Overview', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'概览', N'en-US', N'Overview', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'个人中心', N'en-GB', N'Account', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'个人中心', N'en-US', N'Account', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'工具栏', N'en-GB', N'Toolbar', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'工具栏', N'en-US', N'Toolbar', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'关闭', N'en-GB', N'Close', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'关闭', N'en-US', N'Close', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'欢迎', N'en-GB', N'Welcome', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'欢迎', N'en-US', N'Welcome', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'欢迎使用ZKEACMS', N'en-GB', N'Welcome to use ZKEACMS', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'欢迎使用ZKEACMS', N'en-US', N'Welcome to use ZKEACMS', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'或者', N'en-GB', N'Or', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'或者', N'en-US', N'Or', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'基本信息', N'en-GB', N'Information', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'基本信息', N'en-US', N'Information', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'基础', N'en-GB', N'Basis', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'基础', N'en-US', N'Basis', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'间距', N'en-GB', N'Gap', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'间距', N'en-US', N'Gap', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'减小外边距', N'en-GB', N'Full', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'减小外边距', N'en-US', N'Full', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'简介', N'en-GB', N'Biography', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'简介', N'en-US', N'Biography', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'焦点图', N'en-GB', N'Carousel', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'焦点图', N'en-US', N'Carousel', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'角色', N'en-GB', N'Role', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'角色', N'en-US', N'Role', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'脚本', N'en-GB', N'JavaScript', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'脚本', N'en-US', N'JavaScript', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'旧密码', N'en-GB', N'Old Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'旧密码', N'en-US', N'Old Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'居中', N'en-GB', N'Center', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'居中', N'en-US', N'Center', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'巨幕', N'en-GB', N'Jumbotron', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'巨幕', N'en-US', N'Jumbotron', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'扩展插件', N'en-GB', N'Plugins', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'扩展插件', N'en-US', N'Plugins', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'历史版本', N'en-GB', N'Versions', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'历史版本', N'en-US', N'Versions', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'历史事件', N'en-GB', N'History', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'历史事件', N'en-US', N'History', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'立即登录', N'en-GB', N'Sign in', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'立即登录', N'en-US', N'Sign in', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'立即注册', N'en-GB', N'Sign up', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'立即注册', N'en-US', N'Sign up', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'列宽', N'en-GB', N'Column', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'列宽', N'en-US', N'Column', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'留言', N'en-GB', N'Message', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'留言', N'en-US', N'Message', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'留言板', N'en-GB', N'Message Board', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'留言板', N'en-US', N'Message Board', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'留言内容', N'en-GB', N'Message List', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'留言内容', N'en-US', N'Message List', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'留言评论', N'en-GB', N'Message Board', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'留言评论', N'en-US', N'Message Board', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'路径导航', N'en-GB', N'Breadcrumbs', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'路径导航', N'en-US', N'Breadcrumbs', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'媒体库', N'en-GB', N'Media', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'媒体库', N'en-US', N'Media', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'密码', N'en-GB', N'Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'密码', N'en-US', N'Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'密码不能为空', N'en-GB', N'Please input your password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'密码不能为空', N'en-US', N'Please input your password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'密码不一致', N'en-GB', N'Passwords are inconsistent', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'密码不一致', N'en-US', N'Passwords are inconsistent', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'密码的长度应小于20', N'en-GB', N'The length of the password should be less than 20', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'密码的长度应小于20', N'en-US', N'The length of the password should be less than 20', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'描述', N'en-GB', N'Description', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'描述', N'en-US', N'Description', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'模板代码', N'en-GB', N'Code', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'模板代码', N'en-US', N'Code', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'内容', N'en-GB', N'Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'内容', N'en-US', N'Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'内容来源', N'en-GB', N'Data Source', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'内容来源', N'en-US', N'Data Source', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'内容类型', N'en-GB', N'Content Category', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'内容类型', N'en-US', N'Content Category', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'男', N'en-GB', N'Male', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'男', N'en-US', N'Male', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'您的账号已经创建成功', N'en-GB', N'Your account has been created successfully', NULL, NULL)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'您的账号已经创建成功', N'en-US', N'Your account has been created successfully', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'女', N'en-GB', N'Female', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'女', N'en-US', N'Female', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'配置通知邮箱', N'en-GB', N'Notification', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'配置通知邮箱', N'en-US', N'Notification', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'平行视差', N'en-GB', N'Parallax', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'平行视差', N'en-US', N'Parallax', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'评论', N'en-GB', N'Comment', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'评论', N'en-US', N'Comment', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'评论箱', N'en-GB', N'Comment Box', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'评论箱', N'en-US', N'Comment Box', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'其它', N'en-GB', N'Other', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'其它', N'en-US', N'Other', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'其它设置', N'en-GB', N'Other', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'其它设置', N'en-US', N'Other', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'企业版', N'en-GB', N'Enterprise', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'企业版', N'en-US', N'Enterprise', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'企业版', N'zh-CN', N'企业版', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'企业版', N'zh-TW', N'企業版', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请确认密码', N'en-GB', N'Please confirm your password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请确认密码', N'en-US', N'Please confirm your password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请输入{0}', N'en-GB', N'{0} is required', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请输入{0}', N'en-US', N'{0} is required', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请输入您的用户信息以登录', N'en-GB', N'Please enter your user information to log in', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请输入您的用户信息以登录', N'en-US', N'Please enter your user information to log in', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请输入您的用户信息以登录系统', N'en-GB', N'Please enter your user information to log in to the system', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请输入您的用户信息以登录系统', N'en-US', N'Please enter your user information to log in to the system', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请输入您的用户信息以注册', N'en-GB', N'Please enter your user information to register', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'请输入您的用户信息以注册', N'en-US', N'Please enter your user information to register', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'取消', N'en-GB', N'Cancel', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'取消', N'en-US', N'Cancel', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'全部', N'en-GB', N'All', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'全部', N'en-US', N'All', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'全局内容', N'en-GB', N'Layer', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'全局内容', N'en-US', N'Layer', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'确定删除?', N'en-GB', N'Delete?', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'确定删除?', N'en-US', N'Delete?', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'确认密码', N'en-GB', N'Confirm Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'确认密码', N'en-US', N'Confirm Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'容器', N'en-GB', N'Container', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'容器', N'en-US', N'Container', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'若主题有更新，重复安装即可更新', N'en-GB', N'Reinstall to update the theme', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'若主题有更新，重复安装即可更新', N'en-US', N'Reinstall to update the theme', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'删除', N'en-GB', N'Delete', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'删除', N'en-US', N'Delete', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'商业授权', N'en-GB', N'Commercial', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'商业授权', N'en-US', N'Commercial', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'上传文件', N'en-GB', N'Upload', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'上传文件', N'en-US', N'Upload', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'设计', N'en-GB', N'Design', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'设计', N'en-US', N'Design', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'使用QQ登录', N'en-GB', N'Sign in with QQ', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'使用QQ登录', N'en-US', N'Sign in with QQ', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'使用帮助', N'en-GB', N'Help', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'使用帮助', N'en-US', N'Help', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'使用微博登录', N'en-GB', N'Sign in with weibo', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'使用微博登录', N'en-US', N'Sign in with weibo', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'视频', N'en-GB', N'Video', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'视频', N'en-US', N'Video', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'收货地址', N'en-GB', N'Address', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'收货地址', N'en-US', N'Address', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'手机', N'en-GB', N'Cell phone', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'手机', N'en-US', N'Cell phone', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'首页', N'en-GB', N'Home', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'首页', N'en-US', N'Home', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入的邮件格式不正确', N'en-GB', N'The email you entered is not formatted correctly', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入的邮件格式不正确', N'en-US', N'The email you entered is not formatted correctly', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入的邮箱格式不正确', N'en-GB', N'The email you entered is not formatted correctly', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入的邮箱格式不正确', N'en-US', N'The email you entered is not formatted correctly', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入密码', N'en-GB', N'Enter your password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入密码', N'en-US', N'Enter your password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入您常使用的邮箱地址', N'en-GB', N'Your email address', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入您常使用的邮箱地址', N'en-US', N'Your email address', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入您的密码', N'en-GB', N'Enter your password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入您的密码', N'en-US', N'Enter your password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入您注册时使用的邮箱地址', N'en-GB', N'Enter your email address', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入您注册时使用的邮箱地址', N'en-US', N'Enter your email address', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入姓名', N'en-GB', N'Please enter your name', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'输入姓名', N'en-US', N'Please enter your name', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'说明', N'en-GB', N'Explanation', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'说明', N'en-US', N'Explanation', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'说明文档', N'en-GB', N'Document', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'说明文档', N'en-US', N'Document', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加', N'en-GB', N'Add', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加', N'en-US', N'Add', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加：添加子页面', N'en-GB', N'New: Add sub page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加：添加子页面', N'en-US', N'New: Add sub page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加布局', N'en-GB', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加布局', N'en-US', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加产品标签', N'en-GB', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加产品标签', N'en-US', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加导航', N'en-GB', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加导航', N'en-US', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加类别', N'en-GB', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加类别', N'en-US', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加内容', N'en-GB', N'Add Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加内容', N'en-US', N'Add Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加内容板块', N'en-GB', N'Add Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加内容板块', N'en-US', N'Add Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加页面', N'en-GB', N'New Page', NULL, NULL)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加页面', N'en-US', N'New Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加页面：添加顶级页面，即域名下的一级子页面。~/xxxxx', N'en-GB', N'New Page: Add a root level page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'添加页面：添加顶级页面，即域名下的一级子页面。~/xxxxx', N'en-US', N'New Page: Add a root level page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'头像', N'en-GB', N'Avatar', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'头像', N'en-US', N'Avatar', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图例二', N'en-GB', N'Image Caption', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图例二', N'en-US', N'Image Caption', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图例二（圆）', N'en-GB', N'Image Caption', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图例二（圆）', N'en-US', N'Image Caption', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图例三', N'en-GB', N'Image Caption', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图例三', N'en-US', N'Image Caption', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图例三（圆）', N'en-GB', N'Image Caption', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图例三（圆）', N'en-US', N'Image Caption', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片', N'en-GB', N'Image', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片', N'en-US', N'Image', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片边框', N'en-GB', N'Image Border', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片边框', N'en-US', N'Image Border', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片文字', N'en-GB', N'Image Text', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片文字', N'en-US', N'Image Text', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片右', N'en-GB', N'Image Right', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片右', N'en-US', N'Image Right', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片右（圆）', N'en-GB', N'Image Right', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片右（圆）', N'en-US', N'Image Right', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片圆角', N'en-GB', N'Image Radius', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片圆角', N'en-US', N'Image Radius', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片左', N'en-GB', N'Image Left', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片左', N'en-US', N'Image Left', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片左（平分）', N'en-GB', N'Image Left', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片左（平分）', N'en-US', N'Image Left', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片左（圆）', N'en-GB', N'Image Left', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'图片左（圆）', N'en-US', N'Image Left', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'退出', N'en-GB', N'Sign Out', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'退出', N'en-US', N'Sign Out', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'退出登录', N'en-GB', N'Sign Out', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'退出登录', N'en-US', N'Sign Out', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'拖动', N'en-GB', N'Drag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'拖动', N'en-US', N'Drag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'外边框', N'en-GB', N'Border', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'外边框', N'en-US', N'Border', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'忘记密码？', N'en-GB', N'Forgot your password?', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'忘记密码？', N'en-US', N'Forgot your password?', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'微博', N'en-GB', N'WeiBo', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'微博', N'en-US', N'WeiBo', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'微信', N'en-GB', N'WeChat', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'微信', N'en-US', N'WeChat', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'未婚', N'en-GB', N'Unmarried', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'未婚', N'en-US', N'Unmarried', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文档', N'en-GB', N'Document', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文档', N'en-US', N'Document', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章概览', N'en-GB', N'Article Summary', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章概览', N'en-US', N'Article Summary', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章关键字', N'en-GB', N'Article keywords', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章关键字', N'en-US', N'Article keywords', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章管理', N'en-GB', N'Article', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章管理', N'en-US', N'Article', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章类别', N'en-GB', N'Article Category', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章类别', N'en-US', N'Article Category', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章列表', N'en-GB', N'Article List', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章列表', N'en-US', N'Article List', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章内容', N'en-GB', N'Article Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文章内容', N'en-US', N'Article Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文字标题', N'en-GB', N'Title', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文字标题', N'en-US', N'Title', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文字二列', N'en-GB', N'Tow Column Text', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文字二列', N'en-US', N'Tow Column Text', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文字三列', N'en-GB', N'Three Column Text', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'文字三列', N'en-US', N'Three Column Text', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'我的订单', N'en-GB', N'Orders', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'我的订单', N'en-US', N'Orders', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'我们准备了几个链接供您开始：', N'en-GB', N'We have prepared a few links for you to get started:', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'我们准备了几个链接供您开始：', N'en-US', N'We have prepared a few links for you to get started:', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'无效', N'en-GB', N'Inactive', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'无效', N'en-US', N'Inactive', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'系统', N'en-GB', N'System', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'系统', N'en-US', N'System', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'下载板块', N'en-GB', N'Sections', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'下载板块', N'en-US', N'Sections', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'下载更多主题', N'en-GB', N'Download', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'下载更多主题', N'en-US', N'Download', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'下载主题', N'en-GB', N'Themes', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'下载主题', N'en-US', N'Themes', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'显示模板', N'en-GB', N'Display Template', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'显示模板', N'en-US', N'Display Template', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'显示内容', N'en-GB', N'Contents', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'显示内容', N'en-US', N'Contents', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'小于', N'en-GB', N'Less Than', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'小于', N'en-US', N'Less Than', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'小于等于', N'en-GB', N'Less Than Or Equals', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'小于等于', N'en-US', N'Less Than Or Equals', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'新建', N'en-GB', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'新建', N'en-US', N'New', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'新建标签', N'en-GB', N'New tag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'新建标签', N'en-US', N'New tag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'新密码', N'en-GB', N'New Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'新密码', N'en-US', N'New Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'新闻资讯', N'en-GB', N'News', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'新闻资讯', N'en-US', N'News', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'行', N'en-GB', N'Row', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'行', N'en-US', N'Row', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'姓名', N'en-GB', N'Username', NULL, NULL)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'姓名', N'en-US', N'Username', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'姓名不能为空', N'en-GB', N'Username is required', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'姓名不能为空', N'en-US', N'Username is required', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'姓名的长度应小于50', N'en-GB', N'The length of the name should be less than 50', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'姓名的长度应小于50', N'en-US', N'The length of the name should be less than 50', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'性别', N'en-GB', N'Gender', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'性别', N'en-US', N'Gender', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'修改基本信息', N'en-GB', N'Modify Account', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'修改基本信息', N'en-US', N'Modify Account', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'修改密码', N'en-GB', N'Change Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'修改密码', N'en-US', N'Change Password', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'许可协议', N'en-GB', N'License', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'许可协议', N'en-US', N'License', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'选择类别，进行手动排序', N'en-GB', N'Click category to sort the products', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'选择类别，进行手动排序', N'en-US', N'Click category to sort the products', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'选中产品类别，创建标签', N'en-GB', N'Click product category then add tag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'选中产品类别，创建标签', N'en-US', N'Click product category then add tag', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'演示视频', N'en-GB', N'Videos', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'演示视频', N'en-US', N'Videos', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'样式', N'en-GB', N'Style', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'样式', N'en-US', N'Style', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面', N'en-GB', N'Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面', N'en-US', N'Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面必须要发布才可以通过网址访问。对页面进行修改不会影响到已发布版本，直到下一次发布。', N'en-GB', N'The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面必须要发布才可以通过网址访问。对页面进行修改不会影响到已发布版本，直到下一次发布。', N'en-US', N'The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面关键字', N'en-GB', N'Page keywords', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面关键字', N'en-US', N'Page keywords', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面管理', N'en-GB', N'Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面管理', N'en-US', N'Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面检测', N'en-GB', N'Test Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面检测', N'en-US', N'Test Page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面设计', N'en-GB', N'Design', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面设计', N'en-US', N'Design', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面展现的内容', N'en-GB', N'Display in page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页面展现的内容', N'en-US', N'Display in page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页头', N'en-GB', N'Header', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'页头', N'en-US', N'Header', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'仪表盘', N'en-GB', N'Dashboard', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'仪表盘', N'en-US', N'Dashboard', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'已婚', N'en-GB', N'Married', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'已婚', N'en-US', N'Married', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'已有账号？', N'en-GB', N'Have account?', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'已有账号？', N'en-US', N'Have account?', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'以...结尾', N'en-GB', N'Ends With', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'以...结尾', N'en-US', N'Ends With', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'以…开头', N'en-GB', N'Starts With', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'以…开头', N'en-US', N'Starts With', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'阴影', N'en-GB', N'Shadow', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'阴影', N'en-US', N'Shadow', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'用户', N'en-GB', N'User', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'用户', N'en-US', N'User', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'用户名', N'en-GB', N'User Name', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'用户名', N'en-US', N'User Name', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'邮件设置', N'en-GB', N'SMTP', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'邮件设置', N'en-US', N'SMTP', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'邮箱', N'en-GB', N'Email', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'邮箱', N'en-US', N'Email', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'邮箱的长度应小于200', N'en-GB', N'The length of the email should be less than 200', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'邮箱的长度应小于200', N'en-US', N'The length of the email should be less than 200', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'邮政编码', N'en-GB', N'Zip Code', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'邮政编码', N'en-US', N'Zip Code', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'有效', N'en-GB', N'Active', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'有效', N'en-US', N'Active', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'右对齐', N'en-GB', N'Align Right', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'右对齐', N'en-US', N'Align Right', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'右键菜单', N'en-GB', N'Menu', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'右键菜单', N'en-US', N'Menu', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'预览', N'en-GB', N'Preview', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'预览', N'en-US', N'Preview', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'预览：查看最新修改版本', N'en-GB', N'Preview: Preview the page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'预览：查看最新修改版本', N'en-US', N'Preview: Preview the page', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'预览编辑版本', N'en-GB', N'Preview', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'预览编辑版本', N'en-US', N'Preview', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'预览发布版本', N'en-GB', N'View', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'预览发布版本', N'en-US', N'View', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'在...里', N'en-GB', N'In', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'在...里', N'en-US', N'In', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'赞助', N'en-GB', N'Donate', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'赞助', N'en-US', N'Donate', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'增加边距', N'en-GB', N'Padding', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'增加边距', N'en-US', N'Padding', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'粘贴', N'en-GB', N'Paste', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'粘贴', N'en-US', N'Paste', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'支付宝集成设置', N'en-GB', N'Alipay', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'支付宝集成设置', N'en-US', N'Alipay', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'置顶文章', N'en-GB', N'Top Article', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'置顶文章', N'en-US', N'Top Article', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'主题', N'en-GB', N'Theme', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'主题', N'en-US', N'Theme', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'主题管理', N'en-GB', N'Theme', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'主题管理', N'en-US', N'Theme', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'属性', N'en-GB', N'Property', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'属性', N'en-US', N'Property', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'属性/历史记录', N'en-GB', N'Property/History', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'属性/历史记录', N'en-US', N'Property/History', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'属性：编辑选中页面的属性，像标题，SEO关键字等', N'en-GB', N'Property: Page property, history etc.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'属性：编辑选中页面的属性，像标题，SEO关键字等', N'en-US', N'Property: Page property, history etc.', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'属性名', N'en-GB', N'Name', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'属性名', N'en-US', N'Name', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'注：', N'en-GB', N'Notice:', NULL, NULL)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'注：', N'en-US', N'Notice:', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'注册结果', N'en-GB', N'Thank you!', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'注册结果', N'en-US', N'Thank you!', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'转为伪静态路径', N'en-GB', N'Append ''.html''', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'转为伪静态路径', N'en-US', N'Append ''.html''', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'字段', N'en-GB', N'Property', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'字段', N'en-US', N'Property', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'字段名', N'en-GB', N'Display Name', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'字段名', N'en-US', N'Display Name', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义', N'en-GB', N'Custom Section', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义', N'en-US', N'Custom Section', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义表单', N'en-GB', N'Form Generator', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义表单', N'en-US', N'Form Generator', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义内容', N'en-GB', N'Fluid Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义内容', N'en-US', N'Fluid Content', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义内容', N'zh-CN', N'自定义内容', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义内容列表', N'en-GB', N'Fluid Content List', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义内容列表', N'en-US', N'Fluid Content List', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义样式', N'en-GB', N'Style', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自定义样式', N'en-US', N'Style', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自适应', N'en-GB', N'Fluid', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'自适应', N'en-US', N'Fluid', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'组件设置', N'en-GB', N'Setting', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'组件设置', N'en-US', N'Setting', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'左对齐', N'en-GB', N'Align Left', NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'左对齐', N'en-US', N'Align Left', NULL, NULL)
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'1061019b1bcd4bf3aeb3df647c74c309', N'#', N'~/product', N'产品', 1, NULL, NULL, 1, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:33:03.653' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.830' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'6beb1a2a54b947179ec20dd331e375a2', N'#', N'~/index', N'首页', 0, NULL, NULL, 1, 1, N'admin', NULL, CAST(N'2015-09-01T09:55:20.483' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.820' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'7b5bb24dea6d47618ed027190b4e5d94', N'#', N'~/contact', N'联系我们', 0, NULL, NULL, 1, 5, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:06:21.360' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.833' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'd122a50356bf46c8a8c8349612145e24', N'#', N'~/questionnaire', N'问卷调查', 0, NULL, NULL, 1, 4, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:25.947' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.837' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'e4658e8af8434a05b773b666c6c67cd5', N'#', N'~/article', N'新闻', 1, NULL, NULL, 1, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:32:53.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.827' AS DateTime))
INSERT [dbo].[NavigationWidget] ([ID], [CustomerClass], [Title], [Logo], [AlignClass], [IsTopFix], [RootID], [ShowBasket]) VALUES (N'6ee67036e78b4b498d932ab2d76757fb', N'container', NULL, N'~/images/logo_zkea.png', N'navbar-left', NULL, N'#', 0)
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ApplicationSetting_Manage', 1, N'管理系统设置', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.293' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ApplicationSetting_View', 1, N'查看系统设置', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.293' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_Manage', 1, N'管理文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:18:40.493' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_Publish', 1, N'发布文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-05-25T12:36:10.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_View', 1, N'查看文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:17:59.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ArticleType_Manage', 1, N'管理文章类别', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:22:24.887' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ArticleType_View', 1, N'查看文章类别', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:19:54.500' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Carousel_Manage', 1, N'管理焦点图', NULL, N'焦点图', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:45:46.190' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Carousel_View', 1, N'查看焦点图', NULL, N'焦点图', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.097' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Comments_Manage', 1, N'管理回复', NULL, N'留言评论', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:09:48.053' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Comments_View', 1, N'查看回复', NULL, N'留言评论', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:09:48.050' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'EventViewer_Manage', 1, N'查看错误日志', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-07-11T15:43:52.147' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Form_Manage', 1, N'管理表单', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Form_View', 1, N'查看表单', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.830' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_Export', 1, N'导出表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_Manage', 1, N'管理表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_View', 1, N'查看表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Language_Manage', 1, N'翻译', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T11:47:13.093' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Layout_Manage', 1, N'管理布局', NULL, N'布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:43:52.697' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Layout_View', 1, N'查看布局', NULL, N'布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:37:56.690' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'LiveChatScript_Manage', 1, N'设置在线客服代码', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-04-07T16:39:16.730' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Media_Manage', 1, N'管理媒体库', NULL, N'媒体库', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.553' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Media_View', 1, N'查看媒体库', NULL, N'媒体库', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.090' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Message_Manage', 1, N'管理留言', NULL, N'留言板', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:01:14.980' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Message_View', 1, N'查看留言', NULL, N'留言板', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:01:14.960' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'MessageNotification_Manage', 1, N'管理通知邮箱', NULL, N'留言评论', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-08-15T15:25:42.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Navigation_Manage', 1, N'管理导航', NULL, N'导航', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:40:38.230' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Navigation_View', 1, N'查看导航', NULL, N'导航', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:38:21.943' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_Manage', 1, N'管理订单', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T10:49:53.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_Refund', 1, N'退款', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19T15:26:24.903' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_View', 1, N'查看订单', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T10:49:53.923' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_ViewOrderPayment', 1, N'查看支付平台支付信息', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19T15:26:24.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_ViewOrderRefund', 1, N'查看支付平台退款信息', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19T15:26:24.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Page_Manage', 1, N'管理页面', NULL, N'页面', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:41:08.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Page_View', 1, N'查看页面', NULL, N'页面', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:37:56.683' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Payment_Config_Manage', 1, N'支付集成设置', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.663' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.297' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Plugin_View', 1, N'插件', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-04-07T16:39:16.727' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_Manage', 1, N'管理产品', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:27:58.400' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_Publish', 1, N'发布产品', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-05-25T12:36:10.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_View', 1, N'查看产品', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:27:41.483' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategory_Manage', 1, N'管理产品类别', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:28:21.047' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategory_View', 1, N'查看产品类别', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:28:08.737' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategoryTag_Manage', 1, N'管理产品标签', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-11T15:43:52.953' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategoryTag_View', 1, N'查看产品标签', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-11T15:43:52.947' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'RobotsSetting', 1, N'Robots.txt', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-08-12T22:51:30.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Role_Manage', 1, N'管理角色', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Role_View', 1, N'查看角色', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.660' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SMTPSetting', 1, N'邮箱设置', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-06-12T19:13:49.497' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'StatisticsScript_Manage', 1, N'设置访客统计代码', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-04-07T16:39:16.730' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Template_Manage', 1, N'管理模板', NULL, N'页面布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.307' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.307' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Template_View', 1, N'管理模板', NULL, N'页面布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.303' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.303' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Theme_Manage', 1, N'管理主题', NULL, N'主题', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:42:48.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Theme_View', 1, N'查看主题', NULL, N'主题', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.083' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'UrlRedirect_Manage', 1, N'管理URL 重定向', NULL, N'URL 重定向', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:55:58.170' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'UrlRedirect_View', 1, N'查看URL 重定向', NULL, N'URL 重定向', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:55:58.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'User_Manage', 1, N'管理用户', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'User_View', 1, N'查看用户', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-21T21:39:09.300' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ImageUrl], [ImageThumbUrl], [BrandCD], [ProductCategoryID], [Color], [Price], [RebatePrice], [PurchasePrice], [Norm], [ShelfLife], [ProductContent], [Description], [IsPublish], [PublishDate], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [OrderIndex], [SourceFrom], [Url], [TargetFrom], [TargetUrl], [PartNumber], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'Cloud Revolver 游戏耳机', N'https://user-images.githubusercontent.com/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png', N'https://user-images.githubusercontent.com/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png', NULL, 2, NULL, 500.0000, 399.0000, NULL, NULL, NULL, N'<h1>HyperX Cloud Revolver</h1>
<p>如果您热爱游戏，那么一款可为您带来极大优势的耳机就是必不可少的装备。HyperX Cloud Revolver&trade; 是一款优质耳机，工艺精湛，可充分满足高级OC或家用机游戏玩家的需求。新一代驱动器可将低音、中音和高音明确区分开来，形成精准定位的优质音效。Revolver 系列具备立体声和即插即用的 Dolby&reg; 7.1 环绕立体声模式，可提供工作室级别的音场和新一代驱动器，在 FPS 和开放式环境下表现优异。两款耳机均采用结实耐用的实心钢质框架和标志性的 HyperX 记忆海绵，带来屡获殊荣的舒适度。如果您希望拥有无与伦比的舒适度、绝佳的音质和清晰顺畅的沟通，Cloud Revolver 耳机将是您的不二之选。</p>
<h3>即插即用 Dolby&reg; 环绕立体声 7.1&nbsp;</h3>
<p>模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效，无需安装软件或任何设置，即可将音频娱乐变成电影般的体验。<br />可在 Cloud Revolver S 上使用。</p>
<h3>先进的 USB 音频控制盒与 DSP 声卡&nbsp;</h3>
<p>USB 数字处理信号声卡可在任何机器上输出一致的优质音频。卡夹式音频控制盒设计有背光按钮，因此可以即时静音、启用 Dolby 音频，还可在三种预先设置的均衡器之间切换并调整麦克风和音量水平。<br />可在 Cloud Revolver S 上使用。</p>
<h3>新一代 50 毫米驱动器&nbsp;</h3>
<p>与双耳平行的 50mm 定向驱动器精准定位，超强低音效果让声音更加清脆动听。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>
<h3>HyperX 标志性记忆海绵&nbsp;</h3>
<p>屡获殊荣的 HyperX 记忆海绵，带来无与伦比的舒适度，让您更加舒适，更加尽兴地游戏。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>', N'模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效', 1, CAST(N'2017-11-17T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, N'Cloud-Revolver', NULL, NULL, N'HX-HSCR-BK/AS', N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T21:52:05.397' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [ImageUrl], [ImageThumbUrl], [BrandCD], [ProductCategoryID], [Color], [Price], [RebatePrice], [PurchasePrice], [Norm], [ShelfLife], [ProductContent], [Description], [IsPublish], [PublishDate], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [OrderIndex], [SourceFrom], [Url], [TargetFrom], [TargetUrl], [PartNumber], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'Alloy FPS 机械游戏键盘', N'https://user-images.githubusercontent.com/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png', N'https://user-images.githubusercontent.com/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png', NULL, 3, N'黑色', 500.0000, 499.0000, NULL, NULL, NULL, N'<h1>小巧便携，随时随地开始 FPS 游戏。</h1>
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

INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, 1, N'https://user-images.githubusercontent.com/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png', N'HX-HSCR-BK/AS', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T19:58:48.747' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, 1, N'https://user-images.githubusercontent.com/6006218/56657706-58757e00-66cb-11e9-80b8-fdc32783ff68.png', N'HX-HSCRS-GM/AS', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T19:58:48.750' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, 2, N'https://user-images.githubusercontent.com/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, 2, N'https://user-images.githubusercontent.com/6006218/56657774-78a53d00-66cb-11e9-9ab9-c4b65f3cba22.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, 2, N'https://user-images.githubusercontent.com/6006218/56657795-85299580-66cb-11e9-9a3f-a1c5bde7b191.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, 2, N'https://user-images.githubusercontent.com/6006218/56657844-9a9ebf80-66cb-11e9-91ed-02001fab09c8.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
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

INSERT [dbo].[Roles] ([ID], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'超级管理员', N'超级管理员', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-04-07T16:39:17.073' AS DateTime))
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
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Column', N'左右', N'Thumbnail\SectionTemplate.Column.png', N'Thumbnail\SectionTemplate.Column.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Default', N'默认', N'Thumbnail\SectionTemplate.Default.png', N'Thumbnail\SectionTemplate.Default.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ImageRight', N'图片右', N'Thumbnail\SectionTemplate.ImageRight.png', N'Thumbnail\SectionTemplate.ImageRight.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.LinkGroup', N'链接组', N'Thumbnail\SectionTemplate.LinkGroup.png', N'Thumbnail\SectionTemplate.LinkGroup.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ListGroup', N'列表组', N'Thumbnail\SectionTemplate.ListGroup.png', N'Thumbnail\SectionTemplate.ListGroup.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ListView', N'媒体列表', N'Thumbnail\SectionTemplate.ListView.png', N'Thumbnail\SectionTemplate.ListView.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
INSERT [dbo].[Users] ([UserID], [PassWord], [ApiLoginToken], [LastLoginDate], [LoginIP], [PhotoUrl], [Timestamp], [UserName], [UserTypeCD], [Address], [Age], [Birthday], [Birthplace], [Email], [EnglishName], [FirstName], [Hobby], [LastName], [MaritalStatus], [MobilePhone], [NickName], [Profession], [QQ], [School], [Sex], [Telephone], [ZipCode], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Status], [Description], [ResetToken], [ResetTokenDate]) VALUES (N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, CAST(N'2019-04-24T19:55:35.843' AS DateTime), N'::1', N'~/images/head.png', 0, N'ZKEASOFT', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, N'Admin', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, N'admin', N'Admin', CAST(N'2019-04-24T19:55:35.860' AS DateTime), 1, NULL, NULL, NULL)
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
USE [master]
GO
ALTER DATABASE [ZKEACMS] SET  READ_WRITE 
GO
