DELETE FROM dbo.[Language] WHERE LanKey = N'StatisticsScript@Location'
DELETE FROM dbo.[Language] WHERE LanKey = N'LiveChatScript@Location'

INSERT INTO dbo.Language ( LanKey ,CultureName ,LanValue ,Module ,LanType)
SELECT N'StatisticsScript@Location',N'zh-CN',N'位置',N'GlobalScripts',N'EntityProperty' UNION ALL
SELECT N'LiveChatScript@Location',N'zh-CN',N'位置',N'GlobalScripts',N'EntityProperty'