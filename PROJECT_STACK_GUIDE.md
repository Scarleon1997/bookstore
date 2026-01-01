# 项目技术栈与学习指南

## 1. 简介
本项目是一个典型的 **Spring Boot + Vue** 前后端分离项目。为了能够深入理解并进行开发，你需要掌握以下核心技术栈。

## 2. 后端技术栈 (Bookstore Server)

### 核心框架
*   **Java 8**: 基础语言环境。需掌握 Lambda 表达式、Stream API 等特性。
*   **Spring Boot 2.2.6**: 后端核心框架。
    *   **IoC/DI**: 依赖注入。
    *   **RESTful API**: 使用 `@RestController`, `@RequestMapping` 等注解开发接口。
    *   **Configuration**: 理解 `application.yml` 配置。

### 数据持久层
*   **MyBatis (mybatis-spring-boot-starter 2.1.2)**:
    *   理解 Mapper 接口与 XML 映射文件的绑定。
    *   掌握动态 SQL (`<if>`, `<foreach>` 等) 的编写。
*   **MySQL**: 关系型数据库。
*   **Druid (1.1.10)**: 阿里巴巴开源的数据库连接池，用于监控和管理数据库连接。

### 安全与认证
*   **Spring Security**: 提供认证和授权功能。
*   **JWT (io.jsonwebtoken 0.9.0)**: JSON Web Token。
    *   了解如何生成 Token、解析 Token。
    *   理解 Token 在前后端交互中的传递方式 (通常在 HTTP Header 中)。

### 进阶/特色技术
*   **ShardingSphere (4.0.0-RC1)**:
    *   依赖 `sharding-jdbc-spring-boot-starter`。
    *   用于数据库的**分库分表**或**读写分离**。这是本项目的一个难点和特色，如果涉及到多数据源配置，需重点关注此类库的文档。
*   **Redis**:
    *   依赖 `spring-boot-starter-data-redis`。
    *   用于数据缓存，提升系统性能。

### 工具库
*   **Lombok**: 通过 `@Data`, `@Builder` 等注解简化样板代码。
*   **Fastjson**: 用于 JSON 序列化与反序列化。

## 3. 前端技术栈 (Bookstore Client)

### 核心框架
*   **Vue.js (2.5.2)**:
    *   **Vue 2**: 理解 Options API (`data`, `methods`, `computed`, `watch`)。
    *   **生命周期**: `created`, `mounted` 等钩子函数。
    *   **指令**: `v-if`, `v-for`, `v-model`, `v-bind`。
*   **Webpack (3.6.0)**: 项目构建工具 (Legacy配置)，了解基本的 loader 和 plugin 概念即可。

### 路由与状态管理
*   **Vue Router (3.0.1)**: 前端路由管理。
    *   理解路由配置、路由传参。
    *   **路由守卫 (Navigation Guards)**: 重点关注 `beforeEach`，通常用于校验用户登录状态。
*   **Vuex (3.4.0)**: 状态管理模式。
    *   理解 `state`, `getters`, `mutations`, `actions` 的作用和流转。

### UI 组件库
*   **Element UI (2.13.1)**: 饿了么团队开源的 Vue 2 组件库。
    *   熟练使用常用组件：Table, Form, Input, Select, Dialog, Pagination 等。

### 网络请求
*   **Axios (0.19.2)**: HTTP 客户端。
    *   掌握基本的 GET/POST 请求。
    *   **拦截器 (Interceptors)**: 重点理解如何在请求拦截器中统一添加 Token，在响应拦截器中统一处理 401/403 错误。

### 其他工具
*   **ECharts (4.8.0)**: 数据可视化图表库。
*   **Mavon Editor**: Markdown 编辑器组件。

## 4. 详细学习路线规划

为了系统地掌握本项目，建议按照以下**4个阶段**进行学习。

### 第一阶段：基础巩固与环境搭建 (预计 3-5 天)
**目标**：成功运行项目，理解项目结构。

1.  **Java & Spring Boot 基础**
    *   复习 Java 8 Stream 流操作和 Lambda 表达式（项目中大量使用）。
    *   了解 Spring Boot 的启动原理和 `application.yml` 多环境配置。
    *   *练习*：新建一个最简单的 Spring Boot Web 项目，写一个 Hello World 接口。
2.  **Vue & Element UI 基础**
    *   学习 Vue 2.x 的生命周期、常用指令、组件父子通信 (props/emit)。
    *   浏览 Element UI 官网，看懂 Table 表格、Form 表单的基本用法。
    *   *练习*：用 Vue 脚手架创建一个空项目，引入 Element UI，画一个简单的表格。
3.  **环境配置**
    *   本地安装 MySQL 5.7/8.0 和 Redis。
    *   安装 Node.js (建议 v10 或 v12，因为本项目依赖较老)。
    *   导入 SQL 脚本初始化数据库。
    *   分别启动后端和前端，确保无报错。

### 第二阶段：核心业务流程开发 (预计 5-7 天)
**目标**：能够照猫画虎，新增一个简单的 CRUD 模块。

1.  **后端开发 (MyBatis + Service + Controller)**
    *   **MyBatis**: 学习 Mapper XML 文件的编写，特别是 ResultMap 和 SQL 标签。
    *   **Service**: 理解业务逻辑层，如何调用 Mapper。
    *   **Controller**: 学习 `@RequestBody`, `@RequestParam`, `@PathVariable` 的区别。
    *   *任务*：尝试修改一个现有接口的返回值，观察前端变化。
2.  **前端开发 (Axios + Vue Components)**
    *   **Axios 封装**: 深入阅读 `src/utils/request.js` (假设路径)，理解 request/response 拦截器。
    *   **接口调用**: 学习如何在 `.vue` 文件中引入 API 方法并调用。
    *   **页面开发**: 模仿现有的“图书管理”页面，复制一份代码，改为“作者管理”（举例）。
3.  **前后端联调**
    *   打开浏览器的 Network 面板，观察 HTTP 请求的 URL、Header 和 Body。
    *   学会看后端控制台的 Log 报错信息。

### 第三阶段：安全认证与权限控制 (预计 3-4 天)
**目标**：理解系统是如何登录的，权限是如何控制的。

1.  **Spring Security 原理**
    *   不需要精通所有细节，但要理解 Filter Chain (过滤器链)。
    *   找到项目中的 Security 配置类（通常继承 `WebSecurityConfigurerAdapter`）。
2.  **JWT 实战**
    *   追踪“登录”接口 (`/login`) 的代码，看 Token 是如何生成的。
    *   追踪“JWT 过滤器”的代码，看每个请求是如何解析 Token 并验证身份的。
    *   *思考*：如果 Token 过期了，系统是如何处理的？
3.  **前端权限控制**
    *   查看 `src/router/index.js` 中的 `beforeEach` 钩子，理解前端是如何拦截未登录用户的。
    *   查看 Vuex 中的 `user` 模块，理解用户信息是如何存储的。

### 第四阶段：高阶特性与难点攻克 (预计 3-5 天)
**目标**：掌握项目的技术亮点 (ShardingSphere, Redis)。

1.  **ShardingSphere 分库分表**
    *   这是本项目的难点。阅读 `pom.xml` 和 `application.yml` 中的 sharding 配置。
    *   理解什么是“逻辑表”和“真实表”。
    *   *验证*：向数据库插入数据，观察数据到底落入了哪个实际的表中。
2.  **Redis 缓存**
    *   搜索代码中的 `RedisTemplate` 或 `@Cacheable` 注解。
    *   理解缓存的使用场景：通常用于字典数据、Token 存储或高频查询。

## 5. 知识点深度分解 (Deep Dive)

针对上述技术栈，这里提供更颗粒度的知识点清单，方便查漏补缺。

### 5.1 Java 8 关键特性
*   **Lambda**: 语法 `() -> {}`，函数式接口 (`@FunctionalInterface`)。
*   **Stream API**:
    *   创建: `list.stream()`, `Arrays.stream()`
    *   中间操作: `filter` (过滤), `map` (转换), `sorted` (排序)
    *   终端操作: `collect(Collectors.toList())`, `forEach`, `count`
*   **Optional**: 避免空指针异常 (`ofNullable`, `orElse`, `isPresent`)。

### 5.2 Spring Boot 注解速查
*   **核心**: `@SpringBootApplication`
*   **Web 层**: `@RestController`, `@RequestMapping`, `@GetMapping`, `@PostMapping`
*   **参数接收**: `@RequestBody` (JSON), `@RequestParam` (Query String), `@PathVariable` (URL path)
*   **容器管理**: `@Component`, `@Service`, `@Repository`, `@Autowired` (或 `@Resource`)
*   **配置**: `@Configuration`, `@Bean`, `@Value` (读取 yml)

### 5.3 Vue.js 核心细节
*   **指令**:
    *   `v-if` vs `v-show` (性能区别)
    *   `v-for` (必须加 `:key`)
    *   `v-model` (双向绑定原理)
    *   `@click` / `@change` (事件监听)
*   **修饰符**: `.prevent` (阻止默认行为), `.stop` (阻止冒泡)
*   **组件通信**:
    *   父传子: `props`
    *   子传父: `this.$emit('event-name', data)`
    *   跨组件: Vuex

### 5.4 MySQL 优化基础
*   **索引**: 知道什么是 B+Tree，主键索引 vs 辅助索引。
*   **事务**: ACID 特性，事务隔离级别（脏读、幻读）。
*   **SQL 调优**: 避免 `select *`，使用 `explain` 查看执行计划。

### 5.5 网络与调试
*   **HTTP 方法**: GET (查), POST (增), PUT (改), DELETE (删)。
*   **状态码**:
    *   `200`: 成功
    *   `400`: 参数错误
    *   `401`: 未认证 (Token 无效)
    *   `403`: 无权限
    *   `500`: 服务器内部错误
*   **Chrome DevTools**:
    *   `Network`: 查看请求头 `Authorization` 是否携带 Token。
    *   `Console`: 查看 JS 报错。
    *   `Vue Devtools`: 查看组件数据和 Vuex 状态（强烈推荐安装插件）。

## 6. 技术栈局限性与改进方向 (Limitations & Improvements)

本项目使用了一些相对古老的技术版本。在学习过程中，你需要意识到这些局限性，以便在未来的工作中能够平滑迁移到新技术。

### 6.1 后端局限性
*   **Spring Boot 2.x 已停止维护 (EOL)**:
    *   *问题*: 官方不再提供免费的 Bug 修复和安全补丁。
    *   *改进*: 现代项目应迁移至 **Spring Boot 3.x**，它要求 Java 17+。
*   **MyBatis XML 样板代码多**:
    *   *问题*: 需要手写大量 XML 配置，开发效率相对较低。
    *   *改进*: 业界常使用 **MyBatis-Plus** (极简 CRUD) 或 **Spring Data JPA** (对象化操作)。
*   **ShardingSphere 版本较旧**:
    *   *问题*: 使用的是 4.0.0-RC1 (Release Candidate)，可能存在不稳定性。
    *   *改进*: 升级到 5.x 正式版，配置方式会有较大变化。

### 6.2 前端局限性
*   **Vue 2 已停止维护 (EOL)**:
    *   *问题*: Vue 团队已于 2023 年底停止对 Vue 2 的支持。
    *   *改进*: 新项目应直接使用 **Vue 3** + **TypeScript** + **Composition API** (`setup` 语法糖)。
*   **Webpack 3 构建速度慢**:
    *   *问题*: 项目使用 Webpack 3，冷启动和热更新速度较慢。
    *   *改进*: 现代前端工具链普遍使用 **Vite**，能实现秒级启动。
*   **Element UI**:
    *   *问题*: 专为 Vue 2 设计，不再更新。
    *   *改进*: 升级为 **Element Plus** (适配 Vue 3) 或使用 Ant Design Vue / Naive UI。

### 6.3 总结建议
尽管版本较老，但**核心思想（MVC 分层、RESTful API、组件化开发、单页应用状态管理）是通用的**。初学者可以通过本项目掌握基础，待熟练后再尝试将项目重构为 `Spring Boot 3 + Vue 3` 的现代架构。
