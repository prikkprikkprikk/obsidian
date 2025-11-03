---
Date Created: 2025-01-18T10:06
Innboks: false
Prosjekt:
  - "[[rwatch]]"
Status: Innkomande
---
```HTML
grep "^Host " ~/.ssh/config | grep -v "\*" | sed 's/Host //'
```