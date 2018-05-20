
CREATE TABLE [Forms] (
  [ID] nvarchar(50) NOT NULL
, [Title] nvarchar(500) NULL
, [FieldsData] ntext NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Forms] PRIMARY KEY ([ID])
);
CREATE TABLE [FormDataItem] (
  [ID] INTEGER NOT NULL
, [FormDataId] int NOT NULL
, [FieldId] nvarchar(50) NULL
, [FieldText] nvarchar(1000) NULL
, [FieldValue] ntext NULL
, [OptionValue] nvarchar(50) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_FormData] PRIMARY KEY ([ID])
);
CREATE TABLE [FormData] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(500) NULL
, [FormId] nvarchar(50) NOT NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_FormData_1] PRIMARY KEY ([ID])
);


INSERT  INTO CMS_WidgetTemplate
        ( Title ,
          GroupName ,
          PartialView ,
          AssemblyName ,
          ServiceTypeName ,
          ViewModelTypeName ,
          Thumbnail ,
          [Order] ,
          [Status]
        )
VALUES  ( '表单' ,
          '1.通用' ,
          'Widget.Form' ,
          'ZKEACMS.FormGenerator' ,
          'ZKEACMS.FormGenerator.Service.FormWidgetService' ,
          'ZKEACMS.FormGenerator.Models.FormWidget' ,
          '~/Plugins/ZKEACMS.FormGenerator/Content/images/Widget.Form.png' ,
          12 ,
          1
        );


INSERT INTO [Language](LanKey,CultureName,LanValue,Module,LanType)
VALUES('FormWidget@FormID','zh-CN','表单','FormWidget','EntityProperty');

INSERT INTO [Language](LanKey,CultureName,LanValue,Module,LanType)
VALUES('FormData@FormId','zh-CN','表单','FormWidget','EntityProperty');

INSERT INTO [Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status]) VALUES ('Form_Manage', 1, '管理表单', NULL, '自定义表单', NULL);
INSERT INTO [Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status]) VALUES ('Form_View', 1, '查看表单', NULL, '自定义表单', NULL);
INSERT INTO [Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status]) VALUES ('FormData_Export', 1, '导出表单数据', NULL, '自定义表单', NULL);
INSERT INTO [Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status]) VALUES ('FormData_Manage', 1, '管理表单数据', NULL, '自定义表单', NULL);
INSERT INTO [Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status]) VALUES ('FormData_View', 1, '查看表单数据', NULL, '自定义表单', NULL);
