CREATE TABLE [DBVersion] (
  [ID] INTEGER NOT NULL
, [Major] int NULL
, [Minor] int NULL
, [Revision] int NULL
, [Build] int NULL
, CONSTRAINT [PK__DBVersio__3214EC2770178A86] PRIMARY KEY ([ID])
);

INSERT INTO [DBVersion] ([Major],[Minor],[Revision],[Build]) VALUES (3,3,6,0);

UPDATE DataArchived SET ID='Easy.Notification.SmtpSetting' WHERE ID='ZKEACMS.SMTP.SmtpSetting';