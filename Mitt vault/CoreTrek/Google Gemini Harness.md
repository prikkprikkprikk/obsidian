
API key: [redacted] – see Bitwarden

cURL quick start:
```
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent" \
  -H 'Content-Type: application/json' \
  -H 'X-goog-api-key: [redacted]' \
  -X POST \
  -d '{
    "contents": [
      {
        "parts": [
          {
            "text": "Explain how AI works in a few words"
          }
        ]
      }
    ]
  }'
```

## Articles

Original "Claude Code in 200 lines of code" post:
https://www.mihaileric.com/The-Emperor-Has-No-Clothes/

Safety follow-up from another author:
https://dev.to/yurukusa/the-200-lines-of-code-that-run-claude-code-the-9800-lines-that-keep-it-safe-40i1

## Gemini PHP client
https://github.com/google-gemini-php/client


