DELETE FROM [Language] WHERE LanKey = N'Captcha' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Captcha',N'zh-CN',N'验证码');

DELETE FROM [Language] WHERE LanKey = N'Required?' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Required?',N'zh-CN',N'必填？');

DELETE FROM [Language] WHERE LanKey = N'Required Message' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Required Message',N'zh-CN',N'必填项提示信息');

DELETE FROM [Language] WHERE LanKey = N'Form Control Size' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Form Control Size',N'zh-CN',N'输入框尺寸');

DELETE FROM [Language] WHERE LanKey = N'Small' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Small',N'zh-CN',N'小');

DELETE FROM [Language] WHERE LanKey = N'Medium' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Medium',N'zh-CN',N'中等');

DELETE FROM [Language] WHERE LanKey = N'Large' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Large',N'zh-CN',N'大');

DELETE FROM [Language] WHERE LanKey = N'Input option' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Input option',N'zh-CN',N'输入选项内容');

DELETE FROM [Language] WHERE LanKey = N'Placeholder' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Placeholder',N'zh-CN',N'占位文字');

DELETE FROM [Language] WHERE LanKey = N'Custom Validation' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Custom Validation',N'zh-CN',N'自定义验证');

DELETE FROM [Language] WHERE LanKey = N'Regular expression' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Regular expression',N'zh-CN',N'正则表达式');

DELETE FROM [Language] WHERE LanKey = N'Error Message' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Error Message',N'zh-CN',N'错误信息');