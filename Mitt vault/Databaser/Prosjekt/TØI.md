---
tags:
  - Intranett
Kunde:
  - "[[Databaser/Kundar/CorePublish\\|CorePublish]]"
Status: Innkomande
Type: CoreTrek
✔️ Oppgåver:
  - "[[Endringer som også må gjøres i produkt]]"
  - "[[Frontend-redigering]]"
  - "[[Antall uleste]]"
  - "[[TI-49 Portalside klargjøring(endringsordre)]]"
  - "[[Uten navn 3\\|Uten navn 3]]"
---
## Gitlab

> [!info]  
>  
> [https://scm.coretrek.no/Konsulent/toi2025](https://scm.coretrek.no/Konsulent/toi2025)  

## CPAdmin

> [!info]  
>  
> [http://toi2025.jorn.devcustom22.intra.coretrek.com/cpadmin/](http://toi2025.jorn.devcustom22.intra.coretrek.com/cpadmin/)  

[https://pw.intra.coretrek.com/#pwsearch=id:6205](https://pw.intra.coretrek.com/#pwsearch=id:6205)

## Design

> [!info] oversikt  
>  
> [https://toi-intranett.webflow.io/oversikt](https://toi-intranett.webflow.io/oversikt)  

## Prosjekter  
(gammelt intranett)

> [!info]  
>  
> [https://toi-intranett.toi.no/category.php?categoryID=118](https://toi-intranett.toi.no/category.php?categoryID=118)  

Sperret på IP, lagt inn i `/etc/hosts`

## Google Drive

### Prosjektdokumenter

> [!info]  
>  
> [https://drive.google.com/drive/folders/18FGwKW2WsNa5OWge45Avad86wYAYHxmH](https://drive.google.com/drive/folders/18FGwKW2WsNa5OWge45Avad86wYAYHxmH)  

### Design til utvikler

> [!info]  
>  
> [https://drive.google.com/drive/u/0/folders/1J8ZjpgPCxfY4XsUtnRKefn1qaXEkUYML](https://drive.google.com/drive/u/0/folders/1J8ZjpgPCxfY4XsUtnRKefn1qaXEkUYML)  

## Moment

### Intranett

> [!info] Moment  
>  
> [https://app.moment.team/coretrek/projects/entries/0006109](https://app.moment.team/coretrek/projects/entries/0006109)  

### Integrasjoner

Prosjektnr. 6110

### Tillegg

Prosjektnr. 6111

#### Oppgåver

|![](https://www.notion.so/icons/font_gray.svg)Name|![](https://www.notion.so/icons/clock_gray.svg)Date Created|![](https://www.notion.so/icons/calendar_gray.svg)Deadline|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Hast|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Hovudoppgåve|![](https://www.notion.so/icons/checkmark-square_gray.svg)Innboks|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Områder|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Prosjekt|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Status|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Type|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Underoppgåver|
|---|---|---|---|---|---|---|---|---|---|---|
|[[Endringer som også må gjøres i produkt]]|4. mars 2025 11:19||||[ ]||[[TØI]]|Ferdig|||
|[[Antall uleste]]|31. mars 2025 10:18||||[ ]||[[TØI]]|På vent|||
|[[Frontend-redigering]]|24. mars 2025 10:09||||[ ]||[[TØI]]|På vent|||
|[[TI-49 Portalside klargjøring(endringsordre)]]|24. september 2025 12:09||||[ ]||[[TØI]]|I arbeid||[[TØI portalside- Endringer i prod]]|
|[[Uten navn 3\|Uten navn 3]]|24. september 2025 12:09||||[ ]||[[TØI]]|I arbeid|||

  
  

  

## Staging

  

  

  

  

  

Alle endringer ligger i denne MR’en (ikke merget inn i master):

[https://scm.coretrek.no/Konsulent/sirkula/-/merge_requests/53](https://scm.coretrek.no/Konsulent/sirkula/-/merge_requests/53)

Howto:

- sjekk ut 2025-03-devcustom22
- laste opp prosjektet til

[devcustom22.intra.coretrek.com](http://devcustom22.intra.coretrek.com/)

- peke webapp til prosjektmappe i ~/public_html/devel:
    
    `ln -s toi2025 toi2025-webapp`  
    (fordi vi bruker toi2025-webapp.jorn.devcustom22.intra.coretrek.com)
    
- opprett symlinker i prosjekt/html (se eksempel: /home/eirik/public_html/devel/sirkula/html):

- ln -s /usr/local/cpinstall/versions/9.1.2 cpversion

- ln -s cpversion/corepublish/html corepublish

- ln -s cpversion/corepublish/admin cpadmin

- evt. pek om kunde.config til eget område
- evt. pek om nettstedets “Sti til prosjektfiler” til eget områdeProsjekt URLer:

[http://sirkula.eirik.devcustom22.intra.coretrek.com/](http://sirkula.eirik.devcustom22.intra.coretrek.com/)

[https://sirkula.eirik.devcustom22.intra.coretrek.com/corepublish/](https://sirkula.eirik.devcustom22.intra.coretrek.com/corepublish/)

[https://sirkula.eirik.devcustom22.intra.coretrek.com/cpadmin/](https://sirkula.eirik.devcustom22.intra.coretrek.com/cpadmin/)

(pw id:6205)

Husk: hvis cron skal gjøres må det gjøres fra /usr/local/cpinstall/versions/9.1.2/corepublish/cron/Hvis CP version skal oppgraderes (på dev) må dette gjøres:

- endre path i include-config linje 76
- endre symlink for “cpversion” i prosjekt/html

  

  

```Scss

\#placeholder-main-right {
	container-type: inline-size;
	
	@container (min-width: 40rem) {
		& > .row {
			display: grid;
		  grid-template-columns: 1fr 1fr;
			gap: 30px 0;
		}
	}
}

.grid-column-1 {
  grid-column: 1;
}

.grid-column-2 {
  grid-column: 2;
}

.grid-row-span-2 {
  grid-row-end: span 2;
}

.grid-row-span-3 {
  grid-row-end: span 3;
}

// [etc...]
```

  

## Webapp frontpage grid

Plan for grid:

- [ ] Fjerne `margin-left: auto` og `margin-right: auto` på `body.frontpage #main-layout-wrapper .main-content-wrapper` i grid.css
- [ ] Sette `width: 100%` og `max-width: 1900px` på `main-content-wrapper`
- [ ] Sette `align-items: center` på `#main-layout-wrapper`
- [ ] Sette `container-type: inline-size` og `width: calc(100% + 30px);` på `#placeholder-main-right > .row`

Da burde det funke med @container queries.

  

## Sortere oppslag etter tidspunkt for siste kommentar

```SQL
SELECT a.*, 
       COALESCE(c.latestposttimestamp, a.firstpublished_timestamp) AS sort_timestamp
FROM t_wps_article_info a
LEFT JOIN t_wps_entity_comment c ON a.article_info_ID = c.entityid
ORDER BY sort_timestamp DESC
```