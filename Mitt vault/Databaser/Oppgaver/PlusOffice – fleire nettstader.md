Vi har fått en forespørsel fra [https://www.plusoffice.no/](https://www.plusoffice.no/) om å utvide med flere nettsteder (men i første omgang ett nytt nettsted).

Kan du sette opp et estimat på hva du tenker om det?

Jeg ser for meg 3 punkter:  

1. Klargjøre for flere nettsteder/themes, med et “shared” base-theme, med under tema per nettsted som kan overstyre stilingen til basen (ala slik det er på sirkula, ivar etc)
2. Lage et “mal-nettsted” i CorePublish - i.e. kopiere [plusoffice.no](http://plusoffice.no) - til et nytt nettsted, med enklere struktur og bare noen få artikler
3. Bruke “mal-nettsted” (i.e. kopiere det) for å starte på oppsettet for et nytt nettsted. Ting å tenke på ift config i CP:
    1. Hvert nettsted burde ha egen rot-mappe i filarkivet til filer
    2. Søk- og søkeresultatbrikker må ha egne configs per nettsted (i.e. “vis innhold fra”)
    3. Fornuftig navngivning/struktur på brukergrupper (f.eks. flere nivåer etc)
    4. Sikkert ting jeg har glemt


## Estimat – flere nettsteder for PlusOffice

| Oppgave                | Hva må gjøres                         |  Timer |
| ---------------------- | ------------------------------------- | -----: |
| Research og estimat    | Sjekke eksisterende kode, estimere    |      1 |
| Oppsett                | Oppdatere utviklingsversjon           |      1 |
| Endringer i CSS        | Legge opp SCSS-mapper og -filer       |      4 |
| Endringer i webpack    | Støtte for ulike themes               |      4 |
| Lage mal-nettsted      | Kopiere plusoffice.no, rydde/forenkle |      3 |
| Opprette nytt nettsted | Konfigurere                           |      3 |
| Publisere              | Release til prod                      |      1 |
| Ekstra                 | Tech lead, kommunikasjon osv.         |      4 |
| **Totalt**             |                                       | **21** |
