ALTER TABLE dbo.CMS_Layout ADD IsTemplate BIT NULL
ALTER TABLE dbo.CMS_Page ADD IsTemplate BIT NULL
ALTER TABLE dbo.CMS_Page ADD TemplateThumbnail NVARCHAR(200) NULL
GO
UPDATE dbo.CMS_Layout SET IsTemplate=0
UPDATE dbo.CMS_Page SET IsTemplate=0
GO