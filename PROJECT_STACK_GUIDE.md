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

## 4. 学习建议路径

1.  **环境搭建**: 安装 JDK 8, Maven, Node.js, MySQL, Redis。
2.  **前端跑通**: `npm install` -> `npm run dev`，看到登录/主页。
3.  **后端跑通**: 配置好 MySQL 连接信息，启动 Spring Boot 应用。
4.  **功能剖析**:
    *   从前端的一个页面（如“图书列表”）开始。
    *   找到对应的 Vue 组件，查看 `created` 或 `mounted` 中的 API 调用。
    *   追踪到后端的 Controller 接口。
    *   查看 Service 业务逻辑。
    *   查看 Mapper 数据库查询。
5.  **攻克难点**: 深入研究 Spring Security + JWT 的登录流程，以及 ShardingSphere 的配置。
