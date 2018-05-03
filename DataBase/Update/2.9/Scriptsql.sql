ALTER TABLE dbo.Navigation ADD Html NVARCHAR(max)
ALTER TABLE dbo.Navigation ALTER COLUMN Description NVARCHAR(500)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Html', N'zh-CN', N'HTMLÄÚÈÝ', N'NavigationEntity', N'EntityProperty')
GO