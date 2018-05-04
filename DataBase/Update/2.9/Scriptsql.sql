ALTER TABLE dbo.Navigation ADD Html NVARCHAR(max)
ALTER TABLE dbo.Navigation ALTER COLUMN Description NVARCHAR(500)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Html', N'zh-CN', N'HTMLÄÚÈÝ', N'NavigationEntity', N'EntityProperty')
GO
IF NOT EXISTS ( SELECT  1
                FROM    DataDictionary
                WHERE   DicName = N'ProductListWidget@PartialView'
                        AND DicValue = N'Widget.ProductList.A' )
    BEGIN
        INSERT  INTO DataDictionary
                ( DicName ,
                  Title ,
                  DicValue ,
                  [Order] ,
                  Pid ,
                  IsSystem ,
                  [Status]
                )
        VALUES  ( N'ProductListWidget@PartialView' ,
                  N'ÁÐ±í' ,
                  N'Widget.ProductList.A' ,
                  2 ,
                  0 ,
                  1 ,
                  1
                );
    END;
GO