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

### 总结
建议采用**“自顶向下”**的方法：先看页面效果 -> 再看前端代码 -> 抓包看网络请求 -> 最后看后端接口与数据库。遇到不懂的语法或注解，及时查阅官方文档。
