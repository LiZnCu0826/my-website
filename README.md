# 个人网页 (Personal Website)

一个使用 Vue 3 + Vite 构建的个人展示网站。

## 技术栈

- **框架**: Vue 3 (Composition API)
- **构建工具**: Vite
- **路由**: Vue Router (Hash 模式)
- **UI 组件库**: TDesign Vue Next
- **语言**: JavaScript

## 在线访问

| 平台 | 地址 |
|------|------|
| **CloudBase 静态托管** | [https://aaa-d8gu7fi38e2be9736-1438511117.tcloudbaseapp.com/portfolio/](https://aaa-d8gu7fi38e2be9736-1438511117.tcloudbaseapp.com/portfolio/) |
| **GitHub Pages** | [https://lizncu0826.github.io/my-website/](https://lizncu0826.github.io/my-website/) |

## 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

开发服务器运行在 `http://localhost:3000`。

## 构建部署

```bash
# 构建生产版本
npm run build

# 产物在 dist/ 目录
```

## CloudBase 资源

- **环境 ID**: `aaa-d8gu7fi38e2be9736`
- **区域**: 上海 (ap-shanghai)
- **静态托管域名**: `aaa-d8gu7fi38e2be9736-1438511117.tcloudbaseapp.com`
- **部署路径**: `/portfolio/`（根路径留给"未来鹅" Demo）
- **构建配置**: `vite.config.js` 中 `base: '/portfolio/'`

## 项目结构

```
src/
├── components/     # Vue 组件
├── router.js       # 路由配置
├── App.vue         # 根组件
└── main.js         # 入口文件
public/             # 静态资源
```
