ALTER TABLE dbo.CMS_Zone ADD HeadingCode NVARCHAR(100) NULL
GO
UPDATE dbo.CMS_Zone SET HeadingCode = ID
GO
ALTER TABLE [dbo].[CarouselItem] DROP CONSTRAINT [FK_CarouselItem_Carousel]
GO