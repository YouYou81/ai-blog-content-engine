# Security

This project is designed to be copied, forked, and adapted. Keep secrets out of the repository.

## Never Commit

- MCP API keys
- Admin API keys
- Internal IP addresses
- Private backend URLs
- Cookies or session tokens
- User data
- Generated publish result JSON
- Local machine paths that reveal private infrastructure

## Use Environment Variables

Use `.env.example` as the template and store real values in `.env`.

```bash
CAPSOLVER_ADMIN_MCP_URL="https://your-mcp-host.example.com"
CAPSOLVER_ADMIN_MCP_API_KEY="replace-with-your-key"
```

## Scan Before Push

Run:

```bash
bash scripts/scan-secrets.sh .
```

The scanner checks for common MCP keys, API key assignments, and private network URLs.

## MCP Hardening

- Serve MCP over HTTPS.
- Rotate keys regularly.
- Use least-privilege admin keys.
- Keep publish tools draft-first by default.
- Log publish actions without logging credentials.
- Prefer domain names over private IPs in shared config.
