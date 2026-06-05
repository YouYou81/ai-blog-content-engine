# AI Blog 内容生产引擎

从关键词到发布的全链路 AI 内容生产工作流，让 SEO 内容生产成本降低 90%。

AI Blog 内容生产引擎是一个可复制的内容生产系统蓝图。它把关键词池管理、多阶段内容生成、SEO 质量检查、自动配图、多平台发布和发布后数据反馈整合成一套标准流程，帮助内容团队从“人工写稿”升级为“可运营、可追踪、可优化的 AI 内容流水线”。

## 核心功能

- Google Sheet 关键词池管理：运营同学可以在表格里维护关键词、优先级、意图、负责人、状态和发布平台。
- 多阶段内容生成流水线：选题 → 大纲 → 初稿 → 优化 → 配图 → 发布，每一步都有明确输入、输出和质量门槛。
- 自动 SEO 质量检查：可读性评分、关键词密度、E-E-A-T 评估、搜索意图覆盖、标题与摘要检查。
- 与已有内容去重：基于 URL、标题、主题 cluster 和正文相似度识别重复或蚕食风险。
- 自动配图：支持 DALL-E / Midjourney API 生成封面图，并按品牌规范输出。
- 自动内/外链：根据内容主题添加站内链接、权威外链和自然锚文本。
- 一键发布：支持 WordPress、Ghost、Notion 等平台创建草稿或发布文章。
- 发布后效果追踪：自动拉取 Google Search Console 数据，分析高效模板，反哺关键词选择和提示词优化。

## 项目结构

```text
.
├── README.md
├── LICENSE
├── .env.example
├── .gitignore
├── docs/
│   ├── architecture.md
│   ├── workflow.md
│   ├── publishing-checklist.md
│   └── security.md
├── examples/
│   ├── article-package.md
│   └── keyword-brief.yaml
├── integrations/
│   ├── cms-publishers.example.yaml
│   └── google-sheets.schema.yaml
├── scripts/
│   └── scan-secrets.sh
└── skills/
    └── geo-content-tool/
        └── SKILL.md
```

## 工作流总览

```text
Google Sheet Keyword Pool
  -> Topic Selection
  -> SERP and Intent Research
  -> Outline
  -> First Draft
  -> SEO and E-E-A-T Optimization
  -> Duplicate and Cannibalization Check
  -> Internal / External Link Plan
  -> Cover Image Generation
  -> Quality Gate
  -> WordPress / Ghost / Notion Draft
  -> GSC Performance Tracking
  -> Prompt and Template Feedback
```

## 快速开始

1. 复制环境变量模板。

```bash
cp .env.example .env
```

2. 填入自己的内容生产配置。

```bash
GOOGLE_SHEET_ID="your-keyword-pool-sheet-id"
GOOGLE_SEARCH_CONSOLE_SITE_URL="https://www.example.com/"
WORDPRESS_BASE_URL="https://www.example.com"
IMAGE_PROVIDER="dalle"
```

3. 按 `integrations/google-sheets.schema.yaml` 创建关键词池表格。

4. 按 `integrations/cms-publishers.example.yaml` 选择发布平台。

5. 将 `skills/geo-content-tool/SKILL.md` 安装到你的 AI agent 或内容生产 agent 中。

6. 用 `examples/keyword-brief.yaml` 作为单篇文章输入样例，跑通第一篇文章。

## Google Sheet 关键词池

推荐用 Google Sheet 做运营入口，因为内容团队不需要进入代码仓库也能调整生产队列。

关键字段：

- `keyword`: 主关键词
- `cluster`: 主题簇
- `intent`: 搜索意图
- `priority`: 优先级
- `status`: 当前生产状态
- `publish_platform`: WordPress / Ghost / Notion
- `published_url`: 发布后的 URL
- `gsc_clicks_28d`: 近 28 天点击
- `gsc_impressions_28d`: 近 28 天曝光
- `template_score`: 模板效果评分

## SEO 质量门槛

每篇文章发布前建议检查：

- 可读性是否适合目标受众。
- 关键词密度是否自然。
- 搜索意图是否完整覆盖。
- E-E-A-T 是否体现经验、专业性、权威性和可信度。
- 是否与已有文章重复或产生关键词蚕食。
- 标题、Meta Description、FAQ、内链、外链是否完整。
- 自动配图是否符合品牌视觉规范。

## 发布后反馈闭环

发布不是终点。系统应定期拉取 Google Search Console 数据，记录每篇文章的曝光、点击、CTR、平均排名和查询词变化。

这些数据会反哺：

- 哪些标题模板更容易获得点击。
- 哪些文章结构更容易被搜索引擎收录。
- 哪些 FAQ 更容易覆盖长尾查询。
- 哪些主题簇值得继续扩展。
- 哪些提示词需要更新。

## 安全原则

- 不提交 `.env`、API key、OAuth token、服务账号 JSON、CMS 密码和发布结果。
- 示例配置只使用占位符。
- 发布前运行 `scripts/scan-secrets.sh` 做本地扫描。
- 发布操作默认先创建草稿，人工确认后再上线。

## 适用场景

- SaaS 技术博客规模化生产。
- SEO 团队把关键词库转成发布队列。
- 内容运营团队用表格管理 AI 生产任务。
- 增长团队搭建可追踪、可复盘的 AI Search 内容库。
- 独立开发者构建低成本内容增长系统。

## License

Apache-2.0
