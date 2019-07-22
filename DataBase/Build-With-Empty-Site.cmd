@echo off
cd /d %~dp0
REM:If garbled when running, the following link can help to resolve:
REM:http://www.zkea.net/zkeacms/document/issues
WHERE /Q sqlcmd
IF %ERRORLEVEL% NEQ 0 (
echo sqlcmd Utility is required, please install the tool before you run the command
@pause
start https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility
exit
)
@echo *****************************************
@echo ******** Welcome to use ZKEACMS *********
@echo *****************************************
@echo Documents
@echo http://www.zkea.net/zkeacms/document
@echo -----------------------------------------------------------------------------
@echo Will create the ZKEACMS database
@echo If you want to upgrade your existing database, execute the scripts under "Update" folder
@echo -----------------------------------------------------------------------------
@echo Press Enter to use the default setting
@echo Working directory:%cd%
set /P server=1.Sql Server address (local):
if "%server%"=="" set server=(local)
set /P dataBase=2.Database name (ZKEACMS):
if "%dataBase%"=="" set dataBase=ZKEACMS
set /P dbUserId=3.User name (sa):
if "%dbUserId%"=="" set dbUserId=sa
set /P dbPassword=4.Password (sa):
if "%dbPassword%"=="" set dbPassword=sa

@echo Please wait...
@echo Creating DataBase %dataBase%
sqlcmd -S %server% -d master -U %dbUserId% -P %dbPassword% -b -i "CreateDataBase.sql"
if %ERRORLEVEL% NEQ 0 goto errors

@echo Creating Tables...
@echo CMS_Layout
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Layout.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_LayoutHtml
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_LayoutHtml.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Zone
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Zone.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Page
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Page.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_WidgetBase
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_WidgetBase.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Media
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Media.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Theme
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Theme.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Message
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Message.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleType
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleType.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Article
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Article.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleDetailWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleDetailWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors

@echo ArticleSpecialDetailWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleSpecialDetailWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors

@echo ArticleListWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleListWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleSummaryWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleSummaryWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleTopWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleTopWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ArticleTypeWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ArticleTypeWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Carousel
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Carousel.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CarouselWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CarouselWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CarouselItem
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CarouselItem.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo DataDictionary
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.DataDictionary.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo HtmlWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.HtmlWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ImageWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ImageWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Navigation
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Navigation.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo NavigationWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.NavigationWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductCategory
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductCategory.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Product
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Product.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductCategoryWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductCategoryWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductDetailWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductDetailWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductListWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductListWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionTemplate
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionTemplate.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionGroup
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionGroup.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContent
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContent.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentCallToAction
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentCallToAction.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentImage
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentImage.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentParagraph
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentParagraph.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentTitle
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentTitle.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo SectionContentVideo
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.SectionContentVideo.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ScriptWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ScriptWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo StyleSheetWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.StyleSheetWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo VideoWidget
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.VideoWidget.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Language
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Language.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Users
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Users.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Roles
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Roles.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo UserRoleRelation
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.UserRoleRelation.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Permission
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Permission.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ExtendField
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ExtendField.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo PageView
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.PageView.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ApplicationSetting
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ApplicationSetting.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo DataArchived
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.DataArchived.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Redirection
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Redirection.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Forms
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Forms.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo FormData
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.FormData.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo FormDataItem
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.FormDataItem.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductTag
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductTag.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductCategoryTag
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductCategoryTag.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ProductImage
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.ProductImage.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Basket
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Basket.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Order
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Order.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo OrderItem
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.OrderItem.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Comments
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.Comments.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Rule
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "Tables\dbo.CMS_Rule.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors

@echo InitailData...
@echo DataDictionary
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.DataDictionary.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo CMS_Theme
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.CMS_Theme.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Language
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Language.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Users
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Users.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Roles
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Roles.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo UserRoleRelation
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.UserRoleRelation.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo Permission
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.Permission.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo ApplicationSetting
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.ApplicationSetting.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo DataArchived
sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "InitialData\dbo.DataArchived.Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors

@echo -----------------------------------------------------------------------------
@echo 数据库创建成功。
goto done

:errors
@echo -----------------------------------------------------------------------------
@echo 警告，在数据库创建过程中，出现了错误。请重新检查您的配置信息并重试。
goto done
:done
@pause