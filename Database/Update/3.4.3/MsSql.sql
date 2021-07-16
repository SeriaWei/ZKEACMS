DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEOTitle' AND CultureName = N'en-US';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEOTitle',N'en-US',N'SEO Title');

DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEOTitle' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEOTitle',N'zh-CN',N'SEO标题');

DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEOTitle' AND CultureName = N'zh-TW';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEOTitle',N'zh-TW',N'SEO標題');

DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEOKeyWord' AND CultureName = N'en-US';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEOKeyWord',N'en-US',N'SEO Key Word');

DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEOKeyWord' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEOKeyWord',N'zh-CN',N'SEO关键字');

DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEOKeyWord' AND CultureName = N'zh-TW';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEOKeyWord',N'zh-TW',N'SEO關鍵字');

DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEODescription' AND CultureName = N'en-US';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEODescription',N'en-US',N'SEO Description');

DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEODescription' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEODescription',N'zh-CN',N'SEO描述');

DELETE FROM [Language] WHERE LanKey = N'ProductCategory@SEODescription' AND CultureName = N'zh-TW';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategory@SEODescription',N'zh-TW',N'SEO描述');

