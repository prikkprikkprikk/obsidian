---
Kategori: Release
---
- [ ] Legge inn `release.config` i [prosjekt]/config med riktig `$customerName` og `$releaseTargets` (hvis ikke gjort ved oppsett)
- [ ] Klone [prosjekt] inn i `~/projects` på dev
- [ ] Køyre `ctrelease` i den prosjektmappa
- [ ] dumpe database
    
    ```Shell
    mysqldump -u prosjektnavn -p cp_prosjektnavn > ~/dumps/cp_prosjektnavn_202X-XX-XX.sql
    ```
    
- [ ] scp database til staging
    
    ```Shell
    scp cp_prosjektnavn_20XX-XX-XX.sql jorn@stage22.coretrek.no:/home/jorn/dumps
    ```
    
- [ ] importere database på staging
    
    ```Shell
    mysql -u prosjektnavn -p cp_prosjektnavn < cp_prosjektnavn_20XX-XX-XX.sql
    ```
    
- [ ] rsync filer
    
    ```Shell
    cd /home/mmstore/prosjektnavn/
    rsync -avh . jorn@stage22:/home/mmstore/prosjektnavn/
    ```
    
- [ ] Redigere crontab
    
    ```PHP
    jorn@stage22:~$ sudo -u corepublish crontab -e
    ```
    
    Legge til prosjektet nederst, med riktig domain-ID. Eksempel (11244 er domainID for plusoffice2024):
    
    ```PHP
    # PlusOffice2024 / plusoffice2024
    * * * * * (cd /usr/local/cpinstall/activeversion/corepublish/cron && /usr/bin/php taskrunner.php stage22.ctcustomer.com 11244 --auto --distribute-load)
    ```
    
    DomainID finner man i brukerprofilmenyen i CP:
    
    ![[📎 Filer/image 24.png|image 24.png]]
    
- [ ] Logge inn i CPAdmin [https://corepublish.stage22.coretrek.no/admin/systeminfo.php](https://corepublish.stage22.coretrek.no/admin/systeminfo.php) og søke opp kunde.
- [ ] I fanen **Crontasks**, klikk på **+ Create cron task** øverst til høyre og opprett de fem obligatoriske.
- [ ] Sjekk fanen **Modules** om **Statistics** er aktivert. I så fall, legg til:
    - [ ] **Statistics daily tasks**
    - [ ] **Statistics minutely tasks**
- [ ] Kjør taskrunner (kommandoen fra crontab) en gang manuelt.

  

  

Primærfarge grønn