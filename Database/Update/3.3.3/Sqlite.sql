ALTER TABLE CMS_Redirection ADD IsPattern BIT null;

insert into Language (LanKey,CultureName,LanValue)
select 'UrlRedirect@IsPattern','zh-CN','使用正则表达式？';
