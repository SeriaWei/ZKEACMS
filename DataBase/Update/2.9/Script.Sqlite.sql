ALTER TABLE Navigation ADD Html NTEXT;

INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('NavigationEntity@Html', 'zh-CN', 'HTML����', 'NavigationEntity', 'EntityProperty');

INSERT  INTO DataDictionary
                ( DicName ,
                  Title ,
                  DicValue ,
                  [Order] ,
                  Pid ,
                  IsSystem ,
                  [Status]
                )
        VALUES  ( 'ProductListWidget@PartialView' ,
                  '�б�' ,
                  'Widget.ProductList.A' ,
                  2 ,
                  0 ,
                  1 ,
                  1
                );