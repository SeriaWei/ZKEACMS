#!/bin/sh

server='localhost'
dataBase='ZKEACMS'
dbUserId='sa'
dbPassword='sa'

echo Creating DataBase $dataBase
sqlcmd -x -S $server -d master -U $dbUserId -P $dbPassword -b -Q "DROP DATABASE IF EXISTS [$dataBase]"
sqlcmd -x -S $server -d master -U $dbUserId -P $dbPassword -b -Q "CREATE DATABASE [$dataBase]"

echo Creating Tables...
echo CMS_Layout
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_Layout.Table.sql

echo CMS_LayoutHtml
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_LayoutHtml.Table.sql

echo CMS_Zone
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_Zone.Table.sql

echo CMS_Page
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_Page.Table.sql

echo CMS_WidgetBase
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_WidgetBase.Table.sql

echo CMS_Media
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_Media.Table.sql

echo CMS_Theme
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_Theme.Table.sql

echo CMS_Message
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_Message.Table.sql

echo ArticleType
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ArticleType.Table.sql

echo Article
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Article.Table.sql

echo ArticleDetailWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ArticleDetailWidget.Table.sql

echo ArticleListWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ArticleListWidget.Table.sql

echo ArticleSummaryWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ArticleSummaryWidget.Table.sql

echo ArticleTopWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ArticleTopWidget.Table.sql

echo ArticleTypeWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ArticleTypeWidget.Table.sql

echo Carousel
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Carousel.Table.sql

echo CarouselWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CarouselWidget.Table.sql

echo CarouselItem
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CarouselItem.Table.sql

echo DataDictionary
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.DataDictionary.Table.sql

echo HtmlWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.HtmlWidget.Table.sql

echo ImageWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ImageWidget.Table.sql

echo Navigation
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Navigation.Table.sql

echo NavigationWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.NavigationWidget.Table.sql

echo ProductCategory
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ProductCategory.Table.sql

echo Product
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Product.Table.sql

echo ProductCategoryWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ProductCategoryWidget.Table.sql

echo ProductDetailWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ProductDetailWidget.Table.sql

echo ProductListWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ProductListWidget.Table.sql

echo SectionWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionWidget.Table.sql

echo SectionTemplate
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionTemplate.Table.sql

echo SectionGroup
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionGroup.Table.sql

echo SectionContent
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionContent.Table.sql

echo SectionContentCallToAction
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionContentCallToAction.Table.sql

echo SectionContentImage
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionContentImage.Table.sql

echo SectionContentParagraph
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionContentParagraph.Table.sql

echo SectionContentTitle
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionContentTitle.Table.sql

echo SectionContentVideo
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.SectionContentVideo.Table.sql

echo ScriptWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ScriptWidget.Table.sql

echo StyleSheetWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.StyleSheetWidget.Table.sql

echo VideoWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.VideoWidget.Table.sql

echo Language
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Language.Table.sql

echo Users
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Users.Table.sql

echo Roles
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Roles.Table.sql

echo UserRoleRelation
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.UserRoleRelation.Table.sql

echo Permission
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Permission.Table.sql

echo ExtendField
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ExtendField.Table.sql

echo PageView
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.PageView.Table.sql

echo ApplicationSetting
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ApplicationSetting.Table.sql

echo DataArchived
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.DataArchived.Table.sql

echo CMS_Redirection
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_Redirection.Table.sql

echo Forms
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Forms.Table.sql

echo FormData
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.FormData.Table.sql

echo FormDataItem
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.FormDataItem.Table.sql

echo ProductTag
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ProductTag.Table.sql

echo ProductCategoryTag
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ProductCategoryTag.Table.sql

echo ProductImage
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.ProductImage.Table.sql

echo Basket
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Basket.Table.sql

echo Order
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Order.Table.sql

echo OrderItem
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.OrderItem.Table.sql

echo Comments
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.Comments.Table.sql

echo Rule
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i Tables/dbo.CMS_Rule.Table.sql


echo InitailData...
echo ArticleType
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ArticleType.Table.sql

echo Article
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Article.Table.sql

echo ProductCategory
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ProductCategory.Table.sql

echo Product
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Product.Table.sql

echo DataDictionary
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.DataDictionary.Table.sql

echo CMS_Layout
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_Layout.Table.sql

echo CMS_LayoutHtml
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_LayoutHtml.Table.sql

echo CMS_Zone
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_Zone.Table.sql

echo CMS_Media
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_Media.Table.sql

echo CMS_Page
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_Page.Table.sql

echo CMS_Theme
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_Theme.Table.sql

echo Navigation
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Navigation.Table.sql

echo CMS_WidgetBase
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_WidgetBase.Table.sql

echo Carousel
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Carousel.Table.sql

echo CarouselWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CarouselWidget.Table.sql

echo CarouselItem
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CarouselItem.Table.sql

echo ArticleDetailWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ArticleDetailWidget.Table.sql

echo ArticleListWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ArticleListWidget.Table.sql

echo ArticleSummaryWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ArticleSummaryWidget.Table.sql

echo ArticleTopWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ArticleTopWidget.Table.sql

echo ArticleTypeWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ArticleTypeWidget.Table.sql

echo HtmlWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.HtmlWidget.Table.sql

echo ProductCategoryWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ProductCategoryWidget.Table.sql

echo ProductDetailWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ProductDetailWidget.Table.sql

echo ProductListWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ProductListWidget.Table.sql

echo NavigationWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.NavigationWidget.Table.sql

echo SectionTemplate
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionTemplate.Table.sql

echo SectionWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionWidget.Table.sql

echo SectionGroup
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionGroup.Table.sql

echo SectionContent
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionContent.Table.sql

echo SectionContentCallToAction
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionContentCallToAction.Table.sql

echo SectionContentTitle
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionContentTitle.Table.sql

echo SectionContentVideo
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionContentVideo.Table.sql

echo SectionContentImage
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionContentImage.Table.sql

echo SectionContentParagraph
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.SectionContentParagraph.Table.sql

echo ScriptWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ScriptWidget.Table.sql

echo StyleSheetWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.StyleSheetWidget.Table.sql

echo VideoWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.VideoWidget.Table.sql

echo ImageWidget
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ImageWidget.Table.sql

echo Language
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Language.Table.sql

echo Users
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Users.Table.sql

echo Roles
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Roles.Table.sql

echo UserRoleRelation
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.UserRoleRelation.Table.sql

echo Permission
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Permission.Table.sql

echo ApplicationSetting
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ApplicationSetting.Table.sql

echo CMS_Message
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_Message.Table.sql

echo DataArchived
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.DataArchived.Table.sql

echo ExtendField
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ExtendField.Table.sql

echo PageView
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.PageView.Table.sql

echo CMS_Redirection
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_Redirection.Table.sql

echo Forms
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Forms.Table.sql

echo FormData
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.FormData.Table.sql

echo FormDataItem
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.FormDataItem.Table.sql

echo ProductTag
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ProductTag.Table.sql

echo ProductCategoryTag
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ProductCategoryTag.Table.sql

echo ProductImage
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.ProductImage.Table.sql

echo Basket
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Basket.Table.sql

echo Order
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Order.Table.sql

echo OrderItem
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.OrderItem.Table.sql

echo Comments
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.Comments.Table.sql

echo Rule
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i InitialData/dbo.CMS_Rule.Table.sql