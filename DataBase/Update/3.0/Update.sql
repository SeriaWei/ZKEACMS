CREATE TABLE [dbo].[CMS_Rule](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[ZoneName] [nvarchar](50) NULL,
	[RuleExpression] [nvarchar](800) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[RuleItems] [nvarchar](max) NULL,
 CONSTRAINT [PK_CMS_Rule] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.CMS_WidgetBase ADD RuleID int
GO
INSERT INTO DataDictionary(DicName,Title,DicValue,[Order],Pid,IsSystem,[Status])
SELECT N'RuleItem@Condition',N'并且',N'and',1,0,1,0 UNION ALL
SELECT N'RuleItem@Condition',N'或者',N'or',2,0,1,0 UNION ALL

SELECT N'RuleItem@FunctionName',N'等于',N'Equals',1,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'不等于',N'NotEquals',2,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'大于',N'GreaterThan',3,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'大于等于',N'GreaterThanOrEquals',4,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'小于',N'LessThan',5,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'小于等于',N'LessThanOrEquals',6,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'以…开头',N'StartsWith',7,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'以...结尾',N'EndsWith',8,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'不以…开头',N'NotStartsWith',9,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'不以...结尾',N'NotEndsWith',10,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'包含',N'Contains',11,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'不包含',N'NotContains',12,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'在...里',N'In',13,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'不在...里',N'NotIn',14,0,1,0 UNION ALL

SELECT N'RuleItem@Property',N'Url',N'ValueOf(''Url'')',1,0,1,0 UNION ALL
SELECT N'RuleItem@Property',N'Url参数',N'ValueOf(''QueryString'')',2,0,1,0 UNION ALL
SELECT N'RuleItem@Property',N'User-Agent',N'ValueOf(''UserAgent'')',3,0,1,0 UNION ALL
SELECT N'RuleItem@Property',N'当前日期',N'ValueOf(''Now'')',4,0,1,0


GO

ALTER TABLE dbo.CMS_LayoutHtml ADD PageId NVARCHAR(100)
ALTER TABLE dbo.CMS_Zone ADD PageId NVARCHAR(100)

GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Description', N'zh-CN', N'描述', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleID', N'zh-CN', N'RuleID', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleItemList', N'zh-CN', N'条件组', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Status', N'zh-CN', N'状态', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Title', N'zh-CN', N'标题', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@ZoneName', N'zh-CN', N'显示区域', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Condition', N'zh-CN', N'条件', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@FunctionName', N'zh-CN', N'运算方式', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Property', N'zh-CN', N'属性', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Value', N'zh-CN', N'值', N'RuleItem', N'EntityProperty')
GO