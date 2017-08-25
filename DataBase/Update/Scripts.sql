UPDATE dbo.DataDictionary SET Title=N'后台管理员' WHERE ID=11


INSERT INTO dbo.DataDictionary
        ( DicName ,
          Title ,
          DicValue ,
          [Order] ,
          Pid ,
          IsSystem 
        )
VALUES  ( N'UserEntity@UserTypeCD' , -- DicName - nvarchar(255)
          N'前端用户' , -- Title - nvarchar(255)
          N'2' , -- DicValue - nvarchar(255)
          2 , -- Order - int
          0 , -- Pid - int
          1 
        )
GO
INSERT INTO dbo.ApplicationSetting( SettingKey ,Value ,Description ,Status)
SELECT N'SMTP-Host',N'',N'邮件服务地址，如 smtp.qq.com',1 UNION ALL
SELECT N'SMTP-Port',N'25',N'邮件服务器端口号',1 UNION ALL
SELECT N'SMTP-Email',N'',N'用于发送邮件的邮箱',1 UNION ALL
SELECT N'SMTP-PassWord',N'',N'用于发送邮件的邮箱密码',1 UNION ALL
SELECT N'SMTP-UseSSL',N'false',N'是否启用SSL',1

GO

ALTER TABLE dbo.Users ADD [ResetToken] NVARCHAR(50) NULL
ALTER TABLE dbo.Users ADD [ResetTokenDate] DATETIME NULL