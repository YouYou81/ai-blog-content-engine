# Security

This project is designed to be copied, forked, and adapted. Keep credentials and private data out of the repository.

## Never Commit

- `.env`
- API keys
- OAuth tokens
- Google service account JSON
- CMS usernames and passwords
- WordPress application passwords
- Ghost Admin API keys
- Notion API keys
- Cookies or session tokens
- Private backend URLs
- Generated publish result JSON
- User data or private analytics exports

## Use Environment Variables

Use `.env.example` as the template and store real values in `.env`.

```bash
GOOGLE_SHEET_ID="your-keyword-pool-sheet-id"
GOOGLE_SERVICE_ACCOUNT_JSON="./secrets/google-service-account.json"
WORDPRESS_BASE_URL="https://www.example.com"
```

## Scan Before Push

Run:

```bash
bash scripts/scan-secrets.sh .
```

The scanner checks for common API key assignments, private network URLs, and hardcoded credentials.

## Publishing Safety

- Create drafts by default.
- Require quality gate approval before publishing.
- Store credentials outside the repo.
- Log article IDs and URLs, not secrets.
- Limit write access for CMS credentials.
- Rotate keys regularly.
