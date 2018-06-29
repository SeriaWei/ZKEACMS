CREATE TABLE [CMS_Rule] (
  [RuleID] INTEGER NOT NULL
, [Title] nvarchar(50) NULL
, [ZoneName] nvarchar(50) NULL
, [RuleExpression] nvarchar(800) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [RuleItems] ntext NULL
, CONSTRAINT [PK_CMS_Rule] PRIMARY KEY ([RuleID])
);
ALTER TABLE CMS_WidgetBase ADD RuleID INT;
INSERT INTO DataDictionary(DicName,Title,DicValue,[Order],Pid,IsSystem,[Status])
SELECT 'RuleItem@Condition','����','and',1,0,1,0 UNION ALL
SELECT 'RuleItem@Condition','����','or',2,0,1,0 UNION ALL

SELECT 'RuleItem@FunctionName','����','Equals',1,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','������','NotEquals',2,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','����','GreaterThan',3,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','���ڵ���','GreaterThanOrEquals',4,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','С��','LessThan',5,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','С�ڵ���','LessThanOrEquals',6,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','�ԡ���ͷ','StartsWith',7,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','��...��β','EndsWith',8,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','���ԡ���ͷ','NotStartsWith',9,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','����...��β','NotEndsWith',10,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','����','Contains',11,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','������','NotContains',12,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','��...��','In',13,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','����...��','NotIn',14,0,1,0 UNION ALL

SELECT 'RuleItem@Property','Url','ValueOf(''Url'')',1,0,1,0 UNION ALL
SELECT 'RuleItem@Property','Url����','ValueOf(''QueryString'')',2,0,1,0 UNION ALL
SELECT 'RuleItem@Property','User-Agent','ValueOf(''UserAgent'')',3,0,1,0 UNION ALL
SELECT 'RuleItem@Property','��ǰ����','ValueOf(''Now'')',4,0,1,0;

ALTER TABLE CMS_LayoutHtml ADD PageId NVARCHAR(100);

ALTER TABLE CMS_Zone ADD PageId NVARCHAR(100);

INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@Description', 'zh-CN', '����', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@RuleID', 'zh-CN', 'RuleID', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@RuleItemList', 'zh-CN', '������', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@Status', 'zh-CN', '״̬', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@Title', 'zh-CN', '����', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@ZoneName', 'zh-CN', '��ʾ����', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('RuleItem@Condition', 'zh-CN', '����', 'RuleItem', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('RuleItem@FunctionName', 'zh-CN', '���㷽ʽ', 'RuleItem', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('RuleItem@Property', 'zh-CN', '����', 'RuleItem', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('RuleItem@Value', 'zh-CN', 'ֵ', 'RuleItem', 'EntityProperty');