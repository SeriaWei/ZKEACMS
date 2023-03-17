-- Script Date: 2023/3/16 星期四 22:07  - ErikEJ.SqlCeScripting version 3.5.2.56
SELECT 1;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
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
, [Title] nvarchar(50) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Subscrip__3214EC27DB6E89CF] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__Shipping__3214EC276C6DB584] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__Roles__3214EC27E4D265F1] PRIMARY KEY ([ID])
);
CREATE TABLE [UserRoleRelation] (
  [ID] INTEGER NOT NULL
, [RoleID] int NULL
, [UserID] nvarchar(50) NULL
, CONSTRAINT [PK__UserRole__3214EC274A69DF14] PRIMARY KEY ([ID])
, FOREIGN KEY ([RoleID]) REFERENCES [Roles] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([UserID]) REFERENCES [Users] ([UserID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductTag] (
  [ID] INTEGER NOT NULL
, [ProductId] int NULL
, [TagId] int NULL
, [Title] nvarchar(50) NULL
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
, CONSTRAINT [PK__ProductG__3214EC2713CC6D28] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductCategoryTag] (
  [ID] INTEGER NOT NULL
, [ProductCategoryId] int NULL
, [Title] nvarchar(50) NULL
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
, CONSTRAINT [PK__PersistK__3214EC27F773609C] PRIMARY KEY ([ID])
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
, [Title] nvarchar(50) NULL
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
, CONSTRAINT [PK__FluidCon__3214EC279D6E60F0] PRIMARY KEY ([ID])
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
, [Identifier] nvarchar(100) NOT NULL
, [HandlerName] nvarchar(100) NOT NULL
, [Data] ntext NULL
, [LogMessage] ntext NULL
, [RetryCount] int NULL
, [Title] nvarchar(50) NULL
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
, [Title] nvarchar(50) NULL
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
, [Title] nvarchar(50) NULL
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
, CONSTRAINT [PK__DBVersio__3214EC270A3F53A2] PRIMARY KEY ([ID])
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
, [Title] nvarchar(50) NULL
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
, CONSTRAINT [PK__Currency__3214EC27B1BBAB27] PRIMARY KEY ([ID])
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
, [Title] nvarchar(50) NULL
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
, [Title] nvarchar(50) NULL
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
, [Title] nvarchar(50) NULL
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
, [Title] nvarchar(50) NULL
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
, [Title] nvarchar(50) NULL
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
, [Url] nvarchar(255) NULL
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
, CONSTRAINT [PK__ArticleG__3214EC279EBADFB8] PRIMARY KEY ([ID])
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
  [SettingKey] nvarchar(50) NOT NULL
, [Value] ntext NULL
, [Title] nvarchar(50) NULL
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
INSERT INTO [Users] ([UserID],[PassWord],[ApiLoginToken],[LastLoginDate],[LoginIP],[PhotoUrl],[Timestamp],[UserName],[UserTypeCD],[Address],[Age],[Birthday],[Birthplace],[Email],[EnglishName],[FirstName],[Hobby],[LastName],[MaritalStatus],[MobilePhone],[NickName],[Profession],[QQ],[School],[Sex],[Telephone],[ZipCode],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Status],[Description],[ResetToken],[ResetTokenDate]) VALUES ('admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',NULL,'2020-11-10 21:40:58.163','::1','~/images/head.png',0,'ZKEASOFT',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Admin',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'admin','Admin','2020-11-10 21:40:58.183',1,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Banner','横幅广告','Thumbnail\SectionTemplate.Banner.png','Thumbnail\SectionTemplate.Banner.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Brand','品牌','Thumbnail\SectionTemplate.Brand.png','Thumbnail\SectionTemplate.Brand.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.CalendarEvent','日历事件','Thumbnail\SectionTemplate.CalendarEvent.png','Thumbnail\SectionTemplate.CalendarEvent.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Column','左右','Thumbnail\SectionTemplate.Column.png','Thumbnail\SectionTemplate.Column.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Default','默认','Thumbnail\SectionTemplate.Default.png','Thumbnail\SectionTemplate.Default.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.GreyBox','背景灰','Thumbnail\SectionTemplate.GreyBox.png','Thumbnail\SectionTemplate.GreyBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageBox','图片框','Thumbnail\SectionTemplate.ImageBox.png','Thumbnail\SectionTemplate.ImageBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageGreyBox','图片框','Thumbnail\SectionTemplate.ImageGreyBox.png','Thumbnail\SectionTemplate.ImageGreyBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageRight','图片右','Thumbnail\SectionTemplate.ImageRight.png','Thumbnail\SectionTemplate.ImageRight.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.JCarousel','滚动图','Thumbnail\SectionTemplate.JCarousel.png','Thumbnail\SectionTemplate.JCarousel.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LeftThreeIcon','左三图标','Thumbnail\SectionTemplate.LeftThreeIcon.png','Thumbnail\SectionTemplate.LeftThreeIcon.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LifeStyle','生活格调','Thumbnail\SectionTemplate.LifeStyle.png','Thumbnail\SectionTemplate.LifeStyle.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LinkGroup','链接组','Thumbnail\SectionTemplate.LinkGroup.png','Thumbnail\SectionTemplate.LinkGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ListGroup','列表组','Thumbnail\SectionTemplate.ListGroup.png','Thumbnail\SectionTemplate.ListGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ListView','媒体列表','Thumbnail\SectionTemplate.ListView.png','Thumbnail\SectionTemplate.ListView.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Portfolio','品牌案例','Thumbnail\SectionTemplate.Portfolio.png','Thumbnail\SectionTemplate.Portfolio.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ProductHero','产品页头','Thumbnail\SectionTemplate.ProductHero.png','Thumbnail\SectionTemplate.ProductHero.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Quote','引用','Thumbnail\SectionTemplate.Quote.png','Thumbnail\SectionTemplate.Quote.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.RightThreeIcon','右三图标','Thumbnail\SectionTemplate.RightThreeIcon.png','Thumbnail\SectionTemplate.RightThreeIcon.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.SalePrice','销售报价','Thumbnail\SectionTemplate.SalePrice.png','Thumbnail\SectionTemplate.SalePrice.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ShortcutNav','快捷导航','Thumbnail\SectionTemplate.ShortcutNav.png','Thumbnail\SectionTemplate.ShortcutNav.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Tab','标签页','Thumbnail\SectionTemplate.Tab.png','Thumbnail\SectionTemplate.Tab.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Thumbnail','缩略图','Thumbnail\SectionTemplate.Thumbnail.png','Thumbnail\SectionTemplate.Thumbnail.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('105','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('107','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('14','2b3eb61307d24c50a6b3aaa75db3810e','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('17','00f62c5acfe840e0bee3ca2979f0f025','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('20','f6f11ba2fec844de883acf0a1fe3eb89','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('23','481574ebc98b4cdf9a07e3f20c1ab78d','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('33','55b73e54fd054de4847960bdac350c6d','建筑业',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('34','55b73e54fd054de4847960bdac350c6d','能源化工',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('47','1fb967867e3b440e86336bc5a51e8719','建筑业',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('48','1fb967867e3b440e86336bc5a51e8719','能源化工',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('49','1fb967867e3b440e86336bc5a51e8719','汽车业',NULL,NULL);
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('106','f41174cfa4d247f4974c47f4d2b000fd','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('108','f41174cfa4d247f4974c47f4d2b000fd','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('15','2b3eb61307d24c50a6b3aaa75db3810e','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('165','80f365c7991a49a0b04aa11006018814','<p>用户名,密码:admin</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('18','00f62c5acfe840e0bee3ca2979f0f025','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('21','f6f11ba2fec844de883acf0a1fe3eb89','<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('24','481574ebc98b4cdf9a07e3f20c1ab78d','<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('26','b568ff7f4a894870adaf9afadf787bf9','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('28','b568ff7f4a894870adaf9afadf787bf9','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('30','55b73e54fd054de4847960bdac350c6d','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('32','55b73e54fd054de4847960bdac350c6d','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('36','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('38','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('40','ed837392097f4e60b812bc57111dd762','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('42','1fb967867e3b440e86336bc5a51e8719','<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('44','1fb967867e3b440e86336bc5a51e8719','<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('46','1fb967867e3b440e86336bc5a51e8719','<p><span>我国汽车工业的现状喜忧参半，</span><span>展望我国汽车工业的未来风险与机遇并存。</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','<p>用户名,密码:admin</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','<p>前端用户注册，用户管理</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','<p>前端用户注册，用户管理</p>');
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
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','许可协议','http://www.zkea.net/licenses');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','登录后台','/admin');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('1','80f365c7991a49a0b04aa11006018814','登录后台','/admin');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('163','604b2461f7c545e28dbb21fb15def5c7','商业授权','http://www.zkea.net/zkeacms/price');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('164','604b2461f7c545e28dbb21fb15def5c7','许可协议','http://www.zkea.net/licenses');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','个人中心','/Account');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','商业授权','http://www.zkea.net/zkeacms/price');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','开发文档','http://www.zkea.net/zkeacms/document');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('3','604b2461f7c545e28dbb21fb15def5c7','GitHub','https://github.com/SeriaWei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('4','604b2461f7c545e28dbb21fb15def5c7','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','开源中国','http://git.oschina.net/seriawei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('5','604b2461f7c545e28dbb21fb15def5c7','官方网站','http://www.zkea.net');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('6','604b2461f7c545e28dbb21fb15def5c7','开源中国','http://git.oschina.net/seriawei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','GitHub','https://github.com/SeriaWei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','官方网站','http://www.zkea.net');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','开发文档','http://www.zkea.net/zkeacms/document');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','个人中心','/Account');
INSERT INTO [Roles] ([ID],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'超级管理员','超级管理员',1,NULL,NULL,NULL,'admin','ZKEASOFT','2023-03-14 21:04:43.140');
INSERT INTO [UserRoleRelation] ([ID],[RoleID],[UserID]) VALUES (5,1,'admin');
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (28,1,3,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (29,1,2,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (30,2,7,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (31,2,6,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (32,2,5,NULL);
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,1,'/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','HX-HSCR-BK/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.747');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,1,'/images/6006218/56657706-58757e00-66cb-11e9-80b8-fdc32783ff68.png','HX-HSCRS-GM/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.750');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,2,'/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,2,'/images/6006218/56657774-78a53d00-66cb-11e9-9ab9-c4b65f3cba22.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,2,'/images/6006218/56657795-85299580-66cb-11e9-9a3f-a1c5bde7b191.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,2,'/images/6006218/56657844-9a9ebf80-66cb-11e9-91ed-02001fab09c8.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,2,'颜色',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:45.550');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,2,'黑色',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:50.530');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,2,'黑古银色',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:11:03.657');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,3,'操作风格',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:07.707');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,3,'点击',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:14.870');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,3,'触觉',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:20.713');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,3,'线性',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:28.660');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'产品',NULL,0,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:32.000','admin','ZKEASOFT','2017-11-17 15:10:08.193');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'耳机',NULL,1,'headset',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:50.000','admin','ZKEASOFT','2018-08-15 15:30:59.233');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'键盘',NULL,1,'keyboard',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:07.000','admin','ZKEASOFT','2018-08-15 15:31:08.063');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Cloud Revolver 游戏耳机','/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png',NULL,2,NULL,500.0000,399.0000,NULL,NULL,NULL,'<h1>HyperX Cloud Revolver</h1>
<p>如果您热爱游戏，那么一款可为您带来极大优势的耳机就是必不可少的装备。HyperX Cloud Revolver&trade; 是一款优质耳机，工艺精湛，可充分满足高级OC或家用机游戏玩家的需求。新一代驱动器可将低音、中音和高音明确区分开来，形成精准定位的优质音效。Revolver 系列具备立体声和即插即用的 Dolby&reg; 7.1 环绕立体声模式，可提供工作室级别的音场和新一代驱动器，在 FPS 和开放式环境下表现优异。两款耳机均采用结实耐用的实心钢质框架和标志性的 HyperX 记忆海绵，带来屡获殊荣的舒适度。如果您希望拥有无与伦比的舒适度、绝佳的音质和清晰顺畅的沟通，Cloud Revolver 耳机将是您的不二之选。</p>
<h3>即插即用 Dolby&reg; 环绕立体声 7.1&nbsp;</h3>
<p>模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效，无需安装软件或任何设置，即可将音频娱乐变成电影般的体验。<br />可在 Cloud Revolver S 上使用。</p>
<h3>先进的 USB 音频控制盒与 DSP 声卡&nbsp;</h3>
<p>USB 数字处理信号声卡可在任何机器上输出一致的优质音频。卡夹式音频控制盒设计有背光按钮，因此可以即时静音、启用 Dolby 音频，还可在三种预先设置的均衡器之间切换并调整麦克风和音量水平。<br />可在 Cloud Revolver S 上使用。</p>
<h3>新一代 50 毫米驱动器&nbsp;</h3>
<p>与双耳平行的 50mm 定向驱动器精准定位，超强低音效果让声音更加清脆动听。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>
<h3>HyperX 标志性记忆海绵&nbsp;</h3>
<p>屡获殊荣的 HyperX 记忆海绵，带来无与伦比的舒适度，让您更加舒适，更加尽兴地游戏。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>','模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,'Cloud-Revolver',NULL,NULL,'HX-HSCR-BK/AS','admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 21:52:05.397');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'Alloy FPS 机械游戏键盘','/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png','/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,3,'黑色',500.0000,499.0000,NULL,NULL,NULL,'<h1>小巧便携，随时随地开始 FPS 游戏。</h1>
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
<p>让璀璨的背光彰显您的风格</p>','实心钢架,CHERRY® MX 机械按键开关,带有可拆卸的线缆',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,'Alloy-FPS',NULL,NULL,'HX-KB4RD1-US/R1','admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 21:52:25.420');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ActionBody_Manage',1,'Manage Action Body',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-14 21:04:42.770');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ActionBody_View',1,'View Action Body',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-14 21:04:42.770');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_Manage',1,'管理系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2023-03-14 21:04:42.750');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_View',1,'查看系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Manage',1,'管理文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:18:40.493','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Publish',1,'发布文章',NULL,'文章',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.820','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_View',1,'查看文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:17:59.120','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_Manage',1,'管理文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:22:24.887','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_View',1,'查看文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:19:54.500','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_Manage',1,'管理焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:45:46.190','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_View',1,'查看焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.097','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_Manage',1,'管理回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.053','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_View',1,'查看回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.050','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Config_Currency',1,'Currency',NULL,'Setting',NULL,'admin','ZKEASOFT','2021-03-06 22:16:30.727','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventAction_Manage',1,'Manage EventAction',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.767','admin','ZKEASOFT','2023-03-14 21:04:42.767');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventAction_View',1,'View EventAction',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.760','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventViewer_Manage',1,'查看错误日志',NULL,'设置',NULL,'admin','ZKEASOFT','2017-07-11 15:43:52.147','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_Manage',1,'管理表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_View',1,'查看表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.830','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Export',1,'导出表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.853','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Manage',1,'管理表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.850','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_View',1,'查看表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Language_Manage',1,'翻译',NULL,'设置',NULL,'admin','ZKEASOFT','2017-11-17 11:47:13.093','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_Manage',1,'管理布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:43:52.697','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_View',1,'查看布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.690','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('LiveChatScript_Manage',1,'设置在线客服代码',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_Manage',1,'管理媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.553','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_View',1,'查看媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.090','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_Manage',1,'管理留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.980','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_View',1,'查看留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.960','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('MessageNotification_Manage',1,'管理通知邮箱',NULL,'留言评论',NULL,'admin','ZKEASOFT','2018-08-15 15:25:42.620','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_Manage',1,'管理导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:40:38.230','admin','ZKEASOFT','2023-03-14 21:04:42.757');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_View',1,'查看导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:38:21.943','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Manage',1,'Manage Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Refund',1,'Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_View',1,'View Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderPayment',1,'View Transactions',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderRefund',1,'View Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_Manage',1,'管理页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 13:41:08.463','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_View',1,'查看页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.683','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Payment_Config_Manage',1,'Payment Setting',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('PendingTask_Manage',1,'Manage Pending Task',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-14 21:04:42.770');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('PendingTask_View',1,'View Pending Task',NULL,'EventAction',NULL,'admin','ZKEASOFT','2023-03-14 21:04:42.770','admin','ZKEASOFT','2023-03-14 21:04:42.770');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Plugin_View',1,'插件',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.727','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Manage',1,'Manage Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Publish',1,'Publish Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_View',1,'View Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.657','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_Manage',1,'Manage Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_View',1,'View Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_Manage',1,'Manage Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_View',1,'View Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('RobotsSetting',1,'Robots.txt',NULL,'设置',NULL,'admin','ZKEASOFT','2018-08-12 22:51:30.340','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_Manage',1,'管理角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_View',1,'查看角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.660','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SMTPSetting',1,'邮箱设置',NULL,'设置',NULL,'admin','ZKEASOFT','2018-06-12 19:13:49.497','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('StatisticsScript_Manage',1,'设置访客统计代码',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Template_Manage',1,'管理模板',NULL,'页面布局',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.307','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Template_View',1,'管理模板',NULL,'页面布局',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.303','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('TemplateImporter_Import',1,'Import Html Template',NULL,'Setting',NULL,'admin','ZKEASOFT','2020-03-14 11:41:54.510','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_Manage',1,'管理主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:42:48.600','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_View',1,'查看主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.083','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_Manage',1,'管理URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.170','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_View',1,'查看URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.120','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_Manage',1,'管理用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_View',1,'查看用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2023-03-14 21:04:42.760');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1061019b1bcd4bf3aeb3df647c74c309','#','~/product','产品',1,NULL,NULL,1,3,'admin','ZKEASOFT','2016-03-10 23:33:03.653','admin','ZKEASOFT','2017-10-15 18:05:28.830');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6beb1a2a54b947179ec20dd331e375a2','#','~/index','首页',0,NULL,NULL,1,1,'admin',NULL,'2015-09-01 09:55:20.483','admin','ZKEASOFT','2017-10-15 18:05:28.820');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('7b5bb24dea6d47618ed027190b4e5d94','#','~/contact','联系我们',0,NULL,NULL,1,5,'admin','ZKEASOFT','2017-03-19 21:06:21.360','admin','ZKEASOFT','2017-10-15 18:05:28.833');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d122a50356bf46c8a8c8349612145e24','#','~/questionnaire','问卷调查',0,NULL,NULL,1,4,'admin','ZKEASOFT','2017-10-15 18:05:25.947','admin','ZKEASOFT','2017-10-15 18:05:28.837');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e4658e8af8434a05b773b666c6c67cd5','#','~/article','新闻',1,NULL,NULL,1,2,'admin','ZKEASOFT','2016-03-10 23:32:53.000','admin','ZKEASOFT','2017-10-15 18:05:28.827');
INSERT INTO [Forms] ([ID],[Title],[FieldsData],[NotificationReceiver],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('5ed56d90ac154e73befa6fbc981ae3ae','问卷调查','[{"ID":"f05da60a6e3b448fadbf7c5c040a7d5c","Name":"Label","DisplayName":"一个简单的问卷调查","Value":null,"Description":"欢迎您使用ZKEACMS，这是一个自定义表单","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"41481e6eefa048feae380460b0cd5661","Name":"SingleLine","DisplayName":"姓名","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"bfd1418684a64890a7099f764baa24b3","Name":"Number","DisplayName":"电话","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"7e635c8fdd124b6b94f037d3bf112bc0","Name":"Email","DisplayName":"邮箱地址","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"4d61bb5f733c47778975cc6cfbc84123","Name":"SingleLine","DisplayName":"QQ","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"b85aeb9beaf64f509726f16ba582ec3c","Name":"SingleLine","DisplayName":"微信","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"a2aea72c496e4a458265f7ceadb3653a","Name":"Address","DisplayName":"省份地址","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"0932ca1f1f7f4af098d51e4b1ac18b94","Name":"SingleLine","DisplayName":"详细地址","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"572c61930769464d97f3d31771ecf65e","Name":"Radio","DisplayName":"您从哪里了解到ZKEACMS","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"搜索引擎","Value":"70a915caf7a84e9086d5dbdf26ed3053"},{"DisplayText":"博客园","Value":"419a7d1d91974282af5c26688fbe0e8c"},{"DisplayText":"朋友介绍","Value":"227f6d2f6b39479aaf2d5b79dbefdc5c"},{"DisplayText":"其它论坛","Value":"ef50fb3bccf74d6487320e53781fb1ec"}],"AdditionalSettings":null},{"ID":"845830a5c8be4b81866a8cef83049899","Name":"Checkbox","DisplayName":"您一般使用ZKEACMS做什么","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"网站","Value":"5f0fbb9faa0343e0958a896fe3cead4f"},{"DisplayText":"博客","Value":"65902e51d35142019c4aab8badff9e35"},{"DisplayText":"其它","Value":"944343b3ed904b94a9db6950dbdcccf3"}],"AdditionalSettings":null},{"ID":"2fe6e4baf01e4cb897986991c920df56","Name":"Dropdown","DisplayName":"您觉得ZKEACMS怎么样","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"很不错","Value":"fc3929826e364318b7a3436d991fb097"},{"DisplayText":"还可以","Value":"619e09c2864b41ae81f4f90e7cab92ba"},{"DisplayText":"有待提高","Value":"fd1279a07150490f9a1f69c85298e22c"},{"DisplayText":"不怎么样","Value":"ef19983754504a9482232dd6be01f34d"}],"AdditionalSettings":null},{"ID":"2868de2d8e9b4d269da891342e6dc95b","Name":"Paragraph","DisplayName":"您的意见或建议","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null}]',NULL,NULL,'',NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:07:58.013');
INSERT INTO [EA_EventAction] ([ID],[Event],[Actions],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'ZKEACMS.Message.Events.OnMessageSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 收到新留言
    to: webmaster@zkea.net
    bodyContentId: 1','发送新留言邮件通知',NULL,1,'admin','ZKEASOFT','2023-03-03 21:53:14.000','admin','ZKEASOFT','2023-03-12 21:12:14.787');
INSERT INTO [EA_EventAction] ([ID],[Event],[Actions],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'ZKEACMS.Events.OnResetPassword','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 重置密码
    to: {{this.Model.Email}}
    bodyContentId: 2','发送重置密码发送邮件通知',NULL,1,'admin','ZKEASOFT','2023-03-11 21:33:51.000','admin','ZKEASOFT','2023-03-16 21:59:47.367');
INSERT INTO [EA_EventAction] ([ID],[Event],[Actions],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'ZKEACMS.Message.Events.OnCommentsSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 有新评论
    to: webmaster@zkea.net
    bodyContentId: 3','发送新评论邮件通知',NULL,1,'admin','ZKEASOFT','2023-03-11 21:44:02.000','admin','ZKEASOFT','2023-03-16 22:05:12.060');
INSERT INTO [EA_EventAction] ([ID],[Event],[Actions],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'ZKEACMS.FormGenerator.Events.OnFormDataSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 收到新的表单提交
    to: {{this.Model.Form.NotificationReceiver}}
    bodyContentId: 4','发送自定义表单邮件通知',NULL,1,'admin','ZKEASOFT','2023-03-11 22:07:27.000','admin','ZKEASOFT','2023-03-16 22:06:44.227');
INSERT INTO [EA_ActionBody] ([ID],[Body],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'<div>
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
</div>','收到留言板留言模板',NULL,1,'admin','ZKEASOFT','2023-03-05 18:49:06.000','admin','ZKEASOFT','2023-03-16 22:04:16.673');
INSERT INTO [EA_ActionBody] ([ID],[Body],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'<div>
    <h3>
        重置密码
    </h3>
    <p>
        点击下方链接，或者复制链接到浏览器打开
    </p>
    <a href="{{this.Model.Link}}" target="_blank">{{this.Model.Link}}</a>
</div>','重置密码邮件模板',NULL,1,'admin','ZKEASOFT','2023-03-11 21:32:20.000','admin','ZKEASOFT','2023-03-16 22:03:47.810');
INSERT INTO [EA_ActionBody] ([ID],[Body],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'<div>
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
</div>','收到新评论邮件模板',NULL,1,'admin','ZKEASOFT','2023-03-11 21:44:54.000','admin','ZKEASOFT','2023-03-16 22:03:57.627');
INSERT INTO [EA_ActionBody] ([ID],[Body],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'<div>
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
</div>','自定义表单邮件模板',NULL,1,'admin','ZKEASOFT','2023-03-11 22:06:21.000','admin','ZKEASOFT','2023-03-16 22:03:40.577');
INSERT INTO [DBVersion] ([ID],[Major],[Minor],[Revision],[Build]) VALUES (1,3,6,2,0);
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
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Alipay.AopSdk.AspnetCore.AlipayOptions','{"AppId":null,"Uid":null,"Gatewayurl":null,"PrivateKey":null,"AlipayPublicKey":null,"SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}',NULL,NULL,NULL,NULL,NULL,'2019-04-24 19:55:03.627',NULL,NULL,'2019-04-24 19:55:03.627');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Currency.CurrencyOption','{"CurrencyID":4,"Name":"Chinese Renmenbi","Code":"CNY","Symbol":"￥"}',NULL,NULL,NULL,'admin','ZKEASOFT','2021-03-06 22:16:39.503','admin','ZKEASOFT','2021-03-06 22:16:43.467');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.GlobalScripts.Models.LiveChatScript','{"Location":0,"Script":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:35.293',NULL,NULL,'2019-04-07 16:38:35.293');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.GlobalScripts.Models.StatisticsScript','{"Location":0,"Script":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:36.007',NULL,NULL,'2019-04-07 16:38:36.007');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Message.Models.MessageNotificationConfig','{"MessageNotifyEmails":null,"CommentNotifyEmails":null}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-08-15 15:25:53.917','admin','ZKEASOFT','2018-08-15 15:25:53.917');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Shop.AliPayConfigOptions','{"AppId":"2016082000296332","Uid":"2088102172250345","Gatewayurl":"https://openapi.alipaydev.com/gateway.do","PrivateKey":"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP","AlipayPublicKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB","SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-11 17:02:14.577','admin','ZKEASOFT','2018-04-11 17:02:14.577');
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
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('00f62c5acfe840e0bee3ca2979f0f025','图片右',NULL,9,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:13:55.010','admin','ZKEASOFT','2016-06-29 14:13:22.937',NULL,NULL,1,'~/images/template%20(6).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('01b59004dd1e4f68afa98c9c80d86f4c','表单',NULL,1,NULL,'be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 17:59:05.133','admin','ZKEASOFT','2017-10-15 18:20:39.980',NULL,NULL,0,NULL,0,'{"FormID":"5ed56d90ac154e73befa6fbc981ae3ae","CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('02dd343bb4f24322bcf3daf8ada7565d','留言箱',NULL,2,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:31.030','admin','ZKEASOFT','2017-03-19 21:05:31.030',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{"ID":"02dd343bb4f24322bcf3daf8ada7565d","WidgetName":"留言箱","Position":2,"LayoutID":null,"PageID":"534e07f396b14b7584a833d270356cb7","ZoneID":"d5f02570e4814439acc86a1874cb8f07","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.MessageBox","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageBoxWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageBoxWidget","FormView":null,"StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendData":null,"ExtendFields":[],"Title":null,"Description":null,"Status":null,"CreateBy":"admin","CreatebyName":"ZKEASOFT","CreateDate":"2017-03-19T21:04:44.953","LastUpdateBy":"admin","LastUpdateByName":"ZKEASOFT","LastUpdateDate":"2017-03-19T21:04:44.953","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('062018a8e5cf48b4a0d90296e7f4e965','分隔符',NULL,2,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-11 10:01:58.757','admin','ZKEASOFT','2016-03-11 10:01:58.757',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('09617f6142934daaadee6cfb9df6d66f','段落',NULL,4,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:53:07.263','admin','ZKEASOFT','2016-03-24 10:49:44.100',NULL,NULL,1,'~/images/template%20(2).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('0f66ab8ff0df44e2b5e57fd8d8c5d8ff','文字三列',NULL,8,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:23:51.277','admin','ZKEASOFT','2016-06-29 14:12:54.387',NULL,NULL,1,'~/images/template (15).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('1433264e95f545ab97e6a481fa3747ea','评论箱',NULL,2,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:36.467','admin','ZKEASOFT','2017-12-03 17:11:36.467',NULL,NULL,0,NULL,0,'{"CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('155c6511dd9c4cc1b3ccb27d5ad4b8ab','表单',NULL,1,NULL,'9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 18:20:42.213','admin','ZKEASOFT','2017-10-15 18:20:42.213',NULL,NULL,0,NULL,0,'{"FormID":"5ed56d90ac154e73befa6fbc981ae3ae","CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('19350341920b4827bf2a4e458ad24a58','焦点图',NULL,1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,'','admin','ZKEASOFT','2016-03-27 15:14:34.677','admin','ZKEASOFT','2020-03-21 14:01:56.237',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('1fb967867e3b440e86336bc5a51e8719','图例三（圆）',NULL,17,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:40:26.767','admin','ZKEASOFT','2016-06-29 14:19:30.777',NULL,NULL,1,'~/images/template%20(12).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('2b3eb61307d24c50a6b3aaa75db3810e','图片左',NULL,11,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:06:17.637','admin','ZKEASOFT','2016-06-29 14:14:54.330',NULL,NULL,1,'~/images/template%20(5).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('2b510992f0174e668ca53116434e065c','图片',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:15:37.333','admin','ZKEASOFT','2017-10-15 18:00:21.587',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3017aef0eabc451b81daebe6bae68857','图片',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.950','admin','ZKEASOFT','2017-10-15 18:11:44.950',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('34567e55bacd40dbaf9794d5032dd26e','留言板',NULL,4,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.977','admin','ZKEASOFT','2017-03-19 21:05:30.977',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{"FormView":null,"ExtendData":null,"Description":null,"Status":null,"CreateBy":"admin","CreatebyName":"ZKEASOFT","CreateDate":"2017-03-19T21:04:56.38","LastUpdateBy":"admin","LastUpdateByName":"ZKEASOFT","LastUpdateDate":"2017-03-19T21:04:56.38","ActionType":1,"ID":"34567e55bacd40dbaf9794d5032dd26e","WidgetName":"留言板","Position":4,"LayoutID":null,"PageID":"534e07f396b14b7584a833d270356cb7","ZoneID":"d5f02570e4814439acc86a1874cb8f07","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.Message","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageWidget","StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendFields":[],"Title":null}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3466e616139645d2b1e1d9935d231922','产品类别','产品类别',1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.877','admin','ZKEASOFT','2016-05-15 20:56:40.877',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('357a58069e8047a289e10b920061d57d','分隔符',NULL,3,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.900','admin','ZKEASOFT','2017-03-19 21:05:30.900',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3aa8b53e7ad143ff818855a7abcb3fdd','文章内容',NULL,1,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.290','admin','ZKEASOFT','2017-12-03 17:11:47.290',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3b8beb945c9f4c9390a6122d8b4788d5','分隔符',NULL,2,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.347','admin','ZKEASOFT','2017-10-15 18:11:45.347',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3e3783f4b7ca421488f2bf08d32fe2f0','分隔符',NULL,2,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.850','admin','ZKEASOFT','2016-05-15 20:56:40.850',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('416c5402962b41548c83fabaa5492b42','文章列表',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:20:31.667','admin','ZKEASOFT','2016-03-11 11:51:20.640',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('41e075ab1b89453388494a539eec55b9','焦点图',NULL,1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.633','admin','ZKEASOFT','2017-10-15 18:11:36.633',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('43bb869688ee4752a3127dd19ccc6caa','图片',NULL,1,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:20.407','admin','ZKEASOFT','2017-03-19 21:04:29.773',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('481574ebc98b4cdf9a07e3f20c1ab78d','图片左（圆）',NULL,12,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:48.870','admin','ZKEASOFT','2016-06-29 14:15:23.317',NULL,NULL,1,'~/images/template%20(7).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('4d67b2d10f4a425586e3b1115f7f7072','分隔符',NULL,3,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:15.683','admin','ZKEASOFT','2017-03-19 21:05:15.683',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('50f810582d28440eb3bdff9ee5b1ef24','图片左（平分）',NULL,13,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:36:23.247','admin','ZKEASOFT','2016-06-29 14:16:05.733',NULL,NULL,1,'~/images/template (17).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('55b73e54fd054de4847960bdac350c6d','图例二（圆）',NULL,15,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:33:40.533','admin','ZKEASOFT','2016-06-29 14:17:49.737',NULL,NULL,1,'~/images/template%20(10).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('56991d0ff59d4c1db27aff3a50fcb382','页头',NULL,2,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:51:35.577','admin','ZKEASOFT','2016-06-29 14:10:19.703',NULL,NULL,1,'~/images/template%20(1).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('604b2461f7c545e28dbb21fb15def5c7','相关链接','相关链接',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:13:42.000','admin','ZKEASOFT','2017-10-15 17:18:36.063',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('62ca3b6b6ea644b4a64501021b02f13b','分隔符',NULL,2,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:16:08.137','admin','ZKEASOFT','2017-10-15 18:00:21.613',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('6bb06e46293c46f084e83751a0832d36','产品列表',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.867','admin','ZKEASOFT','2016-05-15 20:56:40.867',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('6ee67036e78b4b498d932ab2d76757fb','导航',NULL,1,NULL,NULL,'ZONE-0','Widget.Navigation','ZKEACMS','ZKEACMS.Common.Service.NavigationWidgetService','ZKEACMS.Common.Models.NavigationWidget',NULL,'full','admin','ZKEASOFT','2018-05-21 23:44:21.393','admin','ZKEASOFT','2020-03-21 13:44:19.637',NULL,NULL,0,NULL,0,NULL,1);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7679a5060035444d85fe49dc3c02cada','图片',NULL,1,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.853','admin','ZKEASOFT','2017-03-19 21:05:30.853',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('787d9ad849dd40d0905f22ae072d8507','产品内容',NULL,1,NULL,'a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:19.903','admin','ZKEASOFT','2016-03-10 23:20:19.903',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7e7a1d5b8d644333a7b3341509fc960f','注册用户','注册用户',2,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.773','admin','ZKEASOFT','2017-10-15 18:11:36.773',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7f77f09c3fcd4d498a4aa3b1c9508d7d','注册用户','注册用户',2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 17:03:14.000','admin','ZKEASOFT','2017-10-15 17:04:42.893',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('80f365c7991a49a0b04aa11006018814','网站管理','后台管理',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:09:22.000','admin','ZKEASOFT','2017-10-15 17:03:50.207',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('88ab49212dee47bba878a52bec86f501','网站管理','后台管理',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.793','admin','ZKEASOFT','2017-10-15 18:11:36.793',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8c5b69f614b641c0a5f7a8e318de8df3','ZKEACMS 简介',NULL,2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin',NULL,'2015-09-01 09:54:38.000','admin','ZKEASOFT','2020-03-21 13:47:22.757',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8cc061c2e2514ef9b85bbecdec3f84ab','分隔符',NULL,5,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:55:12.377','admin','ZKEASOFT','2016-03-09 13:55:12.377',NULL,NULL,1,'~/images/template%20(3).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8df64186d2fd4d63a9f9bb3b6e34cd2a','文章类别','文章类别',1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:21:20.527','admin','ZKEASOFT','2016-05-15 21:04:35.783',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8ea46d2923ad4d62958c565b19bb172d','图片',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.857','admin','ZKEASOFT','2016-05-15 20:56:40.857',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('942b4ac54f3e4dfca006172bf4122da4','留言板',NULL,4,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:56.380','admin','ZKEASOFT','2017-03-19 21:04:56.380',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{"FormView":null,"ExtendData":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1,"ID":"942b4ac54f3e4dfca006172bf4122da4","WidgetName":"留言板","Position":1,"LayoutID":null,"PageID":"1c93b61690ce49d7af8e1ea45ac58eb9","ZoneID":"3ca302874c164b7b9691ca948300417b","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.Message","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageWidget","StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendFields":null,"Title":null}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('94624262dc00460cbbc1e0f51711e712','产品内容',NULL,1,NULL,'4b889b430aa44517bbad38a57c745cc5','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.783','admin','ZKEASOFT','2016-03-10 23:24:38.783',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('a64ad266b3bd4e0eb4e2df09b550fe55','留言箱',NULL,2,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:44.953','admin','ZKEASOFT','2017-03-19 21:04:44.953',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{"ID":"a64ad266b3bd4e0eb4e2df09b550fe55","WidgetName":"留言箱","Position":1,"LayoutID":null,"PageID":"1c93b61690ce49d7af8e1ea45ac58eb9","ZoneID":"4cf5d05f2b954a7e8904713ad6781a61","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.MessageBox","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageBoxWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageBoxWidget","FormView":null,"StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendData":null,"ExtendFields":null,"Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('a686b84212f94b3b8315093b2e8b883d','版权申明',NULL,NULL,NULL,NULL,'ZONE-X','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,'footer','admin','ZKEASOFT','2018-05-21 23:44:55.063','admin','ZKEASOFT','2018-05-21 23:44:55.063',NULL,NULL,0,NULL,0,NULL,2);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('b568ff7f4a894870adaf9afadf787bf9','图例二',NULL,14,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:20:29.887','admin','ZKEASOFT','2016-06-29 14:16:58.140',NULL,NULL,1,'~/images/template%20(9).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('bb7dab4f077745ef8b5b425eaabb423c','巨幕',NULL,1,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:28:47.827','admin','ZKEASOFT','2016-06-29 14:09:41.597',NULL,NULL,1,'~/images/template (16).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('c71d1f1c48944d6a9e232b6813261e04','评论箱',NULL,2,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.253','admin','ZKEASOFT','2017-12-03 17:11:47.253',NULL,NULL,0,NULL,0,'{"CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('ca9f8809636d448cbd4f3beb418465b3','文章列表',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.317','admin','ZKEASOFT','2017-10-15 18:11:45.317',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('cd21a7bf68b44f6e8d178b153288a26e','ZKEACMS 简介',NULL,3,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.807','admin','ZKEASOFT','2017-10-15 18:11:36.807',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('de8d94fd51cb4e73b00518dbb2f134d3','文章类别','文章类别',1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.367','admin','ZKEASOFT','2017-10-15 18:11:45.367',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e0783dbbcc564322a1f2e3ca2833dbd4','相关链接','相关链接',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.733','admin','ZKEASOFT','2017-10-15 18:11:36.733',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e5ba6adb117440959757b98e4289430f','图片',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:31:24.887','admin','ZKEASOFT','2016-03-27 15:16:41.790',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e88916cc41b3465b9ae954bafac5f796','产品列表',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:21.907','admin','ZKEASOFT','2016-03-10 23:31:03.770',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e8fd1019bab045e5927ec30abaaa1aba','文章内容',NULL,1,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:12.857','admin','ZKEASOFT','2016-03-10 21:24:12.857',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('eb7657f5bcbd4e98977a42950936e7ac','产品类别','产品类别',1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:28:35.323','admin','ZKEASOFT','2016-05-15 20:56:37.497',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('ed837392097f4e60b812bc57111dd762','图例三',NULL,16,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:36:24.463','admin','ZKEASOFT','2016-06-29 14:18:22.983',NULL,NULL,1,'~/images/template%20(11).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f41174cfa4d247f4974c47f4d2b000fd','文字二列',NULL,7,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:21:37.693','admin','ZKEASOFT','2016-06-29 14:11:06.067',NULL,NULL,1,'~/images/template (14).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f6de0d62d3974ee2bf2ded3fbbc82c2b','间距',NULL,6,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 14:00:46.400','admin','ZKEASOFT','2016-03-09 14:08:21.673',NULL,NULL,1,'~/images/template%20(4).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f6f11ba2fec844de883acf0a1fe3eb89','图片右（圆）',NULL,10,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:44.227','admin','ZKEASOFT','2016-06-29 14:13:44.223',NULL,NULL,1,'~/images/template%20(8).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('fee7f4d7d7e641b0bfa74491a543d245','图片',NULL,3,NULL,NULL,NULL,'Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:14:46.133','admin','ZKEASOFT','2016-03-09 21:14:46.133',NULL,NULL,1,'~/images/template (13).png',1,NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('00f62c5acfe840e0bee3ca2979f0f025',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('0f66ab8ff0df44e2b5e57fd8d8c5d8ff',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('1fb967867e3b440e86336bc5a51e8719',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('2b3eb61307d24c50a6b3aaa75db3810e',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('481574ebc98b4cdf9a07e3f20c1ab78d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('55b73e54fd054de4847960bdac350c6d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('604b2461f7c545e28dbb21fb15def5c7','相关链接',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('7e7a1d5b8d644333a7b3341509fc960f',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('7f77f09c3fcd4d498a4aa3b1c9508d7d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('80f365c7991a49a0b04aa11006018814','管理',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('88ab49212dee47bba878a52bec86f501','管理',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('b568ff7f4a894870adaf9afadf787bf9',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('e0783dbbcc564322a1f2e3ca2833dbd4','相关链接',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('ed837392097f4e60b812bc57111dd762',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('f41174cfa4d247f4974c47f4d2b000fd',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('f6f11ba2fec844de883acf0a1fe3eb89',NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('0015be62210742c083c3a9dad4b72fb5','组1','e0783dbbcc564322a1f2e3ca2833dbd4','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.740','admin','ZKEASOFT','2017-10-15 18:11:36.740',NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('1','组1','80f365c7991a49a0b04aa11006018814','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('10','右','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('11','左','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('12','右','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('13','左','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('14','中','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('15','右','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('16','左','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('17','中','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('18','右','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('2','组1','604b2461f7c545e28dbb21fb15def5c7','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('40','左','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('41','右','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('42','左','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('43','右','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('44','中','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('5','G1','2b3eb61307d24c50a6b3aaa75db3810e','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('50082fd30e01404fbb4fe6101353b1d5','组1','88ab49212dee47bba878a52bec86f501','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.800','admin','ZKEASOFT','2017-10-15 18:11:36.800',NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('6','G1','00f62c5acfe840e0bee3ca2979f0f025','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('7','G1','f6f11ba2fec844de883acf0a1fe3eb89','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('8','G1','481574ebc98b4cdf9a07e3f20c1ab78d','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('80cb176412cf457a81ae7a1f9fa33ef6','组1','7f77f09c3fcd4d498a4aa3b1c9508d7d','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 17:03:17.247','admin','ZKEASOFT','2017-10-15 17:03:17.247','');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('9','左','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('9ce2c15af93c4fd782e17a1e7e35963f','组1','7e7a1d5b8d644333a7b3341509fc960f','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 18:11:36.780','admin','ZKEASOFT','2017-10-15 18:11:36.780','');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,7,'admin','ZKEASOFT','2017-10-15 18:11:36.767','admin','ZKEASOFT','2017-10-15 18:11:36.767');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.800','admin','ZKEASOFT','2017-10-15 18:11:36.800');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1','80f365c7991a49a0b04aa11006018814','1',1,2,'admin',NULL,'2015-09-01 10:09:51.457','admin',NULL,'2015-09-01 10:12:05.037');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('105','f41174cfa4d247f4974c47f4d2b000fd','40',4,1,'admin','ZKEASOFT','2016-03-09 21:22:05.273','admin','ZKEASOFT','2016-03-09 21:22:05.273');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('106','f41174cfa4d247f4974c47f4d2b000fd','40',3,2,'admin','ZKEASOFT','2016-03-09 21:22:14.723','admin','ZKEASOFT','2016-03-09 21:22:14.723');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('107','f41174cfa4d247f4974c47f4d2b000fd','41',4,1,'admin','ZKEASOFT','2016-03-09 21:22:39.543','admin','ZKEASOFT','2016-03-09 21:22:39.543');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('108','f41174cfa4d247f4974c47f4d2b000fd','41',3,2,'admin','ZKEASOFT','2016-03-09 21:22:46.500','admin','ZKEASOFT','2016-03-09 21:22:46.500');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.287','admin','ZKEASOFT','2016-03-09 21:23:51.287');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.290','admin','ZKEASOFT','2016-03-09 21:23:51.290');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',4,1,'admin','ZKEASOFT','2016-03-09 21:24:36.340','admin','ZKEASOFT','2016-03-09 21:24:36.340');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',3,2,'admin','ZKEASOFT','2016-03-09 21:24:43.533','admin','ZKEASOFT','2016-03-09 21:24:43.533');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,5,'admin','ZKEASOFT','2017-10-15 18:11:36.760','admin','ZKEASOFT','2017-10-15 18:11:36.760');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('13','2b3eb61307d24c50a6b3aaa75db3810e','5',2,1,'admin','ZKEASOFT','2016-03-09 14:07:06.270','admin','ZKEASOFT','2016-03-09 14:07:06.270');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('14','2b3eb61307d24c50a6b3aaa75db3810e','5',4,2,'admin','ZKEASOFT','2016-03-09 14:07:14.397','admin','ZKEASOFT','2016-03-09 14:07:14.397');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('15','2b3eb61307d24c50a6b3aaa75db3810e','5',3,3,'admin','ZKEASOFT','2016-03-09 14:07:22.330','admin','ZKEASOFT','2016-03-09 14:07:22.330');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('16','00f62c5acfe840e0bee3ca2979f0f025','6',2,1,'admin','ZKEASOFT','2016-03-09 14:14:25.737','admin','ZKEASOFT','2016-03-09 14:14:25.737');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('163','604b2461f7c545e28dbb21fb15def5c7','2',1,4,'admin','ZKEASOFT','2017-03-19 20:58:41.647','admin','ZKEASOFT','2017-03-19 20:58:41.647');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('164','604b2461f7c545e28dbb21fb15def5c7','2',1,7,'admin','ZKEASOFT','2017-03-19 20:59:12.037','admin','ZKEASOFT','2017-03-19 20:59:12.037');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('165','80f365c7991a49a0b04aa11006018814','1',3,3,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:02:22.540');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('17','00f62c5acfe840e0bee3ca2979f0f025','6',4,2,'admin','ZKEASOFT','2016-03-09 14:14:33.683','admin','ZKEASOFT','2016-03-09 14:14:33.683');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('18','00f62c5acfe840e0bee3ca2979f0f025','6',3,3,'admin','ZKEASOFT','2016-03-09 14:14:50.897','admin','ZKEASOFT','2016-03-09 14:14:50.897');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('19','f6f11ba2fec844de883acf0a1fe3eb89','7',2,1,'admin','ZKEASOFT','2016-03-09 14:15:44.233','admin','ZKEASOFT','2016-03-09 14:15:44.233');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',1,1,'admin','ZKEASOFT','2017-10-15 17:03:36.227','admin','ZKEASOFT','2017-10-15 17:03:36.227');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('20','f6f11ba2fec844de883acf0a1fe3eb89','7',4,2,'admin','ZKEASOFT','2016-03-09 14:15:44.237','admin','ZKEASOFT','2016-03-09 14:15:44.237');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('21','f6f11ba2fec844de883acf0a1fe3eb89','7',3,3,'admin','ZKEASOFT','2016-03-09 14:15:44.240','admin','ZKEASOFT','2016-03-09 14:15:44.240');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('22','481574ebc98b4cdf9a07e3f20c1ab78d','8',2,1,'admin','ZKEASOFT','2016-03-09 14:15:48.877','admin','ZKEASOFT','2016-03-09 14:15:48.877');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,4,'admin','ZKEASOFT','2017-10-15 18:11:36.757','admin','ZKEASOFT','2017-10-15 18:11:36.757');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('23','481574ebc98b4cdf9a07e3f20c1ab78d','8',4,2,'admin','ZKEASOFT','2016-03-09 14:15:48.877','admin','ZKEASOFT','2016-03-09 14:15:48.877');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('24','481574ebc98b4cdf9a07e3f20c1ab78d','8',3,3,'admin','ZKEASOFT','2016-03-09 14:15:48.880','admin','ZKEASOFT','2016-03-09 14:15:48.880');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('25','b568ff7f4a894870adaf9afadf787bf9','9',2,1,'admin','ZKEASOFT','2016-03-09 14:21:44.433','admin','ZKEASOFT','2016-03-09 14:21:44.433');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('26','b568ff7f4a894870adaf9afadf787bf9','9',3,2,'admin','ZKEASOFT','2016-03-09 14:21:53.837','admin','ZKEASOFT','2016-03-09 14:21:53.837');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('27','b568ff7f4a894870adaf9afadf787bf9','10',2,1,'admin','ZKEASOFT','2016-03-09 14:22:35.620','admin','ZKEASOFT','2016-03-09 14:22:35.620');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('28','b568ff7f4a894870adaf9afadf787bf9','10',3,2,'admin','ZKEASOFT','2016-03-09 14:24:34.193','admin','ZKEASOFT','2016-03-09 14:24:34.193');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('29','55b73e54fd054de4847960bdac350c6d','11',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','2',1,6,'admin','ZKEASOFT','2017-10-15 17:18:30.710','admin','ZKEASOFT','2017-10-15 17:18:30.710');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('3','604b2461f7c545e28dbb21fb15def5c7','2',1,2,'admin',NULL,'2015-09-01 10:15:07.310','admin',NULL,'2015-09-01 10:15:07.310');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('30','55b73e54fd054de4847960bdac350c6d','11',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('31','55b73e54fd054de4847960bdac350c6d','12',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.587','admin','ZKEASOFT','2016-03-09 14:33:40.587');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('32','55b73e54fd054de4847960bdac350c6d','12',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.587','admin','ZKEASOFT','2016-03-09 14:33:40.587');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('33','55b73e54fd054de4847960bdac350c6d','11',4,2,'admin','ZKEASOFT','2016-03-09 14:34:38.457','admin','ZKEASOFT','2016-03-09 14:34:38.457');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('34','55b73e54fd054de4847960bdac350c6d','12',4,2,'admin','ZKEASOFT','2016-03-09 14:34:51.847','admin','ZKEASOFT','2016-03-09 14:34:51.847');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('35','ed837392097f4e60b812bc57111dd762','13',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('36','ed837392097f4e60b812bc57111dd762','13',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('37','ed837392097f4e60b812bc57111dd762','14',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.490','admin','ZKEASOFT','2016-03-09 14:36:24.490');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('38','ed837392097f4e60b812bc57111dd762','14',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.493','admin','ZKEASOFT','2016-03-09 14:36:24.493');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('39','ed837392097f4e60b812bc57111dd762','15',2,1,'admin','ZKEASOFT','2016-03-09 14:38:16.067','admin','ZKEASOFT','2016-03-09 14:38:16.067');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('4','604b2461f7c545e28dbb21fb15def5c7','2',1,5,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:18:02.197');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('40','ed837392097f4e60b812bc57111dd762','15',3,2,'admin','ZKEASOFT','2016-03-09 14:38:27.630','admin','ZKEASOFT','2016-03-09 14:38:27.630');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('41','1fb967867e3b440e86336bc5a51e8719','16',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.777','admin','ZKEASOFT','2016-03-09 14:40:26.777');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('42','1fb967867e3b440e86336bc5a51e8719','16',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.780','admin','ZKEASOFT','2016-03-09 14:40:26.780');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('43','1fb967867e3b440e86336bc5a51e8719','17',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('44','1fb967867e3b440e86336bc5a51e8719','17',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('45','1fb967867e3b440e86336bc5a51e8719','18',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.787','admin','ZKEASOFT','2016-03-09 14:40:26.787');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,3,'admin','ZKEASOFT','2017-10-15 18:11:36.757','admin','ZKEASOFT','2017-10-15 18:11:36.757');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('46','1fb967867e3b440e86336bc5a51e8719','18',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.787','admin','ZKEASOFT','2016-03-09 14:40:26.787');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('47','1fb967867e3b440e86336bc5a51e8719','16',4,2,'admin','ZKEASOFT','2016-03-09 14:41:13.710','admin','ZKEASOFT','2016-03-09 14:41:13.710');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('48','1fb967867e3b440e86336bc5a51e8719','17',4,2,'admin','ZKEASOFT','2016-03-09 14:42:01.137','admin','ZKEASOFT','2016-03-09 14:42:01.137');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('49','1fb967867e3b440e86336bc5a51e8719','18',4,2,'admin','ZKEASOFT','2016-03-09 14:42:20.190','admin','ZKEASOFT','2016-03-09 14:42:20.190');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('5','604b2461f7c545e28dbb21fb15def5c7','2',1,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:17:12.377');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',3,3,'admin','ZKEASOFT','2017-10-15 18:11:36.803','admin','ZKEASOFT','2017-10-15 18:11:36.803');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6','604b2461f7c545e28dbb21fb15def5c7','2',1,3,'admin','ZKEASOFT','2016-03-01 10:45:25.393','admin','ZKEASOFT','2016-03-01 10:45:25.393');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.753','admin','ZKEASOFT','2017-10-15 18:11:36.753');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.747','admin','ZKEASOFT','2017-10-15 18:11:36.747');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,6,'admin','ZKEASOFT','2017-10-15 18:11:36.763','admin','ZKEASOFT','2017-10-15 18:11:36.763');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',3,2,'admin','ZKEASOFT','2017-10-15 18:11:36.783','admin','ZKEASOFT','2017-10-15 18:11:36.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',3,2,'admin','ZKEASOFT','2017-10-15 17:04:41.027','admin','ZKEASOFT','2017-10-15 17:04:41.027');
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
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('09617f6142934daaadee6cfb9df6d66f','<p>这是文本段落，你可以在段里面加入标题，文字，图片，表格，列表，链接等等。例如：</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('357a58069e8047a289e10b920061d57d','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('3b8beb945c9f4c9390a6122d8b4788d5','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('3e3783f4b7ca421488f2bf08d32fe2f0','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('4d67b2d10f4a425586e3b1115f7f7072','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('50f810582d28440eb3bdff9ee5b1ef24','<div>
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
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('56991d0ff59d4c1db27aff3a50fcb382','<div class="page-header">
<h1>ZKEASOFT</h1>
</div>
<p>ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('62ca3b6b6ea644b4a64501021b02f13b','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('8cc061c2e2514ef9b85bbecdec3f84ab','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('a686b84212f94b3b8315093b2e8b883d','<div id="footer">ZKEACMS是开源软件，提供免费下载学习使用
<p>Copyright @&nbsp;2015 ZKEASOFT. All Rights Reserved | <a href="http://www.zkea.net/" target="_blank" rel="noopener">www.zkea.net</a></p>
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('bb7dab4f077745ef8b5b425eaabb423c','<h1 style="text-align: center; font-size: 3em;">ZKEASOFT</h1>
<p>&nbsp;</p>
<p style="text-align: center;">ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>
<p style="text-align: center;"><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p style="text-align: center;">ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p style="text-align: center;">ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p style="text-align: center;">ZKEACMS采用插件式设计，支持扩展新插件。</p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;"><a class="btn btn-info" href="#">Read More</a></p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('f6de0d62d3974ee2bf2ded3fbbc82c2b','<div class="space">&nbsp;</div>');
INSERT INTO [CMS_Theme] ([ID],[Title],[Url],[UrlDebugger],[Thumbnail],[IsActived],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Default','默认','~/themes/Default/css/Theme.min.css','~/themes/Default/css/Theme.css','~/themes/Default/thumbnail.jpg',1,1,NULL,'admin','ZKEASOFT','2016-04-04 22:17:10.790','admin','ZKEASOFT','2016-04-04 22:21:01.487');
INSERT INTO [CMS_Rule] ([RuleID],[Title],[ZoneName],[RuleExpression],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[RuleItems]) VALUES (1,'所有页面','顶部','StartsWith(ValueOf(''Url''),''/'')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:34.623','admin','ZKEASOFT','2018-05-21 23:43:34.623','[{"Condition":"and","FunctionName":"StartsWith","Property":"ValueOf(''Url'')","Value":"/","Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}]');
INSERT INTO [CMS_Rule] ([RuleID],[Title],[ZoneName],[RuleExpression],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[RuleItems]) VALUES (2,'所有页面','底部','StartsWith(ValueOf(''Url''),''/'')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:52.343','admin','ZKEASOFT','2018-05-21 23:43:52.343','[{"Condition":"and","FunctionName":"StartsWith","Property":"ValueOf(''Url'')","Value":"/","Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}]');
INSERT INTO [CMS_Redirection] ([ID],[Title],[InComingUrl],[DestinationURL],[IsPermanent],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[IsPattern]) VALUES (1,'默认','~/','~/index',0,NULL,1,'admin','ZKEASOFT','2017-08-14 14:58:06.000','admin','ZKEASOFT','2020-08-01 22:21:26.837',0);
INSERT INTO [CMS_Message] ([ID],[Title],[Email],[PostMessage],[Reply],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES (1,'ZKEASOFT','zkea@zkea.net','ZKEACMS是基于ASP.NET MVC4开发的开源CMS，提供免费下载学习使用。','KEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。',1,'admin','ZKEASOFT','2017-03-19 21:02:34.260','admin','ZKEASOFT','2017-03-19 21:02:34.260',NULL);
INSERT INTO [CMS_Message] ([ID],[Title],[Email],[PostMessage],[Reply],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES (2,'ZKEASOFT','zkea@zkea.net','ZKEACMS使用可视化编辑设计','ZKEACMS是一个内容管理软件（网站），不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。',1,'admin','ZKEASOFT','2017-03-19 21:03:09.967','admin','ZKEASOFT','2017-03-19 21:03:09.967',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('6056810a7ede46bb94b55b2756323640','#','图片',1,NULL,NULL,'admin','ZKEASOFT','2016-04-01 21:42:14.960','admin','ZKEASOFT','2016-04-01 21:42:14.960',NULL);
INSERT INTO [CMS_Layout] ([ID],[LayoutName],[Title],[ContainerClass],[Status],[Description],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[ImageUrl],[ImageThumbUrl],[Theme]) VALUES ('0846a33e56bf45d5aae602ef40d87444','其它',NULL,'container',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:06:44.200','admin','ZKEASOFT','2016-03-10 21:06:44.200','~/images/layout.jpg','~/images/layout.jpg','Default');
INSERT INTO [CMS_Layout] ([ID],[LayoutName],[Title],[ContainerClass],[Status],[Description],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[ImageUrl],[ImageThumbUrl],[Theme]) VALUES ('1dae90cf6a8547538cc0c369b9943c01','默认',NULL,'container',1,NULL,NULL,NULL,'admin',NULL,'2015-08-31 11:56:31.750','admin',NULL,'2015-08-31 11:56:31.750','~/images/layout.jpg','~/images/layout.jpg','Default');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0338e740ea064e5a88d6223fd476506f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.650','admin','ZKEASOFT','2018-05-21 23:45:46.650',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0387a1373f59466a91feb96bb69aadca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.987','admin','ZKEASOFT','2018-05-21 23:46:12.987',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('07384e5dc4f34a199d4ca73b3317b1f2','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.190','admin','ZKEASOFT','2018-05-21 23:42:49.190',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('095b8b8b28144248a2b0eff648e7fc48','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.930','admin','ZKEASOFT','2018-05-21 23:45:21.930',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0c44eb9149b34ffaaa44d6976d11e1d8','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.307','admin','ZKEASOFT','2018-05-21 23:46:19.307',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0e5c5a55882b4a34a77f3de1f0f36a4c','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.117','admin','ZKEASOFT','2018-05-21 23:46:15.117',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1319756527364a5da511499b37a1eed5','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.973','admin','ZKEASOFT','2018-05-21 23:42:39.973',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('14a23e1671924f758113054ed008adec','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.727','admin','ZKEASOFT','2018-05-21 23:46:28.727',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('17ef6a804c524ed298492e404ad5576b','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.303','admin','ZKEASOFT','2018-05-21 23:46:19.303',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('18f2e25482b444ba8861238637861ba5','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.747','admin','ZKEASOFT','2018-05-21 23:46:34.747',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('19d3d679eaf74a21bf4f123487eaee0d','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193','admin','ZKEASOFT','2018-05-21 23:42:49.193',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1c232c2d572f415082e74771e37e3580','0846a33e56bf45d5aae602ef40d87444',NULL,'底部',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893','admin','ZKEASOFT','2017-11-19 17:48:10.637',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1cd27416b7db429bb639d8950cc29793','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.197','admin','ZKEASOFT','2018-05-21 23:42:49.197',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('23ec6afdd2ea49dd8fb5839ae2bec741','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.983','admin','ZKEASOFT','2018-05-21 23:42:39.983',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('25ce97efa1484065995e6e5aaade9a83','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.160','admin','ZKEASOFT','2018-05-21 23:42:49.160',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2921f81e4531493694790faed3ed76e9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.310','admin','ZKEASOFT','2018-05-21 23:46:19.310',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('294c86a5d87a46d49f41999c495344ea','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.730','admin','ZKEASOFT','2018-05-21 23:46:28.730',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2fd26e7c5a844bea8a2422d074d73109','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.330','admin','ZKEASOFT','2018-05-21 23:45:43.330',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('302009d870f74aa1b5b55dc6f1c6385f','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810','admin','ZKEASOFT','2018-05-21 23:45:44.810',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('34f9c91a64ee4986bec02073ea77035d','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.927','admin','ZKEASOFT','2018-05-21 23:45:21.927',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('360d6da3007e41d68c521c3154173c7a','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.783','admin','ZKEASOFT','2018-05-21 23:45:45.783',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('39af0cedd23a42d08c2c93e7b0dbaee0','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.357','admin','ZKEASOFT','2018-05-21 23:46:09.357',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3b3f74427bf84da999406f98f7d8cdd7','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.690','admin','ZKEASOFT','2018-05-21 23:45:46.690',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3ca302874c164b7b9691ca948300417b','1dae90cf6a8547538cc0c369b9943c01',NULL,'内容右',NULL,'admin',NULL,'2015-08-31 11:58:54.257','admin','ZKEASOFT','2017-11-19 17:48:39.823',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3f166bd62afb4a888801ec561cbc15ef','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.987','admin','ZKEASOFT','2018-05-21 23:42:39.987',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('40a562598d3a44a98646519094631628','1dae90cf6a8547538cc0c369b9943c01',NULL,'顶部',NULL,'admin',NULL,'2015-08-31 11:58:54.253','admin','ZKEASOFT','2017-11-19 17:48:39.840',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4cf5d05f2b954a7e8904713ad6781a61','1dae90cf6a8547538cc0c369b9943c01',NULL,'内容左',NULL,'admin',NULL,'2015-08-31 11:58:54.257','admin','ZKEASOFT','2017-11-19 17:48:39.847',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('572963d3322b4cddb7d94d6bec2f08c7','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.343','admin','ZKEASOFT','2018-05-21 23:45:43.343',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('57c4f0c9fb31439c913d0221c20a6343','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.113','admin','ZKEASOFT','2018-05-21 23:46:15.113',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('58f65b43d383423a9456102ea06450c1','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.740','admin','ZKEASOFT','2018-05-21 23:46:34.740',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5d3fdb35e2c54313850c69c401548b4d','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.753','admin','ZKEASOFT','2018-05-21 23:46:34.753',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5d84136b25ea4bd4a65779e0bb7acc3d','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.680','admin','ZKEASOFT','2018-05-21 23:45:46.680',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6920822269c34d5781b7df72fa37df16','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.917','admin','ZKEASOFT','2018-05-21 23:45:21.917',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6bba8443507f4273b2b61048f7c71f40','0846a33e56bf45d5aae602ef40d87444',NULL,'焦点',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.887','admin','ZKEASOFT','2017-11-19 17:48:10.903',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7480ffc27b034c51aca983367316bb7c','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.353','admin','ZKEASOFT','2018-05-21 23:46:09.353',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7577ca3b1628498c8f38b42545f3c1b3','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.120','admin','ZKEASOFT','2018-05-21 23:46:15.120',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('75be97a54a4b430ca6d26b8285bbce8d','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.347','admin','ZKEASOFT','2018-05-21 23:45:43.347',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('787c9336ef3341d4b63e710f16281424','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350','admin','ZKEASOFT','2018-05-21 23:46:09.350',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7c1d057dff154fa0836ebe82b5f08b6b','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.787','admin','ZKEASOFT','2018-05-21 23:45:45.787',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7fe7ceb43d734faca8a21e78185995d6','1dae90cf6a8547538cc0c369b9943c01',NULL,'底部',NULL,'admin',NULL,'2015-08-31 11:58:54.260','admin','ZKEASOFT','2017-11-19 17:48:39.873',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('82e28c8ca83c4a52847b2f759b4d1ab0','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.757','admin','ZKEASOFT','2018-05-21 23:46:34.757',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('85b6e66b7b3345e9a482af084da307d3','0846a33e56bf45d5aae602ef40d87444',NULL,'其它',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.890','admin','ZKEASOFT','2017-11-19 17:48:10.963',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8b3a4cd737594c00a7e34c17c1bbc9fc','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.760','admin','ZKEASOFT','2018-05-21 23:45:45.760',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8d4f87b76dfa4c96ae71734ef5ad08fd','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.657','admin','ZKEASOFT','2018-05-21 23:45:47.657',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('93ed2f72cef64bf891e0a1ef999c0ebc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.800','admin','ZKEASOFT','2018-05-21 23:45:44.800',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9774034c2832414e9ccaa39b43685710','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.670','admin','ZKEASOFT','2018-05-21 23:45:47.670',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9b5eab51ed78479f9a3b6cd88f30865c','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340','admin','ZKEASOFT','2018-05-21 23:45:43.340',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9c39ce55ae2b46fbaab97287436b651f','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340','admin','ZKEASOFT','2018-05-21 23:45:43.340',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9c87f7474bcf450a942838b42335a928','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993','admin','ZKEASOFT','2018-05-21 23:46:12.993',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9ccbb73c31ba46caa173b1ff5208cd4e','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193','admin','ZKEASOFT','2018-05-21 23:42:49.193',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a30b21857de2411982aa4f40e0fcba59','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993','admin','ZKEASOFT','2018-05-21 23:46:12.993',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a4bd66363b6a4f2ea1d21ed601c69866','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.797','admin','ZKEASOFT','2018-05-21 23:45:44.797',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a979c68e8f49405fa3c5cc21fafdb7b9','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.117','admin','ZKEASOFT','2018-05-21 23:46:15.117',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('aae6dbf58fff429d9a32627933854a8f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.693','admin','ZKEASOFT','2018-05-21 23:45:46.693',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('af49758840b345a6ab910d11a691fc99','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.667','admin','ZKEASOFT','2018-05-21 23:45:47.667',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b0a92bfb56704f8aaf7dade22c3db2d2','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.977','admin','ZKEASOFT','2018-05-21 23:42:39.977',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('be7a1e6a999b4264aab2b5ac593909a8','0846a33e56bf45d5aae602ef40d87444',NULL,'顶部',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.527','admin','ZKEASOFT','2017-11-19 17:48:10.967',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('bed6101f906b4e50b3ba034bfe39d184','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.833','admin','ZKEASOFT','2018-05-21 23:42:39.833',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c1f4cb36e7924ff99ff38aeb3983eca3','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.343','admin','ZKEASOFT','2018-05-21 23:46:09.343',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c22c6484c2864c82932ec6ad0a20492a','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.923','admin','ZKEASOFT','2018-05-21 23:45:21.923',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c291af01f0b443c3ad59b5b289d97e1f','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','内容左',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.307','admin','ZKEASOFT','2018-05-21 23:46:19.307',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c7bcd0a9d172432bafbf9f5a986685f2','0846a33e56bf45d5aae602ef40d87444',NULL,'主内容',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893','admin','ZKEASOFT','2017-11-19 17:48:10.967',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ca49f8b95d724a3bb1cc01a10ca72cb9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.297','admin','ZKEASOFT','2018-05-21 23:46:19.297',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d5a2daad909b4ecfb02988584d8903ad','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.777','admin','ZKEASOFT','2018-05-21 23:45:45.777',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d5f02570e4814439acc86a1874cb8f07','1dae90cf6a8547538cc0c369b9943c01',NULL,'主内容',NULL,'admin',NULL,'2015-08-31 11:58:54.257','admin','ZKEASOFT','2017-11-19 17:48:39.887',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d79708e9937541c9833467ed6f31ebda','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.980','admin','ZKEASOFT','2018-05-21 23:46:12.980',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('db297e847b15465cb4ee5d46cd7ca168','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673','admin','ZKEASOFT','2018-05-21 23:45:47.673',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('de442cdec7044de895680750884b1eb4','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.773','admin','ZKEASOFT','2018-05-21 23:45:45.773',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('df2ff4bd579d4e6cb8855b196ba2c322','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810','admin','ZKEASOFT','2018-05-21 23:45:44.810',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e333b823cf0e4d40a7999bc2787370b2','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.723','admin','ZKEASOFT','2018-05-21 23:46:28.723',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e74560705e8c414bbb284cc95dc54d8a','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733','admin','ZKEASOFT','2018-05-21 23:46:28.733',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ea3ca53e83924909bfab5e9242583a93','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.927','admin','ZKEASOFT','2018-05-21 23:45:21.927',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ea5cdd077bf44e16b8fc4a22433d63ca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','主内容',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.997','admin','ZKEASOFT','2018-05-21 23:46:12.997',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('eaaf42be824141679c05866ad9a8acf2','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','焦点',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350','admin','ZKEASOFT','2018-05-21 23:46:09.350',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ee21c0c23a834cfaae370413da4630cc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.780','admin','ZKEASOFT','2018-05-21 23:45:44.780',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('eeb31d7a5ee7485ea014708e14f66cac','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','底部',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673','admin','ZKEASOFT','2018-05-21 23:45:47.673',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f41ee7803dc6431bafb45ff035fca916','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.637','admin','ZKEASOFT','2018-05-21 23:45:46.637',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f4f64f6755be449c8ccb6c5969749b19','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','顶部',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733','admin','ZKEASOFT','2018-05-21 23:46:28.733',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f844832366834170a8c8caeb8c64b96b','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','内容右',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.107','admin','ZKEASOFT','2018-05-21 23:46:15.107',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('fb0f4ea5b0ed44289f665eec3b829ea2','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','其它',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.750','admin','ZKEASOFT','2018-05-21 23:46:34.750',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('068c85b8de8744e7a81b1d1010583308','9d84599edb2443439a53e8d906815c8f',1,'#','产品',0,'~/product','0846a33e56bf45d5aae602ef40d87444','产品',NULL,4,NULL,1,0,'2016-05-15 20:56:40.843',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.843','admin','ZKEASOFT','2016-05-15 20:56:40.843');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('0880a4dfdc184ff99b88c88325716d1b',NULL,0,'#','主页',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','欢迎使用ZKEACMS进行创作',NULL,1,NULL,1,0,'2017-10-15 18:11:36.000',NULL,NULL,'[]','[]','admin',NULL,'2015-08-31 13:27:16.000','admin','ZKEASOFT','2020-03-21 14:01:56.337');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1c93b61690ce49d7af8e1ea45ac58eb9',NULL,0,'#','联系我们',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01',' 联系我们',NULL,7,NULL,1,1,'2017-03-19 21:05:28.837',' 联系我们',' 联系我们',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:03:50.763','admin','ZKEASOFT','2017-03-19 21:05:16.280');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('4b889b430aa44517bbad38a57c745cc5','a8d73e29b1eb4b7ea43420e2b6bf2c1b',1,'9d84599edb2443439a53e8d906815c8f','产品详细',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2016-03-10 23:24:38.777',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.780','admin','ZKEASOFT','2016-03-10 23:24:38.780');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('50fa3579e7434555a22f095dcb4ea35e','0880a4dfdc184ff99b88c88325716d1b',1,'#','主页',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','欢迎使用ZKEACMS进行创作',NULL,1,NULL,1,0,'2017-10-15 18:11:36.273',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.277','admin','ZKEASOFT','2017-10-15 18:11:36.810');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('534e07f396b14b7584a833d270356cb7','1c93b61690ce49d7af8e1ea45ac58eb9',1,'#','联系我们',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01',' 联系我们',NULL,7,NULL,1,0,'2017-03-19 21:05:30.803',' 联系我们',' 联系我们',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.833','admin','ZKEASOFT','2017-03-19 21:05:31.050');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('9ce910ba45a24fd2af804d6d0de7bba3','be49e3ec3b5a4f5eae3edaf8ba64f185',1,'#','问卷调查',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','问卷调查 | ZKEASOFT',NULL,5,NULL,1,0,'2017-10-15 18:20:42.203',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:20:42.207','admin','ZKEASOFT','2017-10-15 18:20:42.217');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('9d84599edb2443439a53e8d906815c8f',NULL,0,'#','产品',0,'~/product','0846a33e56bf45d5aae602ef40d87444','产品',NULL,4,NULL,1,1,'2016-05-15 20:56:40.763',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:10.430','admin','ZKEASOFT','2016-05-14 15:01:42.697');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('a3d735320eb04c63bf3258d7b44e30f8',NULL,0,'e371628aa3ff46c3a167f121c7a3f32b','文章详细',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2017-12-03 17:11:47.220',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:03.240','admin','ZKEASOFT','2017-12-03 17:11:47.223');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('a8d73e29b1eb4b7ea43420e2b6bf2c1b',NULL,0,'9d84599edb2443439a53e8d906815c8f','产品详细',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2016-03-10 23:24:38.743',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:11.263','admin','ZKEASOFT','2016-03-10 23:24:38.737');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('be49e3ec3b5a4f5eae3edaf8ba64f185',NULL,0,'#','问卷调查',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','问卷调查 | ZKEASOFT',NULL,5,NULL,1,1,'2017-10-15 18:20:42.193',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:58:52.057','admin','ZKEASOFT','2017-10-15 18:20:42.193');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('c5b97a044c9844529fc48383d141e73c','a3d735320eb04c63bf3258d7b44e30f8',1,'e371628aa3ff46c3a167f121c7a3f32b','文章详细',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2017-12-03 17:11:47.237',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.243','admin','ZKEASOFT','2017-12-03 17:11:47.307');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d070f202bb2f45ddbd35f0a7cfee1dfa','e371628aa3ff46c3a167f121c7a3f32b',1,'#','文章',0,'~/article','0846a33e56bf45d5aae602ef40d87444','文章',NULL,3,NULL,1,0,'2017-10-15 18:11:44.947',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.947','admin','ZKEASOFT','2017-10-15 18:11:45.367');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e371628aa3ff46c3a167f121c7a3f32b',NULL,0,'#','文章',0,'~/article','0846a33e56bf45d5aae602ef40d87444','文章',NULL,3,NULL,1,1,'2017-10-15 18:11:44.940',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-09 12:45:01.000','admin','ZKEASOFT','2017-10-15 18:11:44.940');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (219,'0846a33e56bf45d5aae602ef40d87444',NULL,'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.063','admin','ZKEASOFT','2017-11-19 17:48:11.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (220,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.333','admin','ZKEASOFT','2017-11-19 17:48:11.333');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (221,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:11.337','admin','ZKEASOFT','2017-11-19 17:48:11.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (222,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.340','admin','ZKEASOFT','2017-11-19 17:48:11.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (223,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.347','admin','ZKEASOFT','2017-11-19 17:48:11.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (224,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.350','admin','ZKEASOFT','2017-11-19 17:48:11.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (225,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:11.353','admin','ZKEASOFT','2017-11-19 17:48:11.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (226,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.357','admin','ZKEASOFT','2017-11-19 17:48:11.357');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (227,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.370','admin','ZKEASOFT','2017-11-19 17:48:11.370');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (228,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.373','admin','ZKEASOFT','2017-11-19 17:48:11.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (229,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:11.647','admin','ZKEASOFT','2017-11-19 17:48:11.647');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (230,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.650','admin','ZKEASOFT','2017-11-19 17:48:11.650');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (231,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.650','admin','ZKEASOFT','2017-11-19 17:48:11.650');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (232,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.667','admin','ZKEASOFT','2017-11-19 17:48:11.667');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (233,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:11.950','admin','ZKEASOFT','2017-11-19 17:48:11.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (234,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.983','admin','ZKEASOFT','2017-11-19 17:48:11.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (235,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.987','admin','ZKEASOFT','2017-11-19 17:48:11.987');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (236,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:12.223','admin','ZKEASOFT','2017-11-19 17:48:12.223');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (237,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:12.270','admin','ZKEASOFT','2017-11-19 17:48:12.270');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (238,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:12.500','admin','ZKEASOFT','2017-11-19 17:48:12.500');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (239,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:12.757','admin','ZKEASOFT','2017-11-19 17:48:12.757');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (240,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:39.997','admin','ZKEASOFT','2017-11-19 17:48:39.997');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (241,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.013','admin','ZKEASOFT','2017-11-19 17:48:40.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (242,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:40.017','admin','ZKEASOFT','2017-11-19 17:48:40.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (243,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.023','admin','ZKEASOFT','2017-11-19 17:48:40.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (244,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.023','admin','ZKEASOFT','2017-11-19 17:48:40.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (245,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.027','admin','ZKEASOFT','2017-11-19 17:48:40.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (246,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:40.027','admin','ZKEASOFT','2017-11-19 17:48:40.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (247,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (248,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (249,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (250,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:40.043','admin','ZKEASOFT','2017-11-19 17:48:40.043');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (251,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.043','admin','ZKEASOFT','2017-11-19 17:48:40.043');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (252,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.047','admin','ZKEASOFT','2017-11-19 17:48:40.047');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (253,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.047','admin','ZKEASOFT','2017-11-19 17:48:40.047');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (254,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:40.047','admin','ZKEASOFT','2017-11-19 17:48:40.047');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (255,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.053','admin','ZKEASOFT','2017-11-19 17:48:40.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (256,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.057','admin','ZKEASOFT','2017-11-19 17:48:40.057');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (257,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.057','admin','ZKEASOFT','2017-11-19 17:48:40.057');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (258,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:40.063','admin','ZKEASOFT','2017-11-19 17:48:40.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (259,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.063','admin','ZKEASOFT','2017-11-19 17:48:40.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (260,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:40.073','admin','ZKEASOFT','2017-11-19 17:48:40.073');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (261,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.053','admin','ZKEASOFT','2018-05-21 23:42:40.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (262,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.110','admin','ZKEASOFT','2018-05-21 23:42:40.110');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (263,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-0','admin','ZKEASOFT','2018-05-21 23:42:40.113','admin','ZKEASOFT','2018-05-21 23:42:40.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (264,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.113','admin','ZKEASOFT','2018-05-21 23:42:40.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (265,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.117','admin','ZKEASOFT','2018-05-21 23:42:40.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (266,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.117','admin','ZKEASOFT','2018-05-21 23:42:40.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (267,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-1','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (268,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (269,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (270,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.123','admin','ZKEASOFT','2018-05-21 23:42:40.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (271,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-2','admin','ZKEASOFT','2018-05-21 23:42:40.123','admin','ZKEASOFT','2018-05-21 23:42:40.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (272,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.127','admin','ZKEASOFT','2018-05-21 23:42:40.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (273,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.127','admin','ZKEASOFT','2018-05-21 23:42:40.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (274,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.130','admin','ZKEASOFT','2018-05-21 23:42:40.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (275,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-3','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (276,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (277,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (278,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.137','admin','ZKEASOFT','2018-05-21 23:42:40.137');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (279,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-4','admin','ZKEASOFT','2018-05-21 23:42:40.137','admin','ZKEASOFT','2018-05-21 23:42:40.137');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (280,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.140','admin','ZKEASOFT','2018-05-21 23:42:40.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (281,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:42:40.140','admin','ZKEASOFT','2018-05-21 23:42:40.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (282,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:54.990','admin','ZKEASOFT','2018-05-21 23:45:54.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (283,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.003','admin','ZKEASOFT','2018-05-21 23:45:55.003');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (284,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-0','admin','ZKEASOFT','2018-05-21 23:45:55.007','admin','ZKEASOFT','2018-05-21 23:45:55.007');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (285,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.010','admin','ZKEASOFT','2018-05-21 23:45:55.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (286,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.013','admin','ZKEASOFT','2018-05-21 23:45:55.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (287,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.013','admin','ZKEASOFT','2018-05-21 23:45:55.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (288,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-1','admin','ZKEASOFT','2018-05-21 23:45:55.020','admin','ZKEASOFT','2018-05-21 23:45:55.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (289,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.023','admin','ZKEASOFT','2018-05-21 23:45:55.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (290,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.033','admin','ZKEASOFT','2018-05-21 23:45:55.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (291,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.037','admin','ZKEASOFT','2018-05-21 23:45:55.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (292,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-2','admin','ZKEASOFT','2018-05-21 23:45:55.050','admin','ZKEASOFT','2018-05-21 23:45:55.050');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (293,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.050','admin','ZKEASOFT','2018-05-21 23:45:55.050');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (294,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.053','admin','ZKEASOFT','2018-05-21 23:45:55.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (295,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.060','admin','ZKEASOFT','2018-05-21 23:45:55.060');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (296,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-3','admin','ZKEASOFT','2018-05-21 23:45:55.063','admin','ZKEASOFT','2018-05-21 23:45:55.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (297,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.067','admin','ZKEASOFT','2018-05-21 23:45:55.067');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (298,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.070','admin','ZKEASOFT','2018-05-21 23:45:55.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (299,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.070','admin','ZKEASOFT','2018-05-21 23:45:55.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (300,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-4','admin','ZKEASOFT','2018-05-21 23:45:55.073','admin','ZKEASOFT','2018-05-21 23:45:55.073');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (301,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.077','admin','ZKEASOFT','2018-05-21 23:45:55.077');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (302,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:45:55.087','admin','ZKEASOFT','2018-05-21 23:45:55.087');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (303,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.367','admin','ZKEASOFT','2018-05-21 23:46:09.367');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (304,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.373','admin','ZKEASOFT','2018-05-21 23:46:09.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (305,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:09.380','admin','ZKEASOFT','2018-05-21 23:46:09.380');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (306,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.380','admin','ZKEASOFT','2018-05-21 23:46:09.380');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (307,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.383','admin','ZKEASOFT','2018-05-21 23:46:09.383');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (308,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.383','admin','ZKEASOFT','2018-05-21 23:46:09.383');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (309,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:09.387','admin','ZKEASOFT','2018-05-21 23:46:09.387');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (310,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.390','admin','ZKEASOFT','2018-05-21 23:46:09.390');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (311,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.393','admin','ZKEASOFT','2018-05-21 23:46:09.393');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (312,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.393','admin','ZKEASOFT','2018-05-21 23:46:09.393');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (313,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:09.397','admin','ZKEASOFT','2018-05-21 23:46:09.397');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (314,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.397','admin','ZKEASOFT','2018-05-21 23:46:09.397');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (315,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.400','admin','ZKEASOFT','2018-05-21 23:46:09.400');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (316,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.400','admin','ZKEASOFT','2018-05-21 23:46:09.400');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (317,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:09.407','admin','ZKEASOFT','2018-05-21 23:46:09.407');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (318,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.410','admin','ZKEASOFT','2018-05-21 23:46:09.410');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (319,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.417','admin','ZKEASOFT','2018-05-21 23:46:09.417');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (320,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.420','admin','ZKEASOFT','2018-05-21 23:46:09.420');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (321,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:09.423','admin','ZKEASOFT','2018-05-21 23:46:09.423');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (322,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.427','admin','ZKEASOFT','2018-05-21 23:46:09.427');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (323,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:09.427','admin','ZKEASOFT','2018-05-21 23:46:09.427');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (324,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.003','admin','ZKEASOFT','2018-05-21 23:46:13.003');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (325,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.010','admin','ZKEASOFT','2018-05-21 23:46:13.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (326,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:13.010','admin','ZKEASOFT','2018-05-21 23:46:13.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (327,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.013','admin','ZKEASOFT','2018-05-21 23:46:13.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (328,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.013','admin','ZKEASOFT','2018-05-21 23:46:13.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (329,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.017','admin','ZKEASOFT','2018-05-21 23:46:13.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (330,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:13.017','admin','ZKEASOFT','2018-05-21 23:46:13.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (331,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.017','admin','ZKEASOFT','2018-05-21 23:46:13.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (332,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.020','admin','ZKEASOFT','2018-05-21 23:46:13.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (333,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.020','admin','ZKEASOFT','2018-05-21 23:46:13.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (334,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:13.023','admin','ZKEASOFT','2018-05-21 23:46:13.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (335,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.023','admin','ZKEASOFT','2018-05-21 23:46:13.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (336,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.027','admin','ZKEASOFT','2018-05-21 23:46:13.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (337,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.027','admin','ZKEASOFT','2018-05-21 23:46:13.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (338,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:13.030','admin','ZKEASOFT','2018-05-21 23:46:13.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (339,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.030','admin','ZKEASOFT','2018-05-21 23:46:13.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (340,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.033','admin','ZKEASOFT','2018-05-21 23:46:13.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (341,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.033','admin','ZKEASOFT','2018-05-21 23:46:13.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (342,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:13.037','admin','ZKEASOFT','2018-05-21 23:46:13.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (343,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.037','admin','ZKEASOFT','2018-05-21 23:46:13.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (344,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:13.037','admin','ZKEASOFT','2018-05-21 23:46:13.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (345,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.127','admin','ZKEASOFT','2018-05-21 23:46:15.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (346,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.130','admin','ZKEASOFT','2018-05-21 23:46:15.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (347,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:15.133','admin','ZKEASOFT','2018-05-21 23:46:15.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (348,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.133','admin','ZKEASOFT','2018-05-21 23:46:15.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (349,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.137','admin','ZKEASOFT','2018-05-21 23:46:15.137');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (350,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.137','admin','ZKEASOFT','2018-05-21 23:46:15.137');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (351,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:15.140','admin','ZKEASOFT','2018-05-21 23:46:15.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (352,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.140','admin','ZKEASOFT','2018-05-21 23:46:15.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (353,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (354,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (355,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (356,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.147','admin','ZKEASOFT','2018-05-21 23:46:15.147');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (357,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.147','admin','ZKEASOFT','2018-05-21 23:46:15.147');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (358,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.150','admin','ZKEASOFT','2018-05-21 23:46:15.150');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (359,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:15.150','admin','ZKEASOFT','2018-05-21 23:46:15.150');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (360,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.153','admin','ZKEASOFT','2018-05-21 23:46:15.153');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (361,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.157','admin','ZKEASOFT','2018-05-21 23:46:15.157');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (362,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.160','admin','ZKEASOFT','2018-05-21 23:46:15.160');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (363,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:15.167','admin','ZKEASOFT','2018-05-21 23:46:15.167');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (364,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.167','admin','ZKEASOFT','2018-05-21 23:46:15.167');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (365,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:15.173','admin','ZKEASOFT','2018-05-21 23:46:15.173');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (366,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.317','admin','ZKEASOFT','2018-05-21 23:46:19.317');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (367,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.320','admin','ZKEASOFT','2018-05-21 23:46:19.320');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (368,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:19.323','admin','ZKEASOFT','2018-05-21 23:46:19.323');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (369,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.323','admin','ZKEASOFT','2018-05-21 23:46:19.323');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (370,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.327','admin','ZKEASOFT','2018-05-21 23:46:19.327');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (371,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.330','admin','ZKEASOFT','2018-05-21 23:46:19.330');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (372,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:19.330','admin','ZKEASOFT','2018-05-21 23:46:19.330');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (373,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.337','admin','ZKEASOFT','2018-05-21 23:46:19.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (374,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.337','admin','ZKEASOFT','2018-05-21 23:46:19.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (375,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.340','admin','ZKEASOFT','2018-05-21 23:46:19.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (376,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:19.340','admin','ZKEASOFT','2018-05-21 23:46:19.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (377,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.343','admin','ZKEASOFT','2018-05-21 23:46:19.343');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (378,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.343','admin','ZKEASOFT','2018-05-21 23:46:19.343');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (379,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.347','admin','ZKEASOFT','2018-05-21 23:46:19.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (380,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:19.347','admin','ZKEASOFT','2018-05-21 23:46:19.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (381,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.350','admin','ZKEASOFT','2018-05-21 23:46:19.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (382,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.350','admin','ZKEASOFT','2018-05-21 23:46:19.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (383,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (384,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (385,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (386,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:19.357','admin','ZKEASOFT','2018-05-21 23:46:19.357');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (387,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.740','admin','ZKEASOFT','2018-05-21 23:46:28.740');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (388,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.747','admin','ZKEASOFT','2018-05-21 23:46:28.747');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (389,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:28.747','admin','ZKEASOFT','2018-05-21 23:46:28.747');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (390,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.753','admin','ZKEASOFT','2018-05-21 23:46:28.753');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (391,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.753','admin','ZKEASOFT','2018-05-21 23:46:28.753');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (392,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.760','admin','ZKEASOFT','2018-05-21 23:46:28.760');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (393,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:28.760','admin','ZKEASOFT','2018-05-21 23:46:28.760');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (394,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.763','admin','ZKEASOFT','2018-05-21 23:46:28.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (395,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.763','admin','ZKEASOFT','2018-05-21 23:46:28.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (396,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.767','admin','ZKEASOFT','2018-05-21 23:46:28.767');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (397,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:28.770','admin','ZKEASOFT','2018-05-21 23:46:28.770');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (398,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.780','admin','ZKEASOFT','2018-05-21 23:46:28.780');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (399,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.783','admin','ZKEASOFT','2018-05-21 23:46:28.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (400,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.790','admin','ZKEASOFT','2018-05-21 23:46:28.790');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (401,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:28.790','admin','ZKEASOFT','2018-05-21 23:46:28.790');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (402,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.797','admin','ZKEASOFT','2018-05-21 23:46:28.797');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (403,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.797','admin','ZKEASOFT','2018-05-21 23:46:28.797');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (404,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.803','admin','ZKEASOFT','2018-05-21 23:46:28.803');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (405,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:28.810','admin','ZKEASOFT','2018-05-21 23:46:28.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (406,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.810','admin','ZKEASOFT','2018-05-21 23:46:28.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (407,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:28.817','admin','ZKEASOFT','2018-05-21 23:46:28.817');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (408,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.763','admin','ZKEASOFT','2018-05-21 23:46:34.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (409,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.767','admin','ZKEASOFT','2018-05-21 23:46:34.767');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (410,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:34.770','admin','ZKEASOFT','2018-05-21 23:46:34.770');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (411,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.773','admin','ZKEASOFT','2018-05-21 23:46:34.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (412,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.773','admin','ZKEASOFT','2018-05-21 23:46:34.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (413,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.777','admin','ZKEASOFT','2018-05-21 23:46:34.777');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (414,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:34.777','admin','ZKEASOFT','2018-05-21 23:46:34.777');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (415,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.783','admin','ZKEASOFT','2018-05-21 23:46:34.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (416,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.783','admin','ZKEASOFT','2018-05-21 23:46:34.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (417,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.797','admin','ZKEASOFT','2018-05-21 23:46:34.797');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (418,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:34.800','admin','ZKEASOFT','2018-05-21 23:46:34.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (419,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.800','admin','ZKEASOFT','2018-05-21 23:46:34.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (420,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.803','admin','ZKEASOFT','2018-05-21 23:46:34.803');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (421,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.810','admin','ZKEASOFT','2018-05-21 23:46:34.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (422,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:34.817','admin','ZKEASOFT','2018-05-21 23:46:34.817');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (423,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.820','admin','ZKEASOFT','2018-05-21 23:46:34.820');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (424,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.820','admin','ZKEASOFT','2018-05-21 23:46:34.820');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (425,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.827','admin','ZKEASOFT','2018-05-21 23:46:34.827');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (426,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:34.827','admin','ZKEASOFT','2018-05-21 23:46:34.827');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (427,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.833','admin','ZKEASOFT','2018-05-21 23:46:34.833');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (428,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:34.833','admin','ZKEASOFT','2018-05-21 23:46:34.833');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (429,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.443','admin','ZKEASOFT','2018-05-22 11:31:26.443');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (430,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.453','admin','ZKEASOFT','2018-05-22 11:31:26.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (431,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:26.453','admin','ZKEASOFT','2018-05-22 11:31:26.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (432,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.457','admin','ZKEASOFT','2018-05-22 11:31:26.457');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (433,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.457','admin','ZKEASOFT','2018-05-22 11:31:26.457');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (434,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.457','admin','ZKEASOFT','2018-05-22 11:31:26.457');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (435,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:26.460','admin','ZKEASOFT','2018-05-22 11:31:26.460');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (436,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.463','admin','ZKEASOFT','2018-05-22 11:31:26.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (437,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.463','admin','ZKEASOFT','2018-05-22 11:31:26.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (438,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.467','admin','ZKEASOFT','2018-05-22 11:31:26.467');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (439,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:26.467','admin','ZKEASOFT','2018-05-22 11:31:26.467');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (440,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.470','admin','ZKEASOFT','2018-05-22 11:31:26.470');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (441,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.473','admin','ZKEASOFT','2018-05-22 11:31:26.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (442,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.473','admin','ZKEASOFT','2018-05-22 11:31:26.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (443,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:26.477','admin','ZKEASOFT','2018-05-22 11:31:26.477');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (444,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.480','admin','ZKEASOFT','2018-05-22 11:31:26.480');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (445,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.480','admin','ZKEASOFT','2018-05-22 11:31:26.480');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (446,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.483','admin','ZKEASOFT','2018-05-22 11:31:26.483');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (447,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:26.483','admin','ZKEASOFT','2018-05-22 11:31:26.483');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (448,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.487','admin','ZKEASOFT','2018-05-22 11:31:26.487');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (449,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:26.487','admin','ZKEASOFT','2018-05-22 11:31:26.487');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (450,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.517','admin','ZKEASOFT','2018-05-22 11:31:31.517');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (451,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.520','admin','ZKEASOFT','2018-05-22 11:31:31.520');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (452,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:31.537','admin','ZKEASOFT','2018-05-22 11:31:31.537');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (453,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.547','admin','ZKEASOFT','2018-05-22 11:31:31.547');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (454,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.560','admin','ZKEASOFT','2018-05-22 11:31:31.560');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (455,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.580','admin','ZKEASOFT','2018-05-22 11:31:31.580');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (456,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:31.593','admin','ZKEASOFT','2018-05-22 11:31:31.593');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (457,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.607','admin','ZKEASOFT','2018-05-22 11:31:31.607');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (458,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.617','admin','ZKEASOFT','2018-05-22 11:31:31.617');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (459,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.620','admin','ZKEASOFT','2018-05-22 11:31:31.620');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (460,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:31.620','admin','ZKEASOFT','2018-05-22 11:31:31.620');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (461,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.627','admin','ZKEASOFT','2018-05-22 11:31:31.627');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (462,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.640','admin','ZKEASOFT','2018-05-22 11:31:31.640');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (463,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.653','admin','ZKEASOFT','2018-05-22 11:31:31.653');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (464,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:31.663','admin','ZKEASOFT','2018-05-22 11:31:31.663');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (465,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.677','admin','ZKEASOFT','2018-05-22 11:31:31.677');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (466,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.687','admin','ZKEASOFT','2018-05-22 11:31:31.687');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (467,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.700','admin','ZKEASOFT','2018-05-22 11:31:31.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (468,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:31.713','admin','ZKEASOFT','2018-05-22 11:31:31.713');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (469,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.723','admin','ZKEASOFT','2018-05-22 11:31:31.723');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (470,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:31.737','admin','ZKEASOFT','2018-05-22 11:31:31.737');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (471,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.700','admin','ZKEASOFT','2018-05-22 11:31:35.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (472,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.700','admin','ZKEASOFT','2018-05-22 11:31:35.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (473,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:35.713','admin','ZKEASOFT','2018-05-22 11:31:35.713');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (474,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.723','admin','ZKEASOFT','2018-05-22 11:31:35.723');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (475,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.737','admin','ZKEASOFT','2018-05-22 11:31:35.737');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (476,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.750','admin','ZKEASOFT','2018-05-22 11:31:35.750');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (477,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:35.763','admin','ZKEASOFT','2018-05-22 11:31:35.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (478,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.773','admin','ZKEASOFT','2018-05-22 11:31:35.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (479,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.787','admin','ZKEASOFT','2018-05-22 11:31:35.787');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (480,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.800','admin','ZKEASOFT','2018-05-22 11:31:35.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (481,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:35.813','admin','ZKEASOFT','2018-05-22 11:31:35.813');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (482,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.823','admin','ZKEASOFT','2018-05-22 11:31:35.823');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (483,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.837','admin','ZKEASOFT','2018-05-22 11:31:35.837');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (484,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.850','admin','ZKEASOFT','2018-05-22 11:31:35.850');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (485,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:35.860','admin','ZKEASOFT','2018-05-22 11:31:35.860');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (486,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.873','admin','ZKEASOFT','2018-05-22 11:31:35.873');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (487,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.887','admin','ZKEASOFT','2018-05-22 11:31:35.887');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (488,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.897','admin','ZKEASOFT','2018-05-22 11:31:35.897');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (489,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:35.910','admin','ZKEASOFT','2018-05-22 11:31:35.910');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (490,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.923','admin','ZKEASOFT','2018-05-22 11:31:35.923');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (491,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:35.937','admin','ZKEASOFT','2018-05-22 11:31:35.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (492,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.900','admin','ZKEASOFT','2018-05-22 11:31:39.900');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (493,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.900','admin','ZKEASOFT','2018-05-22 11:31:39.900');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (494,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:39.903','admin','ZKEASOFT','2018-05-22 11:31:39.903');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (495,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.903','admin','ZKEASOFT','2018-05-22 11:31:39.903');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (496,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.907','admin','ZKEASOFT','2018-05-22 11:31:39.907');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (497,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.907','admin','ZKEASOFT','2018-05-22 11:31:39.907');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (498,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:39.907','admin','ZKEASOFT','2018-05-22 11:31:39.907');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (499,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.910','admin','ZKEASOFT','2018-05-22 11:31:39.910');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (500,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.913','admin','ZKEASOFT','2018-05-22 11:31:39.913');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (501,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.913','admin','ZKEASOFT','2018-05-22 11:31:39.913');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (502,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:39.917','admin','ZKEASOFT','2018-05-22 11:31:39.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (503,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.917','admin','ZKEASOFT','2018-05-22 11:31:39.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (504,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.920','admin','ZKEASOFT','2018-05-22 11:31:39.920');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (505,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.923','admin','ZKEASOFT','2018-05-22 11:31:39.923');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (506,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:39.927','admin','ZKEASOFT','2018-05-22 11:31:39.927');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (507,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.930','admin','ZKEASOFT','2018-05-22 11:31:39.930');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (508,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.933','admin','ZKEASOFT','2018-05-22 11:31:39.933');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (509,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.933','admin','ZKEASOFT','2018-05-22 11:31:39.933');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (510,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:39.937','admin','ZKEASOFT','2018-05-22 11:31:39.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (511,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.937','admin','ZKEASOFT','2018-05-22 11:31:39.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (512,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:39.937','admin','ZKEASOFT','2018-05-22 11:31:39.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (513,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.950','admin','ZKEASOFT','2018-05-22 11:31:43.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (514,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.953','admin','ZKEASOFT','2018-05-22 11:31:43.953');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (515,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:43.953','admin','ZKEASOFT','2018-05-22 11:31:43.953');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (516,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.957','admin','ZKEASOFT','2018-05-22 11:31:43.957');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (517,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.957','admin','ZKEASOFT','2018-05-22 11:31:43.957');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (518,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.963','admin','ZKEASOFT','2018-05-22 11:31:43.963');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (519,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:43.967','admin','ZKEASOFT','2018-05-22 11:31:43.967');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (520,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.967','admin','ZKEASOFT','2018-05-22 11:31:43.967');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (521,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.970','admin','ZKEASOFT','2018-05-22 11:31:43.970');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (522,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.973','admin','ZKEASOFT','2018-05-22 11:31:43.973');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (523,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:43.977','admin','ZKEASOFT','2018-05-22 11:31:43.977');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (524,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.980','admin','ZKEASOFT','2018-05-22 11:31:43.980');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (525,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.983','admin','ZKEASOFT','2018-05-22 11:31:43.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (526,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.983','admin','ZKEASOFT','2018-05-22 11:31:43.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (527,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:43.987','admin','ZKEASOFT','2018-05-22 11:31:43.987');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (528,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.987','admin','ZKEASOFT','2018-05-22 11:31:43.987');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (529,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.990','admin','ZKEASOFT','2018-05-22 11:31:43.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (530,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.990','admin','ZKEASOFT','2018-05-22 11:31:43.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (531,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:43.993','admin','ZKEASOFT','2018-05-22 11:31:43.993');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (532,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.997','admin','ZKEASOFT','2018-05-22 11:31:43.997');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (533,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:44.000','admin','ZKEASOFT','2018-05-22 11:31:44.000');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (534,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.357','admin','ZKEASOFT','2018-05-22 11:31:49.357');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (535,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.360','admin','ZKEASOFT','2018-05-22 11:31:49.360');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (536,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:49.373','admin','ZKEASOFT','2018-05-22 11:31:49.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (537,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.387','admin','ZKEASOFT','2018-05-22 11:31:49.387');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (538,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.397','admin','ZKEASOFT','2018-05-22 11:31:49.397');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (539,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.410','admin','ZKEASOFT','2018-05-22 11:31:49.410');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (540,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:49.427','admin','ZKEASOFT','2018-05-22 11:31:49.427');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (541,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.440','admin','ZKEASOFT','2018-05-22 11:31:49.440');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (542,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.453','admin','ZKEASOFT','2018-05-22 11:31:49.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (543,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.463','admin','ZKEASOFT','2018-05-22 11:31:49.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (544,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:49.477','admin','ZKEASOFT','2018-05-22 11:31:49.477');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (545,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.490','admin','ZKEASOFT','2018-05-22 11:31:49.490');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (546,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.503','admin','ZKEASOFT','2018-05-22 11:31:49.503');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (547,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.517','admin','ZKEASOFT','2018-05-22 11:31:49.517');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (548,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:49.527','admin','ZKEASOFT','2018-05-22 11:31:49.527');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (549,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.540','admin','ZKEASOFT','2018-05-22 11:31:49.540');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (550,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.553','admin','ZKEASOFT','2018-05-22 11:31:49.553');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (551,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.567','admin','ZKEASOFT','2018-05-22 11:31:49.567');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (552,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:49.580','admin','ZKEASOFT','2018-05-22 11:31:49.580');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (553,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.593','admin','ZKEASOFT','2018-05-22 11:31:49.593');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (554,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:49.607','admin','ZKEASOFT','2018-05-22 11:31:49.607');
INSERT INTO [Carousel] ([ID],[Title],[Height],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'示例',NULL,NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.203','admin','ZKEASOFT','2016-03-27 15:17:54.050');
INSERT INTO [CarouselWidget] ([ID],[CarouselID]) VALUES ('19350341920b4827bf2a4e458ad24a58',1);
INSERT INTO [CarouselWidget] ([ID],[CarouselID]) VALUES ('41e075ab1b89453388494a539eec55b9',1);
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'图1',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg1.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.217','admin','ZKEASOFT','2016-03-27 15:17:54.053');
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'图2',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg2.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.570','admin','ZKEASOFT','2016-03-27 15:17:54.420');
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'图3',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg3.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.573','admin','ZKEASOFT','2016-03-27 15:17:54.433');
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('8df64186d2fd4d63a9f9bb3b6e34cd2a',1,NULL);
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('de8d94fd51cb4e73b00518dbb2f134d3',1,NULL);
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'新闻',NULL,0,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:18.000','admin','ZKEASOFT','2017-10-15 18:18:33.430');
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'公司新闻',NULL,1,'company',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:24.000','admin','ZKEASOFT','2018-08-15 15:31:38.347');
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'行业新闻',NULL,1,'industry',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:29.000','admin','ZKEASOFT','2018-08-15 15:31:42.810');
INSERT INTO [ArticleSummaryWidget] ([ID],[SubTitle],[Style],[DetailLink],[Summary]) VALUES ('8c5b69f614b641c0a5f7a8e318de8df3','ZKEACMS 简介','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS" target="_blank" rel="noopener">ZKEACMS</a> Core 是基于.Net Core开发的开源CMS，在您开始使用之前，为了保障您的权益，请先查看我们的开源协议<a href="http://www.zkea.net/licenses" target="_blank" rel="noopener">http://www.zkea.net/licenses</a>。</p>
<p>ZKEACMS是一个内容管理软件，ZKEACMS的主旨在于快速创建页面和自定义页面内容。无论您是专业的开发人员还是普通的用户，都可以快速上手使用ZKEACMS。</p>
<p>ZKEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。</p>
<p>架设环境：.Net Core 2.0</p>
<h3>旗舰版</h3>
<p>体验地址：<a href="http://demo.zkea.net" target="_blank" rel="noopener">http://demo.zkea.net</a></p>
<h3>建站系统</h3>
<p>基于ZKEACMS的云建站系统</p>
<p><a href="http://www.zkea.net/cloud" target="_blank" rel="noopener">http://www.zkea.net/cloud</a></p>
<p></p>');
INSERT INTO [ArticleSummaryWidget] ([ID],[SubTitle],[Style],[DetailLink],[Summary]) VALUES ('cd21a7bf68b44f6e8d178b153288a26e','ZKEACMS 简介','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS" target="_blank" rel="noopener">ZKEACMS</a> Core 是基于.Net Core开发的开源CMS，在您开始使用之前，为了保障您的权益，请先查看我们的开源协议<a href="http://www.zkea.net/licenses" target="_blank" rel="noopener">http://www.zkea.net/licenses</a>。</p>
<p>ZKEACMS是一个内容管理软件，ZKEACMS的主旨在于快速创建页面和自定义页面内容。无论您是专业的开发人员还是普通的用户，都可以快速上手使用ZKEACMS。</p>
<p>ZKEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。</p>
<p>架设环境：.Net Core 2.0</p>
<h3>旗舰版</h3>
<p>体验地址：<a href="http://demo.zkea.net" target="_blank" rel="noopener">http://demo.zkea.net</a></p>
<h3>建站系统</h3>
<p>基于ZKEACMS的云建站系统</p>
<p><a href="http://www.zkea.net/cloud" target="_blank" rel="noopener">http://www.zkea.net/cloud</a></p>
<p></p>');
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('416c5402962b41548c83fabaa5492b42',1,'~/article/detail',1,5);
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('ca9f8809636d448cbd4f3beb418465b3',1,'~/article/detail',1,5);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('3aa8b53e7ad143ff818855a7abcb3fdd',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('e8fd1019bab045e5927ec30abaaa1aba',NULL);
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'ZKEACMS 简介','ZKEACMS是基于EasyFrameWork，使用 ASP .NET MVC 开发的开源 .Net CMS。  ZKEACMS一个内容管理系统。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。','ZKEACMS','ZKEACMS是基于EasyFrameWork，使用 ASP .NET MVC 开发的开源 .Net CMS。  ZKEACMS一个内容管理系统。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。',1,2,NULL,'<h3>简介</h3>
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
<p><span>ZKEACMS 是插件式设计，可以通过不断地添加插件来获取新的功能，默认的插件已经足以满足日常使用。</span></p>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:41:19.000','zkeacms','admin','ZKEASOFT','2017-11-19 23:41:19.000','admin','ZKEASOFT','2019-04-24 21:52:43.060');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'ZKEACMS For .Net Core','纸壳CMS（ZKEACMS Core） 是ZKEACMS对 .Net Core 版本的全功能实现 CMS，借助于 .Net Core 实现跨平台，您可以在 Windows, MAC OS, Linux, Docker 上运行。','ZKEACMS .Net Core','纸壳CMS（ZKEACMS Core） 是ZKEACMS对 .Net Core 版本的全功能实现 CMS，借助于 .Net Core 实现跨平台，您可以在 Windows, MAC OS, Linux, Docker 上运行。',1,3,NULL,'<h3>全功能迁移</h3>
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
</div>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:53:23.000','zkeacms-core','admin','ZKEASOFT','2017-11-19 23:53:16.000','admin','ZKEASOFT','2019-04-24 21:52:54.903');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Animation_Widget_FadeInUp','false',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:10.083',NULL,NULL,'2022-07-29 20:42:10.083');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EnableCustomerAccount','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:31.003',NULL,NULL,'2022-07-29 20:42:31.003');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EnableResponsiveDesign','true',NULL,NULL,1,NULL,NULL,'2020-03-14 11:32:07.333',NULL,NULL,'2020-03-14 11:32:07.333');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ExpandAllPage','true',NULL,NULL,1,'admin','ZKEASOFT','2018-04-11 17:01:47.230','admin','ZKEASOFT','2018-04-11 17:01:47.233');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Favicon','~/favicon.ico',NULL,NULL,NULL,'admin','ZKEASOFT','2017-03-19 20:57:33.627','admin','ZKEASOFT','2017-03-19 20:57:33.627');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('OuterChainPicture','false',NULL,NULL,1,NULL,NULL,'2019-07-31 12:09:28.430',NULL,NULL,'2019-07-31 12:09:28.430');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('PinNavigation','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:10.387',NULL,NULL,'2022-07-29 20:42:10.387');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SiteInformation_Logo_Mini','/images/logo_min.png',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.370','admin','ZKEASOFT','2021-03-06 22:16:20.370');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SiteInformation_SiteName','ZKEASOFT',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.310','admin','ZKEASOFT','2021-03-06 22:16:20.310');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UseImageCaptcha','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:39.537',NULL,NULL,'2022-07-29 20:42:39.537');
COMMIT;

