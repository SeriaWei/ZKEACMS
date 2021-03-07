IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE name = N'FluidContentType' AND TYPE = 'u')
BEGIN
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
		[LastUpdateDate] [datetime] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE name = N'FluidContentValue' AND TYPE = 'u')
BEGIN
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
		[SEODescription] [nvarchar](200) NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE name = N'FluidContentTemplate' AND TYPE = 'u')
BEGIN
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
		[LastUpdateDate] [datetime] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

CREATE TABLE [dbo].[FluidContentGroup](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Icon] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
)

ALTER TABLE FluidContentType ADD GroupID int null;
ALTER TABLE FluidContentType ADD RoleID int null;
ALTER TABLE FluidContentType ADD Icon nvarchar(100) null;


CREATE TABLE [dbo].[ArticleGallery](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[RawData] [nvarchar](max) NULL,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[ProductGallery](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[RawData] [nvarchar](max) NULL,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [Order] ADD ShippingOption int null;
ALTER TABLE [Order] ADD SubTotal money null;
ALTER TABLE [Order] ADD Tax money null;
ALTER TABLE [Order] ADD Shipping money null;
ALTER TABLE [OrderItem] ADD BasketID int null;

CREATE TABLE [dbo].[ShippingOption](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[Price] money null,
	[Rule] nvarchar(max) null,
	[ContentID] nvarchar(100) null,
	[CultureID] int null,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Currency](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[Code] nvarchar(10) null,
	[Symbol] nvarchar(10) null,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
)
GO

INSERT INTO Currency(Title,Code,Symbol)
SELECT N'Australian Dollar',N'AUD',N'$' UNION ALL
SELECT N'Brazilian Real',N'BRL',N'$' UNION ALL
SELECT N'Canadian Dollar',N'CAD',N'$' UNION ALL
SELECT N'Chinese Renmenbi',N'CNY',N'￥' UNION ALL
SELECT N'Czech Koruna',N'CZK',N'Kč' UNION ALL
SELECT N'Danish Krone',N'DKK',N'kr' UNION ALL
SELECT N'Euro',N'EUR',N'€' UNION ALL
SELECT N'Hong Kong Dollar',N'HKD',N'$' UNION ALL
SELECT N'Hungarian Forint',N'HUF',N'HUF' UNION ALL
SELECT N'Indian Rupee',N'INR',N'INR' UNION ALL
SELECT N'Israeli New Shekel',N'ILS',N'₪' UNION ALL
SELECT N'Japanese Yen',N'JPY',N'￥' UNION ALL
SELECT N'Malaysian Ringgit',N'MYR',N'MYR' UNION ALL
SELECT N'Mexican Peso',N'MXN',N'$' UNION ALL
SELECT N'New Taiwan Dollar',N'TWD',N'$' UNION ALL
SELECT N'New Zealand Dollar',N'NZD',N'$' UNION ALL
SELECT N'Norwegian Krone',N'NOK',N'NOK' UNION ALL
SELECT N'Philippine Peso',N'PHP',N'PHP' UNION ALL
SELECT N'Polish Zloty',N'PLN',N'zł' UNION ALL
SELECT N'Pound Sterling',N'GBP',N'£' UNION ALL
SELECT N'Russian Ruble',N'RUB',N'RUB' UNION ALL
SELECT N'Singapore Dollar',N'SGD',N'$' UNION ALL
SELECT N'Swedish Krona',N'SEK',N'SEK' UNION ALL
SELECT N'Swiss Franc',N'CHF',N'CHF' UNION ALL
SELECT N'Thai Baht',N'THB',N'฿' UNION ALL
SELECT N'United States Dollar',N'USD',N'$'
GO

DELETE FROM [Language] WHERE LanKey = N'CreatebyName' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'CreatebyName',N'zh-CN',N'创建人');

DELETE FROM [Language] WHERE LanKey = N'CreateDate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'CreateDate',N'zh-CN',N'创建日期');

DELETE FROM [Language] WHERE LanKey = N'LastUpdateByName' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'LastUpdateByName',N'zh-CN',N'更新人');

DELETE FROM [Language] WHERE LanKey = N'LastUpdateDate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'LastUpdateDate',N'zh-CN',N'更新日期');

DELETE FROM [Language] WHERE LanKey = N'Articles' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Articles',N'zh-CN',N'文章');

DELETE FROM [Language] WHERE LanKey = N'Products' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Products',N'zh-CN',N'产品');

DELETE FROM [Language] WHERE LanKey = N'Article Gallery' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Article Gallery',N'zh-CN',N'文章组');

DELETE FROM [Language] WHERE LanKey = N'Product Gallery' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Product Gallery',N'zh-CN',N'产品组');

DELETE FROM [Language] WHERE LanKey = N'ArticleGalleryWidget@DetailPageUrl' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ArticleGalleryWidget@DetailPageUrl',N'zh-CN',N'详细页面');

DELETE FROM [Language] WHERE LanKey = N'ArticleGalleryWidget@ArticleGalleryId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ArticleGalleryWidget@ArticleGalleryId',N'zh-CN',N'文章组');

DELETE FROM [Language] WHERE LanKey = N'ProductGalleryWidget@DetailPageUrl' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductGalleryWidget@DetailPageUrl',N'zh-CN',N'详细页面');

DELETE FROM [Language] WHERE LanKey = N'ProductGalleryWidget@ProductGalleryId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductGalleryWidget@ProductGalleryId',N'zh-CN',N'产品组');

DELETE FROM [Language] WHERE LanKey = N'Icon' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Icon',N'zh-CN',N'图标');

DELETE FROM [Language] WHERE LanKey = N'Content Group' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Content Group',N'zh-CN',N'内容分组');

DELETE FROM [Language] WHERE LanKey = N'GroupID' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'GroupID',N'zh-CN',N'分组');

DELETE FROM [Language] WHERE LanKey = N'RoleID' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'RoleID',N'zh-CN',N'角色');

DELETE FROM [Language] WHERE LanKey = N'Subtotal' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Subtotal',N'zh-CN',N'小计');

DELETE FROM [Language] WHERE LanKey = N'Shipping' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Shipping',N'zh-CN',N'运费');

DELETE FROM [Language] WHERE LanKey = N'Tax' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Tax',N'zh-CN',N'税');

DELETE FROM [Language] WHERE LanKey = N'ShippingOption' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ShippingOption',N'zh-CN',N'物流选项');

DELETE FROM [Language] WHERE LanKey = N'Shipping Option' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Shipping Option',N'zh-CN',N'物流选项');

DELETE FROM [Language] WHERE LanKey = N'Contact Info' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Contact Info',N'zh-CN',N'联系人信息');

DELETE FROM [Language] WHERE LanKey = N'Secure Payment' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Secure Payment',N'zh-CN',N'安全支付');

DELETE FROM [Language] WHERE LanKey = N'Summary' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Summary',N'zh-CN',N'摘要');

DELETE FROM [Language] WHERE LanKey = N'TaxRate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'TaxRate',N'zh-CN',N'税率');

DELETE FROM [Language] WHERE LanKey = N'Tax Rate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Tax Rate',N'zh-CN',N'税率');

DELETE FROM [Language] WHERE LanKey = N'Price' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Price',N'zh-CN',N'价格');

DELETE FROM [Language] WHERE LanKey = N'Currency' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Currency',N'zh-CN',N'货币');

DELETE FROM [Language] WHERE LanKey = N'CurrencyOption@CurrencyID' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'CurrencyOption@CurrencyID',N'zh-CN',N'货币');

DELETE FROM [Language] WHERE LanKey = N'WeChatPay Setting' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPay Setting',N'zh-CN',N'微信支付集成设置');

DELETE FROM [Language] WHERE LanKey = N'Environment' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Environment',N'zh-CN',N'环境');

DELETE FROM [Language] WHERE LanKey = N'IsEnable' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'IsEnable',N'zh-CN',N'是否启用');

DELETE FROM [Language] WHERE LanKey = N'AliPay' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'AliPay',N'zh-CN',N'支付宝支付');

DELETE FROM [Language] WHERE LanKey = N'WeChatPay' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPay',N'zh-CN',N'微信支付');


DELETE FROM [Language] WHERE LanKey = N'AlipayOptions@Environment' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'AlipayOptions@Environment',N'zh-CN',N'环境');

DELETE FROM [Language] WHERE LanKey = N'AlipayOptions@IsEnable' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'AlipayOptions@IsEnable',N'zh-CN',N'是否启用');

DELETE FROM [Language] WHERE LanKey = N'AlipayOptions@AppId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'AlipayOptions@AppId',N'zh-CN',N'AppId');

DELETE FROM [Language] WHERE LanKey = N'AlipayOptions@PublicKey' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'AlipayOptions@PublicKey',N'zh-CN',N'应用公钥');

DELETE FROM [Language] WHERE LanKey = N'AlipayOptions@PrivateKey' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'AlipayOptions@PrivateKey',N'zh-CN',N'应用私钥');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@IsEnable' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@IsEnable',N'zh-CN',N'是否启用');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@AppId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@AppId',N'zh-CN',N'AppId');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@MchId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@MchId',N'zh-CN',N'商户ID');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@Key' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@Key',N'zh-CN',N'API密钥');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@V3Key' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@V3Key',N'zh-CN',N'APIv3密钥');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@Certificate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@Certificate',N'zh-CN',N'API证书');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@CertificatePassword' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@CertificatePassword',N'zh-CN',N'证书密码');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@RsaPublicKey' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@RsaPublicKey',N'zh-CN',N'RSA公钥');

DELETE FROM [Language] WHERE LanKey = N'WeChatPayOptions@AppSecret' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'WeChatPayOptions@AppSecret',N'zh-CN',N'应用密钥');

DELETE FROM [Language] WHERE LanKey = N'PayPalOptions@Environment' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'PayPalOptions@Environment',N'zh-CN',N'环境');

DELETE FROM [Language] WHERE LanKey = N'PayPalOptions@IsEnable' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'PayPalOptions@IsEnable',N'zh-CN',N'是否启用');

DELETE FROM [Language] WHERE LanKey = N'PayPalOptions@ClientID' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'PayPalOptions@ClientID',N'zh-CN',N'Client ID');

DELETE FROM [Language] WHERE LanKey = N'PayPalOptions@ClientSecretID' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'PayPalOptions@ClientSecretID',N'zh-CN',N'Client Secret ID');

DELETE FROM [Language] WHERE LanKey = N'Complete' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Complete',N'zh-CN',N'完成');

DELETE FROM [Language] WHERE LanKey = N'Shiped' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Shiped',N'zh-CN',N'已发货');