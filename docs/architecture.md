# Architecture

AI Blog 内容生产引擎由六层组成：运营入口、内容生成流水线、SEO 质量控制、视觉资产生成、发布适配器和效果反馈。

## 1. Operations Layer

Google Sheet 是默认运营入口。运营同学可以直接维护关键词池，而不需要进入代码仓库。

管理字段包括：

- Keyword
- Topic cluster
- Search intent
- Priority
- Owner
- Production status
- Publish platform
- Published URL
- GSC performance metrics

## 2. Content Pipeline Layer

内容流水线负责把关键词转成可发布文章。

```text
Topic Selection
  -> SERP and Intent Research
  -> Outline
  -> First Draft
  -> SEO Optimization
  -> Link Plan
  -> Cover Image Brief
```

每个阶段都有结构化输出，方便人工审核、自动重试和质量评分。

## 3. SEO Quality Layer

质量层负责判断文章是否达到发布标准。

- Readability score
- Keyword density
- Intent coverage
- E-E-A-T evaluation
- Duplicate content detection
- Keyword cannibalization check
- Metadata length
- Internal and external link quality
- FAQ completeness

## 4. Visual Asset Layer

视觉层负责自动配图。

Supported providers:

- DALL-E
- Midjourney
- Any image generation API with URL or file output

Recommended flow:

1. Generate a cover brief from the article title and topic.
2. Generate a 16:9 cover image.
3. Apply brand rules such as logo, color, spacing, and filename.
4. Attach the image during publishing.

## 5. Publishing Layer

发布层通过平台适配器把文章发送到 CMS。

Supported targets:

- WordPress
- Ghost
- Notion
- Other CMS APIs

Default policy:

- Create draft first.
- Attach cover image.
- Record draft URL.
- Update Google Sheet status.
- Let a human reviewer decide when to publish.

## 6. Feedback Layer

反馈层定期拉取 Google Search Console 数据，并把结果写回关键词池。

Tracked metrics:

- Clicks
- Impressions
- CTR
- Average position
- Query growth
- URL-level performance

The system uses this feedback to identify high-performing templates, improve prompts, and prioritize future keywords.

## System Diagram

```text
Google Sheet
  -> AI Agent
  -> GEO / SEO Content Skill
  -> SEO Quality Gate
  -> Image Generation Provider
  -> CMS Publisher
  -> Google Search Console
  -> Google Sheet Feedback Columns
```

## Extending The Engine

The engine is intentionally modular. You can replace:

- Google Sheet with Airtable or a database.
- DALL-E with Midjourney or another image provider.
- WordPress with Ghost, Notion, Webflow, Strapi, or a custom CMS.
- GSC with analytics data from another source.
