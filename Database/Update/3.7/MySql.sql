
DROP TABLE IF EXISTS `EA_ActionBody`;
CREATE TABLE `EA_ActionBody` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Body` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `EA_ActionBody` DISABLE KEYS */;
INSERT INTO `EA_ActionBody` VALUES
(1,'<div>
    <h3>
       收到新留言
    </h3>
    <table border=\"1\" cellspacing=\"0\" cellpadding=\"5\" bgcolor=\"\" style=\"border-color: #eee;\">
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
</div>','收到留言板留言模板',NULL,1,'admin','ZKEASOFT','2023-03-05 18:49:06.000','admin','ZKEASOFT','2023-03-16 22:04:16.673'),
(2,'<div>
    <h3>
        重置密码
    </h3>
    <p>
        点击下方链接，或者复制链接到浏览器打开
    </p>
    <a href=\"{{this.Model.Link}}\" target=\"_blank\">{{this.Model.Link}}</a>
</div>','重置密码邮件模板',NULL,1,'admin','ZKEASOFT','2023-03-11 21:32:20.000','admin','ZKEASOFT','2023-03-16 22:03:47.810'),
(3,'<div>
    <h3>
        收到新评论
    </h3>
    <table border=\"1\" cellspacing=\"0\" cellpadding=\"5\" bgcolor=\"\" style=\"border-color: #eee;\">
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
</div>','收到新评论邮件模板',NULL,1,'admin','ZKEASOFT','2023-03-11 21:44:54.000','admin','ZKEASOFT','2023-03-16 22:03:57.627'),
(4,'<div>
    <h3>
        {{this.Model.Form.Title}}
    </h3>
    <table border=\"1\" cellspacing=\"0\" cellpadding=\"5\" bgcolor=\"\" style=\"border-color: #eee; \">
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
</div>','自定义表单邮件模板',NULL,1,'admin','ZKEASOFT','2023-03-11 22:06:21.000','admin','ZKEASOFT','2023-03-16 22:03:40.577');
/*!40000 ALTER TABLE `EA_ActionBody` ENABLE KEYS */;

DROP TABLE IF EXISTS `EA_EventAction`;
CREATE TABLE `EA_EventAction` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Event` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`Actions` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);

/*!40000 ALTER TABLE `EA_EventAction` DISABLE KEYS */;
INSERT INTO `EA_EventAction` VALUES
(1,'ZKEACMS.Message.Events.OnMessageSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 收到新留言
    to: webmaster@zkea.net
    bodyContentId: 1','发送新留言邮件通知',NULL,1,'admin','ZKEASOFT','2023-03-03 21:53:14.000','admin','ZKEASOFT','2023-03-12 21:12:14.787'),
(2,'ZKEACMS.Events.OnResetPassword','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 重置密码
    to: {{this.Model.Email}}
    bodyContentId: 2','发送重置密码发送邮件通知',NULL,1,'admin','ZKEASOFT','2023-03-11 21:33:51.000','admin','ZKEASOFT','2023-03-16 21:59:47.367'),
(3,'ZKEACMS.Message.Events.OnCommentsSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 有新评论
    to: webmaster@zkea.net
    bodyContentId: 3','发送新评论邮件通知',NULL,1,'admin','ZKEASOFT','2023-03-11 21:44:02.000','admin','ZKEASOFT','2023-03-16 22:05:12.060'),
(4,'ZKEACMS.FormGenerator.Events.OnFormDataSubmitted','actions:
- name: send email notification
  uses: actions/email
  with:
    subject: 收到新的表单提交
    to: {{this.Model.Form.NotificationReceiver}}
    bodyContentId: 4','发送自定义表单邮件通知',NULL,1,'admin','ZKEASOFT','2023-03-11 22:07:27.000','admin','ZKEASOFT','2023-03-16 22:06:44.227');
/*!40000 ALTER TABLE `EA_EventAction` ENABLE KEYS */;

DROP TABLE IF EXISTS `EA_PendingTask`;
CREATE TABLE `EA_PendingTask` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Identifier` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`HandlerName` VARCHAR(100) CHARACTER SET utf8mb4  NOT NULL,
	`Data` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`LogMessage` LONGTEXT CHARACTER SET utf8mb4  NULL,
	`RetryCount` INT  NULL,
	`Title` VARCHAR(200) CHARACTER SET utf8mb4  NULL,
	`Description` VARCHAR(500) CHARACTER SET utf8mb4  NULL,
	`Status` INT  NULL,
	`CreateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`CreatebyName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`CreateDate` DATETIME  NULL,
	`LastUpdateBy` VARCHAR(50) CHARACTER SET utf8mb4  NULL,
	`LastUpdateByName` VARCHAR(100) CHARACTER SET utf8mb4  NULL,
	`LastUpdateDate` DATETIME  NULL,
	PRIMARY KEY (`ID`)
);