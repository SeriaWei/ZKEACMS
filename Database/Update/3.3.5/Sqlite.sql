CREATE TABLE [PersistKey] (
  [ID] nvarchar(100) NOT NULL
, [XML] ntext NULL
, [CreationDate] datetime NULL
, [ActivationDate] datetime NULL
, [ExpirationDate] datetime NULL
, CONSTRAINT [PK__PersistK__3214EC279703571C] PRIMARY KEY ([ID])
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
, CONSTRAINT [PK__Subscrip__3214EC27B3931FCE] PRIMARY KEY ([ID])
);

insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Header_Copy','zh-CN','第一时间了解最新动态');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Header_Copy','en-US','Be the first to know');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Body_Copy','zh-CN','通过邮箱订阅我们，您将可以在第一时间收到我们的相关信息');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Body_Copy','en-US','Subscribe by email, you will be able to receive our related information at the first time');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Footer_Copy','zh-CN','我们承诺严格遵守隐私政策处理您的信息。');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Footer_Copy','en-US','We promise to handle your information in line with our privacy policy.');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscribe','zh-CN','订阅');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscribe','en-US','Subscribe');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription','zh-CN','订阅');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription','en-US','Subscription');
insert into [Language] (LanKey,CultureName,LanValue)values('Unsubscribe','zh-CN','取消订阅');
insert into [Language] (LanKey,CultureName,LanValue)values('Unsubscribe','en-US','Unsubscribe');

insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Confirm_Title','zh-CN','确认订阅我们');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Confirm_Title','en-US','Confirm Your Subscription');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Confirm_Button','zh-CN','是的，我想要订阅');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Confirm_Button','en-US','Yes, I want to subscribe');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Confirm_Copy','zh-CN','如果您不点击上方链接，您将不会订阅我们。');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Confirm_Copy','en-US','You will not be subscribed if you don''t click on the link above.');

insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Unscribe_Title','zh-CN','取消订阅我们');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Unscribe_Title','en-US','Unsubscribe confirm');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Unscribe_Button','zh-CN','是的，我想要取消订阅');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Unscribe_Button','en-US','Yes, I want to unsubscribe');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Unscribe_Copy','zh-CN','如果您不点击上方链接，您将不会取消订阅我们。');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Email_Unscribe_Copy','en-US','You will not be unsubscribed if you don''t click on the link above.');

insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Subscribed_Title','zh-CN','您已订阅成功');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Subscribed_Title','en-US','You''ve Been Subscribed');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Unsubscribed_Title','zh-CN','您已取消订阅');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Unsubscribed_Title','en-US','You''ve Been Unsubscribed');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Subscribe_Thank_Copy','zh-CN','感谢您确认您的邮件地址！');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Subscribe_Thank_Copy','en-US','Thanks for confirming your email address!');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Unsubscribing_Title','zh-CN','您正在取消订阅');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Unsubscribing_Title','en-US','You are unsubscribing');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Unsubscribing_Copy','zh-CN','我们会给您发送取消订阅确认邮件');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Unsubscribing_Copy','en-US','We will send you an email to confirm');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Unsubscribed_Copy','zh-CN','我们已经给您发送了取消订阅确认邮件');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscription_Unsubscribed_Copy','en-US','We have sent you an email to confirm');

insert into [Language] (LanKey,CultureName,LanValue)values('Subscriber@CreatebyName','zh-CN','创建人');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscriber@CreateDate','zh-CN','创建日期');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscriber@IsValidate','zh-CN','已验证？');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscriber@LastUpdateByName','zh-CN','更新人');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscriber@LastUpdateDate','zh-CN','更新日期');
insert into [Language] (LanKey,CultureName,LanValue)values('Subscriber@Referrer','zh-CN','来源');
insert into [Language] (LanKey,CultureName,LanValue)values('SubscriptionSetting@IsEnable','zh-CN','是否启用？');
insert into [Language] (LanKey,CultureName,LanValue)values('View Subscription','zh-CN','查看订阅');
insert into [Language] (LanKey,CultureName,LanValue)values('Manage Subscription','zh-CN','管理订阅');


update [Language] set LanValue='排序' where LanKey like '%Widget@Position' and CultureName='zh-CN';
UPDATE  [Language] set LanValue = 'Position' WHERE  LanKey LIKE '%Widget@Position' and CultureName = 'en-US';