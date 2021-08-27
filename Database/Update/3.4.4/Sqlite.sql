DELETE FROM [Language] WHERE LanKey = 'ProductCategoryTag@ProductCategoryId' AND CultureName = 'en-US';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('ProductCategoryTag@ProductCategoryId','en-US','Product Category');

DELETE FROM [Language] WHERE LanKey = 'ProductCategoryTag@ProductCategoryId' AND CultureName = 'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('ProductCategoryTag@ProductCategoryId','zh-CN','产品类别');

DELETE FROM [Language] WHERE LanKey = 'ProductCategoryTag@ProductCategoryId' AND CultureName = 'zh-TW';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values('ProductCategoryTag@ProductCategoryId','zh-TW','產品類別');

