# AI Blog 内容生产引擎

从关键词到发布的全链路 AI 内容生产系统，让 SEO 内容生产成本降低 90%。

AI Blog 内容生产引擎把 GEO/SEO/AEO 写作规范、SERP 研究、内容生成、封面图制作、CMS 发布和质量检查包装成一个可复制的 GitHub 项目。它适合技术博客、SaaS 增长团队、内容运营团队和需要稳定批量产出高质量文章的独立开发者。

## 核心功能

- 关键词到文章：输入一个关键词，生成 TDK、TL;DR、正文、对比表、结论 CTA 和 FAQ。
- GEO/AEO 友好：文章结构面向 AI Search、Answer Engine 和传统搜索结果摘要。
- SERP 驱动选题：支持竞品结果拆解、搜索意图识别、内容缺口分析和文章框架选择。
- 内链与外链策略：自动规划站内链接、权威外链、FAQ/Glossary 链接和自然锚文本。
- 发布前质检：检查标题长度、Meta Description、关键词分布、FAQ 位置、敏感词和合规措辞。
- 封面图工作流：生成 16:9 技术博客封面，并支持品牌 logo 的确定性合成。
- MCP 发布集成：通过 CapSolver Admin MCP 创建文章草稿、上传封面图，并返回后台草稿信息。
- 脱敏可复制：MCP URL、API key、后台地址和本地路径全部用环境变量或占位符表达。

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
│   ├── keyword-brief.yaml
│   └── article-package.md
├── mcp/
│   ├── claude-desktop.example.json
│   └── codex.example.toml
├── scripts/
│   └── scan-secrets.sh
└── skills/
    └── geo-content-tool/
        └── SKILL.md
```

## 快速开始

1. 复制环境变量模板。

```bash
cp .env.example .env
```

2. 填入自己的后台地址和 MCP 凭证。

```bash
CAPSOLVER_ADMIN_MCP_URL="https://your-mcp-host.example.com"
CAPSOLVER_ADMIN_MCP_API_KEY="replace-with-your-key"
```

3. 复制 MCP 配置到你的客户端。

- Claude Desktop: 参考 `mcp/claude-desktop.example.json`
- Codex: 参考 `mcp/codex.example.toml`

4. 将 `skills/geo-content-tool/SKILL.md` 安装到你的 AI coding/content agent skill 目录。

5. 用 `examples/keyword-brief.yaml` 作为输入，让 agent 执行从关键词到发布的流程。

## 推荐工作流

```text
Keyword Brief
  -> SERP/Intent Research
  -> Outline
  -> TDK
  -> Article Draft
  -> Link Plan
  -> Cover Image
  -> Quality Gate
  -> MCP create_post
  -> MCP upload_image
  -> Manual/Automated Publish
```

## CapSolver Admin MCP

本项目只提供脱敏配置示例，不包含任何真实 API key、内网 IP 或后台地址。

Claude Desktop 示例：

```json
{
  "mcpServers": {
    "capsolver-admin-mcp": {
      "command": "npx",
      "args": [
        "-y",
        "mcp-remote@latest",
        "${CAPSOLVER_ADMIN_MCP_URL}",
        "--transport",
        "http-only",
        "--header",
        "x-api-key: ${CAPSOLVER_ADMIN_MCP_API_KEY}"
      ]
    }
  }
}
```

Codex 示例：

```toml
[mcp_servers.capsolver-admin-mcp]
url = "${CAPSOLVER_ADMIN_MCP_URL}"

[mcp_servers.capsolver-admin-mcp.headers]
x-api-key = "${CAPSOLVER_ADMIN_MCP_API_KEY}"
```

## 安全原则

- 不提交 `.env`、真实 MCP key、后台 IP、后台域名、cookie、发布结果 JSON。
- 示例配置只使用占位符。
- 发布前运行 `scripts/scan-secrets.sh` 做一次本地扫描。
- 将生产 MCP 服务部署在 HTTPS 域名后，并使用最小权限 API key。

## 适用场景

- SaaS 技术博客规模化生产。
- SEO 团队把关键词库转成发布队列。
- 增长团队搭建 AI Search 可引用内容库。
- 产品团队自动生成 FAQ、Glossary、教程和对比文章。

## License

Apache-2.0
