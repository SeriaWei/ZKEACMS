
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
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Header_Copy',N'en-US',N'Be the first to know');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Body_Copy',N'zh-CN',N'通过邮箱订阅我们，您将可以在第一时间收到我们的相关信息');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Body_Copy',N'en-US',N'Subscribe by email, you will be able to receive our related information at the first time');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Footer_Copy',N'zh-CN',N'我们承诺严格遵守隐私政策处理您的信息。');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Footer_Copy',N'en-US',N'We promise to handle your information in line with our privacy policy.');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscribe',N'zh-CN',N'订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscribe',N'en-US',N'Subscribe');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription',N'zh-CN',N'订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription',N'en-US',N'Subscription');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Unsubscribe',N'zh-CN',N'取消订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Unsubscribe',N'en-US',N'Unsubscribe');

insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Confirm_Title',N'zh-CN',N'确认订阅我们');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Confirm_Title',N'en-US',N'Confirm Your Subscription');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Confirm_Button',N'zh-CN',N'是的，我想要订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Confirm_Button',N'en-US',N'Yes, I want to subscribe');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Confirm_Copy',N'zh-CN',N'如果您不点击上方链接，您将不会订阅我们。');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Confirm_Copy',N'en-US',N'You will not be subscribed if you don''t click on the link above.');

insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Unscribe_Title',N'zh-CN',N'取消订阅我们');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Unscribe_Title',N'en-US',N'Unsubscribe confirm');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Unscribe_Button',N'zh-CN',N'是的，我想要取消订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Unscribe_Button',N'en-US',N'Yes, I want to unsubscribe');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Unscribe_Copy',N'zh-CN',N'如果您不点击上方链接，您将不会取消订阅我们。');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Email_Unscribe_Copy',N'en-US',N'You will not be unsubscribed if you don''t click on the link above.');

insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Subscribed_Title',N'zh-CN',N'您已订阅成功');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Subscribed_Title',N'en-US',N'You''ve Been Subscribed');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Unsubscribed_Title',N'zh-CN',N'您已取消订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Unsubscribed_Title',N'en-US',N'You''ve Been Unsubscribed');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Subscribe_Thank_Copy',N'zh-CN',N'感谢您确认您的邮件地址！');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Subscribe_Thank_Copy',N'en-US',N'Thanks for confirming your email address!');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Unsubscribing_Title',N'zh-CN',N'您正在取消订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Unsubscribing_Title',N'en-US',N'You are unsubscribing');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Unsubscribing_Copy',N'zh-CN',N'我们会给您发送取消订阅确认邮件');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Unsubscribing_Copy',N'en-US',N'We will send you an email to confirm');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Unsubscribed_Copy',N'zh-CN',N'我们已经给您发送了取消订阅确认邮件');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscription_Unsubscribed_Copy',N'en-US',N'We have sent you an email to confirm');

insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@CreatebyName',N'zh-CN',N'创建人');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@CreateDate',N'zh-CN',N'创建日期');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@IsValidate',N'zh-CN',N'已验证？');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@LastUpdateByName',N'zh-CN',N'更新人');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@LastUpdateDate',N'zh-CN',N'更新日期');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Subscriber@Referrer',N'zh-CN',N'来源');
insert into [Language] (LanKey,CultureName,LanValue)values(N'SubscriptionSetting@IsEnable',N'zh-CN',N'是否启用？');
insert into [Language] (LanKey,CultureName,LanValue)values(N'View Subscription',N'zh-CN',N'查看订阅');
insert into [Language] (LanKey,CultureName,LanValue)values(N'Manage Subscription',N'zh-CN',N'管理订阅');


update [Language] set LanValue=N'排序' where LanKey like N'%Widget@Position' and CultureName=N'zh-CN';
UPDATE  [Language] set LanValue = N'Position' WHERE  LanKey LIKE N'%Widget@Position' and CultureName = N'en-US'