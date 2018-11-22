ALTER TABLE Article ADD Url NVARCHAR(100);
ALTER TABLE ArticleType ADD Url NVARCHAR(100);
ALTER TABLE ProductCategory ADD Url NVARCHAR(100);
ALTER TABLE Forms ADD NotificationReceiver NVARCHAR(500);

INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Robots@Content', 'zh-CN', '内容', 'Robots', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('MessageNotificationConfig@MessageNotifyEmails', 'zh-CN', '新留言通知邮箱', 'MessageNotificationConfig', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('MessageNotificationConfig@CommentNotifyEmails', 'zh-CN', '新评论通知邮箱', 'MessageNotificationConfig', 'EntityProperty');

