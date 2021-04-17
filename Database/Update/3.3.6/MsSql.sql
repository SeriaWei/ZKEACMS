CREATE TABLE [dbo].[DBVersion](
	[ID] [int] IDENTITY(1,1) Primary key NOT NULL,
	[Major] [int] NULL,
	[Minor] [int] NULL,
	[Revision] [int] NULL,
	[Build] [int] NULL
);

INSERT INTO [dbo].[DBVersion](Major,Minor,Revision,Build) values (3,3,6,0);

UPDATE DataArchived SET ID='Easy.Notification.SmtpSetting' WHERE ID='ZKEACMS.SMTP.SmtpSetting';