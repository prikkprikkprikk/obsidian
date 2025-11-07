---
Kunde:
  - "[[Databaser/Kundar/Sirkula\\|Sirkula]]"
Prosjekttype: CoreTrek
✔️ Oppgåver:
  - "[[MNC-TZXHR-614 Får ikke SMS-varsel]]"
  - "[[QBP-FJFXF-696 Får bestilt bleieavtale på Min Side uten å velge eiendom]]"
Prosjektstatus: På vent
---
## Gitlab

> [!info]  
>  
> [https://scm.coretrek.no/Konsulent/sirkula](https://scm.coretrek.no/Konsulent/sirkula)  

## Design

## Google Drive

## Moment

> [!info] Moment  
>  
> [https://app.moment.team/coretrek/projects/entries/0006445](https://app.moment.team/coretrek/projects/entries/0006445)  

  

p-nr: 14047537631

## Composer

### mosquitto?

```Shell
composer install --ignore-platform-req=ext-mosquitto-php
```

## config-symlink

- [ ] Symlinke den kundespesifikke config-fila inn i `/usr/local/cpinstall/activeversion/config:`
    
    ```Shell
    cd /usr/local/cpinstall/config
    ln -s /home/jorn/public_html/devel/[prosjektnavn]/config/[prosjektnavn].config.php [prosjektnavn].config.php
    ```
    

  

  

#### Oppgåver

|![](https://www.notion.so/icons/font_gray.svg)Name|![](https://www.notion.so/icons/clock_gray.svg)Date Created|![](https://www.notion.so/icons/calendar_gray.svg)Deadline|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Hast|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Hovudoppgåve|![](https://www.notion.so/icons/checkmark-square_gray.svg)Innboks|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Områder|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Prosjekt|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Status|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Type|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Underoppgåver|
|---|---|---|---|---|---|---|---|---|---|---|
|[[MNC-TZXHR-614 Får ikke SMS-varsel]]|21. august 2025 09:32||Hastar||[ ]||[[Databaser/Prosjekt/Sirkula]]|Ferdig|CoreTrek||
|[[QBP-FJFXF-696 Får bestilt bleieavtale på Min Side uten å velge eiendom]]|21. august 2025 09:32||||[ ]||[[Databaser/Prosjekt/Sirkula]]|I arbeid|||

  
  

  

## Sirkula-prosjektet

Hedmark-regionen

Kenneth og Morten i fjor

1,8 mill

Masse integrasjoner

Hostet sammen med flere andre nettsider for div. kommuner pluss hias.no

  

De hoster selv via Indigo IKT, som er driftsansvarlige

Server låst, ligger bak Citrix

### Innlogging i prod

Kommer bare inn på prod via dev22/devcustom22

```Shell
ssh f-yd-web20
```

Se pw id: 5255

Loggfil: `/var/log/frontend/sirkula`

  

Eyvind er KAM

## SMS-problemer

Support-sak: MNC-TZXHR-614

Noen kunder ligger med feil adresse i ett eller annet system.

Kan SMS-problemer være relatert til det?

[https://www.sirkula.no/hjemme-hos-deg/finn-dine-tommedager/](https://www.sirkula.no/hjemme-hos-deg/finn-dine-tommedager/)

CP:

Skjema → Lagringsmetoder → SMS-varsling

  

SMS-varsling hidden_address er tom, kan det vere det som er problemet?

  

  

  

varselAntallDager var satt til 365 inntil for et par måneder siden, kan vi få Komtek til å sjekke om de har feil verdi?

  

  

  

  

  

  

  

NB: Skjemaer som starter med x må man være forsiktige med, de har programmert spesiell logikk mot andre ting