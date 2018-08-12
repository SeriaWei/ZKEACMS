ALTER TABLE dbo.Article ADD Url NVARCHAR(100) NULL
ALTER TABLE dbo.ArticleType ADD Url NVARCHAR(100) NULL
ALTER TABLE dbo.ProductCategory ADD Url NVARCHAR(100) NULL

INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Robots@Content', N'zh-CN', N'ÄÚÈÝ', N'Robots', N'EntityProperty')
