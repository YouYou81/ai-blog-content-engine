---
name: geo-content-tool
description: >
  GEO, AEO, and SEO content production workflow. Use it to turn one keyword or topic into a publication-ready article package with metadata, article body, link plan, quality checks, cover image guidance, and optional CMS publishing through MCP.
license: Apache-2.0
---

# GEO Content Tool

Use this skill to turn a keyword brief into a publication-ready SEO + AEO + GEO article package. Run the workflow as one integrated pipeline unless the user explicitly requests metadata, outline, FAQ, article body, or publishing only.

## Default Output

Return two separated blocks:

1. TDK
2. Article

TDK must stay outside the article body so it can be pasted into a blog backend separately.

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

- Title: include primary keyword, 50-70 characters when practical.
- Meta Description: 140-160 characters, include primary keyword and value.
- Keywords: primary keyword plus 3-5 related long-tail keywords.
- Cover Image Alt: clear descriptive alt text.

## Writing Rules

- Write in a clear, concise, natural human style.
- Lead each paragraph with the main point.
- Use short sentences.
- Prefer practical examples and implementation guidance.
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

## SERP Research

When SERP data is available, inspect the top results and identify:

- Common sections
- Search intent
- Missing examples
- Weak or outdated claims
- Comparison criteria
- FAQ patterns
- Opportunities for a clearer answer

If live SERP data is unavailable, use the provided brief and state the assumption.

## Cover Image Workflow

For a full article package, prepare a 16:9 cover image prompt. If a brand logo is required, generate artwork without the logo first, then composite the transparent logo deterministically with alpha preserved.

Recommended prompt pattern:

`A clean UI/UX cover image of [ARTICLE_TITLE], minimalist technical editorial style, flat vector art, crisp layout, readable abstract interface elements, high contrast, 16:9 composition, leave clean space in the upper right corner for a logo overlay.`

## Publishing Through MCP

When a CMS MCP is available, publish in this order:

1. Create the article draft with `create_post`.
2. Upload the cover image with `upload_image` using the same slug.
3. Attach the uploaded cover image URL when the backend supports it.
4. Return draft ID, slug, admin URL, and cover image URL.

Do not expose MCP credentials, backend IPs, cookies, or private URLs in the final answer.

## Compliance

When writing about automation, scraping, CAPTCHA, proxies, data extraction, security, or risk-control systems, emphasize lawful and responsible use. Technical capability does not grant permission to access private, restricted, sensitive, or unauthorized data.

## Quality Checklist

Before final delivery, verify:

- TDK and Article are separate.
- TL;DR uses hyphen bullets.
- Introduction gives the conclusion first.
- Body contains detailed practical guidance.
- FAQ has 3-5 questions and is the final section.
- Metadata length is reasonable.
- Internal and external links are relevant.
- Primary keyword usage is natural.
- Claims are supported.
- No secrets or private infrastructure details are present.
- MCP draft creation happens before image upload.
