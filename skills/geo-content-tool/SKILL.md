---
name: geo-content-tool
description: >
  GEO, AEO, and SEO content production workflow. Use it to turn a keyword brief into a staged article package with outline, first draft, optimization notes, SEO quality checks, image brief, publishing metadata, and post-publish tracking fields.
license: Apache-2.0
---

# GEO Content Tool

Use this skill to turn one keyword row or keyword brief into a publication-ready SEO + AEO + GEO article package. Run the workflow as a staged pipeline unless the user explicitly requests only one stage.

## Pipeline Stages

Default stages:

1. Topic selection
2. SERP and intent research
3. Outline
4. First draft
5. SEO optimization
6. Duplicate and cannibalization check
7. Internal and external link plan
8. Cover image brief
9. Publishing metadata
10. GSC tracking fields

## Default Output

Return these blocks when running a full article workflow:

- Pipeline Summary
- TDK
- Article
- SEO Quality Check
- Link Plan
- Cover Image Brief
- Publishing Payload
- Tracking Plan

Keep TDK outside the article body so it can be pasted into a CMS separately.

## Required Article Structure

- TL;DR
- Introduction
- Detailed body with H2/H3 sections
- Optional comparison table
- Conclusion/CTA
- FAQ

FAQ must always be the final article section unless the user explicitly asks for another non-article deliverable.

## TDK Standards

Use plain Markdown hyphen bullets:

- Title: include primary keyword naturally.
- Meta Description: summarize value and include the primary keyword where natural.
- Keywords: primary keyword plus 3-5 related long-tail keywords.
- Cover Image Alt: clear descriptive alt text.

## Google Sheet Keyword Pool Rules

When a keyword row is provided, preserve and update these fields:

- keyword
- cluster
- intent
- priority
- owner
- status
- publish_platform
- published_url
- gsc_clicks_28d
- gsc_impressions_28d
- template_score

Recommended status transitions:

`backlog -> selected -> outline_ready -> draft_ready -> optimized -> image_ready -> published -> tracked`

## Writing Rules

- Write in a clear, concise, natural human style.
- Lead each paragraph with the main point.
- Use short sentences.
- Prefer practical examples, workflows, and decision criteria.
- Use one comparison table only when it improves clarity.
- Avoid vague hype such as "unlock", "unleash", "leverage", "whether you are", "are you looking", "struggling to", "tired of", and "seamless".

## SEO / GEO Rules

- Use the primary keyword naturally.
- Distribute 3-5 related long-tail keywords.
- Add internal links to relevant product, blog, FAQ, glossary, or documentation pages.
- Add authoritative external links for factual claims.
- Use reader-facing anchor text that describes the linked concept.
- Do not create fake citations or unsupported statistics.
- Do not add FAQ Schema, JSON-LD, a separate GEO score, or a standalone References section unless explicitly requested.

## SEO Quality Check

Score or comment on:

- Readability
- Keyword density
- Intent coverage
- E-E-A-T
- Duplicate content risk
- Keyword cannibalization risk
- Metadata completeness
- Internal link relevance
- External source quality

If a check cannot be completed because source data is unavailable, state the missing input and provide the recommended next action.

## SERP Research

When SERP data is available, inspect the top results and identify:

- Common sections
- Search intent
- Missing sections
- Weak or outdated claims
- Comparison criteria
- FAQ patterns
- Opportunities for a clearer answer

If live SERP data is unavailable, use the provided brief and state the assumption.

## Cover Image Workflow

For a full article package, prepare a 16:9 cover image brief for DALL-E, Midjourney, or another image API.

The brief should include:

- Article title
- Topic
- Visual metaphor
- Brand style
- Aspect ratio
- Text restrictions
- Alt text

Recommended prompt pattern:

`A clean technical editorial cover image for [ARTICLE_TITLE], modern SaaS content workflow, visible keyword board, article editor, SEO score panel, image generation panel, and publishing dashboard, 16:9 composition, crisp UI details, professional brand style.`

## Publishing Payload

Prepare a platform-neutral publishing payload:

- title
- slug
- meta_description
- tags
- author
- status
- article_markdown
- cover_image_alt
- cover_image_path_or_url
- canonical_url

Supported target examples:

- WordPress
- Ghost
- Notion
- Custom CMS API
- Generic content admin MCP

Default to draft-first publishing.

When a backend MCP is available, use a generic server name such as `content-admin-mcp`. Do not mention the real backend name, internal address, private domain, API key, cookie, or header value in the article package or final delivery.

## Tracking Plan

Prepare fields for post-publish measurement:

- published_url
- index_date
- gsc_clicks_7d
- gsc_impressions_7d
- gsc_clicks_28d
- gsc_impressions_28d
- ctr_28d
- average_position_28d
- winning_queries
- template_score
- recommended_prompt_updates

## Compliance

When writing about automation, scraping, data extraction, security, or risk-control systems, emphasize lawful and responsible use. Technical capability does not grant permission to access private, restricted, sensitive, or unauthorized data.

## Quality Checklist

Before final delivery, verify:

- TDK and Article are separate.
- TL;DR uses hyphen bullets.
- Introduction gives the conclusion early.
- Body contains detailed practical guidance.
- FAQ has 3-5 questions and is the final article section.
- Metadata is complete.
- Internal and external links are relevant.
- Primary keyword usage is natural.
- SEO Quality Check is included.
- Cover Image Brief is included for full workflows.
- Publishing Payload is draft-first.
- Tracking Plan includes GSC feedback fields.
- No secrets or private infrastructure details are present.
