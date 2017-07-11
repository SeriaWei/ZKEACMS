ALTER TABLE dbo.CMS_Message ALTER COLUMN Description NVARCHAR(200)

IF EXISTS(SELECT 1 FROM dbo.Roles WHERE ID=1)
BEGIN
	IF NOT EXISTS(SELECT 1 FROM dbo.Permission WHERE RoleId=1 AND PermissionKey=N'EventViewer_Manage')
	BEGIN
		INSERT INTO dbo.Permission
		        ( PermissionKey ,
		          RoleId ,
		          Title ,
		          Description ,
		          Module ,
		          Status
		        )
		VALUES  ( N'EventViewer_Manage' , 
		          1 , 
		          N'查看错误日志' , 
		          NULL , 
		          N'设置' ,
		          NULL
		        )
    END
END