[![Auto Build](https://github.com/SeriaWei/ZKEACMS/actions/workflows/build.yml/badge.svg)](https://github.com/SeriaWei/ZKEACMS/actions/workflows/build.yml)

# ZKEACMS Build With .Net 6

ZKEACMS is a visual design, **WYSIWYG** Content Management System.

## Page Design
![Page Design](http://www.zkea.net/images/page-design.gif)

## Add Content To Page
![Add Content](http://www.zkea.net/images/add-content.gif)

**Get Started**

[http://www.zkea.net/zkeacms/videos/view/zkeacms-quick-start.html](http://www.zkea.net/zkeacms/videos/view/zkeacms-quick-start.html)

## Demo Site
Try it on our demo site:

[http://demo.zkea.net](http://demo.zkea.net)

**Create Page**

How to create a new page:

[http://www.zkea.net/zkeacms/videos/view/create-page.html](http://www.zkea.net/zkeacms/videos/view/create-page.html)

**Multi-tenant demo**

http://build.zkeasoft.com/

## Culture
Change the culture code to `en-US` to use english in `appsettings.json`

```
"Culture": {
  "Code": "en-US"
}
```
## Publish / Release
|Nuget|Version|
|---|---|
|ZKEACMS.Publisher|[![NuGet Badge](https://buildstats.info/nuget/ZKEACMS.Publisher?includePreReleases=true)](https://www.nuget.org/packages/ZKEACMS.Publisher)|

Use `Publish.cmd` or `Publish.sh` to publish the project.
You can also use the command line below to publish:

```
$ dotnet tool install -g ZKEACMS.Publisher
```
```
$ ./src/ZKEACMS.WebHost/publish-zkeacms
```
## Publish width runtime
```
$ ./src/ZKEACMS.WebHost/publish-zkeacms -r win-x64
```
## Run on Docker
https://hub.docker.com/r/zkeasoft/zkeacms
```
$ docker run -d -p 5000:80 zkeasoft/zkeacms:ent
```

## Development
* [.Net 6 SDK](https://dotnet.microsoft.com/download/dotnet/6.0)
* Microsoft Sql Server 2012+ / MySql 5.6+ / SQLite 3
* Microsoft Visual Studio 2019 / Visual Studio Code

## Responsive Design
ZKEACMS is featuring a modern responsive design that automatically adapts to different screen sizes and devices. From the PC, laptop, TV, tablet to the phone page will automatically adapt to adapt.

## Layout Design
![Layout Design](http://www.zkea.net/images/design-layout.jpg)

Layout is used to make a page of the zone, the user can drag the "row", "column" to design layout. The layout uses the Bootstrap3 Grid system.


## Widgets
![Widgets](http://www.zkea.net/images/widgets.png)

A widget is a `HTML Components`. Add different widget to build your page. Multiple widgets can be added to the same zone, and can be sorted by drag and drop. 

## Theme

Using LESS to create a theme, by modifying the variables, you can easily create a theme. 

The theme is base on Boorstrap.

![Theme](http://www.zkea.net/images/themes.jpg)

## Videos
[http://www.zkea.net/zkeacms/videos](http://www.zkea.net/zkeacms/videos)

**Enterprise Edition**

The following videos can help you to know the Enterprise Edition:

- https://v.vuevideo.net/share/post/5481323210292563522 
- https://v.vuevideo.net/share/post/-639458500689997299
- https://v.vuevideo.net/share/post/7761412908248591201 
- https://v.vuevideo.net/share/post/2774403749855987239 
- https://v.vuevideo.net/share/post/779279774519648270 


## Official Website
[http://www.zkea.net](http://www.zkea.net/zkeacms/zkeacmscore)


## 关注微信(ZKEASOFT)
![关注微信](http://www.zkea.net/images/qrcode.jpg)

## QQ群
纸壳CMS 群1（493586356） [点击加群](https://jq.qq.com/?_wv=1027&k=5SlfPaT)

纸壳CMS 群2（869382969）[点击加群](https://jq.qq.com/?_wv=1027&k=5A7a3Zt)

纸壳CMS 群3（805495289）[点击加群](https://jq.qq.com/?_wv=1027&k=5eprFzB)

## License
For commercial, keep your source code private/proprietary by purchasing a [Commercial License/Enterprise Edition](https://github.com/SeriaWei/ZKEACMS.Core/wiki/Purchase-commercial-license).

对于商业用途，请通过购买[企业版/Enterprise](http://www.zkea.net/zkeacms/enterprise)来私有化你的源代码。
