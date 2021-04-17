ALTER TABLE `ImageWidget` add `ImageUrlMd` varchar(225) CHARACTER SET utf8mb4;
ALTER TABLE `ImageWidget` add `ImageUrlSm` varchar(225) CHARACTER SET utf8mb4;

INSERT INTO `Language` (`LanKey`, `CultureName`, `LanValue`, `Module`, `LanType`)
SELECT 'ImageWidget@ImageUrlMd', 'zh-CN', '中屏图片','PageEntity','EntityProperty' UNION ALL
SELECT 'ImageWidget@ImageUrlSm', 'zh-CN', '小屏图片','PageEntity','EntityProperty';