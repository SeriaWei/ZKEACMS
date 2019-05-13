-- Script Date: 2019/5/13 15:56  - ErikEJ.SqlCeScripting version 3.5.2.56
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
, CONSTRAINT [PK__Roles__3214EC27454A69F9] PRIMARY KEY ([ID])
);
CREATE TABLE [UserRoleRelation] (
  [ID] INTEGER NOT NULL
, [RoleID] int NULL
, [UserID] nvarchar(50) NULL
, CONSTRAINT [PK__UserRole__3214EC27B41C6537] PRIMARY KEY ([ID])
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
CREATE TABLE [ArticleSpecialDetailWidget] (
  [ID] nvarchar(100) NOT NULL
, [ArticleId] int NULL
, [ArticleName] nvarchar(100) NULL
, CONSTRAINT [PK_ArticleSpecialDetailWidget] PRIMARY KEY ([ID])
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
INSERT INTO [Users] ([UserID],[PassWord],[ApiLoginToken],[LastLoginDate],[LoginIP],[PhotoUrl],[Timestamp],[UserName],[UserTypeCD],[Address],[Age],[Birthday],[Birthplace],[Email],[EnglishName],[FirstName],[Hobby],[LastName],[MaritalStatus],[MobilePhone],[NickName],[Profession],[QQ],[School],[Sex],[Telephone],[ZipCode],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Status],[Description],[ResetToken],[ResetTokenDate]) VALUES ('admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',NULL,'2019-05-13 09:52:24.267','::1','~/images/head.png',0,'超级管理员',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'Admin',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'admin','超级管理员','2019-05-13 09:52:24.290',1,NULL,NULL,NULL);
INSERT INTO [Roles] ([ID],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'超级管理员','超级管理员',1,NULL,NULL,NULL,'admin','ZKEASOFT','2019-04-07 16:39:17.073');
INSERT INTO [UserRoleRelation] ([ID],[RoleID],[UserID]) VALUES (5,1,'admin');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'店铺招牌','店铺招牌',4,'shop',1,'店铺招牌','店铺招牌','店铺招牌','admin','ZKEASOFT','2019-05-11 13:47:12.000','admin','ZKEASOFT','2019-05-11 14:09:03.077');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'新品上市','新品上市',4,'new',1,'新品上市','新品上市','新品上市','admin','ZKEASOFT','2019-05-11 13:47:31.000','admin','ZKEASOFT','2019-05-11 14:08:50.000');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'产品中心',NULL,0,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-11 14:01:56.913','admin','ZKEASOFT','2019-05-11 14:01:56.913');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'草莓蛋糕','/UpLoad/Images/201905/35c09c05065a444ca36cd2aaeec88ddf.jpg','/UpLoad/Images/201905/8b335e396537421a8ee2378e2d17cf9c.jpg',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'<p>蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。</p>','蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。',1,'2019-05-11 13:51:50.917',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-11 13:51:50.920','admin','ZKEASOFT','2019-05-11 13:51:50.920');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'原味芝士蛋糕','/UpLoad/Images/201905/79c97c114521499ab60c9ccdd1dd0e43.jpg','/UpLoad/Images/201905/fc6b1f7b328d433992ade5ea2647f809.jpg',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'<p>招牌原味蛋糕，100%纯天然食材，纯手工制作，香酥软糯，美味十足。蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。</p>','招牌原味蛋糕，100%纯天然食材，纯手工制作，香酥软糯，美味十足。蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。',1,'2019-05-11 13:53:46.337',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-11 13:53:30.000','admin','ZKEASOFT','2019-05-11 13:53:46.337');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'爆浆巧克力蛋糕','/UpLoad/Images/201905/b3b1cb9444dc43b98c0fb7ad0c0edb4a.jpg','/UpLoad/Images/201905/6f73173c5d30473a8197feecd1a3da5c.jpg',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'<p>爆浆巧克力蛋糕，100%纯天然食材，纯手工制作，集巧克力的香醇与浓郁与一体。蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。</p>','爆浆巧克力蛋糕，100%纯天然食材，纯手工制作，集巧克力的香醇与浓郁与一体。蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。',1,'2019-05-11 13:55:03.233',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-11 13:55:03.233','admin','ZKEASOFT','2019-05-11 13:55:03.233');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'香浓芝士蛋糕','/UpLoad/Images/201905/299cb0fc843246c4ae2cb499b398622e.jpg','/UpLoad/Images/201905/e2225919505d4e7db3abf44391e46053.jpg',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'<p>香浓芝士蛋糕，100%纯天然食材，纯手工制作，集巧克力的香醇与浓郁与一体。蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。</p>','香浓芝士蛋糕，100%纯天然食材，纯手工制作，集巧克力的香醇与浓郁与一体。蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。',1,'2019-05-11 13:56:14.560',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-11 13:56:14.560','admin','ZKEASOFT','2019-05-11 13:56:14.560');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,'鲜奶草莓蛋糕','/UpLoad/Images/201905/5c1b74e20e9d48119b28c8355d3873fa.jpg','/UpLoad/Images/201905/4a6aed4f70824cc0acbc78bd1ab67815.jpg',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'<p>蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。</p>','蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。',1,'2019-05-11 23:14:25.147',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','超级管理员','2019-05-11 23:14:25.150','admin','超级管理员','2019-05-11 23:14:25.150');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,'彩虹糖蛋糕','/UpLoad/Images/201905/48c0cdb47c6a4fdd859e7881c7bac2e2.jpg','/UpLoad/Images/201905/29878684505642e986adc12d32ae0f6a.jpg',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'<p>蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。</p>','蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。',1,'2019-05-11 23:15:23.267',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','超级管理员','2019-05-11 23:15:23.270','admin','超级管理员','2019-05-11 23:15:23.270');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,'红豆蛋糕','/UpLoad/Images/201905/03179e26b8bf451fbf9092b19aabddcb.jpg','/UpLoad/Images/201905/a5f748398f51427996d4b12897ac8181.jpg',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'<p>红豆蛋糕，100%纯天然食材，纯手工制作。蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。</p>','红豆蛋糕，100%纯天然食材，纯手工制作。蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。',1,'2019-05-11 23:16:49.293',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','超级管理员','2019-05-11 23:16:49.293','admin','超级管理员','2019-05-11 23:16:49.293');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (8,'蔓越莓蛋糕','/UpLoad/Images/201905/a94cfe70e2f943c5be234a08d119d9bf.jpg','/UpLoad/Images/201905/4c9e6a975485432bbca5b160fed04cd6.jpg',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'<p>蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。</p>','蛋糕手工古法製作工艺，精选新鲜天然优质食材（德国牛奶、韩国砂糖、新西兰黄油、意大利干酪、香港进口小麦粉等），口感独特，绵软细緻，纯粹醇厚，传承百年。',1,'2019-05-11 23:17:49.110',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','超级管理员','2019-05-11 23:17:49.110','admin','超级管理员','2019-05-11 23:17:49.110');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_Manage',1,'管理系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_View',1,'查看系统设置',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Manage',1,'管理文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:18:40.493','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Publish',1,'发布文章',NULL,'文章',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.820','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_View',1,'查看文章',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:17:59.120','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_Manage',1,'管理文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:22:24.887','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_View',1,'查看文章类别',NULL,'文章',NULL,'admin','ZKEASOFT','2016-08-01 13:19:54.500','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_Manage',1,'管理焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:45:46.190','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_View',1,'查看焦点图',NULL,'焦点图',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.097','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_Manage',1,'管理回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.053','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_View',1,'查看回复',NULL,'留言评论',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.050','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventViewer_Manage',1,'查看错误日志',NULL,'设置',NULL,'admin','ZKEASOFT','2017-07-11 15:43:52.147','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_Manage',1,'管理表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_View',1,'查看表单',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.830','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Export',1,'导出表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.853','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Manage',1,'管理表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.850','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_View',1,'查看表单数据',NULL,'自定义表单',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Language_Manage',1,'翻译',NULL,'设置',NULL,'admin','ZKEASOFT','2017-11-17 11:47:13.093','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_Manage',1,'管理布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:43:52.697','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_View',1,'查看布局',NULL,'布局',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.690','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('LiveChatScript_Manage',1,'设置在线客服代码',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2019-04-07 16:39:16.730');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_Manage',1,'管理媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.553','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_View',1,'查看媒体库',NULL,'媒体库',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.090','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_Manage',1,'管理留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.980','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_View',1,'查看留言',NULL,'留言板',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.960','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('MessageNotification_Manage',1,'管理通知邮箱',NULL,'留言评论',NULL,'admin','ZKEASOFT','2018-08-15 15:25:42.620','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_Manage',1,'管理导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:40:38.230','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_View',1,'查看导航',NULL,'导航',NULL,'admin','ZKEASOFT','2016-08-01 13:38:21.943','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Manage',1,'管理订单',NULL,'商城',NULL,'admin','ZKEASOFT','2017-11-17 10:49:53.937','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Refund',1,'退款',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.903','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_View',1,'查看订单',NULL,'商城',NULL,'admin','ZKEASOFT','2017-11-17 10:49:53.923','admin','ZKEASOFT','2019-04-07 16:39:16.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderPayment',1,'查看支付平台支付信息',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.777','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderRefund',1,'查看支付平台退款信息',NULL,'商城',NULL,'admin','ZKEASOFT','2018-01-19 15:26:24.850','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_Manage',1,'管理页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 13:41:08.463','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_View',1,'查看页面',NULL,'页面',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.683','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Payment_Config_Manage',1,'支付集成设置',NULL,'商城',NULL,'admin','ZKEASOFT','2018-03-22 15:33:03.663','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Plugin_View',1,'插件',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.727','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Manage',1,'管理产品',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:27:58.400','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Publish',1,'发布产品',NULL,'产品',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.853','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_View',1,'查看产品',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:27:41.483','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_Manage',1,'管理产品类别',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:28:21.047','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_View',1,'查看产品类别',NULL,'产品',NULL,'admin','ZKEASOFT','2016-08-01 13:28:08.737','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_Manage',1,'管理产品标签',NULL,'产品',NULL,'admin','ZKEASOFT','2017-11-11 15:43:52.953','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_View',1,'查看产品标签',NULL,'产品',NULL,'admin','ZKEASOFT','2017-11-11 15:43:52.947','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('RobotsSetting',1,'Robots.txt',NULL,'设置',NULL,'admin','ZKEASOFT','2018-08-12 22:51:30.340','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_Manage',1,'管理角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_View',1,'查看角色',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.660','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SMTPSetting',1,'邮箱设置',NULL,'设置',NULL,'admin','ZKEASOFT','2018-06-12 19:13:49.497','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('StatisticsScript_Manage',1,'设置访客统计代码',NULL,'设置',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2019-04-07 16:39:16.730');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_Manage',1,'管理主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:42:48.600','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_View',1,'查看主题',NULL,'主题',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.083','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_Manage',1,'管理URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.170','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_View',1,'查看URL 重定向',NULL,'URL 重定向',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.120','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_Manage',1,'管理用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_View',1,'查看用户',NULL,'用户/安全',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2019-04-07 16:39:16.727');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('87157a6306bb48f2b62c202cafbffed4','#','~/join','招商加盟',0,NULL,'JOIN',1,4,'admin','ZKEASOFT','2019-05-10 16:43:35.000','admin','ZKEASOFT','2019-05-11 08:52:28.780');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('895a71d8aedc43ebb623f51955b4d2c8','#','~/about','关于我们',0,NULL,'ABOUT',1,6,'admin','ZKEASOFT','2019-05-10 16:44:36.000','admin','超级管理员','2019-05-11 23:32:30.430');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('b7de7040db05424cad8f42fda9817450','#','~/news','新闻中心',0,NULL,'NEWS',1,2,'admin','ZKEASOFT','2019-05-10 16:42:16.000','admin','ZKEASOFT','2019-05-11 08:47:25.853');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d55fc599b23348e09bf48de56fd30b83','#','~/index','网站首页',0,NULL,'HOME',1,1,'admin','ZKEASOFT','2019-05-10 16:41:54.000','admin','ZKEASOFT','2019-05-11 08:51:08.947');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d91c0390f7874967aa39fe2c0bfd440b','#','~/product','产品中心',0,NULL,'PRODUCT',1,3,'admin','ZKEASOFT','2019-05-11 08:51:54.367','admin','ZKEASOFT','2019-05-11 08:51:59.803');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('"M" 表示该导航会在手机上显示。<strong>右键</strong>可创建子导航。','en-GB','"M" means the navigation will be displayed on the phone. <strong>Right Click</strong> can add sub item.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('"M" 表示该导航会在手机上显示。<strong>右键</strong>可创建子导航。','en-US','"M" means the navigation will be displayed on the phone. <strong>Right Click</strong> can add sub item.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{{0}}的长度应大于{0}且小于{1}','en-GB','The length of {{0}} should between {0} and {1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{{0}}的长度应大于{0}且小于{1}','en-US','The length of {{0}} should between {0} and {1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{{0}}的长度应小于{0}','en-GB','The length of {{0}} should less than {0}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{{0}}的长度应小于{0}','en-US','The length of {{0}} should less than {0}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{{0}}的值范围应在{0}-{1}之间','en-GB','The value of {{0}} should between {0} and {1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{{0}}的值范围应在{0}-{1}之间','en-US','The value of {{0}} should between {0} and {1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0}的输入的值不符合要求','en-GB','The value of {0} is not valid.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0}的输入的值不符合要求','en-US','The value of {0} is not valid.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','en-GB','Alipay Public Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','en-US','Alipay Public Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','zh-CN','应用公钥','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','en-GB','App','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','en-US','App','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','zh-CN','AppId','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','en-GB','Gatewayurl','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','en-US','Gatewayurl','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','zh-CN','支付宝网关','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','en-GB','Is Key From File','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','en-US','Is Key From File','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','zh-CN','IsKeyFromFile','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','en-GB','Private Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','en-US','Private Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','zh-CN','应用私钥','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','en-GB','Sign Type','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','en-US','Sign Type','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','zh-CN','SignType','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','en-GB','Uid','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','en-US','Uid','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','zh-CN','商户UID','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@ActionType','zh-CN','ActionType','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreateBy','zh-CN','CreateBy','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreatebyName','zh-CN','创建人','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreateDate','zh-CN','创建日期','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Description','zh-CN','描述','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateBy','zh-CN','LastUpdateBy','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateByName','zh-CN','更新人','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateDate','zh-CN','更新日期','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@SettingKey','zh-CN','键','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Status','zh-CN','状态','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Title','zh-CN','标题','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Value','zh-CN','值','ApplicationSetting','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Thumbnail','zh-CN','模板缩略图','ArticleDetailWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','en-GB','Createby Name','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','en-US','Createby Name','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','zh-CN','创建人','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','en-GB','Create Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','en-US','Create Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','zh-CN','创建日期','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Description','zh-CN','描述','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ExtendFields','zh-CN','扩展属性','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ID','zh-CN','ID','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ImageThumbUrl','zh-CN','缩略图','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ImageUrl','zh-CN','图片','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','en-GB','Is Publish','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','en-US','Is Publish','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','zh-CN','已发布?','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateBy','zh-CN','LastUpdateBy','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateByName','en-GB','Last Update By Name','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateByName','en-US','Last Update By Name','ArticleEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Thumbnail','zh-CN','模板缩略图','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Title','zh-CN','标题','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@WidgetName','zh-CN','组件名称','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ZoneID','zh-CN','区域','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ArticleId','zh-CN','文章ID','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ArticleName','zh-CN','文章英文名','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@AssemblyName','zh-CN','AssemblyName','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@IsSystem','zh-CN','IsSystem','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@IsTemplate','zh-CN','保存为模板','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@PartialView','zh-CN','显示模板','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Position','zh-CN','排序','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@StyleClass','zh-CN','自定义样式','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Thumbnail','zh-CN','模板缩略图','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Title','zh-CN','标题','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleSpecialDetailWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Thumbnail','zh-CN','模板缩略图','ArticleSummaryWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Thumbnail','zh-CN','模板缩略图','ArticleTopWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','zh-CN','SEO描述','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','zh-CN','SEO关键字','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','zh-CN','SEO标题','ArticleType','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Thumbnail','zh-CN','模板缩略图','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Title','zh-CN','标题','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@WidgetName','zh-CN','组件名称','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ZoneID','zh-CN','区域','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','en-GB','Client','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','en-US','Client','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','zh-CN','APP ID','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','en-GB','Client Secret','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','en-US','Client Secret','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','zh-CN','APP Key','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ApplicationKey','zh-CN','服务密钥(AK)','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Height','zh-CN','地图高度(px)','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Instruction','zh-CN','相关链接','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@LocationPoint','zh-CN','位置坐标','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@TagSummary','zh-CN','标注说明','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@TagTitle','zh-CN','标注','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Content','zh-CN','详细信息','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Name','zh-CN','名称','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Others','zh-CN','其它','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Photo','zh-CN','照片','BiographyWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Thumbnail','zh-CN','模板缩略图','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Title','zh-CN','标题','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@WidgetName','zh-CN','组件名称','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ZoneID','zh-CN','区域','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@ActionType','zh-CN','ActionType','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','en-GB','Carousel Items','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','en-US','Carousel Items','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','zh-CN','滚动图','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateBy','zh-CN','CreateBy','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreatebyName','en-GB','Createby Name','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreatebyName','en-US','Createby Name','CarouselEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateByName','en-GB','Last Update By Name','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateByName','en-US','Last Update By Name','CarouselEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Thumbnail','zh-CN','模板缩略图','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Title','zh-CN','标题','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@WidgetName','zh-CN','组件名称','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ZoneID','zh-CN','区域','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@ActionType','zh-CN','ActionType','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Agrees','zh-CN','赞同数','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','en-GB','Comment Content','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','en-US','Comment Content','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','zh-CN','评论内容','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateBy','zh-CN','CreateBy','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','en-GB','Createby Name','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','en-US','Createby Name','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','zh-CN','创建人','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','en-GB','Create Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','en-US','Create Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','zh-CN','创建日期','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Description','zh-CN','描述','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Disagrees','zh-CN','反对数','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@ID','zh-CN','ID','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateBy','zh-CN','LastUpdateBy','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateByName','en-GB','Last Update By Name','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateByName','en-US','Last Update By Name','Comments','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Thumbnail','zh-CN','模板缩略图','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Title','zh-CN','标题','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@WidgetName','zh-CN','组件名称','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ZoneID','zh-CN','区域','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@FieldType','zh-CN','字段类型','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Name','zh-CN','属性名','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Status','en-GB','Status','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Status','en-US','Status','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Title','zh-CN','字段名','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreatebyName','en-GB','Createby Name','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreatebyName','en-US','Createby Name','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreateDate','en-GB','Create Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreateDate','en-US','Create Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Description','en-GB','Description','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Description','en-US','Description','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateByName','en-GB','Last Update By Name','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateByName','en-US','Last Update By Name','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateDate','en-GB','Last Update Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateDate','en-US','Last Update Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Status','en-GB','Status','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Status','en-US','Status','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Template','zh-CN','模板代码','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Title','en-GB','Title','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Title','en-US','Title','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreatebyName','en-GB','Createby Name','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreatebyName','en-US','Createby Name','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreateDate','en-GB','Create Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreateDate','en-US','Create Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Description','en-GB','Description','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Description','en-US','Description','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Fields','zh-CN','字段','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateByName','en-GB','Last Update By Name','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateByName','en-US','Last Update By Name','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateDate','en-GB','Last Update Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateDate','en-US','Last Update Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Status','en-GB','Status','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Status','en-US','Status','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Title','en-GB','Title','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Title','en-US','Title','ContentType','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ContentTemplateID','zh-CN','显示模板','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ContentTypeID','zh-CN','自定义内容类型','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ContentTemplateID','zh-CN','显示模板','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ContentValueID','zh-CN','自定义内容','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@IsSupportQueryID','zh-CN','动态内容','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@ActionType','zh-CN','ActionType','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateBy','zh-CN','CreateBy','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','en-GB','Createby Name','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','en-US','Createby Name','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','zh-CN','创建人','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','en-GB','Create Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','en-US','Create Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','zh-CN','创建日期','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Description','zh-CN','描述','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@FieldsData','zh-CN','FieldsData','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@FormFields','zh-CN','FormFields','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@ID','zh-CN','ID','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateBy','zh-CN','LastUpdateBy','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateByName','en-GB','Last Update By Name','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateByName','en-US','Last Update By Name','Form','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreatebyName','en-GB','Createby Name','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreatebyName','en-US','Createby Name','FormData','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateByName','en-GB','Last Update By Name','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateByName','en-US','Last Update By Name','FormData','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Thumbnail','zh-CN','模板缩略图','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Title','zh-CN','标题','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@WidgetName','zh-CN','组件名称','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ZoneID','zh-CN','区域','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventItem@Description','zh-CN','事件','HistoryEventItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventItem@Title','zh-CN','年份','HistoryEventItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Events','zh-CN','历史事件','HistoryEventWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Thumbnail','zh-CN','模板缩略图','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Title','zh-CN','标题','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@WidgetName','zh-CN','组件名称','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ZoneID','zh-CN','区域','HtmlWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Thumbnail','zh-CN','模板缩略图','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Title','zh-CN','标题','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@WidgetName','zh-CN','组件名称','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Width','zh-CN','宽度(px)','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ZoneID','zh-CN','区域','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Action','en-GB','Action','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Action','en-US','Action','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaDescription','en-GB','Meta Description','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaDescription','en-US','Meta Description','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWords','en-GB','Meta Key Words','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWords','en-US','Meta Key Words','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWorlds','en-GB','Meta Key Worlds','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWorlds','en-US','Meta Key Worlds','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Title','en-GB','Title','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Title','en-US','Title','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Url','en-GB','Url','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Url','en-US','Url','Keywords','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Location','zh-CN','位置','GlobalScripts','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Script','zh-CN','脚本','LiveChatScript','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@ActionType','zh-CN','ActionType','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateBy','zh-CN','CreateBy','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreatebyName','en-GB','Createby Name','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreatebyName','en-US','Createby Name','MessageEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','en-GB','Last Update By Name','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','en-US','Last Update By Name','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','zh-CN','更新人','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','en-GB','Last Update Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','en-US','Last Update Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','zh-CN','更新日期','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@PostMessage','zh-CN','留言内容','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Reply','zh-CN','回复','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','en-GB','Status','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','en-US','Status','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','zh-CN','状态','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Title','en-GB','Title','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Title','en-US','Title','MessageEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Thumbnail','zh-CN','模板缩略图','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Title','zh-CN','标题','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@WidgetName','zh-CN','组件名称','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ZoneID','zh-CN','区域','MessageWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Thumbnail','zh-CN','模板缩略图','NavigationWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@QQ','zh-CN','QQ?','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Redirect','zh-CN','跳转地址','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@WeChat','zh-CN','微信?','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@WeiBo','zh-CN','微博?','OAuthWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ID','zh-CN','订单号','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateBy','zh-CN','LastUpdateBy','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateByName','en-GB','Last Update By Name','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateByName','en-US','Last Update By Name','Order','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','en-GB','Status','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','en-US','Status','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','zh-CN','状态','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','en-GB','Style','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','en-US','Style','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','zh-CN','样式','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','en-GB','Title','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','en-US','Title','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','zh-CN','标题','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Url','zh-CN','Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ImageUrl','zh-CN','图片','ParallaxWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEODescription','zh-CN','SEO描述','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEOKeyWord','zh-CN','SEO关键字','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEOTitle','zh-CN','SEO标题','ProductCategory','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Thumbnail','zh-CN','模板缩略图','ProductCategoryWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Thumbnail','zh-CN','模板缩略图','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Title','zh-CN','标题','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@WidgetName','zh-CN','组件名称','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ZoneID','zh-CN','区域','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ActionType','zh-CN','ActionType','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@BrandCD','zh-CN','BrandCD','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Color','zh-CN','颜色','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateBy','zh-CN','CreateBy','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreatebyName','en-GB','Createby Name','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreatebyName','en-US','Createby Name','ProductEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateByName','en-GB','Last Update By Name','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateByName','en-US','Last Update By Name','ProductEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Thumbnail','zh-CN','模板缩略图','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Title','zh-CN','标题','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@WidgetName','zh-CN','组件名称','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ZoneID','zh-CN','区域','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Robots@Content','zh-CN','内容','Robots','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@ActionType','zh-CN','ActionType','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateBy','zh-CN','CreateBy','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','en-GB','Createby Name','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','en-US','Createby Name','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','zh-CN','创建人','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','en-GB','Create Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','en-US','Create Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','zh-CN','创建日期','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Description','zh-CN','描述','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@ID','zh-CN','ID','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateBy','zh-CN','LastUpdateBy','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateByName','en-GB','Last Update By Name','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateByName','en-US','Last Update By Name','RoleEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Thumbnail','zh-CN','模板缩略图','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Title','zh-CN','标题','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@WidgetName','zh-CN','组件名称','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ZoneID','zh-CN','区域','ScriptWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Thumbnail','zh-CN','模板缩略图','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Title','zh-CN','标题','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@WidgetName','zh-CN','组件名称','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ZoneID','zh-CN','区域','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SEO优化','en-GB','SEO',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SEO优化','en-US','SEO',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@AssemblyName','zh-CN','AssemblyName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@IsSystem','zh-CN','IsSystem','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@IsTemplate','zh-CN','保存为模板','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@PartialView','zh-CN','显示模板','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Position','zh-CN','排序','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@SearchEngine','zh-CN','搜索引擎',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@SearchQuery','zh-CN','Search Query','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ServiceTypeName','zh-CN','ServiceTypeName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@StyleClass','zh-CN','自定义样式','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Thumbnail','zh-CN','模板缩略图','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Title','zh-CN','标题','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@WidgetName','zh-CN','组件名称','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ZoneID','zh-CN','区域','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Email','zh-CN','邮箱','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@EnableSsl','zh-CN','启用SSL','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Host','zh-CN','服务器','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@PassWord','zh-CN','密码','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Port','zh-CN','端口','SmtpSetting','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Location','zh-CN','位置','GlobalScripts','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Script','zh-CN','脚本','StatisticsScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StrongPoint@Description','zh-CN','描述','StrongPoint','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StrongPoint@Title','zh-CN','名称','StrongPoint','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Thumbnail','zh-CN','模板缩略图','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Title','zh-CN','标题','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@WidgetName','zh-CN','组件名称','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ZoneID','zh-CN','区域','StyleSheetWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Thumbnail','zh-CN','Thumbnail','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Title','zh-CN','标题','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Url','zh-CN','Url','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@UrlDebugger','zh-CN','UrlDebugger','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@ActionType','zh-CN','ActionType','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateBy','zh-CN','CreateBy','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreatebyName','en-GB','Createby Name','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreatebyName','en-US','Createby Name','UrlRedirect','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','en-GB','Is Permanent','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','en-US','Is Permanent','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','zh-CN','永久？','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateBy','zh-CN','LastUpdateBy','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateByName','en-GB','Last Update By Name','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateByName','en-US','Last Update By Name','UrlRedirect','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Url参数','en-GB','Query String',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Url参数','en-US','Query String',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('URL重定向','en-GB','Url  Redirect',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('URL重定向','en-US','Url  Redirect',NULL,NULL);
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreatebyName','en-GB','Createby Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreatebyName','en-US','Createby Name','UserEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateByName','en-GB','Last Update By Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateByName','en-US','Last Update By Name','UserEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWord','zh-CN','PassWord','UserEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Thumbnail','zh-CN','模板缩略图','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Title','zh-CN','标题','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Url','zh-CN','视频地址(MP4)','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@WidgetName','zh-CN','组件名称','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Width','zh-CN','宽度(px)','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ZoneID','zh-CN','区域','VideoWidget','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Thumbnail','zh-CN','模板缩略图','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Title','zh-CN','标题','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@WidgetName','zh-CN','组件名称','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ZoneID','zh-CN','区域','WidgetBase','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Thumbnail','zh-CN','Thumbnail','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Title','zh-CN','标题','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetTemplateEntity','EntityProperty');
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
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@PageId','zh-CN','PageID','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@Status','zh-CN','状态','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@Title','zh-CN','标题','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@ZoneName','zh-CN','ZoneName','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('爱好','en-GB','Hobby',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('爱好','en-US','Hobby',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('安全退出','en-GB','Sign out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('安全退出','en-US','Sign out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('安装板块','en-GB','Upload Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('安装板块','en-US','Upload Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('安装主题','en-GB','Install',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('安装主题','en-US','Install',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('按回车保存','en-GB','Press Enter to save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('按回车保存','en-US','Press Enter to save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('百度地图','en-GB','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('百度地图','en-US','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('版本','en-GB','Version',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('版本','en-US','Version',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('包含','en-GB','Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('包含','en-US','Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('保存','en-GB','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('保存','en-US','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('保存修改','en-GB','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('保存修改','en-US','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('边框(显示空区域)','en-GB','Border(Empty Zone)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('边框(显示空区域)','en-US','Border(Empty Zone)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑：进入页面的设计模式，编辑内容','en-GB','Edit: Design page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑：进入页面的设计模式，编辑内容','en-US','Edit: Design page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑布局','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑布局','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑内容','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑内容','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑设置','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑设置','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑页面','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('编辑页面','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('标签','en-GB','Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('标签','en-US','Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('表单','en-GB','Form',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('表单','en-US','Form',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('表单数据','en-GB','Form Data',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('表单数据','en-US','Form Data',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('并且','en-GB','And',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('并且','en-US','And',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不包含','en-GB','Not Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不包含','en-US','Not Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不等于','en-GB','Not Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不等于','en-US','Not Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不以...结尾','en-GB','Not Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不以...结尾','en-US','Not Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不以…开头','en-GB','Not Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不以…开头','en-US','Not Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不在...里','en-GB','Not In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('不在...里','en-US','Not In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局：修改页面布局','en-GB','Layout: Edit page layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局：修改页面布局','en-US','Layout: Edit page layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局概览','en-GB','Overview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局概览','en-US','Overview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局列表','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局列表','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局内容','en-GB','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局内容','en-US','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局设计','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局设计','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局组件','en-GB','Layout Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('布局组件','en-US','Layout Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('操作','en-GB','Action',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('操作','en-US','Action',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看','en-GB','View',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看','en-US','View',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看：查看已发布版本','en-GB','View: View the published page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看：查看已发布版本','en-US','View: View the published page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看布局','en-GB','View Layouts',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看布局','en-US','View Layouts',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看导航','en-GB','View Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看导航','en-US','View Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看页面','en-GB','View Pages',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看页面','en-US','View Pages',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看站点','en-GB','View Site',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('查看站点','en-US','View Site',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品标签','en-GB','Product Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品标签','en-US','Product Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品关键字','en-GB','Product keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品关键字','en-US','Product keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品管理','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品管理','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品类别','en-GB','Product Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品类别','en-US','Product Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品列表','en-GB','Product List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品列表','en-US','Product List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品内容','en-GB','Product Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品内容','en-US','Product Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品排序','en-GB','Sort',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品排序','en-US','Sort',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品展示','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('产品展示','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('成品模板','en-GB','Templates',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('成品模板','en-US','Templates',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('创建布局','en-GB','New Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('创建布局','en-US','New Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('创建文件夹','en-GB','New Folder',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('创建文件夹','en-US','New Folder',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('创建页面','en-GB','New Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('创建页面','en-US','New Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('错误日志','en-GB','Log',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('错误日志','en-US','Log',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('大于','en-GB','Greater Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('大于','en-US','Greater Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('大于等于','en-GB','Greater Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('大于等于','en-US','Greater Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('单域名模式','en-GB','Single domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('单域名模式','en-US','Single domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('当前日期','en-GB','Today',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('当前日期','en-US','Today',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('导航','en-GB','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('导航','en-US','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('导航管理','en-GB','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('导航管理','en-US','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('登录','en-GB','Sign In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('登录','en-US','Sign In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('登录邮箱不能为空','en-GB','Please input your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('登录邮箱不能为空','en-US','Please input your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('等于','en-GB','Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('等于','en-US','Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('地图','en-GB','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('地图','en-US','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('第三方登录','en-GB','OAuth',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('第三方登录','en-US','OAuth',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('点击单选框进行主题切换','en-GB','Click the radio button to switch the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('点击单选框进行主题切换','en-US','Click the radio button to switch the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('点击主题“缩略图”可进行进行预览，在预览页面右上角点击“退出主题预览”可回到该页面','en-GB','Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to the page.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('点击主题“缩略图”可进行进行预览，在预览页面右上角点击“退出主题预览”可回到该页面','en-US','Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to the page.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('电话','en-GB','Phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('电话','en-US','Phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('电子商务','en-GB','E-commerce',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('电子商务','en-US','E-commerce',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('订单','en-GB','Order',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('订单','en-US','Order',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('定义条件','en-GB','Rule',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('定义条件','en-US','Rule',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('动态','en-GB','Dynamic',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('动态','en-US','Dynamic',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('独立域名模式','en-GB','Standalone domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('独立域名模式','en-US','Standalone domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('段落','en-GB','Paragraph',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('段落','en-US','Paragraph',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('多语言','en-GB','Multi-language',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('多语言','en-US','Multi-language',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('多语言设置','en-GB','Multi-language Config',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('多语言设置','en-US','Multi-language Config',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('发布','en-GB','Publish',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('发布','en-US','Publish',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('发布：将页面发布到前端可查看','en-GB','Publish: Publish page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('发布：将页面发布到前端可查看','en-US','Publish: Publish page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('发布人','en-GB','Publish By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('发布人','en-US','Publish By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('发布日期','en-GB','Publish Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('发布日期','en-US','Publish Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('翻译','en-GB','Translate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('翻译','en-US','Translate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('翻译键','en-GB','Key',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('翻译键','en-US','Key',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('翻译内容','en-GB','Translate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('翻译内容','en-US','Translate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('分隔符','en-GB','Separator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('分隔符','en-US','Separator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('复制','en-GB','Copy',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('复制','en-US','Copy',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('概览','en-GB','Overview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('概览','en-US','Overview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('个人中心','en-GB','Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('个人中心','en-US','Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('工具栏','en-GB','Toolbar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('工具栏','en-US','Toolbar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('关闭','en-GB','Close',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('关闭','en-US','Close',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('欢迎','en-GB','Welcome',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('欢迎','en-US','Welcome',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('欢迎使用ZKEACMS','en-GB','Welcome to use ZKEACMS',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('欢迎使用ZKEACMS','en-US','Welcome to use ZKEACMS',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('或者','en-GB','Or',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('或者','en-US','Or',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('基本信息','en-GB','Information',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('基本信息','en-US','Information',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('基础','en-GB','Basis',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('基础','en-US','Basis',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('间距','en-GB','Gap',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('间距','en-US','Gap',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('减小外边距','en-GB','Full',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('减小外边距','en-US','Full',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('简介','en-GB','Biography',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('简介','en-US','Biography',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('焦点图','en-GB','Carousel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('焦点图','en-US','Carousel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('角色','en-GB','Role',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('角色','en-US','Role',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('脚本','en-GB','JavaScript',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('脚本','en-US','JavaScript',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('旧密码','en-GB','Old Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('旧密码','en-US','Old Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('居中','en-GB','Center',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('居中','en-US','Center',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('巨幕','en-GB','Jumbotron',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('巨幕','en-US','Jumbotron',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('扩展插件','en-GB','Plugins',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('扩展插件','en-US','Plugins',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('历史版本','en-GB','Versions',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('历史版本','en-US','Versions',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('历史事件','en-GB','History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('历史事件','en-US','History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('立即登录','en-GB','Sign in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('立即登录','en-US','Sign in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('立即注册','en-GB','Sign up',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('立即注册','en-US','Sign up',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('列宽','en-GB','Column',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('列宽','en-US','Column',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('留言','en-GB','Message',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('留言','en-US','Message',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('留言板','en-GB','Message Board',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('留言板','en-US','Message Board',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('留言内容','en-GB','Message List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('留言内容','en-US','Message List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('留言评论','en-GB','Message Board',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('留言评论','en-US','Message Board',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('路径导航','en-GB','Breadcrumbs',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('路径导航','en-US','Breadcrumbs',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('媒体库','en-GB','Media',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('媒体库','en-US','Media',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码','en-GB','Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码','en-US','Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码不能为空','en-GB','Please input your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码不能为空','en-US','Please input your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码不一致','en-GB','Passwords are inconsistent',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码不一致','en-US','Passwords are inconsistent',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码的长度应小于20','en-GB','The length of the password should be less than 20',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('密码的长度应小于20','en-US','The length of the password should be less than 20',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('描述','en-GB','Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('描述','en-US','Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('模板代码','en-GB','Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('模板代码','en-US','Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('内容','en-GB','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('内容','en-US','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('内容来源','en-GB','Data Source',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('内容来源','en-US','Data Source',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('内容类型','en-GB','Content Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('内容类型','en-US','Content Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('男','en-GB','Male',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('男','en-US','Male',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('您的账号已经创建成功','en-GB','Your account has been created successfully',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('您的账号已经创建成功','en-US','Your account has been created successfully',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('女','en-GB','Female',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('女','en-US','Female',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('配置通知邮箱','en-GB','Notification',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('配置通知邮箱','en-US','Notification',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('平行视差','en-GB','Parallax',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('平行视差','en-US','Parallax',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('评论','en-GB','Comment',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('评论','en-US','Comment',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('评论箱','en-GB','Comment Box',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('评论箱','en-US','Comment Box',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('其它','en-GB','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('其它','en-US','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('其它设置','en-GB','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('其它设置','en-US','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('企业版','en-GB','Enterprise',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('企业版','en-US','Enterprise',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('企业版','zh-CN','企业版',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('企业版','zh-TW','企業版',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请确认密码','en-GB','Please confirm your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请确认密码','en-US','Please confirm your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请输入{0}','en-GB','{0} is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请输入{0}','en-US','{0} is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请输入您的用户信息以登录','en-GB','Please enter your user information to log in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请输入您的用户信息以登录','en-US','Please enter your user information to log in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请输入您的用户信息以登录系统','en-GB','Please enter your user information to log in to the system',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请输入您的用户信息以登录系统','en-US','Please enter your user information to log in to the system',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请输入您的用户信息以注册','en-GB','Please enter your user information to register',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('请输入您的用户信息以注册','en-US','Please enter your user information to register',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('取消','en-GB','Cancel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('取消','en-US','Cancel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('全部','en-GB','All',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('全部','en-US','All',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('全局内容','en-GB','Layer',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('全局内容','en-US','Layer',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('确定删除?','en-GB','Delete?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('确定删除?','en-US','Delete?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('确认密码','en-GB','Confirm Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('确认密码','en-US','Confirm Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('容器','en-GB','Container',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('容器','en-US','Container',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('若主题有更新，重复安装即可更新','en-GB','Reinstall to update the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('若主题有更新，重复安装即可更新','en-US','Reinstall to update the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('删除','en-GB','Delete',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('删除','en-US','Delete',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('商业授权','en-GB','Commercial',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('商业授权','en-US','Commercial',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('上传文件','en-GB','Upload',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('上传文件','en-US','Upload',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('设计','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('设计','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用QQ登录','en-GB','Sign in with QQ',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用QQ登录','en-US','Sign in with QQ',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用帮助','en-GB','Help',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用帮助','en-US','Help',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用微博登录','en-GB','Sign in with weibo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('使用微博登录','en-US','Sign in with weibo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('视频','en-GB','Video',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('视频','en-US','Video',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('收货地址','en-GB','Address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('收货地址','en-US','Address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('手机','en-GB','Cell phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('手机','en-US','Cell phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('首页','en-GB','Home',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('首页','en-US','Home',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入的邮件格式不正确','en-GB','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入的邮件格式不正确','en-US','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入的邮箱格式不正确','en-GB','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入的邮箱格式不正确','en-US','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入密码','en-GB','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入密码','en-US','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您常使用的邮箱地址','en-GB','Your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您常使用的邮箱地址','en-US','Your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您的密码','en-GB','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您的密码','en-US','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您注册时使用的邮箱地址','en-GB','Enter your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入您注册时使用的邮箱地址','en-US','Enter your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入姓名','en-GB','Please enter your name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('输入姓名','en-US','Please enter your name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('说明','en-GB','Explanation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('说明','en-US','Explanation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('说明文档','en-GB','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('说明文档','en-US','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加','en-GB','Add',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加','en-US','Add',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加：添加子页面','en-GB','New: Add sub page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加：添加子页面','en-US','New: Add sub page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加布局','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加布局','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加产品标签','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加产品标签','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加导航','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加导航','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加类别','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加类别','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加内容','en-GB','Add Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加内容','en-US','Add Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加内容板块','en-GB','Add Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加内容板块','en-US','Add Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加页面','en-GB','New Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加页面','en-US','New Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加页面：添加顶级页面，即域名下的一级子页面。~/xxxxx','en-GB','New Page: Add a root level page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('添加页面：添加顶级页面，即域名下的一级子页面。~/xxxxx','en-US','New Page: Add a root level page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('头像','en-GB','Avatar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('头像','en-US','Avatar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例二','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例二','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例二（圆）','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例二（圆）','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例三','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例三','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例三（圆）','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图例三（圆）','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片','en-GB','Image',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片','en-US','Image',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片边框','en-GB','Image Border',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片边框','en-US','Image Border',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片文字','en-GB','Image Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片文字','en-US','Image Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片右','en-GB','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片右','en-US','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片右（圆）','en-GB','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片右（圆）','en-US','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片圆角','en-GB','Image Radius',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片圆角','en-US','Image Radius',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左（平分）','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左（平分）','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左（圆）','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('图片左（圆）','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('退出','en-GB','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('退出','en-US','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('退出登录','en-GB','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('退出登录','en-US','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('拖动','en-GB','Drag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('拖动','en-US','Drag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('外边框','en-GB','Border',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('外边框','en-US','Border',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('忘记密码？','en-GB','Forgot your password?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('忘记密码？','en-US','Forgot your password?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('微博','en-GB','WeiBo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('微博','en-US','WeiBo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('微信','en-GB','WeChat',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('微信','en-US','WeChat',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('未婚','en-GB','Unmarried',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('未婚','en-US','Unmarried',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文档','en-GB','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文档','en-US','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章概览','en-GB','Article Summary',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章概览','en-US','Article Summary',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章关键字','en-GB','Article keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章关键字','en-US','Article keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章管理','en-GB','Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章管理','en-US','Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章类别','en-GB','Article Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章类别','en-US','Article Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章列表','en-GB','Article List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章列表','en-US','Article List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章内容','en-GB','Article Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文章内容','en-US','Article Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字标题','en-GB','Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字标题','en-US','Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字二列','en-GB','Tow Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字二列','en-US','Tow Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字三列','en-GB','Three Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('文字三列','en-US','Three Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('我的订单','en-GB','Orders',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('我的订单','en-US','Orders',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('我们准备了几个链接供您开始：','en-GB','We have prepared a few links for you to get started:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('我们准备了几个链接供您开始：','en-US','We have prepared a few links for you to get started:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('无效','en-GB','Inactive',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('无效','en-US','Inactive',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('系统','en-GB','System',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('系统','en-US','System',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('下载板块','en-GB','Sections',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('下载板块','en-US','Sections',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('下载更多主题','en-GB','Download',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('下载更多主题','en-US','Download',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('下载主题','en-GB','Themes',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('下载主题','en-US','Themes',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('显示模板','en-GB','Display Template',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('显示模板','en-US','Display Template',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('显示内容','en-GB','Contents',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('显示内容','en-US','Contents',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('小于','en-GB','Less Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('小于','en-US','Less Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('小于等于','en-GB','Less Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('小于等于','en-US','Less Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('新建','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('新建','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('新建标签','en-GB','New tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('新建标签','en-US','New tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('新密码','en-GB','New Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('新密码','en-US','New Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('新闻资讯','en-GB','News',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('新闻资讯','en-US','News',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('行','en-GB','Row',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('行','en-US','Row',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名','en-GB','Username',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名','en-US','Username',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名不能为空','en-GB','Username is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名不能为空','en-US','Username is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名的长度应小于50','en-GB','The length of the name should be less than 50',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('姓名的长度应小于50','en-US','The length of the name should be less than 50',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('性别','en-GB','Gender',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('性别','en-US','Gender',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('修改基本信息','en-GB','Modify Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('修改基本信息','en-US','Modify Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('修改密码','en-GB','Change Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('修改密码','en-US','Change Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('许可协议','en-GB','License',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('许可协议','en-US','License',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('选择类别，进行手动排序','en-GB','Click category to sort the products',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('选择类别，进行手动排序','en-US','Click category to sort the products',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('选中产品类别，创建标签','en-GB','Click product category then add tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('选中产品类别，创建标签','en-US','Click product category then add tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('演示视频','en-GB','Videos',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('演示视频','en-US','Videos',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('样式','en-GB','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('样式','en-US','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面必须要发布才可以通过网址访问。对页面进行修改不会影响到已发布版本，直到下一次发布。','en-GB','The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面必须要发布才可以通过网址访问。对页面进行修改不会影响到已发布版本，直到下一次发布。','en-US','The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面关键字','en-GB','Page keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面关键字','en-US','Page keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面管理','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面管理','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面检测','en-GB','Test Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面检测','en-US','Test Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面设计','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面设计','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面展现的内容','en-GB','Display in page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页面展现的内容','en-US','Display in page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页头','en-GB','Header',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('页头','en-US','Header',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('仪表盘','en-GB','Dashboard',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('仪表盘','en-US','Dashboard',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('已婚','en-GB','Married',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('已婚','en-US','Married',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('已有账号？','en-GB','Have account?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('已有账号？','en-US','Have account?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('以...结尾','en-GB','Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('以...结尾','en-US','Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('以…开头','en-GB','Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('以…开头','en-US','Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('阴影','en-GB','Shadow',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('阴影','en-US','Shadow',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('用户','en-GB','User',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('用户','en-US','User',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('用户名','en-GB','User Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('用户名','en-US','User Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮件设置','en-GB','SMTP',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮件设置','en-US','SMTP',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮箱','en-GB','Email',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮箱','en-US','Email',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮箱的长度应小于200','en-GB','The length of the email should be less than 200',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮箱的长度应小于200','en-US','The length of the email should be less than 200',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮政编码','en-GB','Zip Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('邮政编码','en-US','Zip Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('有效','en-GB','Active',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('有效','en-US','Active',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('右对齐','en-GB','Align Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('右对齐','en-US','Align Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('右键菜单','en-GB','Menu',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('右键菜单','en-US','Menu',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('预览','en-GB','Preview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('预览','en-US','Preview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('预览：查看最新修改版本','en-GB','Preview: Preview the page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('预览：查看最新修改版本','en-US','Preview: Preview the page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('预览编辑版本','en-GB','Preview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('预览编辑版本','en-US','Preview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('预览发布版本','en-GB','View',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('预览发布版本','en-US','View',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('在...里','en-GB','In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('在...里','en-US','In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('赞助','en-GB','Donate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('赞助','en-US','Donate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('增加边距','en-GB','Padding',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('增加边距','en-US','Padding',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('粘贴','en-GB','Paste',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('粘贴','en-US','Paste',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('支付宝集成设置','en-GB','Alipay',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('支付宝集成设置','en-US','Alipay',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('置顶文章','en-GB','Top Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('置顶文章','en-US','Top Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('主题','en-GB','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('主题','en-US','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('主题管理','en-GB','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('主题管理','en-US','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性','en-GB','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性','en-US','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性/历史记录','en-GB','Property/History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性/历史记录','en-US','Property/History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性：编辑选中页面的属性，像标题，SEO关键字等','en-GB','Property: Page property, history etc.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性：编辑选中页面的属性，像标题，SEO关键字等','en-US','Property: Page property, history etc.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性名','en-GB','Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('属性名','en-US','Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('注：','en-GB','Notice:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('注：','en-US','Notice:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('注册结果','en-GB','Thank you!',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('注册结果','en-US','Thank you!',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('转为伪静态路径','en-GB','Append ''.html''',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('转为伪静态路径','en-US','Append ''.html''',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('字段','en-GB','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('字段','en-US','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('字段名','en-GB','Display Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('字段名','en-US','Display Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义','en-GB','Custom Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义','en-US','Custom Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义表单','en-GB','Form Generator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义表单','en-US','Form Generator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义内容','en-GB','Fluid Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义内容','en-US','Fluid Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义内容','zh-CN','自定义内容',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义内容列表','en-GB','Fluid Content List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义内容列表','en-US','Fluid Content List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义样式','en-GB','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自定义样式','en-US','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自适应','en-GB','Fluid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('自适应','en-US','Fluid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('组件设置','en-GB','Setting',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('组件设置','en-US','Setting',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('左对齐','en-GB','Align Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('左对齐','en-US','Align Left',NULL,NULL);
INSERT INTO [Forms] ([ID],[Title],[FieldsData],[NotificationReceiver],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('516f1fb100ea4885afbc8f231f6d1903','联系我们','[{"ID":"FFeca3070814a24e0db4415c10671682d7","Name":"SingleLine","DisplayName":"姓名","Value":null,"Description":"","Placeholder":"姓名","IsRequired":true,"RequiredMessage":"请输入姓名","Size":4,"Column":"col-md-6","RegexPattern":"","RegexMessage":"","FieldOptions":null,"AdditionalSettings":null},{"ID":"FFaa820ebf52ba46d99bfd62b0d4cb9d94","Name":"Phone","DisplayName":"电话","Value":null,"Description":"","Placeholder":"电话","IsRequired":true,"RequiredMessage":"请输入电话","Size":4,"Column":"col-md-6","RegexPattern":"","RegexMessage":"","FieldOptions":null,"AdditionalSettings":null},{"ID":"FFe8070c234f804a91921cba84ee3fd1cb","Name":"Email","DisplayName":"邮箱","Value":null,"Description":"","Placeholder":"邮箱","IsRequired":true,"RequiredMessage":"请输入邮箱","Size":4,"Column":"col-md-6","RegexPattern":"","RegexMessage":"","FieldOptions":null,"AdditionalSettings":null},{"ID":"FF8a94acf85cb7415c9ab4f33dbd420b9f","Name":"SingleLine","DisplayName":"您所在城市","Value":null,"Description":"","Placeholder":"您所在城市","IsRequired":true,"RequiredMessage":"请输入城市","Size":4,"Column":"col-md-6","RegexPattern":"","RegexMessage":"","FieldOptions":null,"AdditionalSettings":null},{"ID":"FFf582e53b8e944aa39bd0c31df57fa18f","Name":"Paragraph","DisplayName":"您的需求","Value":null,"Description":"","Placeholder":"您的需求","IsRequired":true,"RequiredMessage":"请输入您的需求","Size":4,"Column":"col-md-12","RegexPattern":"","RegexMessage":"","FieldOptions":null,"AdditionalSettings":null},{"ID":"FF3b93c65691bf49fab2299c0299f6bbd9","Name":"ValidCode","DisplayName":"验证码","Value":null,"Description":"","Placeholder":"验证码","IsRequired":true,"RequiredMessage":"请输入验证码","Size":4,"Column":"col-md-6","RegexPattern":"","RegexMessage":"","FieldOptions":null,"AdditionalSettings":null}]','',NULL,'联系地址',NULL,NULL,NULL,'admin','超级管理员','2019-05-12 21:59:27.750');
INSERT INTO [FormDataItem] ([ID],[FormDataId],[FieldId],[FieldText],[FieldValue],[OptionValue],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,1,'FFeca3070814a24e0db4415c10671682d7','姓名','Roc',NULL,'admin','超级管理员','2019-05-13 14:18:38.517','admin','超级管理员','2019-05-13 14:18:38.517');
INSERT INTO [FormDataItem] ([ID],[FormDataId],[FieldId],[FieldText],[FieldValue],[OptionValue],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,1,'FFaa820ebf52ba46d99bfd62b0d4cb9d94','电话','13156239873',NULL,'admin','超级管理员','2019-05-13 14:18:38.547','admin','超级管理员','2019-05-13 14:18:38.547');
INSERT INTO [FormDataItem] ([ID],[FormDataId],[FieldId],[FieldText],[FieldValue],[OptionValue],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,1,'FFe8070c234f804a91921cba84ee3fd1cb','邮箱','admin@admin.com',NULL,'admin','超级管理员','2019-05-13 14:18:38.573','admin','超级管理员','2019-05-13 14:18:38.573');
INSERT INTO [FormDataItem] ([ID],[FormDataId],[FieldId],[FieldText],[FieldValue],[OptionValue],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,1,'FF8a94acf85cb7415c9ab4f33dbd420b9f','您所在城市','上海',NULL,'admin','超级管理员','2019-05-13 14:18:38.577','admin','超级管理员','2019-05-13 14:18:38.577');
INSERT INTO [FormDataItem] ([ID],[FormDataId],[FieldId],[FieldText],[FieldValue],[OptionValue],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,1,'FFf582e53b8e944aa39bd0c31df57fa18f','您的需求','aadsadfs',NULL,'admin','超级管理员','2019-05-13 14:18:38.577','admin','超级管理员','2019-05-13 14:18:38.577');
INSERT INTO [FormDataItem] ([ID],[FormDataId],[FieldId],[FieldText],[FieldValue],[OptionValue],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,1,'FF3b93c65691bf49fab2299c0299f6bbd9','验证码','11417',NULL,'admin','超级管理员','2019-05-13 14:18:38.580','admin','超级管理员','2019-05-13 14:18:38.580');
INSERT INTO [FormData] ([ID],[Title],[FormId],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Roc','516f1fb100ea4885afbc8f231f6d1903',NULL,NULL,'admin','超级管理员','2019-05-13 14:18:38.347','admin','超级管理员','2019-05-13 14:18:38.347');
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'RecordStatus','有效','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'RecordStatus','无效','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'ArticleCategory','新闻','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'ArticleCategory','公司新闻','2',2,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,'ArticleCategory','行业新闻','3',3,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,'UserEntity@Sex','男','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,'UserEntity@Sex','女','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (8,'UserEntity@MaritalStatus','未婚','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (9,'UserEntity@MaritalStatus','已婚','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (11,'UserEntity@UserTypeCD','后台管理员','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (12,'ArticleTopWidget@PartialView','默认','Widget.ArticleTops',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (13,'ArticleListWidget@PartialView','默认','Widget.ArticleList',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (14,'ArticleListWidget@PartialView','横幅','Widget.ArticleList-Snippet',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (15,'ProductListWidget@PartialView','默认','Widget.ProductList',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (16,'ProductListWidget@Columns','3 列','col-xs-12 col-sm-6 col-md-4',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (17,'ProductListWidget@Columns','4 列','col-xs-12 col-sm-6 col-md-4 col-lg-3',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (18,'CarouselWidget@PartialView','默认','Widget.Carousel',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (19,'ArticleSummaryWidget@Style','默认','bs-callout-default',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (20,'ArticleSummaryWidget@Style','危险','bs-callout-danger',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (21,'ArticleSummaryWidget@Style','警告','bs-callout-warning',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (22,'ArticleSummaryWidget@Style','信息','bs-callout-info',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (23,'ArticleSummaryWidget@Style','成功','bs-callout-success',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (24,'ArticleSummaryWidget@PartialView','默认','Widget.ArticleSummary',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (25,'ProductCategoryWidget@PartialView','默认','Widget.ProductCategory',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (26,'ArticleTypeWidget@PartialView','默认','Widget.ArticleType',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (27,'UserEntity@UserTypeCD','前端用户','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (28,'Order@OrderStatus','未支付','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (29,'Order@OrderStatus','取消','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (30,'Order@OrderStatus','已支付','3',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (31,'Order@OrderStatus','已发货','4',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (32,'Order@OrderStatus','交易完成','5',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (33,'Order@OrderStatus','已退款','6',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (34,'Order@OrderStatus','退款中','7',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (35,'ProductListWidget@PartialView','列表','Widget.ProductList.A',2,0,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (36,'RuleItem@Condition','并且','and',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (37,'RuleItem@Condition','或者','or',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (38,'RuleItem@FunctionName','等于','Equals',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (39,'RuleItem@FunctionName','不等于','NotEquals',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (40,'RuleItem@FunctionName','大于','GreaterThan',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (41,'RuleItem@FunctionName','大于等于','GreaterThanOrEquals',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (42,'RuleItem@FunctionName','小于','LessThan',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (43,'RuleItem@FunctionName','小于等于','LessThanOrEquals',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (44,'RuleItem@FunctionName','以…开头','StartsWith',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (45,'RuleItem@FunctionName','以...结尾','EndsWith',8,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (46,'RuleItem@FunctionName','不以…开头','NotStartsWith',9,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (47,'RuleItem@FunctionName','不以...结尾','NotEndsWith',10,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (48,'RuleItem@FunctionName','包含','Contains',11,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (49,'RuleItem@FunctionName','不包含','NotContains',12,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (50,'RuleItem@FunctionName','在...里','In',13,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (51,'RuleItem@FunctionName','不在...里','NotIn',14,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (52,'RuleItem@Property','Url','ValueOf(''Url'')',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (53,'RuleItem@Property','Url参数','ValueOf(''QueryString'')',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (54,'RuleItem@Property','User-Agent','ValueOf(''UserAgent'')',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (55,'RuleItem@Property','当前日期','ValueOf(''Now'')',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Alipay.AopSdk.AspnetCore.AlipayOptions','{"AppId":null,"Uid":null,"Gatewayurl":null,"PrivateKey":null,"AlipayPublicKey":null,"SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}',NULL,NULL,NULL,NULL,NULL,'2019-04-24 19:55:03.627',NULL,NULL,'2019-04-24 19:55:03.627');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.GlobalScripts.Models.LiveChatScript','{"Location":0,"Script":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:35.293',NULL,NULL,'2019-04-07 16:38:35.293');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.GlobalScripts.Models.StatisticsScript','{"Location":0,"Script":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:36.007',NULL,NULL,'2019-04-07 16:38:36.007');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Message.Models.MessageNotificationConfig','{"MessageNotifyEmails":null,"CommentNotifyEmails":null}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-08-15 15:25:53.917','admin','ZKEASOFT','2018-08-15 15:25:53.917');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Shop.AliPayConfigOptions','{"AppId":"2016082000296332","Uid":"2088102172250345","Gatewayurl":"https://openapi.alipaydev.com/gateway.do","PrivateKey":"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP","AlipayPublicKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB","SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-11 17:02:14.577','admin','ZKEASOFT','2018-04-11 17:02:14.577');
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('026d94443b98441881edb27d7363ae7f','HTML',NULL,2,NULL,'ed5ec60dcdc840569faf58db8c2a71ee','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:48:45.540','admin','超级管理员','2019-05-13 14:48:45.540',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('02e0d630819e4ca29f812f1afc046b0c','焦点图',NULL,2,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-0','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 09:26:36.813','admin','超级管理员','2019-05-13 15:18:56.757',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('0dc5fa1b7784466d952f5f230ba6ae34','表单',NULL,0,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-2','Widget.FormContact','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,NULL,'admin','超级管理员','2019-05-12 08:59:30.000','admin','超级管理员','2019-05-12 21:18:52.147',NULL,NULL,0,NULL,0,'{"FormID":"516f1fb100ea4885afbc8f231f6d1903","RuleID":null,"CustomClass":"","CustomStyle":"","DataSourceLink":null,"DataSourceLinkTitle":null,"ActionType":2}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('201286643054498fba0ffdd4485dc65d','产品类别',NULL,1,NULL,'2c0a828ed4a646f1a9723eb7139ff5cd','ZONE-1','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 14:04:15.963','admin','ZKEASOFT','2019-05-11 14:04:15.963',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('235996c84a994f018936b0cdc89f7eb0','文章内容',NULL,1,NULL,'375899eb70f2409cac6fdbcd78eab3a2','ZONE-1','Widget.ArticleDetailAb','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:50:34.730','admin','超级管理员','2019-05-13 14:50:34.730',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('280a7e2c3ce84c6f98f9fc38852b23fb','文章列表',NULL,1,NULL,'b6683315018f4098beb240b9129ca11f','ZONE-3','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:51:23.577','admin','超级管理员','2019-05-13 14:51:23.577',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('282cdd9194714f1a9c9c5b514d79cb0d','HTML',NULL,2,NULL,'31143965b228461d9f09f9afec9c310f','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 00:12:07.000','admin','超级管理员','2019-05-11 23:40:41.717',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('2a907daf4d2747a6b2da7555c80c6757','导航',NULL,3,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-0','Widget.Navigation','ZKEACMS','ZKEACMS.Common.Service.NavigationWidgetService','ZKEACMS.Common.Models.NavigationWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 08:28:33.000','admin','超级管理员','2019-05-13 15:18:56.770',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('30d2cb38450e47698e052dd8cbbb53c1','样式',NULL,1,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-0','Widget.StyleSheet','ZKEACMS','ZKEACMS.Common.Service.StyleSheetWidgetService','ZKEACMS.Common.Models.StyleSheetWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:39:21.413','admin','超级管理员','2019-05-13 15:18:56.717',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3f910eef01b049e9b2ccc3f91c2364c9','文章列表',NULL,1,NULL,'2b44a65b748948528a360cc2ec0f2603','ZONE-3','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','超级管理员','2019-05-12 00:24:44.597','admin','超级管理员','2019-05-12 00:24:44.597',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('45d793590e9b46aabf7a9930098f9ed1','文章内容',NULL,1,NULL,'1c75f6cae25e449eb5554f26b07b7c24','ZONE-1','Widget.ArticleDetailJM','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-11 23:05:00.397','admin','超级管理员','2019-05-11 23:05:00.397',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('4f9115b422b6416f80c64d57c310a4c5','特别文章内容',NULL,1,NULL,'afd10d0b64d44ef9aa677a019e696e27','ZONE-1','Widget.ArticleDetailAb','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSpecialDetailWidgetService','ZKEACMS.Article.Models.ArticleSpecialDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-11 23:31:43.127','admin','超级管理员','2019-05-11 23:31:43.127',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('4f943b840ea6417c8c85be14f4d8867a','文章类别',NULL,1,NULL,'1d3588669e2d4bf2bb731486f21270d1','ZONE-4','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 09:22:32.000','admin','ZKEASOFT','2019-05-11 11:25:43.660',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('5be7cc2b6e9247bfb47cd46d58e08c99','产品类别',NULL,1,NULL,'57bb355c28694cf9912664f3cb1468ef','ZONE-1','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:52:53.927','admin','超级管理员','2019-05-13 14:52:53.927',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('5d0eee3a2e1b4df397d821a998ccf6a2','文章内容',NULL,1,NULL,'0f56cb364d1f4ebb8b86dc6c06526c09','ZONE-1','Widget.ArticleDetailAb','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-11 23:34:26.950','admin','超级管理员','2019-05-11 23:34:26.950',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('5de5861efaaa4696ba16151bd55420c2','特别文章内容',NULL,1,NULL,'69a963d751274e73a4bb879efdc18b19','ZONE-1','Widget.ArticleDetailJM','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSpecialDetailWidgetService','ZKEACMS.Article.Models.ArticleSpecialDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:54:40.300','admin','超级管理员','2019-05-13 14:54:40.300',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('692ad496fdc6448f902fbafde6e919e0','产品类别',NULL,1,NULL,'67e50d8020a04c798a09096be57890b7','ZONE-1','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 17:27:06.133','admin','ZKEASOFT','2019-05-11 17:27:06.133',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('6e30e1bcc43442c5af8780f4fa278d95','产品内容',NULL,1,NULL,'33b55cabea314877a095529b0bd8c721','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 17:35:38.010','admin','ZKEASOFT','2019-05-11 17:35:38.010',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('810d75bb5bcd4f208b0193b7e62e5caa','特别文章内容',NULL,1,NULL,'7dc93ed1a4174ab692beb15a06159bad','ZONE-1','Widget.ArticleDetailJM','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSpecialDetailWidgetService','ZKEACMS.Article.Models.ArticleSpecialDetailWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 22:24:16.000','admin','超级管理员','2019-05-11 22:45:37.273',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('85eb0804b9954351adc41d3538088b25','文章内容',NULL,1,NULL,'419e6f52894940fd8261c3f7e719933d','ZONE-1','Widget.ArticleDetailAb','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-11 23:34:20.507','admin','超级管理员','2019-05-11 23:34:20.507',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8b50ce8fa65a41d3a4eccac470b0a1aa','特别文章内容',NULL,1,NULL,'072cefbba72d4149bbe3cb83003d5983','ZONE-1','Widget.ArticleDetailAb','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSpecialDetailWidgetService','ZKEACMS.Article.Models.ArticleSpecialDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:49:57.587','admin','超级管理员','2019-05-13 14:49:57.587',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8c3d8f87c0d14c03a03746e2e1fbc8c6','产品列表',NULL,2,NULL,'57bb355c28694cf9912664f3cb1468ef','ZONE-1','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:52:53.973','admin','超级管理员','2019-05-13 14:52:53.973',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8f07902f701d4df4899a1fda025abf97','产品列表',NULL,2,NULL,'2c0a828ed4a646f1a9723eb7139ff5cd','ZONE-1','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 14:06:05.000','admin','ZKEASOFT','2019-05-11 17:27:02.847',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('91566d5418954867b8e000cbbbf9e198','特别文章内容',NULL,1,NULL,'0563f84d9b214f38a1f76d8eba7b62a1','ZONE-1','Widget.ArticleDetailAb','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSpecialDetailWidgetService','ZKEACMS.Article.Models.ArticleSpecialDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-11 23:31:30.853','admin','超级管理员','2019-05-11 23:31:30.853',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('963af67d7aaa4cd49f216bf4c21d1420','文章内容',NULL,1,NULL,'6b0de27b1a5c4b42b2365ac9e2587bb3','ZONE-1','Widget.ArticleDetailJM','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:55:07.313','admin','超级管理员','2019-05-13 14:55:07.313',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('9fbf5dcb22784b378c12d79a5392d6d5','HTML',NULL,1,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-2','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 00:19:18.000','admin','超级管理员','2019-05-11 23:46:03.717',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('a339b704712f462881493f577fce31f2','文章内容',NULL,2,NULL,'206b9210f5ad422dad9e13a4797df74c','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 13:01:29.950','admin','ZKEASOFT','2019-05-11 13:01:29.950',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('b0a497524adb4ba8a8f3bb286b9ccd4d','产品列表',NULL,2,NULL,'67e50d8020a04c798a09096be57890b7','ZONE-1','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 17:27:06.140','admin','ZKEASOFT','2019-05-11 17:27:06.140',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('b7e2b6322ef746ecb30b8cd70fe66dd0','文章类别',NULL,1,NULL,'b6683315018f4098beb240b9129ca11f','ZONE-4','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:51:23.547','admin','超级管理员','2019-05-13 14:51:23.547',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('b7f1e260d47f4dd6b0e26006b285e083','特别文章内容',NULL,1,NULL,'6006398d08e04b82a9f9666407859684','ZONE-1','Widget.ArticleDetailAb','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSpecialDetailWidgetService','ZKEACMS.Article.Models.ArticleSpecialDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-13 15:29:28.713','admin','超级管理员','2019-05-13 15:29:28.713',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('c157885b508f4beaa2511428921c8a11','文章内容',NULL,1,NULL,'c102babe4a3043bf8f50d3a71075a4ef','ZONE-1','Widget.ArticleDetailJM','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-11 23:04:55.123','admin','超级管理员','2019-05-11 23:04:55.123',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('c4232a66ee894f158d8c5335d78b927d','特别文章内容',NULL,1,NULL,'77c5a847fd794baa95461ebd4a5e3853','ZONE-1','Widget.ArticleDetailJM','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSpecialDetailWidgetService','ZKEACMS.Article.Models.ArticleSpecialDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-12 00:40:43.300','admin','超级管理员','2019-05-12 00:40:43.300',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('cd6432c1f59e4fdfa67c819ef2f9e0c9','HTML',NULL,2,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-2','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 00:18:09.000','admin','超级管理员','2019-05-11 23:48:02.353',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('ceb27f6d9b8c4a448a857cf28f030b1e','文章内容',NULL,2,NULL,'05266b5af4da42f0818919345cf555bb','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:51:57.053','admin','超级管理员','2019-05-13 14:51:57.053',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('d1f0af8afb064358a245100bab1f49a2','产品内容',NULL,1,NULL,'1bf6ca8b93db44fca2d536249d67da6f','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','超级管理员','2019-05-13 14:53:39.000','admin','超级管理员','2019-05-13 14:53:39.000',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('d4ed8de9354e4ccdb41eb13d0c2fe45e','文章列表',NULL,1,NULL,'1d3588669e2d4bf2bb731486f21270d1','ZONE-3','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 09:23:49.000','admin','ZKEASOFT','2019-05-11 13:00:38.697',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('d922254550564b3caf65dff82202a8b7','HTML',NULL,2,NULL,'d23b2e22068942a79ef9b437e0b70940','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','超级管理员','2019-05-13 15:28:45.143','admin','超级管理员','2019-05-13 15:28:45.143',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('ee1d53299573443eaf360ce840d51ccf','产品内容',NULL,1,NULL,'3ce0f8eeea02460da9b5a308dcdb8bad','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 17:35:44.357','admin','ZKEASOFT','2019-05-11 17:35:44.357',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('eff531d98c4c4e3199dd1ee5b73f18df','文章类别',NULL,1,NULL,'2b44a65b748948528a360cc2ec0f2603','ZONE-4','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','超级管理员','2019-05-12 00:24:44.573','admin','超级管理员','2019-05-12 00:24:44.573',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f75c371cc5574e0f883469ebec7df694','文章内容',NULL,2,NULL,'bc1391f9f06f4ec7a29bf62d3d633894','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2019-05-11 13:09:52.567','admin','ZKEASOFT','2019-05-11 13:09:52.567',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [StyleSheetWidget] ([ID],[StyleSheet]) VALUES ('30d2cb38450e47698e052dd8cbbb53c1','<link type="text/css" rel="stylesheet" href="/themes/Kefan/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="/themes/Kefan/css/basic.css" />');
INSERT INTO [ProductListWidget] ([ID],[IsPageable],[ProductCategoryID],[DetailPageUrl],[Columns],[PageSize]) VALUES ('8c3d8f87c0d14c03a03746e2e1fbc8c6',1,4,'~/product/detail','col-xs-12 col-sm-6 col-md-4 col-lg-3',4);
INSERT INTO [ProductListWidget] ([ID],[IsPageable],[ProductCategoryID],[DetailPageUrl],[Columns],[PageSize]) VALUES ('8f07902f701d4df4899a1fda025abf97',1,4,'~/product/detail','col-xs-12 col-sm-6 col-md-4 col-lg-3',4);
INSERT INTO [ProductListWidget] ([ID],[IsPageable],[ProductCategoryID],[DetailPageUrl],[Columns],[PageSize]) VALUES ('b0a497524adb4ba8a8f3bb286b9ccd4d',1,4,'~/product/detail','col-xs-12 col-sm-6 col-md-4 col-lg-3',4);
INSERT INTO [ProductDetailWidget] ([ID],[CustomerClass]) VALUES ('6e30e1bcc43442c5af8780f4fa278d95',NULL);
INSERT INTO [ProductDetailWidget] ([ID],[CustomerClass]) VALUES ('d1f0af8afb064358a245100bab1f49a2',NULL);
INSERT INTO [ProductDetailWidget] ([ID],[CustomerClass]) VALUES ('ee1d53299573443eaf360ce840d51ccf',NULL);
INSERT INTO [ProductCategoryWidget] ([ID],[ProductCategoryID],[TargetPage]) VALUES ('201286643054498fba0ffdd4485dc65d',4,NULL);
INSERT INTO [ProductCategoryWidget] ([ID],[ProductCategoryID],[TargetPage]) VALUES ('5be7cc2b6e9247bfb47cd46d58e08c99',4,NULL);
INSERT INTO [ProductCategoryWidget] ([ID],[ProductCategoryID],[TargetPage]) VALUES ('692ad496fdc6448f902fbafde6e919e0',4,NULL);
INSERT INTO [NavigationWidget] ([ID],[CustomerClass],[Title],[Logo],[AlignClass],[IsTopFix],[RootID],[ShowBasket]) VALUES ('2a907daf4d2747a6b2da7555c80c6757','container',NULL,'/UpLoad/Images/201905/0193e9543c154b6f9d276a65cce72a90.png','navbar-left',NULL,'#',0);
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('026d94443b98441881edb27d7363ae7f','<div class="about_list_met_36_3_49 met-index-body mcustomize module bgShow bgParallax horizontal tlir" m-id="49">
<div class="container">
<div class="heading" data-center="1">
<h2 style="text-align: center;">关于我们</h2>
<hr class="center" /></div>
<div class="container_content">
<div class="contentbody">
<div class="wrapper">
<div class="header wow" style="visibility: visible; animation-name: fadeInUp;"></div>
<div class="description wow" style="visibility: visible; animation-name: fadeInUp;">
<p class="my-desc">蛋糕店由长沙餐饮管理有限公司（大陆事业部）于2006年5月正式引进国内市场招商运作，蛋糕店以港式甜品原文化为依托，把香飘两广的香港甜品文化，准确无误的带进国内市场；并以相约蛋糕店，平民主义的战略宗旨和低成本策略进入国内市场。我们坚持采摘纯天然水果，小产区原野原味，源于天然雨水和阳光，让您尽情品尝大自然的味道。</p>
<p></p>
<p><a href="/about" class="more">更多</a></p>
</div>
</div>
</div>
<div class="mediabody wow" style="visibility: visible; animation-name: fadeInUp;"><a> <img class="image" src="https://images.mituo.cn/mui492/upload/mui492/thumb_src/495_230/1546496391.jpg" alt="" /> </a></div>
<div class="clear"></div>
</div>
</div>
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('282cdd9194714f1a9c9c5b514d79cb0d','<div class="about_list_met_36_3_49 met-index-body mcustomize module bgShow bgParallax horizontal tlir" m-id="49">
<div class="container">
<div class="heading" data-center="1">
<h2 style="text-align: center;">关于我们</h2>
<hr class="center" /></div>
<div class="container_content">
<div class="contentbody">
<div class="wrapper">
<div class="header wow" style="visibility: visible; animation-name: fadeInUp;"></div>
<div class="description wow" style="visibility: visible; animation-name: fadeInUp;">
<p class="my-desc">蛋糕店由长沙餐饮管理有限公司（大陆事业部）于2006年5月正式引进国内市场招商运作，蛋糕店以港式甜品原文化为依托，把香飘两广的香港甜品文化，准确无误的带进国内市场；并以相约蛋糕店，平民主义的战略宗旨和低成本策略进入国内市场。我们坚持采摘纯天然水果，小产区原野原味，源于天然雨水和阳光，让您尽情品尝大自然的味道。</p>
<p></p>
<p><a href="/about" class="more">更多</a></p>
</div>
</div>
</div>
<div class="mediabody wow" style="visibility: visible; animation-name: fadeInUp;"><a> <img class="image" src="https://images.mituo.cn/mui492/upload/mui492/thumb_src/495_230/1546496391.jpg" alt="" /> </a></div>
<div class="clear"></div>
</div>
</div>
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('9fbf5dcb22784b378c12d79a5392d6d5','<div class="foot_nav_met_16_1_64 border-top1 text-xs-center" m-id="64" m-type="foot_nav">
<div class="container">
<div class="row mob-masonry     ">
<div class="col-lg-2 col-md-3 col-xs-6 list masonry-item">
<h4 class="font-size-16 m-t-0"><a href="/about" title="关于我们">关于我们</a></h4>
<ul class="ulstyle m-b-0">
<li><a href="/about/detail/company.html" title="公司介绍">公司介绍</a></li>
<li><a href="/about/detail/knowledge.html" title="企业文化">企业文化</a></li>
<li><a href="/about/detail/goodat.html" title="品牌优势">品牌优势</a></li>
</ul>
</div>
<div class="col-lg-2 col-md-3 col-xs-6 list masonry-item">
<h4 class="font-size-16 m-t-0"><a href="/product" title="产品中心">产品中心</a></h4>
<ul class="ulstyle m-b-0">
<li><a href="/product/shop.html" title="店铺招牌">店铺招牌</a></li>
<li><a href="/product/new.html" title="新品上市">新品上市</a></li>
</ul>
</div>
<div class="col-lg-2 col-md-3 col-xs-6 list masonry-item">
<h4 class="font-size-16 m-t-0"><a href="/join" title="招商加盟">招商加盟</a></h4>
<ul class="ulstyle m-b-0">
<li><a href="/join" title="加盟支持">加盟支持</a></li>
<li><a href="/join/detail/youshi.html" title="品牌优势">品牌优势</a></li>
<li><a href="/join/detail/liucheng.html" title="加盟流程">加盟流程</a></li>
</ul>
</div>
<div class="col-lg-2 col-md-3 col-xs-6 list masonry-item">
<h4 class="font-size-16 m-t-0"><a href="/shop" title="店铺展示">店铺展示</a></h4>
</div>
<div class="col-lg-3 col-md-12 col-xs-12 info masonry-item"><a id="met-weixin" data-plugin="webuiPopover" data-trigger="hover" data-animation="pop" data-placement="top" data-width="155" data-padding="0"></a> <i class="fa fa-weixin light-green-700"></i> <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=&amp;site=qq&amp;menu=yes" rel="nofollow noopener" target="_blank"> <i class="fa fa-qq"></i> </a> <a rel="nofollow noopener" target="_blank"> <i class="fa fa-weibo red-600"></i> </a></div>
</div>
</div>
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('cd6432c1f59e4fdfa67c819ef2f9e0c9','<footer class="foot_info_met_16_1_9 met-foot border-top1" m-id="9" m-type="foot">
<div class="container text-xs-center">
<p>我的网站 版权所有 2008-2019 湘ICP备8888888</p>
<p>本站内容、图片、视频为网站模板演示数据，如有涉及侵犯版权，请联系我们提供书面反馈，我们核实后会立即删除。</p>
<div class="powered_by_metinfo">Powered by <b><a href="http://www.zkea.net/zkeacms" target="_blank" title="CMS" rel="noopener">ZKEACMS</a></b> &copy;2008-2019 &nbsp;</div>
<ul class="met-langlist p-0"></ul>
</div>
</footer>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('d922254550564b3caf65dff82202a8b7','<div class="about_list_met_36_3_49 met-index-body mcustomize module bgShow bgParallax horizontal tlir" m-id="49">
<div class="container">
<div class="heading" data-center="1">
<h2 style="text-align: center;">关于我们</h2>
<hr class="center" /></div>
<div class="container_content">
<div class="contentbody">
<div class="wrapper">
<div class="header wow" style="visibility: visible; animation-name: fadeInUp;"></div>
<div class="description wow" style="visibility: visible; animation-name: fadeInUp;">
<p class="my-desc">蛋糕店由长沙餐饮管理有限公司（大陆事业部）于2006年5月正式引进国内市场招商运作，蛋糕店以港式甜品原文化为依托，把香飘两广的香港甜品文化，准确无误的带进国内市场；并以相约蛋糕店，平民主义的战略宗旨和低成本策略进入国内市场。我们坚持采摘纯天然水果，小产区原野原味，源于天然雨水和阳光，让您尽情品尝大自然的味道。</p>
<p></p>
<p><a href="/about" class="more">更多</a></p>
</div>
</div>
</div>
<div class="mediabody wow" style="visibility: visible; animation-name: fadeInUp;"><a> <img class="image" src="https://images.mituo.cn/mui492/upload/mui492/thumb_src/495_230/1546496391.jpg" alt="" /> </a></div>
<div class="clear"></div>
</div>
</div>
</div>');
INSERT INTO [CMS_Theme] ([ID],[Title],[Url],[UrlDebugger],[Thumbnail],[IsActived],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Default','默认','~/themes/Default/css/Theme.min.css','~/themes/Default/css/Theme.css','~/themes/Default/thumbnail.jpg',0,1,NULL,'admin','ZKEASOFT','2016-04-04 22:17:10.790','admin','ZKEASOFT','2019-05-10 17:11:50.467');
INSERT INTO [CMS_Theme] ([ID],[Title],[Url],[UrlDebugger],[Thumbnail],[IsActived],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Kefan','科凡','~/themes/Kefan/css/Theme.min.css','~/themes/Kefan/css/Theme.css','~/themes/Kefan/thumbnail.jpg',1,1,NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2019-05-10 17:11:50.470');
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('0336b35ae36948529109038e1f909cc4','b108984639d441c0bb50aea2e795b603','index_cn.css',100,'~/UpLoad/Files/201905/7d96a6e4985b4c48a04c8a3f3b5c4cdc.css',1,'admin','ZKEASOFT','2019-05-10 23:37:10.360','admin','ZKEASOFT','2019-05-10 23:37:10.360',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('03fbfcfd2326453aab6c230f2a33ff58','b26edbab758344c69603950b9ff08e31','1546832558.jpg',2,'~/UpLoad/Images/201905/6eac0d3b0a58437d9d120c9600c14ecd.jpg',1,'admin','ZKEASOFT','2019-05-11 00:00:40.587','admin','ZKEASOFT','2019-05-11 00:00:40.587',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('0ad29dc185db6c3491c750901c952e82','eb8730b55b2b45b2bac3e899b304a111','fc6b1f7b328d433992ade5ea2647f809.jpg',2,'~/UpLoad/Images/201905/fc6b1f7b328d433992ade5ea2647f809.jpg',1,'admin','ZKEASOFT','2019-05-11 13:53:04.703','admin','ZKEASOFT','2019-05-11 13:53:04.703',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('12976e318e516819d066c6b4eb98521e','eb8730b55b2b45b2bac3e899b304a111','6f73173c5d30473a8197feecd1a3da5c.jpg',2,'~/UpLoad/Images/201905/6f73173c5d30473a8197feecd1a3da5c.jpg',1,'admin','ZKEASOFT','2019-05-11 13:54:32.953','admin','ZKEASOFT','2019-05-11 13:54:32.953',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('27ee63c441954ac99c3ea1d7e11e7e60','b26edbab758344c69603950b9ff08e31','1546503948.png',2,'~/UpLoad/Images/201905/0193e9543c154b6f9d276a65cce72a90.png',1,'admin','ZKEASOFT','2019-05-11 08:37:31.337','admin','ZKEASOFT','2019-05-11 08:37:31.337',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('2a1f95c19f3fdc0d5fa77697dc4ad6e4','eb8730b55b2b45b2bac3e899b304a111','29878684505642e986adc12d32ae0f6a.jpg',2,'~/UpLoad/Images/201905/29878684505642e986adc12d32ae0f6a.jpg',1,'admin','超级管理员','2019-05-11 23:15:09.753','admin','超级管理员','2019-05-11 23:15:09.753',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('327e20b9249626c59f5fa94cb2f53370','eb8730b55b2b45b2bac3e899b304a111','a5f748398f51427996d4b12897ac8181.jpg',2,'~/UpLoad/Images/201905/a5f748398f51427996d4b12897ac8181.jpg',1,'admin','超级管理员','2019-05-11 23:16:15.193','admin','超级管理员','2019-05-11 23:16:15.193',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('4169b47b9702cd4c60723adc88c4a248','eb8730b55b2b45b2bac3e899b304a111','5c1b74e20e9d48119b28c8355d3873fa.jpg',2,'~/UpLoad/Images/201905/5c1b74e20e9d48119b28c8355d3873fa.jpg',1,'admin','超级管理员','2019-05-11 23:14:08.583','admin','超级管理员','2019-05-11 23:14:08.583',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('52c8c6cf065c46178b552d982978d754','b108984639d441c0bb50aea2e795b603','showproduct_cn.css',100,'~/UpLoad/Files/201905/29bfbc98ee4f442ca7644cbb3c360514.css',1,'admin','ZKEASOFT','2019-05-11 17:34:27.730','admin','ZKEASOFT','2019-05-11 17:34:27.730',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('59fadd690e3e25d695e2dc1f1ff39923','eb8730b55b2b45b2bac3e899b304a111','48c0cdb47c6a4fdd859e7881c7bac2e2.jpg',2,'~/UpLoad/Images/201905/48c0cdb47c6a4fdd859e7881c7bac2e2.jpg',1,'admin','超级管理员','2019-05-11 23:15:18.623','admin','超级管理员','2019-05-11 23:15:18.623',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('62b7d515e577a6505b761d36415b9286','eb8730b55b2b45b2bac3e899b304a111','35c09c05065a444ca36cd2aaeec88ddf.jpg',2,'~/UpLoad/Images/201905/35c09c05065a444ca36cd2aaeec88ddf.jpg',1,'admin','ZKEASOFT','2019-05-11 13:49:51.290','admin','ZKEASOFT','2019-05-11 13:49:51.290',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('6f29a1f278294165bc1c5b414df6e30b','b108984639d441c0bb50aea2e795b603','news_cn.css',100,'~/UpLoad/Files/201905/75c6cb6a58fc496d8e7e5673d50afe38.css',1,'admin','ZKEASOFT','2019-05-11 09:13:39.207','admin','ZKEASOFT','2019-05-11 09:13:39.207',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('75ced7472e902af34843b0600bd3df87','eb8730b55b2b45b2bac3e899b304a111','b3b1cb9444dc43b98c0fb7ad0c0edb4a.jpg',2,'~/UpLoad/Images/201905/b3b1cb9444dc43b98c0fb7ad0c0edb4a.jpg',1,'admin','ZKEASOFT','2019-05-11 13:54:45.137','admin','ZKEASOFT','2019-05-11 13:54:45.137',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('80aeff1a398b31fdd60154dcb01eb87d','eb8730b55b2b45b2bac3e899b304a111','4c9e6a975485432bbca5b160fed04cd6.jpg',2,'~/UpLoad/Images/201905/4c9e6a975485432bbca5b160fed04cd6.jpg',1,'admin','超级管理员','2019-05-11 23:17:27.357','admin','超级管理员','2019-05-11 23:17:27.357',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('838da3d8c140980a3572baf7f08aec93','eb8730b55b2b45b2bac3e899b304a111','299cb0fc843246c4ae2cb499b398622e.jpg',2,'~/UpLoad/Images/201905/299cb0fc843246c4ae2cb499b398622e.jpg',1,'admin','ZKEASOFT','2019-05-11 13:55:30.003','admin','ZKEASOFT','2019-05-11 13:55:30.003',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('9551e2ad8af7477bb27385a1a828bac4','b108984639d441c0bb50aea2e795b603','img_cn.css',100,'~/UpLoad/Files/201905/ec24fe6c4c6540fb973e07b97f131141.css',1,'admin','ZKEASOFT','2019-05-10 23:50:06.723','admin','ZKEASOFT','2019-05-10 23:50:06.723',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('95c54aabf6d54a1497fdc747e1fff96b','b108984639d441c0bb50aea2e795b603','product_cn.css',100,'~/UpLoad/Files/201905/c2f7e3d99e1048adbaf43456ec40de52.css',1,'admin','ZKEASOFT','2019-05-11 13:58:31.607','admin','ZKEASOFT','2019-05-11 13:58:31.607',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('99e41ea5a692c2277152146f1445cf33','eb8730b55b2b45b2bac3e899b304a111','a94cfe70e2f943c5be234a08d119d9bf.jpg',2,'~/UpLoad/Images/201905/a94cfe70e2f943c5be234a08d119d9bf.jpg',1,'admin','超级管理员','2019-05-11 23:17:43.950','admin','超级管理员','2019-05-11 23:17:43.950',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('9d58f00a02895025c32d6a48520beecc','eb8730b55b2b45b2bac3e899b304a111','4a6aed4f70824cc0acbc78bd1ab67815.jpg',2,'~/UpLoad/Images/201905/4a6aed4f70824cc0acbc78bd1ab67815.jpg',1,'admin','超级管理员','2019-05-11 23:13:56.960','admin','超级管理员','2019-05-11 23:13:56.960',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('acbd93d2ba8142bc8bff4f7bed9a26bd','b108984639d441c0bb50aea2e795b603','show_cn.css',100,'~/UpLoad/Files/201905/be998119171242ff91d4d1c68bf23fba.css',1,'admin','ZKEASOFT','2019-05-11 00:54:48.623','admin','ZKEASOFT','2019-05-11 00:54:48.623',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('b108984639d441c0bb50aea2e795b603','#','css',1,NULL,NULL,'admin','ZKEASOFT','2019-05-10 23:36:52.717','admin','ZKEASOFT','2019-05-10 23:36:52.777',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('b26edbab758344c69603950b9ff08e31','#','images',1,NULL,NULL,'admin','ZKEASOFT','2019-05-10 23:36:57.967','admin','ZKEASOFT','2019-05-10 23:36:57.987',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('b3615ce0a0fe4391bdf2aa1b13533ca1','b26edbab758344c69603950b9ff08e31','1553592075.jpg',2,'~/UpLoad/Images/201905/faabe837779247d4999dbe11dea88f75.jpg',1,'admin','ZKEASOFT','2019-05-11 00:00:40.557','admin','ZKEASOFT','2019-05-11 00:00:40.557',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('c1c3b6d32fa8daf345de729f5512dd2f','eb8730b55b2b45b2bac3e899b304a111','8b335e396537421a8ee2378e2d17cf9c.jpg',2,'~/UpLoad/Images/201905/8b335e396537421a8ee2378e2d17cf9c.jpg',1,'admin','ZKEASOFT','2019-05-11 13:50:38.693','admin','ZKEASOFT','2019-05-11 13:50:38.693',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('d02fc26acbcfbfcb14f797f1c32d6c82','eb8730b55b2b45b2bac3e899b304a111','e2225919505d4e7db3abf44391e46053.jpg',2,'~/UpLoad/Images/201905/e2225919505d4e7db3abf44391e46053.jpg',1,'admin','ZKEASOFT','2019-05-11 13:55:48.770','admin','ZKEASOFT','2019-05-11 13:55:48.770',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('d2167471e0159c21e334c355cc73fe80','eb8730b55b2b45b2bac3e899b304a111','79c97c114521499ab60c9ccdd1dd0e43.jpg',2,'~/UpLoad/Images/201905/79c97c114521499ab60c9ccdd1dd0e43.jpg',1,'admin','ZKEASOFT','2019-05-11 13:52:49.413','admin','ZKEASOFT','2019-05-11 13:52:49.413',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('e8eb5b8daeed8b4a1325d1bb655e65be','eb8730b55b2b45b2bac3e899b304a111','03179e26b8bf451fbf9092b19aabddcb.jpg',2,'~/UpLoad/Images/201905/03179e26b8bf451fbf9092b19aabddcb.jpg',1,'admin','超级管理员','2019-05-11 23:16:40.600','admin','超级管理员','2019-05-11 23:16:40.600',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('eb8730b55b2b45b2bac3e899b304a111','#','图片',1,NULL,NULL,'admin','ZKEASOFT','2019-05-11 13:49:50.203','admin','ZKEASOFT','2019-05-11 13:49:50.203',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('fd983861cabb42cbb8132d38b45ec8bb','b108984639d441c0bb50aea2e795b603','shownews_cn.css',100,'~/UpLoad/Files/201905/70f00ac4d16f415c8b95eff7e192e0a4.css',1,'admin','ZKEASOFT','2019-05-11 12:59:34.500','admin','ZKEASOFT','2019-05-11 12:59:34.500',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('fe1f26a23b044eee942a479ed8c65760','b108984639d441c0bb50aea2e795b603','basic.css',100,'~/UpLoad/Files/201905/a4666593c99e41b285707abaeb0449cd.css',1,'admin','ZKEASOFT','2019-05-10 23:39:06.107','admin','ZKEASOFT','2019-05-10 23:39:06.107',NULL);
INSERT INTO [CMS_Layout] ([ID],[LayoutName],[Title],[ContainerClass],[Status],[Description],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[ImageUrl],[ImageThumbUrl],[Theme]) VALUES ('cdd02cb5c11d49d690ae618c14843944','简单布局',NULL,NULL,1,NULL,NULL,'','admin','ZKEASOFT','2019-05-10 16:35:56.000','admin','ZKEASOFT','2019-05-10 23:39:12.677','~/images/layout.jpg','~/images/layout.jpg',NULL);
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0027b01a0228452e907ef22727b9c748','cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','主内容',NULL,'admin','超级管理员','2019-05-12 00:24:44.393','admin','超级管理员','2019-05-12 00:24:44.393',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('01998cc0f3dc4298a5fdbffa12cd8a54','cdd02cb5c11d49d690ae618c14843944','6927b626d6d5419b955538a264a21368','新闻分类',NULL,'admin','ZKEASOFT','2019-05-11 12:41:13.520','admin','ZKEASOFT','2019-05-11 12:41:13.520',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0212ffa228c243619ba375f176ff1bac','cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','主内容',NULL,'admin','超级管理员','2019-05-13 14:52:53.833','admin','超级管理员','2019-05-13 14:52:53.833',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('03010e1ac14f45d5b6c09cdcb6e305a0','cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','顶部',NULL,'admin','ZKEASOFT','2019-05-10 23:47:57.543','admin','ZKEASOFT','2019-05-11 09:17:54.020',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('030a64c5d8104b5990e995babfbb7bdf','cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','底部',NULL,'admin','超级管理员','2019-05-13 15:28:45.050','admin','超级管理员','2019-05-13 15:28:45.050',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('049c7ca7c98440c9a9fa77eb964628e1','cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','底部',NULL,'admin','超级管理员','2019-05-13 14:48:45.453','admin','超级管理员','2019-05-13 14:48:45.453',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0586fc30c4dd4bbc8af76efb329be576','cdd02cb5c11d49d690ae618c14843944','66043581526341f5a586f7a0e66ca083','新闻分类',NULL,'admin','ZKEASOFT','2019-05-11 09:23:55.880','admin','ZKEASOFT','2019-05-11 09:23:55.880',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('06bab8a7f4494b2d8ed1522f99a73b68','cdd02cb5c11d49d690ae618c14843944','735188bc7e184cca8f66378dbc237692','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:01:50.770','admin','ZKEASOFT','2019-05-11 00:01:50.770',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0b0578bb06c94b9fb1a919d551631671','cdd02cb5c11d49d690ae618c14843944','114afab91a904dc4a20de6f3ebeaa8e4','新闻列表',NULL,'admin','ZKEASOFT','2019-05-11 13:01:39.417','admin','ZKEASOFT','2019-05-11 13:01:39.417',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0d19c0e0338841f1a355ad5d55a04cc7','cdd02cb5c11d49d690ae618c14843944','fe62e8b9989e45f09b370e2ce0e7ea0f','主内容',NULL,'admin','ZKEASOFT','2019-05-11 11:25:47.413','admin','ZKEASOFT','2019-05-11 11:25:47.413',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1087f72c67d449e8bf4a58769ef0d1a1','cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','底部',NULL,'admin','ZKEASOFT','2019-05-11 09:08:03.127','admin','ZKEASOFT','2019-05-11 10:07:31.807',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('120f5b708fb84573b02d363ba2900758','cdd02cb5c11d49d690ae618c14843944','9d552c6088384a13aa7de76de0d776f7','顶部',NULL,'admin','超级管理员','2019-05-11 23:40:47.447','admin','超级管理员','2019-05-11 23:40:47.447',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1347dad2d1bf4ec1b135d8482ac99e1e','cdd02cb5c11d49d690ae618c14843944','66043581526341f5a586f7a0e66ca083','新闻列表',NULL,'admin','ZKEASOFT','2019-05-11 09:23:55.880','admin','ZKEASOFT','2019-05-11 09:23:55.880',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('147070d93a3f44c9a06d1d0eae2d4ac2','cdd02cb5c11d49d690ae618c14843944','9d552c6088384a13aa7de76de0d776f7','底部',NULL,'admin','超级管理员','2019-05-11 23:40:47.450','admin','超级管理员','2019-05-11 23:40:47.450',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('14e43646fae14b1c96ad0586dd4fdf40','cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','顶部',NULL,'admin','超级管理员','2019-05-12 00:40:43.163','admin','超级管理员','2019-05-12 00:40:43.163',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('153e54f6028e4cf9bae140bd40a1f9e4','cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','主内容',NULL,'admin','超级管理员','2019-05-13 14:49:57.537','admin','超级管理员','2019-05-13 14:49:57.537',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('156b16f288e9456cbb57dd21b5c2d4c1','cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','底部',NULL,'admin','超级管理员','2019-05-13 14:53:38.937','admin','超级管理员','2019-05-13 14:53:38.937',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('156e2aba6ff042c785e4a1dabb6756d6','cdd02cb5c11d49d690ae618c14843944','4d529fa56f304178bb7c1ba90d2cfe0b','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:12:12.463','admin','ZKEASOFT','2019-05-11 00:12:12.463',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('157680e67fd04acb82162386b84d6edb','cdd02cb5c11d49d690ae618c14843944','c53682ce584c4cc89eadf48b9d924c08','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:42:46.387','admin','ZKEASOFT','2019-05-11 00:42:46.387',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('15fcd341ae7241608f328f800d9bc85b','cdd02cb5c11d49d690ae618c14843944','0114241aeea04a6fa024716f624cf6b4','底部',NULL,'admin','ZKEASOFT','2019-05-11 22:22:58.347','admin','ZKEASOFT','2019-05-11 22:22:58.347',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('162a036715754edb94d1fef79e6a1ff7','cdd02cb5c11d49d690ae618c14843944','fdcc1e5c544a424d94475d71d05e6b26','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:13:42.247','admin','ZKEASOFT','2019-05-11 00:13:42.247',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('18081487087d42b390baab95186061b9','cdd02cb5c11d49d690ae618c14843944','4d529fa56f304178bb7c1ba90d2cfe0b','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:12:12.457','admin','ZKEASOFT','2019-05-11 00:12:12.457',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1871a75e0cda4eda9528a3a4d31621fa','cdd02cb5c11d49d690ae618c14843944','51f565caa11b42bca8411cb82680519e','顶部',NULL,'admin','ZKEASOFT','2019-05-11 13:00:11.753','admin','ZKEASOFT','2019-05-11 13:00:11.753',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1b2fcd4ad7b2475fa454bcd3fe8dd9dc','cdd02cb5c11d49d690ae618c14843944','66043581526341f5a586f7a0e66ca083','底部',NULL,'admin','ZKEASOFT','2019-05-11 09:23:55.870','admin','ZKEASOFT','2019-05-11 09:23:55.870',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1be2667ffae142c4aaf2a51ea5281505','cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','顶部',NULL,'admin','超级管理员','2019-05-13 14:48:45.450','admin','超级管理员','2019-05-13 14:48:45.450',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1c6f3444a5d44af4bbf1843481bee26d','cdd02cb5c11d49d690ae618c14843944','c564442d60d445069cc5ed74f3e64297','主内容',NULL,'admin','超级管理员','2019-05-12 00:42:40.787','admin','超级管理员','2019-05-12 00:42:40.787',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2240ee8c8a794df4aadfe6db7bad137b','cdd02cb5c11d49d690ae618c14843944','9e525853139d430ab3b24715404fb9a8','新闻列表',NULL,'admin','ZKEASOFT','2019-05-11 10:08:19.553','admin','ZKEASOFT','2019-05-11 10:08:19.553',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('26c26edd320a4eeca8590c6b6ed46d47','cdd02cb5c11d49d690ae618c14843944','cdd97493a79d40d7881dafa7191dcfd7','底部',NULL,'admin','ZKEASOFT','2019-05-11 14:06:10.293','admin','ZKEASOFT','2019-05-11 14:06:10.293',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2761d4eb24b943cdb1b7ff86dcd5d30a','cdd02cb5c11d49d690ae618c14843944','41093638f1204ff9ace155163e61d182','底部',NULL,'admin','ZKEASOFT','2019-05-10 23:51:27.117','admin','ZKEASOFT','2019-05-10 23:51:27.117',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('28d7e326dd9b41d7a711d4597290dddd','cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','顶部',NULL,'admin','ZKEASOFT','2019-05-11 13:58:35.670','admin','ZKEASOFT','2019-05-11 13:58:35.670',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2ac58d1d063d416986fdd27f5282de06','cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','顶部',NULL,'admin','ZKEASOFT','2019-05-11 13:09:52.527','admin','ZKEASOFT','2019-05-11 13:09:52.527',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2adcd539995f48fd9651a11fff6148a4','cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:54:57.200','admin','ZKEASOFT','2019-05-11 00:54:57.200',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2d43651d3df24020929595f9032c7d87','cdd02cb5c11d49d690ae618c14843944','fe62e8b9989e45f09b370e2ce0e7ea0f','新闻列表',NULL,'admin','ZKEASOFT','2019-05-11 11:25:47.417','admin','ZKEASOFT','2019-05-11 11:25:47.417',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2ea9aecf7b694baf81d9164a774f05df','cdd02cb5c11d49d690ae618c14843944','64b0f15319f74429be06bd6ce32a50f4','主内容',NULL,'admin','ZKEASOFT','2019-05-11 22:24:23.267','admin','ZKEASOFT','2019-05-11 22:24:23.267',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('31adcc030d744e3998dd402a31866632','cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','顶部',NULL,'admin','超级管理员','2019-05-13 14:54:40.247','admin','超级管理员','2019-05-13 14:54:40.247',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('32c313b9047346da94ba4da2bcb0e17f','cdd02cb5c11d49d690ae618c14843944','9e525853139d430ab3b24715404fb9a8','底部',NULL,'admin','ZKEASOFT','2019-05-11 10:08:19.547','admin','ZKEASOFT','2019-05-11 10:08:19.547',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3393487d65f646d1a779b885ab876d13','cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','底部',NULL,'admin','ZKEASOFT','2019-05-11 17:35:44.310','admin','ZKEASOFT','2019-05-11 17:35:44.310',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('33a7e8e1c86142c1991d7a1ab5508144','cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','主内容',NULL,'admin','ZKEASOFT','2019-05-11 13:58:35.690','admin','ZKEASOFT','2019-05-11 13:58:35.690',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('343c7cbf489347f5bbb44b2b54812f29','cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','底部',NULL,'admin','ZKEASOFT','2019-05-11 22:13:35.230','admin','ZKEASOFT','2019-05-11 22:13:35.230',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('362630aa79ad4b818cb4703139a5965b','cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','顶部',NULL,'admin','超级管理员','2019-05-13 14:51:23.380','admin','超级管理员','2019-05-13 14:51:23.380',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('375b3316ad234ab5936ff483e52db0de','cdd02cb5c11d49d690ae618c14843944','735188bc7e184cca8f66378dbc237692','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:01:50.767','admin','ZKEASOFT','2019-05-11 00:01:50.767',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('39872b4a4ce1441186841d95e3175dd7','cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','主内容',NULL,'admin','超级管理员','2019-05-11 23:33:31.227','admin','超级管理员','2019-05-11 23:33:31.227',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3a993140df964226b18729ab2caf9014','cdd02cb5c11d49d690ae618c14843944','9d552c6088384a13aa7de76de0d776f7','主内容',NULL,'admin','超级管理员','2019-05-11 23:40:47.453','admin','超级管理员','2019-05-11 23:40:47.453',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3b7b4ed701d84a4a8f5d7fa00b339813','cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','主内容',NULL,'admin','超级管理员','2019-05-13 14:54:40.250','admin','超级管理员','2019-05-13 14:54:40.250',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3ba4f2b907d644339ff1e38c67287fd3','cdd02cb5c11d49d690ae618c14843944','cdd97493a79d40d7881dafa7191dcfd7','主内容',NULL,'admin','ZKEASOFT','2019-05-11 14:06:10.290','admin','ZKEASOFT','2019-05-11 14:06:10.290',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3bc00c761aa94219821d8d0258f4e097','cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','底部',NULL,'admin','超级管理员','2019-05-11 23:31:43.080','admin','超级管理员','2019-05-11 23:31:43.080',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3dc1a57ed08d4fd596c58020d0126d43','cdd02cb5c11d49d690ae618c14843944','93f26ddf4756437c800f194f44af0c91','底部',NULL,'admin','超级管理员','2019-05-11 23:29:26.440','admin','超级管理员','2019-05-11 23:29:26.440',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4426b3ccda224ffe9843aa07a1a6cf3c','cdd02cb5c11d49d690ae618c14843944',NULL,'顶部',NULL,'admin','ZKEASOFT','2019-05-10 16:36:15.253','admin','ZKEASOFT','2019-05-10 23:27:51.580',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('461a8c9449214991ae77a69d4d20ef7b','cdd02cb5c11d49d690ae618c14843944','c564442d60d445069cc5ed74f3e64297','顶部',NULL,'admin','超级管理员','2019-05-12 00:42:40.780','admin','超级管理员','2019-05-12 00:42:40.780',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('474ccd35313a40b8919a75e01bcb9247','cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','底部',NULL,'admin','超级管理员','2019-05-12 00:40:43.117','admin','超级管理员','2019-05-12 00:40:43.117',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('490babb11b11434eb0336e8a5c10b856','cdd02cb5c11d49d690ae618c14843944','1fb98da5e5ff49ea9b4aa079d811e589','主内容',NULL,'admin','超级管理员','2019-05-13 14:40:09.743','admin','超级管理员','2019-05-13 14:40:09.743',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('49dbde15674b44a6b506efc24ca78623','cdd02cb5c11d49d690ae618c14843944','c564442d60d445069cc5ed74f3e64297','底部',NULL,'admin','超级管理员','2019-05-12 00:42:40.783','admin','超级管理员','2019-05-12 00:42:40.783',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4b08db1af0fa403097d31f11b924a60a','cdd02cb5c11d49d690ae618c14843944','c53682ce584c4cc89eadf48b9d924c08','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:42:46.387','admin','ZKEASOFT','2019-05-11 00:42:46.387',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4c708705935f433090a41c426045d4ac','cdd02cb5c11d49d690ae618c14843944','9e525853139d430ab3b24715404fb9a8','顶部',NULL,'admin','ZKEASOFT','2019-05-11 10:08:19.550','admin','ZKEASOFT','2019-05-11 10:08:19.550',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4d82bd8b8b344f74976584a0ad182bb3','cdd02cb5c11d49d690ae618c14843944','4f234a8381704de1927b75b46f43471e','顶部',NULL,'admin','ZKEASOFT','2019-05-11 09:14:00.123','admin','ZKEASOFT','2019-05-11 09:14:00.123',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4e1421e4f5804e3b948d006ce036d374','cdd02cb5c11d49d690ae618c14843944','0114241aeea04a6fa024716f624cf6b4','主内容',NULL,'admin','ZKEASOFT','2019-05-11 22:22:58.353','admin','ZKEASOFT','2019-05-11 22:22:58.353',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4eb90bb2dd4d434c97f070e57c74d909','cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','底部',NULL,'admin','超级管理员','2019-05-13 14:51:56.973','admin','超级管理员','2019-05-13 14:51:56.973',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('513bd0c976ec48e095456e81949b2c80','cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','主内容',NULL,'admin','超级管理员','2019-05-11 23:05:00.350','admin','超级管理员','2019-05-11 23:05:00.350',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('527993ac3c394b24a0ec12e5d478b4a9','cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:54:57.207','admin','ZKEASOFT','2019-05-11 00:54:57.207',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('56143390e48542dab6415b20d39bc012','cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','主内容',NULL,'admin','超级管理员','2019-05-13 14:55:07.243','admin','超级管理员','2019-05-13 14:55:07.243',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('574a03a05838475193e656ad357c3f87','cdd02cb5c11d49d690ae618c14843944','93f26ddf4756437c800f194f44af0c91','顶部',NULL,'admin','超级管理员','2019-05-11 23:29:26.453','admin','超级管理员','2019-05-11 23:29:26.453',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5b21df68814b4cc2abd9aab54fa7e02c','cdd02cb5c11d49d690ae618c14843944','fdcc1e5c544a424d94475d71d05e6b26','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:13:42.247','admin','ZKEASOFT','2019-05-11 00:13:42.247',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5c90a47758ba414d88c913885dc8b866','cdd02cb5c11d49d690ae618c14843944','9e525853139d430ab3b24715404fb9a8','主内容',NULL,'admin','ZKEASOFT','2019-05-11 10:08:19.550','admin','ZKEASOFT','2019-05-11 10:08:19.550',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5cc1f87dda814d04be1a4f4cde8b73ff','cdd02cb5c11d49d690ae618c14843944',NULL,'底部',NULL,'admin','ZKEASOFT','2019-05-10 16:36:15.297','admin','ZKEASOFT','2019-05-10 23:27:51.677',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5ce42427e67e4104a6070064c8b0a205','cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','底部',NULL,'admin','ZKEASOFT','2019-05-11 22:16:02.930','admin','ZKEASOFT','2019-05-11 22:16:02.930',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6024d49e1d1049a8bc0244d4045d2582','cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','主内容',NULL,'admin','ZKEASOFT','2019-05-11 09:08:03.133','admin','ZKEASOFT','2019-05-11 10:07:31.813',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6063b7ebd00842fe977717adff252db7','cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','底部',NULL,'admin','ZKEASOFT','2019-05-11 13:58:35.680','admin','ZKEASOFT','2019-05-11 13:58:35.680',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6152fa70fbe041d5ab50f052e31306b7','cdd02cb5c11d49d690ae618c14843944','1e10652bb1c844b6ab2cc294acc5d957','顶部',NULL,'admin','ZKEASOFT','2019-05-11 09:27:12.653','admin','ZKEASOFT','2019-05-11 09:27:12.653',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('615709660fff4b1f9d16732cfc81f338','cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','底部',NULL,'admin','超级管理员','2019-05-13 14:54:40.243','admin','超级管理员','2019-05-13 14:54:40.243',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('64833ebea72e41b592e661d51dcccb13','cdd02cb5c11d49d690ae618c14843944','b0b9a9965dc14f349ecc5f08160e1b73','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:01:10.230','admin','ZKEASOFT','2019-05-11 00:01:10.230',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('669eb8148df74ea7898a8ae57de4b7cd','cdd02cb5c11d49d690ae618c14843944','fdcc1e5c544a424d94475d71d05e6b26','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:13:42.250','admin','ZKEASOFT','2019-05-11 00:13:42.250',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('689a4a8f55364a2b80f0dec0eb105494','cdd02cb5c11d49d690ae618c14843944','66043581526341f5a586f7a0e66ca083','顶部',NULL,'admin','ZKEASOFT','2019-05-11 09:23:55.877','admin','ZKEASOFT','2019-05-11 09:23:55.877',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('68d83f78e90d4a14a0488494efa1f954','cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','主内容',NULL,'admin','ZKEASOFT','2019-05-11 17:27:06.077','admin','ZKEASOFT','2019-05-11 17:27:06.077',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6a419df4b0004d588e6fa2492dbaa3bb','cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','顶部',NULL,'admin','ZKEASOFT','2019-05-11 12:59:41.177','admin','ZKEASOFT','2019-05-11 13:06:21.067',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6a8578c1a6d34240bdd7a99b32e0d0cb','cdd02cb5c11d49d690ae618c14843944','da2d81963b9d4873898d78e8bc4dde4f','顶部',NULL,'admin','超级管理员','2019-05-11 22:50:04.150','admin','超级管理员','2019-05-11 22:50:04.150',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6b9e60d7c0d5474cb85b882397ae5666','cdd02cb5c11d49d690ae618c14843944','73766d4f1f7841b1920a4aacec393b1d','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:12:47.243','admin','ZKEASOFT','2019-05-11 00:12:47.243',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6c437fed6d6f4a4b95d6034533829924','cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','顶部',NULL,'admin','ZKEASOFT','2019-05-11 22:16:02.923','admin','ZKEASOFT','2019-05-11 22:16:02.923',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6d873358f9c44164bb28233cc3308538','cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','底部',NULL,'admin','超级管理员','2019-05-13 14:52:53.837','admin','超级管理员','2019-05-13 14:52:53.837',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6ec3dac8d3be441da8bc76d9c84e2ce6','cdd02cb5c11d49d690ae618c14843944','e9789e56e65b4451b9b9e442d8781966','主内容',NULL,'admin','ZKEASOFT','2019-05-11 16:59:35.687','admin','ZKEASOFT','2019-05-11 16:59:35.687',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('71b3f549ca4544659f88477bd7e217e9','cdd02cb5c11d49d690ae618c14843944','66043581526341f5a586f7a0e66ca083','主内容',NULL,'admin','ZKEASOFT','2019-05-11 09:23:55.877','admin','ZKEASOFT','2019-05-11 09:23:55.877',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('74bbd2a9df2648d7ad5d9559775fc685','cdd02cb5c11d49d690ae618c14843944','4f234a8381704de1927b75b46f43471e','主内容',NULL,'admin','ZKEASOFT','2019-05-11 09:14:00.120','admin','ZKEASOFT','2019-05-11 09:14:00.120',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('74f21f969b5749e5a063cd521f7a0087','cdd02cb5c11d49d690ae618c14843944',NULL,'主内容',NULL,'admin','ZKEASOFT','2019-05-10 16:36:15.287','admin','ZKEASOFT','2019-05-10 23:27:51.680',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('771d546ec22b4ba2bd33c2813f1f6a6d','cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','顶部',NULL,'admin','ZKEASOFT','2019-05-11 09:08:03.120','admin','ZKEASOFT','2019-05-11 10:07:31.817',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('77e54ac9b114479c95c120cb7eec10c0','cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','底部',NULL,'admin','超级管理员','2019-05-13 14:50:34.623','admin','超级管理员','2019-05-13 14:50:34.623',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('788757c1bb9b457c9f938713d2515314','cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','底部',NULL,'admin','ZKEASOFT','2019-05-11 17:27:06.083','admin','ZKEASOFT','2019-05-11 17:27:06.083',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('78ba657df0d844aebafdee0ee1cccd28','cdd02cb5c11d49d690ae618c14843944','1e10652bb1c844b6ab2cc294acc5d957','主内容',NULL,'admin','ZKEASOFT','2019-05-11 09:27:12.660','admin','ZKEASOFT','2019-05-11 09:27:12.660',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('79692af94ba54dfe9d58d070ba579003','cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','底部',NULL,'admin','超级管理员','2019-05-13 14:49:57.530','admin','超级管理员','2019-05-13 14:49:57.530',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7ae8fcd14355424eab73eed48339503d','cdd02cb5c11d49d690ae618c14843944','73766d4f1f7841b1920a4aacec393b1d','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:12:47.240','admin','ZKEASOFT','2019-05-11 00:12:47.240',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7cc13ed09abf43798025457306cec441','cdd02cb5c11d49d690ae618c14843944','4d529fa56f304178bb7c1ba90d2cfe0b','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:12:12.463','admin','ZKEASOFT','2019-05-11 00:12:12.463',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7d171a6beab94d3db8d4fba46a158817','cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','顶部',NULL,'admin','ZKEASOFT','2019-05-11 22:13:35.177','admin','ZKEASOFT','2019-05-11 22:13:35.177',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7f08a86303584d0aad87dfb6c56f0767','cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','新闻分类',NULL,'admin','超级管理员','2019-05-13 14:51:23.383','admin','超级管理员','2019-05-13 14:51:23.383',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7fc3046beef6495085fd1c5c5a2b8e29','cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','顶部',NULL,'admin','ZKEASOFT','2019-05-11 17:35:44.317','admin','ZKEASOFT','2019-05-11 17:35:44.317',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('84689d91e1b94a9ebecf97ebc1fa0e5d','cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','底部',NULL,'admin','超级管理员','2019-05-13 14:55:07.237','admin','超级管理员','2019-05-13 14:55:07.237',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8489ffca32f34573bf0c6af4090ec180','cdd02cb5c11d49d690ae618c14843944','114afab91a904dc4a20de6f3ebeaa8e4','顶部',NULL,'admin','ZKEASOFT','2019-05-11 13:01:39.413','admin','ZKEASOFT','2019-05-11 13:01:39.413',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('84c2b3840657402b96672c75022488ff','cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:54:57.197','admin','ZKEASOFT','2019-05-11 00:54:57.197',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('85e029db77ba40c1b885e7acadd6f66e','cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','主内容',NULL,'admin','ZKEASOFT','2019-05-11 22:16:02.943','admin','ZKEASOFT','2019-05-11 22:16:02.943',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8719ce3c9ed64ced81f930f3d542554c','cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','顶部',NULL,'admin','超级管理员','2019-05-11 23:34:26.913','admin','超级管理员','2019-05-11 23:34:26.913',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('874662f2d93441baa172d944663199d4','cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','顶部',NULL,'admin','ZKEASOFT','2019-05-11 17:27:06.073','admin','ZKEASOFT','2019-05-11 17:27:06.073',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('87f0a70425954563945dafcb8cc649ff','cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','底部',NULL,'admin','ZKEASOFT','2019-05-11 17:34:34.247','admin','ZKEASOFT','2019-05-11 17:34:34.247',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('890f43f67cb544e481ba2e7d06945e03','cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','顶部',NULL,'admin','超级管理员','2019-05-13 14:49:57.537','admin','超级管理员','2019-05-13 14:49:57.537',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('89644baee9d94fe8ad773f7ab6594357','cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','主内容',NULL,'admin','ZKEASOFT','2019-05-11 22:13:35.237','admin','ZKEASOFT','2019-05-11 22:13:35.237',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8b9dcd3fd62d4948914b5321ace879df','cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','主内容',NULL,'admin','超级管理员','2019-05-13 14:48:45.457','admin','超级管理员','2019-05-13 14:48:45.457',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8be5f7b063794438abbce41e423ceef7','cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','主内容',NULL,'admin','超级管理员','2019-05-13 14:53:38.937','admin','超级管理员','2019-05-13 14:53:38.937',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8d3a07e38c414dfaa00f01d9cfa33aeb','cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','底部',NULL,'admin','ZKEASOFT','2019-05-11 13:09:52.530','admin','ZKEASOFT','2019-05-11 13:09:52.530',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8ebc0c2faaad4a619a8a4cb2891bb49f','cdd02cb5c11d49d690ae618c14843944','73766d4f1f7841b1920a4aacec393b1d','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:12:47.237','admin','ZKEASOFT','2019-05-11 00:12:47.237',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8eef407e295e4b92aa5ea4a955d9397a','cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','顶部',NULL,'admin','超级管理员','2019-05-13 15:28:45.010','admin','超级管理员','2019-05-13 15:28:45.010',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('91b2f478b708491f9ad210bf8bdfbc7b','cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','底部',NULL,'admin','超级管理员','2019-05-13 15:29:28.667','admin','超级管理员','2019-05-13 15:29:28.667',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('91f434e3435e4b6895c2cc6f418abc83','cdd02cb5c11d49d690ae618c14843944','fe62e8b9989e45f09b370e2ce0e7ea0f','新闻分类',NULL,'admin','ZKEASOFT','2019-05-11 11:25:47.417','admin','ZKEASOFT','2019-05-11 11:25:47.417',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('92a800f83b3947eb9da616a594524e60','cdd02cb5c11d49d690ae618c14843944','64b0f15319f74429be06bd6ce32a50f4','底部',NULL,'admin','ZKEASOFT','2019-05-11 22:24:23.260','admin','ZKEASOFT','2019-05-11 22:24:23.260',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('940a48aa376044659d1f772d4836a6f5','cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','底部',NULL,'admin','超级管理员','2019-05-11 23:05:00.347','admin','超级管理员','2019-05-11 23:05:00.347',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('962bc90b90e54fa6bf250b40abcd36fb','cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','主内容',NULL,'admin','超级管理员','2019-05-13 14:51:23.380','admin','超级管理员','2019-05-13 14:51:23.380',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('976ed87f5e2b4f22b24d1141fb44e8e5','cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','主内容',NULL,'admin','ZKEASOFT','2019-05-11 13:09:52.530','admin','ZKEASOFT','2019-05-11 13:09:52.530',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9975b39eb96842cd857e35da5a605b92','cdd02cb5c11d49d690ae618c14843944','fe62e8b9989e45f09b370e2ce0e7ea0f','顶部',NULL,'admin','ZKEASOFT','2019-05-11 11:25:47.417','admin','ZKEASOFT','2019-05-11 11:25:47.417',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9e719716180a463f976a2379f296b84e','cdd02cb5c11d49d690ae618c14843944','1fb98da5e5ff49ea9b4aa079d811e589','底部',NULL,'admin','超级管理员','2019-05-13 14:40:09.720','admin','超级管理员','2019-05-13 14:40:09.720',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9ec26beb8f124b7ca41dd6fb61971db6','cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','主内容',NULL,'admin','ZKEASOFT','2019-05-11 17:35:44.313','admin','ZKEASOFT','2019-05-11 17:35:44.313',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9f6a4f0f2757433083486f737503dfe6','cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','底部',NULL,'admin','超级管理员','2019-05-11 23:33:31.210','admin','超级管理员','2019-05-11 23:33:31.210',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a0169720dd904e8cac978390877c325a','cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','主内容',NULL,'admin','超级管理员','2019-05-13 14:51:56.977','admin','超级管理员','2019-05-13 14:51:56.977',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a14c8c843f4a43f98df0ea8d24e2c941','cdd02cb5c11d49d690ae618c14843944','51f565caa11b42bca8411cb82680519e','底部',NULL,'admin','ZKEASOFT','2019-05-11 13:00:11.757','admin','ZKEASOFT','2019-05-11 13:00:11.757',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a204df1ad8f149b88fe5bc3a03797f5d','cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','新闻分类',NULL,'admin','超级管理员','2019-05-12 00:24:44.400','admin','超级管理员','2019-05-12 00:24:44.400',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a224fc1446b149a8b83520ba030c9dd5','cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','底部',NULL,'admin','ZKEASOFT','2019-05-10 23:47:57.570','admin','ZKEASOFT','2019-05-11 09:17:54.030',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a2499f0609bd4b0a9eb11ea0ba7147df','cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','底部',NULL,'admin','ZKEASOFT','2019-05-11 12:59:41.183','admin','ZKEASOFT','2019-05-11 13:06:21.073',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a6158a95f4534cf3813a466812957bf0','cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','顶部',NULL,'admin','超级管理员','2019-05-11 23:05:00.347','admin','超级管理员','2019-05-11 23:05:00.347',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a66f0a2adc8c42618c6e1781ef2d9de2','cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','主内容',NULL,'admin','超级管理员','2019-05-11 23:34:26.910','admin','超级管理员','2019-05-11 23:34:26.910',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a7baaf630f3a4a8f816855b1ded26dd3','cdd02cb5c11d49d690ae618c14843944','803320fc46594de6b622ac7c8a10d99f','顶部',NULL,'admin','ZKEASOFT','2019-05-11 13:01:35.680','admin','ZKEASOFT','2019-05-11 13:01:35.680',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a8e1e6510d15416ab63dfb5b62acd78b','cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','主内容',NULL,'admin','超级管理员','2019-05-11 23:31:43.083','admin','超级管理员','2019-05-11 23:31:43.083',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('aa240868add3466ea596db92bf8c7085','cdd02cb5c11d49d690ae618c14843944','803320fc46594de6b622ac7c8a10d99f','主内容',NULL,'admin','ZKEASOFT','2019-05-11 13:01:35.683','admin','ZKEASOFT','2019-05-11 13:01:35.683',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('aa28598b03274d6c93e2ccfe9394a59b','cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','主内容',NULL,'admin','ZKEASOFT','2019-05-11 12:59:41.187','admin','ZKEASOFT','2019-05-11 13:06:21.083',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('aa5f777961924249b71a1704745f255a','cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','主内容',NULL,'admin','超级管理员','2019-05-13 14:50:34.617','admin','超级管理员','2019-05-13 14:50:34.617',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('aa74520105f046e29443ba54436b6d03','cdd02cb5c11d49d690ae618c14843944','64b0f15319f74429be06bd6ce32a50f4','顶部',NULL,'admin','ZKEASOFT','2019-05-11 22:24:23.263','admin','ZKEASOFT','2019-05-11 22:24:23.263',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('add40bf9d41a43f2b25abeae3db6a153','cdd02cb5c11d49d690ae618c14843944','1fb98da5e5ff49ea9b4aa079d811e589','顶部',NULL,'admin','超级管理员','2019-05-13 14:40:09.700','admin','超级管理员','2019-05-13 14:40:09.700',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('add8bb854ca1464793a7d45cdf4c10fa','cdd02cb5c11d49d690ae618c14843944','c53682ce584c4cc89eadf48b9d924c08','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:42:46.383','admin','ZKEASOFT','2019-05-11 00:42:46.383',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('aebea9714eae47e69ecb2f4efdf0689c','cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','新闻分类',NULL,'admin','ZKEASOFT','2019-05-11 09:19:14.267','admin','ZKEASOFT','2019-05-11 10:07:31.823',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('af99e3e34147430d936469c9c324d2e4','cdd02cb5c11d49d690ae618c14843944','fe62e8b9989e45f09b370e2ce0e7ea0f','底部',NULL,'admin','ZKEASOFT','2019-05-11 11:25:47.413','admin','ZKEASOFT','2019-05-11 11:25:47.413',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b030fbc9ed194f2989b3ab2b11271a46','cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','底部',NULL,'admin','超级管理员','2019-05-11 23:34:26.913','admin','超级管理员','2019-05-11 23:34:26.913',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b22380658abc4cbeb0aefda396d04117','cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','新闻列表',NULL,'admin','超级管理员','2019-05-12 00:24:44.403','admin','超级管理员','2019-05-12 00:24:44.403',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b4710999d52e468992a426183bbdaca1','cdd02cb5c11d49d690ae618c14843944','9e525853139d430ab3b24715404fb9a8','新闻分类',NULL,'admin','ZKEASOFT','2019-05-11 10:08:19.553','admin','ZKEASOFT','2019-05-11 10:08:19.553',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b4f8d1ed46c8416b97c269974e663db6','cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','新闻列表',NULL,'admin','超级管理员','2019-05-13 14:51:23.390','admin','超级管理员','2019-05-13 14:51:23.390',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b5a5d112ef5b4de0873b97ea89421c64','cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','顶部',NULL,'admin','超级管理员','2019-05-11 23:31:43.087','admin','超级管理员','2019-05-11 23:31:43.087',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b65d7b10557e435c90be3d3c8f5115fe','cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','顶部',NULL,'admin','超级管理员','2019-05-13 14:53:38.940','admin','超级管理员','2019-05-13 14:53:38.940',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b71920a7714b429bb6eae57e6b34ef36','cdd02cb5c11d49d690ae618c14843944','724b9230319b498288fd780e25b032e7','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:14:40.633','admin','ZKEASOFT','2019-05-11 00:14:40.633',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b731eb74610b42c1bf23237c121eb1a5','cdd02cb5c11d49d690ae618c14843944','cdd97493a79d40d7881dafa7191dcfd7','顶部',NULL,'admin','ZKEASOFT','2019-05-11 14:06:10.287','admin','ZKEASOFT','2019-05-11 14:06:10.287',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b8f86c95b2fb4fbba8cfabbbf31e27c2','cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','主内容',NULL,'admin','ZKEASOFT','2019-05-11 17:34:34.257','admin','ZKEASOFT','2019-05-11 17:34:34.257',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('bc9fdfb1ec4e4f63abbcaaad205924d4','cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','主内容',NULL,'admin','超级管理员','2019-05-13 15:29:28.667','admin','超级管理员','2019-05-13 15:29:28.667',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('be298f7abfea4e7fb7ab39e64b98dab6','cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','新闻列表',NULL,'admin','ZKEASOFT','2019-05-11 09:19:14.263','admin','ZKEASOFT','2019-05-11 10:07:31.827',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('bf04b76f09094723ae2946ca7edf59c0','cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','顶部',NULL,'admin','超级管理员','2019-05-11 23:33:31.200','admin','超级管理员','2019-05-11 23:33:31.200',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c04495dde2764612adceddcf1c7d57d2','cdd02cb5c11d49d690ae618c14843944','6927b626d6d5419b955538a264a21368','新闻列表',NULL,'admin','ZKEASOFT','2019-05-11 12:41:13.523','admin','ZKEASOFT','2019-05-11 12:41:13.523',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c364e89639e44f8798afd734938dcca0','cdd02cb5c11d49d690ae618c14843944','4f234a8381704de1927b75b46f43471e','底部',NULL,'admin','ZKEASOFT','2019-05-11 09:14:00.117','admin','ZKEASOFT','2019-05-11 09:14:00.117',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c42fbe6f113844649374a74a1af1da41','cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','顶部',NULL,'admin','超级管理员','2019-05-13 15:29:28.673','admin','超级管理员','2019-05-13 15:29:28.673',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c73077b02317404bb2b7752574a9ec3a','cdd02cb5c11d49d690ae618c14843944','724b9230319b498288fd780e25b032e7','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:14:40.633','admin','ZKEASOFT','2019-05-11 00:14:40.633',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c7483bb5974c4af1baf8910b897ddc7c','cdd02cb5c11d49d690ae618c14843944','93f26ddf4756437c800f194f44af0c91','主内容',NULL,'admin','超级管理员','2019-05-11 23:29:26.443','admin','超级管理员','2019-05-11 23:29:26.443',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c89db353c841456098bc8fe30cd005dd','cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','顶部',NULL,'admin','ZKEASOFT','2019-05-11 17:34:34.230','admin','ZKEASOFT','2019-05-11 17:34:34.230',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('caa6194cb5824cc0b9d1c63623423f88','cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','主内容',NULL,'admin','超级管理员','2019-05-12 00:40:43.170','admin','超级管理员','2019-05-12 00:40:43.170',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('cb4e01c3f231464c842923c4a48f51ce','cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','主内容',NULL,'admin','超级管理员','2019-05-13 15:28:45.053','admin','超级管理员','2019-05-13 15:28:45.053',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('cede5bd617864a9e8d03fc7634b9c156','cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','顶部',NULL,'admin','超级管理员','2019-05-13 14:52:53.830','admin','超级管理员','2019-05-13 14:52:53.830',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d19397a7083f473e9c9d1239602715cf','cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','顶部',NULL,'admin','超级管理员','2019-05-12 00:24:44.397','admin','超级管理员','2019-05-12 00:24:44.397',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d4e3110afe1a446a873c7c1ec60ffbc4','cdd02cb5c11d49d690ae618c14843944','e9789e56e65b4451b9b9e442d8781966','底部',NULL,'admin','ZKEASOFT','2019-05-11 16:59:35.690','admin','ZKEASOFT','2019-05-11 16:59:35.690',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d4e8ff34b8b34f2994a21c8587013e05','cdd02cb5c11d49d690ae618c14843944','724b9230319b498288fd780e25b032e7','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:14:40.637','admin','ZKEASOFT','2019-05-11 00:14:40.637',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d6bc924df2f14306b6c60fc92c8eb00f','cdd02cb5c11d49d690ae618c14843944','41093638f1204ff9ace155163e61d182','顶部',NULL,'admin','ZKEASOFT','2019-05-10 23:51:27.117','admin','ZKEASOFT','2019-05-10 23:51:27.117',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d6ec11ee29ea4dc4a74376d20a8deff4','cdd02cb5c11d49d690ae618c14843944','6927b626d6d5419b955538a264a21368','顶部',NULL,'admin','ZKEASOFT','2019-05-11 12:41:13.520','admin','ZKEASOFT','2019-05-11 12:41:13.520',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d77214063f1841fdab256a294bd3268c','cdd02cb5c11d49d690ae618c14843944','da2d81963b9d4873898d78e8bc4dde4f','主内容',NULL,'admin','超级管理员','2019-05-11 22:50:04.153','admin','超级管理员','2019-05-11 22:50:04.153',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('da2cfa57ece64d0ea57128bd1a2724e0','cdd02cb5c11d49d690ae618c14843944','735188bc7e184cca8f66378dbc237692','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:01:50.767','admin','ZKEASOFT','2019-05-11 00:01:50.767',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('da6329849aa846e7a9d11d1460dbbdd8','cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','顶部',NULL,'admin','超级管理员','2019-05-13 14:51:56.970','admin','超级管理员','2019-05-13 14:51:56.970',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('df10bcb066e64609b28c63a209371e59','cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','底部',NULL,'admin','超级管理员','2019-05-13 14:51:23.377','admin','超级管理员','2019-05-13 14:51:23.377',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('df7b9a5875864afa98d3afec3d60f530','cdd02cb5c11d49d690ae618c14843944','6927b626d6d5419b955538a264a21368','底部',NULL,'admin','ZKEASOFT','2019-05-11 12:41:13.513','admin','ZKEASOFT','2019-05-11 12:41:13.513',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e128b7a2b9ce4dcd8e17588c169c42a8','cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','顶部',NULL,'admin','超级管理员','2019-05-13 14:50:34.630','admin','超级管理员','2019-05-13 14:50:34.630',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e1672f0a5a864dfe9275115e5be41990','cdd02cb5c11d49d690ae618c14843944','e9789e56e65b4451b9b9e442d8781966','顶部',NULL,'admin','ZKEASOFT','2019-05-11 16:59:35.660','admin','ZKEASOFT','2019-05-11 16:59:35.660',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e37acf0da9eb4ff899d6b7b7d9ffb41c','cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','主内容',NULL,'admin','ZKEASOFT','2019-05-10 23:47:57.577','admin','ZKEASOFT','2019-05-11 09:17:54.037',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e3b3e43fed094dfd8aa019a70f7b61bd','cdd02cb5c11d49d690ae618c14843944','114afab91a904dc4a20de6f3ebeaa8e4','底部',NULL,'admin','ZKEASOFT','2019-05-11 13:01:39.410','admin','ZKEASOFT','2019-05-11 13:01:39.410',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e686f209c5d240f99e936971b009b868','cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','顶部',NULL,'admin','超级管理员','2019-05-13 14:55:07.240','admin','超级管理员','2019-05-13 14:55:07.240',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e8bfd78485ab46378d1390e165c6faa9','cdd02cb5c11d49d690ae618c14843944','b0b9a9965dc14f349ecc5f08160e1b73','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:01:10.233','admin','ZKEASOFT','2019-05-11 00:01:10.233',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('eab8489464424f7ba876bd4f82238b9d','cdd02cb5c11d49d690ae618c14843944','4bf253d69a224c4fb768c05519af871d','顶部',NULL,'admin','ZKEASOFT','2019-05-11 00:55:47.980','admin','ZKEASOFT','2019-05-11 00:55:47.980',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('eaf1eae804914014b80ca22906d2e131','cdd02cb5c11d49d690ae618c14843944','b0b9a9965dc14f349ecc5f08160e1b73','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:01:10.240','admin','ZKEASOFT','2019-05-11 00:01:10.240',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('edc65ed09e29412f9b398e88aa91b7a0','cdd02cb5c11d49d690ae618c14843944','803320fc46594de6b622ac7c8a10d99f','底部',NULL,'admin','ZKEASOFT','2019-05-11 13:01:35.683','admin','ZKEASOFT','2019-05-11 13:01:35.683',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f47d5a54d9f6444888940d85dd2dd99f','cdd02cb5c11d49d690ae618c14843944','4bf253d69a224c4fb768c05519af871d','底部',NULL,'admin','ZKEASOFT','2019-05-11 00:55:47.967','admin','ZKEASOFT','2019-05-11 00:55:47.967',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f4d631720a554ab99154e59cadb78913','cdd02cb5c11d49d690ae618c14843944','0114241aeea04a6fa024716f624cf6b4','顶部',NULL,'admin','ZKEASOFT','2019-05-11 22:22:58.350','admin','ZKEASOFT','2019-05-11 22:22:58.350',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f60523860c31477088051440d123e201','cdd02cb5c11d49d690ae618c14843944','4bf253d69a224c4fb768c05519af871d','主内容',NULL,'admin','ZKEASOFT','2019-05-11 00:55:47.973','admin','ZKEASOFT','2019-05-11 00:55:47.973',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f6b595712e614cb0aa22ff2c019863c4','cdd02cb5c11d49d690ae618c14843944','114afab91a904dc4a20de6f3ebeaa8e4','新闻分类',NULL,'admin','ZKEASOFT','2019-05-11 13:01:39.413','admin','ZKEASOFT','2019-05-11 13:01:39.413',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f7dd45a91f2d4892a3dc65fbdf3b666a','cdd02cb5c11d49d690ae618c14843944','51f565caa11b42bca8411cb82680519e','主内容',NULL,'admin','ZKEASOFT','2019-05-11 13:00:11.757','admin','ZKEASOFT','2019-05-11 13:00:11.757',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f836b9a35571424db742ff62ac49ed86','cdd02cb5c11d49d690ae618c14843944','1e10652bb1c844b6ab2cc294acc5d957','底部',NULL,'admin','ZKEASOFT','2019-05-11 09:27:12.657','admin','ZKEASOFT','2019-05-11 09:27:12.657',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f90f963509cd4e558f05572144dda8e9','cdd02cb5c11d49d690ae618c14843944','41093638f1204ff9ace155163e61d182','主内容',NULL,'admin','ZKEASOFT','2019-05-10 23:51:27.120','admin','ZKEASOFT','2019-05-10 23:51:27.120',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f9356d25795540bcbf30ae1dc00aca7b','cdd02cb5c11d49d690ae618c14843944','114afab91a904dc4a20de6f3ebeaa8e4','主内容',NULL,'admin','ZKEASOFT','2019-05-11 13:01:39.410','admin','ZKEASOFT','2019-05-11 13:01:39.410',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f960ee44d9e04417a7125f20a928d47d','cdd02cb5c11d49d690ae618c14843944','da2d81963b9d4873898d78e8bc4dde4f','底部',NULL,'admin','超级管理员','2019-05-11 22:50:04.127','admin','超级管理员','2019-05-11 22:50:04.127',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('fb78d97e025e4a9bae2a8bdea88e1761','cdd02cb5c11d49d690ae618c14843944','6927b626d6d5419b955538a264a21368','主内容',NULL,'admin','ZKEASOFT','2019-05-11 12:41:13.517','admin','ZKEASOFT','2019-05-11 12:41:13.517',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('fe91c0f0ee3140cf8224a2c740cd6f3f','cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','底部',NULL,'admin','超级管理员','2019-05-12 00:24:44.387','admin','超级管理员','2019-05-12 00:24:44.387',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('05266b5af4da42f0818919345cf555bb','206b9210f5ad422dad9e13a4797df74c',1,'1d3588669e2d4bf2bb731486f21270d1','文章详细',0,'~/news/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-13 14:51:56.967',NULL,NULL,NULL,'/themes/Kefan/css/shownews_cn.css','admin','超级管理员','2019-05-13 14:51:56.967','admin','超级管理员','2019-05-13 14:51:56.967');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('0563f84d9b214f38a1f76d8eba7b62a1',NULL,0,'#','关于我们',0,'~/about','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,2,NULL,1,1,'2019-05-13 15:29:28.653','关于我们','关于我们',NULL,'/themes/Kefan/css/show_cn.css','admin','ZKEASOFT','2019-05-11 00:54:57.000','admin','超级管理员','2019-05-13 15:29:28.653');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('072cefbba72d4149bbe3cb83003d5983','0563f84d9b214f38a1f76d8eba7b62a1',1,'#','关于我们',0,'~/about','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,2,NULL,1,1,'2019-05-13 14:49:57.527','关于我们','关于我们',NULL,'/themes/Kefan/css/show_cn.css','admin','超级管理员','2019-05-13 14:49:57.527','admin','超级管理员','2019-05-13 14:49:57.527');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('0f56cb364d1f4ebb8b86dc6c06526c09','419e6f52894940fd8261c3f7e719933d',1,'0563f84d9b214f38a1f76d8eba7b62a1','关于我们详细',0,'~/about/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-11 23:34:26.907',NULL,NULL,NULL,'/UpLoad/Files/201905/be998119171242ff91d4d1c68bf23fba.css','admin','超级管理员','2019-05-11 23:34:26.910','admin','超级管理员','2019-05-11 23:34:26.910');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1bf6ca8b93db44fca2d536249d67da6f','33b55cabea314877a095529b0bd8c721',1,'2c0a828ed4a646f1a9723eb7139ff5cd','产品详细',0,'~/product/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,'产品详细',1,1,'2019-05-13 14:53:38.930','产品详细','产品详细',NULL,'/themes/Kefan/css/showproduct_cn.css','admin','超级管理员','2019-05-13 14:53:38.930','admin','超级管理员','2019-05-13 14:53:38.930');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1c75f6cae25e449eb5554f26b07b7c24','c102babe4a3043bf8f50d3a71075a4ef',1,'7dc93ed1a4174ab692beb15a06159bad','招商加盟详细',0,'~/join/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-11 23:05:00.337',NULL,NULL,NULL,'/UpLoad/Files/201905/be998119171242ff91d4d1c68bf23fba.css','admin','超级管理员','2019-05-11 23:05:00.340','admin','超级管理员','2019-05-11 23:05:00.340');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1d3588669e2d4bf2bb731486f21270d1',NULL,0,'#','新闻中心',0,'~/news','cdd02cb5c11d49d690ae618c14843944','测试',NULL,3,NULL,1,1,'2019-05-13 14:51:23.363','新闻中心','新闻中心',NULL,'/themes/Kefan/css/news_cn.css','admin','ZKEASOFT','2019-05-11 09:08:03.000','admin','超级管理员','2019-05-13 14:51:23.363');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('206b9210f5ad422dad9e13a4797df74c',NULL,0,'1d3588669e2d4bf2bb731486f21270d1','文章详细',0,'~/news/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-13 14:51:56.957',NULL,NULL,NULL,'/themes/Kefan/css/shownews_cn.css','admin','ZKEASOFT','2019-05-11 12:59:41.000','admin','超级管理员','2019-05-13 14:51:56.960');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('2b44a65b748948528a360cc2ec0f2603','1d3588669e2d4bf2bb731486f21270d1',1,'#','新闻中心',0,'~/news','cdd02cb5c11d49d690ae618c14843944','测试',NULL,3,NULL,1,1,'2019-05-12 00:24:44.383','新闻中心','新闻中心',NULL,'/UpLoad/Files/201905/75c6cb6a58fc496d8e7e5673d50afe38.css','admin','超级管理员','2019-05-12 00:24:44.387','admin','超级管理员','2019-05-12 00:24:44.387');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('2c0a828ed4a646f1a9723eb7139ff5cd',NULL,0,'#','产品中心',0,'~/product','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,4,'产品中心',1,1,'2019-05-13 14:52:53.820','产品中心','产品中心',NULL,'/themes/Kefan/css/product_cn.css','admin','ZKEASOFT','2019-05-11 13:58:35.000','admin','超级管理员','2019-05-13 14:52:53.820');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('31143965b228461d9f09f9afec9c310f',NULL,0,'#','网站首页',0,'~/index','cdd02cb5c11d49d690ae618c14843944','蛋糕加盟',NULL,1,NULL,1,1,'2019-05-13 15:28:44.977',NULL,NULL,NULL,'/themes/Kefan/css/index_cn.css','admin','ZKEASOFT','2019-05-10 16:38:54.000','admin','超级管理员','2019-05-13 15:28:44.977');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('33b55cabea314877a095529b0bd8c721',NULL,0,'2c0a828ed4a646f1a9723eb7139ff5cd','产品详细',0,'~/product/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,'产品详细',1,1,'2019-05-13 14:53:38.920','产品详细','产品详细',NULL,'/themes/Kefan/css/showproduct_cn.css','admin','ZKEASOFT','2019-05-11 17:34:34.000','admin','超级管理员','2019-05-13 14:53:38.920');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('375899eb70f2409cac6fdbcd78eab3a2','419e6f52894940fd8261c3f7e719933d',1,'0563f84d9b214f38a1f76d8eba7b62a1','关于我们详细',0,'~/about/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-13 14:50:34.610',NULL,NULL,NULL,'/themes/Kefan/css/show_cn.css','admin','超级管理员','2019-05-13 14:50:34.613','admin','超级管理员','2019-05-13 14:50:34.613');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('3ce0f8eeea02460da9b5a308dcdb8bad','33b55cabea314877a095529b0bd8c721',1,'2c0a828ed4a646f1a9723eb7139ff5cd','产品详细',0,'~/product/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,'产品详细',1,1,'2019-05-11 17:35:44.307','产品详细','产品详细',NULL,'/UpLoad/Files/201905/29bfbc98ee4f442ca7644cbb3c360514.css','admin','ZKEASOFT','2019-05-11 17:35:44.307','admin','ZKEASOFT','2019-05-11 17:35:44.307');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('419e6f52894940fd8261c3f7e719933d',NULL,0,'0563f84d9b214f38a1f76d8eba7b62a1','关于我们详细',0,'~/about/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-13 14:50:34.600',NULL,NULL,NULL,'/themes/Kefan/css/show_cn.css','admin','超级管理员','2019-05-11 23:33:31.000','admin','超级管理员','2019-05-13 14:50:34.600');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('57bb355c28694cf9912664f3cb1468ef','2c0a828ed4a646f1a9723eb7139ff5cd',1,'#','产品中心',0,'~/product','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,4,'产品中心',1,1,'2019-05-13 14:52:53.827','产品中心','产品中心',NULL,'/themes/Kefan/css/product_cn.css','admin','超级管理员','2019-05-13 14:52:53.827','admin','超级管理员','2019-05-13 14:52:53.827');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6006398d08e04b82a9f9666407859684','0563f84d9b214f38a1f76d8eba7b62a1',1,'#','关于我们',0,'~/about','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,2,NULL,1,1,'2019-05-13 15:29:28.660','关于我们','关于我们',NULL,'/themes/Kefan/css/show_cn.css','admin','超级管理员','2019-05-13 15:29:28.660','admin','超级管理员','2019-05-13 15:29:28.660');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('67e50d8020a04c798a09096be57890b7','2c0a828ed4a646f1a9723eb7139ff5cd',1,'#','产品中心',0,'~/product','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,4,'产品中心',1,1,'2019-05-11 17:27:06.067','产品中心','产品中心',NULL,'/UpLoad/Files/201905/c2f7e3d99e1048adbaf43456ec40de52.css','admin','ZKEASOFT','2019-05-11 17:27:06.070','admin','ZKEASOFT','2019-05-11 17:27:06.070');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('69a963d751274e73a4bb879efdc18b19','7dc93ed1a4174ab692beb15a06159bad',1,'#','招商加盟',0,'~/join','cdd02cb5c11d49d690ae618c14843944','招商加盟',NULL,5,'招商加盟',1,1,'2019-05-13 14:54:40.237','招商加盟','招商加盟',NULL,'/themes/Kefan/css/show_cn.css','admin','超级管理员','2019-05-13 14:54:40.237','admin','超级管理员','2019-05-13 14:54:40.237');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6b0de27b1a5c4b42b2365ac9e2587bb3','c102babe4a3043bf8f50d3a71075a4ef',1,'7dc93ed1a4174ab692beb15a06159bad','招商加盟详细',0,'~/join/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-13 14:55:07.227',NULL,NULL,NULL,'/themes/Kefan/css/show_cn.css','admin','超级管理员','2019-05-13 14:55:07.233','admin','超级管理员','2019-05-13 14:55:07.233');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('77c5a847fd794baa95461ebd4a5e3853','7dc93ed1a4174ab692beb15a06159bad',1,'#','招商加盟',0,'~/join','cdd02cb5c11d49d690ae618c14843944','招商加盟',NULL,5,'招商加盟',1,1,'2019-05-12 00:40:43.087','招商加盟','招商加盟',NULL,'/UpLoad/Files/201905/be998119171242ff91d4d1c68bf23fba.css','admin','超级管理员','2019-05-12 00:40:43.097','admin','超级管理员','2019-05-12 00:40:43.097');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('7dc93ed1a4174ab692beb15a06159bad',NULL,0,'#','招商加盟',0,'~/join','cdd02cb5c11d49d690ae618c14843944','招商加盟',NULL,5,'招商加盟',1,1,'2019-05-13 14:54:40.233','招商加盟','招商加盟',NULL,'/themes/Kefan/css/show_cn.css','admin','ZKEASOFT','2019-05-11 22:13:35.000','admin','超级管理员','2019-05-13 14:54:40.233');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('afd10d0b64d44ef9aa677a019e696e27','0563f84d9b214f38a1f76d8eba7b62a1',1,'#','关于我们',0,'~/about','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,2,NULL,1,1,'2019-05-11 23:31:43.077','关于我们','关于我们',NULL,'/UpLoad/Files/201905/be998119171242ff91d4d1c68bf23fba.css','admin','超级管理员','2019-05-11 23:31:43.077','admin','超级管理员','2019-05-11 23:31:43.077');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('b6683315018f4098beb240b9129ca11f','1d3588669e2d4bf2bb731486f21270d1',1,'#','新闻中心',0,'~/news','cdd02cb5c11d49d690ae618c14843944','测试',NULL,3,NULL,1,1,'2019-05-13 14:51:23.370','新闻中心','新闻中心',NULL,'/themes/Kefan/css/news_cn.css','admin','超级管理员','2019-05-13 14:51:23.373','admin','超级管理员','2019-05-13 14:51:23.373');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('bc1391f9f06f4ec7a29bf62d3d633894','206b9210f5ad422dad9e13a4797df74c',1,'1d3588669e2d4bf2bb731486f21270d1','文章详细',0,'~/news/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-11 13:09:52.527',NULL,NULL,NULL,'/UpLoad/Files/201905/70f00ac4d16f415c8b95eff7e192e0a4.css','admin','ZKEASOFT','2019-05-11 13:09:52.527','admin','ZKEASOFT','2019-05-11 13:09:52.527');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('c102babe4a3043bf8f50d3a71075a4ef',NULL,0,'7dc93ed1a4174ab692beb15a06159bad','招商加盟详细',0,'~/join/detail','cdd02cb5c11d49d690ae618c14843944',NULL,NULL,1,NULL,1,1,'2019-05-13 14:55:07.220',NULL,NULL,NULL,'/themes/Kefan/css/show_cn.css','admin','ZKEASOFT','2019-05-11 22:16:02.000','admin','超级管理员','2019-05-13 14:55:07.220');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d23b2e22068942a79ef9b437e0b70940','31143965b228461d9f09f9afec9c310f',1,'#','网站首页',0,'~/index','cdd02cb5c11d49d690ae618c14843944','蛋糕加盟',NULL,1,NULL,1,1,'2019-05-13 15:28:44.990',NULL,NULL,NULL,'/themes/Kefan/css/index_cn.css','admin','超级管理员','2019-05-13 15:28:44.993','admin','超级管理员','2019-05-13 15:28:44.993');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ed5ec60dcdc840569faf58db8c2a71ee','31143965b228461d9f09f9afec9c310f',1,'#','网站首页',0,'~/index','cdd02cb5c11d49d690ae618c14843944','蛋糕加盟',NULL,1,NULL,1,1,'2019-05-13 14:48:45.443',NULL,NULL,NULL,'/themes/Kefan/css/index_cn.css','admin','超级管理员','2019-05-13 14:48:45.443','admin','超级管理员','2019-05-13 14:48:45.443');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (53,'cdd02cb5c11d49d690ae618c14843944',NULL,'<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-10 23:27:51.877','admin','ZKEASOFT','2019-05-10 23:27:51.877');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (54,'cdd02cb5c11d49d690ae618c14843944',NULL,'<zone>','admin','ZKEASOFT','2019-05-10 23:27:51.907','admin','ZKEASOFT','2019-05-10 23:27:51.907');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (55,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-0','admin','ZKEASOFT','2019-05-10 23:27:51.910','admin','ZKEASOFT','2019-05-10 23:27:51.910');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (56,'cdd02cb5c11d49d690ae618c14843944',NULL,'</zone>','admin','ZKEASOFT','2019-05-10 23:27:51.913','admin','ZKEASOFT','2019-05-10 23:27:51.913');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (57,'cdd02cb5c11d49d690ae618c14843944',NULL,'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-10 23:27:51.917','admin','ZKEASOFT','2019-05-10 23:27:51.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (58,'cdd02cb5c11d49d690ae618c14843944',NULL,'<zone>','admin','ZKEASOFT','2019-05-10 23:27:51.917','admin','ZKEASOFT','2019-05-10 23:27:51.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (59,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-1','admin','ZKEASOFT','2019-05-10 23:27:51.923','admin','ZKEASOFT','2019-05-10 23:27:51.923');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (60,'cdd02cb5c11d49d690ae618c14843944',NULL,'</zone>','admin','ZKEASOFT','2019-05-10 23:27:51.927','admin','ZKEASOFT','2019-05-10 23:27:51.927');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (61,'cdd02cb5c11d49d690ae618c14843944',NULL,'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-10 23:27:51.937','admin','ZKEASOFT','2019-05-10 23:27:51.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (62,'cdd02cb5c11d49d690ae618c14843944',NULL,'<zone>','admin','ZKEASOFT','2019-05-10 23:27:51.940','admin','ZKEASOFT','2019-05-10 23:27:51.940');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (63,'cdd02cb5c11d49d690ae618c14843944',NULL,'ZONE-2','admin','ZKEASOFT','2019-05-10 23:27:51.947','admin','ZKEASOFT','2019-05-10 23:27:51.947');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (64,'cdd02cb5c11d49d690ae618c14843944',NULL,'</zone>','admin','ZKEASOFT','2019-05-10 23:27:51.950','admin','ZKEASOFT','2019-05-10 23:27:51.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (65,'cdd02cb5c11d49d690ae618c14843944',NULL,'</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-10 23:27:51.950','admin','ZKEASOFT','2019-05-10 23:27:51.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (196,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 00:54:57.213','admin','ZKEASOFT','2019-05-11 00:54:57.213');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (197,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','<zone>','admin','ZKEASOFT','2019-05-11 00:54:57.217','admin','ZKEASOFT','2019-05-11 00:54:57.217');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (198,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','ZONE-0','admin','ZKEASOFT','2019-05-11 00:54:57.217','admin','ZKEASOFT','2019-05-11 00:54:57.217');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (199,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','</zone>','admin','ZKEASOFT','2019-05-11 00:54:57.220','admin','ZKEASOFT','2019-05-11 00:54:57.220');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (200,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 00:54:57.223','admin','ZKEASOFT','2019-05-11 00:54:57.223');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (201,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','<zone>','admin','ZKEASOFT','2019-05-11 00:54:57.233','admin','ZKEASOFT','2019-05-11 00:54:57.233');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (202,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','ZONE-1','admin','ZKEASOFT','2019-05-11 00:54:57.243','admin','ZKEASOFT','2019-05-11 00:54:57.243');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (203,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','</zone>','admin','ZKEASOFT','2019-05-11 00:54:57.247','admin','ZKEASOFT','2019-05-11 00:54:57.247');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (204,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 00:54:57.247','admin','ZKEASOFT','2019-05-11 00:54:57.247');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (205,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','<zone>','admin','ZKEASOFT','2019-05-11 00:54:57.250','admin','ZKEASOFT','2019-05-11 00:54:57.250');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (206,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','ZONE-2','admin','ZKEASOFT','2019-05-11 00:54:57.260','admin','ZKEASOFT','2019-05-11 00:54:57.260');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (207,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','</zone>','admin','ZKEASOFT','2019-05-11 00:54:57.267','admin','ZKEASOFT','2019-05-11 00:54:57.267');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (208,'cdd02cb5c11d49d690ae618c14843944','0563f84d9b214f38a1f76d8eba7b62a1','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 00:54:57.277','admin','ZKEASOFT','2019-05-11 00:54:57.277');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (269,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 09:17:54.110','admin','ZKEASOFT','2019-05-11 09:17:54.110');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (270,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','<zone>','admin','ZKEASOFT','2019-05-11 09:17:54.130','admin','ZKEASOFT','2019-05-11 09:17:54.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (271,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','ZONE-0','admin','ZKEASOFT','2019-05-11 09:17:54.143','admin','ZKEASOFT','2019-05-11 09:17:54.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (272,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','</zone>','admin','ZKEASOFT','2019-05-11 09:17:54.150','admin','ZKEASOFT','2019-05-11 09:17:54.150');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (273,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 09:17:54.153','admin','ZKEASOFT','2019-05-11 09:17:54.153');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (274,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','<zone>','admin','ZKEASOFT','2019-05-11 09:17:54.157','admin','ZKEASOFT','2019-05-11 09:17:54.157');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (275,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','ZONE-1','admin','ZKEASOFT','2019-05-11 09:17:54.157','admin','ZKEASOFT','2019-05-11 09:17:54.157');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (276,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','</zone>','admin','ZKEASOFT','2019-05-11 09:17:54.163','admin','ZKEASOFT','2019-05-11 09:17:54.163');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (277,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 09:17:54.167','admin','ZKEASOFT','2019-05-11 09:17:54.167');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (278,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','<zone>','admin','ZKEASOFT','2019-05-11 09:17:54.173','admin','ZKEASOFT','2019-05-11 09:17:54.173');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (279,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','ZONE-2','admin','ZKEASOFT','2019-05-11 09:17:54.183','admin','ZKEASOFT','2019-05-11 09:17:54.183');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (280,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','</zone>','admin','ZKEASOFT','2019-05-11 09:17:54.200','admin','ZKEASOFT','2019-05-11 09:17:54.200');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (281,'cdd02cb5c11d49d690ae618c14843944','31143965b228461d9f09f9afec9c310f','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 09:17:54.203','admin','ZKEASOFT','2019-05-11 09:17:54.203');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (337,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 10:07:31.840','admin','ZKEASOFT','2019-05-11 10:07:31.840');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (338,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','<zone>','admin','ZKEASOFT','2019-05-11 10:07:31.847','admin','ZKEASOFT','2019-05-11 10:07:31.847');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (339,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','ZONE-0','admin','ZKEASOFT','2019-05-11 10:07:31.850','admin','ZKEASOFT','2019-05-11 10:07:31.850');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (340,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</zone>','admin','ZKEASOFT','2019-05-11 10:07:31.857','admin','ZKEASOFT','2019-05-11 10:07:31.857');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (341,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 10:07:31.873','admin','ZKEASOFT','2019-05-11 10:07:31.873');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (342,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','<zone>','admin','ZKEASOFT','2019-05-11 10:07:31.877','admin','ZKEASOFT','2019-05-11 10:07:31.877');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (343,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','ZONE-1','admin','ZKEASOFT','2019-05-11 10:07:31.887','admin','ZKEASOFT','2019-05-11 10:07:31.887');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (344,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</zone>','admin','ZKEASOFT','2019-05-11 10:07:31.897','admin','ZKEASOFT','2019-05-11 10:07:31.897');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (345,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</div>
                </div>
            </div>
        </div><div class="additional row"><div class="col-md-9 additional">
                                
                            <div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2019-05-11 10:07:31.897','admin','ZKEASOFT','2019-05-11 10:07:31.897');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (346,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','<zone>','admin','ZKEASOFT','2019-05-11 10:07:31.900','admin','ZKEASOFT','2019-05-11 10:07:31.900');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (347,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','ZONE-3','admin','ZKEASOFT','2019-05-11 10:07:31.917','admin','ZKEASOFT','2019-05-11 10:07:31.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (348,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</zone>','admin','ZKEASOFT','2019-05-11 10:07:31.927','admin','ZKEASOFT','2019-05-11 10:07:31.927');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (349,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</div></div></div>
                            <div class="col-md-3 additional">
                                
                            <div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2019-05-11 10:07:31.937','admin','ZKEASOFT','2019-05-11 10:07:31.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (350,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','<zone>','admin','ZKEASOFT','2019-05-11 10:07:31.950','admin','ZKEASOFT','2019-05-11 10:07:31.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (351,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','ZONE-4','admin','ZKEASOFT','2019-05-11 10:07:31.957','admin','ZKEASOFT','2019-05-11 10:07:31.957');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (352,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</zone>','admin','ZKEASOFT','2019-05-11 10:07:31.970','admin','ZKEASOFT','2019-05-11 10:07:31.970');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (353,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 10:07:31.983','admin','ZKEASOFT','2019-05-11 10:07:31.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (354,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','<zone>','admin','ZKEASOFT','2019-05-11 10:07:31.993','admin','ZKEASOFT','2019-05-11 10:07:31.993');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (355,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','ZONE-2','admin','ZKEASOFT','2019-05-11 10:07:32.010','admin','ZKEASOFT','2019-05-11 10:07:32.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (356,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</zone>','admin','ZKEASOFT','2019-05-11 10:07:32.017','admin','ZKEASOFT','2019-05-11 10:07:32.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (357,'cdd02cb5c11d49d690ae618c14843944','1d3588669e2d4bf2bb731486f21270d1','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 10:07:32.027','admin','ZKEASOFT','2019-05-11 10:07:32.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (481,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:06:21.093','admin','ZKEASOFT','2019-05-11 13:06:21.093');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (482,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','<zone>','admin','ZKEASOFT','2019-05-11 13:06:21.100','admin','ZKEASOFT','2019-05-11 13:06:21.100');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (483,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','ZONE-0','admin','ZKEASOFT','2019-05-11 13:06:21.103','admin','ZKEASOFT','2019-05-11 13:06:21.103');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (484,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','</zone>','admin','ZKEASOFT','2019-05-11 13:06:21.110','admin','ZKEASOFT','2019-05-11 13:06:21.110');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (485,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:06:21.117','admin','ZKEASOFT','2019-05-11 13:06:21.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (486,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','<zone>','admin','ZKEASOFT','2019-05-11 13:06:21.133','admin','ZKEASOFT','2019-05-11 13:06:21.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (487,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','ZONE-1','admin','ZKEASOFT','2019-05-11 13:06:21.147','admin','ZKEASOFT','2019-05-11 13:06:21.147');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (488,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','</zone>','admin','ZKEASOFT','2019-05-11 13:06:21.153','admin','ZKEASOFT','2019-05-11 13:06:21.157');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (489,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:06:21.163','admin','ZKEASOFT','2019-05-11 13:06:21.163');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (490,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','<zone>','admin','ZKEASOFT','2019-05-11 13:06:21.177','admin','ZKEASOFT','2019-05-11 13:06:21.177');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (491,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','ZONE-2','admin','ZKEASOFT','2019-05-11 13:06:21.187','admin','ZKEASOFT','2019-05-11 13:06:21.187');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (492,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','</zone>','admin','ZKEASOFT','2019-05-11 13:06:21.200','admin','ZKEASOFT','2019-05-11 13:06:21.200');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (493,'cdd02cb5c11d49d690ae618c14843944','206b9210f5ad422dad9e13a4797df74c','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 13:06:21.210','admin','ZKEASOFT','2019-05-11 13:06:21.210');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (494,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:09:52.533','admin','ZKEASOFT','2019-05-11 13:09:52.533');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (495,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','<zone>','admin','ZKEASOFT','2019-05-11 13:09:52.537','admin','ZKEASOFT','2019-05-11 13:09:52.537');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (496,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','ZONE-0','admin','ZKEASOFT','2019-05-11 13:09:52.537','admin','ZKEASOFT','2019-05-11 13:09:52.537');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (497,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','</zone>','admin','ZKEASOFT','2019-05-11 13:09:52.540','admin','ZKEASOFT','2019-05-11 13:09:52.540');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (498,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:09:52.540','admin','ZKEASOFT','2019-05-11 13:09:52.540');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (499,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','<zone>','admin','ZKEASOFT','2019-05-11 13:09:52.543','admin','ZKEASOFT','2019-05-11 13:09:52.543');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (500,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','ZONE-1','admin','ZKEASOFT','2019-05-11 13:09:52.547','admin','ZKEASOFT','2019-05-11 13:09:52.547');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (501,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','</zone>','admin','ZKEASOFT','2019-05-11 13:09:52.550','admin','ZKEASOFT','2019-05-11 13:09:52.550');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (502,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:09:52.553','admin','ZKEASOFT','2019-05-11 13:09:52.553');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (503,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','<zone>','admin','ZKEASOFT','2019-05-11 13:09:52.557','admin','ZKEASOFT','2019-05-11 13:09:52.557');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (504,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','ZONE-2','admin','ZKEASOFT','2019-05-11 13:09:52.557','admin','ZKEASOFT','2019-05-11 13:09:52.557');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (505,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','</zone>','admin','ZKEASOFT','2019-05-11 13:09:52.560','admin','ZKEASOFT','2019-05-11 13:09:52.560');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (506,'cdd02cb5c11d49d690ae618c14843944','bc1391f9f06f4ec7a29bf62d3d633894','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 13:09:52.563','admin','ZKEASOFT','2019-05-11 13:09:52.563');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (507,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:58:35.710','admin','ZKEASOFT','2019-05-11 13:58:35.710');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (508,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','<zone>','admin','ZKEASOFT','2019-05-11 13:58:35.727','admin','ZKEASOFT','2019-05-11 13:58:35.727');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (509,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','ZONE-0','admin','ZKEASOFT','2019-05-11 13:58:35.740','admin','ZKEASOFT','2019-05-11 13:58:35.740');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (510,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','</zone>','admin','ZKEASOFT','2019-05-11 13:58:35.747','admin','ZKEASOFT','2019-05-11 13:58:35.747');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (511,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:58:35.757','admin','ZKEASOFT','2019-05-11 13:58:35.757');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (512,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','<zone>','admin','ZKEASOFT','2019-05-11 13:58:35.763','admin','ZKEASOFT','2019-05-11 13:58:35.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (513,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','ZONE-1','admin','ZKEASOFT','2019-05-11 13:58:35.767','admin','ZKEASOFT','2019-05-11 13:58:35.767');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (514,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','</zone>','admin','ZKEASOFT','2019-05-11 13:58:35.773','admin','ZKEASOFT','2019-05-11 13:58:35.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (515,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 13:58:35.790','admin','ZKEASOFT','2019-05-11 13:58:35.790');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (516,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','<zone>','admin','ZKEASOFT','2019-05-11 13:58:35.807','admin','ZKEASOFT','2019-05-11 13:58:35.807');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (517,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','ZONE-2','admin','ZKEASOFT','2019-05-11 13:58:35.810','admin','ZKEASOFT','2019-05-11 13:58:35.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (518,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','</zone>','admin','ZKEASOFT','2019-05-11 13:58:35.813','admin','ZKEASOFT','2019-05-11 13:58:35.813');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (519,'cdd02cb5c11d49d690ae618c14843944','2c0a828ed4a646f1a9723eb7139ff5cd','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 13:58:35.820','admin','ZKEASOFT','2019-05-11 13:58:35.820');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (546,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:27:06.087','admin','ZKEASOFT','2019-05-11 17:27:06.087');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (547,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','<zone>','admin','ZKEASOFT','2019-05-11 17:27:06.093','admin','ZKEASOFT','2019-05-11 17:27:06.093');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (548,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','ZONE-0','admin','ZKEASOFT','2019-05-11 17:27:06.097','admin','ZKEASOFT','2019-05-11 17:27:06.097');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (549,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','</zone>','admin','ZKEASOFT','2019-05-11 17:27:06.100','admin','ZKEASOFT','2019-05-11 17:27:06.100');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (550,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:27:06.103','admin','ZKEASOFT','2019-05-11 17:27:06.103');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (551,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','<zone>','admin','ZKEASOFT','2019-05-11 17:27:06.107','admin','ZKEASOFT','2019-05-11 17:27:06.107');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (552,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','ZONE-1','admin','ZKEASOFT','2019-05-11 17:27:06.107','admin','ZKEASOFT','2019-05-11 17:27:06.107');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (553,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','</zone>','admin','ZKEASOFT','2019-05-11 17:27:06.113','admin','ZKEASOFT','2019-05-11 17:27:06.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (554,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:27:06.117','admin','ZKEASOFT','2019-05-11 17:27:06.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (555,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','<zone>','admin','ZKEASOFT','2019-05-11 17:27:06.120','admin','ZKEASOFT','2019-05-11 17:27:06.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (556,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','ZONE-2','admin','ZKEASOFT','2019-05-11 17:27:06.123','admin','ZKEASOFT','2019-05-11 17:27:06.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (557,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','</zone>','admin','ZKEASOFT','2019-05-11 17:27:06.127','admin','ZKEASOFT','2019-05-11 17:27:06.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (558,'cdd02cb5c11d49d690ae618c14843944','67e50d8020a04c798a09096be57890b7','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 17:27:06.130','admin','ZKEASOFT','2019-05-11 17:27:06.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (559,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:34:34.273','admin','ZKEASOFT','2019-05-11 17:34:34.273');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (560,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','<zone>','admin','ZKEASOFT','2019-05-11 17:34:34.280','admin','ZKEASOFT','2019-05-11 17:34:34.280');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (561,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','ZONE-0','admin','ZKEASOFT','2019-05-11 17:34:34.290','admin','ZKEASOFT','2019-05-11 17:34:34.290');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (562,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','</zone>','admin','ZKEASOFT','2019-05-11 17:34:34.297','admin','ZKEASOFT','2019-05-11 17:34:34.297');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (563,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:34:34.303','admin','ZKEASOFT','2019-05-11 17:34:34.303');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (564,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','<zone>','admin','ZKEASOFT','2019-05-11 17:34:34.307','admin','ZKEASOFT','2019-05-11 17:34:34.307');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (565,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','ZONE-1','admin','ZKEASOFT','2019-05-11 17:34:34.313','admin','ZKEASOFT','2019-05-11 17:34:34.313');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (566,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','</zone>','admin','ZKEASOFT','2019-05-11 17:34:34.323','admin','ZKEASOFT','2019-05-11 17:34:34.323');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (567,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:34:34.330','admin','ZKEASOFT','2019-05-11 17:34:34.330');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (568,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','<zone>','admin','ZKEASOFT','2019-05-11 17:34:34.340','admin','ZKEASOFT','2019-05-11 17:34:34.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (569,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','ZONE-2','admin','ZKEASOFT','2019-05-11 17:34:34.347','admin','ZKEASOFT','2019-05-11 17:34:34.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (570,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','</zone>','admin','ZKEASOFT','2019-05-11 17:34:34.350','admin','ZKEASOFT','2019-05-11 17:34:34.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (571,'cdd02cb5c11d49d690ae618c14843944','33b55cabea314877a095529b0bd8c721','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 17:34:34.360','admin','ZKEASOFT','2019-05-11 17:34:34.360');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (572,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:35:44.317','admin','ZKEASOFT','2019-05-11 17:35:44.317');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (573,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','<zone>','admin','ZKEASOFT','2019-05-11 17:35:44.320','admin','ZKEASOFT','2019-05-11 17:35:44.320');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (574,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','ZONE-0','admin','ZKEASOFT','2019-05-11 17:35:44.323','admin','ZKEASOFT','2019-05-11 17:35:44.323');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (575,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','</zone>','admin','ZKEASOFT','2019-05-11 17:35:44.327','admin','ZKEASOFT','2019-05-11 17:35:44.327');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (576,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:35:44.330','admin','ZKEASOFT','2019-05-11 17:35:44.330');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (577,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','<zone>','admin','ZKEASOFT','2019-05-11 17:35:44.333','admin','ZKEASOFT','2019-05-11 17:35:44.333');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (578,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','ZONE-1','admin','ZKEASOFT','2019-05-11 17:35:44.337','admin','ZKEASOFT','2019-05-11 17:35:44.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (579,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','</zone>','admin','ZKEASOFT','2019-05-11 17:35:44.337','admin','ZKEASOFT','2019-05-11 17:35:44.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (580,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 17:35:44.337','admin','ZKEASOFT','2019-05-11 17:35:44.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (581,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','<zone>','admin','ZKEASOFT','2019-05-11 17:35:44.340','admin','ZKEASOFT','2019-05-11 17:35:44.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (582,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','ZONE-2','admin','ZKEASOFT','2019-05-11 17:35:44.347','admin','ZKEASOFT','2019-05-11 17:35:44.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (583,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','</zone>','admin','ZKEASOFT','2019-05-11 17:35:44.350','admin','ZKEASOFT','2019-05-11 17:35:44.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (584,'cdd02cb5c11d49d690ae618c14843944','3ce0f8eeea02460da9b5a308dcdb8bad','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 17:35:44.353','admin','ZKEASOFT','2019-05-11 17:35:44.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (585,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 22:13:35.250','admin','ZKEASOFT','2019-05-11 22:13:35.250');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (586,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','<zone>','admin','ZKEASOFT','2019-05-11 22:13:35.297','admin','ZKEASOFT','2019-05-11 22:13:35.297');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (587,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','ZONE-0','admin','ZKEASOFT','2019-05-11 22:13:35.307','admin','ZKEASOFT','2019-05-11 22:13:35.307');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (588,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','</zone>','admin','ZKEASOFT','2019-05-11 22:13:35.317','admin','ZKEASOFT','2019-05-11 22:13:35.317');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (589,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 22:13:35.350','admin','ZKEASOFT','2019-05-11 22:13:35.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (590,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','<zone>','admin','ZKEASOFT','2019-05-11 22:13:35.357','admin','ZKEASOFT','2019-05-11 22:13:35.357');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (591,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','ZONE-1','admin','ZKEASOFT','2019-05-11 22:13:35.363','admin','ZKEASOFT','2019-05-11 22:13:35.363');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (592,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','</zone>','admin','ZKEASOFT','2019-05-11 22:13:35.367','admin','ZKEASOFT','2019-05-11 22:13:35.367');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (593,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 22:13:35.807','admin','ZKEASOFT','2019-05-11 22:13:35.807');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (594,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','<zone>','admin','ZKEASOFT','2019-05-11 22:13:36.013','admin','ZKEASOFT','2019-05-11 22:13:36.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (595,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','ZONE-2','admin','ZKEASOFT','2019-05-11 22:13:36.027','admin','ZKEASOFT','2019-05-11 22:13:36.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (596,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','</zone>','admin','ZKEASOFT','2019-05-11 22:13:36.070','admin','ZKEASOFT','2019-05-11 22:13:36.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (597,'cdd02cb5c11d49d690ae618c14843944','7dc93ed1a4174ab692beb15a06159bad','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 22:13:36.110','admin','ZKEASOFT','2019-05-11 22:13:36.110');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (598,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 22:16:02.953','admin','ZKEASOFT','2019-05-11 22:16:02.953');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (599,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','<zone>','admin','ZKEASOFT','2019-05-11 22:16:02.960','admin','ZKEASOFT','2019-05-11 22:16:02.960');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (600,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','ZONE-0','admin','ZKEASOFT','2019-05-11 22:16:02.977','admin','ZKEASOFT','2019-05-11 22:16:02.977');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (601,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','</zone>','admin','ZKEASOFT','2019-05-11 22:16:02.983','admin','ZKEASOFT','2019-05-11 22:16:02.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (602,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 22:16:02.990','admin','ZKEASOFT','2019-05-11 22:16:02.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (603,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','<zone>','admin','ZKEASOFT','2019-05-11 22:16:03.000','admin','ZKEASOFT','2019-05-11 22:16:03.000');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (604,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','ZONE-1','admin','ZKEASOFT','2019-05-11 22:16:03.017','admin','ZKEASOFT','2019-05-11 22:16:03.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (605,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','</zone>','admin','ZKEASOFT','2019-05-11 22:16:03.030','admin','ZKEASOFT','2019-05-11 22:16:03.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (606,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','ZKEASOFT','2019-05-11 22:16:03.040','admin','ZKEASOFT','2019-05-11 22:16:03.040');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (607,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','<zone>','admin','ZKEASOFT','2019-05-11 22:16:03.050','admin','ZKEASOFT','2019-05-11 22:16:03.050');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (608,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','ZONE-2','admin','ZKEASOFT','2019-05-11 22:16:03.060','admin','ZKEASOFT','2019-05-11 22:16:03.060');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (609,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','</zone>','admin','ZKEASOFT','2019-05-11 22:16:03.063','admin','ZKEASOFT','2019-05-11 22:16:03.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (610,'cdd02cb5c11d49d690ae618c14843944','c102babe4a3043bf8f50d3a71075a4ef','</div>
                </div>
            </div>
        </div>
    </div>','admin','ZKEASOFT','2019-05-11 22:16:03.070','admin','ZKEASOFT','2019-05-11 22:16:03.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (650,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:05:00.353','admin','超级管理员','2019-05-11 23:05:00.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (651,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','<zone>','admin','超级管理员','2019-05-11 23:05:00.360','admin','超级管理员','2019-05-11 23:05:00.360');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (652,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','ZONE-0','admin','超级管理员','2019-05-11 23:05:00.363','admin','超级管理员','2019-05-11 23:05:00.363');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (653,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','</zone>','admin','超级管理员','2019-05-11 23:05:00.367','admin','超级管理员','2019-05-11 23:05:00.367');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (654,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:05:00.367','admin','超级管理员','2019-05-11 23:05:00.367');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (655,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','<zone>','admin','超级管理员','2019-05-11 23:05:00.370','admin','超级管理员','2019-05-11 23:05:00.370');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (656,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','ZONE-1','admin','超级管理员','2019-05-11 23:05:00.373','admin','超级管理员','2019-05-11 23:05:00.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (657,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','</zone>','admin','超级管理员','2019-05-11 23:05:00.377','admin','超级管理员','2019-05-11 23:05:00.377');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (658,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:05:00.380','admin','超级管理员','2019-05-11 23:05:00.380');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (659,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','<zone>','admin','超级管理员','2019-05-11 23:05:00.383','admin','超级管理员','2019-05-11 23:05:00.383');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (660,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','ZONE-2','admin','超级管理员','2019-05-11 23:05:00.383','admin','超级管理员','2019-05-11 23:05:00.383');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (661,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','</zone>','admin','超级管理员','2019-05-11 23:05:00.390','admin','超级管理员','2019-05-11 23:05:00.390');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (662,'cdd02cb5c11d49d690ae618c14843944','1c75f6cae25e449eb5554f26b07b7c24','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-11 23:05:00.393','admin','超级管理员','2019-05-11 23:05:00.393');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (676,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:31:43.087','admin','超级管理员','2019-05-11 23:31:43.087');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (677,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','<zone>','admin','超级管理员','2019-05-11 23:31:43.087','admin','超级管理员','2019-05-11 23:31:43.087');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (678,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','ZONE-0','admin','超级管理员','2019-05-11 23:31:43.090','admin','超级管理员','2019-05-11 23:31:43.090');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (679,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','</zone>','admin','超级管理员','2019-05-11 23:31:43.093','admin','超级管理员','2019-05-11 23:31:43.093');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (680,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:31:43.097','admin','超级管理员','2019-05-11 23:31:43.097');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (681,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','<zone>','admin','超级管理员','2019-05-11 23:31:43.100','admin','超级管理员','2019-05-11 23:31:43.100');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (682,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','ZONE-1','admin','超级管理员','2019-05-11 23:31:43.103','admin','超级管理员','2019-05-11 23:31:43.103');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (683,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','</zone>','admin','超级管理员','2019-05-11 23:31:43.107','admin','超级管理员','2019-05-11 23:31:43.107');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (684,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:31:43.110','admin','超级管理员','2019-05-11 23:31:43.110');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (685,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','<zone>','admin','超级管理员','2019-05-11 23:31:43.113','admin','超级管理员','2019-05-11 23:31:43.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (686,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','ZONE-2','admin','超级管理员','2019-05-11 23:31:43.117','admin','超级管理员','2019-05-11 23:31:43.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (687,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','</zone>','admin','超级管理员','2019-05-11 23:31:43.120','admin','超级管理员','2019-05-11 23:31:43.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (688,'cdd02cb5c11d49d690ae618c14843944','afd10d0b64d44ef9aa677a019e696e27','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-11 23:31:43.123','admin','超级管理员','2019-05-11 23:31:43.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (689,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:33:31.247','admin','超级管理员','2019-05-11 23:33:31.247');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (690,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','<zone>','admin','超级管理员','2019-05-11 23:33:31.260','admin','超级管理员','2019-05-11 23:33:31.260');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (691,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','ZONE-0','admin','超级管理员','2019-05-11 23:33:31.267','admin','超级管理员','2019-05-11 23:33:31.267');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (692,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','</zone>','admin','超级管理员','2019-05-11 23:33:31.277','admin','超级管理员','2019-05-11 23:33:31.277');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (693,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:33:31.293','admin','超级管理员','2019-05-11 23:33:31.293');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (694,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','<zone>','admin','超级管理员','2019-05-11 23:33:31.337','admin','超级管理员','2019-05-11 23:33:31.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (695,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','ZONE-1','admin','超级管理员','2019-05-11 23:33:31.343','admin','超级管理员','2019-05-11 23:33:31.343');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (696,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','</zone>','admin','超级管理员','2019-05-11 23:33:31.347','admin','超级管理员','2019-05-11 23:33:31.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (697,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:33:31.347','admin','超级管理员','2019-05-11 23:33:31.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (698,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','<zone>','admin','超级管理员','2019-05-11 23:33:31.350','admin','超级管理员','2019-05-11 23:33:31.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (699,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','ZONE-2','admin','超级管理员','2019-05-11 23:33:31.353','admin','超级管理员','2019-05-11 23:33:31.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (700,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','</zone>','admin','超级管理员','2019-05-11 23:33:31.360','admin','超级管理员','2019-05-11 23:33:31.360');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (701,'cdd02cb5c11d49d690ae618c14843944','419e6f52894940fd8261c3f7e719933d','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-11 23:33:31.363','admin','超级管理员','2019-05-11 23:33:31.363');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (702,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:34:26.917','admin','超级管理员','2019-05-11 23:34:26.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (703,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','<zone>','admin','超级管理员','2019-05-11 23:34:26.920','admin','超级管理员','2019-05-11 23:34:26.920');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (704,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','ZONE-0','admin','超级管理员','2019-05-11 23:34:26.923','admin','超级管理员','2019-05-11 23:34:26.923');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (705,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','</zone>','admin','超级管理员','2019-05-11 23:34:26.927','admin','超级管理员','2019-05-11 23:34:26.927');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (706,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:34:26.927','admin','超级管理员','2019-05-11 23:34:26.927');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (707,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','<zone>','admin','超级管理员','2019-05-11 23:34:26.930','admin','超级管理员','2019-05-11 23:34:26.930');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (708,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','ZONE-1','admin','超级管理员','2019-05-11 23:34:26.933','admin','超级管理员','2019-05-11 23:34:26.933');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (709,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','</zone>','admin','超级管理员','2019-05-11 23:34:26.937','admin','超级管理员','2019-05-11 23:34:26.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (710,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-11 23:34:26.940','admin','超级管理员','2019-05-11 23:34:26.940');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (711,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','<zone>','admin','超级管理员','2019-05-11 23:34:26.940','admin','超级管理员','2019-05-11 23:34:26.940');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (712,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','ZONE-2','admin','超级管理员','2019-05-11 23:34:26.943','admin','超级管理员','2019-05-11 23:34:26.943');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (713,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','</zone>','admin','超级管理员','2019-05-11 23:34:26.943','admin','超级管理员','2019-05-11 23:34:26.943');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (714,'cdd02cb5c11d49d690ae618c14843944','0f56cb364d1f4ebb8b86dc6c06526c09','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-11 23:34:26.947','admin','超级管理员','2019-05-11 23:34:26.947');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (728,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-12 00:24:44.417','admin','超级管理员','2019-05-12 00:24:44.417');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (729,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','<zone>','admin','超级管理员','2019-05-12 00:24:44.417','admin','超级管理员','2019-05-12 00:24:44.417');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (730,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','ZONE-0','admin','超级管理员','2019-05-12 00:24:44.427','admin','超级管理员','2019-05-12 00:24:44.427');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (731,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</zone>','admin','超级管理员','2019-05-12 00:24:44.430','admin','超级管理员','2019-05-12 00:24:44.430');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (732,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-12 00:24:44.433','admin','超级管理员','2019-05-12 00:24:44.433');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (733,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','<zone>','admin','超级管理员','2019-05-12 00:24:44.440','admin','超级管理员','2019-05-12 00:24:44.440');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (734,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','ZONE-1','admin','超级管理员','2019-05-12 00:24:44.450','admin','超级管理员','2019-05-12 00:24:44.450');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (735,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</zone>','admin','超级管理员','2019-05-12 00:24:44.453','admin','超级管理员','2019-05-12 00:24:44.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (736,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</div>
                </div>
            </div>
        </div><div class="additional row"><div class="col-md-9 additional">
                                
                            <div class="colContent row"><div class="additional zone">','admin','超级管理员','2019-05-12 00:24:44.473','admin','超级管理员','2019-05-12 00:24:44.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (737,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','<zone>','admin','超级管理员','2019-05-12 00:24:44.480','admin','超级管理员','2019-05-12 00:24:44.480');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (738,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','ZONE-3','admin','超级管理员','2019-05-12 00:24:44.487','admin','超级管理员','2019-05-12 00:24:44.487');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (739,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</zone>','admin','超级管理员','2019-05-12 00:24:44.493','admin','超级管理员','2019-05-12 00:24:44.493');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (740,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</div></div></div>
                            <div class="col-md-3 additional">
                                
                            <div class="colContent row"><div class="additional zone">','admin','超级管理员','2019-05-12 00:24:44.497','admin','超级管理员','2019-05-12 00:24:44.497');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (741,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','<zone>','admin','超级管理员','2019-05-12 00:24:44.507','admin','超级管理员','2019-05-12 00:24:44.507');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (742,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','ZONE-4','admin','超级管理员','2019-05-12 00:24:44.513','admin','超级管理员','2019-05-12 00:24:44.513');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (743,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</zone>','admin','超级管理员','2019-05-12 00:24:44.520','admin','超级管理员','2019-05-12 00:24:44.520');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (744,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-12 00:24:44.523','admin','超级管理员','2019-05-12 00:24:44.523');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (745,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','<zone>','admin','超级管理员','2019-05-12 00:24:44.537','admin','超级管理员','2019-05-12 00:24:44.537');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (746,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','ZONE-2','admin','超级管理员','2019-05-12 00:24:44.550','admin','超级管理员','2019-05-12 00:24:44.550');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (747,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</zone>','admin','超级管理员','2019-05-12 00:24:44.553','admin','超级管理员','2019-05-12 00:24:44.553');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (748,'cdd02cb5c11d49d690ae618c14843944','2b44a65b748948528a360cc2ec0f2603','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-12 00:24:44.557','admin','超级管理员','2019-05-12 00:24:44.557');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (749,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-12 00:40:43.180','admin','超级管理员','2019-05-12 00:40:43.180');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (750,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','<zone>','admin','超级管理员','2019-05-12 00:40:43.240','admin','超级管理员','2019-05-12 00:40:43.240');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (751,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','ZONE-0','admin','超级管理员','2019-05-12 00:40:43.247','admin','超级管理员','2019-05-12 00:40:43.247');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (752,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','</zone>','admin','超级管理员','2019-05-12 00:40:43.250','admin','超级管理员','2019-05-12 00:40:43.250');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (753,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-12 00:40:43.257','admin','超级管理员','2019-05-12 00:40:43.257');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (754,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','<zone>','admin','超级管理员','2019-05-12 00:40:43.260','admin','超级管理员','2019-05-12 00:40:43.260');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (755,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','ZONE-1','admin','超级管理员','2019-05-12 00:40:43.267','admin','超级管理员','2019-05-12 00:40:43.267');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (756,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','</zone>','admin','超级管理员','2019-05-12 00:40:43.267','admin','超级管理员','2019-05-12 00:40:43.267');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (757,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-12 00:40:43.270','admin','超级管理员','2019-05-12 00:40:43.270');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (758,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','<zone>','admin','超级管理员','2019-05-12 00:40:43.280','admin','超级管理员','2019-05-12 00:40:43.280');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (759,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','ZONE-2','admin','超级管理员','2019-05-12 00:40:43.283','admin','超级管理员','2019-05-12 00:40:43.283');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (760,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','</zone>','admin','超级管理员','2019-05-12 00:40:43.287','admin','超级管理员','2019-05-12 00:40:43.287');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (761,'cdd02cb5c11d49d690ae618c14843944','77c5a847fd794baa95461ebd4a5e3853','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-12 00:40:43.287','admin','超级管理员','2019-05-12 00:40:43.287');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (788,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:48:45.470','admin','超级管理员','2019-05-13 14:48:45.470');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (789,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','<zone>','admin','超级管理员','2019-05-13 14:48:45.473','admin','超级管理员','2019-05-13 14:48:45.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (790,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','ZONE-0','admin','超级管理员','2019-05-13 14:48:45.480','admin','超级管理员','2019-05-13 14:48:45.480');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (791,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','</zone>','admin','超级管理员','2019-05-13 14:48:45.483','admin','超级管理员','2019-05-13 14:48:45.483');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (792,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:48:45.490','admin','超级管理员','2019-05-13 14:48:45.490');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (793,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','<zone>','admin','超级管理员','2019-05-13 14:48:45.493','admin','超级管理员','2019-05-13 14:48:45.493');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (794,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','ZONE-1','admin','超级管理员','2019-05-13 14:48:45.500','admin','超级管理员','2019-05-13 14:48:45.500');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (795,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','</zone>','admin','超级管理员','2019-05-13 14:48:45.507','admin','超级管理员','2019-05-13 14:48:45.507');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (796,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:48:45.513','admin','超级管理员','2019-05-13 14:48:45.513');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (797,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','<zone>','admin','超级管理员','2019-05-13 14:48:45.517','admin','超级管理员','2019-05-13 14:48:45.517');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (798,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','ZONE-2','admin','超级管理员','2019-05-13 14:48:45.523','admin','超级管理员','2019-05-13 14:48:45.523');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (799,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','</zone>','admin','超级管理员','2019-05-13 14:48:45.530','admin','超级管理员','2019-05-13 14:48:45.530');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (800,'cdd02cb5c11d49d690ae618c14843944','ed5ec60dcdc840569faf58db8c2a71ee','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:48:45.533','admin','超级管理员','2019-05-13 14:48:45.533');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (801,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:49:57.540','admin','超级管理员','2019-05-13 14:49:57.540');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (802,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','<zone>','admin','超级管理员','2019-05-13 14:49:57.547','admin','超级管理员','2019-05-13 14:49:57.547');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (803,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','ZONE-0','admin','超级管理员','2019-05-13 14:49:57.550','admin','超级管理员','2019-05-13 14:49:57.550');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (804,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','</zone>','admin','超级管理员','2019-05-13 14:49:57.550','admin','超级管理员','2019-05-13 14:49:57.550');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (805,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:49:57.553','admin','超级管理员','2019-05-13 14:49:57.553');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (806,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','<zone>','admin','超级管理员','2019-05-13 14:49:57.557','admin','超级管理员','2019-05-13 14:49:57.557');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (807,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','ZONE-1','admin','超级管理员','2019-05-13 14:49:57.563','admin','超级管理员','2019-05-13 14:49:57.563');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (808,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','</zone>','admin','超级管理员','2019-05-13 14:49:57.567','admin','超级管理员','2019-05-13 14:49:57.567');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (809,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:49:57.567','admin','超级管理员','2019-05-13 14:49:57.567');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (810,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','<zone>','admin','超级管理员','2019-05-13 14:49:57.573','admin','超级管理员','2019-05-13 14:49:57.573');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (811,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','ZONE-2','admin','超级管理员','2019-05-13 14:49:57.577','admin','超级管理员','2019-05-13 14:49:57.577');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (812,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','</zone>','admin','超级管理员','2019-05-13 14:49:57.580','admin','超级管理员','2019-05-13 14:49:57.580');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (813,'cdd02cb5c11d49d690ae618c14843944','072cefbba72d4149bbe3cb83003d5983','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:49:57.580','admin','超级管理员','2019-05-13 14:49:57.580');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (814,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:50:34.633','admin','超级管理员','2019-05-13 14:50:34.633');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (815,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','<zone>','admin','超级管理员','2019-05-13 14:50:34.643','admin','超级管理员','2019-05-13 14:50:34.643');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (816,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','ZONE-0','admin','超级管理员','2019-05-13 14:50:34.650','admin','超级管理员','2019-05-13 14:50:34.650');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (817,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','</zone>','admin','超级管理员','2019-05-13 14:50:34.660','admin','超级管理员','2019-05-13 14:50:34.660');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (818,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:50:34.667','admin','超级管理员','2019-05-13 14:50:34.667');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (819,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','<zone>','admin','超级管理员','2019-05-13 14:50:34.677','admin','超级管理员','2019-05-13 14:50:34.677');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (820,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','ZONE-1','admin','超级管理员','2019-05-13 14:50:34.680','admin','超级管理员','2019-05-13 14:50:34.680');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (821,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','</zone>','admin','超级管理员','2019-05-13 14:50:34.683','admin','超级管理员','2019-05-13 14:50:34.683');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (822,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:50:34.690','admin','超级管理员','2019-05-13 14:50:34.690');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (823,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','<zone>','admin','超级管理员','2019-05-13 14:50:34.697','admin','超级管理员','2019-05-13 14:50:34.697');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (824,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','ZONE-2','admin','超级管理员','2019-05-13 14:50:34.703','admin','超级管理员','2019-05-13 14:50:34.703');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (825,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','</zone>','admin','超级管理员','2019-05-13 14:50:34.707','admin','超级管理员','2019-05-13 14:50:34.707');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (826,'cdd02cb5c11d49d690ae618c14843944','375899eb70f2409cac6fdbcd78eab3a2','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:50:34.713','admin','超级管理员','2019-05-13 14:50:34.713');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (827,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:51:23.393','admin','超级管理员','2019-05-13 14:51:23.393');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (828,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','<zone>','admin','超级管理员','2019-05-13 14:51:23.400','admin','超级管理员','2019-05-13 14:51:23.400');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (829,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','ZONE-0','admin','超级管理员','2019-05-13 14:51:23.407','admin','超级管理员','2019-05-13 14:51:23.407');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (830,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</zone>','admin','超级管理员','2019-05-13 14:51:23.410','admin','超级管理员','2019-05-13 14:51:23.410');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (831,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:51:23.417','admin','超级管理员','2019-05-13 14:51:23.417');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (832,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','<zone>','admin','超级管理员','2019-05-13 14:51:23.427','admin','超级管理员','2019-05-13 14:51:23.427');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (833,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','ZONE-1','admin','超级管理员','2019-05-13 14:51:23.430','admin','超级管理员','2019-05-13 14:51:23.430');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (834,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</zone>','admin','超级管理员','2019-05-13 14:51:23.437','admin','超级管理员','2019-05-13 14:51:23.437');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (835,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</div>
                </div>
            </div>
        </div><div class="additional row"><div class="col-md-9 additional">
                                
                            <div class="colContent row"><div class="additional zone">','admin','超级管理员','2019-05-13 14:51:23.443','admin','超级管理员','2019-05-13 14:51:23.443');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (836,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','<zone>','admin','超级管理员','2019-05-13 14:51:23.447','admin','超级管理员','2019-05-13 14:51:23.447');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (837,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','ZONE-3','admin','超级管理员','2019-05-13 14:51:23.457','admin','超级管理员','2019-05-13 14:51:23.457');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (838,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</zone>','admin','超级管理员','2019-05-13 14:51:23.467','admin','超级管理员','2019-05-13 14:51:23.467');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (839,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</div></div></div>
                            <div class="col-md-3 additional">
                                
                            <div class="colContent row"><div class="additional zone">','admin','超级管理员','2019-05-13 14:51:23.473','admin','超级管理员','2019-05-13 14:51:23.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (840,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','<zone>','admin','超级管理员','2019-05-13 14:51:23.483','admin','超级管理员','2019-05-13 14:51:23.483');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (841,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','ZONE-4','admin','超级管理员','2019-05-13 14:51:23.497','admin','超级管理员','2019-05-13 14:51:23.497');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (842,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</zone>','admin','超级管理员','2019-05-13 14:51:23.503','admin','超级管理员','2019-05-13 14:51:23.503');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (843,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:51:23.507','admin','超级管理员','2019-05-13 14:51:23.507');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (844,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','<zone>','admin','超级管理员','2019-05-13 14:51:23.517','admin','超级管理员','2019-05-13 14:51:23.517');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (845,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','ZONE-2','admin','超级管理员','2019-05-13 14:51:23.527','admin','超级管理员','2019-05-13 14:51:23.527');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (846,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</zone>','admin','超级管理员','2019-05-13 14:51:23.533','admin','超级管理员','2019-05-13 14:51:23.533');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (847,'cdd02cb5c11d49d690ae618c14843944','b6683315018f4098beb240b9129ca11f','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:51:23.540','admin','超级管理员','2019-05-13 14:51:23.540');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (848,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:51:56.977','admin','超级管理员','2019-05-13 14:51:56.977');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (849,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','<zone>','admin','超级管理员','2019-05-13 14:51:56.980','admin','超级管理员','2019-05-13 14:51:56.980');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (850,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','ZONE-0','admin','超级管理员','2019-05-13 14:51:56.980','admin','超级管理员','2019-05-13 14:51:56.980');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (851,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','</zone>','admin','超级管理员','2019-05-13 14:51:56.990','admin','超级管理员','2019-05-13 14:51:56.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (852,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:51:56.993','admin','超级管理员','2019-05-13 14:51:56.993');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (853,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','<zone>','admin','超级管理员','2019-05-13 14:51:56.997','admin','超级管理员','2019-05-13 14:51:56.997');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (854,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','ZONE-1','admin','超级管理员','2019-05-13 14:51:57.003','admin','超级管理员','2019-05-13 14:51:57.003');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (855,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','</zone>','admin','超级管理员','2019-05-13 14:51:57.010','admin','超级管理员','2019-05-13 14:51:57.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (856,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:51:57.020','admin','超级管理员','2019-05-13 14:51:57.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (857,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','<zone>','admin','超级管理员','2019-05-13 14:51:57.023','admin','超级管理员','2019-05-13 14:51:57.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (858,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','ZONE-2','admin','超级管理员','2019-05-13 14:51:57.027','admin','超级管理员','2019-05-13 14:51:57.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (859,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','</zone>','admin','超级管理员','2019-05-13 14:51:57.033','admin','超级管理员','2019-05-13 14:51:57.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (860,'cdd02cb5c11d49d690ae618c14843944','05266b5af4da42f0818919345cf555bb','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:51:57.037','admin','超级管理员','2019-05-13 14:51:57.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (861,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:52:53.853','admin','超级管理员','2019-05-13 14:52:53.853');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (862,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','<zone>','admin','超级管理员','2019-05-13 14:52:53.857','admin','超级管理员','2019-05-13 14:52:53.857');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (863,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','ZONE-0','admin','超级管理员','2019-05-13 14:52:53.863','admin','超级管理员','2019-05-13 14:52:53.863');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (864,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','</zone>','admin','超级管理员','2019-05-13 14:52:53.867','admin','超级管理员','2019-05-13 14:52:53.867');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (865,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:52:53.877','admin','超级管理员','2019-05-13 14:52:53.877');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (866,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','<zone>','admin','超级管理员','2019-05-13 14:52:53.880','admin','超级管理员','2019-05-13 14:52:53.880');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (867,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','ZONE-1','admin','超级管理员','2019-05-13 14:52:53.887','admin','超级管理员','2019-05-13 14:52:53.887');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (868,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','</zone>','admin','超级管理员','2019-05-13 14:52:53.893','admin','超级管理员','2019-05-13 14:52:53.893');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (869,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:52:53.897','admin','超级管理员','2019-05-13 14:52:53.897');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (870,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','<zone>','admin','超级管理员','2019-05-13 14:52:53.900','admin','超级管理员','2019-05-13 14:52:53.900');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (871,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','ZONE-2','admin','超级管理员','2019-05-13 14:52:53.907','admin','超级管理员','2019-05-13 14:52:53.907');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (872,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','</zone>','admin','超级管理员','2019-05-13 14:52:53.917','admin','超级管理员','2019-05-13 14:52:53.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (873,'cdd02cb5c11d49d690ae618c14843944','57bb355c28694cf9912664f3cb1468ef','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:52:53.920','admin','超级管理员','2019-05-13 14:52:53.920');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (874,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:53:38.940','admin','超级管理员','2019-05-13 14:53:38.940');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (875,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','<zone>','admin','超级管理员','2019-05-13 14:53:38.943','admin','超级管理员','2019-05-13 14:53:38.943');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (876,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','ZONE-0','admin','超级管理员','2019-05-13 14:53:38.950','admin','超级管理员','2019-05-13 14:53:38.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (877,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','</zone>','admin','超级管理员','2019-05-13 14:53:38.953','admin','超级管理员','2019-05-13 14:53:38.953');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (878,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:53:38.957','admin','超级管理员','2019-05-13 14:53:38.957');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (879,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','<zone>','admin','超级管理员','2019-05-13 14:53:38.957','admin','超级管理员','2019-05-13 14:53:38.957');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (880,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','ZONE-1','admin','超级管理员','2019-05-13 14:53:38.960','admin','超级管理员','2019-05-13 14:53:38.960');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (881,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','</zone>','admin','超级管理员','2019-05-13 14:53:38.967','admin','超级管理员','2019-05-13 14:53:38.967');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (882,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:53:38.970','admin','超级管理员','2019-05-13 14:53:38.970');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (883,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','<zone>','admin','超级管理员','2019-05-13 14:53:38.973','admin','超级管理员','2019-05-13 14:53:38.973');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (884,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','ZONE-2','admin','超级管理员','2019-05-13 14:53:38.980','admin','超级管理员','2019-05-13 14:53:38.980');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (885,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','</zone>','admin','超级管理员','2019-05-13 14:53:38.983','admin','超级管理员','2019-05-13 14:53:38.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (886,'cdd02cb5c11d49d690ae618c14843944','1bf6ca8b93db44fca2d536249d67da6f','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:53:38.987','admin','超级管理员','2019-05-13 14:53:38.987');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (887,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:54:40.253','admin','超级管理员','2019-05-13 14:54:40.253');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (888,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','<zone>','admin','超级管理员','2019-05-13 14:54:40.257','admin','超级管理员','2019-05-13 14:54:40.257');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (889,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','ZONE-0','admin','超级管理员','2019-05-13 14:54:40.260','admin','超级管理员','2019-05-13 14:54:40.260');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (890,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','</zone>','admin','超级管理员','2019-05-13 14:54:40.263','admin','超级管理员','2019-05-13 14:54:40.263');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (891,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:54:40.267','admin','超级管理员','2019-05-13 14:54:40.267');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (892,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','<zone>','admin','超级管理员','2019-05-13 14:54:40.270','admin','超级管理员','2019-05-13 14:54:40.270');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (893,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','ZONE-1','admin','超级管理员','2019-05-13 14:54:40.277','admin','超级管理员','2019-05-13 14:54:40.277');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (894,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','</zone>','admin','超级管理员','2019-05-13 14:54:40.280','admin','超级管理员','2019-05-13 14:54:40.280');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (895,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:54:40.280','admin','超级管理员','2019-05-13 14:54:40.280');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (896,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','<zone>','admin','超级管理员','2019-05-13 14:54:40.283','admin','超级管理员','2019-05-13 14:54:40.283');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (897,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','ZONE-2','admin','超级管理员','2019-05-13 14:54:40.293','admin','超级管理员','2019-05-13 14:54:40.293');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (898,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','</zone>','admin','超级管理员','2019-05-13 14:54:40.297','admin','超级管理员','2019-05-13 14:54:40.297');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (899,'cdd02cb5c11d49d690ae618c14843944','69a963d751274e73a4bb879efdc18b19','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:54:40.297','admin','超级管理员','2019-05-13 14:54:40.297');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (900,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:55:07.247','admin','超级管理员','2019-05-13 14:55:07.247');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (901,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','<zone>','admin','超级管理员','2019-05-13 14:55:07.250','admin','超级管理员','2019-05-13 14:55:07.250');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (902,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','ZONE-0','admin','超级管理员','2019-05-13 14:55:07.257','admin','超级管理员','2019-05-13 14:55:07.257');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (903,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','</zone>','admin','超级管理员','2019-05-13 14:55:07.267','admin','超级管理员','2019-05-13 14:55:07.267');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (904,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:55:07.267','admin','超级管理员','2019-05-13 14:55:07.267');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (905,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','<zone>','admin','超级管理员','2019-05-13 14:55:07.270','admin','超级管理员','2019-05-13 14:55:07.270');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (906,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','ZONE-1','admin','超级管理员','2019-05-13 14:55:07.277','admin','超级管理员','2019-05-13 14:55:07.277');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (907,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','</zone>','admin','超级管理员','2019-05-13 14:55:07.283','admin','超级管理员','2019-05-13 14:55:07.283');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (908,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 14:55:07.287','admin','超级管理员','2019-05-13 14:55:07.287');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (909,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','<zone>','admin','超级管理员','2019-05-13 14:55:07.293','admin','超级管理员','2019-05-13 14:55:07.293');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (910,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','ZONE-2','admin','超级管理员','2019-05-13 14:55:07.297','admin','超级管理员','2019-05-13 14:55:07.297');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (911,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','</zone>','admin','超级管理员','2019-05-13 14:55:07.297','admin','超级管理员','2019-05-13 14:55:07.297');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (912,'cdd02cb5c11d49d690ae618c14843944','6b0de27b1a5c4b42b2365ac9e2587bb3','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 14:55:07.303','admin','超级管理员','2019-05-13 14:55:07.303');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (913,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 15:28:45.070','admin','超级管理员','2019-05-13 15:28:45.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (914,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','<zone>','admin','超级管理员','2019-05-13 15:28:45.100','admin','超级管理员','2019-05-13 15:28:45.100');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (915,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','ZONE-0','admin','超级管理员','2019-05-13 15:28:45.107','admin','超级管理员','2019-05-13 15:28:45.107');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (916,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','</zone>','admin','超级管理员','2019-05-13 15:28:45.110','admin','超级管理员','2019-05-13 15:28:45.110');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (917,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 15:28:45.113','admin','超级管理员','2019-05-13 15:28:45.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (918,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','<zone>','admin','超级管理员','2019-05-13 15:28:45.117','admin','超级管理员','2019-05-13 15:28:45.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (919,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','ZONE-1','admin','超级管理员','2019-05-13 15:28:45.117','admin','超级管理员','2019-05-13 15:28:45.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (920,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','</zone>','admin','超级管理员','2019-05-13 15:28:45.120','admin','超级管理员','2019-05-13 15:28:45.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (921,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 15:28:45.123','admin','超级管理员','2019-05-13 15:28:45.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (922,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','<zone>','admin','超级管理员','2019-05-13 15:28:45.127','admin','超级管理员','2019-05-13 15:28:45.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (923,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','ZONE-2','admin','超级管理员','2019-05-13 15:28:45.127','admin','超级管理员','2019-05-13 15:28:45.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (924,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','</zone>','admin','超级管理员','2019-05-13 15:28:45.130','admin','超级管理员','2019-05-13 15:28:45.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (925,'cdd02cb5c11d49d690ae618c14843944','d23b2e22068942a79ef9b437e0b70940','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 15:28:45.133','admin','超级管理员','2019-05-13 15:28:45.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (926,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','<div class="container-fluid main custom-style" style="background:met-navfixed;">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 15:29:28.677','admin','超级管理员','2019-05-13 15:29:28.677');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (927,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','<zone>','admin','超级管理员','2019-05-13 15:29:28.680','admin','超级管理员','2019-05-13 15:29:28.680');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (928,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','ZONE-0','admin','超级管理员','2019-05-13 15:29:28.683','admin','超级管理员','2019-05-13 15:29:28.683');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (929,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','</zone>','admin','超级管理员','2019-05-13 15:29:28.687','admin','超级管理员','2019-05-13 15:29:28.687');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (930,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="main custom-style container-fluid">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 15:29:28.690','admin','超级管理员','2019-05-13 15:29:28.690');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (931,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','<zone>','admin','超级管理员','2019-05-13 15:29:28.693','admin','超级管理员','2019-05-13 15:29:28.693');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (932,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','ZONE-1','admin','超级管理员','2019-05-13 15:29:28.697','admin','超级管理员','2019-05-13 15:29:28.697');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (933,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','</zone>','admin','超级管理员','2019-05-13 15:29:28.697','admin','超级管理员','2019-05-13 15:29:28.697');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (934,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">','admin','超级管理员','2019-05-13 15:29:28.700','admin','超级管理员','2019-05-13 15:29:28.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (935,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','<zone>','admin','超级管理员','2019-05-13 15:29:28.703','admin','超级管理员','2019-05-13 15:29:28.703');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (936,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','ZONE-2','admin','超级管理员','2019-05-13 15:29:28.707','admin','超级管理员','2019-05-13 15:29:28.707');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (937,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','</zone>','admin','超级管理员','2019-05-13 15:29:28.707','admin','超级管理员','2019-05-13 15:29:28.707');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (938,'cdd02cb5c11d49d690ae618c14843944','6006398d08e04b82a9f9666407859684','</div>
                </div>
            </div>
        </div>
    </div>','admin','超级管理员','2019-05-13 15:29:28.710','admin','超级管理员','2019-05-13 15:29:28.710');
INSERT INTO [CarouselWidget] ([ID],[CarouselID]) VALUES ('02e0d630819e4ca29f812f1afc046b0c',NULL);
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (17,NULL,0,'02e0d630819e4ca29f812f1afc046b0c',NULL,'/UpLoad/Images/201905/6eac0d3b0a58437d9d120c9600c14ecd.jpg',NULL,1,'admin','ZKEASOFT','2019-05-11 09:26:36.817','admin','ZKEASOFT','2019-05-11 09:26:36.817');
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (18,NULL,0,'02e0d630819e4ca29f812f1afc046b0c',NULL,'/UpLoad/Images/201905/faabe837779247d4999dbe11dea88f75.jpg',NULL,1,'admin','ZKEASOFT','2019-05-11 09:26:36.817','admin','ZKEASOFT','2019-05-11 09:26:36.817');
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('4f943b840ea6417c8c85be14f4d8867a',1,NULL);
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('b7e2b6322ef746ecb30b8cd70fe66dd0',1,NULL);
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('eff531d98c4c4e3199dd1ee5b73f18df',1,NULL);
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'新闻中心',NULL,0,'news',1,'新闻中心','新闻中心','新闻中心','admin','ZKEASOFT','2019-05-11 08:57:12.537','admin','ZKEASOFT','2019-05-11 08:57:12.537');
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'甜品','甜品',1,'tianpin',1,'甜品','甜品','甜品','admin','ZKEASOFT','2019-05-11 08:57:52.333','admin','ZKEASOFT','2019-05-11 08:57:52.333');
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'蛋糕','蛋糕',1,'dangao',1,'蛋糕','蛋糕','蛋糕','admin','ZKEASOFT','2019-05-11 08:59:47.100','admin','ZKEASOFT','2019-05-11 08:59:47.100');
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'招商加盟','招商加盟',0,'join',1,'招商加盟','招商加盟','招商加盟','admin','ZKEASOFT','2019-05-11 22:17:25.407','admin','ZKEASOFT','2019-05-11 22:17:25.407');
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,'关于我们','关于我们',0,'about',1,'关于我们','关于我们','关于我们','admin','超级管理员','2019-05-11 23:22:44.463','admin','超级管理员','2019-05-11 23:22:44.463');
INSERT INTO [ArticleSpecialDetailWidget] ([ID],[ArticleId],[ArticleName]) VALUES ('4f9115b422b6416f80c64d57c310a4c5',NULL,'aboutus');
INSERT INTO [ArticleSpecialDetailWidget] ([ID],[ArticleId],[ArticleName]) VALUES ('5de5861efaaa4696ba16151bd55420c2',NULL,'zhichi');
INSERT INTO [ArticleSpecialDetailWidget] ([ID],[ArticleId],[ArticleName]) VALUES ('810d75bb5bcd4f208b0193b7e62e5caa',NULL,'zhichi');
INSERT INTO [ArticleSpecialDetailWidget] ([ID],[ArticleId],[ArticleName]) VALUES ('8b50ce8fa65a41d3a4eccac470b0a1aa',NULL,'aboutus');
INSERT INTO [ArticleSpecialDetailWidget] ([ID],[ArticleId],[ArticleName]) VALUES ('91566d5418954867b8e000cbbbf9e198',NULL,'aboutus');
INSERT INTO [ArticleSpecialDetailWidget] ([ID],[ArticleId],[ArticleName]) VALUES ('b7f1e260d47f4dd6b0e26006b285e083',NULL,'aboutus');
INSERT INTO [ArticleSpecialDetailWidget] ([ID],[ArticleId],[ArticleName]) VALUES ('c4232a66ee894f158d8c5335d78b927d',NULL,'zhichi');
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('280a7e2c3ce84c6f98f9fc38852b23fb',1,'~/news/detail',1,3);
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('3f910eef01b049e9b2ccc3f91c2364c9',1,'~/news/detail',1,3);
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('d4ed8de9354e4ccdb41eb13d0c2fe45e',1,'~/news/detail',1,3);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('235996c84a994f018936b0cdc89f7eb0',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('45d793590e9b46aabf7a9930098f9ed1',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('5d0eee3a2e1b4df397d821a998ccf6a2',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('85eb0804b9954351adc41d3538088b25',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('963af67d7aaa4cd49f216bf4c21d1420',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('a339b704712f462881493f577fce31f2',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('c157885b508f4beaa2511428921c8a11',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('ceb27f6d9b8c4a448a857cf28f030b1e',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('f75c371cc5574e0f883469ebec7df694',NULL);
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'2019年港式甜品加盟加盟都会走多元化道路吗？','现在有越来越多的港式甜品店采用了多元化产品策略，不仅是为了增加店铺的利润，更多是为了开拓新的顾客群，对于现在消费者需求多变，多元化的甜品市场，从长远来说，做出这些改变，港式甜品店的号召力也会更强，那么港式甜品加盟店如何更好地运用多元化产品策略呢？综合品牌经营定位奶茶店在采取多元化产品策略时，一定要结合自己品牌定位，增加的产品必须符合奶茶品牌，服务体验与产品相匹配，以及拥有足够的资本延伸新品类，例如',NULL,NULL,11,2,NULL,'<p>现在有越来越多的港式甜品店采用了多元化产品策略，不仅是为了增加店铺的利润，更多是为了开拓新的顾客群，对于现在消费者需求多变，多元化的甜品市场，从长远来说，做出这些改变，港式甜品店的号召力也会更强，那么港式甜品加盟店如何更好地运用多元化产品策略呢？</p>
<p>综合品牌经营定位</p>
<p>奶茶店在采取多元化产品策略时，一定要结合自己品牌定位，增加的产品必须符合奶茶品牌，服务体验与产品相匹配，以及拥有足够的资本延伸新品类，例如茶邦，不仅提供奶茶，还为消费者提供一个休闲的社交互动地方，类似的，因此增加新的品类可以吸引更多非奶茶消费者，占据更多的非奶茶消费时段，因此蛋糕店推出怀旧粤式甜品系列，为消费者提供下午茶的时间，虽然增加了品类，但在特定时段供应就显得不会太违和。</p>
<p>顾客体验与产品相匹配</p>
<p>许多港式甜品加盟店只顾着盲目推出新品，却忘了在服务上花点心思，事实上推出新品会让甜品店的程序和环节变得更加复杂，环节越越多容易造成差错，如果服务体验没法跟上产品更新的速度，会让顾客对甜品店的品牌形象产生负面评价。</p>
<p>充足的资金链</p>
<p>由于房租的上涨，高房租，高人工，导致大多数的港式甜品加盟店试错的机会更少，如果投入成本最后市场反映和效果不佳的话，整个天皮吗店都会蒙受损失，因此在采取多元化产品策略之前，经营者当充分考虑风险和试错成本。</p>
<p>蛋糕店品牌背靠广州餐饮管理有限公司，拥有多个品牌和专业的甜品口味研发团队，在试错成本上为创业者规避了很多的风险，当奶茶逐渐被消费者认可，此时加盟商再来开实体店就会相对容易，并且没有后续的策划烦恼。</p>
<p>以上便是港式甜品加盟店运用多元化营销策略时会注意的几点了，蛋糕店一直坚持贯彻多元化和专业化齐驱并进，并且在甜品口味创新的研发道路上，也会越来越专业，如果你在这方面还有什么疑惑的话，欢迎联系我们哦。</p>',1,NULL,NULL,1,'2019-05-11 09:04:06.613',NULL,'admin','ZKEASOFT','2019-05-11 09:03:59.000','admin','ZKEASOFT','2019-05-11 09:04:06.617');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'为什么港式甜品加盟店蜜月期这么短？原来原因在这里！','在日常生活中，我们不难发现无论是小区还是办公区，抑或是商业区，在这种人群比较集中地方，如果开起了一家港式甜品加盟店，一旦其生意红火起来，便会迅速引来无数跟风者相继开店，不过多少时日我们会发现最后只剩下一家店，即最先开业的店，其它的港式甜品店为什么做不长久?下面我们一起来分析一下吧。伪商圈+盲目跟风很多甜品加盟店在选址的时候总是喜欢跟风，认为开在繁华热闹的区域，营业收入也应当非常乐观，事实上，开港式',NULL,NULL,57,2,NULL,'<p>在日常生活中，我们不难发现无论是小区还是办公区，抑或是商业区，在这种人群比较集中地方，如果开起了一家港式甜品加盟店，一旦其生意红火起来，便会迅速引来无数跟风者相继开店，不过多少时日我们会发现最后只剩下一家店，即最先开业的店，其它的港式甜品店为什么做不长久?下面我们一起来分析一下吧。</p>
<p>伪商圈+盲目跟风</p>
<p>很多甜品加盟店在选址的时候总是喜欢跟风，认为开在繁华热闹的区域，营业收入也应当非常乐观，事实上，开港式甜品加盟店，在商圈选择的标准上，一方面要考虑商圈的稳定度和成熟度，另一方面要考虑港式甜品加盟店自身的市场定位，一个商圈有没有主要聚客点是这个商圈成熟度的重要标志：大型商业购物中心，商业圈已经往往自带客流量，人群定位已十分明朗，因此港式甜品加店在选择的时候，一定要考虑该商圈的消费群体特征，包括年龄段，性别，收入等等。</p>
<p>比如蛋糕店的选址，就十分看重商圈出口和三岔路口这两个位置，于是蛋糕店会以目标客群为标准再在此基础上进行选址，一定会先定位，再确定地址，这样才能圈住自己的客群。</p>
<p>盲目定位开店，错失先机</p>
<p>《孙子兵法》中说，&ldquo;凡先处战地而待敌者佚，后处战地而趋战者劳&rdquo;。即凡是先到战场等待敌人的，就从容、主动，而后到达战场的只能仓促应战，一定会疲劳、被动，因此，善于指挥作战的人，总是调动敌人，而不是被敌人调动。</p>
<p>港式甜品加盟店抢占商机</p>
<p>开港式甜品加盟店也是如此，小区或者大型商圈中的客流量稳定，消费群固定，市场需求量接近饱和，如果抢占到先机，开店生意便会如火如荼，若此时港式甜品加盟店再盲目跟风选择开店，会导致的结果便是市场饱和度过剩，所以港式甜品加盟店选址一定要先下手为强，这样可以获得一定优势，抢先占据客流量，当然前提是港式甜品加盟店要洞察出该区域是否是真正的&ldquo;商圈&rdquo;。</p>
<p>以上便是港式甜品加盟店跟风开店做不长久的原因了，其实这种情况非常多见，但是也不是绝对，开店就有博弈，而博弈产生的结果不一定就只是两败俱伤，也有可能是双赢，当然这种情况必须得有两个品牌的相对联合，如果没有这样的机会，还是不能贸然开店。</p>',1,NULL,NULL,1,'2019-05-11 13:33:18.597',NULL,'admin','ZKEASOFT','2019-05-11 09:05:28.000','admin','ZKEASOFT','2019-05-11 13:33:18.597');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'生活如此多娇,蛋糕店伴随着您','生活总是与美食二字如影随形，每个城市都有自己的style，承载的不单单是多方地区融合的人文风情，所更能体现在饮食方面，各色风味独特的甜品美食便由此诞生。中国人的饮食文化不是用舌品尝那么简单，更多是关乎所处于场所与当时的心态。一个城市的style，很难于直观去判断繁华与否，可能还要加上一道甜点—杏记港式甜品，是否会入得你心。随着社会经济的发展，越来越多的港式甜品店出现在大家的生活中，这也为大家的生活',NULL,NULL,110,3,NULL,'<p>生活总是与美食二字如影随形，每个城市都有自己的style，承载的不单单是多方地区融合的人文风情，所更能体现在饮食方面，各色风味独特的甜品美食便由此诞生。中国人的饮食文化不是用舌品尝那么简单，更多是关乎所处于场所与当时的心态。一个城市的style，很难于直观去判断繁华与否，可能还要加上一道甜点&mdash;杏记港式甜品，是否会入得你心。</p>
<p>随着社会经济的发展，越来越多的港式甜品店出现在大家的生活中，这也为大家的生活带来了非常多的改变。比如大家可以足不出户就能品尝到多种口味甜点，甚至只是在一个地方，大家就可以品尝到香港的甜品，这为大家的生活带来了非常多的便利，也更好地丰富了大家的味蕾。现在的港式甜品店是非常受大家欢迎的，市面上也出现了各种各样的港式甜品店，只要经营方法得当，这些甜品店基本上都会为投资者带来非常大的回报。</p>
<p>如果你也想要经营一家港式甜品店，想要将这家店经营好，大家不妨前来了解一下蛋糕店这个项目。蛋糕店是一个专门制作港式甜品的品牌，主要推出的就是各类口味甜点，有经典的粤式甜品，还有冷热交替的糖水，时尚饮品、糕点之类的美食更是应有尽有，每一份都有好口味，还有众多的甜品饮品可以供消费者进行选择。</p>
<p>经营蛋糕店是一件非常轻松的事，因为蛋糕店推出的产品都有很好的口味，而且种类丰富、花样繁多，价格还十分公道。在正式开店营业之前，蛋糕店总部还会为投资者提供全方位的助力帮扶，从开店选址到店铺装修，再到技术的培训、运营经验的传授，蛋糕店总部都会派专业的人士前来帮助大家。</p>',1,NULL,NULL,1,'2019-05-11 13:33:35.670',NULL,'admin','ZKEASOFT','2019-05-11 09:30:51.000','admin','ZKEASOFT','2019-05-11 13:33:35.670');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'想开港式甜品加盟店？让蛋糕店助你一臂之力！','现如今，甜品效益吸引了无数餐饮人前仆后继，小编身边也有一个朋友，跟风开了一家港式甜品加盟店，但是没多久就关店了，后来他又开了一家，从之前的失败经验中也渐渐摸索出一些套路，这里小编整理了他的经验之谈，整理了几点经营之道，希望给正想开港式甜品加盟店的同行一些启示。港式甜品口味的多样化开港式甜品加盟店，要开什么类型的港式甜品店才更合适呢?其实，要搞清楚什么才叫港式甜品加盟店，就是使用优质原料制作各种甜点',NULL,'现如今，甜品效益吸引了无数餐饮人前仆后继，小编身边也有一个朋友，跟风开了一家港式甜品加盟店，但是没多久就关店了，后来他又开了一家，从之前的失败经验中也渐渐摸索出一些套路，这里小编整理了他的经验之谈，整理了几点经营之道，希望给正想开港式甜品加盟店的同行一些启示。港式甜品口味的多样化开港式甜品加盟店，要开什么类型的港式甜品店才更合适呢?其实，要搞清楚什么才叫港式甜品加盟店，就是使用优质原料制作各种甜点',6,3,NULL,'<p>现如今，甜品效益吸引了无数餐饮人前仆后继，小编身边也有一个朋友，跟风开了一家港式甜品加盟店，但是没多久就关店了，后来他又开了一家，从之前的失败经验中也渐渐摸索出一些套路，这里小编整理了他的经验之谈，整理了几点经营之道，希望给正想开港式甜品加盟店的同行一些启示。</p>
<p>港式甜品口味的多样化</p>
<p>开港式甜品加盟店，要开什么类型的港式甜品店才更合适呢?其实，要搞清楚什么才叫港式甜品加盟店，就是使用优质原料制作各种甜点，因此对甜点做工以及材料的质量有着较高的要求。口味丰富的港式甜品消费者更容易接受，因此是开甜品店的首选品类。鲜榨水果汁和鲜牛奶类甜点的港式甜品店，如果没有成熟的供应链以及灵活的损耗管理，还是不要开为好。</p>
<p>合理的港式甜品价格定位划分</p>
<p>小编的朋友说，目前市面上接受程度较高的，一般都是中低端价位更受欢迎，10元-20元左右的消费价位占据了主力市场，30元以上的价位接受力明显下降，说明消费者对甜品产品的价格容错区间不高，更愿意花较低的成本去尝鲜。大部分港式甜品加盟店也都选择了20左右最安全的客单区间，靠适中的价格和甜品的外型吸引消费者。</p>
<p>结合营销理论配合店铺经营</p>
<p>不少港式甜品店的老板们在保证产品的前提，打着&ldquo;颜值即正义&rdquo;的旗号，让年轻消费群体为&ldquo;外貌协会&rdquo;买单，最近大火的抖音，许多港式甜品加盟的都通过解锁自己店的&ldquo;隐藏菜单&rdquo;把自己店的甜品一次次推上热门，除了产品本身之外，就连门店的装潢、格局、整体营造的气氛都要符合港式甜品加盟店的气质，各种潮流元素都是港式甜品加盟店的必备装修风格。</p>
<p>以上就是开一家港式甜品加盟店要比较注意的几个点了，是不是觉得开一家甜品店其实是挺有风险的?其实开奶茶店不一定非要开港式甜品加盟店，通过不断的口碑积累和市场运营出来的中高端甜品店&mdash;&mdash;蛋糕店加盟店也是一个不错的选择，并且风险更小，让你开店无忧。</p>',1,NULL,NULL,1,'2019-05-11 13:35:41.523',NULL,'admin','ZKEASOFT','2019-05-11 13:35:41.527','admin','ZKEASOFT','2019-05-11 13:35:41.527');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,'港式甜品店学会这套“撩客”技能，利润还能再涨涨!','相信很多追过剧的朋友们都知道，剧中带着主角光环的“美男”撩起妹来是一套一套的，他们不仅会说话，在行动上也给人耳目一新的感觉，现在开港式甜品店也是一样，做甜品“撩”顾客，港式甜品店不再铺天盖地的进行自嗨式宣传，而是经过背后一系列“计谋”达成，下面就由蛋糕店来给大家分享几招甜品店的撩客技能!胸有成竹，却装作漫不经心如今，超低折扣和酷炫的营销活动满天飞，每家港式甜品店恨不得在店门口放一块展板，写上港式甜',NULL,'相信很多追过剧的朋友们都知道，剧中带着主角光环的“美男”撩起妹来是一套一套的，他们不仅会说话，在行动上也给人耳目一新的感觉，现在开港式甜品店也是一样，做甜品“撩”顾客，港式甜品店不再铺天盖地的进行自嗨式宣传，而是经过背后一系列“计谋”达成，下面就由蛋糕店来给大家分享几招甜品店的撩客技能!胸有成竹，却装作漫不经心如今，超低折扣和酷炫的营销活动满天飞，每家港式甜品店恨不得在店门口放一块展板，写上港式甜',3,2,NULL,'<p>相信很多追过剧的朋友们都知道，剧中带着主角光环的&ldquo;美男&rdquo;撩起妹来是一套一套的，他们不仅会说话，在行动上也给人耳目一新的感觉，现在开港式甜品店也是一样，做甜品&ldquo;撩&rdquo;顾客，港式甜品店不再铺天盖地的进行自嗨式宣传，而是经过背后一系列&ldquo;计谋&rdquo;达成，下面就由蛋糕店来给大家分享几招甜品店的撩客技能!</p>
<p>胸有成竹，却装作漫不经心</p>
<p>如今，超低折扣和酷炫的营销活动满天飞，每家港式甜品店恨不得在店门口放一块展板，写上港式甜品店的所有特色和优惠，以此吸引消费者。然而，消费者早已对此感到麻木，有的时候，意外的惊喜反而能带来独特的感受。</p>
<p>前段时间蛋糕店就另辟蹊径，事先港式甜品店门口以及网上并没有说明有关港式甜品店的任何活动，而是在等待顾客买完港式甜品时，送上一份免费的蛋糕店定制公仔，这样一个小小的细节给人意外惊喜，同时让消费者有种&ldquo;今天好幸运，突然占了便宜&rdquo;感觉。再加上惊喜是消费者即将离开时所获得，更能加深对品牌甜品店的好感，利用&ldquo;反差&rdquo;制造独一无二的效果，也更容易让顾客帮帮助店铺主动宣传。</p>
<p>节假日活动反其道而行之</p>
<p>许多港式甜品店都会在节假日推出一些特价港式甜品产品，在价格上追求带给消费者一种视觉冲击感。节假日大家都在搞活动，那你的港式甜品店怎么脱颖而出，搏得眼球?反其道行之是最好的方法，今年七夕情人节，当许多港式甜品店都在搞牵手接吻活动的时候，蛋糕店却搞了一个单身活动，所有单身狗前来蛋糕店购买港式甜品的，一律五折!这样的行为立刻吸引了广大的单身男女男青年，在营销上也有了非常良好的效果。</p>
<p>陪伴是最深情的告白</p>
<p>想要留住消费者，将消费者转化成为自己的忠实粉丝，就少不了港式甜品店日久天长的陪伴和问候。蛋糕店在开业初期便着力打造会员系统，当粉丝达到一定量时，会员系统作用也就凸显出来：根据会员系统里的分级功能，分析会员年龄19岁~38岁占比，不同星座会员的占比，针对会员做营销，在会员生日送上祝福等等，这样的区别对待，令消费者产生&ldquo;我很特别&rdquo;的感受，同时节假日的问候祝福也代表了港式甜品店的一种用心。</p>
<p>以上便是蛋糕店如何使用&ldquo;撩妹客能&rdquo;的一些建议了，相信你看完一定也有所收获！</p>',1,NULL,NULL,1,'2019-05-11 13:37:32.323',NULL,'admin','ZKEASOFT','2019-05-11 13:37:32.323','admin','ZKEASOFT','2019-05-11 13:37:32.323');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,'同样是加盟，港式甜品最热门，蛋糕店甜品无人可模仿','开一家属于自己的港式甜品加盟店，如今成为大多数投资者喜爱的一种创业项目，对一些零经验的创业者来讲加盟一家港式甜品品牌已经成为了一种潮流，但有一些港式甜品加盟店的收益并不是很高，并不是说所有的加盟店都能挣到钱，一家港式甜品加盟店铺要想发展的更好，一方面要更好的适应市场、时代的发展，另一方面可以更好的吸引、留住消费者。那么港式甜品加盟店在发展的时候，要想能尽快到达盈利期应该掌握哪些方法呢？下面就来一起',NULL,'开一家属于自己的港式甜品加盟店，如今成为大多数投资者喜爱的一种创业项目，对一些零经验的创业者来讲加盟一家港式甜品品牌已经成为了一种潮流，但有一些港式甜品加盟店的收益并不是很高，并不是说所有的加盟店都能挣到钱，一家港式甜品加盟店铺要想发展的更好，一方面要更好的适应市场、时代的发展，另一方面可以更好的吸引、留住消费者。那么港式甜品加盟店在发展的时候，要想能尽快到达盈利期应该掌握哪些方法呢？下面就来一起',81,2,NULL,'<p>开一家属于自己的港式甜品加盟店，如今成为大多数投资者喜爱的一种创业项目，对一些零经验的创业者来讲加盟一家港式甜品品牌已经成为了一种潮流，但有一些港式甜品加盟店的收益并不是很高，并不是说所有的加盟店都能挣到钱，一家港式甜品加盟店铺要想发展的更好，一方面要更好的适应市场、时代的发展，另一方面可以更好的吸引、留住消费者。那么港式甜品加盟店在发展的时候，要想能尽快到达盈利期应该掌握哪些方法呢？下面就来一起讨论一下吧！</p>
<p>首先作为一家港式甜品加盟店的经营者，要关注产品结构。港式甜品加盟店在经营的过程中，如果能够拥有良好的产品结构，那么不仅可以促使消费者进行消费，同时也有利于店铺营业额的提升以及盈利。</p>
<p>其次就是要我们去关注港式甜品加盟店的服务档次。在不同的时代中，消费者对于产品的要求以及服务的要求都是不同的，店铺只有根据时代的发展调整服务和产品，这样才能更好的确保自身不会被市场所淘汰。需要明白的是：虽然服务的档次可能需要调整，但这并不是代表服务的质量要下降。</p>
<p>我们要想自己的港式甜品加盟店提高回报率，那就要想办法来吸引更多的消费者来关注我们的店铺。店铺在节假日和周末时，进行多种样式的促销活动是很重要的，我们店铺活动做的很好的话，可以提高我们店铺的销量不说，还能进一步的扩大我们港式甜品品牌的影响力，对我们店铺扩大占有率是有很大帮助的。</p>
<p>除此之外，我们在经营港式甜品加盟店铺时，还要揣摩消费者的内心想法，站在消费者的角度去思考问题。根据消费者对港式甜品种类和口味的不同，我们要把自己想象成一个消费者去经营我们的店铺，想象一下我们要是他会选择什么样的港式甜品，这种方式对提高我们店铺的回报率也是有促进效果的。</p>
<p>在经营港式甜品加盟店的过程中，要做的事情是不少的，无论是采用什么样的方法让自己的港式甜品加盟店变得更好，都要选择适合自己、合理的方法，这样才能促进店铺的长远发展。</p>
<p></p>',1,NULL,NULL,1,'2019-05-11 13:38:24.217',NULL,'admin','ZKEASOFT','2019-05-11 13:38:24.217','admin','ZKEASOFT','2019-05-11 13:38:24.217');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,'圣诞节港式甜品加盟指南| 加盟蛋糕店更幸福！','人人都爱圣诞节，它在冬天给人带来温暖梦幻，街头的橱窗、街角的圣诞树、店里的圣诞音乐、所有的圣诞装饰都预示着圣诞节的来临，那种美妙的气氛，让人沉浸在幸福中。而对于美食有着执的吃货们，圣诞节怎么能少了港式甜品呢？平安夜亲朋好友在圣诞树旁，享受着甜品的“熏陶”，是再美好不过的事情，另外，就像中秋节我们一定会吃月饼一样，国外圣诞节人们一定会自制甜品，没有甜点就不叫过圣诞。甜品作为人们的心情调节剂，据调查统',NULL,'人人都爱圣诞节，它在冬天给人带来温暖梦幻，街头的橱窗、街角的圣诞树、店里的圣诞音乐、所有的圣诞装饰都预示着圣诞节的来临，那种美妙的气氛，让人沉浸在幸福中。而对于美食有着执的吃货们，圣诞节怎么能少了港式甜品呢？平安夜亲朋好友在圣诞树旁，享受着甜品的“熏陶”，是再美好不过的事情，另外，就像中秋节我们一定会吃月饼一样，国外圣诞节人们一定会自制甜品，没有甜点就不叫过圣诞。甜品作为人们的心情调节剂，据调查统',4,2,NULL,'<p>人人都爱圣诞节，它在冬天给人带来温暖梦幻，街头的橱窗、街角的圣诞树、店里的圣诞音乐、所有的圣诞装饰都预示着圣诞节的来临，那种美妙的气氛，让人沉浸在幸福中。而对于美食有着执的吃货们，圣诞节怎么能少了港式甜品呢？平安夜亲朋好友在圣诞树旁，享受着甜品的&ldquo;熏陶&rdquo;，是再美好不过的事情，另外，就像中秋节我们一定会吃月饼一样，国外圣诞节人们一定会自制甜品，没有甜点就不叫过圣诞。</p>
<p>甜品作为人们的心情调节剂，据调查统计表明摄入适量的甜食会让人感受到幸福感，不过对于甜食的摄入，要适当的控制，可以少量食用甜品，过度食用甜品会诱发身体疾病。美食市场上有很多港式甜品店，很多创业者都想抓住年尾加盟开店的好时机，想要经营一家甜品加盟店，投资加盟者需要做哪些准备呢？在众多港式甜品加盟品牌中如何选择合适的项目？</p>
<p>众多餐饮投资加盟者面对市场琳琅满目的甜品类加盟连锁品牌，选择项目时更是需谨慎，充分的市场调查是必不可少的。那么到底要从哪些方面来分析所心仪港式甜品加盟品牌项目的市场价值呢？港式甜品行业中的品牌多，开店不仅要为店铺的日常运营精打细算，还需要分析甜品加盟行业的发展动向，消费者的需求是什么?</p>
<p>想加盟港式甜品加盟店就先要了解清楚，处于季节性的变化，不同年龄层次的消费者对于甜品口味是否有了新的口味需求，并且甜品追求都不止是味道，还有店铺的设计是否给予到店消费者美观舒适的感觉。</p>
<p>蛋糕店属于小资范十足的餐厅，融合时尚的店铺设计，以粤式甜品系列、冷热糖水系列、西式甜品甜点烘焙系列、杏情甜品系列为主打产品菜单、时尚饮品为辅。现在国内甜品市场正处于新生阶段，市场前景广阔，尤其伴随着人们日常生活消费水平提高，消费者对于港式甜品的需求近两年飞速增长，一个全新的市场正在迅速崛起！蛋糕店系列多样，健康营养，老少皆宜。</p>
<p></p>',1,NULL,NULL,1,'2019-05-11 13:39:22.237',NULL,'admin','ZKEASOFT','2019-05-11 13:39:22.237','admin','ZKEASOFT','2019-05-11 13:39:22.237');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (8,'港式甜品的密码！加盟我们，瞬间就变高大上','没有世俗的浮沉，也无历程的艰难，心境却如港式甜品般清香，细腻，只为你悄悄地散发着一缕缕幽香，期待你能来品尝。抛开世俗杂事，你我相遇相识不易，一份牵挂来自远方问候，一份率真来自友心祝福，让彼此敞开心门，用平淡去面对人生历程，用知心去留念当初相遇的场景，愿蛋糕店的初心跨越千山万水，去拥抱你的心门，带给你每天明媚的阳光和雨露。我心若杏记甜品，需君慢慢品尝。现如今在大大小小的城市里面，蛋糕加盟店随处可见',NULL,'没有世俗的浮沉，也无历程的艰难，心境却如港式甜品般清香，细腻，只为你悄悄地散发着一缕缕幽香，期待你能来品尝。抛开世俗杂事，你我相遇相识不易，一份牵挂来自远方问候，一份率真来自友心祝福，让彼此敞开心门，用平淡去面对人生历程，用知心去留念当初相遇的场景，愿蛋糕店的初心跨越千山万水，去拥抱你的心门，带给你每天明媚的阳光和雨露。我心若杏记甜品，需君慢慢品尝。现如今在大大小小的城市里面，蛋糕加盟店随处可见',92,3,NULL,'<p>没有世俗的浮沉，也无历程的艰难，心境却如港式甜品般清香，细腻，只为你悄悄地散发着一缕缕幽香，期待你能来品尝。抛开世俗杂事，你我相遇相识不易，一份牵挂来自远方问候，一份率真来自友心祝福，让彼此敞开心门，用平淡去面对人生历程，用知心去留念当初相遇的场景，愿蛋糕店的初心跨越千山万水，去拥抱你的心门，带给你每天明媚的阳光和雨露。我心若杏记甜品，需君慢慢品尝。</p>
<p>现如今在大大小小的城市里面，蛋糕加盟店随处可见，各个角落都有港式甜品店的影子。对于消费者来说，这体现了生活质量的提升，但对于创业者来说这却是一种商机。</p>
<p>可能会有很多意向投资加盟征想，如果我要开一家甜品店，是不是学会了甜品制作技术就可以了呢？其实就蛋糕店的了解而言，甜品不同于一般的餐饮，这一类型的项目加盟比自己开店更有优势。甜品的制作技术属于技术性知识，对店铺整体运营帮助不大，如果自己创业，可能会在很多方面的决策上走入误区。而加盟一个港式甜品品牌的话，就能在各方面得到专业的支持。</p>
<p>另外，因为港式甜品并不是很好携带，所以甜品的购买者一般都会选择&ldquo;堂食&rdquo;，大家在选址的时候也应该注意面积的问题。门店规模太小，容客量少会导致流失潜在顾客，影响销售额；规模太大，空余过多又会增加开店成本。</p>
<p>我们试想一下，仅仅只凭一时兴起的投资创业者，又如何能够在很短的时间内让甜品店铺知名度迅速曝光，通过到店消费的顾客全面地分析&ldquo;口味需求&rdquo;，调整港式甜品口味定位从而得出合理的结论呢?所以，一个专业的加盟品牌，它的产品定位必然是多年经验沉淀的结果，而且经过了市场检验，创业者与之合作，可以少走很多弯路。</p>
<p>对于有港式甜品加盟店想法的，蛋糕店建议大家先做好充分的市场调查，并要持有服务意识的态度经营店铺，毕竟罗马也不是一天就能形成的。现如今甜品店在餐饮市场中占有率很高，蛋糕店加盟店在经营情况理想的情况下不到一年即可收回成本，大家不妨结合自身情况考虑一下。</p>',1,NULL,NULL,1,'2019-05-11 13:40:25.107',NULL,'admin','ZKEASOFT','2019-05-11 13:40:25.107','admin','ZKEASOFT','2019-05-11 13:40:25.107');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (9,'加盟支持',NULL,NULL,NULL,24,4,NULL,'<p><strong>意向加盟阶段：</strong></p>
<p>⑴公司将为您做行业分析，经营答疑，同时也将根据我们所掌握的真实数据，为您提供市调参考，让你更加清晰的了解行业现状及前景，让您能更科学地作出投资风险评估；⑵我们将根据历年经营经验，对您的目标铺面做一个综合评估，以进一步降低的经营风险，同时保障您店铺的发展空间，为您选择合适的铺面提供参考；</p>
<p><strong>正式合作阶段：</strong></p>
<p>⑴产品和设备知识及操作培训，店铺经营流程，店面日常经营管理，成本控制，营销知识及公司新品制作培训，销售，服务培训等；⑵为您店铺量身制作标准，美观，拥有统一的视觉形象体系设计效果图，装修施工图；⑶开业活动方案策划支持，相应物料支持；</p>
<p><strong>后续经营阶段：</strong></p>
<p>⑴享受公司的新品研发成果；⑵享受公司的统促活动；⑶公司协助您进行团队管理，协助您发现和解决经营过程中遇到的问题；⑷公司将即时分享各个加盟店的经营经验，包括经营中遇到的问题，走过的误区，成功营销策略，高效的管理技巧等，让您尽可能少走弯路，规避创业风险，提升店铺效益；⑸在您店铺遇到机遇和挑战时，公司将给您必要的市场支持和物料支持；⑹您将始终拥有一个具备完善职能体系的企业作为您店铺经营强有力的后盾；</p>
<p><strong>加盟表单：</strong></p>
<table data-sort="sortDisabled" class="tablesaw table-striped table-bordered table-hover tablesaw-sortable tablesaw-swipe" data-tablesaw-mode="swipe" data-tablesaw-sortable="">
<tbody>
<tr class="firstRow">
<td valign="top" colspan="2" style="word-break: break-all;">1、加盟基本条件</td>
</tr>
<tr>
<td valign="top" width="353" style="word-break: break-all;">
<div>&middot;重品牌、讲信用、有品位、富远见、具有团队合作精神</div>
<div>&middot;具有一定资金实力和必要的忠诚度</div>
<div>&middot;愿意接受xxxx销售政策及管理制度规定</div>
<div>&middot;能按公司要求对区域市场进行销售分析和市场调研</div>
</td>
<td width="323" valign="top" style="word-break: break-all;">&middot;认同xxxx的品牌经营理念，维护海恩寝居形象（STYLENCE）
<div>&middot;具备与xxxxxxx长期合作，共同谋求长远利益的信心</div>
<div>&middot;具备符合公司要求的店面</div>
</td>
</tr>
<tr>
<td valign="top" style="word-break: break-all;" colspan="2">2、加盟费用</td>
</tr>
<tr>
<td valign="top" style="word-break: break-all;" colspan="2">l&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 详细费用请咨询xx，24小时为您服务！</td>
</tr>
<tr>
<td valign="top" style="word-break: break-all;" colspan="2">3、开业支持</td>
</tr>
<tr>
<td valign="top" width="353" style="word-break: break-all;">
<div>&middot;专业人员协助店面选址</div>
<div>&middot;提供专卖店的经营管理资料</div>
<div>&middot;提供专卖店的VI形象、门头、背景墙上的形象字</div>
<div>&middot;提供专卖店的各种宣传资料</div>
<div>&middot;提供专卖店店面开业期间活动策划支持</div>
</td>
<td width="323" valign="top" style="word-break: break-all;">
<div>&middot;提供专卖店的专业设计方案（平面图、施工图、样品平面图）</div>
<div>&middot;提供首次免费培训（设计、安装、导购）</div>
<div>&middot;提供专卖店内的各种板材小样板</div>
<div>&middot;提供专卖店的样品安装</div>
</td>
</tr>
<tr>
<td valign="top" style="word-break: break-all;" colspan="2">4、宣传推广支持</td>
</tr>
<tr>
<td valign="top" colspan="2" style="word-break: break-all;">
<div>&middot;公司全年百度、搜房网等全国各大知名媒体上统一投放广告。</div>
<div>&middot;公司定期参加国际国内甜品博览会，不定期举办各类推广、公关、促销活动，以提高品牌知名度。</div>
<div>&middot;对于经销商在本区域内所投放的广告费用，公司按该店销售按公司统一标准准予支持。</div>
<div>&middot;全年由专人跟踪加盟店营业状况，给予加盟店市场推广、店面运营等方面的专业支持。</div>
<div>&middot;各加盟店达到公司规定的销售任务，可按公司统一标准获得返利。</div>
</td>
</tr>
</tbody>
</table>
<p></p>',1,NULL,NULL,1,'2019-05-11 22:19:08.190','zhichi','admin','ZKEASOFT','2019-05-11 22:19:08.213','admin','ZKEASOFT','2019-05-11 22:19:08.213');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (10,'品牌优势','品牌优势','品牌优势','品牌优势',907,4,NULL,'<p style="text-align: center;"><strong><span style="font-size: 20px;">四大加盟优势</span></strong></p>
<p><strong style="font-size: 16px;">品牌优势</strong></p>
<p>品牌是一种标识,更是社会、公众和市场对一个企业的认知、评价和印象,这正是中国企业走向世界，地区企业打开全国市场的一块盾牌。强势品牌的建立绝对不是靠短期的低价路线，也不是靠几部精美的广告宣传片，而是需要企业健康持续地树立自己的企业文化，与消费者建立牢固的关系。蛋糕店拥有深厚的品牌历史渊源，自身秉持正确的经验宗旨与理念，坚持独特的产品定位，坚持出色的服务精神，坚持严格的管理理念，坚持凝聚团队精神，坚持市场发展目标。这些，形成了蛋糕店品牌文化深厚的基础，也是企业永续发展，持续经营的夯厚基石。我们不想成为一颗瞬间绚烂却转瞬即逝的流星，我们要那永恒闪亮发光的恒星。做诚信企业，向永续发展，建百年企业是蛋糕店不变的追求。</p>
<p><span style="font-size: 20px;"></span><strong style="font-size: 16px;">加盟简易化</strong></p>
<p>面包美味喷香与否和制作面包的原材料是否优质，材料配比是否恰当，发酵、醒发时间控制，烘焙时间与温度的调节等等有着主要关系。其中任何一环节都影响面包的好坏。特别是前面两项，初期操作是很难把握的。但是在蛋糕店，就不用担心以上问题，因为我们需要所有的门店都能制作出地道的罗蒂公主面包，百分百口味统一，所以我们有专门的生产基地标准化制作半成品的面包供应给加盟店。只要掌握操作发酵箱与烤箱的时间与温度，就可以轻轻松松地烘焙出诱人的蛋糕了。</p>
<p><span style="font-size: 16px;"><strong>管理优势独特化</strong></span></p>
<p>蛋糕店的经营方式是现场烘焙现卖，分分秒秒新鲜出炉，让每一位顾客拿到的面包都是香喷喷、热呼呼的。同时，因为原料纯正现烤出来的面包飘香万里，离店百米都可以闻到咖啡面包的香味。让消费者寻香而来，比任何广告效果都来得快。</p>
<p><span style="font-size: 16px;"><strong>辅导全方位</strong></span></p>
<p>公司对加盟商的支持将是全方位的。公司的辅导与支持会涉及到每个环节。根据每个门店的不同地域、消费情况，进行分析，量身为每家店从店面选址、门店装修、形象视觉系统、设备采购、人员招聘、技术培训、销售培训、服务培训、开业准备、店面日常经营管理及全部管理制度、成本控制、新产品引入、行销策划、考核监督等等一系列的专业方案支持。</p>
<p></p>',1,NULL,NULL,1,'2019-05-11 22:20:47.557','youshi','admin','ZKEASOFT','2019-05-11 22:20:47.557','admin','ZKEASOFT','2019-05-11 22:20:47.557');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (11,'加盟流程','加盟流程','加盟流程','加盟流程',69,4,NULL,'<p>一．加盟咨询&nbsp;</p>
<p>&nbsp;1．向总部索取印刷资料初步了解蛋糕店经营理念。</p>
<p>2．通过&ldquo;在线留言&rdquo;、&ldquo;QQ&rdquo;或致电的方式解答相关疑问。</p>
<p>&nbsp;二．意向选址&nbsp;</p>
<p>&nbsp;在对蛋糕店加盟合作细节详细了解之后，可有针对性地对甜点蛋糕餐饮市场进行实地调研，理性分析当地市场，多方选址。详情见选址要求。</p>
<p>&nbsp;三．加盟申请&nbsp;</p>
<p>&nbsp;初步选好店址后，提出加盟申请。</p>
<p>&nbsp;四．加盟洽谈&nbsp;</p>
<p>&nbsp;总部审核申请后，达成初步合作意向，确定加盟资格。</p>
<p>&nbsp;六．签订合同&nbsp;</p>
<p>&nbsp;加盟商在确定店址后即可与总部签定合作经营合同，（签定方式分为到上海总部签定）支付培训费、年度管理费及原辅料预付定金等款项，合同生效后，即进入开店的筹备阶段，总部后续部门将全程跟进店面的筹备工作。&nbsp;</p>
<p>&nbsp;七．店面设计&nbsp;</p>
<p>&nbsp;为保证蛋糕店企业形象，保证营业风格的规范统一，加盟商店堂及户外招牌广告等，应协同总部设计。装修必须遵循蛋糕店全国统一的设计风格和色彩，其主体风格元素不可缺少。特殊情况下，加盟商可在总部指导下，由当地相关设计公司在总部规划指导下完成，但整体装修设计施工方案最终必须报总部审核，经同意后方可实施装修。</p>
<p>&nbsp;3．工程装修施工　</p>
<p>&nbsp;门店装修前期，加盟商应广泛联系装修公司，进行工程招标，选择合适的有资质的施工方，进行工程施工；也可委派总部工作人员进行工程监理和施工队前往当地对店面进行工程装修施工。</p>
<p>&nbsp;八．人员招聘&nbsp;</p>
<p>&nbsp;在装修竣工前15天左右以张贴海报、报纸广告或电视字幕的形式开始进行店长、店员等人员的招聘工作。</p>
<p>&nbsp;九．办理证照</p>
<p>&nbsp;在当地有关部门办理营业执照，进行税务登记，同时办理消防、城管、卫生、劳动保险等相关手续。&nbsp;</p>
<p>&nbsp;十．设备物料到位</p>
<p>&nbsp;在工程装修竣工前10天左右总部将所需要的设备、器具、原辅料即时发货。</p>
<p>&nbsp;十一.总部培训（一周）</p>
<p>1：服务行业培训&nbsp; &nbsp;2：品质控管&nbsp; &nbsp; 3：日常营运 （营运与盘存）&nbsp; 4：资金管理&nbsp; &nbsp;5：技术培训（实战与产品知识）&nbsp; &nbsp; &nbsp; &nbsp;6：店长培训（店长培训手册）</p>
<p>注：所有培训结束后总部进行综合性考试，合格者颁发毕业证书。不合格者不颁发毕业证书，即不允许上岗。</p>
<p>&nbsp;十二．开业筹备及正式营业&nbsp;</p>
<p>&nbsp;1.市场推广：试营业前期，开展市场营销推广策划，在当地媒体投放广告宣传，扩大品牌影响力，提高品牌在当地知名度。</p>
<p>2．试营业：试营业期间，及时发现问题，有针对性地进行解决，为正式开业做好前期准备。</p>
<p>3. 试营业一段时间（2－3天）后，店内各项服务与食材制作规范化，运营正常后正式开业。&nbsp;</p>
<p>&nbsp;十三．后续支持&nbsp;</p>
<p>&nbsp;1．公司对所有投资店提供长期的后续经营指导和咨询，总部确保提供技术的真实性及实用性，并免费长期提供技术跟踪服务。&nbsp;</p>
<p>2．总部负责长期优质优价供应各种原材料，确保商品品质。</p>
<p>3．总部根据加盟商要求派出市场督导服务人员对加盟商进行专业指导，不定期巡查各店，协助加盟商解决日常运营中的问题，制定促销策划及实施方案，新品开发等措施以切实支持加盟商经营。</p>',1,NULL,NULL,1,'2019-05-11 22:21:37.200','liucheng','admin','ZKEASOFT','2019-05-11 22:21:37.203','admin','ZKEASOFT','2019-05-11 22:21:37.203');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (12,'公司介绍',NULL,NULL,NULL,6,5,NULL,'<p>蛋糕店是长沙餐饮管理有限公司旗下的现烤蛋糕烘培品牌，是一个以快餐式现烤烘焙+特色休闲零食为主打的新零售品牌。为保证烘培的最佳口感，蛋糕店所有烘培产品在收银去柜台以现烤现卖的方式进行售卖，保证客户买到的面包都是现烤出炉的。在零售区，蛋糕店精选特色休闲零食+低温牛奶以量贩式方式售卖。</p>
<p>现烤烘培有四大系列：现烤蛋糕，调理肉松蛋糕，果蔬软欧面包和酥饼点心。特色休闲零食主打手工蛋卷、年糕片、红薯片、油赞子和炒货。低温牛奶主打天润酸奶、宾格瑞牛奶等。蛋糕店创新性的烘焙产品和颠覆性餐饮化新零售方式一经推出，便受到顾客青睐。</p>
<p>现在，长沙餐饮管理公司旗下品牌蛋糕店已经开放了全国市场加盟。希望更多的创业者可以加入到我们的大家庭中！</p>
<p style="text-align: center;"><img src="https://images.mituo.cn/mui492/upload/mui492/201901/1546501541463538.jpg" title="图片关键词" alt="图片关键词" /></p>
<p></p>',1,NULL,NULL,1,'2019-05-11 23:24:13.333','company','admin','超级管理员','2019-05-11 23:24:13.333','admin','超级管理员','2019-05-11 23:24:13.333');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (13,'企业文化',NULL,NULL,NULL,5,5,NULL,'<p style="text-align: center;"><strong>追求卓越 PURSUING EXCELLENCE</strong></p>
<p style="text-align: center;">不断创新，勇争第一，让客户满意，一直是港基人追求的目标</p>
<p></p>
<p style="text-align: center;"><strong>以人为本 PEOPLE ORIENTED</strong></p>
<p style="text-align: center;">员工是企业最大的财富，我们坚信，培养优秀的人才是港基成功的基石</p>
<p></p>
<p style="text-align: center;"><strong>群策群力 WORK AND PULL TOGETHER</strong></p>
<p style="text-align: center;">我们倡导协同一致的团队精神，企业内部以及与合作伙伴的团结合作是群策群力的具体表现</p>',1,NULL,NULL,1,'2019-05-11 23:25:42.987','knowledge','admin','超级管理员','2019-05-11 23:25:42.987','admin','超级管理员','2019-05-11 23:25:42.987');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (14,'品牌优势',NULL,NULL,NULL,6,5,NULL,'<p style="text-align: center;"><strong>品牌优势</strong></p>
<p style="text-align: center;">BRAND&nbsp; &nbsp;ADVANTAGE</p>
<p style="text-align: center;">我们坚持采摘纯天然水果，小产区原野原味，至美至鲜的甜品，源于天然雨水和阳光，</p>
<p style="text-align: center;">让您尽情品尝大自然的味道。<span style="text-align: center;">在晴朗的午后，明媚的下午四点，饱满多汁的原季水果在酸性和糖分平衡瞬间成熟，</span></p>
<p style="text-align: center;"><span style="text-align: center;">便被经验丰富的水果采集师傅及时采摘。</span><span style="text-align: center;">果实的原味在恰到好吃的阳光催化下，最张扬的味道得以保留，同时锁住果汁原味，</span></p>
<p style="text-align: center;"><span style="text-align: center;">驱除露水对糖分的稀释和潮气的影响，</span><span style="text-align: center;">味道更为浓郁，口感富有活力。我们保持对新水果的苛刻态度，满足最挑剔的味蕾。</span></p>
<p style="text-align: center;"><span style="text-align: center;"><img src="https://images.mituo.cn/mui492/upload/mui492/201901/1546501926120002.jpg" title="图片关键词" alt="图片关键词" /></span></p>
<p></p>',1,NULL,NULL,1,'2019-05-11 23:27:05.700','goodat','admin','超级管理员','2019-05-11 23:27:05.703','admin','超级管理员','2019-05-11 23:27:05.703');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (15,'关于我们',NULL,NULL,NULL,11,5,NULL,'<main class="show_met_11_3_47" m-id="47">
<div class="item" style="background-image: url(''https://images.mituo.cn/mui492/upload/mui492/201901/1546505834.jpg'');">
<div class="container">
<h3 class="title appear-no-repeat animation-slide-bottom" data-repeat="false">公司介绍 <span class="line"></span></h3>
<div class="desc appear-no-repeat animation-slide-bottom" data-repeat="false">蛋糕店是长沙餐饮管理有限公司旗下的现烤蛋糕烘培品牌，是一个以快餐式现烤烘焙+特色休闲零食为主打的新零售品牌。为保证烘培的最佳口感，蛋糕店所有烘培产品在收银去柜台以现烤现卖的方式进行售卖，保证客户买到的面包都是现烤出炉的。现在，长沙餐饮管理公司旗下品牌蛋糕店已经开放了全国市场加盟。希望更多的创业者可以加入到我们的大家庭中！</div>
<a href="/about/detail/company.html" class="more appear-no-repeat animation-slide-bottom" data-repeat="false"> <span data-title="了解更多">了解更多</span> </a></div>
</div>
<div class="item" style="background-image: url(''https://images.mituo.cn/mui492/upload/mui492/201901/1546506270.jpg'');">
<div class="container">
<h3 class="title appear-no-repeat animation-slide-bottom" data-repeat="false">企业文化 <span class="line"></span></h3>
<div class="desc animation-slide-bottom appear-no-repeat" data-plugin="appear" data-animate="slide-bottom" data-repeat="false">追求卓越 PURSUING EXCELLENCE<br />不断创新，勇争第一，让客户满意，一直是港基人追求的目标<br />以人为本 PEOPLE ORIENTED<br />员工是企业最大的财富，我们坚信，培养优秀的人才是港基成功的基石<br />群策群力 WORK AND PULL TOGETHER<br />我们倡导协同一致的团队精神，企业内部以及与合作伙伴的团结合作是群策群力的具体表现</div>
<a href="/about/detail/knowledge.html" class="more animation-slide-bottom appear-no-repeat" data-plugin="appear" data-animate="slide-bottom" data-repeat="false"> <span data-title="了解更多">了解更多</span> </a></div>
</div>
<div class="item" style="background-image: url(''https://images.mituo.cn/mui492/upload/mui492/201901/1546506291.jpg'');">
<div class="container">
<h3 class="title animation-slide-bottom appear-no-repeat" data-plugin="appear" data-animate="slide-bottom" data-repeat="false">品牌优势 <span class="line"></span></h3>
<div class="desc animation-slide-bottom appear-no-repeat" data-plugin="appear" data-animate="slide-bottom" data-repeat="false">我们坚持采摘纯天然水果，小产区原野原味，至美至鲜的甜品，源于天然雨水和阳光，让您尽情品尝大自然的味道。在晴朗的午后，明媚的下午四点，饱满多汁的原季水果在酸性和糖分平衡瞬间成熟，便被经验丰富的水果采集师傅及时采摘。果实的原味在恰到好吃的阳光催化下，最张扬的味道得以保留，同时锁住果汁原味，驱除露水对糖分的稀释和潮气的影响，味道更为浓郁，口感富有活力。我们保持对新水果的苛刻态度，满足最挑剔的味蕾。</div>
<a href="/about/detail/goodat.html" class="more animation-slide-bottom appear-no-repeat" data-plugin="appear" data-animate="slide-bottom" data-repeat="false"> <span data-title="了解更多">了解更多</span> </a></div>
</div>
</main>',1,NULL,NULL,1,'2019-05-11 23:39:37.540','aboutus','admin','超级管理员','2019-05-11 23:29:05.000','admin','超级管理员','2019-05-11 23:39:37.543');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ExpandAllPage','true',NULL,NULL,1,'admin','ZKEASOFT','2018-04-11 17:01:47.230','admin','ZKEASOFT','2018-04-11 17:01:47.233');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Favicon','~/favicon.ico',NULL,NULL,NULL,'admin','ZKEASOFT','2017-03-19 20:57:33.627','admin','ZKEASOFT','2017-03-19 20:57:33.627');
COMMIT;

