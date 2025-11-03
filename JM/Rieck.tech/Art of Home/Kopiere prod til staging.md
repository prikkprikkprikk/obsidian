---
Status: Backlog
Hovedprosjekt:
  - "[[Notion/JM/Projects/Art of Home]]"
---
## Synkronisere prod til staging

På prod:

```Shell
ssh aohp
cd -P site/public/wp-content/db
wp db export wp-content/db/aohp_2025-07-28_11-15.sql
```

```Shell
ssh aohs
cd -P site/public
rsync -avz --delete --exclude="wp-config.php" artofh_24595@teodor-osl.servebolt.cloud:/cust/0/artofh_14511/artofh_24595/site/public/ .
```

  

## Project tasks
