# ZKEACMS - Project Context for Qwen Code

## Project Overview

ZKEACMS is a visual design, **WYSIWYG** Content Management System built with .NET 9. It features a modern responsive design that automatically adapts to different screen sizes and devices. The system allows users to create pages with a drag-and-drop interface, add content through widgets, and customize themes using LESS CSS.

Key features include:
- Page design with visual WYSIWYG editor
- Layout design using Bootstrap 3 Grid system
- Widget-based content system
- Theme customization with LESS
- Multi-tenant support
- Responsive design for all devices

## Technology Stack

- **Backend**: .NET 9, ASP.NET Core
- **Frontend**: Bootstrap 3, LESS, JavaScript
- **Database**: Supports Microsoft SQL Server, MySQL, and SQLite
- **Build Tools**: Gulp for frontend asset compilation
- **Containerization**: Docker support
- **Logging**: Serilog
- **Testing**: MSTest, Moq, Selenium

## Project Structure

The solution contains multiple projects organized in a modular architecture:

### Main Projects
- `ZKEACMS.WebHost` - Main web application host
- `ZKEACMS` - Core CMS functionality
- `EasyFrameWork` - Custom framework components
- `ZKEACMS.SectionWidget` - Section widget implementation
- Multiple plugin projects (Product, Article, Message, etc.)

### Supporting Projects
- `test/*` - Unit and integration tests
- `tools/*` - Development tools and templates

## Development Environment

### Prerequisites
- .NET 9 SDK
- Microsoft SQL Server 2016+ / MySQL 5.6+ / SQLite 3
- Visual Studio 2022 or Visual Studio Code
- Node.js and npm (for frontend asset compilation)

### Frontend Asset Compilation
The project uses Gulp for compiling LESS themes and minifying JavaScript/CSS files:
- `gulp compile-theme:default` - Compile the default theme
- `gulp watch:minify-js-css` - Watch and minify JS/CSS files

## Building and Running

### Development
1. **Build the project**:
   ```bash
   ./Build.cmd  # Windows
   ./Build.sh   # Linux/Mac
   ```
   Or use: `dotnet build ZKEACMS.sln`

2. **Run the project**:
   ```bash
   ./Run.cmd  # Windows
   ./Run.sh   # Linux/Mac
   ```
   Or use: `dotnet run --project src/ZKEACMS.WebHost`

3. **Development server** starts at: http://localhost:5000

### Production
1. **Publish the project**:
   ```bash
   ./Publish.cmd  # Windows
   ./Publish.sh   # Linux/Mac
   ```
   Or use: `dotnet publish src/ZKEACMS.WebHost`

2. **Published output** is located at: `src/ZKEACMS.WebHost/bin/Release/PublishOutput`

### Docker
Run with Docker:
```bash
docker run -d -p 5000:8080 zkeasoft/zkeacms:ent
```

Build custom Docker image:
```bash
docker build -t zkeacms .
```

## Configuration

### Database Configuration
The application supports multiple database providers. Configuration is in `appsettings.json`:

**SQL Server (default)**:
```json
"Database": {
  "DbType": "MsSql",
  "ConnectionString": "Server=(local);Database=ZKEACMS;User Id=sa;Password=sa;TrustServerCertificate=True"
}
```

**SQLite**:
```json
"Database": {
  "DbType": "Sqlite",
  "ConnectionString": "Data Source=App_Data/Database.sqlite"
}
```

**MySQL**:
```json
"Database": {
  "DbType": "MySql",
  "ConnectionString": "Server=localhost;Database=ZKEACMS;User Id=root;Password=root;"
}
```

### Language/Culture
Change the culture in `appsettings.json`:
```json
"Culture": {
  "Code": "en-US"  // or "zh-CN" for Chinese
}
```

## Testing

Unit and integration tests are implemented using MSTest with Moq for mocking. UI testing is done with Selenium.

Run tests with:
```bash
dotnet test
```

## Deployment

### Publishing with Runtime
To publish with a specific runtime:
```bash
./src/ZKEACMS.WebHost/publish-zkeacms -r win-x64
```

### Multi-tenant Deployment
The system supports multi-tenant deployment. Demo available at: http://build.zkeasoft.com/

## Development Conventions

1. **Modular Architecture**: Functionality is separated into individual projects/plugins
2. **Widget System**: Content is added to pages through widgets
3. **Theme Customization**: Themes are created using LESS with variables for easy customization
4. **Responsive Design**: All components are designed to be responsive
5. **Localization**: Multiple language support through YAML files

## Useful Resources

- **Official Website**: http://www.zkea.net
- **Demo Site**: http://demo.zkea.net
- **Documentation**: http://www.zkea.net/zkeacms/videos
- **Quick Start Guide**: http://www.zkea.net/zkeacms/videos/view/zkeacms-quick-start.html

## Service接口技术文档

# ZKEACMS Service接口技术文档

## 1. EasyFrameWork

### 1.1 ICacheManager
- **描述**: 缓存管理接口
- **方法列表**:
  - `Get<T>(string key)` → `T`: 根据键获取缓存值
  - `Set<T>(string key, T value)` → `void`: 设置缓存值
  - `Set<T>(string key, T value, TimeSpan expire)` → `void`: 设置带过期时间的缓存值
  - `Remove(string key)` → `void`: 移除缓存项
  - `Clear()` → `void`: 清空所有缓存

### 1.2 ISignals
- **描述**: 信号管理接口
- **方法列表**:
  - `Trigger(string signal)` → `void`: 触发信号
  - `When(string signal, Action action)` → `void`: 当信号触发时执行操作

### 1.3 IValueTypeConvert
- **描述**: 值类型转换接口
- **方法列表**:
  - `Convert<T>(object value)` → `T`: 将对象转换为指定类型

### 1.4 IEncryptService
- **描述**: 加密服务接口
- **方法列表**:
  - `Encrypt(string source)` → `string`: 加密字符串
  - `Decrypt(string source)` → `string`: 解密字符串

### 1.5 IApplicationContext
- **描述**: 应用上下文接口
- **方法列表**:
  - `GetCurrentUser()` → `IUser`: 获取当前用户
  - `SetCurrentUser(IUser user)` → `void`: 设置当前用户

### 1.6 IDGenerator
- **描述**: ID生成器接口
- **方法列表**:
  - `GenerateId()` → `string`: 生成唯一ID

### 1.7 ILocalize
- **描述**: 本地化接口
- **方法列表**:
  - `Get(string key)` → `string`: 根据键获取本地化字符串
  - `Get(string key, params object[] args)` → `string`: 根据键和参数获取本地化字符串

### 1.8 IViewMetaData
- **描述**: 视图元数据接口
- **方法列表**:
  - `GetMetaData(string key)` → `object`: 获取元数据
  - `SetMetaData(string key, object value)` → `void`: 设置元数据

### 1.9 IImage
- **描述**: 图片接口
- **方法列表**:
  - `Resize(int width, int height)` → `IImage`: 调整图片大小
  - `Crop(int x, int y, int width, int height)` → `IImage`: 裁剪图片

### 1.10 IUser
- **描述**: 用户接口
- **方法列表**:
  - `get; set;` → `string UserID`: 用户ID属性
  - `get; set;` → `string UserName`: 用户名属性
  - `get; set;` → `string NickName`: 昵称属性
  - `get; set;` → `string PassWord`: 密码属性

### 1.11 IDataDictionaryService
- **描述**: 数据字典服务接口
- **方法列表**:
  - `Get(string key)` → `string`: 根据键获取数据字典值
  - `Set(string key, string value)` → `void`: 设置数据字典值

### 1.12 ILanguageService
- **描述**: 语言服务接口
- **方法列表**:
  - `GetCurrentCulture()` → `CultureInfo`: 获取当前语言文化信息
  - `SetCurrentCulture(string culture)` → `void`: 设置当前语言文化信息

### 1.13 IPermissionService
- **描述**: 权限服务接口
- **方法列表**:
  - `HasPermission(string permission)` → `bool`: 检查是否有指定权限
  - `AddPermission(string permission)` → `void`: 添加权限

### 1.14 IRoleService
- **描述**: 角色服务接口
- **方法列表**:
  - `GetRoles()` → `IEnumerable<RoleEntity>`: 获取所有角色
  - `CreateRole(string roleName)` → `RoleEntity`: 创建角色

### 1.15 IUserRoleRelationService
- **描述**: 用户角色关系服务接口
- **方法列表**:
  - `GetUserRoles(string userId)` → `IEnumerable<RoleEntity>`: 获取用户角色
  - `AssignRoleToUser(string userId, string roleId)` → `void`: 为用户分配角色

### 1.16 IUserService
- **描述**: 用户服务接口
- **方法列表**:
  - `GetUser(string userId)` → `T`: 获取用户
  - `GetUsers()` → `IEnumerable<T>`: 获取所有用户
  - `AddUser(T user)` → `void`: 添加用户
  - `UpdateUser(T user)` → `void`: 更新用户
  - `DeleteUser(string userId)` → `void`: 删除用户

### 1.17 IAuthorizer
- **描述**: 授权器接口
- **方法列表**:
  - `Authorize(ActionContext context)` → `bool`: 授权检查

### 1.18 IPluginLoader
- **描述**: 插件加载器接口
- **方法列表**:
  - `LoadPlugins()` → `void`: 加载插件

### 1.19 IPluginStartup
- **描述**: 插件启动接口
- **方法列表**:
  - `ConfigureServices(IServiceCollection services)` → `void`: 配置服务
  - `Configure(IApplicationBuilder app, IWebHostEnvironment env)` → `void`: 配置应用

### 1.20 IViewRenderService
- **描述**: 视图渲染服务接口
- **方法列表**:
  - `RenderAsync<TModel>(string viewName, TModel model)` → `Task<string>`: 渲染视图

### 1.21 IRouteRegister
- **描述**: 路由注册接口
- **方法列表**:
  - `RegisterRoutes(IRouteBuilder routes)` → `void`: 注册路由

### 1.22 IApplicationContextStateProvider
- **描述**: 应用上下文状态提供者接口
- **方法列表**:
  - `GetState(string name)` → `object`: 获取状态
  - `SetState(string name, object value)` → `void`: 设置状态

### 1.23 ICookie
- **描述**: Cookie接口
- **方法列表**:
  - `GetValue(string key)` → `string`: 获取Cookie值
  - `SetValue(string key, string value)` → `void`: 设置Cookie值

### 1.24 IWebClient
- **描述**: WebClient接口
- **方法列表**:
  - `DownloadString(string url)` → `string`: 下载字符串
  - `UploadString(string url, string data)` → `string`: 上传字符串

### 1.25 IRequestInjector
- **描述**: 请求注入器接口
- **方法列表**:
  - `Inject(HttpRequestMessage request)` → `void`: 注入请求

### 1.26 IRequestSerializer
- **描述**: 请求序列化器接口
- **方法列表**:
  - `Serialize(object obj)` → `string`: 序列化对象

### 1.27 IEmailNotification
- **描述**: 邮件通知接口
- **方法列表**:
  - `Send(string to, string subject, string body)` → `void`: 发送邮件

### 1.28 INotificationManager
- **描述**: 通知管理器接口
- **方法列表**:
  - `Notify(string type, object data)` → `void`: 发送通知

### 1.29 INotificationProvider
- **描述**: 通知提供者接口
- **方法列表**:
  - `Send(object data)` → `void`: 发送通知

### 1.30 ISmtpProvider
- **描述**: SMTP提供者接口
- **方法列表**:
  - `Send(MailMessage message)` → `void`: 发送邮件

### 1.31 IEmailQueue
- **描述**: 邮件队列接口
- **方法列表**:
  - `Enqueue(MailMessage message)` → `void`: 入队邮件
  - `Dequeue()` → `MailMessage`: 出队邮件

### 1.32 IOnModelCreating
- **描述**: 模型创建接口
- **方法列表**:
  - `OnModelCreating(ModelBuilder modelBuilder)` → `void`: 在模型创建时调用

### 1.33 IService
- **描述**: 服务接口
- **方法列表**:
  - `Get()` → `IEnumerable<T>`: 获取所有实体
  - `Get(object id)` → `T`: 根据ID获取实体
  - `Add(T item)` → `void`: 添加实体
  - `Update(T item)` → `void`: 更新实体
  - `Remove(T item)` → `void`: 删除实体

### 1.34 IRuleManager
- **描述**: 规则管理器接口
- **方法列表**:
  - `RegisterRule(string name, Func<object, bool> rule)` → `void`: 注册规则
  - `Evaluate(string name, object data)` → `bool`: 评估规则

### 1.35 IRuleProvider
- **描述**: 规则提供者接口
- **方法列表**:
  - `GetRules()` → `IEnumerable<Rule>`: 获取规则

### 1.36 IAstNodeWithToken
- **描述**: 带标记的AST节点接口
- **方法列表**:
  - `get; set;` → `Token Token`: 标记属性

### 1.37 IGlobalMethodProvider
- **描述**: 全局方法提供者接口
- **方法列表**:
  - `GetMethods()` → `IEnumerable<MethodInfo>`: 获取方法

### 1.38 IScriptExpressionEvaluator
- **描述**: 脚本表达式评估器接口
- **方法列表**:
  - `Evaluate(string expression, object context)` → `object`: 评估表达式

### 1.39 IAppStartTask
- **描述**: 应用启动任务接口
- **方法列表**:
  - `DoWork()` → `void`: 执行任务

### 1.40 IStorage
- **描述**: 存储接口
- **方法列表**:
  - `Save(string key, byte[] data)` → `void`: 保存数据
  - `Load(string key)` → `byte[]`: 加载数据

## 2. ZKEACMS.Article

### 2.1 IArticleApiService
- **描述**: 文章API服务接口
- **方法列表**:
  - `GetArticles()` → `IEnumerable<ArticleEntity>`: 获取文章列表
  - `GetArticle(int id)` → `ArticleEntity`: 获取文章详情

### 2.2 IArticleGalleryWidgetDataService
- **描述**: 文章画廊部件数据服务接口
- **方法列表**:
  - `GetArticleGalleries()` → `IEnumerable<ArticleGalleryEntity>`: 获取文章画廊列表

### 2.3 IArticleListWidgetDataService
- **描述**: 文章列表部件数据服务接口
- **方法列表**:
  - `GetArticleLists()` → `IEnumerable<ArticleListEntity>`: 获取文章列表数据

### 2.4 IArticleSummaryWidgetDataService
- **描述**: 文章摘要部件数据服务接口
- **方法列表**:
  - `GetArticleSummaries()` → `IEnumerable<ArticleSummaryEntity>`: 获取文章摘要数据

### 2.5 IArticleTopWidgetDataService
- **描述**: 置顶文章部件数据服务接口
- **方法列表**:
  - `GetTopArticles()` → `IEnumerable<ArticleTopEntity>`: 获取置顶文章数据

### 2.6 IArticleTypeApiService
- **描述**: 文章类型API服务接口
- **方法列表**:
  - `GetArticleTypes()` → `IEnumerable<ArticleType>`: 获取文章类型列表

## 3. ZKEACMS.Distribution

### 3.1 IPersistKeyService
- **描述**: 持久化密钥服务接口
- **方法列表**:
  - `GetKey()` → `string`: 获取密钥
  - `SetKey(string key)` → `void`: 设置密钥

## 4. ZKEACMS.EventAction

### 4.1 IActionExecutor
- **描述**: 动作执行器接口
- **方法列表**:
  - `Execute(ActionEntity action)` → `void`: 执行动作

### 4.2 IExecutorManager
- **描述**: 执行器管理器接口
- **方法列表**:
  - `GetExecutor(string type)` → `IActionExecutor`: 获取执行器

### 4.3 IHttpRequesetSender
- **描述**: HTTP请求发送器接口
- **方法列表**:
  - `Send(HttpRequest request)` → `HttpResponse`: 发送HTTP请求

### 4.4 IActionBodyService
- **描述**: 动作体服务接口
- **方法列表**:
  - `ParseBody(string body, object context)` → `string`: 解析动作体

### 4.5 IEventActionService
- **描述**: 事件动作服务接口
- **方法列表**:
  - `GetActions(string eventName)` → `IEnumerable<ActionEntity>`: 获取事件动作

### 4.6 IHttpRequestExecutor
- **描述**: HTTP请求执行器接口
- **方法列表**:
  - `Execute(HttpRequest request)` → `HttpResponse`: 执行HTTP请求

### 4.7 IPendingTaskManagerService
- **描述**: 待处理任务管理服务接口
- **方法列表**:
  - `AddTask(PendingTask task)` → `void`: 添加待处理任务
  - `ProcessTasks()` → `void`: 处理待处理任务

## 5. ZKEACMS.FormGenerator

### 5.1 IFormDataApiService
- **描述**: 表单数据API服务接口
- **方法列表**:
  - `GetFormData(int formId)` → `FormData`: 获取表单数据

### 5.2 IFormDataItemService
- **描述**: 表单数据项服务接口
- **方法列表**:
  - `GetItems(int formDataId)` → `IEnumerable<FormDataItem>`: 获取表单数据项

### 5.3 IFormDataService
- **描述**: 表单数据服务接口
- **方法列表**:
  - `Submit(FormData formData)` → `void`: 提交表单数据

### 5.4 IFormService
- **描述**: 表单服务接口
- **方法列表**:
  - `GetForm(int formId)` → `Form`: 获取表单

### 5.5 IFormDataValidator
- **描述**: 表单数据验证器接口
- **方法列表**:
  - `Validate(FormData formData)` → `bool`: 验证表单数据

## 6. ZKEACMS.Message

### 6.1 ICommentsService
- **描述**: 评论服务接口
- **方法列表**:
  - `GetComments(int contentId)` → `IEnumerable<Comment>`: 获取评论
  - `AddComment(Comment comment)` → `void`: 添加评论

### 6.2 IMessageService
- **描述**: 消息服务接口
- **方法列表**:
  - `GetMessages()` → `IEnumerable<MessageEntity>`: 获取消息
  - `SendMessage(MessageEntity message)` → `void`: 发送消息

## 7. ZKEACMS.Product

### 7.1 IProductApiService
- **描述**: 产品API服务接口
- **方法列表**:
  - `GetProducts()` → `IEnumerable<ProductEntity>`: 获取产品列表

### 7.2 IProductCategoryApiService
- **描述**: 产品分类API服务接口
- **方法列表**:
  - `GetProductCategories()` → `IEnumerable<ProductCategory>`: 获取产品分类列表

### 7.3 IProductGalleryWidgetDataService
- **描述**: 产品画廊部件数据服务接口
- **方法列表**:
  - `GetProductGalleries()` → `IEnumerable<ProductGalleryEntity>`: 获取产品画廊数据

### 7.4 IProductListWidgetDataService
- **描述**: 产品列表部件数据服务接口
- **方法列表**:
  - `GetProductLists()` → `IEnumerable<ProductListEntity>`: 获取产品列表数据

## 8. ZKEACMS.Redirection

### 8.1 IUrlRedirectService
- **描述**: URL重定向服务接口
- **方法列表**:
  - `GetRedirect(string oldUrl)` → `UrlRedirect`: 获取重定向规则
  - `AddRedirect(UrlRedirect redirect)` → `void`: 添加重定向规则

## 9. ZKEACMS.SectionWidget

### 9.1 ISectionContentCallToActionService
- **描述**: 区块内容行动号召服务接口
- **方法列表**:
  - `GetCallToActions()` → `IEnumerable<SectionContentCallToAction>`: 获取行动号召内容

### 9.2 ISectionContentImageService
- **描述**: 区块内容图片服务接口
- **方法列表**:
  - `GetImages()` → `IEnumerable<SectionContentImage>`: 获取图片内容

### 9.3 ISectionContentProviderService
- **描述**: 区块内容提供者服务接口
- **方法列表**:
  - `GetContentProviders()` → `IEnumerable<SectionContentProvider>`: 获取内容提供者

### 9.4 ISectionContentService
- **描述**: 区块内容服务接口
- **方法列表**:
  - `GetContents()` → `IEnumerable<SectionContent>`: 获取内容

### 9.5 ISectionContentTitleService
- **描述**: 区块内容标题服务接口
- **方法列表**:
  - `GetTitles()` → `IEnumerable<SectionContentTitle>`: 获取标题内容

### 9.6 ISectionGroupService
- **描述**: 区块组服务接口
- **方法列表**:
  - `GetGroups()` → `IEnumerable<SectionGroup>`: 获取区块组

### 9.7 ISectionTemplateService
- **描述**: 区块模板服务接口
- **方法列表**:
  - `GetTemplates()` → `IEnumerable<SectionTemplate>`: 获取区块模板

### 9.8 ISectionWidgetService
- **描述**: 区块部件服务接口
- **方法列表**:
  - `GetWidgets()` → `IEnumerable<SectionWidget>`: 获取区块部件

## 10. ZKEACMS.Shop

### 10.1 IBasketService
- **描述**: 购物篮服务接口
- **方法列表**:
  - `GetBasket(string userId)` → `Basket`: 获取购物篮
  - `AddToBasket(BasketItem item)` → `void`: 添加到购物篮

### 10.2 IOrderItemService
- **描述**: 订单项服务接口
- **方法列表**:
  - `GetOrderItems(int orderId)` → `IEnumerable<OrderItem>`: 获取订单项

### 10.3 IOrderService
- **描述**: 订单服务接口
- **方法列表**:
  - `GetOrders(string userId)` → `IEnumerable<Order>`: 获取订单
  - `CreateOrder(Order order)` → `Order`: 创建订单

### 10.4 IPaymentService
- **描述**: 支付服务接口
- **方法列表**:
  - `ProcessPayment(Payment payment)` → `PaymentResult`: 处理支付

## 11. ZKEACMS.Sitemap

### 11.1 ISitemapService
- **描述**: 站点地图服务接口
- **方法列表**:
  - `GetSitemap()` → `IEnumerable<SitemapNode>`: 获取站点地图

## 12. ZKEACMS.SpiderLog

### 12.1 ISearchEngineManager
- **描述**: 搜索引擎管理器接口
- **方法列表**:
  - `GetSearchEngines()` → `IEnumerable<SearchEngine>`: 获取搜索引擎

### 12.2 ISearchEngineService
- **描述**: 搜索引擎服务接口
- **方法列表**:
  - `LogSpiderVisit(SpiderLog log)` → `void`: 记录蜘蛛访问

### 12.3 ISpiderLogData
- **描述**: 蜘蛛日志数据接口
- **方法列表**:
  - `GetLogs()` → `IEnumerable<SpiderLog>`: 获取日志

## 13. ZKEACMS.TemplateImporter

### 13.1 ITemplateImporterService
- **描述**: 模板导入服务接口
- **方法列表**:
  - `ImportTemplate(string filePath)` → `void`: 导入模板

### 13.2 IWdigetCreatorManager
- **描述**: 部件创建器管理器接口
- **方法列表**:
  - `GetCreators()` → `IEnumerable<IWidgetCreatorService>`: 获取创建器

### 13.3 IWidgetCreatorService
- **描述**: 部件创建器服务接口
- **方法列表**:
  - `CreateWidget(string type)` → `WidgetBase`: 创建部件

## 14. ZKEACMS.Updater

### 14.1 IDbUpdaterService
- **描述**: 数据库更新服务接口
- **方法列表**:
  - `UpdateDatabase()` → `void`: 更新数据库

## 15. ZKEACMS

### 15.1 IUserCenterLinkService
- **描述**: 用户中心链接服务接口
- **方法列表**:
  - `GetLinks()` → `IEnumerable<UserCenterLink>`: 获取链接

### 15.2 IUserCenterLinksProvider
- **描述**: 用户中心链接提供者接口
- **方法列表**:
  - `GetLinks()` → `IEnumerable<UserCenterLink>`: 获取链接

### 15.3 IArticleGalleryService
- **描述**: 文章画廊服务接口
- **方法列表**:
  - `GetGalleries()` → `IEnumerable<ArticleGallery>`: 获取画廊

### 15.4 IArticleService
- **描述**: 文章服务接口
- **方法列表**:
  - `GetArticles()` → `IEnumerable<ArticleEntity>`: 获取文章
  - `GetArticle(int id)` → `ArticleEntity`: 获取文章详情

### 15.5 IArticleTypeService
- **描述**: 文章类型服务接口
- **方法列表**:
  - `GetTypes()` → `IEnumerable<ArticleType>`: 获取文章类型

### 15.6 IArticleUrlService
- **描述**: 文章URL服务接口
- **方法列表**:
  - `GetUrl(ArticleEntity article)` → `string`: 获取文章URL

### 15.7 ICaptchaCodeStorageProvider
- **描述**: 验证码存储提供者接口
- **方法列表**:
  - `Store(string key, string code)` → `void`: 存储验证码
  - `Get(string key)` → `string`: 获取验证码

### 15.8 IImageCaptchaService
- **描述**: 图片验证码服务接口
- **方法列表**:
  - `Generate()` → `string`: 生成验证码
  - `Validate(string code)` → `bool`: 验证验证码

### 15.9 IImageGenerator
- **描述**: 图片生成器接口
- **方法列表**:
  - `Generate(string text)` → `byte[]`: 生成图片

### 15.10 ICarouselItemService
- **描述**: 轮播项服务接口
- **方法列表**:
  - `GetItems(int carouselId)` → `IEnumerable<CarouselItemEntity>`: 获取轮播项

### 15.11 ICarouselService
- **描述**: 轮播服务接口
- **方法列表**:
  - `GetCarousels()` → `IEnumerable<CarouselEntity>`: 获取轮播

### 15.12 IEventViewerService
- **描述**: 事件查看服务接口
- **方法列表**:
  - `GetEvents()` → `IEnumerable<EventViewer>`: 获取事件

### 15.13 INavigationService
- **描述**: 导航服务接口
- **方法列表**:
  - `GetNavigations()` → `IEnumerable<NavigationEntity>`: 获取导航

### 15.14 ITemplateService
- **描述**: 模板服务接口
- **方法列表**:
  - `GetTemplates()` → `IEnumerable<TemplateEntity>`: 获取模板

### 15.15 ICurrencyService
- **描述**: 货币服务接口
- **方法列表**:
  - `GetCurrencies()` → `IEnumerable<CurrencyEntity>`: 获取货币

### 15.16 IDashboardPartDriveService
- **描述**: 仪表板部件驱动服务接口
- **方法列表**:
  - `GetParts()` → `IEnumerable<DashboardPart>`: 获取部件

### 15.17 IDashboardProviderService
- **描述**: 仪表板提供者服务接口
- **方法列表**:
  - `GetProviders()` → `IEnumerable<IDashboardPartDriveService>`: 获取提供者

### 15.18 IDataArchivedService
- **描述**: 数据归档服务接口
- **方法列表**:
  - `Archive(string key, string data)` → `void`: 归档数据
  - `GetArchived(string key)` → `string`: 获取归档数据

### 15.19 IConnectionHolder
- **描述**: 连接持有者接口
- **方法列表**:
  - `GetConnection()` → `DbConnection`: 获取连接

### 15.20 IDatabaseConfiguring
- **描述**: 数据库配置接口
- **方法列表**:
  - `Configure(DbContextOptionsBuilder optionsBuilder)` → `void`: 配置数据库

### 15.21 IDbConnectionPool
- **描述**: 数据库连接池接口
- **方法列表**:
  - `GetConnection()` → `DbConnection`: 获取连接
  - `ReturnConnection(DbConnection connection)` → `void`: 归还连接

### 15.22 IEventHandler
- **描述**: 事件处理器接口
- **方法列表**:
  - `Handle(string eventName, object data)` → `void`: 处理事件

### 15.23 IEventManager
- **描述**: 事件管理器接口
- **方法列表**:
  - `Raise(string eventName, object data)` → `void`: 触发事件
  - `Subscribe(string eventName, IEventHandler handler)` → `void`: 订阅事件

### 15.24 IHostingEnvironmentExtend
- **描述**: 主机环境扩展接口
- **方法列表**:
  - `MapWebRootPath(string path)` → `string`: 映射Web根路径

### 15.25 IExtendField
- **描述**: 扩展字段接口
- **方法列表**:
  - `get; set;` → `string FieldName`: 字段名属性
  - `get; set;` → `string FieldValue`: 字段值属性

### 15.26 IExtendFieldService
- **描述**: 扩展字段服务接口
- **方法列表**:
  - `GetFields(string ownerType, string ownerId)` → `IEnumerable<ExtendFieldEntity>`: 获取字段

### 15.27 IAdminMenuProvider
- **描述**: 管理菜单提供者接口
- **方法列表**:
  - `GetAdminMenus()` → `IEnumerable<AdminMenu>`: 获取管理菜单

### 15.28 IApplicationContextAccessor
- **描述**: 应用上下文访问器接口
- **方法列表**:
  - `GetApplicationContext()` → `IApplicationContext`: 获取应用上下文

### 15.29 IDBContextProvider
- **描述**: 数据库上下文提供者接口
- **方法列表**:
  - `GetDbContext()` → `DbContext`: 获取数据库上下文

### 15.30 IHostOptionProvider
- **描述**: 主机选项提供者接口
- **方法列表**:
  - `GetOptions()` → `HostOption`: 获取主机选项

### 15.31 IRouteProvider
- **描述**: 路由提供者接口
- **方法列表**:
  - `GetRoutes()` → `IEnumerable<Route>`: 获取路由

### 15.32 ILayoutHtmlService
- **描述**: 布局HTML服务接口
- **方法列表**:
  - `GenerateHtml(LayoutEntity layout)` → `string`: 生成HTML

### 15.33 ILayoutService
- **描述**: 布局服务接口
- **方法列表**:
  - `GetLayouts()` → `IEnumerable<LayoutEntity>`: 获取布局

### 15.34 IMediaService
- **描述**: 媒体服务接口
- **方法列表**:
  - `Upload(MediaEntity media)` → `void`: 上传媒体
  - `GetMedia(int id)` → `MediaEntity`: 获取媒体

### 15.35 IPackageInstaller
- **描述**: 包安装器接口
- **方法列表**:
  - `Install(string packagePath)` → `void`: 安装包

### 15.36 IPackageInstallerProvider
- **描述**: 包安装器提供者接口
- **方法列表**:
  - `GetInstaller(string packageType)` → `IPackageInstaller`: 获取安装器

### 15.37 IPageContext
- **描述**: 页面上下文接口
- **方法列表**:
  - `GetCurrentPage()` → `PageEntity`: 获取当前页面

### 15.38 IPageService
- **描述**: 页面服务接口
- **方法列表**:
  - `GetPages()` → `IEnumerable<PageEntity>`: 获取页面
  - `GetPage(string pageUrl)` → `PageEntity`: 获取页面

### 15.39 IPendingTaskExecutor
- **描述**: 待处理任务执行器接口
- **方法列表**:
  - `Execute(PendingTask task)` → `void`: 执行任务

### 15.40 IPendingTaskHandler
- **描述**: 待处理任务处理器接口
- **方法列表**:
  - `Handle(PendingTask task)` → `void`: 处理任务

### 15.41 IPendingTaskService
- **描述**: 待处理任务服务接口
- **方法列表**:
  - `AddTask(PendingTask task)` → `void`: 添加任务
  - `GetTasks()` → `IEnumerable<PendingTask>`: 获取任务

### 15.42 IProductCategoryService
- **描述**: 产品分类服务接口
- **方法列表**:
  - `GetCategories()` → `IEnumerable<ProductCategory>`: 获取分类

### 15.43 IProductCategoryTagService
- **描述**: 产品分类标签服务接口
- **方法列表**:
  - `GetTags(int categoryId)` → `IEnumerable<ProductCategoryTag>`: 获取标签

### 15.44 IProductGalleryService
- **描述**: 产品画廊服务接口
- **方法列表**:
  - `GetGalleries(int productId)` → `IEnumerable<ProductGallery>`: 获取画廊

### 15.45 IProductImageService
- **描述**: 产品图片服务接口
- **方法列表**:
  - `GetImages(int productId)` → `IEnumerable<ProductImage>`: 获取图片

### 15.46 IProductService
- **描述**: 产品服务接口
- **方法列表**:
  - `GetProducts()` → `IEnumerable<ProductEntity>`: 获取产品
  - `GetProduct(int id)` → `ProductEntity`: 获取产品详情

### 15.47 IProductTagService
- **描述**: 产品标签服务接口
- **方法列表**:
  - `GetTags(int productId)` → `IEnumerable<ProductTag>`: 获取标签

### 15.48 IProductUrlService
- **描述**: 产品URL服务接口
- **方法列表**:
  - `GetUrl(ProductEntity product)` → `string`: 获取产品URL

### 15.49 IRouteDataProvider
- **描述**: 路由数据提供者接口
- **方法列表**:
  - `GetRoutes()` → `IEnumerable<RouteData>`: 获取路由数据

### 15.50 IRuleService
- **描述**: 规则服务接口
- **方法列表**:
  - `GetRules()` → `IEnumerable<Rule>`: 获取规则
  - `ExecuteRule(Rule rule, object data)` → `object`: 执行规则

### 15.51 IHtmlSanitizer
- **描述**: HTML净化器接口
- **方法列表**:
  - `Sanitize(string html)` → `string`: 净化HTML

### 15.52 IApplicationSettingService
- **描述**: 应用设置服务接口
- **方法列表**:
  - `GetSetting(string key)` → `string`: 获取设置
  - `SetSetting(string key, string value)` → `void`: 设置设置

### 15.53 ISiteInformationService
- **描述**: 站点信息服务接口
- **方法列表**:
  - `GetSiteInformation()` → `SiteInformation`: 获取站点信息

### 15.54 IBlockUrlService
- **描述**: 区块URL服务接口
- **方法列表**:
  - `GetBlockUrls()` → `IEnumerable<BlockUrlEntity>`: 获取区块URL

### 15.55 ISiteUrlProvider
- **描述**: 站点URL提供者接口
- **方法列表**:
  - `GetSiteUrls()` → `IEnumerable<string>`: 获取站点URL

### 15.56 IThemeService
- **描述**: 主题服务接口
- **方法列表**:
  - `GetThemes()` → `IEnumerable<ThemeEntity>`: 获取主题
  - `ApplyTheme(string themeId)` → `void`: 应用主题

### 15.57 IWidgetActivator
- **描述**: 部件激活器接口
- **方法列表**:
  - `CreateWidget(string widgetType)` → `WidgetBase`: 创建部件

### 15.58 IWidgetBasePartService
- **描述**: 部件基础部分服务接口
- **方法列表**:
  - `GetWidgetPart(string partType)` → `WidgetBasePart`: 获取部件部分

### 15.59 IWidgetPartDriver
- **描述**: 部件部分驱动接口
- **方法列表**:
  - `BuildEditor(WidgetBase widget)` → `dynamic`: 构建编辑器
  - `UpdateEditor(WidgetBase widget, dynamic editor)` → `dynamic`: 更新编辑器

### 15.60 IWidgetTemplateService
- **描述**: 部件模板服务接口
- **方法列表**:
  - `GetTemplates()` → `IEnumerable<WidgetTemplateEntity>`: 获取模板

### 15.61 IZoneService
- **描述**: 区域服务接口
- **方法列表**:
  - `GetZones()` → `IEnumerable<ZoneEntity>`: 获取区域

## 16. EasyFrameWork.Test

### 16.1 IAuthorizeRequired
- **描述**: 需要授权接口
- **方法列表**:
  - `IsAuthorized()` → `bool`: 是否已授权

## 17. ZKEACMS.Standard

### 17.1 IStandardService
- **描述**: 标准服务接口
- **方法列表**:
  - `DoSomething()` → `void`: 执行某些操作