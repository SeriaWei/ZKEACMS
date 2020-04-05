# ZKEACMS Build With Asp.Net Core 3.1

ZKEACMS is a visual design, **WYSIWYG** Content Management System.

## Page Design
![Page Design](https://user-images.githubusercontent.com/6006218/59973922-176ced80-95d8-11e9-9ff8-be71ae1a0787.gif)

## Add Content To Page
![Add Content](https://user-images.githubusercontent.com/6006218/59973935-33708f00-95d8-11e9-851b-3724defc7d1b.gif)

**Get Started**

[http://www.zkea.net/zkeacms/videos/view/zkeacms-quick-start.html](http://www.zkea.net/zkeacms/videos/view/zkeacms-quick-start.html)

## Demo Site
Try it on our demo site:

[http://demo.zkea.net](http://demo.zkea.net)

**Create Page**

[http://www.zkea.net/zkeacms/createpage](http://www.zkea.net/zkeacms/createpage)

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
* [.Net Core SDK 3.0](https://dot.net/get-core3)
* Microsoft Sql Server 2012+ / MySql 5.6+ / SQLite 3
* Microsoft Visual Studio 2019 / Visual Studio Code

## Responsive Design
ZKEACMS is featuring a modern responsive design that automatically adapts to different screen sizes and devices. From the PC, laptop, TV, tablet to the phone page will automatically adapt to adapt.

## Layout Design
![Layout Design](https://cloud.githubusercontent.com/assets/6006218/23800807/b4298c0a-05e8-11e7-834f-fef335e64a94.jpg)

Layout is used to make a page of the zone, the user can drag the "row", "column" to design layout. The layout uses the Bootstrap3 Grid system.


## Widgets
![Widgets](https://cloud.githubusercontent.com/assets/6006218/23800984/5c243978-05e9-11e7-8804-6a82e92b519b.png)

A widget is a `HTML Components`. Add different widget to build your page. Multiple widgets can be added to the same zone, and can be sorted by drag and drop. 

## Theme

Using LESS to create a theme, by modifying the variables, you can easily create a theme. 

The theme is base on Boorstrap.

![Theme](https://cloud.githubusercontent.com/assets/6006218/23801129/f5be52ee-05e9-11e7-8a7e-6465a4cb3c9f.jpg)

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
![关注微信](http://www.zkea.net/UpLoad/Images/20160318/263801921375bdf2.jpg)

## QQ群
纸壳CMS 群1（493586356） [点击加群](https://jq.qq.com/?_wv=1027&k=5SlfPaT)

纸壳CMS 群2（869382969）[点击加群](https://jq.qq.com/?_wv=1027&k=5A7a3Zt)

纸壳CMS 群3（805495289）[点击加群](https://jq.qq.com/?_wv=1027&k=5eprFzB)

## License
For commercial, keep your source code private/proprietary by purchasing a [Commercial License/Enterprise Edition](https://github.com/SeriaWei/ZKEACMS.Core/wiki/Purchase-commercial-license).

对于商业用途，请通过购买[企业版/Enterprise](http://www.zkea.net/zkeacms/enterprise)来私有化你的源代码。
