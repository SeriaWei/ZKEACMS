-- Script Date: 2021/4/29 星期四 18:32  - ErikEJ.SqlCeScripting version 3.5.2.56
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
, CONSTRAINT [PK__Subscrip__3214EC27B0CFFF54] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__Shipping__3214EC277ECE4E69] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__Roles__3214EC270052F237] PRIMARY KEY ([ID])
);
CREATE TABLE [UserRoleRelation] (
  [ID] INTEGER NOT NULL
, [RoleID] int NULL
, [UserID] nvarchar(50) NULL
, CONSTRAINT [PK__UserRole__3214EC27511FF5FE] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__ProductG__3214EC2739F5B26A] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__PersistK__3214EC27CCED2A26] PRIMARY KEY ([ID])
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
CREATE TABLE [Language] (
  [LanKey] nvarchar(190) NOT NULL
, [CultureName] nvarchar(10) NOT NULL
, [LanValue] ntext NULL
, [Module] nvarchar(50) NULL
, [LanType] nvarchar(50) NULL
, CONSTRAINT [PK_Language] PRIMARY KEY ([LanKey],[CultureName])
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
, CONSTRAINT [PK__FluidCon__3214EC27ED714307] PRIMARY KEY ([ID])
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
CREATE TABLE [DBVersion] (
  [ID] INTEGER NOT NULL
, [Major] int NULL
, [Minor] int NULL
, [Revision] int NULL
, [Build] int NULL
, CONSTRAINT [PK__DBVersio__3214EC279B4434D0] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__Currency__3214EC27BBEC2D2E] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__ArticleG__3214EC27E0B70C6E] PRIMARY KEY ([ID])
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
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Column','左右','Thumbnail\SectionTemplate.Column.png','Thumbnail\SectionTemplate.Column.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Default','默认','Thumbnail\SectionTemplate.Default.png','Thumbnail\SectionTemplate.Default.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageRight','图片右','Thumbnail\SectionTemplate.ImageRight.png','Thumbnail\SectionTemplate.ImageRight.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LinkGroup','链接组','Thumbnail\SectionTemplate.LinkGroup.png','Thumbnail\SectionTemplate.LinkGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ListGroup','列表组','Thumbnail\SectionTemplate.ListGroup.png','Thumbnail\SectionTemplate.ListGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ListView','媒体列表','Thumbnail\SectionTemplate.ListView.png','Thumbnail\SectionTemplate.ListView.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO [Roles] ([ID],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'超级管理员','超级管理员',1,NULL,NULL,NULL,'admin','ZKEASOFT','2021-03-06 22:16:30.963');
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
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_Manage',1,'管理系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_View',1,'查看系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Manage',1,'管理文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:18:40.493','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Publish',1,'发布文章',NULL,'文章',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.820','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_View',1,'查看文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:17:59.120','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_Manage',1,'管理文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:22:24.887','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_View',1,'查看文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:19:54.500','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_Manage',1,'管理焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:45:46.190','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_View',1,'查看焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.097','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_Manage',1,'管理回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.053','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_View',1,'查看回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.050','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Config_Currency',1,'Currency',NULL,'Setting',NULL,'admin','ZKEASOFT','2021-03-06 22:16:30.727','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventViewer_Manage',1,'查看错误日志',NULL,'设置',NULL,'admin','ZKEASOFT','2017-07-11 15:43:52.147','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_Manage',1,'管理表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_View',1,'查看表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.830','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Export',1,'导出表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.853','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Manage',1,'管理表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.850','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_View',1,'查看表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Language_Manage',1,'翻译',NULL,'设置',NULL,'admin','ZKEASOFT','2017-11-17 11:47:13.093','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_Manage',1,'管理布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:43:52.697','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_View',1,'查看布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.690','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('LiveChatScript_Manage',1,'设置在线客服代码',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_Manage',1,'管理媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.553','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_View',1,'查看媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.090','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_Manage',1,'管理留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.980','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_View',1,'查看留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.960','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('MessageNotification_Manage',1,'管理通知邮箱',NULL,'留言评论',NULL,'admin','ZKEASOFT','2018-08-15 15:25:42.620','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_Manage',1,'管理导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:40:38.230','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_View',1,'查看导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:38:21.943','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Manage',1,'Manage Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Refund',1,'Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_View',1,'View Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderPayment',1,'View Transactions',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderRefund',1,'View Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_Manage',1,'管理页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 13:41:08.463','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_View',1,'查看页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.683','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Payment_Config_Manage',1,'Payment Setting',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Plugin_View',1,'插件',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.727','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Manage',1,'Manage Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Publish',1,'Publish Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_View',1,'View Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.657','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_Manage',1,'Manage Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_View',1,'View Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_Manage',1,'Manage Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_View',1,'View Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('RobotsSetting',1,'Robots.txt',NULL,'设置',NULL,'admin','ZKEASOFT','2018-08-12 22:51:30.340','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_Manage',1,'管理角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_View',1,'查看角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.660','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SMTPSetting',1,'邮箱设置',NULL,'设置',NULL,'admin','ZKEASOFT','2018-06-12 19:13:49.497','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('StatisticsScript_Manage',1,'设置访客统计代码',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Template_Manage',1,'管理模板',NULL,'页面布局',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.307','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Template_View',1,'管理模板',NULL,'页面布局',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.303','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('TemplateImporter_Import',1,'Import Html Template',NULL,'Setting',NULL,'admin','ZKEASOFT','2020-03-14 11:41:54.510','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_Manage',1,'管理主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:42:48.600','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_View',1,'查看主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.083','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_Manage',1,'管理URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.170','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_View',1,'查看URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.120','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_Manage',1,'管理用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_View',1,'查看用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1061019b1bcd4bf3aeb3df647c74c309','#','~/product','产品',1,NULL,NULL,1,3,'admin','ZKEASOFT','2016-03-10 23:33:03.653','admin','ZKEASOFT','2017-10-15 18:05:28.830');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6beb1a2a54b947179ec20dd331e375a2','#','~/index','首页',0,NULL,NULL,1,1,'admin',NULL,'2015-09-01 09:55:20.483','admin','ZKEASOFT','2017-10-15 18:05:28.820');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('7b5bb24dea6d47618ed027190b4e5d94','#','~/contact','联系我们',0,NULL,NULL,1,5,'admin','ZKEASOFT','2017-03-19 21:06:21.360','admin','ZKEASOFT','2017-10-15 18:05:28.833');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d122a50356bf46c8a8c8349612145e24','#','~/questionnaire','问卷调查',0,NULL,NULL,1,4,'admin','ZKEASOFT','2017-10-15 18:05:25.947','admin','ZKEASOFT','2017-10-15 18:05:28.837');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e4658e8af8434a05b773b666c6c67cd5','#','~/article','新闻',1,NULL,NULL,1,2,'admin','ZKEASOFT','2016-03-10 23:32:53.000','admin','ZKEASOFT','2017-10-15 18:05:28.827');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('-- City --','zh-CN','-- 选择市 --',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('-- District --','zh-CN','-- 选择区 --',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('-- Province --','zh-CN','-- 选择省 --',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('--- Select ---','zh-CN','---请选择---',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('-- Select --','zh-CN','-- 请选择 --',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('_Site Search','zh-CN','_站内搜索',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is already exists','zh-CN','{0} 已存在',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is invalid','en-GB','{0} is invalid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is invalid','en-US','{0} is invalid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is invalid','zh-CN','{0}不正确',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is not correct.','zh-CN','{0}错误',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is required','en-GB','{0} is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is required','en-US','{0} is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is required','zh-CN','请输入{0}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} length should be between {1} to {2}','zh-CN','{0}的长度应大于{1}且小于{2}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} length should be greater than {1}','zh-CN','{0}的长度应大于{1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} length should be less than {1}','zh-CN','{0}的长度应小于或等于{1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} length should in range({0}-{1})','zh-CN','{0}的长度应大于{1}且小于{2}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} should in range({1}-{2})','zh-CN','{0}的值范围应在{1}-{2}之间',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('3 Columns','zh-CN','3 列',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('4 Columns','zh-CN','4 列',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Absolute','zh-CN','绝对',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Account','zh-CN','账号',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Account Center','en-GB','Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Account Center','en-US','Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Account Center','zh-CN','个人中心',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Action','en-GB','Action',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Action','en-US','Action',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Action','zh-CN','操作',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Active','en-GB','Active',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Active','en-US','Active',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Active','zh-CN','有效',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add','en-GB','Add',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add','en-US','Add',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add','zh-CN','添加',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Content','en-GB','Add Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Content','en-US','Add Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Content','zh-CN','添加内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Link','zh-CN','添加链接',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Margin','en-GB','Padding',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Margin','en-US','Padding',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Margin','zh-CN','增加边距',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Paragraph','zh-CN','添加段落',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Picture','zh-CN','添加图片',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Text','zh-CN','添加文字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Title','zh-CN','添加标题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add To Cart','zh-CN','加入购物车',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Video','zh-CN','添加视频',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Administrator','zh-CN','后台管理员',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AdminSignViewModel@PassWord','en-US','Password','AdminSignViewModel','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AdminSignViewModel@PassWord','zh-CN','密码','AdminSignViewModel','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AdminSignViewModel@UserID','en-US','User','AdminSignViewModel','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AdminSignViewModel@UserID','zh-CN','用户名',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('After change the password, please sign in use the new password','zh-CN','密码修改成功以后将直接跳转到登录页面，请使用新密码登录',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('After index the content then you can search by keywords','zh-CN','网站的页面必须要先经过索引才会出现在搜索结果中，新增、修改了网站内容需更新索引。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Alert Box','zh-CN','消息框',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Aligh Right','zh-CN','右对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align','zh-CN','对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Bottom','zh-CN','底部对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left','en-GB','Align Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left','en-US','Align Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left','zh-CN','左对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left Bottom','zh-CN','左下对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left Top','zh-CN','左上对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right','en-GB','Align Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right','en-US','Align Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right','zh-CN','右对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right Bottom','zh-CN','右下对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right Top','zh-CN','右上对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Top','zh-CN','顶部对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AliPay','zh-CN','支付宝支付',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Alipay Setting','en-GB','Alipay',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Alipay Setting','en-US','Alipay',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Alipay Setting','zh-CN','支付宝集成设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','en-GB','Alipay Public Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','en-US','Alipay Public Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','zh-CN','应用公钥','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','en-GB','App','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','en-US','App','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','zh-CN','AppId',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Environment','zh-CN','环境',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','en-GB','Gatewayurl','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','en-US','Gatewayurl','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','zh-CN','支付宝网关','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsEnable','zh-CN','是否启用',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','en-GB','Is Key From File','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','en-US','Is Key From File','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','zh-CN','IsKeyFromFile','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','en-GB','Private Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','en-US','Private Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','zh-CN','应用私钥',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PublicKey','zh-CN','应用公钥',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','en-GB','Sign Type','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','en-US','Sign Type','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','zh-CN','SignType','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','en-GB','Uid','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','en-US','Uid','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','zh-CN','商户UID','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('All','en-GB','All',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('All','en-US','All',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('All','zh-CN','全部',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Always horizontally','zh-CN','总是水平排列',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Amount','zh-CN','金额',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('And','en-GB','And',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('And','en-US','And',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('And','zh-CN','并且',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Append ''.html''','en-GB','Append ''.html''',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Append ''.html''','en-US','Append ''.html''',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Append ''.html''','zh-CN','转为伪静态路径',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@ActionType','zh-CN','ActionType','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreateBy','zh-CN','CreateBy','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreatebyName','en-US','Create By','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreatebyName','zh-CN','创建人','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreateDate','en-US','Create Date','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreateDate','zh-CN','创建日期','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Description','zh-CN','描述','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateBy','zh-CN','LastUpdateBy','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateByName','en-US','Last Update By','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateByName','zh-CN','更新人','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateDate','en-US','Last Update Date','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateDate','zh-CN','更新日期','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@SettingKey','en-US','Setting Key','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@SettingKey','zh-CN','键','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Status','en-US','Status','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Status','zh-CN','状态','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Title','zh-CN','标题','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Value','en-US','Value','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Value','zh-CN','值','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article','zh-CN','文章',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Category','en-GB','Article Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Category','en-US','Article Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Category','zh-CN','文章类别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Detail','en-GB','Article Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Detail','en-US','Article Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Detail','zh-CN','文章内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Gallery','zh-CN','文章组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article keywords','en-GB','Article keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article keywords','en-US','Article keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article keywords','zh-CN','文章关键字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article List','en-GB','Article List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article List','en-US','Article List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article List','zh-CN','文章列表',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Manager','en-GB','Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Manager','en-US','Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Manager','zh-CN','文章管理',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article News','en-GB','News',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article News','en-US','News',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article News','zh-CN','新闻资讯',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Summary','en-GB','Article Summary',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Summary','en-US','Article Summary',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Summary','zh-CN','文章概览',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ActionType','zh-CN','ActionType','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@AssemblyName','zh-CN','AssemblyName','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CreateBy','zh-CN','CreateBy','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CreatebyName','zh-CN','创建人','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CreateDate','zh-CN','创建日期','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CustomClass','zh-CN','CustomClass','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CustomerClass','zh-CN','CustomerClass','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CustomStyle','zh-CN','CustomStyle','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Description','zh-CN','描述','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ExtendData','zh-CN','ExtendData','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ExtendFields','zh-CN','扩展属性','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@FormView','zh-CN','FormView','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ID','zh-CN','ID','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@IsSystem','zh-CN','IsSystem','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@IsTemplate','zh-CN','保存为模板','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@LastUpdateByName','zh-CN','更新人','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@LastUpdateDate','zh-CN','更新日期','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@LayoutID','zh-CN','LayoutID','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@PageID','zh-CN','PageID','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@PartialView','zh-CN','显示模板','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Position','zh-CN','排序','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Status','zh-CN','状态','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@StyleClass','zh-CN','自定义样式','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Thumbnail','zh-CN','缩略图','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Title','zh-CN','标题','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@WidgetName','zh-CN','组件名称','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ZoneID','zh-CN','区域','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ActionType','zh-CN','ActionType','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ArticleContent','zh-CN','文章内容','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ArticleTypeID','en-GB','Article Type','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ArticleTypeID','en-US','Article Type','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ArticleTypeID','zh-CN','文章类别','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Counter','zh-CN','阅读次数','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateBy','zh-CN','CreateBy','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','en-GB','Create By','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','en-US','Create By','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','zh-CN','创建人','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','en-GB','Create Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','en-US','Create Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','zh-CN','创建日期','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Description','zh-CN','描述','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ExtendFields','zh-CN','扩展属性','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ID','en-US','ID','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ID','zh-CN','ID','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ImageThumbUrl','zh-CN','缩略图','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ImageUrl','zh-CN','图片','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','en-GB','Is Publish','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','en-US','Is Publish','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','zh-CN','已发布?','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateBy','zh-CN','LastUpdateBy','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateByName','en-GB','Last Update By','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateByName','en-US','Last Update By','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateByName','zh-CN','更新人','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateDate','en-GB','Last Update Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateDate','en-US','Last Update Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateDate','zh-CN','更新日期','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@MetaDescription','zh-CN','SEO描述','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@MetaKeyWords','zh-CN','SEO关键字','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@PublishDate','zh-CN','发布日期','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ReturnUrl','zh-CN','ReturnUrl','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Status','zh-CN','状态','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Summary','zh-CN','概述','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Title','en-GB','Title','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Title','en-US','Title','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Title','zh-CN','标题','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Url','zh-CN','英文名','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleGalleryWidget@ArticleGalleryId','zh-CN','文章组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleGalleryWidget@DetailPageUrl','zh-CN','详细页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ActionType','zh-CN','ActionType','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ArticleCategoryID','zh-CN','ArticleCategoryID','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ArticleTypeID','zh-CN','文章类别','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@AssemblyName','zh-CN','AssemblyName','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CreateBy','zh-CN','CreateBy','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CreatebyName','zh-CN','创建人','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CreateDate','zh-CN','创建日期','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CustomClass','zh-CN','CustomClass','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CustomStyle','zh-CN','CustomStyle','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Description','zh-CN','描述','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@DetailPageUrl','zh-CN','详细页面','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ExtendData','zh-CN','ExtendData','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ExtendFields','zh-CN','扩展属性','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@FormView','zh-CN','FormView','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ID','zh-CN','ID','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@IsPageable','zh-CN','分页?','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@IsSystem','zh-CN','IsSystem','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@IsTemplate','zh-CN','保存为模板','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@LastUpdateByName','zh-CN','更新人','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@LastUpdateDate','zh-CN','更新日期','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@LayoutID','zh-CN','LayoutID','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@PageID','zh-CN','PageID','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@PageSize','zh-CN','分页大小','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@PartialView','zh-CN','显示模板','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Position','zh-CN','排序','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Status','zh-CN','状态','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@StyleClass','zh-CN','自定义样式','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Thumbnail','zh-CN','缩略图','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Title','zh-CN','标题','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@WidgetName','zh-CN','组件名称','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ZoneID','zh-CN','区域','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Articles','zh-CN','文章',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ArticleId','zh-CN','文章ID','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ArticleName','zh-CN','文章英文名','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@AssemblyName','zh-CN','Assembly Name','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@IsSystem','zh-CN','Is System','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@IsTemplate','zh-CN','保存为模板','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@PartialView','zh-CN','显示模板','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Position','zh-CN','排序','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ServiceTypeName','zh-CN','Service Type Name','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@StyleClass','zh-CN','自定义样式','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Thumbnail','zh-CN','缩略图','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Title','zh-CN','标题','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ViewModelTypeName','zh-CN','View Model Type Name','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@WidgetName','zh-CN','组件名称','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ZoneID','zh-CN','区域','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ActionType','zh-CN','ActionType','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@AssemblyName','zh-CN','AssemblyName','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CreateBy','zh-CN','CreateBy','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CreatebyName','zh-CN','创建人','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CreateDate','zh-CN','创建日期','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CustomClass','zh-CN','CustomClass','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CustomStyle','zh-CN','CustomStyle','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Description','zh-CN','描述','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@DetailLink','zh-CN','详细页面','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ExtendData','zh-CN','ExtendData','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ExtendFields','zh-CN','扩展属性','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@FormView','zh-CN','FormView','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ID','zh-CN','ID','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@IsSystem','zh-CN','IsSystem','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@IsTemplate','zh-CN','保存为模板','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@LastUpdateByName','zh-CN','更新人','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@LastUpdateDate','zh-CN','更新日期','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@LayoutID','zh-CN','布局','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@PageID','zh-CN','页面','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@PartDriver','zh-CN','PartDriver','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@PartialView','zh-CN','显示模板','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Position','zh-CN','排序','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Status','zh-CN','状态','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Style','zh-CN','样式','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@StyleClass','zh-CN','自定义样式','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@SubTitle','zh-CN','子标题','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Summary','zh-CN','概述','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Thumbnail','zh-CN','缩略图','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Title','zh-CN','标题','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@WidgetName','zh-CN','组件名称','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ZoneID','zh-CN','区域','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ActionType','zh-CN','ActionType','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ArticleTypeID','zh-CN','文章类别','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@AssemblyName','zh-CN','AssemblyName','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CreateBy','zh-CN','CreateBy','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CreatebyName','zh-CN','创建人','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CreateDate','zh-CN','创建日期','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CustomClass','zh-CN','CustomClass','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CustomStyle','zh-CN','CustomStyle','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Description','zh-CN','描述','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@DetailPageUrl','zh-CN','详细页面','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ExtendData','zh-CN','ExtendData','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ExtendFields','zh-CN','扩展属性','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@FormView','zh-CN','FormView','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ID','zh-CN','ID','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@IsSystem','zh-CN','IsSystem','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@IsTemplate','zh-CN','保存为模板','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@LastUpdateByName','zh-CN','更新人','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@LastUpdateDate','zh-CN','更新日期','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@LayoutID','zh-CN','LayoutID','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@MoreLink','zh-CN','更多页面','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@PageID','zh-CN','PageID','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@PartDriver','zh-CN','PartDriver','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@PartialView','zh-CN','显示模板','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Position','zh-CN','排序','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Status','zh-CN','状态','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@StyleClass','zh-CN','自定义样式','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@SubTitle','zh-CN','子标题','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Thumbnail','zh-CN','缩略图','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Title','zh-CN','标题','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Tops','zh-CN','置顶数','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@WidgetName','zh-CN','组件名称','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ZoneID','zh-CN','区域','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@ActionType','zh-CN','ActionType','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@CreateBy','zh-CN','CreateBy','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@CreatebyName','zh-CN','创建人','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@CreateDate','zh-CN','创建日期','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@Description','zh-CN','描述','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@ID','zh-CN','ID','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@LastUpdateBy','zh-CN','LastUpdateBy','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@LastUpdateByName','zh-CN','更新人','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@LastUpdateDate','zh-CN','更新日期','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@ParentID','zh-CN','ParentID','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','en-GB','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','en-US','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','zh-CN','SEO描述','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','zh-TW','SEO描述',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','en-GB','SEO Key Word',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','en-US','SEO Key Word',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','zh-CN','SEO关键字','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','zh-TW','SEO關鍵字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','en-GB','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','en-US','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','zh-CN','SEO标题','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','zh-TW','SEO標題',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@Status','zh-CN','状态','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@Title','zh-CN','标题','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@Url','zh-CN','英文名','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ActionType','zh-CN','ActionType','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ArticleTypeID','zh-CN','文章类别','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@AssemblyName','zh-CN','AssemblyName','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CreateBy','zh-CN','CreateBy','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CreatebyName','zh-CN','创建人','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CreateDate','zh-CN','创建日期','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CustomClass','zh-CN','CustomClass','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CustomStyle','zh-CN','CustomStyle','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Description','zh-CN','描述','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ExtendFields','zh-CN','扩展属性','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@FormView','zh-CN','FormView','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ID','zh-CN','ID','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@IsSystem','zh-CN','IsSystem','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@IsTemplate','zh-CN','保存为模板','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@LastUpdateByName','zh-CN','更新人','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@LastUpdateDate','zh-CN','更新日期','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@LayoutID','zh-CN','LayoutID','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@PageID','zh-CN','PageID','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@PartialView','zh-CN','显示模板','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Position','zh-CN','排序','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Status','zh-CN','状态','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@StyleClass','zh-CN','自定义样式','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@TargetPage','zh-CN','详细页面','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Thumbnail','zh-CN','缩略图','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Title','zh-CN','标题','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@WidgetName','zh-CN','组件名称','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ZoneID','zh-CN','区域','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Assembly','zh-CN','程序集',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Attachment','zh-CN','附件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Attention','zh-CN','注意事项',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','en-GB','Client','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','en-US','Client','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','zh-CN','APP ID','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','en-GB','Client Secret','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','en-US','Client Secret','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','zh-CN','APP Key','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Auto','zh-CN','自动',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Avatar','en-GB','Avatar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Avatar','en-US','Avatar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Avatar','zh-CN','头像',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Background','zh-CN','背景',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Background Image','zh-CN','背景图',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Baidu Map','en-GB','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Baidu Map','en-US','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Baidu Map','zh-CN','百度地图',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ApplicationKey','zh-CN','服务密钥(AK)','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@AssemblyName','zh-CN','Assembly Name','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Height','zh-CN','地图高度(px)','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Instruction','zh-CN','相关链接','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@IsSystem','zh-CN','Is System','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@IsTemplate','zh-CN','保存为模板','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@LocationPoint','zh-CN','位置坐标','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@PartialView','zh-CN','显示模板','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Position','zh-CN','排序','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ServiceTypeName','zh-CN','Service Type Name','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@StyleClass','zh-CN','自定义样式','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@TagSummary','zh-CN','标注说明','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@TagTitle','zh-CN','标注','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Thumbnail','zh-CN','缩略图','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Title','zh-CN','标题','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ViewModelTypeName','zh-CN','View Model Type Name','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@WidgetName','zh-CN','组件名称','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ZoneID','zh-CN','区域','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Banner','zh-CN','横幅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Basis','en-GB','Basis',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Basis','en-US','Basis',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Basis','zh-CN','基础',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Basket','zh-CN','购物车',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Biography','en-GB','Biography',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Biography','en-US','Biography',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Biography','zh-CN','简介',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@AssemblyName','zh-CN','Assembly Name','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Content','zh-CN','详细信息','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@IsSystem','zh-CN','Is System','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@IsTemplate','zh-CN','保存为模板','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Name','zh-CN','名称','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Others','zh-CN','其它','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@PartialView','zh-CN','显示模板','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Photo','zh-CN','照片','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Position','zh-CN','排序','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@ServiceTypeName','zh-CN','Service Type Name','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@StyleClass','zh-CN','自定义样式','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Thumbnail','zh-CN','缩略图','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Title','zh-CN','标题','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@ViewModelTypeName','zh-CN','View Model Type Name','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@WidgetName','zh-CN','组件名称','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@ZoneID','zh-CN','区域','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Blink','zh-CN','闪烁',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Bold','zh-CN','粗体',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Bolder','zh-CN','超粗体',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border','zh-CN','边框',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border Radius','zh-CN','圆角',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border Width','zh-CN','边宽',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border(Empty Zone)','en-GB','Border(Empty Zone)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border(Empty Zone)','en-US','Border(Empty Zone)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border(Empty Zone)','zh-CN','边框(显示空区域)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Box Blur','zh-CN','模糊',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Box Horizontal','zh-CN','水平大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Box Vertical','zh-CN','垂直大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Breadcrumbs','en-GB','Breadcrumbs',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Breadcrumbs','en-US','Breadcrumbs',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Breadcrumbs','zh-CN','路径导航',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ActionType','zh-CN','ActionType','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@AssemblyName','zh-CN','AssemblyName','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CreateBy','zh-CN','CreateBy','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CreatebyName','zh-CN','创建人','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CreateDate','zh-CN','创建日期','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CustomClass','zh-CN','CustomClass','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CustomStyle','zh-CN','CustomStyle','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Description','zh-CN','描述','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ExtendData','zh-CN','ExtendData','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ExtendFields','zh-CN','扩展属性','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@FormView','zh-CN','FormView','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ID','zh-CN','ID','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@IsLinkAble','zh-CN','IsLinkAble','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@IsSystem','zh-CN','IsSystem','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@IsTemplate','zh-CN','保存为模板','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@LastUpdateBy','zh-CN','LastUpdateBy','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@LastUpdateByName','zh-CN','更新人','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@LastUpdateDate','zh-CN','更新日期','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@LayoutID','zh-CN','布局','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@PageID','zh-CN','页面','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@PartialView','zh-CN','显示模板','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Position','zh-CN','排序','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ServiceTypeName','zh-CN','ServiceTypeName','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Status','zh-CN','状态','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@StyleClass','zh-CN','自定义样式','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Thumbnail','zh-CN','缩略图','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Title','zh-CN','标题','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@WidgetName','zh-CN','组件名称','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ZoneID','zh-CN','区域','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Button','zh-CN','按钮',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Can not delete yourself.','zh-CN','不能删除当前登录用户',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cancel','en-GB','Cancel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cancel','en-US','Cancel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cancel','zh-CN','取消',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Capitalize','zh-CN','首字母大写',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Captcha','zh-CN','验证码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Carousel','en-GB','Carousel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Carousel','en-US','Carousel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Carousel','zh-CN','焦点图',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@ActionType','zh-CN','ActionType','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','en-GB','Carousel Items','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','en-US','Carousel Items','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','zh-CN','滚动图','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateBy','zh-CN','CreateBy','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreatebyName','en-GB','Create By','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreatebyName','en-US','Create By','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreatebyName','zh-CN','创建人','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateDate','en-GB','Create Date','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateDate','en-US','Create Date','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateDate','zh-CN','创建日期','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Description','en-GB','Description','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Description','en-US','Description','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Description','zh-CN','描述','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Height','zh-CN','高度(px)','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@ID','zh-CN','ID','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateBy','zh-CN','LastUpdateBy','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateByName','en-GB','Last Update By','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateByName','en-US','Last Update By','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateByName','zh-CN','更新人','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateDate','en-GB','Last Update Date','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateDate','en-US','Last Update Date','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateDate','zh-CN','更新日期','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Status','en-GB','Status','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Status','en-US','Status','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Status','zh-CN','状态','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Title','en-GB','Title','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Title','en-US','Title','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Title','zh-CN','标题','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ActionType','zh-CN','ActionType','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CarouselID','en-GB','Carousel','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CarouselID','en-US','Carousel','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CarouselID','zh-CN','焦点图','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CarouselWidgetID','zh-CN','CarouselWidgetID','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CreateBy','zh-CN','CreateBy','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CreatebyName','zh-CN','创建人','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CreateDate','zh-CN','创建日期','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Description','zh-CN','描述','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ID','zh-CN','ID','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ImageUrl','en-GB','Image Url','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ImageUrl','en-US','Image Url','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ImageUrl','zh-CN','图片','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@LastUpdateBy','zh-CN','LastUpdateBy','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@LastUpdateByName','zh-CN','更新人','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@LastUpdateDate','zh-CN','更新日期','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Status','en-GB','Status','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Status','en-US','Status','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Status','zh-CN','状态','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@TargetLink','en-GB','Target Link','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@TargetLink','en-US','Target Link','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@TargetLink','zh-CN','链接','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Title','en-GB','Title','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Title','en-US','Title','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Title','zh-CN','标题','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ActionType','zh-CN','ActionType','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@AssemblyName','zh-CN','AssemblyName','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CarouselID','zh-CN','共享焦点图','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CarouselItems','zh-CN','滚动图','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CreateBy','zh-CN','CreateBy','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CreatebyName','zh-CN','创建人','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CreateDate','zh-CN','创建日期','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CustomClass','zh-CN','CustomClass','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CustomStyle','zh-CN','CustomStyle','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Description','zh-CN','描述','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ExtendFields','zh-CN','扩展属性','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@FormView','zh-CN','FormView','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ID','zh-CN','ID','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@IsSystem','zh-CN','IsSystem','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@IsTemplate','zh-CN','保存为模板','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@LastUpdateBy','zh-CN','LastUpdateBy','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@LastUpdateByName','zh-CN','更新人','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@LastUpdateDate','zh-CN','更新日期','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@LayoutID','zh-CN','LayoutID','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@PageID','zh-CN','PageID','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@PartialView','zh-CN','显示模板','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Position','zh-CN','排序','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ServiceTypeName','zh-CN','ServiceTypeName','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Status','zh-CN','状态','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@StyleClass','zh-CN','自定义样式','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Thumbnail','zh-CN','缩略图','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Title','zh-CN','标题','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@WidgetName','zh-CN','组件名称','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ZoneID','zh-CN','区域','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Case Sensitivity','zh-CN','大小写',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cell phone','en-GB','Cell phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cell phone','en-US','Cell phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cell phone','zh-CN','手机',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Center','en-GB','Center',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Center','en-US','Center',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Center','zh-CN','居中',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Change Password','en-GB','Change Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Change Password','en-US','Change Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Change Password','zh-CN','修改密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Chat Script','zh-CN','在线客服代码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Check','zh-CN','检查',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Check Out','zh-CN','结 算',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Check the email','zh-CN','查收邮件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Check your pages for SEO','zh-CN','扫描您的页面，我们将为您提供一些SEO优化建议：',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Checkbox','zh-CN','复选框',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Class prefix','zh-CN','类前缀',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to','en-GB','Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to the page.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to','en-US','Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to the page.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to','zh-CN','点击主题“缩略图”可进行进行预览，在预览页面右上角点击“退出主题预览”可回到该页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click the radio button to switch the theme','en-GB','Click the radio button to switch the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click the radio button to switch the theme','en-US','Click the radio button to switch the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click the radio button to switch the theme','zh-CN','点击单选框进行主题切换',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click to select','zh-CN','点击选择该区域',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Close','en-GB','Close',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Close','en-US','Close',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Close','zh-CN','关闭',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CMS Plugins','en-GB','Plugins',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CMS Plugins','en-US','Plugins',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CMS Plugins','zh-CN','扩展插件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Code','zh-CN','代码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapse','en-GB','Collapse',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapse','en-US','Collapse',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapse','zh-CN','收起',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapse','zh-TW','收起',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapsed to start, horizontal above breakpoints','zh-CN','开始是堆叠在一起的，当大于这些阈值时将变为水平排列',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Color','zh-CN','颜色',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Column','zh-CN','列',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Column Width','en-GB','Column',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Column Width','en-US','Column',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Column Width','zh-CN','列宽',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Columns','zh-CN','列数',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comment Box','en-GB','Comment Box',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comment Box','en-US','Comment Box',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comment Box','zh-CN','评论箱',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments','zh-CN','评论',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@ActionType','zh-CN','ActionType','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Agrees','zh-CN','赞同数','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','en-GB','Comment Content','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','en-US','Comment Content','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','zh-CN','评论内容','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateBy','zh-CN','CreateBy','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','en-GB','Create By','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','en-US','Create By','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','zh-CN','创建人','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','en-GB','Create Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','en-US','Create Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','zh-CN','创建日期','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Description','zh-CN','描述','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Disagrees','zh-CN','反对数','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@ID','zh-CN','ID','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateBy','zh-CN','LastUpdateBy','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateByName','en-GB','Last Update By','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateByName','en-US','Last Update By','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateByName','zh-CN','更新人','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateDate','en-GB','Last Update Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateDate','en-US','Last Update Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateDate','zh-CN','更新日期','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@PagePath','zh-CN','页面地址','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Picture','zh-CN','Picture','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Status','en-GB','Status','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Status','en-US','Status','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Status','zh-CN','状态','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Title','en-GB','Title','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Title','en-US','Title','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Title','zh-CN','标题','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@UserId','zh-CN','登录名','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@UserName','zh-CN','用户名','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ActionType','zh-CN','ActionType','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@AssemblyName','zh-CN','AssemblyName','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CreateBy','zh-CN','CreateBy','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CreatebyName','zh-CN','创建人','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CreateDate','zh-CN','创建日期','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CustomClass','zh-CN','CustomClass','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CustomStyle','zh-CN','CustomStyle','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Description','zh-CN','描述','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ExtendData','zh-CN','ExtendData','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@FormView','zh-CN','FormView','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ID','zh-CN','ID','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@IsSystem','zh-CN','IsSystem','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@IsTemplate','zh-CN','保存为模板','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@LastUpdateBy','zh-CN','LastUpdateBy','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@LastUpdateByName','zh-CN','更新人','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@LastUpdateDate','zh-CN','更新日期','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@LayoutID','zh-CN','LayoutID','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@PageID','zh-CN','PageID','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@PartialView','zh-CN','显示模板','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Position','zh-CN','排序','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ServiceTypeName','zh-CN','ServiceTypeName','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Status','zh-CN','状态','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@StyleClass','zh-CN','自定义样式','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Thumbnail','zh-CN','缩略图','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Title','zh-CN','标题','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@WidgetName','zh-CN','组件名称','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ZoneID','zh-CN','区域','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('commit','en-GB','Comment',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('commit','en-US','Comment',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('commit','zh-CN','评论',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Company News','zh-CN','公司新闻',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Complete','zh-CN','完成',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Completed updating the index','zh-CN','完成更新索引',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Confirm Password','en-GB','Confirm Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Confirm Password','en-US','Confirm Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Confirm Password','zh-CN','确认密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contact','zh-CN','联系人',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contact Info','zh-CN','联系人信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contact/Consignee','zh-CN','联系人/收货人',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('contain','zh-CN','容纳',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Container','en-GB','Container',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Container','en-US','Container',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Container','zh-CN','容器',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contains','en-GB','Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contains','en-US','Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contains','zh-CN','包含',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content','en-GB','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content','en-US','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content','zh-CN','内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content Category','en-GB','Content Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content Category','en-US','Content Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content Category','zh-CN','内容类型',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content Group','zh-CN','内容分组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@FieldType','zh-CN','字段类型','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Name','zh-CN','属性名','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Order','zh-CN','订单','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Status','en-GB','Status','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Status','en-US','Status','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Title','zh-CN','显示名称','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreatebyName','en-GB','Create By','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreatebyName','en-US','Create By','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreatebyName','zh-CN','创建人','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreateDate','en-GB','Create Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreateDate','en-US','Create Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreateDate','zh-CN','创建日期','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Description','en-GB','Description','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Description','en-US','Description','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Description','zh-CN','描述','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@ID','zh-CN','ID','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateByName','en-GB','Last Update By','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateByName','en-US','Last Update By','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateByName','zh-CN','更新人','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateDate','en-GB','Last Update Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateDate','en-US','Last Update Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateDate','zh-CN','更新日期','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Status','en-GB','Status','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Status','en-US','Status','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Status','zh-CN','状态','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Template','zh-CN','模板代码','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Title','en-GB','Title','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Title','en-US','Title','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Title','zh-CN','标题','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreatebyName','en-GB','Create By','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreatebyName','en-US','Create By','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreatebyName','zh-CN','创建人','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreateDate','en-GB','Create Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreateDate','en-US','Create Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreateDate','zh-CN','创建日期','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Description','en-GB','Description','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Description','en-US','Description','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Description','zh-CN','描述','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Fields','zh-CN','字段','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@ID','zh-CN','ID','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateByName','en-GB','Last Update By','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateByName','en-US','Last Update By','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateByName','zh-CN','更新人','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateDate','en-GB','Last Update Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateDate','en-US','Last Update Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateDate','zh-CN','更新日期','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Status','en-GB','Status','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Status','en-US','Status','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Status','zh-CN','状态','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Title','en-GB','Title','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Title','en-US','Title','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Title','zh-CN','标题','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@ContentTypeID','zh-CN','Content Type','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@CreatebyName','en-US','Create By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@CreatebyName','zh-CN','创建人','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@CreateDate','en-US','Create Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@CreateDate','zh-CN','创建日期','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Description','zh-CN','描述','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@ID','zh-CN','ID','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@LastUpdateByName','en-US','Update By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@LastUpdateByName','zh-CN','更新人','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@LastUpdateDate','en-US','Last Update Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@LastUpdateDate','zh-CN','更新日期','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEODescription','en-US','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEODescription','zh-CN','SEO描述','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEOKeyWord','en-US','SEO Keyword',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEOKeyWord','zh-CN','SEO关键字','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEOTitle','en-US','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEOTitle','zh-CN','SEO标题','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Status','en-US','Status','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Status','zh-CN','状态','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Title','en-US','Title','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Title','zh-CN','标题','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Url','zh-CN','英文名','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Context Menu','en-GB','Menu',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Context Menu','en-US','Menu',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Context Menu','zh-CN','右键菜单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Continue','zh-CN','继续',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Copy','en-GB','Copy',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Copy','en-US','Copy',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Copy','zh-CN','复制',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Copy from page','zh-CN','从现有页面复制',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('cover','zh-CN','覆盖',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Create page from template','zh-CN','从模板中快速创建页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CreatebyName','zh-CN','创建人',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CreateDate','zh-CN','创建日期',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Crosshair','zh-CN','十字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@CreatebyName','zh-CN','创建人','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@CreateDate','zh-CN','创建日期','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@CultureCode','zh-CN','语言缩写','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@CultureID','zh-CN','CultureID','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Description','zh-CN','描述','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@DisplayName','zh-CN','显示名称','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Domain','zh-CN','域名','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@EnglishName','zh-CN','英文名','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Flag','zh-CN','旗帜','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@LastUpdateByName','zh-CN','更新人','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@LastUpdateDate','zh-CN','更新日期','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@LCID','zh-CN','LCID','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Status','zh-CN','状态','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Title','zh-CN','标题','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@UrlCode','zh-CN','Url缩写','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@CultureMode','en-GB','Culture Mode','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@CultureMode','en-US','Culture Mode','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@CultureMode','zh-CN','多语言模式','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@DefaultCulture','en-GB','Default Culture','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@DefaultCulture','en-US','Default Culture','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@DefaultCulture','zh-CN','默认语言','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsEnable','en-GB','Is Enable','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsEnable','en-US','Is Enable','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsEnable','zh-CN','是否启用？','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsShowDefault','en-GB','Is Show Default','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsShowDefault','en-US','Is Show Default','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsShowDefault','zh-CN','无内容时使用默认语言？','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Currency','zh-CN','货币',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CurrencyOption@CurrencyID','zh-CN','货币',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Current','zh-CN','当前',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Current password error.','zh-CN','当前密码错误',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom','zh-CN','自定义',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Fields','zh-CN','自定义字段',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Rule','en-GB','Rule',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Rule','en-US','Rule',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Rule','zh-CN','定义条件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Validation','zh-CN','自定义验证',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Customer','zh-CN','前端用户',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Danger','zh-CN','危险',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dashed','zh-CN','虚线',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Data Source','en-GB','Data Source',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Data Source','en-US','Data Source',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Data Source','zh-CN','内容来源',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Database Cache','zh-CN','数据库缓存',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@CreateBy','zh-CN','CreateBy','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@CreatebyName','zh-CN','创建人','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@CreateDate','zh-CN','创建日期','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Description','zh-CN','描述','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@DicName','zh-CN','DicName','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@DicValue','zh-CN','DicValue','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@ID','zh-CN','ID','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@ImageThumbUrl','zh-CN','缩略图','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@ImageUrl','zh-CN','图片','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@IsSystem','zh-CN','IsSystem','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@LastUpdateBy','zh-CN','LastUpdateBy','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@LastUpdateByName','zh-CN','更新人','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@LastUpdateDate','zh-CN','更新日期','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Order','zh-CN','排序','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Pid','zh-CN','Pid','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Status','zh-CN','状态','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Title','zh-CN','标题','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Date','zh-CN','日期',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ddashboard','en-GB','Dashboard',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ddashboard','en-US','Dashboard',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ddashboard','zh-CN','仪表盘',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Decoration','zh-CN','修饰',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Default','zh-CN','默认',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete','en-GB','Delete',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete','en-US','Delete',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete','zh-CN','删除',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete Current Group','zh-CN','删除当前组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete?','en-GB','Delete?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete?','en-US','Delete?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete?','zh-CN','确定删除?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Demo Video','en-GB','Videos',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Demo Video','en-US','Videos',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Demo Video','zh-CN','演示视频',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Description','en-GB','Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Description','en-US','Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Description','zh-CN','描述',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Design','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Design','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Design','zh-CN','设计',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Desktop (≥1200px)','zh-CN','大桌面显示器 (≥1200px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Desktop (≥992px)','zh-CN','桌面显示器 (≥992px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Contents','en-GB','Contents',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Contents','en-US','Contents',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Contents','zh-CN','显示内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display in page','en-GB','Display in page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display in page','en-US','Display in page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display in page','zh-CN','页面展现的内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Template','en-GB','Display Template',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Template','en-US','Display Template',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Template','zh-CN','显示模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Do you want to delete?','zh-CN','确定要删除吗？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Do you want to publish?','zh-CN','确定要发布吗？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Do you want to refund?','zh-CN','确定要退款吗？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Do you want to revert to this version?','zh-CN','确定要撤回到该版本吗？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Document','en-GB','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Document','en-US','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Document','zh-CN','文档',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Donate','en-GB','Donate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Donate','en-US','Donate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Donate','zh-CN','赞助',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dotted','zh-CN','点划线',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Double','zh-CN','双线',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download','zh-CN','下载',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Sections','en-GB','Sections',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Sections','en-US','Sections',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Sections','zh-CN','下载板块',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Theme','en-GB','Download',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Theme','en-US','Download',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Theme','zh-CN','下载更多主题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Themes','en-GB','Themes',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Themes','en-US','Themes',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Themes','zh-CN','下载主题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag','en-GB','Drag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag','en-US','Drag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag','zh-CN','拖动',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag to container','zh-CN','点击拖动到容器',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag to layout','zh-CN','点击拖动到主屏幕',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag to row','zh-CN','点击拖动到行',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dropdown','zh-CN','下拉菜单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dynamic','en-GB','Dynamic',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dynamic','en-US','Dynamic',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dynamic','zh-CN','动态',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('E-commerce','en-GB','E-commerce',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('E-commerce','en-US','E-commerce',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('E-commerce','zh-CN','电子商务',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit','zh-CN','编辑',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Chat Script','zh-CN','设置在线客服代码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Content','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Content','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Content','zh-CN','编辑内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Layout','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Layout','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Layout','zh-CN','编辑布局',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Page','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Page','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Page','zh-CN','编辑页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Pixel Script','zh-CN','设置访客统计代码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit settings','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit settings','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit settings','zh-CN','编辑设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Template','zh-CN','编辑模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit: Design page','en-GB','Edit: Design page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit: Design page','en-US','Edit: Design page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit: Design page','zh-CN','编辑：进入页面的设计模式，编辑内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Email','en-GB','Email',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Email','en-US','Email',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Email','zh-CN','邮箱',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Email is incorrect','zh-CN','邮箱地址格式不正确',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ends With','en-GB','Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ends With','en-US','Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ends With','zh-CN','以...结尾',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter a URL address to check, such as: /about/zkeacms','zh-CN','输入一个Url地址进行检查，如：/about/zkeacms',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter keyworkds to search...','zh-CN','输入关键字进行搜索...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter the keywords to search','zh-CN','输入关键字进行搜索',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your Email','zh-CN','请输入您的邮箱',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your new password','zh-CN','输入新密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your password','en-GB','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your password','en-US','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your password','zh-CN','输入密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter zone name','zh-CN','输入区域名称',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enterprise','en-GB','Enterprise',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enterprise','en-US','Enterprise',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enterprise','zh-CN','企业版',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enterprise','zh-TW','企業版',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Environment','zh-CN','环境',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Equals','en-GB','Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Equals','en-US','Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Equals','zh-CN','等于',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('e-resize','zh-CN','向右改变大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Error Message','zh-CN','错误信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Error!','zh-CN','错误！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Everything goes well.','zh-CN','一切都很好。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Example','zh-CN','示例',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Explanation','en-GB','Explanation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Explanation','en-US','Explanation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Explanation','zh-CN','说明',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Export All Data','zh-CN','导出所有数据',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Export Excel','zh-CN','导出Excel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Export Form Data','zh-CN','导出表单数据',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@ActionType','zh-CN','ActionType','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@CreateBy','zh-CN','CreateBy','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@CreatebyName','zh-CN','创建人','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@CreateDate','zh-CN','创建日期','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@Description','zh-CN','描述','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@ID','zh-CN','ID','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@LastUpdateBy','zh-CN','LastUpdateBy','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@LastUpdateByName','zh-CN','更新人','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@LastUpdateDate','zh-CN','更新日期','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@OwnerID','zh-CN','OwnerID','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@OwnerModule','zh-CN','OwnerModule','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@Status','zh-CN','状态','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@Title','zh-CN','名称','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@Value','zh-CN','值','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Female','en-GB','Female',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Female','en-US','Female',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Female','zh-CN','女',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Field Name','en-GB','Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Field Name','en-US','Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Field Name','zh-CN','属性名',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Field Setting','zh-CN','字段设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fields','zh-CN','选择字段',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('File Cache','zh-CN','文件缓存',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fixed','zh-CN','固定',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fixed Width','zh-CN','定宽',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Float','zh-CN','浮动',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Float Left','zh-CN','左浮动',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Float Right','zh-CN','右浮动',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content','en-GB','Fluid Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content','en-US','Fluid Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content','zh-CN','自定义内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content List','en-GB','Fluid Content List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content List','en-US','Fluid Content List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content List','zh-CN','自定义内容列表',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@AssemblyName','zh-CN','Assembly Name','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ContentTemplateID','zh-CN','显示模板','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ContentTypeID','zh-CN','自定义内容类型','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@DetailPageUrl','zh-CN','详细页面','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@IsPageable','zh-CN','分页?','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@IsSystem','zh-CN','Is System','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@IsTemplate','zh-CN','保存为模板','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@PageSize','zh-CN','分页大小','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@Position','zh-CN','排序','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ServiceTypeName','zh-CN','Service Type Name','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@StyleClass','zh-CN','自定义样式','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@Thumbnail','zh-CN','缩略图','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@Title','zh-CN','标题','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ViewModelTypeName','zh-CN','View Model Type Name','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@WidgetName','zh-CN','组件名称','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ZoneID','zh-CN','区域','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@AssemblyName','zh-CN','Assembly Name','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ContentTemplateID','zh-CN','显示模板','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ContentValueID','zh-CN','自定义内容','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@IsSupportQueryID','zh-CN','动态内容','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@IsSystem','zh-CN','Is System','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@IsTemplate','zh-CN','保存为模板','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@PartialView','zh-CN','显示模板','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@Position','zh-CN','排序','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ServiceTypeName','zh-CN','Service Type Name','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@StyleClass','zh-CN','自定义样式','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@Thumbnail','zh-CN','缩略图','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@Title','zh-CN','标题','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ViewModelTypeName','zh-CN','View Model Type Name','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@WidgetName','zh-CN','组件名称','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ZoneID','zh-CN','区域','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fobidden','zh-CN','没有权限',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Font','zh-CN','字体',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Font Size','zh-CN','字体大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Font Variant','zh-CN','字体变形',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Font Weight','zh-CN','字体粗细',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Forgot your password?','en-GB','Forgot your password?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Forgot your password?','en-US','Forgot your password?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Forgot your password?','zh-CN','忘记密码？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Forgotten password','zh-CN','找回密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form','en-GB','Form',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form','en-US','Form',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form','zh-CN','表单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Control Size','zh-CN','输入框尺寸',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Data','en-GB','Form Data',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Data','en-US','Form Data',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Data','zh-CN','表单数据',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Generator','en-GB','Form Generator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Generator','en-US','Form Generator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Generator','zh-CN','自定义表单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form have submited','zh-CN','表单提交成功',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@ActionType','zh-CN','ActionType','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateBy','zh-CN','CreateBy','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','en-GB','Create By','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','en-US','Create By','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','zh-CN','创建人','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','en-GB','Create Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','en-US','Create Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','zh-CN','创建日期','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Description','zh-CN','描述','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@FieldsData','zh-CN','FieldsData','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@FormFields','zh-CN','FormFields','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@ID','zh-CN','ID','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateBy','zh-CN','LastUpdateBy','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateByName','en-GB','Last Update By','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateByName','en-US','Last Update By','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateByName','zh-CN','更新人','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateDate','en-GB','Last Update Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateDate','en-US','Last Update Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateDate','zh-CN','更新日期','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Status','zh-CN','状态','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Title','en-GB','Title','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Title','en-US','Title','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Title','zh-CN','标题','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@ActionType','zh-CN','ActionType','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreateBy','zh-CN','CreateBy','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreatebyName','en-GB','Create By','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreatebyName','en-US','Create By','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreatebyName','zh-CN','创建人','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreateDate','en-GB','Create Date','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreateDate','en-US','Create Date','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreateDate','zh-CN','创建日期','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Datas','zh-CN','Datas','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Description','zh-CN','描述','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Form','zh-CN','Form','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@FormId','en-GB','Form','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@FormId','en-US','Form','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@FormId','zh-CN','表单','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@ID','zh-CN','ID','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateBy','zh-CN','LastUpdateBy','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateByName','en-GB','Last Update By','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateByName','en-US','Last Update By','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateByName','zh-CN','更新人','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateDate','en-GB','Last Update Date','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateDate','en-US','Last Update Date','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateDate','zh-CN','更新日期','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Status','zh-CN','状态','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Title','en-GB','Title','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Title','en-US','Title','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Title','zh-CN','标题','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ActionType','zh-CN','ActionType','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@AssemblyName','zh-CN','AssemblyName','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CreateBy','zh-CN','CreateBy','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CreatebyName','zh-CN','创建人','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CreateDate','zh-CN','创建日期','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CustomClass','zh-CN','CustomClass','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CustomStyle','zh-CN','CustomStyle','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Description','zh-CN','描述','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ExtendData','zh-CN','ExtendData','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@FormID','zh-CN','表单','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@FormView','zh-CN','FormView','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ID','zh-CN','ID','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@IsSystem','zh-CN','IsSystem','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@IsTemplate','zh-CN','保存为模板','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@LastUpdateBy','zh-CN','LastUpdateBy','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@LastUpdateByName','zh-CN','更新人','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@LastUpdateDate','zh-CN','更新日期','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@LayoutID','zh-CN','LayoutID','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@PageID','zh-CN','PageID','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@PartialView','zh-CN','显示模板','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Position','zh-CN','排序','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ServiceTypeName','zh-CN','ServiceTypeName','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Status','zh-CN','状态','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@StyleClass','zh-CN','自定义样式','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Thumbnail','zh-CN','缩略图','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Title','zh-CN','标题','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@WidgetName','zh-CN','组件名称','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ZoneID','zh-CN','区域','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Full','zh-CN','整行',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Full-text Index','zh-CN','全站索引',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Gender','en-GB','Gender',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Gender','en-US','Gender',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Gender','zh-CN','性别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Generate','zh-CN','生成',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Generate Content','zh-CN','基础内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Get app private key','zh-CN','获取服务密钥(AK)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Get location','zh-CN','获取位置坐标',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than','en-GB','Greater Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than','en-US','Greater Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than','zh-CN','大于',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than Or Equals','en-GB','Greater Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than Or Equals','en-US','Greater Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than Or Equals','zh-CN','大于等于',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Grid','zh-CN','栅格',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Grid Display','zh-CN','栅格系统行为',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Grid System','zh-CN','栅格列说明',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Groove','zh-CN','凹槽',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Group','zh-CN','组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('GroupID','zh-CN','分组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Have account?','en-GB','Have account?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Have account?','en-US','Have account?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Have account?','zh-CN','已有账号？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Have your say...','zh-CN','说说你的看法...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@AssemblyName','en-US','Assembly Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@AssemblyName','zh-CN','Assembly Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Content','en-US','内容','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Content','zh-CN','内容','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@IsSystem','en-US','Is System','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@IsSystem','zh-CN','Is System','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@IsTemplate','en-US','保存为模板','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@IsTemplate','zh-CN','保存为模板','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@PartialView','en-US','显示模板','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@PartialView','zh-CN','显示模板','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Position','en-US','Position','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Position','zh-CN','排序','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ServiceTypeName','en-US','Service Type Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ServiceTypeName','zh-CN','Service Type Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@StyleClass','en-US','自定义样式','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@StyleClass','zh-CN','自定义样式','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Thumbnail','en-US','缩略图','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Thumbnail','zh-CN','缩略图','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Title','en-US','标题','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Title','zh-CN','标题','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ViewModelTypeName','en-US','View Model Type Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ViewModelTypeName','zh-CN','View Model Type Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@WidgetName','en-US','组件名称','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@WidgetName','zh-CN','组件名称','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ZoneID','en-US','区域','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ZoneID','zh-CN','区域','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Height(px)','zh-CN','高(px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Help','zh-CN','帮助',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Hidden','zh-CN','隐藏',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('History','en-GB','History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('History','en-US','History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('History','zh-CN','历史事件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventItem@Description','zh-CN','事件','HistoryEventItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventItem@Status','zh-CN','状态','HistoryEventItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventItem@Title','zh-CN','年份','HistoryEventItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@AssemblyName','zh-CN','Assembly Name','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Events','zh-CN','历史事件','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@IsSystem','zh-CN','Is System','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@IsTemplate','zh-CN','保存为模板','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@PartialView','zh-CN','显示模板','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Position','zh-CN','排序','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@ServiceTypeName','zh-CN','Service Type Name','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@StyleClass','zh-CN','自定义样式','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Thumbnail','zh-CN','缩略图','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Title','zh-CN','标题','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@ViewModelTypeName','zh-CN','View Model Type Name','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@WidgetName','zh-CN','组件名称','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@ZoneID','zh-CN','区域','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Hobby','en-GB','Hobby',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Hobby','en-US','Hobby',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Hobby','zh-CN','爱好',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Home Page','en-GB','Home',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Home Page','en-US','Home',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Home Page','zh-CN','首页',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Horizontal Display','zh-CN','水平排列',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('How many column you want?','zh-CN','将内容分为几列？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ActionType','zh-CN','ActionType','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@AssemblyName','zh-CN','AssemblyName','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CreateBy','zh-CN','CreateBy','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CreatebyName','zh-CN','创建人','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CreateDate','zh-CN','创建日期','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CustomClass','zh-CN','CustomClass','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CustomStyle','zh-CN','CustomStyle','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Description','zh-CN','描述','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ExtendData','zh-CN','ExtendData','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ExtendFields','zh-CN','扩展属性','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@FormView','zh-CN','FormView','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@HTML','zh-CN','内容','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ID','zh-CN','ID','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@IsSystem','zh-CN','IsSystem','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@IsTemplate','zh-CN','保存为模板','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@LastUpdateBy','zh-CN','LastUpdateBy','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@LastUpdateByName','zh-CN','更新人','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@LastUpdateDate','zh-CN','更新日期','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@LayoutID','zh-CN','布局','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@PageID','zh-CN','页面','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@PartDriver','zh-CN','PartDriver','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@PartialView','zh-CN','显示模板','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Position','zh-CN','排序','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ServiceTypeName','zh-CN','ServiceTypeName','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Status','zh-CN','状态','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@StyleClass','zh-CN','自定义样式','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Thumbnail','zh-CN','缩略图','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Title','zh-CN','标题','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@WidgetName','zh-CN','组件名称','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ZoneID','zh-CN','区域','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Icon','zh-CN','图标',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Border','en-GB','Image Border',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Border','en-US','Image Border',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Border','zh-CN','图片边框',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Radius','en-GB','Image Radius',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Radius','en-US','Image Radius',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Radius','zh-CN','图片圆角',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image should set alt title','zh-CN','页面中有图片缺少alt',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Text','en-GB','Image Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Text','en-US','Image Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Text','zh-CN','图片文字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ActionType','zh-CN','ActionType','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@AltText','zh-CN','说明','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@AssemblyName','zh-CN','AssemblyName','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CreateBy','zh-CN','CreateBy','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CreatebyName','zh-CN','创建人','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CreateDate','zh-CN','创建日期','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CustomClass','zh-CN','CustomClass','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CustomStyle','zh-CN','CustomStyle','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Description','zh-CN','描述','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ExtendFields','zh-CN','扩展属性','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@FormView','zh-CN','FormView','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Height','zh-CN','高度(px)','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ID','zh-CN','ID','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ImageUrl','zh-CN','图片','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ImageUrlMd','zh-CN','中屏图片','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ImageUrlSm','zh-CN','小屏图片','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@IsSystem','zh-CN','IsSystem','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@IsTemplate','zh-CN','保存为模板','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@LastUpdateBy','zh-CN','LastUpdateBy','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@LastUpdateByName','zh-CN','更新人','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@LastUpdateDate','zh-CN','更新日期','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@LayoutID','zh-CN','布局','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Link','zh-CN','链接','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@PageID','zh-CN','页面','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@PartDriver','zh-CN','PartDriver','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@PartialView','zh-CN','显示模板','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Position','zh-CN','排序','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ServiceTypeName','zh-CN','ServiceTypeName','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Status','zh-CN','状态','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@StyleClass','zh-CN','自定义样式','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Thumbnail','zh-CN','缩略图','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Title','zh-CN','标题','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@WidgetName','zh-CN','组件名称','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Width','zh-CN','宽度(px)','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ZoneID','zh-CN','区域','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Import html page to system','zh-CN','该功能用于将做好的静态页面模板（HTML）导入到系统中',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Import Html Template','zh-CN','导入静态模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('In','en-GB','In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('In','en-US','In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('In','zh-CN','在...里',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('In Queue...','zh-CN','排队中...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Inactive','en-GB','Inactive',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Inactive','en-US','Inactive',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Inactive','zh-CN','无效',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Incoming address is already exists.','zh-CN','访问地址已经存在，不可重复添加',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Incoming address is the same with target address.','zh-CN','访问地址和跳转地址一样。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Indent','zh-CN','缩进',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Index content may take a few minutes!','zh-CN','更新索引的时间可能会较长，请耐心等待！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Industry News','zh-CN','行业新闻',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Information','en-GB','Information',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Information','en-US','Information',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Information','zh-CN','基本信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Input keywords to search','zh-CN','输入关键字搜索',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Input option','zh-CN','输入选项内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Inset','zh-CN','内嵌',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Install','zh-CN','安装',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Install Theme','en-GB','Install',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Install Theme','en-US','Install',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Install Theme','zh-CN','安装主题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Installing Theme...','zh-CN','主题安装中...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Internal Error','zh-CN','内部错误',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Invalid date value for {0}.','zh-CN','{0}的日期格式不正确',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Invalid Email for {0}.','zh-CN','{0}的邮件格式不正确',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Invalid Number for {0}.','zh-CN','{0}不是一个有效的数字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Invalid value for {0}.','zh-CN','{0}的格式不正确',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('IsEnable','zh-CN','是否启用',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('IsTemplate','zh-CN','保存为模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Italic','zh-CN','斜体',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('JavaScript','en-GB','JavaScript',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('JavaScript','en-US','JavaScript',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('JavaScript','zh-CN','脚本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('justify','zh-CN','两端对齐',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keep working changes','zh-CN','保留当前的修改',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Action','en-GB','Action','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Action','en-US','Action','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Action','zh-CN','Action','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaDescription','en-GB','Meta Description','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaDescription','en-US','Meta Description','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaDescription','zh-CN','SEO描述','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWords','en-GB','Meta Key Words','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWords','en-US','Meta Key Words','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWords','zh-CN','SEO关键字','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWorlds','en-GB','Meta Key Worlds','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWorlds','en-US','Meta Key Worlds','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWorlds','zh-CN','SEO关键字','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEODescription','en-US','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEODescription','zh-CN','SEO描述','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEODescription','zh-TW','SEO描述',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOKeyWord','en-US','SEO Keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOKeyWord','zh-CN','SEO关键字','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOKeyWord','zh-TW','SEO关键字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOTitle','en-US','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOTitle','zh-CN','SEO标题','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOTitle','zh-TW','SEO标题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Title','en-GB','Title','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Title','en-US','Title','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Title','zh-CN','标题','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Url','en-GB','Url','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Url','en-US','Url','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Url','zh-CN','Url','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@CultureName','en-GB','Culture Name','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@CultureName','en-US','Culture Name','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@CultureName','zh-CN','语言缩写','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanKey','en-GB','Lan Key','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanKey','en-US','Lan Key','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanKey','zh-CN','翻译键','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanType','zh-CN','对象','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanValue','en-GB','Lan Value','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanValue','en-US','Lan Value','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanValue','zh-CN','翻译值','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@Module','zh-CN','模块','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Large','zh-CN','大',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Last-Modified','zh-CN','修改时间',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LastUpdateByName','zh-CN','更新人',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LastUpdateDate','zh-CN','更新日期',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout','zh-CN','布局',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Code','zh-CN','布局代码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Content','en-GB','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Content','en-US','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Content','zh-CN','布局内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Design','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Design','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Design','zh-CN','布局设计',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout List','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout List','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout List','zh-CN','布局列表',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout: Edit page layout','en-GB','Layout: Edit page layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout: Edit page layout','en-US','Layout: Edit page layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout: Edit page layout','zh-CN','布局：修改页面布局',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ActionType','zh-CN','ActionType','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ContainerClass','zh-CN','ContainerClass','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@CreateBy','zh-CN','CreateBy','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@CreatebyName','zh-CN','创建人','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@CreateDate','zh-CN','创建日期','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@CurrentTheme','zh-CN','CurrentTheme','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Description','en-GB','Description','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Description','en-US','Description','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Description','zh-CN','描述','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Html','zh-CN','内容','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ID','zh-CN','ID','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ImageThumbUrl','zh-CN','缩略图','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ImageUrl','zh-CN','图片','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@IsTemplate','en-GB','Is Template','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@IsTemplate','en-US','Is Template','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@IsTemplate','zh-CN','保存为模板','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LastUpdateBy','zh-CN','LastUpdateBy','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LastUpdateByName','zh-CN','更新人','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LastUpdateDate','zh-CN','更新日期','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Layout','zh-CN','Layout','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LayoutName','en-GB','Layout Name','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LayoutName','en-US','Layout Name','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LayoutName','zh-CN','名称','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Page','zh-CN','Page','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@PreViewPage','zh-CN','PreViewPage','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Script','en-GB','Script','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Script','en-US','Script','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Script','zh-CN','脚本','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Status','en-GB','Status','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Status','en-US','Status','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Status','zh-CN','状态','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Style','en-GB','Style','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Style','en-US','Style','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Style','zh-CN','样式','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Templates','zh-CN','Templates','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Theme','zh-CN','主题','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Title','zh-CN','标题','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Zones','zh-CN','Zones','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ZoneWidgets','zh-CN','ZoneWidgets','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@ActionType','zh-CN','ActionType','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@CreateBy','zh-CN','CreateBy','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@CreatebyName','zh-CN','创建人','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@CreateDate','zh-CN','创建日期','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@Description','zh-CN','描述','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@Html','zh-CN','内容','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LastUpdateBy','zh-CN','LastUpdateBy','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LastUpdateByName','zh-CN','更新人','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LastUpdateDate','zh-CN','更新日期','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LayoutHtmlId','zh-CN','LayoutHtmlId','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LayoutId','zh-CN','布局','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@Status','zh-CN','状态','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@Title','zh-CN','标题','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than','en-GB','Less Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than','en-US','Less Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than','zh-CN','小于',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than Or Equals','en-GB','Less Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than Or Equals','en-US','Less Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than Or Equals','zh-CN','小于等于',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Letter Spacing','zh-CN','字间距',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LG Screen','zh-CN','大屏幕',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('License','en-GB','License',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('License','en-US','License',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('License','zh-CN','许可协议',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Lighter','zh-CN','轻加粗',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Line Height','zh-CN','行高',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Line Through','zh-CN','中线',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Link','zh-CN','链接',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('List','zh-CN','列表',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('List Group','zh-CN','列表组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('List Group End','zh-CN','组结束',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Location','en-US','Location','LiveChatScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Location','zh-CN','位置','GlobalScripts','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Script','en-US','Script','LiveChatScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Script','zh-CN','脚本','LiveChatScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Load demo data','zh-CN','加载示例数据',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Logs','en-GB','Log',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Logs','en-US','Log',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Logs','zh-CN','错误日志',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Lowercase','zh-CN','小写',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Male','en-GB','Male',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Male','en-US','Male',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Male','zh-CN','男',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Article','zh-CN','管理文章',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Article Category','zh-CN','管理文章类别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Carousel','zh-CN','管理焦点图',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Comments','zh-CN','管理评论',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Content','zh-CN','管理内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Content Template','zh-CN','管理内容模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Content Type','zh-CN','管理内容类型',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Form','zh-CN','管理表单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Form Data','zh-CN','管理表单数据',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Layout','zh-CN','管理布局',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Media','zh-CN','管理媒体库',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Message','zh-CN','管理留言',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Navigation','en-GB','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Navigation','en-US','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Navigation','zh-CN','导航管理',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Notify Email','zh-CN','管理通知邮箱',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Order','zh-CN','管理订单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Page','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Page','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Page','zh-CN','页面管理',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Pages','zh-CN','管理页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product','zh-CN','产品管理',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product Category','zh-CN','管理产品类别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product Tag','zh-CN','管理产品标签',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Role','zh-CN','管理角色',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Setting','zh-CN','管理设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Subscription','zh-CN','管理订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Template','zh-CN','管理模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Theme','zh-CN','管理主题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage URL Redirection','zh-CN','管理URL重定向',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Users','zh-CN','管理用户',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Map','en-GB','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Map','en-US','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Map','zh-CN','地图',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Margin','zh-CN','外边距',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Margin Padding','zh-CN','边距',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Married','en-GB','Married',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Married','en-US','Married',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Married','zh-CN','已婚',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Max Column Width','zh-CN','最大列宽',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Max Width','zh-CN','最大宽度',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Media','en-GB','Media',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Media','en-US','Media',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Media','zh-CN','媒体库',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@ActionType','zh-CN','ActionType','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@CreateBy','zh-CN','CreateBy','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@CreatebyName','zh-CN','CreatebyName','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@CreateDate','zh-CN','CreateDate','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@Description','zh-CN','描述','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@ID','zh-CN','ID','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@LastUpdateBy','zh-CN','LastUpdateBy','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@LastUpdateByName','zh-CN','LastUpdateByName','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@LastUpdateDate','zh-CN','LastUpdateDate','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@MediaType','zh-CN','MediaType','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@MediaTypeImage','zh-CN','MediaTypeImage','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@ParentID','zh-CN','ParentID','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@Status','zh-CN','状态','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@Title','zh-CN','标题','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@Url','zh-CN','Url','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Medium','zh-CN','中等',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Memory Cache','zh-CN','内存缓存',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message','en-GB','Message',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message','en-US','Message',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message','zh-CN','留言',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message And Comments','en-GB','Comments',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message And Comments','en-US','Comments',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message And Comments','zh-CN','留言评论',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message Board','en-GB','Message Board',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message Board','en-US','Message Board',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message Board','zh-CN','留言板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message List','en-GB','Message List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message List','en-US','Message List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message List','zh-CN','留言内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@AssemblyName','zh-CN','Assembly Name','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@IsSystem','zh-CN','Is System','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@IsTemplate','zh-CN','保存为模板','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@PartialView','zh-CN','显示模板','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@Position','zh-CN','排序','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@ServiceTypeName','zh-CN','Service Type Name','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@StyleClass','zh-CN','自定义样式','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@Thumbnail','zh-CN','缩略图','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@Title','zh-CN','标题','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@ViewModelTypeName','zh-CN','View Model Type Name','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@WidgetName','zh-CN','组件名称','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@ZoneID','zh-CN','区域','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@ActionType','zh-CN','ActionType','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateBy','zh-CN','CreateBy','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreatebyName','en-GB','Create By','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreatebyName','en-US','Create By','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreatebyName','zh-CN','创建人','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateDate','en-GB','Create Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateDate','en-US','Create Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateDate','zh-CN','创建日期','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Description','zh-CN','描述','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Email','en-GB','Email','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Email','en-US','Email','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Email','zh-CN','邮箱','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@ID','zh-CN','ID','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateBy','zh-CN','LastUpdateBy','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','en-GB','Last Update By','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','en-US','Last Update By','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','zh-CN','更新人','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','en-GB','Last Update Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','en-US','Last Update Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','zh-CN','更新日期','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@PostMessage','zh-CN','留言内容','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Reply','zh-CN','回复','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','en-GB','Status','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','en-US','Status','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','zh-CN','状态','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Title','en-GB','Name','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Title','en-US','Name','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Title','zh-CN','姓名','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@CommentNotifyEmails','en-GB','Comment Notify Emails','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@CommentNotifyEmails','en-US','Comment Notify Emails','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@CommentNotifyEmails','zh-CN','新评论通知邮箱','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@MessageNotifyEmails','en-GB','Message Notify Emails','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@MessageNotifyEmails','en-US','Message Notify Emails','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@MessageNotifyEmails','zh-CN','新留言通知邮箱','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ActionType','zh-CN','ActionType','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@AssemblyName','zh-CN','AssemblyName','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CreateBy','zh-CN','CreateBy','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CreatebyName','zh-CN','创建人','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CreateDate','zh-CN','创建日期','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CustomClass','zh-CN','CustomClass','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CustomStyle','zh-CN','CustomStyle','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Description','zh-CN','描述','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ExtendData','zh-CN','ExtendData','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ExtendFields','zh-CN','扩展属性','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@FormView','zh-CN','FormView','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ID','zh-CN','ID','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@IsSystem','zh-CN','IsSystem','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@IsTemplate','zh-CN','保存为模板','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@LastUpdateBy','zh-CN','LastUpdateBy','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@LastUpdateByName','zh-CN','更新人','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@LastUpdateDate','zh-CN','更新日期','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@LayoutID','zh-CN','LayoutID','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@PageID','zh-CN','PageID','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@PartialView','zh-CN','显示模板','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Position','zh-CN','排序','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ServiceTypeName','zh-CN','ServiceTypeName','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Status','zh-CN','状态','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@StyleClass','zh-CN','自定义样式','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Thumbnail','zh-CN','缩略图','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Title','zh-CN','标题','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@WidgetName','zh-CN','组件名称','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ZoneID','zh-CN','区域','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Mobile (<768px)','zh-CN','手机 (<768px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modified','zh-CN','已修改',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modified By','zh-CN','修改人',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modify Account','en-GB','Modify Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modify Account','en-US','Modify Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modify Account','zh-CN','修改基本信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More','en-GB','More',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More','en-US','More',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More','zh-CN','更多',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More','zh-TW','更多',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More Templates','zh-CN','更多模板>>',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More...','zh-CN','更多...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Most Read Top10','zh-CN','阅读排行 Top10',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Mouse Cursor','zh-CN','鼠标',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Move','zh-CN','移动',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi Line','zh-CN','多行输入',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language','en-GB','Multi-language',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language','en-US','Multi-language',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language','zh-CN','多语言',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language Config','en-GB','Multi-language Config',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language Config','en-US','Multi-language Config',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language Config','zh-CN','多语言设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-Language Setting','zh-CN','语言设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('My Order','en-GB','Orders',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('My Order','en-US','Orders',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('My Order','zh-CN','我的订单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Name','zh-CN','名称',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Navigation','en-GB','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Navigation','en-US','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Navigation','zh-CN','导航',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@ActionType','zh-CN','ActionType','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@CreateBy','zh-CN','CreateBy','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@CreatebyName','zh-CN','创建人','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@CreateDate','zh-CN','创建日期','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Description','en-GB','Description','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Description','en-US','Description','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Description','zh-CN','描述','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@DisplayOrder','zh-CN','排序','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Html','en-GB','Html','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Html','en-US','Html','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Html','zh-CN','HTML内容','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@ID','zh-CN','ID','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsCurrent','en-GB','Is Current','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsCurrent','en-US','Is Current','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsCurrent','zh-CN','IsCurrent','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsMobile','en-GB','Is Mobile','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsMobile','en-US','Is Mobile','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsMobile','zh-CN','手机一级导航','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@LastUpdateBy','zh-CN','LastUpdateBy','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@LastUpdateByName','zh-CN','更新人','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@LastUpdateDate','zh-CN','更新日期','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@ParentId','zh-CN','ParentId','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Status','en-GB','Status','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Status','en-US','Status','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Status','zh-CN','状态','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Title','en-GB','Title','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Title','en-US','Title','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Title','zh-CN','标题','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Url','en-GB','Url','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Url','en-US','Url','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Url','zh-CN','Url','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ActionType','zh-CN','ActionType','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AlignClass','en-GB','Align Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AlignClass','en-US','Align Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AlignClass','zh-CN','对齐','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AssemblyName','en-GB','Assembly Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AssemblyName','en-US','Assembly Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AssemblyName','zh-CN','AssemblyName','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CreateBy','zh-CN','CreateBy','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CreatebyName','zh-CN','创建人','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CreateDate','zh-CN','创建日期','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomClass','zh-CN','CustomClass','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomerClass','en-GB','Customer Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomerClass','en-US','Customer Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomerClass','zh-CN','契合度','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomStyle','zh-CN','契合度','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Description','zh-CN','描述','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ExtendData','zh-CN','ExtendData','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ExtendFields','zh-CN','扩展属性','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@FormView','zh-CN','FormView','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ID','zh-CN','ID','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsSystem','en-GB','Is System','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsSystem','en-US','Is System','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsSystem','zh-CN','IsSystem','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsTemplate','en-GB','Is Template','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsTemplate','en-US','Is Template','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsTemplate','zh-CN','保存为模板','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsTopFix','zh-CN','顶部固定','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@LastUpdateBy','zh-CN','LastUpdateBy','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@LastUpdateByName','zh-CN','更新人','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@LastUpdateDate','zh-CN','更新日期','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@LayoutID','zh-CN','布局','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Logo','en-GB','Logo','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Logo','en-US','Logo','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Logo','zh-CN','Logo','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PageID','zh-CN','页面','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PartDriver','zh-CN','PartDriver','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PartialView','en-GB','Partial View','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PartialView','en-US','Partial View','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PartialView','zh-CN','显示模板','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Position','en-GB','Position','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Position','en-US','Position','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Position','zh-CN','排序','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@RootID','en-GB','Root','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@RootID','en-US','Root','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@RootID','zh-CN','根结点','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ServiceTypeName','en-GB','Service Type Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ServiceTypeName','en-US','Service Type Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ServiceTypeName','zh-CN','ServiceTypeName','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ShowBasket','en-GB','Show Basket','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ShowBasket','en-US','Show Basket','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ShowBasket','zh-CN','显示购物车？','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Status','zh-CN','状态','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@StyleClass','en-GB','Style Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@StyleClass','en-US','Style Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@StyleClass','zh-CN','自定义样式','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Thumbnail','en-GB','Thumbnail','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Thumbnail','en-US','Thumbnail','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Thumbnail','zh-CN','缩略图','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Title','en-GB','Title','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Title','en-US','Title','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Title','zh-CN','标题','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ViewModelTypeName','en-GB','View Model Type Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ViewModelTypeName','en-US','View Model Type Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@WidgetName','en-GB','Widget Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@WidgetName','en-US','Widget Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@WidgetName','zh-CN','组件名称','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ZoneID','en-GB','Zone','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ZoneID','en-US','Zone','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ZoneID','zh-CN','区域','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ne-resize','zh-CN','向右上改变大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New','zh-CN','新建',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Category','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Category','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Category','zh-CN','添加类别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Folder','en-GB','New Folder',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Folder','en-US','New Folder',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Folder','zh-CN','创建文件夹',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Layout','en-GB','New Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Layout','en-US','New Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Layout','zh-CN','添加布局',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Navigation','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Navigation','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Navigation','zh-CN','添加导航',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page','en-GB','New Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page','en-US','New Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page','zh-CN','添加页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page: Add a root level page','en-GB','New Page: Add a root level page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page: Add a root level page','en-US','New Page: Add a root level page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page: Add a root level page','zh-CN','添加页面：添加顶级页面，即域名下的一级子页面。~/xxxxx',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Password','en-GB','New Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Password','en-US','New Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Password','zh-CN','新密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Product Tag','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Product Tag','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Product Tag','zh-CN','添加产品标签',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Tag','zh-CN','新建标签',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New: Add sub page','en-GB','New: Add sub page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New: Add sub page','en-US','New: Add sub page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New: Add sub page','zh-CN','添加：添加子页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('News','zh-CN','新闻',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Next','zh-CN','下一步',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Next:','zh-CN','下一篇:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('No','zh-CN','否',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('None','zh-CN','无',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('None（Auto）','zh-CN','None（自动）',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('no-repeat','zh-CN','不重复',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Normal','zh-CN','普通',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Contains','en-GB','Not Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Contains','en-US','Not Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Contains','zh-CN','不包含',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Ends With','en-GB','Not Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Ends With','en-US','Not Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Ends With','zh-CN','不以...结尾',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Equals','en-GB','Not Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Equals','en-US','Not Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Equals','zh-CN','不等于',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not In','en-GB','Not In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not In','en-US','Not In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not In','zh-CN','不在...里',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Starts With','en-GB','Not Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Starts With','en-US','Not Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Starts With','zh-CN','不以…开头',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice','zh-CN','提示',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice:','en-GB','Notice:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice:','en-US','Notice:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice:','zh-CN','注：',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice: click the rule will display the match content.','zh-CN','提示：点击左边条件，右则将展示出满足该条件时的内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice: Drop to upload','zh-CN','注：把模板包拖到列表区域进行上传',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notify Email','zh-CN','通知邮箱',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('n-resize','zh-CN','向上改变大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Number','zh-CN','数字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('nw-resize','zh-CN','向左上改变大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuth','en-GB','OAuth',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuth','en-US','OAuth',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuth','zh-CN','第三方登录',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuth Config','zh-CN','配置第三方登录信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@AssemblyName','zh-CN','Assembly Name','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@IsSystem','zh-CN','Is System','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@IsTemplate','zh-CN','保存为模板','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@PartialView','zh-CN','显示模板','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Position','zh-CN','排序','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@QQ','zh-CN','QQ?','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Redirect','zh-CN','跳转地址','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@ServiceTypeName','zh-CN','Service Type Name','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@StyleClass','zh-CN','自定义样式','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Thumbnail','zh-CN','缩略图','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Title','zh-CN','标题','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@ViewModelTypeName','zh-CN','View Model Type Name','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@WeChat','zh-CN','微信?','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@WeiBo','zh-CN','微博?','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@WidgetName','zh-CN','组件名称','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@ZoneID','zh-CN','区域','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Oblique','zh-CN','倾斜',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Official Website','zh-CN','官网',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OK','zh-CN','确定',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Old Password','en-GB','Old Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Old Password','en-US','Old Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Old Password','zh-CN','旧密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Only support zip package','zh-CN','上传的包必需为<code>zip</code>格式',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Only unpaid order can be closed!','zh-CN','只有未支付的订单可以关闭',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Option','zh-CN','选项',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Option 1','zh-CN','选项1',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Option 2','zh-CN','选项2',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Or','en-GB','Or',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Or','en-US','Or',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Or','zh-CN','或者',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order','en-GB','Order',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order','en-US','Order',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order','zh-CN','订单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Amount','zh-CN','订单总额',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Confirm','zh-CN','确认定单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Date','zh-CN','订单日期',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Detail','zh-CN','订单明细',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order failed to pay','zh-CN','订单支付失败',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order for refund','zh-CN','申请退款的订单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Number','zh-CN','订单号',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Number:','zh-CN','订单号：',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ActionType','zh-CN','ActionType','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CompletePayTime','zh-CN','完成支付时间','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Contact','en-GB','Contact','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Contact','en-US','Contact','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Contact','zh-CN','联系人','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreateBy','zh-CN','CreateBy','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreatebyName','zh-CN','创建人','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreateDate','en-GB','Create Date','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreateDate','en-US','Create Date','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreateDate','zh-CN','创建日期','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Description','zh-CN','描述','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ID','en-US','ID','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ID','zh-CN','订单号','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateBy','zh-CN','LastUpdateBy','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateByName','en-GB','Last Update By','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateByName','en-US','Last Update By','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateByName','zh-CN','更新人','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateDate','en-GB','Last Update Date','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateDate','en-US','Last Update Date','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateDate','zh-CN','更新日期','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LogisticsCompany','zh-CN','快递公司','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@OrderStatus','en-GB','Order Status','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@OrderStatus','en-US','Order Status','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@OrderStatus','zh-CN','订单状态','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PaymentGateway','zh-CN','支付方式','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PaymentID','zh-CN','支付ID','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PayTime','zh-CN','发起支付时间','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PhoneNumber','en-GB','Phone Number','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PhoneNumber','en-US','Phone Number','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PhoneNumber','zh-CN','电话','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Refund','zh-CN','退款金额','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@RefundDate','zh-CN','退款日期','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@RefundID','zh-CN','退款流水号','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@RefundReason','zh-CN','退款原因','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ShippingAddress','en-GB','Shipping Address','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ShippingAddress','en-US','Shipping Address','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ShippingAddress','zh-CN','收货地址','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Status','zh-CN','状态','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Title','zh-CN','标题','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Total','en-GB','Total','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Total','en-US','Total','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Total','zh-CN','总价','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@TrackingNumber','zh-CN','快递单号','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@UserId','zh-CN','登录名','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other','en-GB','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other','en-US','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other','zh-CN','其它',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other Settings','en-GB','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other Settings','en-US','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other Settings','zh-CN','其它设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Output Cache','zh-CN','静态缓存设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Outset','zh-CN','外嵌',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overflow','zh-CN','超出行为',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overline','zh-CN','顶线',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overview','en-GB','Overview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overview','en-US','Overview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overview','zh-CN','概览',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pack','zh-CN','打包',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pack widget','zh-CN','打包模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Padding','zh-CN','内边距',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page','zh-CN','页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page And Layout','zh-CN','页面布局',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page description is empty','zh-CN','页面的描述为空',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page description is too short or too long','zh-CN','页面的描述文字长度太长或者太短',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Design','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Design','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Design','zh-CN','页面设计',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page keyword is empty','zh-CN','页面没有设置关键字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page keywords','en-GB','Page keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page keywords','en-US','Page keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page keywords','zh-CN','页面关键字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Not Exists','zh-CN','页面不存在',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Title','zh-CN','页面的标题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page title is empty','zh-CN','页面没有设置标题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page title is too short or too long','zh-CN','页面的标题文字长度太长或者太短',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageAsset@Url','en-US','Url','PageAsset','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageAsset@Url','zh-CN','Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ActionType','zh-CN','ActionType','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Content','zh-CN','Content','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@CreateBy','zh-CN','CreateBy','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@CreatebyName','zh-CN','创建人','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@CreateDate','zh-CN','创建日期','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Description','en-GB','Description','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Description','en-US','Description','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Description','zh-CN','描述','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@DisplayOrder','zh-CN','排序','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ExtendFields','zh-CN','扩展属性','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Favicon','zh-CN','Favicon','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ID','zh-CN','ID','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsHomePage','en-GB','Is Home Page','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsHomePage','en-US','Is Home Page','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsHomePage','zh-CN','首页?','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublish','en-GB','Is Publish','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublish','en-US','Is Publish','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublish','zh-CN','已发布?','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublishedPage','en-GB','Is Published Page','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublishedPage','en-US','Is Published Page','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublishedPage','zh-CN','IsPublishedPage','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsTemplate','en-GB','Is Template','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsTemplate','en-US','Is Template','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsTemplate','zh-CN','保存为模板','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LastUpdateBy','zh-CN','LastUpdateBy','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LastUpdateByName','zh-CN','更新人','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LastUpdateDate','zh-CN','更新日期','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LayoutId','en-GB','Layout','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LayoutId','en-US','Layout','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LayoutId','zh-CN','布局','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaDescription','en-GB','Meta Description','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaDescription','en-US','Meta Description','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaDescription','zh-CN','SEO描述','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaKeyWorlds','en-GB','Meta Key Worlds','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaKeyWorlds','en-US','Meta Key Worlds','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaKeyWorlds','zh-CN','SEO关键字','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageName','en-GB','Page Name','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageName','en-US','Page Name','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageName','zh-CN','名称','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageUrl','en-GB','Page Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageUrl','en-US','Page Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageUrl','zh-CN','页面地址','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ParentId','zh-CN','ParentId','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PublishDate','zh-CN','发布日期','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ReferencePageID','zh-CN','ReferencePageID','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Script','en-GB','Script','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Script','en-US','Script','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Script','zh-CN','脚本','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Scripts','en-US','Scripts','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Scripts','zh-CN','脚本','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','en-GB','Status','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','en-US','Status','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','zh-CN','状态','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','en-GB','Style','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','en-US','Style','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','zh-CN','样式','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Styles','en-US','Styles','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Styles','zh-CN','样式','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','en-GB','Title','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','en-US','Title','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','zh-CN','标题','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Url','zh-CN','Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paid','zh-CN','已支付',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Panel','zh-CN','面板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paragraph','en-GB','Paragraph',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paragraph','en-US','Paragraph',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paragraph','zh-CN','段落',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Parallax','en-GB','Parallax',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Parallax','en-US','Parallax',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Parallax','zh-CN','平行视差',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@AssemblyName','zh-CN','Assembly Name','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ImageUrl','zh-CN','图片','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@IsSystem','zh-CN','Is System','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@IsTemplate','zh-CN','保存为模板','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@PartialView','zh-CN','显示模板','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@Position','zh-CN','排序','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ServiceTypeName','zh-CN','Service Type Name','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@StyleClass','zh-CN','自定义样式','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@Thumbnail','zh-CN','缩略图','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@Title','zh-CN','标题','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ViewModelTypeName','zh-CN','View Model Type Name','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@WidgetName','zh-CN','组件名称','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ZoneID','zh-CN','区域','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PartialView','zh-CN','显示模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Password','en-GB','Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Password','en-US','Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Password','zh-CN','密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Passwords are inconsistent','en-GB','Passwords are inconsistent',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Passwords are inconsistent','en-US','Passwords are inconsistent',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Passwords are inconsistent','zh-CN','密码不一致',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paste','en-GB','Paste',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paste','en-US','Paste',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paste','zh-CN','粘贴',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paste copy content to the area','zh-CN','粘贴复制的内容到该区域',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pay','zh-CN','付款',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pay Online','zh-CN','在线支付',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Payment Information','zh-CN','支付信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Payment Order','zh-CN','已支付订单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Payment Setting','zh-CN','支付集成设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PayPalOptions@ClientID','zh-CN','Client ID',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PayPalOptions@ClientSecretID','zh-CN','Client Secret ID',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PayPalOptions@Environment','zh-CN','环境',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PayPalOptions@IsEnable','zh-CN','是否启用',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pending pages','zh-CN','有未处理完的页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Phone','en-GB','Phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Phone','en-US','Phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Phone','zh-CN','电话',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Phone number is invalid','zh-CN','电话格式不正确',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Picture','en-GB','Image',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Picture','en-US','Image',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Picture','zh-CN','图片',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pixel Script','zh-CN','访客统计代码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Placeholder','zh-CN','占位文字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please contact administrator.','zh-CN','请联系管理员。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter the refund amount','zh-CN','请输入退款金额',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your account information','zh-CN','请输入您的用户信息以找回密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your name','en-GB','Please enter your name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your name','en-US','Please enter your name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your name','zh-CN','输入姓名',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in','en-GB','Please enter your user information to log in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in','en-US','Please enter your user information to log in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in','zh-CN','请输入您的用户信息以登录',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in to the system','en-GB','Please enter your user information to log in to the system',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in to the system','en-US','Please enter your user information to log in to the system',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in to the system','zh-CN','请输入您的用户信息以登录系统',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to regist','en-GB','Please enter your user information to regist',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to regist','en-US','Please enter your user information to regist',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to regist','zh-CN','请输入您的用户信息以注册',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please input a number','zh-CN','请输入数字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please input a phone number','zh-CN','电话地址格式不正确',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please make only one folder in the package','zh-CN','压缩包的根目录<strong>有且仅能有一个文件夹</strong>，文件夹名将会作为主题名称和路径，所以请使用英文。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please select a product category','zh-CN','请选择一个产品类别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please select at least one option','zh-CN','请至少选择一个选项',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please try again later.','zh-CN','请稍后再试',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Plugins','zh-CN','插件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pointer','zh-CN','手形',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position','zh-CN','位置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Bottom','zh-CN','底部距离',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Left','zh-CN','左边距离',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Right','zh-CN','右边距离',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Top','zh-CN','顶部距离',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Type','zh-CN','定位',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Press Enter to save','en-GB','Press Enter to save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Press Enter to save','en-US','Press Enter to save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Press Enter to save','zh-CN','按回车保存',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview','en-GB','Preview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview','en-US','Preview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview','zh-CN','预览',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview: Preview the pending page','en-GB','Preview: Preview the page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview: Preview the pending page','en-US','Preview: Preview the page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview: Preview the pending page','zh-CN','预览：查看最新修改版本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Previous:','zh-CN','上一篇:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Price','zh-CN','价格',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product','zh-CN','产品',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Category','en-GB','Product Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Category','en-US','Product Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Category','zh-CN','产品类别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Content','en-GB','Product Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Content','en-US','Product Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Content','zh-CN','产品内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Gallery','zh-CN','产品组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product keywords','en-GB','Product keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product keywords','en-US','Product keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product keywords','zh-CN','产品关键字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product List','en-GB','Product List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product List','en-US','Product List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product List','zh-CN','产品列表',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Sort','en-GB','Sort',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Sort','en-US','Sort',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Sort','zh-CN','产品排序',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Tag','en-GB','Product Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Tag','en-US','Product Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Tag','zh-CN','产品标签',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ActionType','zh-CN','ActionType','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@CreateBy','zh-CN','CreateBy','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@CreatebyName','zh-CN','创建人','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@CreateDate','zh-CN','创建日期','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Description','en-GB','Description','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Description','en-US','Description','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Description','zh-CN','描述','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ID','zh-CN','ID','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@LastUpdateBy','zh-CN','LastUpdateBy','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@LastUpdateByName','zh-CN','更新人','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@LastUpdateDate','zh-CN','更新日期','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ParentID','en-GB','Parent','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ParentID','en-US','Parent','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ParentID','zh-CN','ParentID','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Status','en-GB','Status','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Status','en-US','Status','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Status','zh-CN','状态','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Title','en-GB','Title','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Title','en-US','Title','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Title','zh-CN','标题','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Url','en-GB','Url','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Url','en-US','Url','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Url','zh-CN','英文名','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ActionType','zh-CN','ActionType','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@AssemblyName','zh-CN','AssemblyName','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CreateBy','zh-CN','CreateBy','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CreatebyName','zh-CN','创建人','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CreateDate','zh-CN','创建日期','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CustomClass','zh-CN','CustomClass','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CustomStyle','zh-CN','CustomStyle','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Description','zh-CN','描述','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ExtendFields','zh-CN','扩展属性','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@FormView','zh-CN','FormView','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ID','zh-CN','ID','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@IsSystem','zh-CN','IsSystem','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@IsTemplate','zh-CN','保存为模板','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@LastUpdateByName','zh-CN','更新人','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@LastUpdateDate','zh-CN','更新日期','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@LayoutID','zh-CN','LayoutID','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@PageID','zh-CN','PageID','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@PartialView','zh-CN','显示模板','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Position','zh-CN','排序','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ProductCategoryID','zh-CN','产品类别','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Status','zh-CN','状态','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@StyleClass','zh-CN','自定义样式','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@TargetPage','zh-CN','详细页面','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Thumbnail','zh-CN','缩略图','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Title','zh-CN','标题','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@WidgetName','zh-CN','组件名称','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ZoneID','zh-CN','区域','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ActionType','zh-CN','ActionType','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@AssemblyName','zh-CN','AssemblyName','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CreateBy','zh-CN','CreateBy','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CreatebyName','zh-CN','创建人','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CreateDate','zh-CN','创建日期','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CustomClass','zh-CN','CustomClass','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CustomerClass','zh-CN','CustomerClass','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CustomStyle','zh-CN','CustomStyle','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Description','zh-CN','描述','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ExtendFields','zh-CN','扩展属性','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@FormView','zh-CN','FormView','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ID','zh-CN','ID','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@IsSystem','zh-CN','IsSystem','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@IsTemplate','zh-CN','保存为模板','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@LastUpdateByName','zh-CN','更新人','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@LastUpdateDate','zh-CN','更新日期','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@LayoutID','zh-CN','LayoutID','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@PageID','zh-CN','PageID','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@PartialView','zh-CN','显示模板','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Position','zh-CN','排序','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Status','zh-CN','状态','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@StyleClass','zh-CN','自定义样式','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Thumbnail','zh-CN','缩略图','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Title','zh-CN','标题','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@WidgetName','zh-CN','组件名称','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ZoneID','zh-CN','区域','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ActionType','zh-CN','ActionType','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@BrandCD','zh-CN','BrandCD','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Color','zh-CN','颜色','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateBy','zh-CN','CreateBy','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreatebyName','en-GB','Create By','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreatebyName','en-US','Create By','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreatebyName','zh-CN','创建人','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateDate','en-GB','Create Date','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateDate','en-US','Create Date','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateDate','zh-CN','创建日期','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Description','zh-CN','描述','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ExtendFields','zh-CN','扩展属性','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ID','zh-CN','ID','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ImageThumbUrl','zh-CN','缩略图','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ImageUrl','zh-CN','图片','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@IsPublish','zh-CN','已发布?','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateBy','zh-CN','LastUpdateBy','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateByName','en-GB','Last Update By','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateByName','en-US','Last Update By','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateByName','zh-CN','更新人','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateDate','en-GB','Last Update Date','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateDate','en-US','Last Update Date','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateDate','zh-CN','更新日期','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Norm','zh-CN','规格','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@OrderIndex','zh-CN','排序','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PartNumber','en-GB','Part Number','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PartNumber','en-US','Part Number','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PartNumber','zh-CN','型号','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Price','zh-CN','价格','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductCategoryID','en-GB','Product Category','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductCategoryID','en-US','Product Category','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductCategoryID','zh-CN','产品类别','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductContent','zh-CN','详细内容','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductEntityCategory','zh-CN','产品类别','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductEntityCategoryID','zh-CN','产品类别','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductEntityContent','zh-CN','描述','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductImages','zh-CN','展示图','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductTags','zh-CN','标签','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PublishDate','zh-CN','发布日期','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PurchasePrice','zh-CN','成本价','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@RebatePrice','zh-CN','折扣价','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@SEODescription','zh-CN','SEO描述','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@SEOKeyWord','zh-CN','SEO关键字','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@SEOTitle','zh-CN','SEO标题','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ShelfLife','zh-CN','保质期','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@SourceFrom','zh-CN','来源','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Status','en-GB','Status','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Status','en-US','Status','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Status','zh-CN','状态','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@TargetFrom','zh-CN','其它网站','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@TargetUrl','zh-CN','网站网址','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Title','en-GB','Title','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Title','en-US','Title','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Title','zh-CN','标题','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Url','zh-CN','英文名','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductGalleryWidget@DetailPageUrl','zh-CN','详细页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductGalleryWidget@ProductGalleryId','zh-CN','产品组',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@ActionType','zh-CN','ActionType','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@CreateBy','zh-CN','CreateBy','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@CreatebyName','zh-CN','创建人','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@CreateDate','zh-CN','创建日期','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@Description','zh-CN','描述','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@ID','zh-CN','ID','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@ImageUrl','zh-CN','图片','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@LastUpdateBy','zh-CN','LastUpdateBy','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@LastUpdateByName','zh-CN','更新人','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@LastUpdateDate','zh-CN','更新日期','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@ProductId','zh-CN','ProductId','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@Status','zh-CN','状态','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@Title','zh-CN','标题','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ActionType','zh-CN','ActionType','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@AssemblyName','zh-CN','AssemblyName','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Columns','zh-CN','显示列','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CreateBy','zh-CN','CreateBy','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CreatebyName','zh-CN','创建人','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CreateDate','zh-CN','创建日期','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CustomClass','zh-CN','CustomClass','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CustomStyle','zh-CN','CustomStyle','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Description','zh-CN','描述','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@DetailPageUrl','zh-CN','详细页面','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ExtendData','zh-CN','ExtendData','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ExtendFields','zh-CN','扩展属性','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@FormView','zh-CN','FormView','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ID','zh-CN','ID','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@IsPageable','zh-CN','分页?','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@IsSystem','zh-CN','IsSystem','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@IsTemplate','zh-CN','保存为模板','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@LastUpdateByName','zh-CN','更新人','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@LastUpdateDate','zh-CN','更新日期','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@LayoutID','zh-CN','LayoutID','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@PageID','zh-CN','PageID','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@PageSize','zh-CN','分页大小','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@PartialView','zh-CN','显示模板','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Position','zh-CN','排序','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ProductCategoryID','zh-CN','产品类别','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Status','zh-CN','状态','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@StyleClass','zh-CN','自定义样式','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Thumbnail','zh-CN','缩略图','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Title','zh-CN','标题','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@WidgetName','zh-CN','组件名称','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ZoneID','zh-CN','区域','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Products','zh-CN','产品',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property','en-GB','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property','en-US','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property','zh-CN','属性',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property/History','en-GB','Property/History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property/History','en-US','Property/History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property/History','zh-CN','属性/历史记录',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property: Page property, history etc.','en-GB','Property: Page property, history etc.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property: Page property, history etc.','en-US','Property: Page property, history etc.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property: Page property, history etc.','zh-CN','属性：编辑选中页面的属性，像标题，SEO关键字等',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Province Address','zh-CN','省份地址',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish','en-GB','Publish',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish','en-US','Publish',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish','zh-CN','发布',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Article','zh-CN','发布文章',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish By','en-GB','Publish By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish By','en-US','Publish By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish By','zh-CN','发布人',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Date','en-GB','Publish Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Date','en-US','Publish Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Date','zh-CN','发布日期',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Product','zh-CN','发布产品',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish: Publish page','en-GB','Publish: Publish page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish: Publish page','en-US','Publish: Publish page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish: Publish page','zh-CN','发布：将页面发布到前端可查看',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Published','zh-CN','已发布',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('QQ Config','zh-CN','配置QQ登录',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Query String','en-GB','Query String',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Query String','en-US','Query String',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Query String','zh-CN','Url参数',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Querystring is not allowed','zh-CN','不支持带有参数的URL地址静态化',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Radio Button','zh-CN','单选框',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Radius','zh-CN','圆角',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Recent Articles','zh-CN','近期文章',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reduce Margin','en-GB','Full',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reduce Margin','en-US','Full',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reduce Margin','zh-CN','减小外边距',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refresh','zh-CN','刷新',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund','zh-CN','退款',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund Amount','zh-CN','退款金额',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund amount exceeds the amount of the order','zh-CN','退款金额超出订单金额',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund Information','zh-CN','退款信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund successfull!','zh-CN','退款成功！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refunded','zh-CN','已退款',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refunding','zh-CN','退款中',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Regular expression','zh-CN','正则表达式',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reinstall to update the theme','en-GB','Reinstall to update the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reinstall to update the theme','en-US','Reinstall to update the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reinstall to update the theme','zh-CN','若主题有更新，重复安装即可更新',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Relative','zh-CN','相对',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Release your mouse to upload...','zh-CN','松开鼠标进行上传...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Repeat','zh-CN','重复',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('repeat-x','zh-CN','水平重复',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('repeat-y','zh-CN','垂直重复',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reply','zh-CN','回复',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Report issue','zh-CN','反馈问题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Required Message','zh-CN','必填项提示信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Required?','zh-CN','必填？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reset failed?','zh-CN','重置失败？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reset password','zh-CN','重置密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert','en-GB','Revert',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert','en-US','Revert',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert','zh-CN','恢复',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert','zh-TW','恢復',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert from version: {0:g}','zh-CN','从 {0:g} 版本撤回',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert to','zh-CN','撤回到该版本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert to original','zh-CN','将模板还原到最初状态？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Review','zh-CN','预览',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rich Text','zh-CN','富文本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rich text box','zh-CN','富文本输入',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ridge','zh-CN','屋脊',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Robots@Content','en-US','Content','Robots','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Robots@Content','zh-CN','内容','Robots','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Role','en-GB','Role',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Role','en-US','Role',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Role','zh-CN','角色',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@ActionType','zh-CN','ActionType','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateBy','zh-CN','CreateBy','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','en-GB','Create By','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','en-US','Create By','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','zh-CN','创建人','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','en-GB','Create Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','en-US','Create Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','zh-CN','创建日期','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Description','en-US','Description','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Description','zh-CN','描述','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@ID','en-US','ID','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@ID','zh-CN','ID','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateBy','zh-CN','LastUpdateBy','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateByName','en-GB','Last Update By','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateByName','en-US','Last Update By','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateByName','zh-CN','更新人','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateDate','en-GB','Last Update Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateDate','en-US','Last Update Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateDate','zh-CN','更新日期','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Permissions','zh-CN','Permissions','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Status','en-GB','Status','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Status','en-US','Status','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Status','zh-CN','状态','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Title','en-GB','Title','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Title','en-US','Title','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Title','zh-CN','标题','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleID','zh-CN','角色',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Row','en-GB','Row',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Row','en-US','Row',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Row','zh-CN','行',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule','zh-CN','条件规则',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Description','en-GB','Description','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Description','en-US','Description','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Description','zh-CN','描述','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleID','en-GB','Rule','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleID','en-US','Rule','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleID','zh-CN','RuleID','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleItemList','en-GB','Rule Item List','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleItemList','en-US','Rule Item List','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleItemList','zh-CN','条件组','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Status','en-GB','Status','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Status','en-US','Status','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Status','zh-CN','状态','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Title','en-GB','Title','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Title','en-US','Title','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Title','zh-CN','标题','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@ZoneName','en-GB','Zone Name','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@ZoneName','en-US','Zone Name','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@ZoneName','zh-CN','显示区域','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Condition','en-GB','Condition','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Condition','en-US','Condition','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Condition','zh-CN','条件','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@FunctionName','en-GB','Function Name','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@FunctionName','en-US','Function Name','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@FunctionName','zh-CN','运算方式','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Property','en-GB','Property','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Property','en-US','Property','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Property','zh-CN','属性','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Value','en-GB','Value','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Value','en-US','Value','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Value','zh-CN','值','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Save','en-GB','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Save','en-US','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Save','zh-CN','保存',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Save Success','zh-CN','保存成功！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Scan all pages','zh-CN','检查所有页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ActionType','zh-CN','ActionType','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@AssemblyName','zh-CN','AssemblyName','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CreateBy','zh-CN','CreateBy','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CreatebyName','zh-CN','创建人','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CreateDate','zh-CN','创建日期','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CustomClass','zh-CN','CustomClass','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CustomStyle','zh-CN','CustomStyle','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Description','zh-CN','描述','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ExtendFields','zh-CN','扩展属性','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@FormView','zh-CN','FormView','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ID','zh-CN','ID','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@IsSystem','zh-CN','IsSystem','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@IsTemplate','zh-CN','保存为模板','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@LastUpdateBy','zh-CN','LastUpdateBy','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@LastUpdateByName','zh-CN','更新人','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@LastUpdateDate','zh-CN','更新日期','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@LayoutID','zh-CN','LayoutID','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@PageID','zh-CN','PageID','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@PartialView','zh-CN','显示模板','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Position','zh-CN','排序','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Script','zh-CN','脚本','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ServiceTypeName','zh-CN','ServiceTypeName','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Status','zh-CN','状态','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@StyleClass','zh-CN','自定义样式','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Thumbnail','zh-CN','缩略图','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Title','zh-CN','标题','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@WidgetName','zh-CN','组件名称','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ZoneID','zh-CN','区域','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Scroll','zh-CN','滚动',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search','zh-CN','搜 索',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Engine Optimization','en-GB','SEO',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Engine Optimization','en-US','SEO',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Engine Optimization','zh-CN','SEO优化',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Engine Search','zh-CN','站点搜索',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Page','zh-CN','搜索页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search result depends on the following information:','zh-CN','页面的搜索结果取决于搜索<strong>关键字</strong>是否和页面的以下信息匹配：',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchKeyword@Title','zh-CN','标题','SearchKeyword','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@AssemblyName','zh-CN','AssemblyName','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@IsSystem','zh-CN','IsSystem','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@IsTemplate','zh-CN','保存为模板','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@PartialView','zh-CN','显示模板','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@Position','zh-CN','排序','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@SearchKeywords','zh-CN','关键字','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@ServiceTypeName','zh-CN','ServiceTypeName','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@StyleClass','zh-CN','自定义样式','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@Thumbnail','zh-CN','缩略图','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@Title','zh-CN','标题','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@WidgetName','zh-CN','组件名称','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@ZoneID','zh-CN','区域','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Section Widget','en-GB','Custom Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Section Widget','en-US','Custom Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Section Widget','zh-CN','自定义',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@ActionType','zh-CN','ActionType','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@CreateBy','zh-CN','CreateBy','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@CreatebyName','zh-CN','创建人','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@CreateDate','zh-CN','创建日期','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@Description','zh-CN','描述','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@ID','zh-CN','ID','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@LastUpdateBy','zh-CN','LastUpdateBy','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@LastUpdateByName','zh-CN','更新人','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@LastUpdateDate','zh-CN','更新日期','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@Order','zh-CN','排序','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@SectionContentType','zh-CN','SectionContentType','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@SectionGroupId','zh-CN','SectionGroupId','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@SectionWidgetId','zh-CN','SectionWidgetId','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@Status','zh-CN','状态','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@Title','zh-CN','标题','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@ActionType','zh-CN','ActionType','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@CreateBy','zh-CN','CreateBy','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@CreatebyName','zh-CN','创建人','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@CreateDate','zh-CN','创建日期','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Description','zh-CN','描述','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Href','zh-CN','链接','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@ID','zh-CN','ID','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@InnerText','zh-CN','标题','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@LastUpdateByName','zh-CN','更新人','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@LastUpdateDate','zh-CN','更新日期','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Order','zh-CN','排序','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@SectionContentType','zh-CN','SectionContentType','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@SectionGroupId','zh-CN','SectionGroupId','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Status','zh-CN','状态','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Title','zh-CN','标题','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ActionType','zh-CN','ActionType','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@CreateBy','zh-CN','CreateBy','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@CreatebyName','zh-CN','创建人','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@CreateDate','zh-CN','创建日期','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Description','zh-CN','描述','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Height','zh-CN','高度(px)','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Href','zh-CN','链接','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ID','zh-CN','ID','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ImageAlt','zh-CN','说明','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ImageSrc','zh-CN','图片','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ImageTitle','zh-CN','标题','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@LastUpdateByName','zh-CN','更新人','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@LastUpdateDate','zh-CN','更新日期','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Order','zh-CN','排序','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@SectionContentType','zh-CN','SectionContentType','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@SectionGroupId','zh-CN','SectionGroupId','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Status','zh-CN','状态','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Title','zh-CN','标题','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Width','zh-CN','宽度(px)','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@ActionType','zh-CN','ActionType','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@CreateBy','zh-CN','CreateBy','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@CreatebyName','zh-CN','创建人','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@CreateDate','zh-CN','创建日期','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@Description','zh-CN','描述','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@HtmlContent','zh-CN','内容','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@ID','zh-CN','ID','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@LastUpdateByName','zh-CN','更新人','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@LastUpdateDate','zh-CN','更新日期','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@Order','zh-CN','排序','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@SectionContentType','zh-CN','SectionContentType','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@SectionGroupId','zh-CN','SectionGroupId','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@Status','zh-CN','状态','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@Title','zh-CN','标题','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@ActionType','zh-CN','ActionType','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@CreateBy','zh-CN','CreateBy','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@CreatebyName','zh-CN','创建人','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@CreateDate','zh-CN','创建日期','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Description','zh-CN','描述','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Href','zh-CN','链接','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@ID','zh-CN','ID','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@InnerText','zh-CN','标题','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@LastUpdateByName','zh-CN','更新人','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@LastUpdateDate','zh-CN','更新日期','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Order','zh-CN','排序','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@SectionContentType','zh-CN','SectionContentType','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@SectionGroupId','zh-CN','SectionGroupId','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Status','zh-CN','状态','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Title','zh-CN','标题','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@TitleLevel','zh-CN','等级','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@ActionType','zh-CN','ActionType','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Code','zh-CN','视频代码','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@CreateBy','zh-CN','CreateBy','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@CreatebyName','zh-CN','CreatebyName','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@CreateDate','zh-CN','CreateDate','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Description','zh-CN','描述','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Height','zh-CN','高度(px)','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@ID','zh-CN','ID','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@LastUpdateByName','zh-CN','LastUpdateByName','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@LastUpdateDate','zh-CN','LastUpdateDate','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Order','zh-CN','Order','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@SectionContentType','zh-CN','SectionContentType','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@SectionGroupId','zh-CN','SectionGroupId','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Status','zh-CN','状态','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Thumbnail','zh-CN','缩略图','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Title','zh-CN','Title','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Url','zh-CN','视频地址(MP4)','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@VideoTitle','zh-CN','标题','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Width','zh-CN','宽度(px)','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@ActionType','zh-CN','ActionType','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CallToAction','zh-CN','CallToAction','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CallToActions','zh-CN','CallToActions','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CreateBy','zh-CN','CreateBy','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CreatebyName','zh-CN','创建人','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CreateDate','zh-CN','创建日期','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Description','zh-CN','描述','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@GroupName','zh-CN','组名','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@ID','zh-CN','ID','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@IsLoadDefaultData','zh-CN','IsLoadDefaultData','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@LastUpdateBy','zh-CN','LastUpdateBy','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@LastUpdateByName','zh-CN','更新人','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@LastUpdateDate','zh-CN','更新日期','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Order','zh-CN','排序','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Paragraph','zh-CN','Paragraph','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Paragraphs','zh-CN','Paragraphs','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@PartialView','zh-CN','显示模板','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@PercentWidth','zh-CN','栅格列','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionContents','zh-CN','SectionContents','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionImage','zh-CN','SectionImage','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionImages','zh-CN','SectionImages','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionTitle','zh-CN','SectionTitle','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionTitles','zh-CN','SectionTitles','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionWidgetId','zh-CN','SectionWidgetId','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Status','zh-CN','状态','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Title','zh-CN','标题','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ActionType','zh-CN','ActionType','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@AssemblyName','zh-CN','AssemblyName','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CreateBy','zh-CN','CreateBy','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CreatebyName','zh-CN','创建人','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CreateDate','zh-CN','创建日期','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CustomClass','zh-CN','CustomClass','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CustomStyle','zh-CN','CustomStyle','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Description','zh-CN','描述','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ExtendData','zh-CN','ExtendData','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ExtendFields','zh-CN','扩展属性','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@FormView','zh-CN','FormView','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Groups','zh-CN','Groups','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ID','zh-CN','ID','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@IsHorizontal','zh-CN','水平分组','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@IsSystem','zh-CN','IsSystem','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@IsTemplate','zh-CN','保存为模板','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@LastUpdateBy','zh-CN','LastUpdateBy','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@LastUpdateByName','zh-CN','更新人','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@LastUpdateDate','zh-CN','更新日期','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@LayoutID','zh-CN','布局','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@PageID','zh-CN','页面','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@PartDriver','zh-CN','PartDriver','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@PartialView','zh-CN','显示模板','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Position','zh-CN','排序','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@SectionTitle','zh-CN','标题','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ServiceTypeName','zh-CN','ServiceTypeName','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Status','zh-CN','状态','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@StyleClass','zh-CN','自定义样式','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Template','zh-CN','Template','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Thumbnail','zh-CN','缩略图','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Title','zh-CN','标题','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@WidgetName','zh-CN','组件名称','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ZoneID','zh-CN','区域','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Secure Payment','zh-CN','安全支付',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Security','zh-CN','安全',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Select','zh-CN','选择',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Select All','zh-CN','全选',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Select package file','zh-CN','选择模板文件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Select widget then double click or click next.','zh-CN','选择组件，<strong>双击</strong>或者点击<strong>下一步</strong>',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SEO Description','zh-CN','SEO描述',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SEO Keywords','zh-CN','SEO关键字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('se-resize','zh-CN','向右下改变大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Setting','zh-CN','设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Setting have saved, but an error occur when clean cache.','zh-CN','配置保存成功，但清空缓存时发生异常，请重试！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shadow','en-GB','Shadow',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shadow','en-US','Shadow',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shadow','zh-CN','阴影',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shiped','zh-CN','已发货',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipped','zh-CN','已发货',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipped orders','zh-CN','已发货订单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipping','zh-CN','运费',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipping Address','zh-CN','收货地址',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipping Option','zh-CN','物流选项',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ShippingOption','zh-CN','物流选项',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shop','zh-CN','商城',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign in','en-GB','Sign in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign in','en-US','Sign in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign in','zh-CN','立即登录',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign Out','en-GB','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign Out','en-US','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign Out','zh-CN','退出',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign up','en-GB','Sign up',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign up','en-US','Sign up',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign up','zh-CN','立即注册',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Single domain','en-GB','Single domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Single domain','en-US','Single domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Single domain','zh-CN','单域名模式',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Single Line','zh-CN','单行输入',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Site Search','zh-CN','站内搜索',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Site Templates','en-GB','Templates',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Site Templates','en-US','Templates',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Site Templates','zh-CN','成品模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@AssemblyName','zh-CN','AssemblyName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@IsSystem','zh-CN','IsSystem','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@IsTemplate','zh-CN','保存为模板','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@PartialView','zh-CN','显示模板','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Position','zh-CN','排序','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@SearchEngine','zh-CN','搜索引擎',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@SearchQuery','zh-CN','Search Query','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ServiceTypeName','zh-CN','ServiceTypeName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@StyleClass','zh-CN','自定义样式','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Thumbnail','zh-CN','缩略图','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Title','zh-CN','标题','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@WidgetName','zh-CN','组件名称','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ZoneID','zh-CN','区域','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Size','zh-CN','大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SM Screen','zh-CN','小屏幕',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Small','zh-CN','小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Small Caps','zh-CN','小字体',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SMTP Config','en-GB','SMTP',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SMTP Config','en-US','SMTP',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SMTP Config','zh-CN','邮件服务器设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Email','en-US','Email','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Email','zh-CN','邮箱','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@EnableSsl','en-US','Enable Ssl','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@EnableSsl','zh-CN','启用SSL','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Host','en-US','Host','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Host','zh-CN','服务器','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@PassWord','en-US','Password','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@PassWord','zh-CN','密码','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Port','en-US','Port','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Port','zh-CN','端口','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Solid','zh-CN','实线',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Specify Article Detail','zh-CN','特定文章内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Split View','zh-CN','分裂视图',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewItem@ImageUrl','zh-CN','Image Url','SplitviewItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewItem@TargetLink','zh-CN','Target Link','SplitviewItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@AssemblyName','zh-CN','Assembly Name','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@Images','zh-CN','图片','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@IsSystem','zh-CN','Is System','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@IsTemplate','zh-CN','保存为模板','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@PartialView','zh-CN','显示模板','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@Position','zh-CN','排序','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@ServiceTypeName','zh-CN','Service Type Name','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@StyleClass','zh-CN','自定义样式','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@Thumbnail','zh-CN','缩略图','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@Title','zh-CN','标题','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@ViewModelTypeName','zh-CN','View Model Type Name','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@WidgetName','zh-CN','组件名称','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@ZoneID','zh-CN','区域','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('s-resize','zh-CN','向下改变大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Standalone domain','en-GB','Standalone domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Standalone domain','en-US','Standalone domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Standalone domain','zh-CN','独立域名模式',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Starts With','en-GB','Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Starts With','en-US','Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Starts With','zh-CN','以…开头',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Static','zh-CN','静止',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StaticPageSetting@CacheMinutes','zh-CN','缓存时间（分钟）',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StaticPageSetting@CacheProvider','zh-CN','缓存方式',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StaticPageSetting@Enable','zh-CN','启用？',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StaticPageSetting@ExcludePages','zh-CN','例外页面',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@ActionType','zh-CN','ActionType','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@ContactName','zh-CN','ContactName','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@CreateBy','zh-CN','CreateBy','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@CreatebyName','zh-CN','CreatebyName','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@CreateDate','zh-CN','CreateDate','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Description','zh-CN','描述','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Host','zh-CN','Host','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@IpAddress','zh-CN','IpAddress','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@LastUpdateBy','zh-CN','LastUpdateBy','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@LastUpdateByName','zh-CN','LastUpdateByName','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@LastUpdateDate','zh-CN','LastUpdateDate','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@StatisticsId','zh-CN','StatisticsId','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Status','zh-CN','状态','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Tel','zh-CN','Tel','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Title','zh-CN','标题','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Location','en-US','Location','StatisticsScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Location','zh-CN','位置','GlobalScripts','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Script','en-US','Script','StatisticsScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Script','zh-CN','脚本','StatisticsScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Status','zh-CN','状态',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StrongPoint@Description','zh-CN','描述','StrongPoint','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StrongPoint@Title','zh-CN','名称','StrongPoint','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style','en-GB','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style','en-US','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style','zh-CN','样式',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style A','zh-CN','样式A',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style B','zh-CN','样式B',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style C','zh-CN','样式C',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style D','zh-CN','样式D',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style E','zh-CN','样式E',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style F','zh-CN','样式F',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style G','zh-CN','样式G',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleClass','zh-CN','自定义样式',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ActionType','zh-CN','ActionType','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@AssemblyName','zh-CN','AssemblyName','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CreateBy','zh-CN','CreateBy','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CreatebyName','zh-CN','创建人','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CreateDate','zh-CN','创建日期','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CustomClass','zh-CN','CustomClass','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CustomStyle','zh-CN','CustomStyle','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Description','zh-CN','描述','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ExtendFields','zh-CN','扩展属性','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@FormView','zh-CN','FormView','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ID','zh-CN','ID','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@IsSystem','zh-CN','IsSystem','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@IsTemplate','zh-CN','保存为模板','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@LastUpdateBy','zh-CN','LastUpdateBy','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@LastUpdateByName','zh-CN','更新人','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@LastUpdateDate','zh-CN','更新日期','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@LayoutID','zh-CN','LayoutID','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@PageID','zh-CN','PageID','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@PartDriver','zh-CN','PartDriver','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@PartialView','zh-CN','显示模板','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Position','zh-CN','排序','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ServiceTypeName','zh-CN','ServiceTypeName','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Status','zh-CN','状态','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@StyleClass','zh-CN','自定义样式','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@StyleSheet','zh-CN','样式','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Thumbnail','zh-CN','缩略图','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Title','zh-CN','标题','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@WidgetName','zh-CN','组件名称','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ZoneID','zh-CN','区域','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Submit','zh-CN','提交',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscribe','en-US','Subscribe',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscribe','zh-CN','订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@CreatebyName','zh-CN','创建人',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@CreateDate','zh-CN','创建日期',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@Email','zh-CN','邮箱','Subscriber','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@IsValidate','zh-CN','已验证？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@LastUpdateByName','zh-CN','更新人',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@LastUpdateDate','zh-CN','更新日期',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@Referrer','zh-CN','来源',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@Status','zh-CN','状态','Subscriber','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription','en-US','Subscription',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription','zh-CN','订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Body_Copy','en-US','Subscribe by email, you will be able to receive our related information at the first time',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Body_Copy','zh-CN','通过邮箱订阅我们，您将可以在第一时间收到我们的相关信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Button','en-US','Yes, I want to subscribe',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Button','zh-CN','是的，我想要订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Copy','en-US','You will not be subscribed if you don''t click on the link above.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Copy','zh-CN','如果您不点击上方链接，您将不会订阅我们。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Title','en-US','Confirm Your Subscription',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Title','zh-CN','确认订阅我们',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Button','en-US','Yes, I want to unsubscribe',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Button','zh-CN','是的，我想要取消订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Copy','en-US','You will not be unsubscribed if you don''t click on the link above.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Copy','zh-CN','如果您不点击上方链接，您将不会取消订阅我们。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Title','en-US','Unsubscribe confirm',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Title','zh-CN','取消订阅我们',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Footer_Copy','en-US','We promise to handle your information in line with our privacy policy.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Footer_Copy','zh-CN','我们承诺严格遵守隐私政策处理您的信息。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Header_Copy','en-US','Be the first to know',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Header_Copy','zh-CN','第一时间了解最新动态',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Subscribe_Thank_Copy','en-US','Thanks for confirming your email address!',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Subscribe_Thank_Copy','zh-CN','感谢您确认您的邮件地址！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Subscribed_Title','en-US','You''ve Been Subscribed',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Subscribed_Title','zh-CN','您已订阅成功',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribed_Copy','en-US','We have sent you an email to confirm',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribed_Copy','zh-CN','我们已经给您发送了取消订阅确认邮件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribed_Title','en-US','You''ve Been Unsubscribed',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribed_Title','zh-CN','您已取消订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribing_Copy','en-US','We will send you an email to confirm',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribing_Copy','zh-CN','我们会给您发送取消订阅确认邮件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribing_Title','en-US','You are unsubscribing',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribing_Title','zh-CN','您正在取消订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SubscriptionSetting@IsEnable','zh-CN','是否启用？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subtotal','zh-CN','小计',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Success','zh-CN','成功',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Summary','zh-CN','摘要',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Switch Template','zh-CN','切换模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Switching Theme...','zh-CN','切换主题中...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('sw-resize','zh-CN','向左下改变大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('System','en-GB','System',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('System','en-US','System',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('System','zh-CN','系统',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tab','zh-CN','标签页',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabItem@Description','zh-CN','描述','TabItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabItem@Status','zh-CN','状态','TabItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabItem@Title','zh-CN','标题','TabItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tablet (≥768px)','zh-CN','平板 (≥768px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@AssemblyName','zh-CN','Assembly Name','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@IsSystem','zh-CN','Is System','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@IsTemplate','zh-CN','保存为模板','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@PartialView','zh-CN','显示模板','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@Position','zh-CN','排序','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@ServiceTypeName','zh-CN','Service Type Name','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@StyleClass','zh-CN','自定义样式','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@TabItems','zh-CN','标签项','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@Thumbnail','zh-CN','缩略图','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@Title','zh-CN','标题','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@ViewModelTypeName','zh-CN','View Model Type Name','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@WidgetName','zh-CN','组件名称','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@ZoneID','zh-CN','区域','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tag','en-GB','Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tag','en-US','Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tag','zh-CN','标签',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tax','zh-CN','税',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tax Rate','zh-CN','税率',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TaxRate','zh-CN','税率',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@Content','zh-CN','模板代码','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@Id','zh-CN','Id','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@LastUpdateTime','en-US','Last Update Time','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@LastUpdateTime','zh-CN','最后更新时间','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@Name','en-US','Name','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@Name','zh-CN','名称','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@RelativePath','en-US','Relative Path','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@RelativePath','zh-CN','模板路径','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@ThemeName','en-US','Theme Name','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@ThemeName','zh-CN','主题','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Test Page','en-GB','Test Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Test Page','en-US','Test Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Test Page','zh-CN','页面检测',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text','zh-CN','文本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Blur','zh-CN','模糊',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Cursor','zh-CN','光标',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Horizontal','zh-CN','水平大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Shadow','zh-CN','文字阴影',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Title','en-GB','Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Title','en-US','Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Title','zh-CN','文字标题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Vertical','zh-CN','垂直大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Thank you for sign up','en-GB','Thank you!',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Thank you for sign up','en-US','Thank you!',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Thank you for sign up','zh-CN','注册结果',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The max length of {0} is {1}','zh-CN','{0}的长度应小于{1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The order is closed!','zh-CN','订单已关闭！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page more than a <h1> tag','zh-CN','页面中的<h1>标签超过了1个',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page must be published before it can be accessed via the URL.','zh-CN','只有在页面发布之后才可查看！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page must be published before it can be accessed via the URL. Modifying the page does not affect','en-GB','The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page must be published before it can be accessed via the URL. Modifying the page does not affect','en-US','The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page must be published before it can be accessed via the URL. Modifying the page does not affect','zh-CN','页面必须要发布才可以通过网址访问。对页面进行修改不会影响到已发布版本，直到下一次发布。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page should have a <h1> tag','zh-CN','页面中应当有一个<h1>标签',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The parent node does not create a corresponding language','zh-CN','父级结节未创建对应语言',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The setting key is already exists','zh-CN','已经存在该键值',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The template is being used, could not delete','zh-CN','该模板被使用中，无法删除',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Theme','en-GB','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Theme','en-US','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Theme','zh-CN','主题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Theme Template','zh-CN','主题模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@ActionType','zh-CN','ActionType','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@CreateBy','zh-CN','CreateBy','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@CreatebyName','zh-CN','CreatebyName','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@CreateDate','zh-CN','CreateDate','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Description','zh-CN','描述','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@ID','zh-CN','ID','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@IsActived','zh-CN','IsActived','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@IsPreView','zh-CN','IsPreView','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@LastUpdateBy','zh-CN','LastUpdateBy','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@LastUpdateByName','zh-CN','LastUpdateByName','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@LastUpdateDate','zh-CN','LastUpdateDate','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Status','zh-CN','状态','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Title','zh-CN','标题','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Url','zh-CN','Url','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@UrlDebugger','zh-CN','UrlDebugger','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('There is an error value in the condition, save failed!','zh-CN','条件中的值有错误，保存失败！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('There is no messages...','zh-CN','还没有留言……',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('This is required','zh-CN','这是必填项',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Thumbnail','zh-CN','缩略图',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Title','zh-CN','标题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Today','en-GB','Today',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Today','en-US','Today',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Today','zh-CN','当前日期',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Toggle Container','zh-CN','切换容器',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Top Article','en-GB','Top Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Top Article','en-US','Top Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Top Article','zh-CN','置顶文章',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Total','zh-CN','总计',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Total Articles:','zh-CN','文章总数：',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Total Comments','zh-CN','条评论',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Total:','zh-CN','合计：',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tracking number:','zh-CN','运单：',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Traid Finished','zh-CN','交易完成',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translate','en-GB','Translate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translate','en-US','Translate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translate','zh-CN','翻译',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation','en-GB','Translation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation','en-US','Translation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation','zh-CN','翻译内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation Key','en-GB','Key',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation Key','en-US','Key',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation Key','zh-CN','翻译键',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation key is already exists','zh-CN','翻译键已存在',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Underline','zh-CN','底线',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Underline Overline','zh-CN','上下线',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unmarried','en-GB','Unmarried',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unmarried','en-US','Unmarried',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unmarried','zh-CN','未婚',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unpaid','zh-CN','未支付',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unpaid order','zh-CN','订单未支付',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unpaid orders','zh-CN','未支付订单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unpublished','zh-CN','未发布',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unsubscribe','en-US','Unsubscribe',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unsubscribe','zh-CN','取消订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Update Index','zh-CN','更新索引',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Update site index','zh-CN','更新网站索引',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload','en-GB','Upload',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload','en-US','Upload',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload','zh-CN','上传文件',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload failed','zh-CN','文件上传失败',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload Section','en-GB','Upload Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload Section','en-US','Upload Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload Section','zh-CN','安装板块',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Uppercase','zh-CN','大写',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('URL already exists','zh-CN','Url已存在',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Url Redirect','en-GB','Url  Redirect',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Url Redirect','en-US','Url  Redirect',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Url Redirect','zh-CN','URL重定向',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@ActionType','zh-CN','ActionType','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateBy','zh-CN','CreateBy','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreatebyName','en-GB','Create By','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreatebyName','en-US','Create By','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreatebyName','zh-CN','创建人','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateDate','en-GB','Create Date','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateDate','en-US','Create Date','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateDate','zh-CN','创建日期','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Description','en-GB','Description','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Description','en-US','Description','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Description','zh-CN','描述','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@DestinationURL','en-GB','Destination Url',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@DestinationURL','en-US','Destination Url',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@DestinationURL','zh-CN','跳转地址',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@ID','zh-CN','ID','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@InComingUrl','en-GB','In Coming Url','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@InComingUrl','en-US','In Coming Url','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@InComingUrl','zh-CN','访问地址','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPattern','zh-CN','使用正则表达式？',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','en-GB','Is Permanent','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','en-US','Is Permanent','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','zh-CN','永久？','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateBy','zh-CN','LastUpdateBy','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateByName','en-GB','Last Update By','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateByName','en-US','Last Update By','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateByName','zh-CN','更新人','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateDate','en-GB','Last Update Date','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateDate','en-US','Last Update Date','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateDate','zh-CN','更新日期','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Status','en-GB','Status','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Status','en-US','Status','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Status','zh-CN','状态','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Title','en-GB','Title','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Title','en-US','Title','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Title','zh-CN','标题','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('User','en-GB','User',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('User','en-US','User',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('User','zh-CN','用户',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('User name password is incorrect','zh-CN','用户名密码不正确',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ActionType','zh-CN','ActionType','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Address','en-GB','Address','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Address','en-US','Address','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Address','zh-CN','地址','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Age','en-GB','Age','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Age','en-US','Age','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Age','zh-CN','年龄','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ApiLoginToken','zh-CN','ApiLoginToken','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@AuthenticationType','zh-CN','AuthenticationType','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthday','en-GB','Birthday','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthday','en-US','Birthday','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthday','zh-CN','出生日期','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthplace','en-GB','Birthplace','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthplace','en-US','Birthplace','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthplace','zh-CN','出生地','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreateBy','zh-CN','CreateBy','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreatebyName','en-GB','Create By','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreatebyName','en-US','Create By','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreatebyName','zh-CN','创建人','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreateDate','en-GB','Create Date','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreateDate','en-US','Create Date','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreateDate','zh-CN','创建日期','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Description','en-GB','Description','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Description','en-US','Description','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Description','zh-CN','描述','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Email','en-GB','Email','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Email','en-US','Email','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Email','zh-CN','邮箱','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@EnglishName','en-GB','English Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@EnglishName','en-US','English Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@EnglishName','zh-CN','英文名','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@FirstName','en-GB','First Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@FirstName','en-US','First Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@FirstName','zh-CN','名','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Hobby','en-GB','Hobby','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Hobby','en-US','Hobby','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Hobby','zh-CN','爱好','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ID','zh-CN','ID','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@IsAuthenticated','zh-CN','IsAuthenticated','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastLoginDate','zh-CN','最后登录时间','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastName','en-GB','Last Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastName','en-US','Last Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastName','zh-CN','姓','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateBy','zh-CN','LastUpdateBy','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateByName','en-GB','Last Update By','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateByName','en-US','Last Update By','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateByName','zh-CN','更新人','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateDate','en-GB','Last Update Date','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateDate','en-US','Last Update Date','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateDate','zh-CN','更新日期','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LoginIP','zh-CN','LoginIP','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MaritalStatus','en-GB','Marital Status','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MaritalStatus','en-US','Marital Status','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MaritalStatus','zh-CN','婚姻情况','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MobilePhone','en-GB','Mobile Phone','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MobilePhone','en-US','Mobile Phone','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MobilePhone','zh-CN','手机号码','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Name','zh-CN','Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@NickName','en-GB','Nick Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@NickName','en-US','Nick Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@NickName','zh-CN','昵称','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWord','zh-CN','密码','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWordNew','en-GB','Pass Word New','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWordNew','en-US','Pass Word New','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWordNew','zh-CN','密码','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PhotoUrl','en-GB','Photo Url','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PhotoUrl','en-US','Photo Url','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PhotoUrl','zh-CN','头像','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Profession','en-GB','Profession','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Profession','en-US','Profession','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Profession','zh-CN','专业技能','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@QQ','en-GB','QQ',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@QQ','en-US','QQ',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@QQ','zh-CN','QQ',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ResetToken','zh-CN','ResetToken','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ResetTokenDate','zh-CN','ResetTokenDate','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Roles','en-GB','Roles','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Roles','en-US','Roles','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Roles','zh-CN','角色','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@School','en-GB','School','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@School','en-US','School','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@School','zh-CN','学校','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Sex','en-GB','Sex','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Sex','en-US','Sex','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Sex','zh-CN','性别','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Status','en-GB','Status','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Status','en-US','Status','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Status','zh-CN','状态','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Telephone','en-GB','Telephone','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Telephone','en-US','Telephone','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Telephone','zh-CN','联系电话','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Timestamp','en-GB','Timestamp','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Timestamp','en-US','Timestamp','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Timestamp','zh-CN','Timestamp','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Title','zh-CN','标题','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserID','en-GB','User','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserID','en-US','User','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserID','zh-CN','登录名','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserName','en-GB','User Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserName','en-US','User Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserName','zh-CN','用户名','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserTypeCD','en-GB','User Type',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserTypeCD','en-US','User Type',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserTypeCD','zh-CN','用户类别',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ZipCode','en-GB','Zip Code','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ZipCode','en-US','Zip Code','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ZipCode','zh-CN','邮编','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Username','en-GB','Username',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Username','en-US','Username',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Username','zh-CN','姓名',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@ActionType','zh-CN','ActionType','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@CreateBy','zh-CN','CreateBy','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@CreatebyName','zh-CN','创建人','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@CreateDate','zh-CN','创建日期','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@Description','zh-CN','描述','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@ID','zh-CN','ID','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@LastUpdateBy','zh-CN','LastUpdateBy','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@LastUpdateByName','zh-CN','更新人','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@LastUpdateDate','zh-CN','更新日期','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@RoleID','en-GB','Role','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@RoleID','en-US','Role','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@RoleID','zh-CN','角色','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@Status','zh-CN','状态','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@Title','zh-CN','标题','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@UserID','zh-CN','登录名','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Value','zh-CN','值',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Version','en-GB','Version',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Version','en-US','Version',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Version','zh-CN','版本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Versions','en-GB','Versions',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Versions','en-US','Versions',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Versions','zh-CN','历史版本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Video','en-GB','Video',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Video','en-US','Video',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Video','zh-CN','视频',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ActionType','zh-CN','ActionType','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@AssemblyName','zh-CN','AssemblyName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Code','zh-CN','视频代码','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CreateBy','zh-CN','CreateBy','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CreatebyName','zh-CN','CreatebyName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CreateDate','zh-CN','CreateDate','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CustomClass','zh-CN','CustomClass','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CustomStyle','zh-CN','CustomStyle','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Description','zh-CN','描述','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ExtendFields','zh-CN','扩展属性','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@FormView','zh-CN','FormView','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Height','zh-CN','高度(px)','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ID','zh-CN','ID','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@IsSystem','zh-CN','IsSystem','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@IsTemplate','zh-CN','保存为模板','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@LastUpdateBy','zh-CN','LastUpdateBy','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@LastUpdateByName','zh-CN','LastUpdateByName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@LastUpdateDate','zh-CN','LastUpdateDate','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@LayoutID','zh-CN','LayoutID','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@PageID','zh-CN','PageID','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@PartialView','zh-CN','显示模板','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Position','zh-CN','排序','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ServiceTypeName','zh-CN','ServiceTypeName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Status','zh-CN','状态','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@StyleClass','zh-CN','自定义样式','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Thumbnail','zh-CN','缩略图','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Title','zh-CN','标题','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Url','zh-CN','视频地址(MP4)','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@WidgetName','zh-CN','组件名称','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Width','zh-CN','宽度(px)','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ZoneID','zh-CN','区域','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View','en-GB','View',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View','en-US','View',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View','zh-CN','查看',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Article','zh-CN','查看文章',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Article Category','zh-CN','查看文章类别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Carousel','zh-CN','查看焦点图',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Comments','zh-CN','查看评论',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Commits','zh-CN','查看评论',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Content','zh-CN','查看内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Content Template','zh-CN','查看内容模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Content Type','zh-CN','查看内容类型',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Detail','zh-CN','查看详细',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Form','zh-CN','查看表单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Form Data','zh-CN','查看表单数据',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Layouts','en-GB','View Layouts',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Layouts','en-US','View Layouts',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Layouts','zh-CN','查看布局',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Log','zh-CN','查看错误日志',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Media','zh-CN','查看媒体库',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Message','zh-CN','查看留言',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Navigation','zh-CN','查看导航',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Order','zh-CN','查看订单',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pages','en-GB','View Pages',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pages','en-US','View Pages',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pages','zh-CN','查看页面',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pending Page','en-GB','View Pending Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pending Page','en-US','View Pending Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pending Page','zh-CN','预览编辑版本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Product','zh-CN','查看产品',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Product Category','zh-CN','查看产品类别',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Product Tag','zh-CN','查看产品标签',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Published Page','en-GB','View Published Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Published Page','en-US','View Published Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Published Page','zh-CN','预览发布版本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Refund','zh-CN','查看支付平台退款信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Role','zh-CN','查看角色',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Setting','zh-CN','查看设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Site','en-GB','View Site',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Site','en-US','View Site',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Site','zh-CN','查看站点',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Subscription','zh-CN','查看订阅',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Template','zh-CN','查看模板',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Theme','zh-CN','查看主题',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Transactions','zh-CN','查看支付平台支付信息',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View URL Redirection','zh-CN','查看URL重定向',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Users','zh-CN','查看用户',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View: View the published page','en-GB','View: View the published page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View: View the published page','en-US','View: View the published page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View: View the published page','zh-CN','查看：查看已发布版本',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Visibility','zh-CN','可见性',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Visible','zh-CN','可见',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Wait','zh-CN','等待',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Warning','zh-CN','警告',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('We have prepared a few links for you to get started:','en-GB','We have prepared a few links for you to get started:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('We have prepared a few links for you to get started:','en-US','We have prepared a few links for you to get started:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('We have prepared a few links for you to get started:','zh-CN','我们准备了几个链接供您开始：',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('We have sent the change password message to your email','zh-CN','我们已经给您的邮箱，发送了一封找回密码的邮件，请及时查收并修改密码。',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChat','en-GB','WeChat',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChat','en-US','WeChat',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChat','zh-CN','微信',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Wechat Config','zh-CN','配置微信登录',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPay','zh-CN','微信支付',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPay Setting','zh-CN','微信支付集成设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@AppId','zh-CN','AppId',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@AppSecret','zh-CN','应用密钥',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@Certificate','zh-CN','API证书',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@CertificatePassword','zh-CN','证书密码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@IsEnable','zh-CN','是否启用',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@Key','zh-CN','API密钥',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@MchId','zh-CN','商户ID',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@RsaPublicKey','zh-CN','RSA公钥',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@V3Key','zh-CN','APIv3密钥',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeiBo','en-GB','WeiBo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeiBo','en-US','WeiBo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeiBo','zh-CN','微博',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeiBo Config','zh-CN','配置微博登录',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome','en-GB','Welcome',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome','en-US','Welcome',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome','zh-CN','欢迎',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome to use ZKEACMS','en-GB','Welcome to use ZKEACMS',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome to use ZKEACMS','en-US','Welcome to use ZKEACMS',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome to use ZKEACMS','zh-CN','欢迎使用ZKEACMS',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Widget Setting','en-GB','Setting',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Widget Setting','en-US','Setting',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Widget Setting','zh-CN','组件设置',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ActionType','zh-CN','ActionType','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@AssemblyName','zh-CN','AssemblyName','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CreateBy','zh-CN','CreateBy','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CreatebyName','zh-CN','创建人','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CreateDate','zh-CN','创建日期','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CustomClass','zh-CN','CustomClass','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CustomStyle','zh-CN','CustomStyle','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Description','zh-CN','描述','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ExtendFields','zh-CN','扩展属性','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@FormView','zh-CN','FormView','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ID','zh-CN','ID','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@IsSystem','zh-CN','IsSystem','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@IsTemplate','zh-CN','保存为模板','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@LastUpdateBy','zh-CN','LastUpdateBy','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@LastUpdateByName','zh-CN','更新人','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@LastUpdateDate','zh-CN','更新日期','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@LayoutID','zh-CN','布局','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@PageID','zh-CN','页面','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@PartDriver','zh-CN','PartDriver','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@PartialView','zh-CN','显示模板','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Position','zh-CN','排序','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ServiceTypeName','zh-CN','ServiceTypeName','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Status','zh-CN','状态','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@StyleClass','zh-CN','自定义样式','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Thumbnail','zh-CN','缩略图','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Title','zh-CN','标题','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@WidgetName','zh-CN','组件名称','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ZoneID','zh-CN','区域','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetName','zh-CN','组件名称',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ActionType','zh-CN','ActionType','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@AssemblyName','zh-CN','AssemblyName','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@CreateBy','zh-CN','CreateBy','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@CreatebyName','zh-CN','创建人','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@CreateDate','zh-CN','创建日期','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Description','zh-CN','描述','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@FormView','zh-CN','FormView','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@GroupName','zh-CN','组名','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ID','zh-CN','ID','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@LastUpdateBy','zh-CN','LastUpdateBy','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@LastUpdateByName','zh-CN','更新人','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@LastUpdateDate','zh-CN','更新日期','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Order','zh-CN','排序','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@PartialView','zh-CN','显示模板','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ServiceTypeName','zh-CN','ServiceTypeName','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Status','zh-CN','状态','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Title','zh-CN','标题','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Width / Height','zh-CN','宽 / 高',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Width(px)','zh-CN','宽(px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Word Spacing','zh-CN','词间距',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('w-resize','zh-CN','向左改变大小',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('XS Screen','zh-CN','超小屏幕',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Yes','zh-CN','是',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your account has been created successfully','en-GB','Your account has been created successfully',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your account has been created successfully','en-US','Your account has been created successfully',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your account has been created successfully','zh-CN','您的账号已经创建成功',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your basket is empty','zh-CN','您的购物车是空的',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your email address','en-GB','Your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your email address','en-US','Your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your email address','zh-CN','输入您常使用的邮箱地址',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your name','zh-CN','你的名字',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zip Code','en-GB','Zip Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zip Code','en-US','Zip Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zip Code','zh-CN','邮政编码',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zone','zh-CN','区域',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zone Name','zh-CN','区域名称',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@ActionType','zh-CN','ActionType','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@CreateBy','zh-CN','CreateBy','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@CreatebyName','zh-CN','创建人','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@CreateDate','zh-CN','创建日期','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@Description','zh-CN','描述','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@HeadingCode','zh-CN','HeadingCode','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@ID','zh-CN','ID','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@LastUpdateBy','zh-CN','LastUpdateBy','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@LastUpdateByName','zh-CN','更新人','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@LastUpdateDate','zh-CN','更新日期','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@LayoutId','zh-CN','布局','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@PageId','zh-CN','Page','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@Status','zh-CN','状态','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@Title','zh-CN','标题','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@ZoneName','zh-CN','ZoneName','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneID','zh-CN','区域',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('中等屏幕','zh-CN','MD Screen',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('主题管理','en-GB','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('主题管理','en-US','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品展示','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品展示','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用QQ登录','en-GB','Sign in with QQ',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用QQ登录','en-US','Sign in with QQ',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用帮助','en-GB','Help',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用帮助','en-US','Help',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用微博登录','en-GB','Sign in with weibo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用微博登录','en-US','Sign in with weibo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('保存修改','en-GB','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('保存修改','en-US','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('全局内容','en-GB','Layer',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('全局内容','en-US','Layer',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('分隔符','en-GB','Separator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('分隔符','en-US','Separator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('商业授权','en-GB','Commercial',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('商业授权','en-US','Commercial',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例三','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例三','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例三（圆）','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例三（圆）','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例二','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例二','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例二（圆）','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例二（圆）','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片右','en-GB','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片右','en-US','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片右（圆）','en-GB','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片右（圆）','en-US','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左（圆）','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左（圆）','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左（平分）','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左（平分）','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名不能为空','en-GB','Username is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名不能为空','en-US','Username is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名的长度应小于50','en-GB','The length of the name should be less than 50',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名的长度应小于50','en-US','The length of the name should be less than 50',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('字段名','en-GB','Display Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('字段名','en-US','Display Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('安全退出','en-GB','Sign out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('安全退出','en-US','Sign out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码不能为空','en-GB','Please input your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码不能为空','en-US','Please input your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码的长度应小于20','en-GB','The length of the password should be less than 20',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码的长度应小于20','en-US','The length of the password should be less than 20',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性','en-GB','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性','en-US','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性','zh-CN','属性',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('工具栏','en-GB','Toolbar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('工具栏','en-US','Toolbar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('巨幕','en-GB','Jumbotron',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('巨幕','en-US','Jumbotron',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字三列','en-GB','Three Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字三列','en-US','Three Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字二列','en-GB','Tow Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字二列','en-US','Tow Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('模板代码','en-GB','Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('模板代码','en-US','Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('用户名','en-GB','User Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('用户名','en-US','User Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('登录','en-GB','Sign In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('登录','en-US','Sign In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('登录邮箱不能为空','en-GB','Please input your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('登录邮箱不能为空','en-US','Please input your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('组件不能正确地显示在页面中，可能是因为您删除了原先的区域','zh-CN','组件不能正确地显示在页面中，可能是因为您删除了原先的区域',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义样式','en-GB','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义样式','en-US','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自适应','en-GB','Fluid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自适应','en-US','Fluid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('说明文档','en-GB','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('说明文档','en-US','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请确认密码','en-GB','Please confirm your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请确认密码','en-US','Please confirm your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您注册时使用的邮箱地址','en-GB','Enter your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您注册时使用的邮箱地址','en-US','Enter your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您的密码','en-GB','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您的密码','en-US','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入的邮件格式不正确','en-GB','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入的邮件格式不正确','en-US','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入的邮箱格式不正确','en-GB','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入的邮箱格式不正确','en-US','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('退出登录','en-GB','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('退出登录','en-US','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('选中产品类别，创建标签','en-GB','Click product category then add tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('选中产品类别，创建标签','en-US','Click product category then add tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('选择类别，进行手动排序','en-GB','Click category to sort the products',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('选择类别，进行手动排序','en-US','Click category to sort the products',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮箱的长度应小于200','en-GB','The length of the email should be less than 200',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮箱的长度应小于200','en-US','The length of the email should be less than 200',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('配置保存成功，但清空缓存时发生异常，请重试！','zh-CN','配置保存成功，但清空缓存时发生异常，请重试！',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('配置通知邮箱','en-GB','Notification',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('配置通知邮箱','en-US','Notification',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('间距','en-GB','Gap',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('间距','en-US','Gap',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页头','en-GB','Header',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页头','en-US','Header',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('须要处理','zh-CN','须要处理',NULL,NULL);
INSERT INTO [Forms] ([ID],[Title],[FieldsData],[NotificationReceiver],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('5ed56d90ac154e73befa6fbc981ae3ae','问卷调查','[{"ID":"f05da60a6e3b448fadbf7c5c040a7d5c","Name":"Label","DisplayName":"一个简单的问卷调查","Value":null,"Description":"欢迎您使用ZKEACMS，这是一个自定义表单","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"41481e6eefa048feae380460b0cd5661","Name":"SingleLine","DisplayName":"姓名","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"bfd1418684a64890a7099f764baa24b3","Name":"Number","DisplayName":"电话","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"7e635c8fdd124b6b94f037d3bf112bc0","Name":"Email","DisplayName":"邮箱地址","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"4d61bb5f733c47778975cc6cfbc84123","Name":"SingleLine","DisplayName":"QQ","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"b85aeb9beaf64f509726f16ba582ec3c","Name":"SingleLine","DisplayName":"微信","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"a2aea72c496e4a458265f7ceadb3653a","Name":"Address","DisplayName":"省份地址","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"0932ca1f1f7f4af098d51e4b1ac18b94","Name":"SingleLine","DisplayName":"详细地址","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"572c61930769464d97f3d31771ecf65e","Name":"Radio","DisplayName":"您从哪里了解到ZKEACMS","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"搜索引擎","Value":"70a915caf7a84e9086d5dbdf26ed3053"},{"DisplayText":"博客园","Value":"419a7d1d91974282af5c26688fbe0e8c"},{"DisplayText":"朋友介绍","Value":"227f6d2f6b39479aaf2d5b79dbefdc5c"},{"DisplayText":"其它论坛","Value":"ef50fb3bccf74d6487320e53781fb1ec"}],"AdditionalSettings":null},{"ID":"845830a5c8be4b81866a8cef83049899","Name":"Checkbox","DisplayName":"您一般使用ZKEACMS做什么","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"网站","Value":"5f0fbb9faa0343e0958a896fe3cead4f"},{"DisplayText":"博客","Value":"65902e51d35142019c4aab8badff9e35"},{"DisplayText":"其它","Value":"944343b3ed904b94a9db6950dbdcccf3"}],"AdditionalSettings":null},{"ID":"2fe6e4baf01e4cb897986991c920df56","Name":"Dropdown","DisplayName":"您觉得ZKEACMS怎么样","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"很不错","Value":"fc3929826e364318b7a3436d991fb097"},{"DisplayText":"还可以","Value":"619e09c2864b41ae81f4f90e7cab92ba"},{"DisplayText":"有待提高","Value":"fd1279a07150490f9a1f69c85298e22c"},{"DisplayText":"不怎么样","Value":"ef19983754504a9482232dd6be01f34d"}],"AdditionalSettings":null},{"ID":"2868de2d8e9b4d269da891342e6dc95b","Name":"Paragraph","DisplayName":"您的意见或建议","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null}]',NULL,NULL,'',NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:07:58.013');
INSERT INTO [DBVersion] ([ID],[Major],[Minor],[Revision],[Build]) VALUES (1,3,4,0,0);
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
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EnableResponsiveDesign','true',NULL,NULL,1,NULL,NULL,'2020-03-14 11:32:07.333',NULL,NULL,'2020-03-14 11:32:07.333');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ExpandAllPage','true',NULL,NULL,1,'admin','ZKEASOFT','2018-04-11 17:01:47.230','admin','ZKEASOFT','2018-04-11 17:01:47.233');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Favicon','~/favicon.ico',NULL,NULL,NULL,'admin','ZKEASOFT','2017-03-19 20:57:33.627','admin','ZKEASOFT','2017-03-19 20:57:33.627');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('OuterChainPicture','false',NULL,NULL,1,NULL,NULL,'2019-07-31 12:09:28.430',NULL,NULL,'2019-07-31 12:09:28.430');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SiteInformation_Logo_Mini','/images/logo_min.png',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.370','admin','ZKEASOFT','2021-03-06 22:16:20.370');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SiteInformation_SiteName','ZKEASOFT',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.310','admin','ZKEASOFT','2021-03-06 22:16:20.310');
COMMIT;

