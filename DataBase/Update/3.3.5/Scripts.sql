CREATE TABLE [dbo].[PersistKey](
	[ID] [nvarchar](100) primary key NOT NULL ,
	[XML] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[ActivationDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL
);


update Language set LanValue=N'排序' where LanKey like N'%Widget@Position' and CultureName=N'zh-CN';
UPDATE  [Language] set LanValue = 'Position' WHERE  LanKey LIKE '%Widget@Position' and CultureName = 'en-US'