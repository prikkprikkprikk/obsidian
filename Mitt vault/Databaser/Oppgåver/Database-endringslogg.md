---
Hovudoppgåve:
  - "[[CP-16498 Varselbanner for hendelser (AlertBannerTile)]]"
---
Endringer som er gjort i CP/databasen, som må repliseres i SC master-databasen ved sluttføring:

## Strukturmal: [WebApp] - Forside

Lagt inn ny placeholder – `alerts` – før `main-left`.

![[📎 Filer/image 34.png|image 34.png]]

## Brikke: AlertBannerTile

Kopierte Bannerliste-brikken.

Slettet parameter: `first-image-alignment`

![[📎 Filer/image 1 16.png|image 1 16.png]]

## Kategorier

Opprettet Varslinger/Alerts under Forside/Home.

Endret kategorimal til **Aktuellt** og artikkelmal til **Ny visningsmal**.

## Kategorimal: **[WebApp] - Forside**

La inn brikke **Varselsbanner** under den nye brikkeholderen **Varslinger**.

Valgte kategoriene fra forrige steg som innstilling for hvor brikken skal hente artikler fra.

## Artikkeltype: Banner

… har fått programmatisk navn: `banner`

![[📎 Filer/image 2 10.png|image 2 10.png]]