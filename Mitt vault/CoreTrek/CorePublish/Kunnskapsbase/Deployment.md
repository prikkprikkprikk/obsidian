---
Kategori: Release
---
  

  

> [!important] **SSH-ID til staging/prod**<br>Dersom ein får spørsmål om passord stadig vekk under ctrelease, er det snakk om google-konto-passordet.<br>For å unngå dette, kopier ssh-id til serveren det deployast til, f.eks.:<br>`ssh-copy-id -i ~/.ssh/jorn-coretrek jorn@st-web04-22.coretrek.net`

  

Steg:

- Kode
- Database
- Filer
- Cache task

  

På dev: Klone prosjektet inn i ~/projects/

`ctrelease`

  

  

Deretter overføre databasen, dersom det trengst (første gang).

`ctdev`

1. Dump databases

domain_ID står i include.config.php

  

# RSYNC DEV -> STAGE

rsync --delete -rpCl --info=progress2 /home/mmstore/areanett/ [stage22.coretrek.no](http://stage22.coretrek.no/):/home/mmstore/areanett/

# DB dump dev22

mysqldump -u areanett -p cp_areanett > cp_areanett.sql  
scp cp_areanett.sql [stage22.coretrek.no](http://stage22.coretrek.no/):~/.

# stage22

mysql -u areanett -p cp_areanett < cp_areanett.sql

  

## Crontab

`sudo -u corepublish crontab -e`

Legge inn ny oppføring for det aktuelle prosjektet.

Legge inn tasks i CPAdmin → Customer → Crontasks.