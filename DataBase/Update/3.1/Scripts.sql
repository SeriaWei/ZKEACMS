ALTER TABLE dbo.Article ADD Url NVARCHAR(100) NULL
ALTER TABLE dbo.ArticleType ADD Url NVARCHAR(100) NULL
ALTER TABLE dbo.ProductCategory ADD Url NVARCHAR(100) NULL

ALTER TABLE dbo.Forms ADD NotificationReceiver NVARCHAR(500) NULL

INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Robots@Content', N'zh-CN', N'����', N'Robots', N'EntityProperty')

INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@MessageNotifyEmails', N'zh-CN', N'������֪ͨ����', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@CommentNotifyEmails', N'zh-CN', N'������֪ͨ����', N'MessageNotificationConfig', N'EntityProperty')

