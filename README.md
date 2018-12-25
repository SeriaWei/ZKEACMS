# ZKEACMS Build With Asp.Net Core 2.2
## 简介 / Summary
ZKEACMS is a visual design, online edit content management system

纸壳CMS是一个可视化设计，在线编辑的内容管理系统，使用它可以快速创建一个美观、性能优异的响应式网站。

页面基本思想

[http://www.zkea.net/zkeacms/createpage](http://www.zkea.net/zkeacms/createpage)
## 演示 / Demo
Try it on our demo site, the demo site is Enterprise Edition:

在我们的测试站点进行体验，测试站是企业版：

[http://demo.zkea.net](http://demo.zkea.net)

**多租户演示 / Multi-tenant demo**

http://build.zkeasoft.com/

## Notice
Change the culture code to `en-US` to use english in `appsettings.json`

通过修改`appsettings.json`来将语言切换为英文：

```
"Culture": {
  "Code": "en-US"
}
```
## 发布 / Publish

Use `Publish.cmd / Publish.sh` to release the project or use the command line below:

使用 `Publish.cmd / Publish.sh`，或者使用下列命令进行发布：
```
dotnet tool install -g ZKEACMS.Publisher
```
```
./src/ZKEACMS.WebHost/publish-zkeacms
```
## 包含运行时发布 / Publish width runtime
```
./src/ZKEACMS.WebHost/publish-zkeacms -r win-x64
```
## Run on Docker
https://hub.docker.com/r/zkeasoft/zkeacms
```
docker run -d -p 5000:80 zkeasoft/zkeacms
```

## 开发环境 / Development
* [.Net Core SDK 2.2](https://aka.ms/dotnet-download)
* Microsoft Sql Server 2012+ / MySql 5.6+ / SQLite 3
* Microsoft Visual Studio 2017 15.9+ / Visual Studio Code

## 设计页面 / Page Design
![简单演示](http://ww4.sinaimg.cn/mw690/005zTNGqgw1f5e6o2kejlg30dw08an3g.gif)

## 添加内容 / Add Content
![简单演示](http://ww3.sinaimg.cn/mw690/005zTNGqgw1f4wcc6gjqqg30dw08g4jr.gif)

## 移动友好 / Responsive Design
ZKEACMS is featuring a modern responsive design that automatically adapts to different screen sizes and devices. From the PC, laptop, TV, tablet to the phone page will automatically adapt to adapt.

纸壳CMS采用了现代的响应式设计，可以自动适配不同大小的屏幕和设备。从PC，笔记本，电视，平板到手机页面都会自动响应适应。

## 布局设计 / Design Layout
![布局设计](https://cloud.githubusercontent.com/assets/6006218/23800807/b4298c0a-05e8-11e7-834f-fef335e64a94.jpg)

Layout is used to make a page of the zone, the user can drag the "row", "column" to design layout. The layout uses the Bootstrap3 Grid system.

布局，用于对页面做区域划分，用户使用拖拉“行”，“列”的方式进行布局的设计。布局采用的是Bootstrap3的Grid系统。


## 组件 / Widgets
![选择组件](https://cloud.githubusercontent.com/assets/6006218/23800984/5c243978-05e9-11e7-8804-6a82e92b519b.png)

A widget is a `HTML Components`. Add different widget to build your page. Multiple widgets can be added to the same zone, and can be sorted by drag and drop. 

组件，就是于丰富网站内容的小部件。你可以添加各式各样的组件来满足你网站的需求。同一组件区域可以添加多个组件并且可以对其进行拖拉排序。

## 主题 / Theme

Using LESS to create a theme, by modifying the variables, you can easily create a theme.

纸壳CMS的主题使用了LESS，通过修改变量，就可以轻松的创建主题。

![主题](https://cloud.githubusercontent.com/assets/6006218/23801129/f5be52ee-05e9-11e7-8a7e-6465a4cb3c9f.jpg)

## 视频演示 / Videos
[http://www.zkea.net/zkeacms/videos](http://www.zkea.net/zkeacms/videos)

**企业版演示 / Enterprise Edition**

The following videos will help you know the Enterprise Edition:

下面这些演示视频有助于您了解企业版：
- https://v.vuevideo.net/share/post/5481323210292563522 
- https://v.vuevideo.net/share/post/-639458500689997299
- https://v.vuevideo.net/share/post/7761412908248591201 
- https://v.vuevideo.net/share/post/2774403749855987239 
- https://v.vuevideo.net/share/post/779279774519648270 


## 官方网站 / Official Website
[http://www.zkea.net](http://www.zkea.net/zkeacms/zkeacmscore)


## 关注微信(ZKEASOFT)
![关注微信](http://www.zkea.net/UpLoad/Images/20160318/263801921375bdf2.jpg)

## QQ群
纸壳CMS群1（493586356）满 [点击加群](https://jq.qq.com/?_wv=1027&k=5SlfPaT)

纸壳CMS群2（869382969）[点击加群](https://jq.qq.com/?_wv=1027&k=5A7a3Zt)

## License
For commercial, keep your source code private/proprietary by purchasing a [Commercial License/Enterprise Edition](https://github.com/SeriaWei/ZKEACMS.Core/wiki/Purchase-commercial-license).

对于商业用途，请通过购买[企业版/Enterprise](http://www.zkea.net/zkeacms/enterprise)来私有化你的源代码。
