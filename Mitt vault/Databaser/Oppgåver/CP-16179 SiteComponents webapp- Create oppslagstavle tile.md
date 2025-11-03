---
Date Created: Invalid date
Underoppgåver:
  - "[[Relativ tid på oppslag og kommentarer]]"
  - "[[NoticeBoardTile TileService]]"
  - "[[Oppdatere master-databasen]]"
Innboks: false
Områder:
  - "[[Jobb]]"
Prosjekt:
  - "[[SiteComponents]]"
Status: Ferdig
Type: CoreTrek
---
## YouTrack

> [!info] coretrek.youtrack.cloud  
>  
> [https://coretrek.youtrack.cloud/issue/CP-16303/SiteComponents-webapp-Create-oppslagstavle-tile](https://coretrek.youtrack.cloud/issue/CP-16303/SiteComponents-webapp-Create-oppslagstavle-tile)  

## Oppsummering

[[Oppsummering]]

## Spesifikasjon

> [!info]  
>  
> [https://docs.google.com/document/d/12wLsa32qJfDHyYeaZhqZT8YyGnLVO89RA7TMHSPnlYY/edit?tab=t.0#heading=h.kbt4kly290v1](https://docs.google.com/document/d/12wLsa32qJfDHyYeaZhqZT8YyGnLVO89RA7TMHSPnlYY/edit?tab=t.0#heading=h.kbt4kly290v1)  

  

## Design

### Frontpage

> [!info] SC Intra (hoved mal)   
> [https://sc-intranett.webflow.io/](https://sc-intranett.webflow.io/)  

### Details

> [!info] oppslagstavle / sosial vegg  
>  
> [https://sc-intranett.webflow.io/oppslagstavle](https://sc-intranett.webflow.io/oppslagstavle)  

## CP-endringslogg

[[CP-endringslogg]]

## Eksempel fra Marit

Marit har laget tilsvarende brikke for FNS for 6 år siden, se på for eksempler på funksjoner etc.

[https://scm.coretrek.no/Konsulent/fnsintra/-/commit/f9fa8f5692edca8e2662271be82143015ddb2de8](https://scm.coretrek.no/Konsulent/fnsintra/-/commit/f9fa8f5692edca8e2662271be82143015ddb2de8)

#### Oppgåver

|![](https://www.notion.so/icons/font_gray.svg)Name|![](https://www.notion.so/icons/clock_gray.svg)Date Created|![](https://www.notion.so/icons/calendar_gray.svg)Deadline|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Hast|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Hovudoppgåve|![](https://www.notion.so/icons/checkmark-square_gray.svg)Innboks|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Områder|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Prosjekt|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Status|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Type|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Underoppgåver|
|---|---|---|---|---|---|---|---|---|---|---|
|[[Oppdatere master-databasen]]|22. januar 2025 14:57|||[[CP-16179 SiteComponents webapp- Create oppslagstavle tile]]|[ ]|||Ferdig|||
|[[Relativ tid på oppslag og kommentarer]]|2. januar 2025 10:19|||[[CP-16179 SiteComponents webapp- Create oppslagstavle tile]]|[ ]|||Ferdig|||
|[[NoticeBoardTile TileService]]|9. januar 2025 08:35|||[[CP-16179 SiteComponents webapp- Create oppslagstavle tile]]|[ ]||[[SiteComponents]]|Ferdig|||

  
  

  

  

## Development

### CorePublish

[https://corepublish.jorn.cp81.intra.coretrek.com](https://corepublish.jorn.cp81.intra.coretrek.com/)

Kunde / brukernavn / passord: jorn / system / system

### Intranett

[https://webapp.sitecomponents.jorn.cp81.intra.coretrek.com](https://webapp.sitecomponents.jorn.cp81.intra.coretrek.com/)

Brukernavn / passord: system / system

  

### Files

![[📎 Filer/image 9.png|image 9.png]]

## Placeholder name/ID

`notice-board`

  

## Spørsmål

- Designet har kun plaintext på sjølve oppslaga også, ingen formatering.
- Er det laga CSS for tittel på cards i webappen?

  

## Artikkeltype

- [x] Det skal vere en egen artikkeltype (Oppslag/Notice). Må defineres i CP og manuelt opprettes på nytt i SC-master-databasen ved sluttføring av task.

## Oppslag-kategori

- [x] Lage innstilling på brikka for kategori oppslagene skal hentes fra.

## Kode

- [x] Legges i `SiteComponents`. Kan potensielt sett brukes i vanlig SC også.

## Kommentarer

Har ikke egen renderer?

## Spørsmål

- [ ] Felles avatar-kode (for heile SC)?
    - [ ] Inkl. fallback-ikon?
        - [ ] Snakk med Julie
- [ ] Service for henting av kommentarar ved klikk på «X kommentarer»?
    - [ ] Også “slett kommentar”
    - [x] Brikke-klassen som service
        - [x] TileService
- [ ] Header, dvs. byline med avatar, navn og tidspunkt er lik for oppslag og kommentarer, og burde vært et slags «komponent» med attributt for avatar-størrelse.
    - [ ] Statisk funksjon på brikka
- [ ] Tidspunkt – snakk med Julie
- [ ]

  

  

## ToDo

- [ ] Kollaps skal bare vises på forsiden
    - [ ] body.theme-webapp.frontpage

  

![[📎 Filer/image 1 3.png|image 1 3.png]]