DELETE FROM [Language] WHERE LanKey = 'StatisticsScript@Location';
DELETE FROM [Language] WHERE LanKey = 'LiveChatScript@Location';

INSERT INTO [Language] ( LanKey ,CultureName ,LanValue ,Module ,LanType)
SELECT 'StatisticsScript@Location','zh-CN','位置','GlobalScripts','EntityProperty' UNION ALL
SELECT 'LiveChatScript@Location','zh-CN','位置','GlobalScripts','EntityProperty'