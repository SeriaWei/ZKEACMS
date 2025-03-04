-- Script Date: 2025/3/4 星期二 16:38  - ErikEJ.SqlCeScripting version 3.5.2.56
SELECT 1;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
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
, [DisplayOrder] int NULL
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
, CONSTRAINT [PK__VideoGal__3214EC2704A02A95] PRIMARY KEY ([ID])
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
CREATE TABLE [Users] (
  [UserID] nvarchar(50) NOT NULL
, [PassWord] nvarchar(255) NULL
, [ApiLoginToken] nvarchar(255) NULL
, [LastLoginDate] datetime NULL
, [LoginIP] nvarchar(50) NULL
, [PhotoUrl] nvarchar(255) NULL
, [Timestamp] bigint NULL
, [UserName] nvarchar(100) NULL
, [UserTypeCD] int NULL
, [Address] nvarchar(255) NULL
, [Age] int NULL
, [Birthday] datetime NULL
, [Birthplace] nvarchar(255) NULL
, [Email] nvarchar(100) NULL
, [EnglishName] nvarchar(50) NULL
, [FirstName] nvarchar(50) NULL
, [Hobby] nvarchar(100) NULL
, [LastName] nvarchar(50) NULL
, [MaritalStatus] int NULL
, [MobilePhone] nvarchar(50) NULL
, [NickName] nvarchar(50) NULL
, [Profession] nvarchar(50) NULL
, [QQ] nvarchar(50) NULL
, [School] nvarchar(50) NULL
, [Sex] int NULL
, [Telephone] nvarchar(50) NULL
, [ZipCode] nvarchar(50) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [ResetToken] nvarchar(50) NULL
, [ResetTokenDate] datetime NULL
, CONSTRAINT [PK_Users] PRIMARY KEY ([UserID])
);
CREATE TABLE [Subscription] (
  [ID] INTEGER NOT NULL
, [Email] nvarchar(100) NULL
, [Phone] nvarchar(100) NULL
, [Referrer] nvarchar(500) NULL
, [IsValidate] bit NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Subscrip__3214EC27B93E4C8F] PRIMARY KEY ([ID])
);
CREATE TABLE [ShippingOption] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [Price] money NULL
, [Rule] ntext NULL
, [ContentID] nvarchar(100) NULL
, [CultureID] int NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Shipping__3214EC27D26930F7] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionTemplate] (
  [TemplateName] nvarchar(100) NOT NULL
, [Title] nvarchar(255) NULL
, [Thumbnail] nvarchar(100) NULL
, [ExampleData] nvarchar(100) NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_SectionTemplate] PRIMARY KEY ([TemplateName])
);
CREATE TABLE [SectionContentVideo] (
  [ID] nvarchar(100) NOT NULL
, [VideoTitle] nvarchar(200) NULL
, [Thumbnail] nvarchar(200) NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [Width] int NULL
, [Height] int NULL
, [Url] nvarchar(256) NULL
, [Code] ntext NULL
, CONSTRAINT [PK_SectionContentVideo] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionContentTitle] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [InnerText] nvarchar(255) NULL
, [Href] nvarchar(255) NULL
, [TitleLevel] nvarchar(10) NULL
, CONSTRAINT [PK_SectionContentTitle] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionContentParagraph] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [HtmlContent] ntext NULL
, CONSTRAINT [PK_SectionContentParagraph] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionContentImage] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [ImageSrc] nvarchar(255) NULL
, [ImageAlt] nvarchar(255) NULL
, [ImageTitle] nvarchar(255) NULL
, [Href] nvarchar(255) NULL
, [Width] int NULL
, [Height] int NULL
, CONSTRAINT [PK_SectionContentImage] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionContentCallToAction] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [InnerText] nvarchar(255) NULL
, [Href] nvarchar(255) NULL
, CONSTRAINT [PK_SectionContentCallToAction] PRIMARY KEY ([ID])
);
CREATE TABLE [Roles] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(100) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Roles__3214EC27AD72987D] PRIMARY KEY ([ID])
);
CREATE TABLE [UserRoleRelation] (
  [ID] INTEGER NOT NULL
, [RoleID] int NULL
, [UserID] nvarchar(50) NULL
, CONSTRAINT [PK__UserRole__3214EC27307DD81F] PRIMARY KEY ([ID])
, FOREIGN KEY ([RoleID]) REFERENCES [Roles] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([UserID]) REFERENCES [Users] ([UserID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductTag] (
  [ID] INTEGER NOT NULL
, [ProductId] int NULL
, [TagId] int NULL
, [Title] nvarchar(200) NULL
, CONSTRAINT [PK_ProductTag] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductImage] (
  [ID] INTEGER NOT NULL
, [ProductId] int NULL
, [ImageUrl] nvarchar(500) NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ProductImage] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__ProductG__3214EC27054E1BF8] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductCategoryTag] (
  [ID] INTEGER NOT NULL
, [ProductCategoryId] int NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [ParentId] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ProductCategoryTag] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductCategory] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [ParentID] int NULL
, [Url] nvarchar(100) NULL
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
, [DisplayOrder] int NULL
, CONSTRAINT [PK_ProductCategory] PRIMARY KEY ([ID])
);
CREATE TABLE [Product] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [ImageUrl] nvarchar(255) NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [BrandCD] int NULL
, [ProductCategoryID] int NULL
, [Color] nvarchar(255) NULL
, [Price] money NULL
, [RebatePrice] money NULL
, [PurchasePrice] money NULL
, [Norm] nvarchar(255) NULL
, [ShelfLife] nvarchar(255) NULL
, [ProductContent] ntext NULL
, [Description] ntext NULL
, [IsPublish] bit NOT NULL
, [PublishDate] datetime NULL
, [Status] int NULL
, [SEOTitle] nvarchar(255) NULL
, [SEOKeyWord] nvarchar(255) NULL
, [SEODescription] ntext NULL
, [OrderIndex] int NULL
, [SourceFrom] nvarchar(255) NULL
, [Url] nvarchar(255) NULL
, [TargetFrom] nvarchar(255) NULL
, [TargetUrl] nvarchar(255) NULL
, [PartNumber] nvarchar(200) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Product] PRIMARY KEY ([ID])
, FOREIGN KEY ([ProductCategoryID]) REFERENCES [ProductCategory] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [PersistKey] (
  [ID] nvarchar(100) NOT NULL
, [XML] ntext NULL
, [CreationDate] datetime NULL
, [ActivationDate] datetime NULL
, [ExpirationDate] datetime NULL
, CONSTRAINT [PK__PersistK__3214EC27D96C7911] PRIMARY KEY ([ID])
);
CREATE TABLE [Permission] (
  [PermissionKey] nvarchar(100) NOT NULL
, [RoleId] int NOT NULL
, [Title] nvarchar(100) NULL
, [Description] nvarchar(500) NULL
, [Module] nvarchar(100) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Permission_PermissionKey_RoleId] PRIMARY KEY ([PermissionKey],[RoleId])
, FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [PageView] (
  [ID] INTEGER NOT NULL
, [PageUrl] nvarchar(500) NULL
, [PageTitle] nvarchar(200) NULL
, [IPAddress] nvarchar(50) NULL
, [SessionID] nvarchar(50) NULL
, [UserAgent] nvarchar(500) NULL
, [Referer] nvarchar(1000) NULL
, [RefererName] nvarchar(255) NULL
, [KeyWords] nvarchar(255) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_PageView] PRIMARY KEY ([ID])
);
CREATE TABLE [OrderItem] (
  [ID] INTEGER NOT NULL
, [OrderId] nvarchar(50) NOT NULL
, [UserId] nvarchar(50) NOT NULL
, [ImageUrl] nvarchar(500) NOT NULL
, [Quantity] int NOT NULL
, [Price] numeric(18,4) NOT NULL
, [ProductId] int NOT NULL
, [PromoCode] nvarchar(50) NULL
, [Title] nvarchar(200) NOT NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [BasketID] int NULL
, CONSTRAINT [PK_OrderItem] PRIMARY KEY ([ID])
);
CREATE TABLE [Order] (
  [ID] nvarchar(50) NOT NULL
, [UserId] nvarchar(50) NOT NULL
, [Contact] nvarchar(50) NULL
, [PhoneNumber] nvarchar(50) NULL
, [Total] numeric(18,4) NOT NULL
, [OrderStatus] int NOT NULL
, [PayTime] datetime NULL
, [CompletePayTime] datetime NULL
, [TrackingNumber] nvarchar(50) NULL
, [LogisticsCompany] nvarchar(50) NULL
, [ShippingAddress] nvarchar(500) NULL
, [PaymentGateway] nvarchar(50) NULL
, [PaymentID] nvarchar(500) NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [RefundID] nvarchar(100) NULL
, [Refund] numeric(18,4) NULL
, [RefundDate] datetime NULL
, [RefundReason] nvarchar(500) NULL
, [ShippingOption] int NULL
, [SubTotal] money NULL
, [Tax] money NULL
, [Shipping] money NULL
, CONSTRAINT [PK_Order] PRIMARY KEY ([ID])
);
CREATE TABLE [Navigation] (
  [ID] nvarchar(100) NOT NULL
, [ParentId] nvarchar(100) NULL
, [Url] nvarchar(255) NULL
, [Title] nvarchar(200) NULL
, [IsMobile] bit NULL
, [Html] ntext NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [DisplayOrder] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Navigation] PRIMARY KEY ([ID])
);
CREATE TABLE [Forms] (
  [ID] nvarchar(50) NOT NULL
, [Title] nvarchar(200) NULL
, [FieldsData] ntext NULL
, [NotificationReceiver] nvarchar(500) NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Forms] PRIMARY KEY ([ID])
);
CREATE TABLE [FormDataItem] (
  [ID] INTEGER NOT NULL
, [FormDataId] int NOT NULL
, [FieldId] nvarchar(50) NULL
, [FieldText] nvarchar(1000) NULL
, [FieldValue] ntext NULL
, [OptionValue] nvarchar(50) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_FormData] PRIMARY KEY ([ID])
);
CREATE TABLE [FormData] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(500) NULL
, [FormId] nvarchar(50) NOT NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_FormData_1] PRIMARY KEY ([ID])
);
CREATE TABLE [FluidContentValue] (
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
CREATE TABLE [FluidContentType] (
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
, [GroupID] int NULL
, [RoleID] int NULL
, [Icon] nvarchar(100) NULL
, CONSTRAINT [PK_FluidContentType] PRIMARY KEY ([ID])
);
CREATE TABLE [FluidContentTemplate] (
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
, CONSTRAINT [PK_FluidContentTemplate] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__FluidCon__3214EC273CF81DDC] PRIMARY KEY ([ID])
);
CREATE TABLE [ExtendField] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Value] ntext NULL
, [OwnerModule] nvarchar(50) NULL
, [OwnerID] nvarchar(100) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] nvarchar(255) NULL
, CONSTRAINT [PK_ExtendField] PRIMARY KEY ([ID])
);
CREATE TABLE [EA_PendingTask] (
  [ID] INTEGER NOT NULL
, [Identifier] nvarchar(200) NOT NULL
, [HandlerName] nvarchar(100) NOT NULL
, [Data] ntext NULL
, [LogMessage] ntext NULL
, [RetryCount] int NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_EA_PendingTask] PRIMARY KEY ([ID])
);
CREATE TABLE [EA_EventAction] (
  [ID] INTEGER NOT NULL
, [Event] nvarchar(100) NULL
, [Actions] ntext NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_EventAction] PRIMARY KEY ([ID])
);
CREATE TABLE [EA_ActionBody] (
  [ID] INTEGER NOT NULL
, [Body] ntext NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ActionBody] PRIMARY KEY ([ID])
);
CREATE TABLE [DBVersion] (
  [ID] INTEGER NOT NULL
, [Major] int NULL
, [Minor] int NULL
, [Revision] int NULL
, [Build] int NULL
, CONSTRAINT [PK__DBVersio__3214EC27875B6304] PRIMARY KEY ([ID])
);
CREATE TABLE [DataDictionary] (
  [ID] INTEGER NOT NULL
, [DicName] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [DicValue] nvarchar(255) NULL
, [Order] int NULL
, [Pid] int NULL
, [IsSystem] bit NOT NULL
, [ImageUrl] nvarchar(255) NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [Description] ntext NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_DataDictionary] PRIMARY KEY ([ID])
);
CREATE TABLE [DataArchived] (
  [ID] nvarchar(100) NOT NULL
, [Data] ntext NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_DataArchived] PRIMARY KEY ([ID])
);
CREATE TABLE [Currency] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [Code] nvarchar(10) NULL
, [Symbol] nvarchar(10) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Currency__3214EC2774BF0183] PRIMARY KEY ([ID])
);
CREATE TABLE [Comments] (
  [ID] INTEGER NOT NULL
, [PagePath] nvarchar(300) NULL
, [UserId] nvarchar(100) NULL
, [Picture] nvarchar(300) NULL
, [UserName] nvarchar(100) NULL
, [CommentContent] nvarchar(500) NULL
, [Agrees] int NULL
, [Disagrees] int NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Comments] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_WidgetBase] (
  [ID] nvarchar(100) NOT NULL
, [WidgetName] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [Position] int NULL
, [LayoutId] nvarchar(100) NULL
, [PageId] nvarchar(100) NULL
, [ZoneId] nvarchar(100) NULL
, [PartialView] nvarchar(255) NULL
, [AssemblyName] nvarchar(255) NULL
, [ServiceTypeName] nvarchar(255) NULL
, [ViewModelTypeName] nvarchar(255) NULL
, [FormView] nvarchar(255) NULL
, [StyleClass] nvarchar(1000) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] ntext NULL
, [Status] int NULL
, [IsTemplate] bit DEFAULT 0 NULL
, [Thumbnail] nvarchar(200) NULL
, [IsSystem] bit DEFAULT 0 NULL
, [ExtendData] ntext NULL
, [RuleID] int NULL
, CONSTRAINT [PK_CMS_WidgetBase] PRIMARY KEY ([ID])
);
CREATE TABLE [VideoWidget] (
  [ID] nvarchar(100) NOT NULL
, [Width] int NULL
, [Height] int NULL
, [Url] nvarchar(255) NULL
, [Code] nvarchar(500) NULL
, CONSTRAINT [PK_VideoWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [StyleSheetWidget] (
  [ID] nvarchar(100) NOT NULL
, [StyleSheet] ntext NULL
, CONSTRAINT [PK_StyleSheetWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [SectionWidget] (
  [ID] nvarchar(100) NOT NULL
, [SectionTitle] nvarchar(255) NULL
, [IsHorizontal] bit NULL
, CONSTRAINT [PK_SectionWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [SectionGroup] (
  [ID] nvarchar(100) NOT NULL
, [GroupName] nvarchar(255) NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [PartialView] nvarchar(100) NULL
, [Order] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [PercentWidth] nvarchar(100) NULL
, CONSTRAINT [PK_SectionGroup] PRIMARY KEY ([ID])
, FOREIGN KEY ([PartialView]) REFERENCES [SectionTemplate] ([TemplateName]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([SectionWidgetId]) REFERENCES [SectionWidget] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [SectionContent] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [SectionGroupId] nvarchar(100) NOT NULL
, [SectionContentType] int NULL
, [Order] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_SectionContent] PRIMARY KEY ([ID])
, FOREIGN KEY ([SectionWidgetId]) REFERENCES [SectionWidget] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ScriptWidget] (
  [ID] nvarchar(100) NOT NULL
, [Script] ntext NULL
, CONSTRAINT [PK_ScriptWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductListWidget] (
  [ID] nvarchar(100) NOT NULL
, [IsPageable] bit NOT NULL
, [ProductCategoryID] int NULL
, [DetailPageUrl] nvarchar(255) NULL
, [Columns] nvarchar(255) NULL
, [PageSize] int NULL
, CONSTRAINT [PK_ProductListWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductDetailWidget] (
  [ID] nvarchar(100) NOT NULL
, [CustomerClass] nvarchar(255) NULL
, CONSTRAINT [PK_ProductDetailWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductCategoryWidget] (
  [ID] nvarchar(100) NOT NULL
, [ProductCategoryID] int NULL
, [TargetPage] nvarchar(255) NULL
, CONSTRAINT [PK_ProductCategoryWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [NavigationWidget] (
  [ID] nvarchar(100) NOT NULL
, [CustomerClass] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [Logo] nvarchar(255) NULL
, [AlignClass] nvarchar(50) NULL
, [IsTopFix] bit NULL
, [RootID] nvarchar(100) NULL
, [ShowBasket] bit NULL
, CONSTRAINT [PK_NavigationWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ImageWidget] (
  [ID] nvarchar(100) NOT NULL
, [ImageUrl] nvarchar(255) NULL
, [Width] int NULL
, [Height] int NULL
, [AltText] nvarchar(255) NULL
, [Link] nvarchar(255) NULL
, [ImageUrlMd] nvarchar(225) NULL
, [ImageUrlSm] nvarchar(225) NULL
, CONSTRAINT [PK_ImageWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [HtmlWidget] (
  [ID] nvarchar(100) NOT NULL
, [HTML] ntext NULL
, CONSTRAINT [PK_HtmlWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CMS_Theme] (
  [ID] nvarchar(100) NOT NULL
, [Title] nvarchar(200) NULL
, [Url] nvarchar(100) NULL
, [UrlDebugger] nvarchar(100) NULL
, [Thumbnail] nvarchar(100) NULL
, [IsActived] bit NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_CMS_Theme] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Rule] (
  [RuleID] INTEGER NOT NULL
, [Title] nvarchar(200) NULL
, [ZoneName] nvarchar(50) NULL
, [RuleExpression] nvarchar(800) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [RuleItems] ntext NULL
, CONSTRAINT [PK_CMS_Rule] PRIMARY KEY ([RuleID])
);
CREATE TABLE [CMS_Redirection] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(200) NOT NULL
, [InComingUrl] nvarchar(500) NOT NULL
, [DestinationURL] nvarchar(500) NOT NULL
, [IsPermanent] bit NOT NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [IsPattern] bit NULL
, CONSTRAINT [PK_CMS_Redirection] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Message] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(200) NULL
, [Email] nvarchar(50) NOT NULL
, [PostMessage] ntext NOT NULL
, [Reply] ntext NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] nvarchar(200) NULL
, CONSTRAINT [PK_CMS_Message] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Media] (
  [ID] nvarchar(50) NOT NULL
, [ParentID] nvarchar(50) NULL
, [Title] nvarchar(200) NULL
, [MediaType] int NULL
, [Url] nvarchar(100) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] nvarchar(500) NULL
, CONSTRAINT [PK_CMS_Media] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Layout] (
  [ID] nvarchar(100) NOT NULL
, [LayoutName] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [ContainerClass] nvarchar(255) NULL
, [Status] int NULL
, [Description] ntext NULL
, [Script] nvarchar(255) NULL
, [Style] nvarchar(255) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [ImageUrl] nvarchar(255) NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [Theme] nvarchar(255) NULL
, CONSTRAINT [PK_CMS_Layout] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Zone] (
  [ID] nvarchar(100) NOT NULL
, [LayoutId] nvarchar(100) NULL
, [PageId] nvarchar(100) NULL
, [ZoneName] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] ntext NULL
, [Status] int NULL
, [HeadingCode] nvarchar(100) NULL
, CONSTRAINT [PK_CMS_Zone] PRIMARY KEY ([ID])
, FOREIGN KEY ([LayoutId]) REFERENCES [CMS_Layout] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CMS_Page] (
  [ID] nvarchar(100) NOT NULL
, [ReferencePageID] nvarchar(100) NULL
, [IsPublishedPage] bit NULL
, [ParentId] nvarchar(100) NULL
, [PageName] nvarchar(100) NULL
, [IsHomePage] bit NOT NULL
, [Url] nvarchar(255) NULL COLLATE NOCASE
, [LayoutId] nvarchar(100) NULL
, [Title] nvarchar(255) NULL
, [Content] ntext NULL
, [DisplayOrder] int NULL
, [Description] ntext NULL
, [Status] int NULL
, [IsPublish] bit NOT NULL
, [PublishDate] datetime NULL
, [MetaKeyWorlds] nvarchar(255) NULL
, [MetaDescription] nvarchar(255) NULL
, [Script] nvarchar(255) NULL
, [Style] nvarchar(255) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_CMS_Page] PRIMARY KEY ([ID])
, FOREIGN KEY ([LayoutId]) REFERENCES [CMS_Layout] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CMS_LayoutHtml] (
  [LayoutHtmlId] INTEGER NOT NULL
, [LayoutId] nvarchar(100) NOT NULL
, [PageId] nvarchar(100) NULL
, [Html] ntext NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_CMS_LayoutHtml] PRIMARY KEY ([LayoutHtmlId])
, FOREIGN KEY ([LayoutId]) REFERENCES [CMS_Layout] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Carousel] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Height] int NULL
, [Description] nvarchar(255) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Carousel] PRIMARY KEY ([ID])
);
CREATE TABLE [CarouselWidget] (
  [ID] nvarchar(100) NOT NULL
, [CarouselID] int NULL
, CONSTRAINT [PK_CarouselWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([CarouselID]) REFERENCES [Carousel] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CarouselItem] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [CarouselID] int NULL
, [CarouselWidgetID] nvarchar(100) NULL
, [TargetLink] nvarchar(255) NULL
, [ImageUrl] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_CarouselItem] PRIMARY KEY ([ID])
, FOREIGN KEY ([CarouselWidgetID]) REFERENCES [CarouselWidget] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Basket] (
  [ID] INTEGER NOT NULL
, [UserId] nvarchar(50) NOT NULL
, [ImageUrl] nvarchar(500) NOT NULL
, [Quantity] int NOT NULL
, [Price] numeric(18,4) NOT NULL
, [ProductId] int NOT NULL
, [PromoCode] nvarchar(50) NULL
, [Title] nvarchar(200) NOT NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Basket] PRIMARY KEY ([ID])
);
CREATE TABLE [ArticleTypeWidget] (
  [ID] nvarchar(100) NOT NULL
, [ArticleTypeID] int NULL
, [TargetPage] nvarchar(255) NULL
, CONSTRAINT [PK_ArticleTypeWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ArticleType] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [ParentID] int NULL
, [Url] nvarchar(100) NULL
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
, [DisplayOrder] int NULL
, CONSTRAINT [PK_ArticleType] PRIMARY KEY ([ID])
);
CREATE TABLE [ArticleTopWidget] (
  [ID] nvarchar(100) NOT NULL
, [ArticleTypeID] int NULL
, [Tops] int NULL
, [SubTitle] nvarchar(255) NULL
, [MoreLink] nvarchar(255) NULL
, [DetailPageUrl] nvarchar(255) NULL
, CONSTRAINT [PK_ArticleTopWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ArticleSummaryWidget] (
  [ID] nvarchar(100) NOT NULL
, [SubTitle] nvarchar(255) NULL
, [Style] nvarchar(255) NULL
, [DetailLink] nvarchar(255) NULL
, [Summary] ntext NULL
, CONSTRAINT [PK_ArticleSummaryWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ArticleListWidget] (
  [ID] nvarchar(100) NOT NULL
, [ArticleTypeID] int NULL
, [DetailPageUrl] nvarchar(255) NULL
, [IsPageable] bit NOT NULL
, [PageSize] int NULL
, CONSTRAINT [PK_ArticleListWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
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
, CONSTRAINT [PK__ArticleG__3214EC270577CB2C] PRIMARY KEY ([ID])
);
CREATE TABLE [ArticleDetailWidget] (
  [ID] nvarchar(100) NOT NULL
, [CustomerClass] nvarchar(255) NULL
, CONSTRAINT [PK_ArticleDetailWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Article] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Summary] nvarchar(255) NULL
, [MetaKeyWords] nvarchar(255) NULL
, [MetaDescription] nvarchar(255) NULL
, [Counter] int NULL
, [ArticleTypeID] int NULL
, [Description] nvarchar(255) NULL
, [ArticleContent] ntext NULL
, [Status] int NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [ImageUrl] nvarchar(255) NULL
, [IsPublish] bit NOT NULL
, [PublishDate] datetime NULL
, [Url] nvarchar(100) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Article] PRIMARY KEY ([ID])
, FOREIGN KEY ([ArticleTypeID]) REFERENCES [ArticleType] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ApplicationSetting] (
  [SettingKey] nvarchar(50) NOT NULL COLLATE NOCASE
, [Value] ntext NULL
, [Title] nvarchar(200) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ApplicationSetting] PRIMARY KEY ([SettingKey])
);
INSERT INTO [Users] ([UserID],[PassWord],[ApiLoginToken],[LastLoginDate],[LoginIP],[PhotoUrl],[Timestamp],[UserName],[UserTypeCD],[Address],[Age],[Birthday],[Birthplace],[Email],[EnglishName],[FirstName],[Hobby],[LastName],[MaritalStatus],[MobilePhone],[NickName],[Profession],[QQ],[School],[Sex],[Telephone],[ZipCode],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Status],[Description],[ResetToken],[ResetTokenDate]) VALUES ('admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',NULL,'2024-11-16 13:52:55.285','::1','~/images/head.png',0,'ZKEASOFT',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Admin',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'admin','Admin','2024-11-16 13:52:55.291',1,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Banner','Banner','Thumbnail\SectionTemplate.Banner.png','Thumbnail\SectionTemplate.Banner.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Brand','Brand','Thumbnail\SectionTemplate.Brand.png','Thumbnail\SectionTemplate.Brand.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.CalendarEvent','History','Thumbnail\SectionTemplate.CalendarEvent.png','Thumbnail\SectionTemplate.CalendarEvent.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Column','2Col','Thumbnail\SectionTemplate.Column.png','Thumbnail\SectionTemplate.Column.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Default','Default','Thumbnail\SectionTemplate.Default.png','Thumbnail\SectionTemplate.Default.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.GreyBox','Grey Bg','Thumbnail\SectionTemplate.GreyBox.png','Thumbnail\SectionTemplate.GreyBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageBox','Image Box','Thumbnail\SectionTemplate.ImageBox.png','Thumbnail\SectionTemplate.ImageBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageGreyBox','Image Grey Box','Thumbnail\SectionTemplate.ImageGreyBox.png','Thumbnail\SectionTemplate.ImageGreyBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageRight','Image Right','Thumbnail\SectionTemplate.ImageRight.png','Thumbnail\SectionTemplate.ImageRight.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.JCarousel','Carousel','Thumbnail\SectionTemplate.JCarousel.png','Thumbnail\SectionTemplate.JCarousel.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LeftThreeIcon','Left 3 Icon','Thumbnail\SectionTemplate.LeftThreeIcon.png','Thumbnail\SectionTemplate.LeftThreeIcon.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LifeStyle','Lift Style','Thumbnail\SectionTemplate.LifeStyle.png','Thumbnail\SectionTemplate.LifeStyle.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LinkGroup','Links','Thumbnail\SectionTemplate.LinkGroup.png','Thumbnail\SectionTemplate.LinkGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ListGroup','List Group','Thumbnail\SectionTemplate.ListGroup.png','Thumbnail\SectionTemplate.ListGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ListView','Media List','Thumbnail\SectionTemplate.ListView.png','Thumbnail\SectionTemplate.ListView.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Portfolio','Portfolio','Thumbnail\SectionTemplate.Portfolio.png','Thumbnail\SectionTemplate.Portfolio.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ProductHero','Product Heading','Thumbnail\SectionTemplate.ProductHero.png','Thumbnail\SectionTemplate.ProductHero.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Quote','Quote','Thumbnail\SectionTemplate.Quote.png','Thumbnail\SectionTemplate.Quote.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.RightThreeIcon','Right 3 Icon','Thumbnail\SectionTemplate.RightThreeIcon.png','Thumbnail\SectionTemplate.RightThreeIcon.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.SalePrice','Quote','Thumbnail\SectionTemplate.SalePrice.png','Thumbnail\SectionTemplate.SalePrice.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ShortcutNav','Shortcut Nav','Thumbnail\SectionTemplate.ShortcutNav.png','Thumbnail\SectionTemplate.ShortcutNav.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Tab','Tag','Thumbnail\SectionTemplate.Tab.png','Thumbnail\SectionTemplate.Tab.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Thumbnail','Thumbnail','Thumbnail\SectionTemplate.Thumbnail.png','Thumbnail\SectionTemplate.Thumbnail.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('105','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('107','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('14','2b3eb61307d24c50a6b3aaa75db3810e','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('17','00f62c5acfe840e0bee3ca2979f0f025','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('20','f6f11ba2fec844de883acf0a1fe3eb89','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('23','481574ebc98b4cdf9a07e3f20c1ab78d','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('33','55b73e54fd054de4847960bdac350c6d','Construction Industry',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('34','55b73e54fd054de4847960bdac350c6d','Energy and Chemical Industry',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('47','1fb967867e3b440e86336bc5a51e8719','Construction Industry',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('48','1fb967867e3b440e86336bc5a51e8719','Energy and Chemical Industry',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('49','1fb967867e3b440e86336bc5a51e8719','Automobile Industry',NULL,NULL);
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('106','f41174cfa4d247f4974c47f4d2b000fd','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a> is based on <a href="http://www.zkea.net/easyframework">EasyFrameWork</a>, developed using ASP.NET MVC4.</p>
<p>ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layout, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, allowing direct design on the preview page.</p>
<p>ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('108','f41174cfa4d247f4974c47f4d2b000fd','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a> is based on <a href="http://www.zkea.net/easyframework">EasyFrameWork</a>, developed using ASP.NET MVC4.</p>
<p>ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layout, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, allowing direct design on the preview page.</p>
<p>ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('15','2b3eb61307d24c50a6b3aaa75db3810e','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('165','80f365c7991a49a0b04aa11006018814','<p>Username, password: admin</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('18','00f62c5acfe840e0bee3ca2979f0f025','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('21','f6f11ba2fec844de883acf0a1fe3eb89','<p>ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layout, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, allowing direct design on the preview page.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('24','481574ebc98b4cdf9a07e3f20c1ab78d','<p>Mainly focused on multinational companies that have entered the Chinese market, leading foreign enterprises in the industry, well-known large and medium-sized Chinese enterprises, and more rapidly growing emerging enterprises.</p>
<p>Especially good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('26','b568ff7f4a894870adaf9afadf787bf9','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('28','b568ff7f4a894870adaf9afadf787bf9','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('30','55b73e54fd054de4847960bdac350c6d','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('32','55b73e54fd054de4847960bdac350c6d','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('36','ed837392097f4e60b812bc57111dd762','<p><span>Gasoline,</span><span> jet fuel, diesel, heavy oil, and other liquid fuels obtained from petroleum refining.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('38','ed837392097f4e60b812bc57111dd762','<p><span>Gasoline,</span><span> jet fuel, diesel, heavy oil, and other liquid fuels obtained from petroleum refining.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('40','ed837392097f4e60b812bc57111dd762','<p><span>Gasoline,</span><span> jet fuel, diesel, heavy oil, and other liquid fuels obtained from petroleum refining.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('42','1fb967867e3b440e86336bc5a51e8719','<p><span>In the process of integrating the architectural design market with international standards,</span><span> architectural engineering structural design will occupy an increasingly important position.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('44','1fb967867e3b440e86336bc5a51e8719','<p><span>Gasoline,</span><span> jet fuel, diesel, heavy oil, and other liquid fuels obtained from petroleum refining.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('46','1fb967867e3b440e86336bc5a51e8719','<p><span>The current situation of China automobile industry is mixed,</span><span> looking forward to the future of China automobile industry, risks and opportunities coexist.</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','<p>Username, password: admin</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','<p>Frontend user registration, user management</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','<p>Frontend user registration, user management</p>');
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('13','2b3eb61307d24c50a6b3aaa75db3810e','~/images/01.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('16','00f62c5acfe840e0bee3ca2979f0f025','~/images/02.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('19','f6f11ba2fec844de883acf0a1fe3eb89','~/images/04.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('22','481574ebc98b4cdf9a07e3f20c1ab78d','~/images/03.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('25','b568ff7f4a894870adaf9afadf787bf9','~/images/05.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('27','b568ff7f4a894870adaf9afadf787bf9','~/images/06.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('29','55b73e54fd054de4847960bdac350c6d','~/images/07.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('31','55b73e54fd054de4847960bdac350c6d','~/images/08.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('35','ed837392097f4e60b812bc57111dd762','~/images/09.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('37','ed837392097f4e60b812bc57111dd762','~/images/10.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('39','ed837392097f4e60b812bc57111dd762','~/images/11.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('41','1fb967867e3b440e86336bc5a51e8719','~/images/12.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('43','1fb967867e3b440e86336bc5a51e8719','~/images/13.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('45','1fb967867e3b440e86336bc5a51e8719','~/images/14.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','License','http://www.zkea.net/licenses');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','Login','/admin');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('1','80f365c7991a49a0b04aa11006018814','Login','/admin');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('163','604b2461f7c545e28dbb21fb15def5c7','Commercial License','http://www.zkea.net/zkeacms/price');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('164','604b2461f7c545e28dbb21fb15def5c7','License','http://www.zkea.net/licenses');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','Personal Center','/Account');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','Commercial License','http://www.zkea.net/zkeacms/price');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','Developer Documentation','http://www.zkea.net/zkeacms/document');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('3','604b2461f7c545e28dbb21fb15def5c7','GitHub','https://github.com/SeriaWei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('4','604b2461f7c545e28dbb21fb15def5c7','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','Open Source China','http://git.oschina.net/seriawei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('5','604b2461f7c545e28dbb21fb15def5c7','Official Website','http://www.zkea.net');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('6','604b2461f7c545e28dbb21fb15def5c7','Open Source China','http://git.oschina.net/seriawei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','GitHub','https://github.com/SeriaWei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','Official Website','http://www.zkea.net');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','Developer Documentation','http://www.zkea.net/zkeacms/document');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','Personal Center','/Account');
INSERT INTO [Roles] ([ID],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Administrator','Administrator',1,NULL,NULL,NULL,'admin','ZKEASOFT','2023-03-18 16:45:26.703');
INSERT INTO [UserRoleRelation] ([ID],[RoleID],[UserID]) VALUES (5,1,'admin');
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (28,1,3,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (29,1,2,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (30,2,7,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (31,2,6,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (32,2,5,NULL);
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,1,'/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','HX-HSCR-BK/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.746');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,1,'/images/6006218/56657706-58757e00-66cb-11e9-80b8-fdc32783ff68.png','HX-HSCRS-GM/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.750');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,2,'/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,2,'/images/6006218/56657774-78a53d00-66cb-11e9-9ab9-c4b65f3cba22.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,2,'/images/6006218/56657795-85299580-66cb-11e9-9a3f-a1c5bde7b191.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,2,'/images/6006218/56657844-9a9ebf80-66cb-11e9-91ed-02001fab09c8.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,2,'Color',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:45.550');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,2,'Black',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:50.530');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,2,'Black Silver',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:11:03.656');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,3,'Operation Style',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:07.706');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,3,'Click',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:14.870');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,3,'Tactile',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:20.713');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,3,'Linear',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:28.660');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[DisplayOrder]) VALUES (1,'Product',NULL,0,'products',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:32.000','admin','ZKEASOFT','2024-11-16 13:53:22.181',NULL);
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[DisplayOrder]) VALUES (2,'Headset',NULL,1,'headset',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:50.000','admin','ZKEASOFT','2018-08-15 15:30:59.233',NULL);
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[DisplayOrder]) VALUES (3,'Keyboard',NULL,1,'keyboard',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:07.000','admin','ZKEASOFT','2018-08-15 15:31:08.063',NULL);
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Cloud Revolver Gaming Headset','/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png',NULL,2,NULL,500.0000,399.0000,NULL,NULL,NULL,'<h1>HyperX Cloud Revolver</h1>
<p>If you love gaming, a headset that gives you a great advantage is essential. The HyperX Cloud Revolver™ is a premium headset, crafted to meet the needs of advanced OC or home gaming enthusiasts. The next-generation drivers separate bass, mid, and treble, creating a precise, high-quality sound. The Revolver series features stereo and plug-and-play Dolby® 7.1 surround sound modes, offering studio-grade soundstage and next-gen drivers, excelling in FPS and open environments. Both headsets feature a durable solid steel frame and signature HyperX memory foam for award-winning comfort. If you want unparalleled comfort, excellent sound quality, and clear communication, the Cloud Revolver headset is your best choice.</p>
<h3>Plug-and-play Dolby® Surround Sound 7.1</h3>
<p>Simulated 7 positional speakers create precise sound by distance and depth, turning audio entertainment into a cinematic experience without software or setup. Available on Cloud Revolver S.</p>
<h3>Advanced USB Audio Control Box with DSP Sound Card</h3>
<p>The USB digital signal processing sound card delivers consistent high-quality audio on any machine. The clip-on audio control box features backlit buttons for instant mute, Dolby audio activation, switching between three preset EQs, and adjusting mic and volume levels. Available on Cloud Revolver S.</p>
<h3>Next-Gen 50mm Drivers</h3>
<p>50mm directional drivers parallel to the ears for precise positioning and powerful bass. Available on Cloud Revolver and Cloud Revolver S.</p>
<h3>HyperX Signature Memory Foam</h3>
<p>Award-winning HyperX memory foam for unparalleled comfort, allowing you to game longer and more comfortably. Available on Cloud Revolver and Cloud Revolver S.</p>','Simulated 7 positional speakers create precise sound by distance and depth',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,'Cloud-Revolver',NULL,NULL,'HX-HSCR-BK/AS','admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 21:52:05.396');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'Alloy FPS Mechanical Gaming Keyboard','/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png','/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,3,'Black',500.0000,499.0000,NULL,NULL,NULL,'<h1>Compact and portable, start FPS gaming anytime, anywhere.</h1>
<p>The HyperX™ Alloy FPS keyboard is durable and reliable, providing gamers with an excellent gaming experience. If you need a full-size keyboard, the Alloy FPS will meet all your needs. If you prefer the Tenkeyless (TKL) mode for most essential keys, the Alloy FPS Pro keyboard will fully satisfy your needs. Each keyboard meets the demands of serious FPS gamers: reliable CHERRY® MX switches, solid steel frame, detachable cable, game mode, 100% anti-ghosting, and N-key rollover. Whether you are a professional FPS player or just a casual gamer, the HyperX Alloy FPS keyboard will meet your needs.</p>
<h3>Minimalist design, compact, perfect for FPS gaming</h3>
<p>Maximizes desktop space for quick mouse movements.</p>
<h3>Solid steel frame</h3>
<p>Ensures durability and stability.</p>
<h3>Reliable CHERRY® MX mechanical switches</h3>
<p>Available in CHERRY MX Blue, Brown, or Red switches, offering renowned reliability and your preferred switch style.</p>
<h3>Ultra-portable design with detachable cable</h3>
<p>Saves storage space and reduces potential cable damage.</p>
<h3>HyperX red backlit keys with dynamic lighting effects</h3>
<p>Show off your style with brilliant backlighting.</p>','Solid steel frame, CHERRY® MX mechanical switches, detachable cable',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,'Alloy-FPS',NULL,NULL,'HX-KB4RD1-US/R1','admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 21:52:25.420');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_Manage',1,'Manage Application Settings',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.566','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_View',1,'View Application Settings',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.646','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Manage',1,'Manage Articles',NULL,'Articles',NULL,'admin','ZKEASOFT','2016-08-01 13:18:40.493','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Publish',1,'Publish Articles',NULL,'Articles',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.820','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_View',1,'View Articles',NULL,'Articles',NULL,'admin','ZKEASOFT','2016-08-01 13:17:59.120','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_Manage',1,'Manage Article Categories',NULL,'Articles',NULL,'admin','ZKEASOFT','2016-08-01 13:22:24.886','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_View',1,'View Article Categories',NULL,'Articles',NULL,'admin','ZKEASOFT','2016-08-01 13:19:54.500','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_Manage',1,'Manage Carousels',NULL,'Carousel',NULL,'admin','ZKEASOFT','2016-08-01 13:45:46.190','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_View',1,'View Carousels',NULL,'Carousel',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.096','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_Manage',1,'Manage Comments',NULL,'Message Board',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.053','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_View',1,'View Comments',NULL,'Message Board',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.050','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Config_Currency',1,'Currency',NULL,'Settings',NULL,'admin','ZKEASOFT','2021-03-06 22:16:30.726','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventNotification_Manage',1,'Manage Event Notifications',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.766','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventNotification_View',1,'View Event Notifications',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.760','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventViewer_Manage',1,'View Error Logs',NULL,'Settings',NULL,'admin','ZKEASOFT','2017-07-11 15:43:52.146','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_Manage',1,'Manage Forms',NULL,'Custom Forms',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_View',1,'View Form',NULL,'Custom Form',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.830','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Export',1,'Export Form Data',NULL,'Custom Form',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.853','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Manage',1,'Manage Form Data',NULL,'Custom Form',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.850','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_View',1,'View Form Data',NULL,'Custom Form',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Language_Manage',1,'Translate',NULL,'Settings',NULL,'admin','ZKEASOFT','2017-11-17 11:47:13.093','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_Manage',1,'Manage Layout',NULL,'Layout',NULL,'admin','ZKEASOFT','2016-08-01 12:43:52.696','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_View',1,'View Layout',NULL,'Layout',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.690','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('LiveChatScript_Manage',1,'Set Online Customer Service Code',NULL,'Settings',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_Manage',1,'Manage Media Library',NULL,'Media Library',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.553','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_View',1,'View Media Library',NULL,'Media Library',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.090','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_Manage',1,'Manage Messages',NULL,'Message Board',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.980','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_View',1,'View Messages',NULL,'Message Board',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.960','admin','ZKEASOFT','2023-03-18 16:45:26.283');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_Manage',1,'Manage Navigation',NULL,'Navigation',NULL,'admin','ZKEASOFT','2016-08-01 13:40:38.230','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_View',1,'View Navigation',NULL,'Navigation',NULL,'admin','ZKEASOFT','2016-08-01 13:38:21.943','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('NotificationContent_Manage',1,'Manage Notification Content',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('NotificationContent_View',1,'View Notification Content',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Manage',1,'Manage Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Refund',1,'Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_View',1,'View Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderPayment',1,'View Transactions',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderRefund',1,'View Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_Manage',1,'Manage Page',NULL,'Page',NULL,'admin','ZKEASOFT','2016-08-01 13:41:08.463','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_View',1,'View Page',NULL,'Page',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.683','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Payment_Config_Manage',1,'Payment Setting',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('PendingTask_Manage',1,'Manage Pending Task',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('PendingTask_View',1,'View Pending Task',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Plugin_View',1,'Plugin',NULL,'Setting',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.726','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Manage',1,'Manage Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Publish',1,'Publish Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_View',1,'View Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.656','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_Manage',1,'Manage Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_View',1,'View Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_Manage',1,'Manage Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_View',1,'View Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.676','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('RobotsSetting',1,'Robots.txt',NULL,'Setting',NULL,'admin','ZKEASOFT','2018-08-12 22:51:30.340','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_Manage',1,'Manage Role',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.566','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_View',1,'View Role',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.660','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SMTPSetting',1,'SMTP Settings',NULL,'Settings',NULL,'admin','ZKEASOFT','2018-06-12 19:13:49.496','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('StatisticsScript_Manage',1,'Set Visitor Statistics Code',NULL,'Settings',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Template_Manage',1,'Manage Templates',NULL,'Page Layout',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.306','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Template_View',1,'View Templates',NULL,'Page Layout',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.303','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('TemplateImporter_Import',1,'Import HTML Template',NULL,'Settings',NULL,'admin','ZKEASOFT','2020-03-14 11:41:54.510','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_Manage',1,'Manage Themes',NULL,'Themes',NULL,'admin','ZKEASOFT','2016-08-01 13:42:48.600','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_View',1,'View Themes',NULL,'Themes',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.083','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_Manage',1,'Manage URL Redirects',NULL,'URL Redirects',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.170','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_View',1,'View URL Redirects',NULL,'URL Redirects',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.120','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_Manage',1,'Manage Users',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.566','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_View',1,'View Users',NULL,'User/Security',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.646','admin','ZKEASOFT','2023-03-18 16:45:26.286');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1061019b1bcd4bf3aeb3df647c74c309','#','~/product','Product',1,NULL,NULL,1,3,'admin','ZKEASOFT','2016-03-10 23:33:03.653','admin','ZKEASOFT','2017-10-15 18:05:28.830');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6beb1a2a54b947179ec20dd331e375a2','#','~/index','Home',0,NULL,NULL,1,1,'admin',NULL,'2015-09-01 09:55:20.483','admin','ZKEASOFT','2017-10-15 18:05:28.820');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('7b5bb24dea6d47618ed027190b4e5d94','#','~/contact','Contact',0,NULL,NULL,1,5,'admin','ZKEASOFT','2017-03-19 21:06:21.360','admin','ZKEASOFT','2017-10-15 18:05:28.833');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d122a50356bf46c8a8c8349612145e24','#','~/questionnaire','Survey',0,NULL,NULL,1,4,'admin','ZKEASOFT','2017-10-15 18:05:25.946','admin','ZKEASOFT','2017-10-15 18:05:28.836');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e4658e8af8434a05b773b666c6c67cd5','#','~/article','News',1,NULL,NULL,1,2,'admin','ZKEASOFT','2016-03-10 23:32:53.000','admin','ZKEASOFT','2017-10-15 18:05:28.826');
INSERT INTO [Forms] ([ID],[Title],[FieldsData],[NotificationReceiver],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('5ed56d90ac154e73befa6fbc981ae3ae','Survey','[{"ID":"f05da60a6e3b448fadbf7c5c040a7d5c","Name":"Label","DisplayName":"Survey","Value":null,"Description":"Welcome to use ZKEACMS, this is an custom form","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"41481e6eefa048feae380460b0cd5661","Name":"SingleLine","DisplayName":"Name","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"bfd1418684a64890a7099f764baa24b3","Name":"Number","DisplayName":"Phone","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"7e635c8fdd124b6b94f037d3bf112bc0","Name":"Email","DisplayName":"Email","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"4d61bb5f733c47778975cc6cfbc84123","Name":"SingleLine","DisplayName":"QQ","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"b85aeb9beaf64f509726f16ba582ec3c","Name":"SingleLine","DisplayName":"WeChat","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"a2aea72c496e4a458265f7ceadb3653a","Name":"Address","DisplayName":"Province","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"0932ca1f1f7f4af098d51e4b1ac18b94","Name":"SingleLine","DisplayName":"Address","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"572c61930769464d97f3d31771ecf65e","Name":"Radio","DisplayName":"How do you know ZKEACMS?","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"SE(search engine)","Value":"70a915caf7a84e9086d5dbdf26ed3053"},{"DisplayText":"Blog","Value":"419a7d1d91974282af5c26688fbe0e8c"},{"DisplayText":"From frends","Value":"227f6d2f6b39479aaf2d5b79dbefdc5c"},{"DisplayText":"Other","Value":"ef50fb3bccf74d6487320e53781fb1ec"}],"AdditionalSettings":null},{"ID":"845830a5c8be4b81866a8cef83049899","Name":"Checkbox","DisplayName":"What do you normally use ZKEACMS for","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"Web Site","Value":"5f0fbb9faa0343e0958a896fe3cead4f"},{"DisplayText":"Blog","Value":"65902e51d35142019c4aab8badff9e35"},{"DisplayText":"Other","Value":"944343b3ed904b94a9db6950dbdcccf3"}],"AdditionalSettings":null},{"ID":"2fe6e4baf01e4cb897986991c920df56","Name":"Dropdown","DisplayName":"What do you think of ZKEACMS","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"Great","Value":"fc3929826e364318b7a3436d991fb097"},{"DisplayText":"Good","Value":"619e09c2864b41ae81f4f90e7cab92ba"},{"DisplayText":"Just so so","Value":"fd1279a07150490f9a1f69c85298e22c"},{"DisplayText":"Bad","Value":"ef19983754504a9482232dd6be01f34d"}],"AdditionalSettings":null},{"ID":"2868de2d8e9b4d269da891342e6dc95b","Name":"Paragraph","DisplayName":"Your comments or suggestions","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null}]',NULL,NULL,'',NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:07:58.013');
INSERT INTO [EA_EventAction] ([ID],[Event],[Actions],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'ZKEACMS.Message.Events.OnMessageSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: New message received
    to: webmaster@zkea.net
    bodyContentId: 1','Send new message email notification',NULL,1,'admin','ZKEASOFT','2023-03-03 21:53:14.000','admin','ZKEASOFT','2023-03-12 21:12:14.786');
INSERT INTO [EA_EventAction] ([ID],[Event],[Actions],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'ZKEACMS.Events.OnResetPassword','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: Reset password
    to: {{this.Model.Email}}
    bodyContentId: 2','Send reset password email notification',NULL,1,'admin','ZKEASOFT','2023-03-11 21:33:51.000','admin','ZKEASOFT','2023-03-16 21:59:47.366');
INSERT INTO [EA_EventAction] ([ID],[Event],[Actions],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'ZKEACMS.Message.Events.OnCommentsSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: New comment received
    to: webmaster@zkea.net
    bodyContentId: 3','Send new comment email notification',NULL,1,'admin','ZKEASOFT','2023-03-11 21:44:02.000','admin','ZKEASOFT','2023-03-16 22:05:12.060');
INSERT INTO [EA_EventAction] ([ID],[Event],[Actions],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'ZKEACMS.FormGenerator.Events.OnFormDataSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: New form submission received
    to: {{this.Model.Form.NotificationReceiver}}
    bodyContentId: 4','Send custom form email notification',NULL,1,'admin','ZKEASOFT','2023-03-11 22:07:27.000','admin','ZKEASOFT','2023-03-16 22:06:44.226');
INSERT INTO [EA_ActionBody] ([ID],[Body],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'<div>
  <h3>
     New Message Received
  </h3>
  <table border="1" cellspacing="0" cellpadding="5" style="border-color: #eee;">
    <tbody>
      <tr>
        <td>Name</td>
        <td>{{this.Model.Title}}</td>
      </tr>
      <tr>
        <td>Email</td>
        <td>{{this.Model.Email}}</td>
      </tr>
      <tr>
        <td>Message Content</td>
        <td>{{this.Model.PostMessage}}</td>
      </tr>
    </tbody>
  </table>
</div>','Message Board Message Template',NULL,1,'admin','ZKEASOFT','2023-03-05 18:49:06.000','admin','ZKEASOFT','2023-03-16 22:04:16.673');
INSERT INTO [EA_ActionBody] ([ID],[Body],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'<div>
  <h3>
    Reset Password
  </h3>
  <p>
    Click the link below or copy and paste the link into your browser.
  </p>
  <a href="{{this.Model.Link}}" target="_blank">{{this.Model.Link}}</a>
</div>','Reset Password Email Template',NULL,1,'admin','ZKEASOFT','2023-03-11 21:32:20.000','admin','ZKEASOFT','2023-03-16 22:03:47.810');
INSERT INTO [EA_ActionBody] ([ID],[Body],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'<div>
  <h3>
    New Comment Received
  </h3>
  <table border="1" cellspacing="0" cellpadding="5" style="border-color: #eee;">
    <tbody>
      <tr>
        <td>Page Title</td>
        <td>{{this.Model.Title}}</td>
      </tr>
      <tr>
        <td>Username</td>
        <td>{{this.Model.UserName}}</td>
      </tr>
      <tr>
        <td>Comment Content</td>
        <td>{{this.Model.CommentContent}}</td>
      </tr>
      <tr>
        <td>Page URL</td>
        <td>{{this.Model.PagePath}}</td>
      </tr>
    </tbody>
  </table>
</div>','New Comment Email Template',NULL,1,'admin','ZKEASOFT','2023-03-11 21:44:54.000','admin','ZKEASOFT','2023-03-16 22:03:57.626');
INSERT INTO [EA_ActionBody] ([ID],[Body],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'<div>
  <h3>
    {{this.Model.Form.Title}}
  </h3>
  <table border="1" cellspacing="0" cellpadding="5" style="border-color: #eee;">
    <thead>
      <tr>
        <th>Field</th>
        <th>Content</th>
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
</div>','Custom Form Email Template',NULL,1,'admin','ZKEASOFT','2023-03-11 22:06:21.000','admin','ZKEASOFT','2023-03-16 22:03:40.576');
INSERT INTO [DBVersion] ([ID],[Major],[Minor],[Revision],[Build]) VALUES (1,4,2,0,0);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'RecordStatus','Active','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'RecordStatus','Inactive','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'ArticleCategory','News','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'ArticleCategory','Company News','2',2,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,'ArticleCategory','Industry News','3',3,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,'UserEntity@Sex','Male','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,'UserEntity@Sex','Female','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (8,'UserEntity@MaritalStatus','Unmarried','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (9,'UserEntity@MaritalStatus','Married','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (11,'UserEntity@UserTypeCD','Administrator','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (12,'ArticleTopWidget@PartialView','Default','Widget.ArticleTops',1,0,1,NULL,'~/images/article/005.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (13,'ArticleListWidget@PartialView','Default','Widget.ArticleList',1,0,1,NULL,'~/images/article/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (14,'ArticleListWidget@PartialView','Banner','Widget.ArticleList-Snippet',2,0,1,NULL,'~/images/article/001.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (15,'ProductListWidget@PartialView','Default','Widget.ProductList',1,0,1,NULL,'~/images/product/003.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (16,'ProductListWidget@Columns','3 Columns','col-xs-12 col-sm-6 col-md-4',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (17,'ProductListWidget@Columns','4 Columns','col-xs-12 col-sm-6 col-md-4 col-lg-3',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (18,'CarouselWidget@PartialView','Default','Widget.Carousel',1,0,1,NULL,'~/images/carousel/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (19,'ArticleSummaryWidget@Style','Default','bs-callout-default',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (20,'ArticleSummaryWidget@Style','Danger','bs-callout-danger',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (21,'ArticleSummaryWidget@Style','Warning','bs-callout-warning',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (22,'ArticleSummaryWidget@Style','Information','bs-callout-info',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (23,'ArticleSummaryWidget@Style','Success','bs-callout-success',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (24,'ArticleSummaryWidget@PartialView','Default','Widget.ArticleSummary',1,0,1,NULL,'~/images/article/012.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (25,'ProductCategoryWidget@PartialView','Default','Widget.ProductCategory',1,0,1,NULL,'~/images/product/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (26,'ArticleTypeWidget@PartialView','Default','Widget.ArticleType',1,0,1,NULL,'~/images/article/009.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (27,'UserEntity@UserTypeCD','Customer','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (28,'Order@OrderStatus','Unpaid','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (29,'Order@OrderStatus','Cancel','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (30,'Order@OrderStatus','Paid','3',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (31,'Order@OrderStatus','Shipped','4',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (32,'Order@OrderStatus','Traid Finished','5',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (33,'Order@OrderStatus','Refunded','6',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (34,'Order@OrderStatus','Refunding','7',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (35,'ProductListWidget@PartialView','List','Widget.ProductList.A',2,0,1,NULL,'~/images/product/004.png',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (36,'RuleItem@Condition','And','and',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (37,'RuleItem@Condition','Or','or',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (38,'RuleItem@FunctionName','Equals','Equals',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (39,'RuleItem@FunctionName','Not Equals','NotEquals',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (40,'RuleItem@FunctionName','Greater Than','GreaterThan',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (41,'RuleItem@FunctionName','Greater Than Or Equals','GreaterThanOrEquals',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (42,'RuleItem@FunctionName','Less Than','LessThan',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (43,'RuleItem@FunctionName','Less Than Or Equals','LessThanOrEquals',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (44,'RuleItem@FunctionName','Starts With','StartsWith',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (45,'RuleItem@FunctionName','Ends With','EndsWith',8,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (46,'RuleItem@FunctionName','Not Starts With','NotStartsWith',9,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (47,'RuleItem@FunctionName','Not Ends With','NotEndsWith',10,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (48,'RuleItem@FunctionName','Contains','Contains',11,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (49,'RuleItem@FunctionName','Not Contains','NotContains',12,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (50,'RuleItem@FunctionName','In','In',13,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (51,'RuleItem@FunctionName','Not In','NotIn',14,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (52,'RuleItem@Property','Url','ValueOf(''Url'')',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (53,'RuleItem@Property','Query String','ValueOf(''QueryString'')',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (54,'RuleItem@Property','User-Agent','ValueOf(''UserAgent'')',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (55,'RuleItem@Property','Today','ValueOf(''Now'')',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (56,'NavigationWidget@PartialView','Default','Widget.Navigation',1,0,1,NULL,'~/images/navigation/000.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (57,'NavigationWidget@PartialView','Style A','Widget.Navigation.A',2,0,1,NULL,'~/images/navigation/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (58,'NavigationWidget@PartialView','Style B','Widget.Navigation.B',3,0,1,NULL,'~/images/navigation/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (59,'NavigationWidget@PartialView','Style C','Widget.Navigation.C',4,0,1,NULL,'~/images/navigation/003.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (60,'NavigationWidget@PartialView','Style D','Widget.Navigation.D',5,0,1,NULL,'~/images/navigation/004.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (61,'NavigationWidget@PartialView','Style E','Widget.Navigation.E',6,0,1,NULL,'~/images/navigation/005.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (62,'NavigationWidget@PartialView','Style F','Widget.Navigation.F',7,0,1,NULL,'~/images/navigation/006.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (63,'NavigationWidget@PartialView','Style G','Widget.Navigation.G',8,0,1,NULL,'~/images/navigation/007.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (64,'ArticleListWidget@PartialView','Style A','Widget.ArticleList.A',3,0,1,NULL,'~/images/article/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (65,'ArticleListWidget@PartialView','Style B','Widget.ArticleList.B',4,0,1,NULL,'~/images/article/003.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (66,'ArticleListWidget@PartialView','Style C','Widget.ArticleList.C',5,0,1,NULL,'~/images/article/004.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (67,'ArticleTopWidget@PartialView','Style A','Widget.ArticleTops.A',2,0,1,NULL,'~/images/article/006.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (68,'ArticleTopWidget@PartialView','Style B','Widget.ArticleTops.B',3,0,1,NULL,'~/images/article/007.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (69,'ArticleTopWidget@PartialView','Style C','Widget.ArticleTops.C',4,0,1,NULL,'~/images/article/008.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (70,'ArticleTypeWidget@PartialView','Style A','Widget.ArticleType.A',2,0,1,NULL,'~/images/article/010.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (71,'ArticleTypeWidget@PartialView','Style B','Widget.ArticleType.B',3,0,1,NULL,'~/images/article/011.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (72,'ArticleSummaryWidget@PartialView','Style A','Widget.ArticleSummary.A',2,0,1,NULL,'~/images/article/013.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (73,'ArticleSummaryWidget@PartialView','Style B','Widget.ArticleSummary.B',3,0,1,NULL,'~/images/article/014.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (74,'ArticleSummaryWidget@PartialView','Style C','Widget.ArticleSummary.C',4,0,1,NULL,'~/images/article/015.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (75,'ProductCategoryWidget@PartialView','Style A','Widget.ProductCategory.A',2,0,1,NULL,'~/images/product/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (76,'ProductCategoryWidget@PartialView','Style B','Widget.ProductCategory.B',3,0,1,NULL,'~/images/product/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (77,'CarouselWidget@PartialView','Style A','Widget.Carousel.A',2,0,1,NULL,'~/images/carousel/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (78,'StaticPageSetting@CacheProvider','Memory Cache','MemoryCache',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (79,'StaticPageSetting@CacheProvider','Database Cache','Database',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (80,'StaticPageSetting@CacheProvider','File Cache','File',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (81,'CultureSetting@CultureMode','Single domain','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (82,'CultureSetting@CultureMode','Standalone domain','2',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (83,'WidgetStatus','Visible','1',1,0,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (84,'WidgetStatus','Hidden','2',2,0,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (85,'WidgetStatus','Deleted','3',3,0,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Alipay.AopSdk.AspnetCore.AlipayOptions','{"AppId":null,"Uid":null,"Gatewayurl":null,"PrivateKey":null,"AlipayPublicKey":null,"SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}',NULL,NULL,NULL,NULL,NULL,'2019-04-24 19:55:03.626',NULL,NULL,'2019-04-24 19:55:03.626');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Currency.CurrencyOption','{"CurrencyID":4,"Name":"Chinese Renmenbi","Code":"CNY","Symbol":"￥"}',NULL,NULL,NULL,'admin','ZKEASOFT','2021-03-06 22:16:39.503','admin','ZKEASOFT','2021-03-06 22:16:43.466');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.GlobalScripts.Models.LiveChatScript','{"Location":0,"Script":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:35.293',NULL,NULL,'2019-04-07 16:38:35.293');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.GlobalScripts.Models.StatisticsScript','{"Location":0,"Script":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:36.006',NULL,NULL,'2019-04-07 16:38:36.006');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Message.Models.MessageNotificationConfig','{"MessageNotifyEmails":null,"CommentNotifyEmails":null}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-08-15 15:25:53.916','admin','ZKEASOFT','2018-08-15 15:25:53.916');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Shop.AliPayConfigOptions','{"AppId":"2016082000296332","Uid":"2088102172250345","Gatewayurl":"https://openapi.alipaydev.com/gateway.do","PrivateKey":"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP","AlipayPublicKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB","SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-11 17:02:14.576','admin','ZKEASOFT','2018-04-11 17:02:14.576');
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Australian Dollar',NULL,'AUD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'Brazilian Real',NULL,'BRL','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'Canadian Dollar',NULL,'CAD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'Chinese Renmenbi',NULL,'CNY','￥',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,'Czech Koruna',NULL,'CZK','Kč',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,'Danish Krone',NULL,'DKK','kr',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,'Euro',NULL,'EUR','€',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (8,'Hong Kong Dollar',NULL,'HKD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (9,'Hungarian Forint',NULL,'HUF','HUF',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (10,'Indian Rupee',NULL,'INR','INR',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (11,'Israeli New Shekel',NULL,'ILS','₪',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (12,'Japanese Yen',NULL,'JPY','￥',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (13,'Malaysian Ringgit',NULL,'MYR','MYR',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (14,'Mexican Peso',NULL,'MXN','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (15,'New Taiwan Dollar',NULL,'TWD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (16,'New Zealand Dollar',NULL,'NZD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (17,'Norwegian Krone',NULL,'NOK','NOK',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (18,'Philippine Peso',NULL,'PHP','PHP',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (19,'Polish Zloty',NULL,'PLN','zł',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (20,'Pound Sterling',NULL,'GBP','£',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (21,'Russian Ruble',NULL,'RUB','RUB',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (22,'Singapore Dollar',NULL,'SGD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (23,'Swedish Krona',NULL,'SEK','SEK',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (24,'Swiss Franc',NULL,'CHF','CHF',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (25,'Thai Baht',NULL,'THB','฿',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (26,'United States Dollar',NULL,'USD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('00f62c5acfe840e0bee3ca2979f0f025','Image Right',NULL,9,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:13:55.010','admin','ZKEASOFT','2016-06-29 14:13:22.936',NULL,NULL,1,'~/images/template%20(6).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('01b59004dd1e4f68afa98c9c80d86f4c','Form',NULL,1,NULL,'be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 17:59:05.133','admin','ZKEASOFT','2017-10-15 18:20:39.980',NULL,NULL,0,NULL,0,'{"FormID":"5ed56d90ac154e73befa6fbc981ae3ae","CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('02dd343bb4f24322bcf3daf8ada7565d','Message Board',NULL,2,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:31.030','admin','ZKEASOFT','2017-03-19 21:05:31.030',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{"ID":"02dd343bb4f24322bcf3daf8ada7565d","WidgetName":"Message Board","Position":2,"LayoutID":null,"PageID":"534e07f396b14b7584a833d270356cb7","ZoneID":"d5f02570e4814439acc86a1874cb8f07","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.MessageBox","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageBoxWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageBoxWidget","FormView":null,"StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendData":null,"ExtendFields":[],"Title":null,"Description":null,"Status":null,"CreateBy":"admin","CreatebyName":"ZKEASOFT","CreateDate":"2017-03-19T21:04:44.953","LastUpdateBy":"admin","LastUpdateByName":"ZKEASOFT","LastUpdateDate":"2017-03-19T21:04:44.953","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('062018a8e5cf48b4a0d90296e7f4e965','Separator',NULL,2,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-11 10:01:58.756','admin','ZKEASOFT','2016-03-11 10:01:58.756',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('09617f6142934daaadee6cfb9df6d66f','Paragraph',NULL,4,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:53:07.263','admin','ZKEASOFT','2016-03-24 10:49:44.100',NULL,NULL,1,'~/images/template%20(2).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('0f66ab8ff0df44e2b5e57fd8d8c5d8ff','3Col (text)',NULL,8,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:23:51.276','admin','ZKEASOFT','2016-06-29 14:12:54.386',NULL,NULL,1,'~/images/template (15).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('1433264e95f545ab97e6a481fa3747ea','Comment Box',NULL,2,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:36.466','admin','ZKEASOFT','2017-12-03 17:11:36.466',NULL,NULL,0,NULL,0,'{"CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('155c6511dd9c4cc1b3ccb27d5ad4b8ab','Form',NULL,1,NULL,'9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 18:20:42.213','admin','ZKEASOFT','2017-10-15 18:20:42.213',NULL,NULL,0,NULL,0,'{"FormID":"5ed56d90ac154e73befa6fbc981ae3ae","CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('19350341920b4827bf2a4e458ad24a58','Carousel',NULL,1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,'','admin','ZKEASOFT','2016-03-27 15:14:34.676','admin','ZKEASOFT','2020-03-21 14:01:56.236',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('1fb967867e3b440e86336bc5a51e8719','3 Image (Circle)',NULL,17,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:40:26.766','admin','ZKEASOFT','2016-06-29 14:19:30.776',NULL,NULL,1,'~/images/template%20(12).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('2b3eb61307d24c50a6b3aaa75db3810e','Image Left',NULL,11,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:06:17.636','admin','ZKEASOFT','2016-06-29 14:14:54.330',NULL,NULL,1,'~/images/template%20(5).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('2b510992f0174e668ca53116434e065c','Image',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:15:37.333','admin','ZKEASOFT','2017-10-15 18:00:21.586',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3017aef0eabc451b81daebe6bae68857','Image',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.950','admin','ZKEASOFT','2017-10-15 18:11:44.950',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('34567e55bacd40dbaf9794d5032dd26e','Message Board',NULL,4,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.976','admin','ZKEASOFT','2017-03-19 21:05:30.976',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{"FormView":null,"ExtendData":null,"Description":null,"Status":null,"CreateBy":"admin","CreatebyName":"ZKEASOFT","CreateDate":"2017-03-19T21:04:56.38","LastUpdateBy":"admin","LastUpdateByName":"ZKEASOFT","LastUpdateDate":"2017-03-19T21:04:56.38","ActionType":1,"ID":"34567e55bacd40dbaf9794d5032dd26e","WidgetName":"Message Board","Position":4,"LayoutID":null,"PageID":"534e07f396b14b7584a833d270356cb7","ZoneID":"d5f02570e4814439acc86a1874cb8f07","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.Message","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageWidget","StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendFields":[],"Title":null}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3466e616139645d2b1e1d9935d231922','Product Category','Product Category',1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.876','admin','ZKEASOFT','2016-05-15 20:56:40.876',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('357a58069e8047a289e10b920061d57d','Separator',NULL,3,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.900','admin','ZKEASOFT','2017-03-19 21:05:30.900',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3aa8b53e7ad143ff818855a7abcb3fdd','Article Content',NULL,1,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.290','admin','ZKEASOFT','2017-12-03 17:11:47.290',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3b8beb945c9f4c9390a6122d8b4788d5','Separator',NULL,2,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.346','admin','ZKEASOFT','2017-10-15 18:11:45.346',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3e3783f4b7ca421488f2bf08d32fe2f0','Separator',NULL,2,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.850','admin','ZKEASOFT','2016-05-15 20:56:40.850',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('416c5402962b41548c83fabaa5492b42','Article List',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:20:31.666','admin','ZKEASOFT','2016-03-11 11:51:20.640',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('41e075ab1b89453388494a539eec55b9','Carousel',NULL,1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.633','admin','ZKEASOFT','2017-10-15 18:11:36.633',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('43bb869688ee4752a3127dd19ccc6caa','Image',NULL,1,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:20.406','admin','ZKEASOFT','2017-03-19 21:04:29.773',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('481574ebc98b4cdf9a07e3f20c1ab78d','Image Left (Circle)',NULL,12,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:48.870','admin','ZKEASOFT','2016-06-29 14:15:23.316',NULL,NULL,1,'~/images/template%20(7).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('4d67b2d10f4a425586e3b1115f7f7072','Separator',NULL,3,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:15.683','admin','ZKEASOFT','2017-03-19 21:05:15.683',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('50f810582d28440eb3bdff9ee5b1ef24','Image Left (Halves)',NULL,13,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:36:23.246','admin','ZKEASOFT','2016-06-29 14:16:05.733',NULL,NULL,1,'~/images/template (17).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('55b73e54fd054de4847960bdac350c6d','2 Image (Circle)',NULL,15,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:33:40.533','admin','ZKEASOFT','2016-06-29 14:17:49.736',NULL,NULL,1,'~/images/template%20(10).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('56991d0ff59d4c1db27aff3a50fcb382','Heading',NULL,2,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:51:35.576','admin','ZKEASOFT','2016-06-29 14:10:19.703',NULL,NULL,1,'~/images/template%20(1).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('604b2461f7c545e28dbb21fb15def5c7','Links','Links',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:13:42.000','admin','ZKEASOFT','2017-10-15 17:18:36.063',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('62ca3b6b6ea644b4a64501021b02f13b','Separator',NULL,2,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:16:08.136','admin','ZKEASOFT','2017-10-15 18:00:21.613',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('6bb06e46293c46f084e83751a0832d36','Product List',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.866','admin','ZKEASOFT','2016-05-15 20:56:40.866',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('6ee67036e78b4b498d932ab2d76757fb','Navigation',NULL,1,NULL,NULL,'ZONE-0','Widget.Navigation','ZKEACMS','ZKEACMS.Common.Service.NavigationWidgetService','ZKEACMS.Common.Models.NavigationWidget',NULL,'full','admin','ZKEASOFT','2018-05-21 23:44:21.393','admin','ZKEASOFT','2020-03-21 13:44:19.636',NULL,NULL,0,NULL,0,NULL,1);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7679a5060035444d85fe49dc3c02cada','Image',NULL,1,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.853','admin','ZKEASOFT','2017-03-19 21:05:30.853',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('787d9ad849dd40d0905f22ae072d8507','Product Content',NULL,1,NULL,'a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:19.903','admin','ZKEASOFT','2016-03-10 23:20:19.903',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7e7a1d5b8d644333a7b3341509fc960f','Register Account','Register Account',2,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.773','admin','ZKEASOFT','2017-10-15 18:11:36.773',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7f77f09c3fcd4d498a4aa3b1c9508d7d','Register Account','Register Account',2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 17:03:14.000','admin','ZKEASOFT','2017-10-15 17:04:42.893',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('80f365c7991a49a0b04aa11006018814','Site Management','Admin',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:09:22.000','admin','ZKEASOFT','2017-10-15 17:03:50.206',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('88ab49212dee47bba878a52bec86f501','Site Management','Admin',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.793','admin','ZKEASOFT','2017-10-15 18:11:36.793',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8c5b69f614b641c0a5f7a8e318de8df3','About ZKEACMS',NULL,2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin',NULL,'2015-09-01 09:54:38.000','admin','ZKEASOFT','2020-03-21 13:47:22.756',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8cc061c2e2514ef9b85bbecdec3f84ab','Separator',NULL,5,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:55:12.376','admin','ZKEASOFT','2016-03-09 13:55:12.376',NULL,NULL,1,'~/images/template%20(3).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8df64186d2fd4d63a9f9bb3b6e34cd2a','Article Category','Article Category',1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:21:20.526','admin','ZKEASOFT','2016-05-15 21:04:35.783',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8ea46d2923ad4d62958c565b19bb172d','Image',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.856','admin','ZKEASOFT','2016-05-15 20:56:40.856',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('942b4ac54f3e4dfca006172bf4122da4','Message Board',NULL,4,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:56.380','admin','ZKEASOFT','2017-03-19 21:04:56.380',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{"FormView":null,"ExtendData":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1,"ID":"942b4ac54f3e4dfca006172bf4122da4","WidgetName":"Message Board","Position":1,"LayoutID":null,"PageID":"1c93b61690ce49d7af8e1ea45ac58eb9","ZoneID":"3ca302874c164b7b9691ca948300417b","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.Message","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageWidget","StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendFields":null,"Title":null}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('94624262dc00460cbbc1e0f51711e712','Product Content',NULL,1,NULL,'4b889b430aa44517bbad38a57c745cc5','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.783','admin','ZKEASOFT','2016-03-10 23:24:38.783',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('a64ad266b3bd4e0eb4e2df09b550fe55','Message Board',NULL,2,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:44.953','admin','ZKEASOFT','2017-03-19 21:04:44.953',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{"ID":"a64ad266b3bd4e0eb4e2df09b550fe55","WidgetName":"Message Board","Position":1,"LayoutID":null,"PageID":"1c93b61690ce49d7af8e1ea45ac58eb9","ZoneID":"4cf5d05f2b954a7e8904713ad6781a61","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.MessageBox","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageBoxWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageBoxWidget","FormView":null,"StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendData":null,"ExtendFields":null,"Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('a686b84212f94b3b8315093b2e8b883d','Copyright',NULL,NULL,NULL,NULL,'ZONE-X','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,'footer','admin','ZKEASOFT','2018-05-21 23:44:55.063','admin','ZKEASOFT','2018-05-21 23:44:55.063',NULL,NULL,0,NULL,0,NULL,2);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('b568ff7f4a894870adaf9afadf787bf9','2 Image',NULL,14,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:20:29.886','admin','ZKEASOFT','2016-06-29 14:16:58.140',NULL,NULL,1,'~/images/template%20(9).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('bb7dab4f077745ef8b5b425eaabb423c','Jumbotron',NULL,1,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:28:47.826','admin','ZKEASOFT','2016-06-29 14:09:41.596',NULL,NULL,1,'~/images/template (16).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('c71d1f1c48944d6a9e232b6813261e04','Comment Box',NULL,2,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.253','admin','ZKEASOFT','2017-12-03 17:11:47.253',NULL,NULL,0,NULL,0,'{"CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('ca9f8809636d448cbd4f3beb418465b3','Article List',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.316','admin','ZKEASOFT','2017-10-15 18:11:45.316',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('cd21a7bf68b44f6e8d178b153288a26e','About ZKEACMS',NULL,3,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.806','admin','ZKEASOFT','2017-10-15 18:11:36.806',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('de8d94fd51cb4e73b00518dbb2f134d3','Article Category','Article Category',1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.366','admin','ZKEASOFT','2017-10-15 18:11:45.366',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e0783dbbcc564322a1f2e3ca2833dbd4','Links','Links',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.733','admin','ZKEASOFT','2017-10-15 18:11:36.733',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e5ba6adb117440959757b98e4289430f','Image',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:31:24.886','admin','ZKEASOFT','2016-03-27 15:16:41.790',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e88916cc41b3465b9ae954bafac5f796','Product List',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:21.906','admin','ZKEASOFT','2016-03-10 23:31:03.770',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e8fd1019bab045e5927ec30abaaa1aba','Article Content',NULL,1,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:12.856','admin','ZKEASOFT','2016-03-10 21:24:12.856',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('eb7657f5bcbd4e98977a42950936e7ac','Product Category','Product Category',1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:28:35.323','admin','ZKEASOFT','2016-05-15 20:56:37.496',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('ed837392097f4e60b812bc57111dd762','3 Image',NULL,16,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:36:24.463','admin','ZKEASOFT','2016-06-29 14:18:22.983',NULL,NULL,1,'~/images/template%20(11).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f41174cfa4d247f4974c47f4d2b000fd','2 Col (text)',NULL,7,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:21:37.693','admin','ZKEASOFT','2016-06-29 14:11:06.066',NULL,NULL,1,'~/images/template (14).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f6de0d62d3974ee2bf2ded3fbbc82c2b','Gap',NULL,6,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 14:00:46.400','admin','ZKEASOFT','2016-03-09 14:08:21.673',NULL,NULL,1,'~/images/template%20(4).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f6f11ba2fec844de883acf0a1fe3eb89','Image Right (Circle)',NULL,10,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:44.226','admin','ZKEASOFT','2016-06-29 14:13:44.223',NULL,NULL,1,'~/images/template%20(8).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('fee7f4d7d7e641b0bfa74491a543d245','Image',NULL,3,NULL,NULL,NULL,'Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:14:46.133','admin','ZKEASOFT','2016-03-09 21:14:46.133',NULL,NULL,1,'~/images/template (13).png',1,NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('00f62c5acfe840e0bee3ca2979f0f025',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('0f66ab8ff0df44e2b5e57fd8d8c5d8ff',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('1fb967867e3b440e86336bc5a51e8719',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('2b3eb61307d24c50a6b3aaa75db3810e',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('481574ebc98b4cdf9a07e3f20c1ab78d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('55b73e54fd054de4847960bdac350c6d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('604b2461f7c545e28dbb21fb15def5c7','Links',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('7e7a1d5b8d644333a7b3341509fc960f',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('7f77f09c3fcd4d498a4aa3b1c9508d7d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('80f365c7991a49a0b04aa11006018814','Manage',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('88ab49212dee47bba878a52bec86f501','Manage',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('b568ff7f4a894870adaf9afadf787bf9',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('e0783dbbcc564322a1f2e3ca2833dbd4','Links',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('ed837392097f4e60b812bc57111dd762',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('f41174cfa4d247f4974c47f4d2b000fd',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('f6f11ba2fec844de883acf0a1fe3eb89',NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('0015be62210742c083c3a9dad4b72fb5','G1','e0783dbbcc564322a1f2e3ca2833dbd4','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.740','admin','ZKEASOFT','2017-10-15 18:11:36.740',NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('1','G1','80f365c7991a49a0b04aa11006018814','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('10','Right','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('11','Left','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('12','Right','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('13','Left','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('14','Center','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('15','Right','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('16','Left','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('17','Center','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('18','Right','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('2','G1','604b2461f7c545e28dbb21fb15def5c7','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('40','Left','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('41','Right','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('42','Left','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('43','Right','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('44','Center','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('5','G1','2b3eb61307d24c50a6b3aaa75db3810e','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('50082fd30e01404fbb4fe6101353b1d5','G1','88ab49212dee47bba878a52bec86f501','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.800','admin','ZKEASOFT','2017-10-15 18:11:36.800',NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('6','G1','00f62c5acfe840e0bee3ca2979f0f025','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('7','G1','f6f11ba2fec844de883acf0a1fe3eb89','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('8','G1','481574ebc98b4cdf9a07e3f20c1ab78d','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('80cb176412cf457a81ae7a1f9fa33ef6','G1','7f77f09c3fcd4d498a4aa3b1c9508d7d','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 17:03:17.246','admin','ZKEASOFT','2017-10-15 17:03:17.246','');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('9','Left','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('9ce2c15af93c4fd782e17a1e7e35963f','G1','7e7a1d5b8d644333a7b3341509fc960f','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 18:11:36.780','admin','ZKEASOFT','2017-10-15 18:11:36.780','');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,7,'admin','ZKEASOFT','2017-10-15 18:11:36.766','admin','ZKEASOFT','2017-10-15 18:11:36.766');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.800','admin','ZKEASOFT','2017-10-15 18:11:36.800');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1','80f365c7991a49a0b04aa11006018814','1',1,2,'admin',NULL,'2015-09-01 10:09:51.456','admin',NULL,'2015-09-01 10:12:05.036');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('105','f41174cfa4d247f4974c47f4d2b000fd','40',4,1,'admin','ZKEASOFT','2016-03-09 21:22:05.273','admin','ZKEASOFT','2016-03-09 21:22:05.273');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('106','f41174cfa4d247f4974c47f4d2b000fd','40',3,2,'admin','ZKEASOFT','2016-03-09 21:22:14.723','admin','ZKEASOFT','2016-03-09 21:22:14.723');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('107','f41174cfa4d247f4974c47f4d2b000fd','41',4,1,'admin','ZKEASOFT','2016-03-09 21:22:39.543','admin','ZKEASOFT','2016-03-09 21:22:39.543');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('108','f41174cfa4d247f4974c47f4d2b000fd','41',3,2,'admin','ZKEASOFT','2016-03-09 21:22:46.500','admin','ZKEASOFT','2016-03-09 21:22:46.500');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.286','admin','ZKEASOFT','2016-03-09 21:23:51.286');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.290','admin','ZKEASOFT','2016-03-09 21:23:51.290');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',4,1,'admin','ZKEASOFT','2016-03-09 21:24:36.340','admin','ZKEASOFT','2016-03-09 21:24:36.340');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',3,2,'admin','ZKEASOFT','2016-03-09 21:24:43.533','admin','ZKEASOFT','2016-03-09 21:24:43.533');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,5,'admin','ZKEASOFT','2017-10-15 18:11:36.760','admin','ZKEASOFT','2017-10-15 18:11:36.760');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('13','2b3eb61307d24c50a6b3aaa75db3810e','5',2,1,'admin','ZKEASOFT','2016-03-09 14:07:06.270','admin','ZKEASOFT','2016-03-09 14:07:06.270');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('14','2b3eb61307d24c50a6b3aaa75db3810e','5',4,2,'admin','ZKEASOFT','2016-03-09 14:07:14.396','admin','ZKEASOFT','2016-03-09 14:07:14.396');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('15','2b3eb61307d24c50a6b3aaa75db3810e','5',3,3,'admin','ZKEASOFT','2016-03-09 14:07:22.330','admin','ZKEASOFT','2016-03-09 14:07:22.330');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('16','00f62c5acfe840e0bee3ca2979f0f025','6',2,1,'admin','ZKEASOFT','2016-03-09 14:14:25.736','admin','ZKEASOFT','2016-03-09 14:14:25.736');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('163','604b2461f7c545e28dbb21fb15def5c7','2',1,4,'admin','ZKEASOFT','2017-03-19 20:58:41.646','admin','ZKEASOFT','2017-03-19 20:58:41.646');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('164','604b2461f7c545e28dbb21fb15def5c7','2',1,7,'admin','ZKEASOFT','2017-03-19 20:59:12.036','admin','ZKEASOFT','2017-03-19 20:59:12.036');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('165','80f365c7991a49a0b04aa11006018814','1',3,3,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:02:22.540');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('17','00f62c5acfe840e0bee3ca2979f0f025','6',4,2,'admin','ZKEASOFT','2016-03-09 14:14:33.683','admin','ZKEASOFT','2016-03-09 14:14:33.683');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('18','00f62c5acfe840e0bee3ca2979f0f025','6',3,3,'admin','ZKEASOFT','2016-03-09 14:14:50.896','admin','ZKEASOFT','2016-03-09 14:14:50.896');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('19','f6f11ba2fec844de883acf0a1fe3eb89','7',2,1,'admin','ZKEASOFT','2016-03-09 14:15:44.233','admin','ZKEASOFT','2016-03-09 14:15:44.233');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',1,1,'admin','ZKEASOFT','2017-10-15 17:03:36.226','admin','ZKEASOFT','2017-10-15 17:03:36.226');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('20','f6f11ba2fec844de883acf0a1fe3eb89','7',4,2,'admin','ZKEASOFT','2016-03-09 14:15:44.236','admin','ZKEASOFT','2016-03-09 14:15:44.236');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('21','f6f11ba2fec844de883acf0a1fe3eb89','7',3,3,'admin','ZKEASOFT','2016-03-09 14:15:44.240','admin','ZKEASOFT','2016-03-09 14:15:44.240');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('22','481574ebc98b4cdf9a07e3f20c1ab78d','8',2,1,'admin','ZKEASOFT','2016-03-09 14:15:48.876','admin','ZKEASOFT','2016-03-09 14:15:48.876');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,4,'admin','ZKEASOFT','2017-10-15 18:11:36.756','admin','ZKEASOFT','2017-10-15 18:11:36.756');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('23','481574ebc98b4cdf9a07e3f20c1ab78d','8',4,2,'admin','ZKEASOFT','2016-03-09 14:15:48.876','admin','ZKEASOFT','2016-03-09 14:15:48.876');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('24','481574ebc98b4cdf9a07e3f20c1ab78d','8',3,3,'admin','ZKEASOFT','2016-03-09 14:15:48.880','admin','ZKEASOFT','2016-03-09 14:15:48.880');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('25','b568ff7f4a894870adaf9afadf787bf9','9',2,1,'admin','ZKEASOFT','2016-03-09 14:21:44.433','admin','ZKEASOFT','2016-03-09 14:21:44.433');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('26','b568ff7f4a894870adaf9afadf787bf9','9',3,2,'admin','ZKEASOFT','2016-03-09 14:21:53.836','admin','ZKEASOFT','2016-03-09 14:21:53.836');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('27','b568ff7f4a894870adaf9afadf787bf9','10',2,1,'admin','ZKEASOFT','2016-03-09 14:22:35.620','admin','ZKEASOFT','2016-03-09 14:22:35.620');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('28','b568ff7f4a894870adaf9afadf787bf9','10',3,2,'admin','ZKEASOFT','2016-03-09 14:24:34.193','admin','ZKEASOFT','2016-03-09 14:24:34.193');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('29','55b73e54fd054de4847960bdac350c6d','11',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','2',1,6,'admin','ZKEASOFT','2017-10-15 17:18:30.710','admin','ZKEASOFT','2017-10-15 17:18:30.710');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('3','604b2461f7c545e28dbb21fb15def5c7','2',1,2,'admin',NULL,'2015-09-01 10:15:07.310','admin',NULL,'2015-09-01 10:15:07.310');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('30','55b73e54fd054de4847960bdac350c6d','11',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('31','55b73e54fd054de4847960bdac350c6d','12',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.586','admin','ZKEASOFT','2016-03-09 14:33:40.586');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('32','55b73e54fd054de4847960bdac350c6d','12',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.586','admin','ZKEASOFT','2016-03-09 14:33:40.586');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('33','55b73e54fd054de4847960bdac350c6d','11',4,2,'admin','ZKEASOFT','2016-03-09 14:34:38.456','admin','ZKEASOFT','2016-03-09 14:34:38.456');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('34','55b73e54fd054de4847960bdac350c6d','12',4,2,'admin','ZKEASOFT','2016-03-09 14:34:51.846','admin','ZKEASOFT','2016-03-09 14:34:51.846');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('35','ed837392097f4e60b812bc57111dd762','13',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('36','ed837392097f4e60b812bc57111dd762','13',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('37','ed837392097f4e60b812bc57111dd762','14',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.490','admin','ZKEASOFT','2016-03-09 14:36:24.490');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('38','ed837392097f4e60b812bc57111dd762','14',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.493','admin','ZKEASOFT','2016-03-09 14:36:24.493');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('39','ed837392097f4e60b812bc57111dd762','15',2,1,'admin','ZKEASOFT','2016-03-09 14:38:16.066','admin','ZKEASOFT','2016-03-09 14:38:16.066');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('4','604b2461f7c545e28dbb21fb15def5c7','2',1,5,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:18:02.196');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('40','ed837392097f4e60b812bc57111dd762','15',3,2,'admin','ZKEASOFT','2016-03-09 14:38:27.630','admin','ZKEASOFT','2016-03-09 14:38:27.630');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('41','1fb967867e3b440e86336bc5a51e8719','16',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.776','admin','ZKEASOFT','2016-03-09 14:40:26.776');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('42','1fb967867e3b440e86336bc5a51e8719','16',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.780','admin','ZKEASOFT','2016-03-09 14:40:26.780');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('43','1fb967867e3b440e86336bc5a51e8719','17',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('44','1fb967867e3b440e86336bc5a51e8719','17',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('45','1fb967867e3b440e86336bc5a51e8719','18',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.786','admin','ZKEASOFT','2016-03-09 14:40:26.786');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,3,'admin','ZKEASOFT','2017-10-15 18:11:36.756','admin','ZKEASOFT','2017-10-15 18:11:36.756');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('46','1fb967867e3b440e86336bc5a51e8719','18',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.786','admin','ZKEASOFT','2016-03-09 14:40:26.786');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('47','1fb967867e3b440e86336bc5a51e8719','16',4,2,'admin','ZKEASOFT','2016-03-09 14:41:13.710','admin','ZKEASOFT','2016-03-09 14:41:13.710');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('48','1fb967867e3b440e86336bc5a51e8719','17',4,2,'admin','ZKEASOFT','2016-03-09 14:42:01.136','admin','ZKEASOFT','2016-03-09 14:42:01.136');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('49','1fb967867e3b440e86336bc5a51e8719','18',4,2,'admin','ZKEASOFT','2016-03-09 14:42:20.190','admin','ZKEASOFT','2016-03-09 14:42:20.190');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('5','604b2461f7c545e28dbb21fb15def5c7','2',1,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:17:12.376');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',3,3,'admin','ZKEASOFT','2017-10-15 18:11:36.803','admin','ZKEASOFT','2017-10-15 18:11:36.803');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6','604b2461f7c545e28dbb21fb15def5c7','2',1,3,'admin','ZKEASOFT','2016-03-01 10:45:25.393','admin','ZKEASOFT','2016-03-01 10:45:25.393');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.753','admin','ZKEASOFT','2017-10-15 18:11:36.753');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.746','admin','ZKEASOFT','2017-10-15 18:11:36.746');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,6,'admin','ZKEASOFT','2017-10-15 18:11:36.763','admin','ZKEASOFT','2017-10-15 18:11:36.763');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',3,2,'admin','ZKEASOFT','2017-10-15 18:11:36.783','admin','ZKEASOFT','2017-10-15 18:11:36.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',3,2,'admin','ZKEASOFT','2017-10-15 17:04:41.026','admin','ZKEASOFT','2017-10-15 17:04:41.026');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.783','admin','ZKEASOFT','2017-10-15 18:11:36.783');
INSERT INTO [ProductListWidget] ([ID],[IsPageable],[ProductCategoryID],[DetailPageUrl],[Columns],[PageSize]) VALUES ('6bb06e46293c46f084e83751a0832d36',1,1,'~/product/detail','col-xs-6 col-sm-4 col-md-4',9);
INSERT INTO [ProductListWidget] ([ID],[IsPageable],[ProductCategoryID],[DetailPageUrl],[Columns],[PageSize]) VALUES ('e88916cc41b3465b9ae954bafac5f796',1,1,'~/product/detail','col-xs-6 col-sm-4 col-md-4',9);
INSERT INTO [ProductDetailWidget] ([ID],[CustomerClass]) VALUES ('787d9ad849dd40d0905f22ae072d8507',NULL);
INSERT INTO [ProductDetailWidget] ([ID],[CustomerClass]) VALUES ('94624262dc00460cbbc1e0f51711e712',NULL);
INSERT INTO [ProductCategoryWidget] ([ID],[ProductCategoryID],[TargetPage]) VALUES ('3466e616139645d2b1e1d9935d231922',1,NULL);
INSERT INTO [ProductCategoryWidget] ([ID],[ProductCategoryID],[TargetPage]) VALUES ('eb7657f5bcbd4e98977a42950936e7ac',1,NULL);
INSERT INTO [NavigationWidget] ([ID],[CustomerClass],[Title],[Logo],[AlignClass],[IsTopFix],[RootID],[ShowBasket]) VALUES ('6ee67036e78b4b498d932ab2d76757fb','container',NULL,'~/images/logo_zkea.png','navbar-left',NULL,'#',0);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('2b510992f0174e668ca53116434e065c','~/images/bg4.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('3017aef0eabc451b81daebe6bae68857','~/images/bg4.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('43bb869688ee4752a3127dd19ccc6caa','http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('7679a5060035444d85fe49dc3c02cada','http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('8ea46d2923ad4d62958c565b19bb172d','~/images/bg3.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('e5ba6adb117440959757b98e4289430f','~/images/bg3.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('fee7f4d7d7e641b0bfa74491a543d245','~/images/30.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('062018a8e5cf48b4a0d90296e7f4e965','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('09617f6142934daaadee6cfb9df6d66f','<p>This is a paragraph text. You can add headings, text, images, tables, lists, links, etc. within the paragraph. For example:</p>
<p>ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layouts, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, and allows direct page design on the preview page.</p>
<p>ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('357a58069e8047a289e10b920061d57d','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('3b8beb945c9f4c9390a6122d8b4788d5','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('3e3783f4b7ca421488f2bf08d32fe2f0','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('4d67b2d10f4a425586e3b1115f7f7072','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('50f810582d28440eb3bdff9ee5b1ef24','<div>
<div class="row">
<div class="col-sm-6"><img src="/Images/28.jpg" alt="" /></div>
<div class="col-sm-6">
<h3>Why Choose Us?</h3>
<p>We mainly focus on multinational companies that have entered the Chinese market, industry-leading foreign enterprises, well-known Chinese large and medium-sized enterprises, and more rapidly growing emerging companies.</p>
<p>We are particularly good at recommending middle and senior management positions and key technical positions for Chinese and foreign enterprises, helping them quickly build and improve a highly adaptable professional management team.</p>
<p>&nbsp;</p>
<p><a class="btn btn-info" href="#">Read More</a></p>
</div>
</div>
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('56991d0ff59d4c1db27aff3a50fcb382','<div class="page-header">
<h1>ZKEASOFT</h1>
</div>
<p>ZKEASOFT provides high-quality software services. We adhere to the principles of open source and openness, making software services better.</p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('62ca3b6b6ea644b4a64501021b02f13b','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('8cc061c2e2514ef9b85bbecdec3f84ab','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('a686b84212f94b3b8315093b2e8b883d','<div id="footer">ZKEACMS is open-source software, available for free download for learning and use
<p>Copyright @&nbsp;2015 ZKEASOFT. All Rights Reserved | <a href="http://www.zkea.net/" target="_blank" rel="noopener">www.zkea.net</a></p>
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('bb7dab4f077745ef8b5b425eaabb423c','<h1 style="text-align: center; font-size: 3em;">ZKEASOFT</h1>
<p>&nbsp;</p>
<p style="text-align: center;">ZKEASOFT provides high-quality software services. We adhere to the principles of open source and openness, making software services better.</p>
<p style="text-align: center;"><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a> is an open-source CMS developed using ASP.NET MVC4, based on <a href="http://www.zkea.net/easyframework">EasyFrameWork</a>.</p>
<p style="text-align: center;">ZKEACMS is a content management software (website). ZKEACMS not only manages content but also redefines layouts, pages, and components, allowing users to freely plan the layout, pages, and content.</p>
<p style="text-align: center;">ZKEACMS uses visual editing design, truly achieving WYSIWYG, and allows direct page design on the preview page.</p>
<p style="text-align: center;">ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;"><a class="btn btn-info" href="#">Read More</a></p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('f6de0d62d3974ee2bf2ded3fbbc82c2b','<div class="space">&nbsp;</div>');
INSERT INTO [CMS_Theme] ([ID],[Title],[Url],[UrlDebugger],[Thumbnail],[IsActived],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Default','Default','~/themes/Default/css/Theme.min.css','~/themes/Default/css/Theme.css','~/themes/Default/thumbnail.jpg',1,1,NULL,'admin','ZKEASOFT','2016-04-04 22:17:10.790','admin','ZKEASOFT','2016-04-04 22:21:01.486');
INSERT INTO [CMS_Rule] ([RuleID],[Title],[ZoneName],[RuleExpression],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[RuleItems]) VALUES (1,'All Pages','Top','StartsWith(ValueOf(''Url''),''/'')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:34.623','admin','ZKEASOFT','2018-05-21 23:43:34.623','[{"Condition":"and","FunctionName":"StartsWith","Property":"ValueOf(''Url'')","Value":"/","Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}]');
INSERT INTO [CMS_Rule] ([RuleID],[Title],[ZoneName],[RuleExpression],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[RuleItems]) VALUES (2,'All Pages','Bottom','StartsWith(ValueOf(''Url''),''/'')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:52.343','admin','ZKEASOFT','2018-05-21 23:43:52.343','[{"Condition":"and","FunctionName":"StartsWith","Property":"ValueOf(''Url'')","Value":"/","Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}]');
INSERT INTO [CMS_Redirection] ([ID],[Title],[InComingUrl],[DestinationURL],[IsPermanent],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[IsPattern]) VALUES (1,'Home page','~/','~/index',0,NULL,1,'admin','ZKEASOFT','2017-08-14 14:58:06.000','admin','ZKEASOFT','2020-08-01 22:21:26.836',0);
INSERT INTO [CMS_Message] ([ID],[Title],[Email],[PostMessage],[Reply],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES (1,'ZKEASOFT','zkea@zkea.net','ZKEACMS is an open-source CMS developed based on ASP.NET 9, available for free download and learning.','KEACMS uses visual editing design, WYSIWYG, allowing you to design the page you want directly on the page.',1,'admin','ZKEASOFT','2017-03-19 21:02:34.260','admin','ZKEASOFT','2017-03-19 21:02:34.260',NULL);
INSERT INTO [CMS_Message] ([ID],[Title],[Email],[PostMessage],[Reply],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES (2,'ZKEASOFT','zkea@zkea.net','ZKEACMS uses visual editing design','ZKEACMS is a content management software (website), not only managing content but also redefining layout, pages, and components, allowing users to freely plan the layout, pages, and content.',1,'admin','ZKEASOFT','2017-03-19 21:03:09.966','admin','ZKEASOFT','2017-03-19 21:03:09.966',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('6056810a7ede46bb94b55b2756323640','#','Image',1,NULL,NULL,'admin','ZKEASOFT','2016-04-01 21:42:14.960','admin','ZKEASOFT','2016-04-01 21:42:14.960',NULL);
INSERT INTO [CMS_Layout] ([ID],[LayoutName],[Title],[ContainerClass],[Status],[Description],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[ImageUrl],[ImageThumbUrl],[Theme]) VALUES ('0846a33e56bf45d5aae602ef40d87444','Other',NULL,'container',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:06:44.200','admin','ZKEASOFT','2016-03-10 21:06:44.200','~/images/layout.jpg','~/images/layout.jpg','Default');
INSERT INTO [CMS_Layout] ([ID],[LayoutName],[Title],[ContainerClass],[Status],[Description],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[ImageUrl],[ImageThumbUrl],[Theme]) VALUES ('1dae90cf6a8547538cc0c369b9943c01','Default',NULL,'container',1,NULL,NULL,NULL,'admin',NULL,'2015-08-31 11:56:31.750','admin',NULL,'2015-08-31 11:56:31.750','~/images/layout.jpg','~/images/layout.jpg','Default');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0338e740ea064e5a88d6223fd476506f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.650','admin','ZKEASOFT','2018-05-21 23:45:46.650',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0387a1373f59466a91feb96bb69aadca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.986','admin','ZKEASOFT','2018-05-21 23:46:12.986',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('07384e5dc4f34a199d4ca73b3317b1f2','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.190','admin','ZKEASOFT','2018-05-21 23:42:49.190',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('095b8b8b28144248a2b0eff648e7fc48','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.930','admin','ZKEASOFT','2018-05-21 23:45:21.930',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0c44eb9149b34ffaaa44d6976d11e1d8','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.306','admin','ZKEASOFT','2018-05-21 23:46:19.306',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0e5c5a55882b4a34a77f3de1f0f36a4c','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.116','admin','ZKEASOFT','2018-05-21 23:46:15.116',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1319756527364a5da511499b37a1eed5','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.973','admin','ZKEASOFT','2018-05-21 23:42:39.973',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('14a23e1671924f758113054ed008adec','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.726','admin','ZKEASOFT','2018-05-21 23:46:28.726',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('17ef6a804c524ed298492e404ad5576b','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.303','admin','ZKEASOFT','2018-05-21 23:46:19.303',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('18f2e25482b444ba8861238637861ba5','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.746','admin','ZKEASOFT','2018-05-21 23:46:34.746',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('19d3d679eaf74a21bf4f123487eaee0d','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193','admin','ZKEASOFT','2018-05-21 23:42:49.193',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1c232c2d572f415082e74771e37e3580','0846a33e56bf45d5aae602ef40d87444',NULL,'Bottom',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893','admin','ZKEASOFT','2017-11-19 17:48:10.636',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1cd27416b7db429bb639d8950cc29793','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.196','admin','ZKEASOFT','2018-05-21 23:42:49.196',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('23ec6afdd2ea49dd8fb5839ae2bec741','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.983','admin','ZKEASOFT','2018-05-21 23:42:39.983',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('25ce97efa1484065995e6e5aaade9a83','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.160','admin','ZKEASOFT','2018-05-21 23:42:49.160',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2921f81e4531493694790faed3ed76e9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.310','admin','ZKEASOFT','2018-05-21 23:46:19.310',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('294c86a5d87a46d49f41999c495344ea','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.730','admin','ZKEASOFT','2018-05-21 23:46:28.730',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2fd26e7c5a844bea8a2422d074d73109','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.330','admin','ZKEASOFT','2018-05-21 23:45:43.330',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('302009d870f74aa1b5b55dc6f1c6385f','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810','admin','ZKEASOFT','2018-05-21 23:45:44.810',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('34f9c91a64ee4986bec02073ea77035d','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.926','admin','ZKEASOFT','2018-05-21 23:45:21.926',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('360d6da3007e41d68c521c3154173c7a','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.783','admin','ZKEASOFT','2018-05-21 23:45:45.783',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('39af0cedd23a42d08c2c93e7b0dbaee0','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.356','admin','ZKEASOFT','2018-05-21 23:46:09.356',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3b3f74427bf84da999406f98f7d8cdd7','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.690','admin','ZKEASOFT','2018-05-21 23:45:46.690',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3ca302874c164b7b9691ca948300417b','1dae90cf6a8547538cc0c369b9943c01',NULL,'Content Right',NULL,'admin',NULL,'2015-08-31 11:58:54.256','admin','ZKEASOFT','2017-11-19 17:48:39.823',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3f166bd62afb4a888801ec561cbc15ef','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.986','admin','ZKEASOFT','2018-05-21 23:42:39.986',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('40a562598d3a44a98646519094631628','1dae90cf6a8547538cc0c369b9943c01',NULL,'Top',NULL,'admin',NULL,'2015-08-31 11:58:54.253','admin','ZKEASOFT','2017-11-19 17:48:39.840',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4cf5d05f2b954a7e8904713ad6781a61','1dae90cf6a8547538cc0c369b9943c01',NULL,'Content Left',NULL,'admin',NULL,'2015-08-31 11:58:54.256','admin','ZKEASOFT','2017-11-19 17:48:39.846',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('572963d3322b4cddb7d94d6bec2f08c7','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.343','admin','ZKEASOFT','2018-05-21 23:45:43.343',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('57c4f0c9fb31439c913d0221c20a6343','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.113','admin','ZKEASOFT','2018-05-21 23:46:15.113',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('58f65b43d383423a9456102ea06450c1','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.740','admin','ZKEASOFT','2018-05-21 23:46:34.740',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5d3fdb35e2c54313850c69c401548b4d','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.753','admin','ZKEASOFT','2018-05-21 23:46:34.753',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5d84136b25ea4bd4a65779e0bb7acc3d','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.680','admin','ZKEASOFT','2018-05-21 23:45:46.680',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6920822269c34d5781b7df72fa37df16','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.916','admin','ZKEASOFT','2018-05-21 23:45:21.916',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6bba8443507f4273b2b61048f7c71f40','0846a33e56bf45d5aae602ef40d87444',NULL,'Focal',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.886','admin','ZKEASOFT','2017-11-19 17:48:10.903',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7480ffc27b034c51aca983367316bb7c','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.353','admin','ZKEASOFT','2018-05-21 23:46:09.353',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7577ca3b1628498c8f38b42545f3c1b3','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.120','admin','ZKEASOFT','2018-05-21 23:46:15.120',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('75be97a54a4b430ca6d26b8285bbce8d','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.346','admin','ZKEASOFT','2018-05-21 23:45:43.346',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('787c9336ef3341d4b63e710f16281424','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350','admin','ZKEASOFT','2018-05-21 23:46:09.350',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7c1d057dff154fa0836ebe82b5f08b6b','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.786','admin','ZKEASOFT','2018-05-21 23:45:45.786',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7fe7ceb43d734faca8a21e78185995d6','1dae90cf6a8547538cc0c369b9943c01',NULL,'Bottom',NULL,'admin',NULL,'2015-08-31 11:58:54.260','admin','ZKEASOFT','2017-11-19 17:48:39.873',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('82e28c8ca83c4a52847b2f759b4d1ab0','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.756','admin','ZKEASOFT','2018-05-21 23:46:34.756',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('85b6e66b7b3345e9a482af084da307d3','0846a33e56bf45d5aae602ef40d87444',NULL,'Other',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.890','admin','ZKEASOFT','2017-11-19 17:48:10.963',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8b3a4cd737594c00a7e34c17c1bbc9fc','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.760','admin','ZKEASOFT','2018-05-21 23:45:45.760',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8d4f87b76dfa4c96ae71734ef5ad08fd','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.656','admin','ZKEASOFT','2018-05-21 23:45:47.656',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('93ed2f72cef64bf891e0a1ef999c0ebc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.800','admin','ZKEASOFT','2018-05-21 23:45:44.800',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9774034c2832414e9ccaa39b43685710','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.670','admin','ZKEASOFT','2018-05-21 23:45:47.670',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9b5eab51ed78479f9a3b6cd88f30865c','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340','admin','ZKEASOFT','2018-05-21 23:45:43.340',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9c39ce55ae2b46fbaab97287436b651f','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340','admin','ZKEASOFT','2018-05-21 23:45:43.340',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9c87f7474bcf450a942838b42335a928','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993','admin','ZKEASOFT','2018-05-21 23:46:12.993',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9ccbb73c31ba46caa173b1ff5208cd4e','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193','admin','ZKEASOFT','2018-05-21 23:42:49.193',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a30b21857de2411982aa4f40e0fcba59','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993','admin','ZKEASOFT','2018-05-21 23:46:12.993',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a4bd66363b6a4f2ea1d21ed601c69866','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.796','admin','ZKEASOFT','2018-05-21 23:45:44.796',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a979c68e8f49405fa3c5cc21fafdb7b9','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.116','admin','ZKEASOFT','2018-05-21 23:46:15.116',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('aae6dbf58fff429d9a32627933854a8f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.693','admin','ZKEASOFT','2018-05-21 23:45:46.693',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('af49758840b345a6ab910d11a691fc99','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.666','admin','ZKEASOFT','2018-05-21 23:45:47.666',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b0a92bfb56704f8aaf7dade22c3db2d2','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.976','admin','ZKEASOFT','2018-05-21 23:42:39.976',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('be7a1e6a999b4264aab2b5ac593909a8','0846a33e56bf45d5aae602ef40d87444',NULL,'Top',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.526','admin','ZKEASOFT','2017-11-19 17:48:10.966',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('bed6101f906b4e50b3ba034bfe39d184','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.833','admin','ZKEASOFT','2018-05-21 23:42:39.833',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c1f4cb36e7924ff99ff38aeb3983eca3','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.343','admin','ZKEASOFT','2018-05-21 23:46:09.343',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c22c6484c2864c82932ec6ad0a20492a','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.923','admin','ZKEASOFT','2018-05-21 23:45:21.923',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c291af01f0b443c3ad59b5b289d97e1f','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Content Left',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.306','admin','ZKEASOFT','2018-05-21 23:46:19.306',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c7bcd0a9d172432bafbf9f5a986685f2','0846a33e56bf45d5aae602ef40d87444',NULL,'Main',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893','admin','ZKEASOFT','2017-11-19 17:48:10.966',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ca49f8b95d724a3bb1cc01a10ca72cb9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.296','admin','ZKEASOFT','2018-05-21 23:46:19.296',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d5a2daad909b4ecfb02988584d8903ad','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.776','admin','ZKEASOFT','2018-05-21 23:45:45.776',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d5f02570e4814439acc86a1874cb8f07','1dae90cf6a8547538cc0c369b9943c01',NULL,'Main',NULL,'admin',NULL,'2015-08-31 11:58:54.256','admin','ZKEASOFT','2017-11-19 17:48:39.886',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d79708e9937541c9833467ed6f31ebda','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.980','admin','ZKEASOFT','2018-05-21 23:46:12.980',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('db297e847b15465cb4ee5d46cd7ca168','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673','admin','ZKEASOFT','2018-05-21 23:45:47.673',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('de442cdec7044de895680750884b1eb4','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.773','admin','ZKEASOFT','2018-05-21 23:45:45.773',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('df2ff4bd579d4e6cb8855b196ba2c322','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810','admin','ZKEASOFT','2018-05-21 23:45:44.810',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e333b823cf0e4d40a7999bc2787370b2','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.723','admin','ZKEASOFT','2018-05-21 23:46:28.723',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e74560705e8c414bbb284cc95dc54d8a','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733','admin','ZKEASOFT','2018-05-21 23:46:28.733',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ea3ca53e83924909bfab5e9242583a93','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.926','admin','ZKEASOFT','2018-05-21 23:45:21.926',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ea5cdd077bf44e16b8fc4a22433d63ca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','Main',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.996','admin','ZKEASOFT','2018-05-21 23:46:12.996',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('eaaf42be824141679c05866ad9a8acf2','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','Focal',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350','admin','ZKEASOFT','2018-05-21 23:46:09.350',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ee21c0c23a834cfaae370413da4630cc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.780','admin','ZKEASOFT','2018-05-21 23:45:44.780',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('eeb31d7a5ee7485ea014708e14f66cac','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','Bottom',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673','admin','ZKEASOFT','2018-05-21 23:45:47.673',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f41ee7803dc6431bafb45ff035fca916','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.636','admin','ZKEASOFT','2018-05-21 23:45:46.636',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f4f64f6755be449c8ccb6c5969749b19','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','Top',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733','admin','ZKEASOFT','2018-05-21 23:46:28.733',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f844832366834170a8c8caeb8c64b96b','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','Content Right',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.106','admin','ZKEASOFT','2018-05-21 23:46:15.106',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('fb0f4ea5b0ed44289f665eec3b829ea2','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','Other',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.750','admin','ZKEASOFT','2018-05-21 23:46:34.750',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('068c85b8de8744e7a81b1d1010583308','9d84599edb2443439a53e8d906815c8f',1,'#','Product',0,'~/product','0846a33e56bf45d5aae602ef40d87444','Product',NULL,4,NULL,1,0,'2016-05-15 20:56:40.843',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.843','admin','ZKEASOFT','2016-05-15 20:56:40.843');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('0880a4dfdc184ff99b88c88325716d1b',NULL,0,'#','Home',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','Welcome to ZKEACMS for creation',NULL,1,NULL,1,0,'2017-10-15 18:11:36.000',NULL,NULL,'[]','[]','admin',NULL,'2015-08-31 13:27:16.000','admin','ZKEASOFT','2020-03-21 14:01:56.336');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1c93b61690ce49d7af8e1ea45ac58eb9',NULL,0,'#','Contact Us',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01','Contact Us',NULL,7,NULL,1,1,'2017-03-19 21:05:28.836','Contact Us','Contact Us',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:03:50.763','admin','ZKEASOFT','2017-03-19 21:05:16.280');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('4b889b430aa44517bbad38a57c745cc5','a8d73e29b1eb4b7ea43420e2b6bf2c1b',1,'9d84599edb2443439a53e8d906815c8f','Product Details',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2016-03-10 23:24:38.776',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.780','admin','ZKEASOFT','2016-03-10 23:24:38.780');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('50fa3579e7434555a22f095dcb4ea35e','0880a4dfdc184ff99b88c88325716d1b',1,'#','Home',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','Welcome to ZKEACMS for creation',NULL,1,NULL,1,0,'2017-10-15 18:11:36.273',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.276','admin','ZKEASOFT','2017-10-15 18:11:36.810');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('534e07f396b14b7584a833d270356cb7','1c93b61690ce49d7af8e1ea45ac58eb9',1,'#','Contact Us',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01','Contact Us',NULL,7,NULL,1,0,'2017-03-19 21:05:30.803','Contact Us','Contact Us',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.833','admin','ZKEASOFT','2017-03-19 21:05:31.050');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('9ce910ba45a24fd2af804d6d0de7bba3','be49e3ec3b5a4f5eae3edaf8ba64f185',1,'#','Questionnaire',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','Questionnaire | ZKEASOFT',NULL,5,NULL,1,0,'2017-10-15 18:20:42.203',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:20:42.206','admin','ZKEASOFT','2017-10-15 18:20:42.216');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('9d84599edb2443439a53e8d906815c8f',NULL,0,'#','Product',0,'~/product','0846a33e56bf45d5aae602ef40d87444','Product',NULL,4,NULL,1,1,'2016-05-15 20:56:40.763',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:10.430','admin','ZKEASOFT','2016-05-14 15:01:42.696');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('a3d735320eb04c63bf3258d7b44e30f8',NULL,0,'e371628aa3ff46c3a167f121c7a3f32b','Article Details',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2017-12-03 17:11:47.220',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:03.240','admin','ZKEASOFT','2017-12-03 17:11:47.223');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('a8d73e29b1eb4b7ea43420e2b6bf2c1b',NULL,0,'9d84599edb2443439a53e8d906815c8f','Product Details',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2016-03-10 23:24:38.743',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:11.263','admin','ZKEASOFT','2016-03-10 23:24:38.736');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('be49e3ec3b5a4f5eae3edaf8ba64f185',NULL,0,'#','Questionnaire',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','Questionnaire | ZKEASOFT',NULL,5,NULL,1,1,'2017-10-15 18:20:42.193',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:58:52.056','admin','ZKEASOFT','2017-10-15 18:20:42.193');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('c5b97a044c9844529fc48383d141e73c','a3d735320eb04c63bf3258d7b44e30f8',1,'e371628aa3ff46c3a167f121c7a3f32b','Article Details',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2017-12-03 17:11:47.236',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.243','admin','ZKEASOFT','2017-12-03 17:11:47.306');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d070f202bb2f45ddbd35f0a7cfee1dfa','e371628aa3ff46c3a167f121c7a3f32b',1,'#','Article',0,'~/article','0846a33e56bf45d5aae602ef40d87444','Article',NULL,3,NULL,1,0,'2017-10-15 18:11:44.946',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.946','admin','ZKEASOFT','2017-10-15 18:11:45.366');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e371628aa3ff46c3a167f121c7a3f32b',NULL,0,'#','Article',0,'~/article','0846a33e56bf45d5aae602ef40d87444','Article',NULL,3,NULL,1,1,'2017-10-15 18:11:44.940',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-09 12:45:01.000','admin','ZKEASOFT','2017-10-15 18:11:44.940');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (219,'0846a33e56bf45d5aae602ef40d87444',NULL,'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.063','admin','ZKEASOFT','2017-11-19 17:48:11.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (220,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.333','admin','ZKEASOFT','2017-11-19 17:48:11.333');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (221,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:11.336','admin','ZKEASOFT','2017-11-19 17:48:11.336');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (222,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.340','admin','ZKEASOFT','2017-11-19 17:48:11.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (223,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.346','admin','ZKEASOFT','2017-11-19 17:48:11.346');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (224,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.350','admin','ZKEASOFT','2017-11-19 17:48:11.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (225,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:11.353','admin','ZKEASOFT','2017-11-19 17:48:11.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (226,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.356','admin','ZKEASOFT','2017-11-19 17:48:11.356');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (227,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.370','admin','ZKEASOFT','2017-11-19 17:48:11.370');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (228,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.373','admin','ZKEASOFT','2017-11-19 17:48:11.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (229,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:11.646','admin','ZKEASOFT','2017-11-19 17:48:11.646');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (230,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.650','admin','ZKEASOFT','2017-11-19 17:48:11.650');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (231,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.650','admin','ZKEASOFT','2017-11-19 17:48:11.650');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (232,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.666','admin','ZKEASOFT','2017-11-19 17:48:11.666');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (233,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:11.950','admin','ZKEASOFT','2017-11-19 17:48:11.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (234,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.983','admin','ZKEASOFT','2017-11-19 17:48:11.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (235,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.986','admin','ZKEASOFT','2017-11-19 17:48:11.986');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (236,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:12.223','admin','ZKEASOFT','2017-11-19 17:48:12.223');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (237,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:12.270','admin','ZKEASOFT','2017-11-19 17:48:12.270');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (238,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:12.500','admin','ZKEASOFT','2017-11-19 17:48:12.500');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (239,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:12.756','admin','ZKEASOFT','2017-11-19 17:48:12.756');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (240,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:39.996','admin','ZKEASOFT','2017-11-19 17:48:39.996');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (241,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.013','admin','ZKEASOFT','2017-11-19 17:48:40.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (242,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:40.016','admin','ZKEASOFT','2017-11-19 17:48:40.016');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (243,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.023','admin','ZKEASOFT','2017-11-19 17:48:40.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (244,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.023','admin','ZKEASOFT','2017-11-19 17:48:40.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (245,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.026','admin','ZKEASOFT','2017-11-19 17:48:40.026');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (246,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:40.026','admin','ZKEASOFT','2017-11-19 17:48:40.026');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (247,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (248,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (249,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (250,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:40.043','admin','ZKEASOFT','2017-11-19 17:48:40.043');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (251,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.043','admin','ZKEASOFT','2017-11-19 17:48:40.043');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (252,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.046','admin','ZKEASOFT','2017-11-19 17:48:40.046');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (253,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.046','admin','ZKEASOFT','2017-11-19 17:48:40.046');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (254,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:40.046','admin','ZKEASOFT','2017-11-19 17:48:40.046');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (255,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.053','admin','ZKEASOFT','2017-11-19 17:48:40.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (256,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.056','admin','ZKEASOFT','2017-11-19 17:48:40.056');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (257,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.056','admin','ZKEASOFT','2017-11-19 17:48:40.056');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (258,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:40.063','admin','ZKEASOFT','2017-11-19 17:48:40.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (259,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.063','admin','ZKEASOFT','2017-11-19 17:48:40.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (260,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:40.073','admin','ZKEASOFT','2017-11-19 17:48:40.073');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (261,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.053','admin','ZKEASOFT','2018-05-21 23:42:40.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (262,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.110','admin','ZKEASOFT','2018-05-21 23:42:40.110');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (263,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-0','admin','ZKEASOFT','2018-05-21 23:42:40.113','admin','ZKEASOFT','2018-05-21 23:42:40.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (264,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.113','admin','ZKEASOFT','2018-05-21 23:42:40.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (265,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.116','admin','ZKEASOFT','2018-05-21 23:42:40.116');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (266,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.116','admin','ZKEASOFT','2018-05-21 23:42:40.116');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (267,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-1','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (268,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (269,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (270,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.123','admin','ZKEASOFT','2018-05-21 23:42:40.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (271,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-2','admin','ZKEASOFT','2018-05-21 23:42:40.123','admin','ZKEASOFT','2018-05-21 23:42:40.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (272,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.126','admin','ZKEASOFT','2018-05-21 23:42:40.126');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (273,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.126','admin','ZKEASOFT','2018-05-21 23:42:40.126');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (274,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.130','admin','ZKEASOFT','2018-05-21 23:42:40.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (275,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-3','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (276,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (277,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (278,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.136','admin','ZKEASOFT','2018-05-21 23:42:40.136');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (279,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-4','admin','ZKEASOFT','2018-05-21 23:42:40.136','admin','ZKEASOFT','2018-05-21 23:42:40.136');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (280,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.140','admin','ZKEASOFT','2018-05-21 23:42:40.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (281,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:42:40.140','admin','ZKEASOFT','2018-05-21 23:42:40.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (282,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:54.990','admin','ZKEASOFT','2018-05-21 23:45:54.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (283,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.003','admin','ZKEASOFT','2018-05-21 23:45:55.003');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (284,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-0','admin','ZKEASOFT','2018-05-21 23:45:55.006','admin','ZKEASOFT','2018-05-21 23:45:55.006');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (285,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.010','admin','ZKEASOFT','2018-05-21 23:45:55.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (286,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.013','admin','ZKEASOFT','2018-05-21 23:45:55.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (287,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.013','admin','ZKEASOFT','2018-05-21 23:45:55.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (288,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-1','admin','ZKEASOFT','2018-05-21 23:45:55.020','admin','ZKEASOFT','2018-05-21 23:45:55.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (289,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.023','admin','ZKEASOFT','2018-05-21 23:45:55.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (290,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.033','admin','ZKEASOFT','2018-05-21 23:45:55.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (291,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.036','admin','ZKEASOFT','2018-05-21 23:45:55.036');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (292,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-2','admin','ZKEASOFT','2018-05-21 23:45:55.050','admin','ZKEASOFT','2018-05-21 23:45:55.050');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (293,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.050','admin','ZKEASOFT','2018-05-21 23:45:55.050');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (294,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.053','admin','ZKEASOFT','2018-05-21 23:45:55.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (295,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.060','admin','ZKEASOFT','2018-05-21 23:45:55.060');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (296,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-3','admin','ZKEASOFT','2018-05-21 23:45:55.063','admin','ZKEASOFT','2018-05-21 23:45:55.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (297,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.066','admin','ZKEASOFT','2018-05-21 23:45:55.066');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (298,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.070','admin','ZKEASOFT','2018-05-21 23:45:55.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (299,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.070','admin','ZKEASOFT','2018-05-21 23:45:55.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (300,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-4','admin','ZKEASOFT','2018-05-21 23:45:55.073','admin','ZKEASOFT','2018-05-21 23:45:55.073');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (301,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.076','admin','ZKEASOFT','2018-05-21 23:45:55.076');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (302,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:45:55.086','admin','ZKEASOFT','2018-05-21 23:45:55.086');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (303,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.366','admin','ZKEASOFT','2018-05-21 23:46:09.366');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (304,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.373','admin','ZKEASOFT','2018-05-21 23:46:09.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (305,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:09.380','admin','ZKEASOFT','2018-05-21 23:46:09.380');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (306,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.380','admin','ZKEASOFT','2018-05-21 23:46:09.380');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (307,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.383','admin','ZKEASOFT','2018-05-21 23:46:09.383');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (308,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.383','admin','ZKEASOFT','2018-05-21 23:46:09.383');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (309,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:09.386','admin','ZKEASOFT','2018-05-21 23:46:09.386');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (310,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.390','admin','ZKEASOFT','2018-05-21 23:46:09.390');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (311,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.393','admin','ZKEASOFT','2018-05-21 23:46:09.393');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (312,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.393','admin','ZKEASOFT','2018-05-21 23:46:09.393');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (313,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:09.396','admin','ZKEASOFT','2018-05-21 23:46:09.396');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (314,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.396','admin','ZKEASOFT','2018-05-21 23:46:09.396');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (315,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.400','admin','ZKEASOFT','2018-05-21 23:46:09.400');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (316,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.400','admin','ZKEASOFT','2018-05-21 23:46:09.400');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (317,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:09.406','admin','ZKEASOFT','2018-05-21 23:46:09.406');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (318,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.410','admin','ZKEASOFT','2018-05-21 23:46:09.410');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (319,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.416','admin','ZKEASOFT','2018-05-21 23:46:09.416');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (320,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.420','admin','ZKEASOFT','2018-05-21 23:46:09.420');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (321,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:09.423','admin','ZKEASOFT','2018-05-21 23:46:09.423');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (322,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.426','admin','ZKEASOFT','2018-05-21 23:46:09.426');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (323,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:09.426','admin','ZKEASOFT','2018-05-21 23:46:09.426');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (324,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.003','admin','ZKEASOFT','2018-05-21 23:46:13.003');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (325,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.010','admin','ZKEASOFT','2018-05-21 23:46:13.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (326,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:13.010','admin','ZKEASOFT','2018-05-21 23:46:13.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (327,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.013','admin','ZKEASOFT','2018-05-21 23:46:13.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (328,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.013','admin','ZKEASOFT','2018-05-21 23:46:13.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (329,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.016','admin','ZKEASOFT','2018-05-21 23:46:13.016');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (330,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:13.016','admin','ZKEASOFT','2018-05-21 23:46:13.016');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (331,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.016','admin','ZKEASOFT','2018-05-21 23:46:13.016');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (332,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.020','admin','ZKEASOFT','2018-05-21 23:46:13.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (333,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.020','admin','ZKEASOFT','2018-05-21 23:46:13.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (334,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:13.023','admin','ZKEASOFT','2018-05-21 23:46:13.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (335,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.023','admin','ZKEASOFT','2018-05-21 23:46:13.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (336,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.026','admin','ZKEASOFT','2018-05-21 23:46:13.026');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (337,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.026','admin','ZKEASOFT','2018-05-21 23:46:13.026');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (338,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:13.030','admin','ZKEASOFT','2018-05-21 23:46:13.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (339,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.030','admin','ZKEASOFT','2018-05-21 23:46:13.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (340,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.033','admin','ZKEASOFT','2018-05-21 23:46:13.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (341,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.033','admin','ZKEASOFT','2018-05-21 23:46:13.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (342,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:13.036','admin','ZKEASOFT','2018-05-21 23:46:13.036');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (343,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.036','admin','ZKEASOFT','2018-05-21 23:46:13.036');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (344,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:13.036','admin','ZKEASOFT','2018-05-21 23:46:13.036');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (345,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.126','admin','ZKEASOFT','2018-05-21 23:46:15.126');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (346,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.130','admin','ZKEASOFT','2018-05-21 23:46:15.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (347,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:15.133','admin','ZKEASOFT','2018-05-21 23:46:15.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (348,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.133','admin','ZKEASOFT','2018-05-21 23:46:15.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (349,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.136','admin','ZKEASOFT','2018-05-21 23:46:15.136');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (350,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.136','admin','ZKEASOFT','2018-05-21 23:46:15.136');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (351,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:15.140','admin','ZKEASOFT','2018-05-21 23:46:15.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (352,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.140','admin','ZKEASOFT','2018-05-21 23:46:15.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (353,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (354,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (355,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (356,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.146','admin','ZKEASOFT','2018-05-21 23:46:15.146');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (357,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.146','admin','ZKEASOFT','2018-05-21 23:46:15.146');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (358,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.150','admin','ZKEASOFT','2018-05-21 23:46:15.150');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (359,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:15.150','admin','ZKEASOFT','2018-05-21 23:46:15.150');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (360,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.153','admin','ZKEASOFT','2018-05-21 23:46:15.153');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (361,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.156','admin','ZKEASOFT','2018-05-21 23:46:15.156');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (362,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.160','admin','ZKEASOFT','2018-05-21 23:46:15.160');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (363,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:15.166','admin','ZKEASOFT','2018-05-21 23:46:15.166');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (364,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.166','admin','ZKEASOFT','2018-05-21 23:46:15.166');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (365,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:15.173','admin','ZKEASOFT','2018-05-21 23:46:15.173');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (366,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.316','admin','ZKEASOFT','2018-05-21 23:46:19.316');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (367,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.320','admin','ZKEASOFT','2018-05-21 23:46:19.320');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (368,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:19.323','admin','ZKEASOFT','2018-05-21 23:46:19.323');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (369,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.323','admin','ZKEASOFT','2018-05-21 23:46:19.323');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (370,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.326','admin','ZKEASOFT','2018-05-21 23:46:19.326');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (371,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.330','admin','ZKEASOFT','2018-05-21 23:46:19.330');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (372,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:19.330','admin','ZKEASOFT','2018-05-21 23:46:19.330');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (373,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.336','admin','ZKEASOFT','2018-05-21 23:46:19.336');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (374,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.336','admin','ZKEASOFT','2018-05-21 23:46:19.336');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (375,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.340','admin','ZKEASOFT','2018-05-21 23:46:19.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (376,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:19.340','admin','ZKEASOFT','2018-05-21 23:46:19.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (377,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.343','admin','ZKEASOFT','2018-05-21 23:46:19.343');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (378,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.343','admin','ZKEASOFT','2018-05-21 23:46:19.343');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (379,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.346','admin','ZKEASOFT','2018-05-21 23:46:19.346');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (380,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:19.346','admin','ZKEASOFT','2018-05-21 23:46:19.346');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (381,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.350','admin','ZKEASOFT','2018-05-21 23:46:19.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (382,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.350','admin','ZKEASOFT','2018-05-21 23:46:19.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (383,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (384,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (385,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (386,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:19.356','admin','ZKEASOFT','2018-05-21 23:46:19.356');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (387,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.740','admin','ZKEASOFT','2018-05-21 23:46:28.740');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (388,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.746','admin','ZKEASOFT','2018-05-21 23:46:28.746');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (389,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:28.746','admin','ZKEASOFT','2018-05-21 23:46:28.746');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (390,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.753','admin','ZKEASOFT','2018-05-21 23:46:28.753');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (391,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.753','admin','ZKEASOFT','2018-05-21 23:46:28.753');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (392,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.760','admin','ZKEASOFT','2018-05-21 23:46:28.760');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (393,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:28.760','admin','ZKEASOFT','2018-05-21 23:46:28.760');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (394,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.763','admin','ZKEASOFT','2018-05-21 23:46:28.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (395,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.763','admin','ZKEASOFT','2018-05-21 23:46:28.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (396,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.766','admin','ZKEASOFT','2018-05-21 23:46:28.766');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (397,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:28.770','admin','ZKEASOFT','2018-05-21 23:46:28.770');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (398,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.780','admin','ZKEASOFT','2018-05-21 23:46:28.780');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (399,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.783','admin','ZKEASOFT','2018-05-21 23:46:28.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (400,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.790','admin','ZKEASOFT','2018-05-21 23:46:28.790');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (401,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:28.790','admin','ZKEASOFT','2018-05-21 23:46:28.790');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (402,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.796','admin','ZKEASOFT','2018-05-21 23:46:28.796');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (403,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.796','admin','ZKEASOFT','2018-05-21 23:46:28.796');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (404,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.803','admin','ZKEASOFT','2018-05-21 23:46:28.803');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (405,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:28.810','admin','ZKEASOFT','2018-05-21 23:46:28.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (406,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.810','admin','ZKEASOFT','2018-05-21 23:46:28.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (407,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:28.816','admin','ZKEASOFT','2018-05-21 23:46:28.816');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (408,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.763','admin','ZKEASOFT','2018-05-21 23:46:34.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (409,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.766','admin','ZKEASOFT','2018-05-21 23:46:34.766');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (410,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:34.770','admin','ZKEASOFT','2018-05-21 23:46:34.770');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (411,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.773','admin','ZKEASOFT','2018-05-21 23:46:34.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (412,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.773','admin','ZKEASOFT','2018-05-21 23:46:34.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (413,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.776','admin','ZKEASOFT','2018-05-21 23:46:34.776');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (414,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:34.776','admin','ZKEASOFT','2018-05-21 23:46:34.776');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (415,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.783','admin','ZKEASOFT','2018-05-21 23:46:34.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (416,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.783','admin','ZKEASOFT','2018-05-21 23:46:34.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (417,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.796','admin','ZKEASOFT','2018-05-21 23:46:34.796');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (418,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:34.800','admin','ZKEASOFT','2018-05-21 23:46:34.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (419,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.800','admin','ZKEASOFT','2018-05-21 23:46:34.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (420,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.803','admin','ZKEASOFT','2018-05-21 23:46:34.803');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (421,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.810','admin','ZKEASOFT','2018-05-21 23:46:34.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (422,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:34.816','admin','ZKEASOFT','2018-05-21 23:46:34.816');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (423,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.820','admin','ZKEASOFT','2018-05-21 23:46:34.820');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (424,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.820','admin','ZKEASOFT','2018-05-21 23:46:34.820');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (425,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.826','admin','ZKEASOFT','2018-05-21 23:46:34.826');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (426,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:34.826','admin','ZKEASOFT','2018-05-21 23:46:34.826');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (427,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.833','admin','ZKEASOFT','2018-05-21 23:46:34.833');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (428,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:34.833','admin','ZKEASOFT','2018-05-21 23:46:34.833');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (429,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.443','admin','ZKEASOFT','2018-05-22 11:31:26.443');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (430,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.453','admin','ZKEASOFT','2018-05-22 11:31:26.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (431,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:26.453','admin','ZKEASOFT','2018-05-22 11:31:26.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (432,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.456','admin','ZKEASOFT','2018-05-22 11:31:26.456');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (433,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.456','admin','ZKEASOFT','2018-05-22 11:31:26.456');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (434,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.456','admin','ZKEASOFT','2018-05-22 11:31:26.456');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (435,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:26.460','admin','ZKEASOFT','2018-05-22 11:31:26.460');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (436,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.463','admin','ZKEASOFT','2018-05-22 11:31:26.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (437,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.463','admin','ZKEASOFT','2018-05-22 11:31:26.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (438,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.466','admin','ZKEASOFT','2018-05-22 11:31:26.466');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (439,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:26.466','admin','ZKEASOFT','2018-05-22 11:31:26.466');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (440,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.470','admin','ZKEASOFT','2018-05-22 11:31:26.470');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (441,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.473','admin','ZKEASOFT','2018-05-22 11:31:26.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (442,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.473','admin','ZKEASOFT','2018-05-22 11:31:26.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (443,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:26.476','admin','ZKEASOFT','2018-05-22 11:31:26.476');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (444,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.480','admin','ZKEASOFT','2018-05-22 11:31:26.480');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (445,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.480','admin','ZKEASOFT','2018-05-22 11:31:26.480');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (446,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.483','admin','ZKEASOFT','2018-05-22 11:31:26.483');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (447,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:26.483','admin','ZKEASOFT','2018-05-22 11:31:26.483');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (448,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.486','admin','ZKEASOFT','2018-05-22 11:31:26.486');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (449,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:26.486','admin','ZKEASOFT','2018-05-22 11:31:26.486');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (450,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.516','admin','ZKEASOFT','2018-05-22 11:31:31.516');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (451,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.520','admin','ZKEASOFT','2018-05-22 11:31:31.520');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (452,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:31.536','admin','ZKEASOFT','2018-05-22 11:31:31.536');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (453,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.546','admin','ZKEASOFT','2018-05-22 11:31:31.546');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (454,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.560','admin','ZKEASOFT','2018-05-22 11:31:31.560');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (455,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.580','admin','ZKEASOFT','2018-05-22 11:31:31.580');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (456,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:31.593','admin','ZKEASOFT','2018-05-22 11:31:31.593');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (457,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.606','admin','ZKEASOFT','2018-05-22 11:31:31.606');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (458,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.616','admin','ZKEASOFT','2018-05-22 11:31:31.616');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (459,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.620','admin','ZKEASOFT','2018-05-22 11:31:31.620');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (460,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:31.620','admin','ZKEASOFT','2018-05-22 11:31:31.620');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (461,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.626','admin','ZKEASOFT','2018-05-22 11:31:31.626');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (462,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.640','admin','ZKEASOFT','2018-05-22 11:31:31.640');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (463,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.653','admin','ZKEASOFT','2018-05-22 11:31:31.653');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (464,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:31.663','admin','ZKEASOFT','2018-05-22 11:31:31.663');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (465,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.676','admin','ZKEASOFT','2018-05-22 11:31:31.676');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (466,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.686','admin','ZKEASOFT','2018-05-22 11:31:31.686');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (467,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.700','admin','ZKEASOFT','2018-05-22 11:31:31.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (468,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:31.713','admin','ZKEASOFT','2018-05-22 11:31:31.713');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (469,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.723','admin','ZKEASOFT','2018-05-22 11:31:31.723');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (470,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:31.736','admin','ZKEASOFT','2018-05-22 11:31:31.736');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (471,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.700','admin','ZKEASOFT','2018-05-22 11:31:35.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (472,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.700','admin','ZKEASOFT','2018-05-22 11:31:35.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (473,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:35.713','admin','ZKEASOFT','2018-05-22 11:31:35.713');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (474,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.723','admin','ZKEASOFT','2018-05-22 11:31:35.723');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (475,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.736','admin','ZKEASOFT','2018-05-22 11:31:35.736');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (476,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.750','admin','ZKEASOFT','2018-05-22 11:31:35.750');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (477,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:35.763','admin','ZKEASOFT','2018-05-22 11:31:35.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (478,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.773','admin','ZKEASOFT','2018-05-22 11:31:35.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (479,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.786','admin','ZKEASOFT','2018-05-22 11:31:35.786');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (480,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.800','admin','ZKEASOFT','2018-05-22 11:31:35.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (481,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:35.813','admin','ZKEASOFT','2018-05-22 11:31:35.813');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (482,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.823','admin','ZKEASOFT','2018-05-22 11:31:35.823');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (483,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.836','admin','ZKEASOFT','2018-05-22 11:31:35.836');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (484,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.850','admin','ZKEASOFT','2018-05-22 11:31:35.850');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (485,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:35.860','admin','ZKEASOFT','2018-05-22 11:31:35.860');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (486,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.873','admin','ZKEASOFT','2018-05-22 11:31:35.873');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (487,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.886','admin','ZKEASOFT','2018-05-22 11:31:35.886');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (488,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.896','admin','ZKEASOFT','2018-05-22 11:31:35.896');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (489,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:35.910','admin','ZKEASOFT','2018-05-22 11:31:35.910');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (490,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.923','admin','ZKEASOFT','2018-05-22 11:31:35.923');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (491,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:35.936','admin','ZKEASOFT','2018-05-22 11:31:35.936');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (492,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.900','admin','ZKEASOFT','2018-05-22 11:31:39.900');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (493,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.900','admin','ZKEASOFT','2018-05-22 11:31:39.900');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (494,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:39.903','admin','ZKEASOFT','2018-05-22 11:31:39.903');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (495,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.903','admin','ZKEASOFT','2018-05-22 11:31:39.903');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (496,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.906','admin','ZKEASOFT','2018-05-22 11:31:39.906');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (497,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.906','admin','ZKEASOFT','2018-05-22 11:31:39.906');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (498,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:39.906','admin','ZKEASOFT','2018-05-22 11:31:39.906');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (499,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.910','admin','ZKEASOFT','2018-05-22 11:31:39.910');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (500,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.913','admin','ZKEASOFT','2018-05-22 11:31:39.913');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (501,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.913','admin','ZKEASOFT','2018-05-22 11:31:39.913');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (502,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:39.916','admin','ZKEASOFT','2018-05-22 11:31:39.916');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (503,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.916','admin','ZKEASOFT','2018-05-22 11:31:39.916');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (504,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.920','admin','ZKEASOFT','2018-05-22 11:31:39.920');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (505,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.923','admin','ZKEASOFT','2018-05-22 11:31:39.923');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (506,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:39.926','admin','ZKEASOFT','2018-05-22 11:31:39.926');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (507,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.930','admin','ZKEASOFT','2018-05-22 11:31:39.930');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (508,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.933','admin','ZKEASOFT','2018-05-22 11:31:39.933');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (509,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.933','admin','ZKEASOFT','2018-05-22 11:31:39.933');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (510,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:39.936','admin','ZKEASOFT','2018-05-22 11:31:39.936');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (511,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.936','admin','ZKEASOFT','2018-05-22 11:31:39.936');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (512,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:39.936','admin','ZKEASOFT','2018-05-22 11:31:39.936');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (513,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.950','admin','ZKEASOFT','2018-05-22 11:31:43.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (514,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.953','admin','ZKEASOFT','2018-05-22 11:31:43.953');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (515,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:43.953','admin','ZKEASOFT','2018-05-22 11:31:43.953');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (516,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.956','admin','ZKEASOFT','2018-05-22 11:31:43.956');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (517,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.956','admin','ZKEASOFT','2018-05-22 11:31:43.956');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (518,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.963','admin','ZKEASOFT','2018-05-22 11:31:43.963');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (519,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:43.966','admin','ZKEASOFT','2018-05-22 11:31:43.966');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (520,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.966','admin','ZKEASOFT','2018-05-22 11:31:43.966');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (521,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.970','admin','ZKEASOFT','2018-05-22 11:31:43.970');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (522,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.973','admin','ZKEASOFT','2018-05-22 11:31:43.973');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (523,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:43.976','admin','ZKEASOFT','2018-05-22 11:31:43.976');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (524,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.980','admin','ZKEASOFT','2018-05-22 11:31:43.980');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (525,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.983','admin','ZKEASOFT','2018-05-22 11:31:43.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (526,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.983','admin','ZKEASOFT','2018-05-22 11:31:43.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (527,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:43.986','admin','ZKEASOFT','2018-05-22 11:31:43.986');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (528,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.986','admin','ZKEASOFT','2018-05-22 11:31:43.986');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (529,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.990','admin','ZKEASOFT','2018-05-22 11:31:43.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (530,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.990','admin','ZKEASOFT','2018-05-22 11:31:43.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (531,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:43.993','admin','ZKEASOFT','2018-05-22 11:31:43.993');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (532,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.996','admin','ZKEASOFT','2018-05-22 11:31:43.996');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (533,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:44.000','admin','ZKEASOFT','2018-05-22 11:31:44.000');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (534,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.356','admin','ZKEASOFT','2018-05-22 11:31:49.356');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (535,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.360','admin','ZKEASOFT','2018-05-22 11:31:49.360');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (536,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:49.373','admin','ZKEASOFT','2018-05-22 11:31:49.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (537,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.386','admin','ZKEASOFT','2018-05-22 11:31:49.386');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (538,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.396','admin','ZKEASOFT','2018-05-22 11:31:49.396');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (539,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.410','admin','ZKEASOFT','2018-05-22 11:31:49.410');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (540,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:49.426','admin','ZKEASOFT','2018-05-22 11:31:49.426');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (541,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.440','admin','ZKEASOFT','2018-05-22 11:31:49.440');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (542,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.453','admin','ZKEASOFT','2018-05-22 11:31:49.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (543,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.463','admin','ZKEASOFT','2018-05-22 11:31:49.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (544,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:49.476','admin','ZKEASOFT','2018-05-22 11:31:49.476');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (545,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.490','admin','ZKEASOFT','2018-05-22 11:31:49.490');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (546,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.503','admin','ZKEASOFT','2018-05-22 11:31:49.503');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (547,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.516','admin','ZKEASOFT','2018-05-22 11:31:49.516');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (548,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:49.526','admin','ZKEASOFT','2018-05-22 11:31:49.526');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (549,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.540','admin','ZKEASOFT','2018-05-22 11:31:49.540');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (550,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.553','admin','ZKEASOFT','2018-05-22 11:31:49.553');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (551,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.566','admin','ZKEASOFT','2018-05-22 11:31:49.566');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (552,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:49.580','admin','ZKEASOFT','2018-05-22 11:31:49.580');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (553,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.593','admin','ZKEASOFT','2018-05-22 11:31:49.593');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (554,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:49.606','admin','ZKEASOFT','2018-05-22 11:31:49.606');
INSERT INTO [Carousel] ([ID],[Title],[Height],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Sample',NULL,NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.203','admin','ZKEASOFT','2016-03-27 15:17:54.050');
INSERT INTO [CarouselWidget] ([ID],[CarouselID]) VALUES ('19350341920b4827bf2a4e458ad24a58',1);
INSERT INTO [CarouselWidget] ([ID],[CarouselID]) VALUES ('41e075ab1b89453388494a539eec55b9',1);
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Image 1',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg1.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.216','admin','ZKEASOFT','2016-03-27 15:17:54.053');
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'Image 2',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg2.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.570','admin','ZKEASOFT','2016-03-27 15:17:54.420');
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'Image 3',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg3.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.573','admin','ZKEASOFT','2016-03-27 15:17:54.433');
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('8df64186d2fd4d63a9f9bb3b6e34cd2a',1,NULL);
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('de8d94fd51cb4e73b00518dbb2f134d3',1,NULL);
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[DisplayOrder]) VALUES (1,'News',NULL,0,'news',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:18.000','admin','ZKEASOFT','2024-11-16 13:53:08.751',NULL);
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[DisplayOrder]) VALUES (2,'Company',NULL,1,'company',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:24.000','admin','ZKEASOFT','2018-08-15 15:31:38.346',NULL);
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[DisplayOrder]) VALUES (3,'Industry',NULL,1,'industry',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:29.000','admin','ZKEASOFT','2018-08-15 15:31:42.810',NULL);
INSERT INTO [ArticleSummaryWidget] ([ID],[SubTitle],[Style],[DetailLink],[Summary]) VALUES ('8c5b69f614b641c0a5f7a8e318de8df3','Introduction to ZKEACMS','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS" target="_blank" rel="noopener">ZKEACMS</a> Core is an open-source CMS developed based on .Net Core. Before you start using it, to protect your rights, please first check our open-source license <a href="http://www.zkea.net/licenses" target="_blank" rel="noopener">http://www.zkea.net/licenses</a>.</p>
<p>ZKEACMS is a content management software. The main purpose of ZKEACMS is to quickly create pages and customize page content. Whether you are a professional developer or an ordinary user, you can quickly get started with ZKEACMS.</p>
<p>ZKEACMS uses visual editing design, WYSIWYG, and you can directly design the page you want on the page.</p>
<p>Setup environment: .Net Core 2.0</p>
<h3>Flagship Version</h3>
<p>Experience address: <a href="http://demo.zkea.net" target="_blank" rel="noopener">http://demo.zkea.net</a></p>
<h3>Website Building System</h3>
<p>Cloud website building system based on ZKEACMS</p>
<p><a href="http://www.zkea.net/cloud" target="_blank" rel="noopener">http://www.zkea.net/cloud</a></p>
<p></p>');
INSERT INTO [ArticleSummaryWidget] ([ID],[SubTitle],[Style],[DetailLink],[Summary]) VALUES ('cd21a7bf68b44f6e8d178b153288a26e','Introduction to ZKEACMS','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS" target="_blank" rel="noopener">ZKEACMS</a> Core is an open-source CMS developed based on .Net Core. Before you start using it, to protect your rights, please first check our open-source license <a href="http://www.zkea.net/licenses" target="_blank" rel="noopener">http://www.zkea.net/licenses</a>.</p>
<p>ZKEACMS is a content management software. The main purpose of ZKEACMS is to quickly create pages and customize page content. Whether you are a professional developer or an ordinary user, you can quickly get started with ZKEACMS.</p>
<p>ZKEACMS uses visual editing design, WYSIWYG, and you can directly design the page you want on the page.</p>
<p>Setup environment: .Net Core 2.0</p>
<h3>Flagship Version</h3>
<p>Experience address: <a href="http://demo.zkea.net" target="_blank" rel="noopener">http://demo.zkea.net</a></p>
<h3>Website Building System</h3>
<p>Cloud website building system based on ZKEACMS</p>
<p><a href="http://www.zkea.net/cloud" target="_blank" rel="noopener">http://www.zkea.net/cloud</a></p>
<p></p>');
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('416c5402962b41548c83fabaa5492b42',1,'~/article/detail',1,5);
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('ca9f8809636d448cbd4f3beb418465b3',1,'~/article/detail',1,5);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('3aa8b53e7ad143ff818855a7abcb3fdd',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('e8fd1019bab045e5927ec30abaaa1aba',NULL);
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Introduction to ZKEACMS','ZKEACMS is an open-source .Net CMS developed using ASP.NET MVC. ZKEACMS is a content management system.','ZKEACMS','ZKEACMS is an open-source .Net CMS developed using ASP.NET MVC. ZKEACMS is a content management system.',1,2,NULL,'<h3>Introduction</h3>
<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a> is an open-source .Net CMS developed using ASP .NET MVC based on <a href="http://www.zkea.net/easyframework">EasyFrameWork</a>.</p>
<p>ZKEACMS is a content management system. ZKEACMS not only manages content but also redefines layout, pages, and components, allowing users to freely plan the layout, pages, and content of the page.</p>
<p>ZKEACMS uses visual editing design, truly achieving WYSIWYG, and allows direct design of pages on the preview page.</p>
<p>ZKEACMS adopts a plugin design, supporting the extension of new plugins.</p>
<h4><a href="http://www.zkea.net/zkeacms/createpage" target="_blank" rel="noopener">Learn about our design philosophy</a></h4>
<h3>Development Environment</h3>
<p>Microsoft VisualStudio 2013</p>
<p><span>.Net 9</span></p>
<p>Microsoft Sql Server 2016 and above</p>
<h3>Intuitive Design</h3>
<p>ZKEACMS is an open-source CMS based on ASP.NET MVC, and WYSIWYG is a major feature of ZKEACMS.</p>
<p>Adding new pages or directly designing, editing, and adding content on existing pages is very simple.</p>
<p>With rich components and templates, as long as you can operate a computer, you can design a website.</p>
<h3>Easy Operation</h3>
<p>ZKEACMS adopts drag-and-drop operation design, simple and intuitive, directly dragging the template you see and like into the page.</p>
<p>In key places of user interaction, there will be prompts or previews, and ZKEASOFT provides detailed <a href="http://www.zkea.net/zkeacms/document" target="_blank" rel="noopener">documentation</a></p>
<h3>Mobile Friendly</h3>
<p>ZKEACMS themes are designed based on the popular BootStrap, adopting modern responsive design, which can automatically adapt to different screen sizes and devices.</p>
<p>From PC, laptop, TV, tablet to mobile phone, the page will automatically respond and adapt.</p>
<h3>Layout Design</h3>
<p>Layout is used to divide the page into areas. Users use drag-and-drop "rows" and "columns" to design the layout. The layout division adopts rows and columns, which can be nested.</p>
<p>In a layout, you can add any number of rows, each row is divided into 12 equal parts for the grid, and can be divided into up to 12 columns. After the row and column division is completed, you need to add "component areas" in the columns to add components to the column.</p>
<h3>Overview Design</h3>
<p>The overview page is a thumbnail display of the page. In this page, users can directly see the layout of the page and the components in the page.</p>
<p>In the overview page, users can add components to any area. You can sort or drag and drop components in any area to another area for display.</p>
<h3>Extensibility</h3>
<p>ZKEACMS is designed with content and templates separated, allowing different display effects by switching templates without switching themes.</p>
<p>By continuously adding templates, the webpage becomes more diverse and modern.</p>
<p><span>ZKEACMS is designed with a plugin system, allowing new features to be obtained by continuously adding plugins. The default plugins are sufficient for daily use.</span></p>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:41:19.000','zkeacms','admin','ZKEASOFT','2017-11-19 23:41:19.000','admin','ZKEASOFT','2019-04-24 21:52:43.060');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'ZKEACMS For .Net Core','ZKEACMS Core is a full-featured implementation of ZKEACMS for .Net Core, achieving cross-platform with .Net Core, allowing you to run on Windows, MAC OS, Linux, Docker.','ZKEACMS .Net Core','ZKEACMS Core is a full-featured implementation of ZKEACMS for .Net Core, achieving cross-platform with .Net Core, allowing you to run on Windows, MAC OS, Linux, Docker.',1,3,NULL,'<h3>Full-featured Migration</h3>
<p>ZKEACMS Core is a full-featured implementation of ZKEACMS for .Net Core, achieving cross-platform with .Net Core, allowing you to run on Windows, MAC OS, Linux, Docker.</p>
<p>Currently, ZKEACMS Core has been officially released. It has all the features of ZKEACMS and is even better, performing better in all aspects such as performance. We recommend you use it.</p>
<p><img src="http://ww4.sinaimg.cn/mw690/005zTNGqgw1f5e6o2kejlg30dw08an3g.gif" /></p>
<h3>Based on .NET Core</h3>
<p>.NET Core is the new generation version of .NET Framework, the first official version developed by Microsoft, an application framework with cross-platform (Windows, Mac OSX, Linux) capabilities. It will also support FreeBSD and Alpine platforms in the future. It is also an open-source software platform developed by Microsoft from the beginning, often compared with the existing open-source .NET platform Mono.</p>
<p>ZKEACMS Core is redesigned based on ASP .NET MVC Core. ZKEACMS v2.3 uses the earlier MVC4, now you can use all the new features of MVC Core, such as tag helper, etc., allowing you to fully utilize the advantages of cross-platform, with impressive performance and high reliability. Developers can quickly and directly obtain the .NET Core development environment.</p>
<h3>Redesign</h3>
<p>Due to the revolution of .Net Core, ZKEACMS Core has redesigned the underlying to adapt to ASP .NET Core. Although the underlying has been redesigned, ZKEASOFT still tries to ensure the completeness of the CMS functions of the Core version, and resources can be shared between the two versions.</p>
<p>The redesigned .Net core CMS will further reduce your entry cost. If you are familiar with ZKEACMS before, you can immediately start the development work of ZKEACMS Core.</p>
<h3>Entity Framework Core</h3>
<p>Entity Framework Core is the .Net Core version of Entity Framework. Entity Framework is an object-relational mapping (O/R Mapping) solution developed by Microsoft based on ADO.NET. Using Entity Framework, you can easily switch to different database instances, such as SQLServer, MySql, ORACLE, SQLite, etc.</p>
<p>ZKEACMS Core abandons the ORM system in EasyFramework and uses Entity Framework Core as the database access, reducing the learning and entry cost. With Entity Framework, you can quickly get started and easily choose different databases.</p>
<h3>Hot-pluggable Plugin Mechanism</h3>
<p>ZKEACMS Core has redesigned the plugin mechanism, separating each component assembly (DLL), making it more convenient for the independence and isolation of each component. As a result, hot-plugging of plugins has become possible.</p>
<p>Based on the plugin design, your program can be infinitely horizontally expanded, and functions can become richer without modifying the core functions.</p>
<div>
<div>
<div>
<div>
<p></p>
</div>
</div>
</div>
</div>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:53:23.000','zkeacms-core','admin','ZKEASOFT','2017-11-19 23:53:16.000','admin','ZKEASOFT','2019-04-24 21:52:54.903');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Animation_Widget_FadeInUp','false',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:10.083',NULL,NULL,'2022-07-29 20:42:10.083');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EnableCustomerAccount','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:31.003',NULL,NULL,'2022-07-29 20:42:31.003');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EnableResponsiveDesign','true',NULL,NULL,1,NULL,NULL,'2020-03-14 11:32:07.333',NULL,NULL,'2020-03-14 11:32:07.333');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ExpandAllPage','true',NULL,NULL,1,'admin','ZKEASOFT','2018-04-11 17:01:47.230','admin','ZKEASOFT','2018-04-11 17:01:47.233');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Favicon','~/favicon.ico',NULL,NULL,NULL,'admin','ZKEASOFT','2017-03-19 20:57:33.626','admin','ZKEASOFT','2017-03-19 20:57:33.626');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('OuterChainPicture','false',NULL,NULL,1,NULL,NULL,'2019-07-31 12:09:28.430',NULL,NULL,'2019-07-31 12:09:28.430');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('PinNavigation','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:10.386',NULL,NULL,'2022-07-29 20:42:10.386');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SiteInformation_Logo_Mini','/images/logo_min.png',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.370','admin','ZKEASOFT','2021-03-06 22:16:20.370');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SiteInformation_SiteName','ZKEASOFT',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.310','admin','ZKEASOFT','2021-03-06 22:16:20.310');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UseImageCaptcha','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:39.536',NULL,NULL,'2022-07-29 20:42:39.536');
COMMIT;

