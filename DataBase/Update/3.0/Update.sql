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

insert into DataDictionary(DicName,Title,DicValue,[Order],Pid,IsSystem,[Status])
select N'RuleItem@Condition',N'并且',N'and',1,0,1,0 union all
select N'RuleItem@Condition',N'或者',N'or',2,0,1,0 union all

select N'RuleItem@FunctionName',N'等于',N'Equals',1,0,1,0 union all
select N'RuleItem@FunctionName',N'不等于',N'NotEquals',2,0,1,0 union all
select N'RuleItem@FunctionName',N'以…开头',N'StartsWith',3,0,1,0 union all
select N'RuleItem@FunctionName',N'以...结尾',N'EndsWith',4,0,1,0 union all
select N'RuleItem@FunctionName',N'包含',N'Contains',5,0,1,0 union all
select N'RuleItem@FunctionName',N'不以…开头',N'NotStartsWith',6,0,1,0 union all
select N'RuleItem@FunctionName',N'不以...结尾',N'NotEndsWith',7,0,1,0 union all
select N'RuleItem@FunctionName',N'不包含',N'NotContains',8,0,1,0 union all

select N'RuleItem@Property',N'Url',N'ValueOf(''Url'')',8,0,1,0 union all
select N'RuleItem@Property',N'页面标题',N'ValueOf(''Title'')',8,0,1,0