/****** Object:  Table [dbo].[EA_ActionBody]    Script Date: 2023/3/19 星期日 11:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_ActionBody](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ActionBody] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EA_EventAction]    Script Date: 2023/3/19 星期日 11:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_EventAction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Event] [nvarchar](100) NULL,
	[Actions] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_EventAction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EA_PendingTask]    Script Date: 2023/3/19 星期日 11:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_PendingTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Identifier] [nvarchar](200) NOT NULL,
	[HandlerName] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LogMessage] [nvarchar](max) NULL,
	[RetryCount] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_EA_PendingTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EA_ActionBody] ON 
GO
INSERT [dbo].[EA_ActionBody] ([ID], [Body], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'<div>
    <h3>
       收到新留言
    </h3>
    <table border="1" cellspacing="0" cellpadding="5" bgcolor="" style="border-color: #eee;">
        <tbody>
            <tr>
                <td>姓名</td>
                <td>{{this.Model.Title}}</td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td>{{this.Model.Email}}</td>
            </tr>
            <tr>
                <td>留言内容</td>
                <td>{{this.Model.PostMessage}}</td>
            </tr>
        </tbody>
    </table>
</div>', N'收到留言板留言模板', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-05T18:49:06.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:04:16.673' AS DateTime))
GO
INSERT [dbo].[EA_ActionBody] ([ID], [Body], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'<div>
    <h3>
        重置密码
    </h3>
    <p>
        点击下方链接，或者复制链接到浏览器打开
    </p>
    <a href="{{this.Model.Link}}" target="_blank">{{this.Model.Link}}</a>
</div>', N'重置密码邮件模板', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T21:32:20.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:03:47.810' AS DateTime))
GO
INSERT [dbo].[EA_ActionBody] ([ID], [Body], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'<div>
    <h3>
        收到新评论
    </h3>
    <table border="1" cellspacing="0" cellpadding="5" bgcolor="" style="border-color: #eee;">
        <tbody>
            <tr>
                <td>页面标题</td>
                <td>{{this.Model.Title}}</td>
            </tr>
            <tr>
                <td>用户名</td>
                <td>{{this.Model.UserName}}</td>
            </tr>
            <tr>
                <td>评论内容</td>
                <td>{{this.Model.CommentContent}}</td>
            </tr>
            <tr>
                <td>页面地址</td>
                <td>{{this.Model.PagePath}}</a></td>
            </tr>
        </tbody>
    </table>
</div>', N'收到新评论邮件模板', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T21:44:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:03:57.627' AS DateTime))
GO
INSERT [dbo].[EA_ActionBody] ([ID], [Body], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'<div>
    <h3>
        {{this.Model.Form.Title}}
    </h3>
    <table border="1" cellspacing="0" cellpadding="5" bgcolor="" style="border-color: #eee; ">
        <thead>
            <tr>
                <th>字段</th>
                <th>内容</th>
            </tr>
        </thead>
        <tbody>
            {% for field in this.Model.Form.FormFields %}
                <tr>
                    <td>
                        {{field.DisplayName}}
                    </td>
                    <td>
                        {{field.DisplayValue}}
                    </td>
                </tr>
            {% endfor %}
        </tbody>
    </table>
</div>', N'自定义表单邮件模板', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T22:06:21.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:03:40.577' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[EA_ActionBody] OFF
GO
SET IDENTITY_INSERT [dbo].[EA_EventAction] ON 
GO
INSERT [dbo].[EA_EventAction] ([ID], [Event], [Actions], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'ZKEACMS.Message.Events.OnMessageSubmitted', N'actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 收到新留言
    to: webmaster@zkea.net
    bodyContentId: 1', N'发送新留言邮件通知', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-03T21:53:14.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-12T21:12:14.787' AS DateTime))
GO
INSERT [dbo].[EA_EventAction] ([ID], [Event], [Actions], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'ZKEACMS.Events.OnResetPassword', N'actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 重置密码
    to: {{this.Model.Email}}
    bodyContentId: 2', N'发送重置密码发送邮件通知', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T21:33:51.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T21:59:47.367' AS DateTime))
GO
INSERT [dbo].[EA_EventAction] ([ID], [Event], [Actions], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'ZKEACMS.Message.Events.OnCommentsSubmitted', N'actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 有新评论
    to: webmaster@zkea.net
    bodyContentId: 3', N'发送新评论邮件通知', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T21:44:02.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:05:12.060' AS DateTime))
GO
INSERT [dbo].[EA_EventAction] ([ID], [Event], [Actions], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'ZKEACMS.FormGenerator.Events.OnFormDataSubmitted', N'actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 收到新的表单提交
    to: {{this.Model.Form.NotificationReceiver}}
    bodyContentId: 4', N'发送自定义表单邮件通知', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2023-03-11T22:07:27.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2023-03-16T22:06:44.227' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[EA_EventAction] OFF
GO
