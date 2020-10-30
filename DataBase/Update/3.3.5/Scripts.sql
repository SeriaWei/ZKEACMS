CREATE TABLE [dbo].[PersistKey](
	[ID] [nvarchar](100) primary key NOT NULL ,
	[XML] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[ActivationDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL
);