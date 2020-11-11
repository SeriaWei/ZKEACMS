CREATE TABLE [PersistKey](
	[ID] [nvarchar](100) primary key NOT NULL ,
	[XML] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[ActivationDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL
);
CREATE TABLE [Subscription](
	[ID] [int] identity primary key NOT NULL ,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Referrer] [nvarchar](500) NULL,
	[IsValidate] bit NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
);
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Header_Copy',N'zh-CN',N'第一时间了解最新动态');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Body_Copy',N'zh-CN',N'通过邮箱订阅我们，您将可以在第一时间收到我们的相关信息');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Footer_Copy',N'zh-CN',N'我们承诺严格遵守隐私政策处理您的信息。');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscribe',N'zh-CN',N'订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription',N'zh-CN',N'订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@CreatebyName',N'zh-CN',N'创建人');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@CreateDate',N'zh-CN',N'创建日期');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@IsValidate',N'zh-CN',N'已验证？');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@LastUpdateByName',N'zh-CN',N'更新人');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@LastUpdateDate',N'zh-CN',N'更新日期');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@Referrer',N'zh-CN',N'来源');
insert into [Language] (LanKey,CultureName,LanValue)values(N'SubscriptionSetting@IsEnable',N'zh-CN',N'是否启用？');
insert into [Language] (LanKey,CultureName,LanValue)values(N'View Subscription',N'zh-CN',N'查看订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Manage Subscription',N'zh-CN',N'管理订阅');

insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Header_Copy',N'en-US',N'Be the first to know');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Body_Copy',N'en-US',N'Subscribe by email, you will be able to receive our related information at the first time');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Footer_Copy',N'en-US',N'We promise to handle your information in line with our privacy policy.');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscribe',N'en-US',N'Subscribe');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription',N'en-US',N'Subscription');

update Language set LanValue=N'排序' where LanKey like N'%Widget@Position' and CultureName=N'zh-CN';
UPDATE  [Language] set LanValue = 'Position' WHERE  LanKey LIKE '%Widget@Position' and CultureName = 'en-US'