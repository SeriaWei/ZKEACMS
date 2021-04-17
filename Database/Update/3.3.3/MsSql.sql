ALTER TABLE CMS_Redirection ADD IsPattern BIT null;

insert into Language (LanKey,CultureName,LanValue)
select N'UrlRedirect@IsPattern',N'zh-CN',N'使用正则表达式？';
