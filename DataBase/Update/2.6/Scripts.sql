ALTER TABLE dbo.[Order] ADD RefundID NVARCHAR(100)
ALTER TABLE dbo.[Order] ADD Refund DECIMAL(18,4)
ALTER TABLE dbo.[Order] ADD RefundReason NVARCHAR(500)
ALTER TABLE dbo.[Order] ADD RefundDate DATETIME

INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Refund', N'zh-CN', N'退款金额', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundDate', N'zh-CN', N'退款日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundID', N'zh-CN', N'退款流水号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundReason', N'zh-CN', N'退款原因', N'Order', N'EntityProperty')

INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_Refund', 1, N'退款', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19 15:26:24.903' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-01-19 15:26:24.903' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_ViewOrderPayment', 1, N'查看支付平台支付信息', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19 15:26:24.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-01-19 15:26:24.777' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_ViewOrderRefund', 1, N'查看支付平台退款信息', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19 15:26:24.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-01-19 15:26:24.850' AS DateTime))
