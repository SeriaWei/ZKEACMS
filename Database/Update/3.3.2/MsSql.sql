ALTER TABLE ImageWidget add ImageUrlMd nvarchar(225);
ALTER TABLE ImageWidget add ImageUrlSm nvarchar(225);

INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType])
SELECT N'ImageWidget@ImageUrlMd', N'zh-CN', N'中屏图片',N'PageEntity',N'EntityProperty' UNION ALL
SELECT N'ImageWidget@ImageUrlSm', N'zh-CN', N'小屏图片',N'PageEntity',N'EntityProperty';