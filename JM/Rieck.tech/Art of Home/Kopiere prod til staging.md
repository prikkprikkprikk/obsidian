---
Status: Backlog
Hovedprosjekt:
  - "[[Art of Home]]"
---
## Synkronisere prod til staging

På prod:

```Shell
ssh aohp
cd -P site/public
wp db export wp-content/db/aohp_YYYY-MM-DD_HH-MM.sql
```

```Shell
ssh aohs
cd -P site/public
rsync -avz --delete --exclude="wp-config.php" artofh_24595@teodor-osl.servebolt.cloud:/cust/0/artofh_14511/artofh_24595/site/public/ .
```

### Importere i databasen
```Shell
wp db import wp-content/db/aohp_[…]
wp search-replace https://www.artofhome.no https://staging.artofhome.no
wp cache flush
```
  


