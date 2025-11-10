Frontend-design: [https://sc2023.webflow.io/oversikt](https://sc2023.webflow.io/oversikt)

Webapp-design: [https://sc-intranett.webflow.io/oversikt](https://sc-intranett.webflow.io/oversikt)

  

  

#### Oppgåver

|![](https://www.notion.so/icons/font_gray.svg)Name|![](https://www.notion.so/icons/clock_gray.svg)Date Created|![](https://www.notion.so/icons/calendar_gray.svg)Deadline|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Hast|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Hovudoppgåve|![](https://www.notion.so/icons/checkmark-square_gray.svg)Innboks|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Områder|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Prosjekt|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Status|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Type|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Underoppgåver|
|---|---|---|---|---|---|---|---|---|---|---|
|[[Custom select]]|25. november 2024 11:51||||[ ]||[[SiteComponents]]|Innkomande|CoreTrek||
|[[YEAR, MONTH etc]]|25. november 2024 11:58||||[ ]||[[SiteComponents]]|På vent|||
|[[CP-16482 Employees]]|6. mai 2025 07:22||||[ ]||[[SiteComponents]]|På vent|||
|[[CP-16707 OIDC Tile Auto Login and override]]|4. august 2025 12:57||||[ ]||[[SiteComponents]]|Ferdig|CoreTrek||
|[[CP-16498 Varselbanner for hendelser (AlertBannerTile)]]|29. april 2025 10:19||||[ ]|[[Jobb]]|[[SiteComponents]]|Ferdig|CoreTrek||
|[[CP-16179 SiteComponents webapp- Create oppslagstavle tile]]|3. desember 2024 15:49||||[ ]|[[Jobb]]|[[SiteComponents]]|Ferdig|CoreTrek|[[Relativ tid på oppslag og kommentarer]], [[NoticeBoardTile TileService]], [[Oppdatere master-databasen]]|
|[[Sette opp cplib-utvikling]]|25. november 2024 11:55||Hastar||[ ]||[[SiteComponents]]|Innkomande|||
|[[CP-16481 Search result]]|17. september 2025 13:45||||[ ]|[[Jobb]]|[[SiteComponents]]|I arbeid|CoreTrek|[[Search result- Endringer i master-databasen]], [[Brukerliste i tabellformat]]|
|[[NoticeBoardTile TileService]]|9. januar 2025 08:35|||[[CP-16179 SiteComponents webapp- Create oppslagstavle tile]]|[ ]||[[SiteComponents]]|Ferdig|||
|[[Databaser/Oppgaver/CP-16304 SiteComponents webapp- Verify that notifications are present and working]]|23. januar 2025 14:59||||[ ]||[[SiteComponents]]|Ferdig|CoreTrek||
|[[CP-16339 Webapp- Add placeholder-small-top-2 to edit templates]]|23. januar 2025 15:00|||[[CoreTrek/Mine YouTrack-saker/CP-16334 Direct edit topbar-tile does not display correctly in webapp]]|[ ]|[[Jobb]]|[[SiteComponents]]|Ferdig|CoreTrek||
|[[CP-16340 SiteComponents webapp- Adjust grid placeholders]]|24. januar 2025 11:55||||[ ]|[[Jobb]]|[[SiteComponents]]|Ferdig|CoreTrek|[[Webapp- Justere design]]|
|[[CoreTrek/Mine YouTrack-saker/CP-16334 Direct edit topbar-tile does not display correctly in webapp]]|24. januar 2025 11:55||||[ ]||[[SiteComponents]]|Ferdig||[[CP-16339 Webapp- Add placeholder-small-top-2 to edit templates]]|
|[[CP-16680 Declarations in footer must look like the webflow design out of the box]]|23. september 2025 08:31||||[ ]||[[SiteComponents]]|I arbeid|||

  
  

  

## sa-vprod01

```Plain
ssh corepublish
```

Installasjonen ligger under `/home/jorn/src/corepublish/`

## database sa-vprod01

```HTML
server: sa-vprod01.intra.coretrek.com
database: sc_jorn
username: jorn
password: 89dda32a93bda097
```

  

  

- [ ] Sjekke corepublish ut lokalt
- [ ] Sette opp automatisk FTP til sa-vprod01
- [ ] CorePublish: [https://corepublish.jorn.cp81.intra.coretrek.com](https://corepublish.jorn.cp81.intra.coretrek.com/)
- [ ] SiteComponents: [https://sitecomponents.jorn.cp81.intra.coretrek.com/](https://sitecomponents.jorn.cp81.intra.coretrek.com/)

  

  

Da er utviklingsmiljø på cp-serveren satt opp for deg etter avtale med Eirik:

Det er noen ressurser som du bør lese igjennom før du starter å utvikle:

- Readme.md - generelt info om utvikling. De fleste stegene mtp oppsettt har jeg dog utført (les alt nedenfor )

[https://scm.coretrek.no/Produkt/corepublish/-/blob/master/README.md](https://scm.coretrek.no/Produkt/corepublish/-/blob/master/README.md)

- Backend development CorePublish (forklarer generelt om å utvikle i CP)

[https://technet.coretrek.no/doc/latest/developer/backend/backend-development.html](https://technet.coretrek.no/doc/latest/developer/backend/backend-development.html)

- Lage Merge request til CorePublish/Sitecomponents:

[https://intranet.coretrek.no/produkt/hvordan-vi-jobber/git-og-kodekontroll/merge-request-til-corepublish/](https://intranet.coretrek.no/produkt/hvordan-vi-jobber/git-og-kodekontroll/merge-request-til-corepublish/)

- Definition of done (hva er det forventet at du har gjort før du lager en MR)

[https://intranet.coretrek.no/produkt/hvordan-vi-jobber/definition-of-done/](https://intranet.coretrek.no/produkt/hvordan-vi-jobber/definition-of-done/)

- Info om utviklingsserveren vår (sa-vprod01)

[https://intranet.coretrek.no/produkt/hvordan-vi-jobber/vare-servere/sa-vprod01-intra-coretrek-com](https://intranet.coretrek.no/produkt/hvordan-vi-jobber/vare-servere/sa-vprod01-intra-coretrek-com)

## Litt generell info som sendes ut til alle

Vi vedlikeholder for tiden to aktive brancher, _master_ (kommende CP 9.1) og _CP_9_0-STABLE_ (CP 9.0.x). Det er sistnevnte vi releaser fra per nå (eksempelvis CorePublish 9.0.33 og SiteComponents 9.0.33.x).

Hver av disse branchene har sin egen MySQL systemdatabase på cp-serveren, "_cphead"_ (master) og "_cp_9_0_stable"_ (CP_9_0-STABLE).  Man må bytte mellom disse i corepublish.config.php avhengig av hvilken branch man jobber på.

Det er også tilsvarende master-databaser for SiteComponents - henholdsvis _sc_master_ (master) og _sc_9_0_stable_ (CP_9_0-STABLE).

I systemdatabasen for branch _master_ (_cphead_) så peker derfor kunde/domene "sitecomponents" på _sc_master_, mens i systemdatabasen for branch _CP_9_0-STABLE_ (_sc_9_0_stable_) så peker "sitecomponents"-domenet på databasen _sc_9_0_stable_.

For bugfikser så skal man jobbe mot stable-branchene  og lage merge requester mot disse, og så blir endringer cherry-picket til master. Hvis branchene er veldig forskjellige kan det hende man må lage to forskjellige MR'er.

For nye features så skal disse bare lages i master-branchen.

### Utvikling av SiteComponents – database

Det skal _ikke_ utvikles/endres direkte på "sitecomponents"-domenet/databasen - dette er master og her skal bare nødvendige endringer for neste versjon legges inn ETTER at en MR er godkjent.

Dere har derfor fått hver deres kopi av denne som det skal jobbes mot når dere utvikler (se nedenfor).

Det som er gjort nå er følgende ("jorn" som eksempel):

- Git prosjektet for CorePublish/SiteComponents er sjekket ut for deg på cp.intra.coretrek.com:src/corepublish/  og branchen master er aktiv branch  og "cphead" er satt som aktiv systemdatabase.
- Du har fått ett eget domene "jorn" med egen database navngitt "sc_jorn” på cp-serveren. Dette er bare opprettet i "master" systemdatabasen, så dere må bruke denne for å kunne logge inn. NB! Det betyr at du per nå ikke har noen entry i stable-systemdatabasen, dette må opprettes ved behov.
- Du har fått din egen CorePublish-installasjon/url som finnes på [https://corepublish.jorn.cp81.intra.coretrek.com](https://corepublish.jorn.cp81.intra.coretrek.com/) (Merk at vi kjører uoffisielle sertifikater - må godkjennes i nettleseren)
- Du har fått din egen SiteComponents-installasjon som finnes på [https://sitecomponents.jorn.cp81.intra.coretrek.com](https://sitecomponents.jorn.cp81.intra.coretrek.com/)
- Du har fått din egen CorePublish Admin-installasjon/url som finnes på [https://cpadmin.jorn.cp81.intra.coretrek.com](https://cpadmin.jorn.cp81.intra.coretrek.com/) (b/p jorn/jorn)
- Alle config-filer (corepublish.config.php, include-config.php og jorn.config.php) er satt opp grunnleggende og virker. Det kan være de må justeres på alt etter hva dere skal utvikle på.
- composer install er kjørt i cplib/ og npm install/run build er kjørt i corepublish/ og sitecomponents/
- Logg-filer for CorePublish finnes på /var/log/corepublish/corepublish-jorn.log (roteres automatisk)
- Logg-filer for SiteComponents finnes på /home/jorn/src/corepublish/logs (roteres IKKE uten videre)
- Det er ikke satt opp automatisk taskrunner - kjør taskrunner.php manuelt ved behov.
- Cp-serveren har flere PHP-versjoner installert.
    - "[cp81.intra.coretrek.com](http://cp81.intra.coretrek.com/)" betyr PHP 8.1.
    - "[cp82.intra.coretrek.com](http://cp82.intra.coretrek.com/)" betyr PHP 8.2 etc.
    - Se [https://cp.intra.coretrek.com/](https://cp.intra.coretrek.com/) for en komplett oversikt (bytt PHP-versjon i topplinjen, se hva en bruker har av hoster nedover).
    - CorePublish/Sc 9.0 støtter PHP mellom 7.2 og 8.1, mens for CorePublish/SC i master støtter vi bare PHP 8.1 til PHP 8.3.  Så alt dere utvikler som skal komme i 9.0-stable må kjøre på PHP 7.2.  Det som utvikles kun for master trenger kun å støtte PHP 8.1 og oppover
    - For å bytte PHP-versjon commandline bruker dere phpbrew, eksempelvis "phpbrew use php-8.1.5". Deretter vil "php -v" vise 8.1.5.  Det er PHP 7.2 som er default installert, og skal du utvikle på master må du derfor alltid bytte til 8.1 eller nyere. "phpbrew list" viser tilgjengelige versjoner.
- Alle branch-navn skal prefikses med CP, eksempelvis "CP15781-slow-articlestore". Alle brancher som har dette prefikses plukkes opp av Jenkins og det blir kjørt automatiske unit-tester på disse branchene.
- se [https://jenkins.intra.coretrek.com](https://jenkins.intra.coretrek.com/) for oversikt over unit-tester og status for disse.