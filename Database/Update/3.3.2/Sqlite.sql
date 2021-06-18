ALTER TABLE ImageWidget add ImageUrlMd nvarchar(225);
ALTER TABLE ImageWidget add ImageUrlSm nvarchar(225);

INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType])
SELECT 'ImageWidget@ImageUrlMd', 'zh-CN', '中屏图片','PageEntity','EntityProperty' UNION ALL
SELECT 'ImageWidget@ImageUrlSm', 'zh-CN', '小屏图片','PageEntity','EntityProperty';