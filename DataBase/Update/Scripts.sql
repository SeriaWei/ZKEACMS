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