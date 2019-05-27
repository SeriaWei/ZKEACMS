update Language set LanValue='英文名' where LanKey='ArticleEntity@Url' and CultureName='zh-CN';
update Language set LanValue='英文名' where LanKey='ArticleType@Url' and CultureName='zh-CN';
update Language set LanValue='英文名' where LanKey='ProductCategory@Url' and CultureName='zh-CN';
update Language set LanValue='英文名' where LanKey='ProductEntity@Url' and CultureName='zh-CN';

delete from [Language] where LanKey='ArticleSpecialDetailWidget@ArticleId';
delete from [Language] where LanKey='ArticleSpecialDetailWidget@ArticleName';
delete FROM [Language] where LanKey like 'TemplateFile@%';

insert into Language (LanKey,CultureName,LanValue,Module,LanType) VALUES('ArticleSpecialDetailWidget@ArticleId','zh-CN','文章ID','ArticleSpecialDetailWidget','EntityProperty');
insert into Language (LanKey,CultureName,LanValue,Module,LanType) VALUES('ArticleSpecialDetailWidget@ArticleName','zh-CN','文章英文名','ArticleSpecialDetailWidget','EntityProperty');

insert into Language (LanKey,CultureName,LanValue,Module,LanType) VALUES('TemplateFile@Content','zh-CN','模板代码','TemplateFile','EntityProperty');
insert into Language (LanKey,CultureName,LanValue,Module,LanType) VALUES('TemplateFile@LastUpdateTime','zh-CN','最后更新时间','TemplateFile','EntityProperty');
insert into Language (LanKey,CultureName,LanValue,Module,LanType) VALUES('TemplateFile@Name','zh-CN','名称','TemplateFile','EntityProperty');
insert into Language (LanKey,CultureName,LanValue,Module,LanType) VALUES('TemplateFile@RelativePath','zh-CN','模板路径','TemplateFile','EntityProperty');
insert into Language (LanKey,CultureName,LanValue,Module,LanType) VALUES('TemplateFile@ThemeName','zh-CN','主题','TemplateFile','EntityProperty');