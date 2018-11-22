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
SELECT 'RuleItem@Condition','并且','and',1,0,1,0 UNION ALL
SELECT 'RuleItem@Condition','或者','or',2,0,1,0 UNION ALL

SELECT 'RuleItem@FunctionName','等于','Equals',1,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','不等于','NotEquals',2,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','大于','GreaterThan',3,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','大于等于','GreaterThanOrEquals',4,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','小于','LessThan',5,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','小于等于','LessThanOrEquals',6,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','以…开头','StartsWith',7,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','以...结尾','EndsWith',8,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','不以…开头','NotStartsWith',9,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','不以...结尾','NotEndsWith',10,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','包含','Contains',11,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','不包含','NotContains',12,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','在...里','In',13,0,1,0 UNION ALL
SELECT 'RuleItem@FunctionName','不在...里','NotIn',14,0,1,0 UNION ALL

SELECT 'RuleItem@Property','Url','ValueOf(''Url'')',1,0,1,0 UNION ALL
SELECT 'RuleItem@Property','Url参数','ValueOf(''QueryString'')',2,0,1,0 UNION ALL
SELECT 'RuleItem@Property','User-Agent','ValueOf(''UserAgent'')',3,0,1,0 UNION ALL
SELECT 'RuleItem@Property','当前日期','ValueOf(''Now'')',4,0,1,0;

ALTER TABLE CMS_LayoutHtml ADD PageId NVARCHAR(100);

ALTER TABLE CMS_Zone ADD PageId NVARCHAR(100);

INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@Description', 'zh-CN', '描述', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@RuleID', 'zh-CN', 'RuleID', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@RuleItemList', 'zh-CN', '条件组', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@Status', 'zh-CN', '状态', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@Title', 'zh-CN', '标题', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('Rule@ZoneName', 'zh-CN', '显示区域', 'Rule', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('RuleItem@Condition', 'zh-CN', '条件', 'RuleItem', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('RuleItem@FunctionName', 'zh-CN', '运算方式', 'RuleItem', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('RuleItem@Property', 'zh-CN', '属性', 'RuleItem', 'EntityProperty');
INSERT INTO [Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES ('RuleItem@Value', 'zh-CN', '值', 'RuleItem', 'EntityProperty');