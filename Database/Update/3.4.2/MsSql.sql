DELETE FROM [Language] WHERE LanKey = N'Showcase' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Showcase',N'zh-CN',N'展示橱窗');

DELETE FROM [Language] WHERE LanKey = N'ShowCaseWidget@CaseItems' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ShowCaseWidget@CaseItems',N'zh-CN',N'展示项');

DELETE FROM [Language] WHERE LanKey = N'ShowCaseWidget@Header' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ShowCaseWidget@Header',N'zh-CN',N'大标题');

DELETE FROM [Language] WHERE LanKey = N'ShowCaseWidget@MoreLink' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ShowCaseWidget@MoreLink',N'zh-CN',N'查看更多链接');

DELETE FROM [Language] WHERE LanKey = N'CaseItem@BackgroundImage' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'CaseItem@BackgroundImage',N'zh-CN',N'背景图');