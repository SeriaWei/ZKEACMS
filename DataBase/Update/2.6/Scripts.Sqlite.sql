ALTER TABLE [Order] ADD RefundID NVARCHAR(100);
ALTER TABLE [Order] ADD Refund numeric(18,4);
ALTER TABLE [Order] ADD RefundReason NVARCHAR(500);
ALTER TABLE [Order] ADD RefundDate DATETIME;

INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Order@Refund', 'zh-CN', '退款金额', 'Order', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Order@RefundDate', 'zh-CN', '退款日期', 'Order', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Order@RefundID', 'zh-CN', '退款流水号', 'Order', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Order@RefundReason', 'zh-CN', '退款原因', 'Order', 'EntityProperty');

INSERT INTO [Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [LastUpdateBy], [LastUpdateByName]) VALUES ('Order_Refund', 1, '退款', NULL, '商城', NULL, 'admin', 'ZKEASOFT', 'admin', 'ZKEASOFT');
INSERT INTO [Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [LastUpdateBy], [LastUpdateByName]) VALUES ('Order_ViewOrderPayment', 1, '查看支付平台支付信息', NULL, '商城', NULL, 'admin', 'ZKEASOFT', 'admin', 'ZKEASOFT');
INSERT INTO [Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [LastUpdateBy], [LastUpdateByName]) VALUES ('Order_ViewOrderRefund', 1, '查看支付平台退款信息', NULL, '商城', NULL, 'admin', 'ZKEASOFT', 'admin', 'ZKEASOFT');
