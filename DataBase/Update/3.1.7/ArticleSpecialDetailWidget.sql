CREATE TABLE [dbo].[ArticleSpecialDetailWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ArticleId] [int] NULL,
	[ArticleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_ArticleSpecialDetailWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


UPDATE dbo.Language SET LanValue='文章ID' WHERE LanKey='ArticleSpecialDetailWidget@ArticleId'

UPDATE dbo.Language SET LanValue='文章英文名' WHERE LanKey='ArticleSpecialDetailWidget@ArticleName'