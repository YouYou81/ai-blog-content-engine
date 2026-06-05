# Workflow

This is the recommended end-to-end flow from keyword to published draft.

## Step 1: Create Keyword Brief

Start from `examples/keyword-brief.yaml`.

Required fields:

- `primary_keyword`
- `audience`
- `search_intent`
- `brand`
- `product_context`
- `cta_url`
- `language`

## Step 2: Research SERP Intent

Inspect the top results or use approved SERP data.

Capture:

- Common headings
- Missing examples
- Weak or outdated claims
- Comparison criteria
- FAQ patterns
- Source quality

## Step 3: Generate Article Package

The article package should contain two separated blocks:

- TDK
- Article

Default article sections:

- TL;DR
- Introduction
- Body with H2/H3 sections
- Optional comparison table
- Conclusion/CTA
- FAQ

FAQ must be the final section.

## Step 4: Build Link Plan

Use:

- 5-6 internal links
- 3-5 authoritative external links
- Natural reader-facing anchor text
- No forced source-label phrases

## Step 5: Create Cover Image

Generate a 16:9 cover image. If your brand requires a logo, composite it deterministically after image generation instead of asking the image model to draw the logo.

## Step 6: Run Quality Gate

Use `docs/publishing-checklist.md`.

Also run:

```bash
bash scripts/scan-secrets.sh .
```

## Step 7: Publish Through MCP

Call the CMS tools in this order:

1. `create_post`
2. `upload_image`
3. `update_post` or attach cover image when supported

Return:

- draft ID
- slug
- preview URL
- cover image URL
- any manual follow-up required
