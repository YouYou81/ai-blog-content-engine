# Architecture

AI Blog 内容生产引擎由四层组成：输入层、智能生产层、质量控制层和发布层。

## 1. Input Layer

输入层负责把内容需求标准化成机器可执行的 brief。

- Primary keyword
- Search intent
- Audience
- Target market
- Brand positioning
- Product CTA
- Required links
- Publish language
- Compliance notes

参考 `examples/keyword-brief.yaml`。

## 2. AI Production Layer

智能生产层由 GEO skill 驱动。它把关键词转成完整文章包。

- SERP intent analysis
- Competitor section extraction
- Content gap analysis
- Outline generation
- TDK generation
- Long-form article drafting
- FAQ generation
- Internal and external link planning
- Cover prompt generation

## 3. Quality Gate

质量控制层在发布前检查文章是否达到可上线标准。

- Title 50-70 characters
- Meta Description 140-160 characters
- FAQ is the final article section
- No fake references
- No leaked keys, cookies, IPs, or internal URLs
- Proper compliance wording
- Natural keyword usage
- Link anchors match reader intent

## 4. Publishing Layer

发布层通过 CapSolver Admin MCP 或其他 CMS MCP 完成后台操作。

Recommended order:

1. `create_post` with slug, title, metadata, and article body.
2. `upload_image` with the same slug and cover image alt text.
3. Attach preview image URL when the backend supports it.
4. Return draft ID, slug, admin URL, and image CDN URL.

This order matters because some admin backends require the post slug to exist before image upload.

## Deployment Model

```text
AI Agent
  -> GEO Content Skill
  -> Search / SERP Data Source
  -> Cover Image Generator
  -> Secret Scan and Quality Gate
  -> CapSolver Admin MCP
  -> Blog CMS
```

## Extending The Engine

You can replace CapSolver Admin MCP with another CMS MCP if it exposes similar operations:

- create draft
- update metadata
- upload media
- attach cover image
- publish or schedule

Keep the GEO skill stable and only change the publishing adapter.
