DELETE FROM [Language] WHERE LanKey = N'File' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'File',N'zh-CN',N'文件');