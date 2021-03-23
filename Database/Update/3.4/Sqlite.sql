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

ALTER TABLE [Order] ADD ShippingOption int null;
ALTER TABLE [Order] ADD SubTotal money null;
ALTER TABLE [Order] ADD Tax money null;
ALTER TABLE [Order] ADD Shipping money null;
ALTER TABLE [OrderItem] ADD BasketID int null;

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
, CONSTRAINT [PK__Shipping__3214EC270AE03820] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__Currency__3214EC27CD7C2D00] PRIMARY KEY ([ID])
);

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

DELETE FROM [Language] WHERE LanKey = 'Subtotal' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Subtotal','zh-CN','小计');

DELETE FROM [Language] WHERE LanKey = 'Shipping' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Shipping','zh-CN','运费');

DELETE FROM [Language] WHERE LanKey = 'Tax' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Tax','zh-CN','税');

DELETE FROM [Language] WHERE LanKey = 'ShippingOption' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('ShippingOption','zh-CN','物流选项');

DELETE FROM [Language] WHERE LanKey = 'Shipping Option' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Shipping Option','zh-CN','物流选项');

DELETE FROM [Language] WHERE LanKey = 'Contact Info' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Contact Info','zh-CN','联系人信息');

DELETE FROM [Language] WHERE LanKey = 'Secure Payment' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Secure Payment','zh-CN','安全支付');

DELETE FROM [Language] WHERE LanKey = 'Summary' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Summary','zh-CN','摘要');

DELETE FROM [Language] WHERE LanKey = 'TaxRate' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('TaxRate','zh-CN','税率');

DELETE FROM [Language] WHERE LanKey = 'Tax Rate' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Tax Rate','zh-CN','税率');

DELETE FROM [Language] WHERE LanKey = 'Price' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Price','zh-CN','价格');

DELETE FROM [Language] WHERE LanKey = 'Currency' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Currency','zh-CN','货币');

DELETE FROM [Language] WHERE LanKey = 'CurrencyOption@CurrencyID' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('CurrencyOption@CurrencyID','zh-CN','货币');

DELETE FROM [Language] WHERE LanKey = 'WeChatPay Setting' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPay Setting','zh-CN','微信支付集成设置');

DELETE FROM [Language] WHERE LanKey = 'Environment' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Environment','zh-CN','环境');

DELETE FROM [Language] WHERE LanKey = 'IsEnable' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('IsEnable','zh-CN','是否启用');

DELETE FROM [Language] WHERE LanKey = 'AliPay' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('AliPay','zh-CN','支付宝支付');

DELETE FROM [Language] WHERE LanKey = 'WeChatPay' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPay','zh-CN','微信支付');


DELETE FROM [Language] WHERE LanKey = 'AlipayOptions@Environment' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('AlipayOptions@Environment','zh-CN','环境');

DELETE FROM [Language] WHERE LanKey = 'AlipayOptions@IsEnable' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('AlipayOptions@IsEnable','zh-CN','是否启用');

DELETE FROM [Language] WHERE LanKey = 'AlipayOptions@AppId' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('AlipayOptions@AppId','zh-CN','AppId');

DELETE FROM [Language] WHERE LanKey = 'AlipayOptions@PublicKey' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('AlipayOptions@PublicKey','zh-CN','应用公钥');

DELETE FROM [Language] WHERE LanKey = 'AlipayOptions@PrivateKey' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('AlipayOptions@PrivateKey','zh-CN','应用私钥');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@IsEnable' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@IsEnable','zh-CN','是否启用');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@AppId' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@AppId','zh-CN','AppId');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@MchId' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@MchId','zh-CN','商户ID');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@Key' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@Key','zh-CN','API密钥');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@V3Key' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@V3Key','zh-CN','APIv3密钥');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@Certificate' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@Certificate','zh-CN','API证书');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@CertificatePassword' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@CertificatePassword','zh-CN','证书密码');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@RsaPublicKey' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@RsaPublicKey','zh-CN','RSA公钥');

DELETE FROM [Language] WHERE LanKey = 'WeChatPayOptions@AppSecret' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('WeChatPayOptions@AppSecret','zh-CN','应用密钥');

DELETE FROM [Language] WHERE LanKey = 'PayPalOptions@Environment' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('PayPalOptions@Environment','zh-CN','环境');

DELETE FROM [Language] WHERE LanKey = 'PayPalOptions@IsEnable' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('PayPalOptions@IsEnable','zh-CN','是否启用');

DELETE FROM [Language] WHERE LanKey = 'PayPalOptions@ClientID' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('PayPalOptions@ClientID','zh-CN','Client ID');

DELETE FROM [Language] WHERE LanKey = 'PayPalOptions@ClientSecretID' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('PayPalOptions@ClientSecretID','zh-CN','Client Secret ID');

DELETE FROM [Language] WHERE LanKey = 'Complete' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Complete','zh-CN','完成');

DELETE FROM [Language] WHERE LanKey = 'Shiped' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('Shiped','zh-CN','已发货');