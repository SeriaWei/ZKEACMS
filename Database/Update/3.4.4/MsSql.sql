DELETE FROM [Language] WHERE LanKey = N'ProductCategoryTag@ProductCategoryId' AND CultureName = N'en-US';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategoryTag@ProductCategoryId',N'en-US',N'Product Category');

DELETE FROM [Language] WHERE LanKey = N'ProductCategoryTag@ProductCategoryId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategoryTag@ProductCategoryId',N'zh-CN',N'产品类别');

DELETE FROM [Language] WHERE LanKey = N'ProductCategoryTag@ProductCategoryId' AND CultureName = N'zh-TW';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductCategoryTag@ProductCategoryId',N'zh-TW',N'產品類別');

