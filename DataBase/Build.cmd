@echo off
REM: 请根据您的个人实际情况修改以下信息：
set server=(local)
set dataBase=ZKEACMS
set dbUserId=sa
set dbPassword=sa
set dbPath=E:\GitHub\ZKEACMS.Core\App_Data
@echo -----------------------------------------------------------------------------
@echo *** 欢迎使用 ZKEACMS ***
@echo -----------------------------------------------------------------------------
@echo 运行该命令将初始化 ZKEACMS 的数据库。
@echo 在开始之前，请根据您的个人实际情况修改以下信息。（用记事打开这个文件）
@echo -----------------------------------------------------------------------------
@echo 请认真核对以下信息，确保正确：
@echo -----------------------------------------------------------------------------
@echo 数据库服务器: %server%
@echo 数据库名称: %dataBase%
@echo 登录名: %dbUserId%
@echo 密码: %dbPassword%
@echo 保存路径: %dbPath%\%database%.mdf
@echo *** 请确保文件夹已经存在 ***
@echo -----------------------------------------------------------------------------
@pause
@echo -----------------------------------------------------------------------------
@echo Creating DataBase %dataBase%
sqlcmd -S %server% -d master -U %dbUserId% -P %dbPassword% -b -i "CreateDataBase.sql"
if %ERRORLEVEL% NEQ 0 goto errors

@echo Creating Tables...
@echo CMS_Layout
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Layout.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_LayoutHtml
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_LayoutHtml.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Zone
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Zone.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Page
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Page.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_WidgetBase
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_WidgetBase.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_WidgetTemplate
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_WidgetTemplate.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Media
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Media.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Theme
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Theme.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Message
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Message.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleType
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleType.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Article
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Article.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleDetailWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleDetailWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleListWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleListWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleSummaryWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleSummaryWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleTopWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleTopWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleTypeWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleTypeWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Carousel
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Carousel.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CarouselWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CarouselWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CarouselItem
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CarouselItem.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo DataDictionary
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.DataDictionary.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo HtmlWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.HtmlWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo HtmlWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ImageWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Navigation
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Navigation.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo NavigationWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.NavigationWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductCategory
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductCategory.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Product
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Product.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductCategoryWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductCategoryWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductDetailWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductDetailWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductListWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductListWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionTemplate
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionTemplate.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionGroup
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionGroup.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContent
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContent.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentCallToAction
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentCallToAction.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentImage
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentImage.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentParagraph
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentParagraph.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentTitle
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentTitle.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentVideo
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentVideo.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ScriptWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ScriptWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo StyleSheetWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.StyleSheetWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo VideoWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.VideoWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Language
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Language.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Users
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Users.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Roles
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Roles.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo UserRoleRelation
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.UserRoleRelation.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Permission
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Permission.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ExtendField
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ExtendField.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo PageView
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.PageView.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ApplicationSetting
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ApplicationSetting.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo DataArchived
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.DataArchived.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors

@echo InitailData...
@echo ArticleType
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ArticleType.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Article
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Article.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Carousel
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Carousel.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CarouselItem
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CarouselItem.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductCategory
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ProductCategory.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Product
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Product.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo DataDictionary
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.DataDictionary.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Layout
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_Layout.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_LayoutHtml
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_LayoutHtml.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Zone
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_Zone.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_WidgetTemplate
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_WidgetTemplate.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Media
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_Media.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Page
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_Page.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Theme
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_Theme.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Navigation
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Navigation.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_WidgetBase
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_WidgetBase.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleDetailWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ArticleDetailWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleListWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ArticleListWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleSummaryWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ArticleSummaryWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleTopWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ArticleTopWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleTypeWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ArticleTypeWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CarouselWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CarouselWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo HtmlWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.HtmlWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductCategoryWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ProductCategoryWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductDetailWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ProductDetailWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductListWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ProductListWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo NavigationWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.NavigationWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionTemplate
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionTemplate.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionGroup
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionGroup.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContent
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionContent.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentCallToAction
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionContentCallToAction.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentTitle
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionContentTitle.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentVideo
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionContentVideo.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentImage
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionContentImage.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentParagraph
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.SectionContentParagraph.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ScriptWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ScriptWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo StyleSheetWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.StyleSheetWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo VideoWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.VideoWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ImageWidget
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ImageWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Language
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Language.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Users
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Users.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Roles
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Roles.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo UserRoleRelation
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.UserRoleRelation.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Permission
sqlcmd -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Permission.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors

@echo -----------------------------------------------------------------------------
@echo 数据库创建成功。
goto done

:errors
@echo -----------------------------------------------------------------------------
@echo 警告，在数据库创建过程中，出现了错误。
goto done
:done
@pause