---
Kategori: Oppsett
---
- [ ] Klone prosjekt fra Gitlab til lokalt.
- [ ] Legge til ruleset.xml
- [ ] Legge inn `release.config` i [prosjekt]/config med riktig `$domainId`, `$customerName` og `$releaseTargets`
- [ ] Opprette prosjektmappe på dev22:

```Shell
ssh dev22
cd public_html/devel
mkdir [prosjektnavn]
```

- [ ] Symlinke prosjektet i ~:
    
    ```Shell
    cd
    ln -s public_html/devel/[prosjektnavn] [prosjektnavn]
    ```
    
- [ ] Åpne prosjekt i PHPStorm
    - [ ] Legge til `cplib` og `corepublish` i External Libraries
    - [ ] [[Automatisk FTP til dev]]
    - [ ] Markere rotmappa og laste opp med **Tools → Deployment → Upload to dev22**
        - [ ] (Eller helst installere med git på server.)
- [ ] På dev22:
    - [ ] Installere
        
        ```Shell
        composer install
        npm ci && npm run build
        ```
        
    - [ ] Symlinke corepublish i html-mappa:
        
        ```Shell
        cd ~/public_html/devel/[prosjektnavn]/html
        ln -s ../../corepublish/html corepublish
        ```
        
- [ ] I CorePublish:
    - [ ] Endre dev22-URL under **Nettsteder → Servere**
- [ ] Symlinke den kundespesifikke config-fila inn i `/usr/local/cpinstall/activeversion/config:`
    
    ```Shell
    cd /usr/local/cpinstall/config
    ln -s /home/jorn/public_html/devel/[prosjektnavn]/config/[prosjektnavn].config.php [prosjektnavn].config.php
    ```