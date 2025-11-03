---
Hovudoppgåve:
  - "[[CP-16179 SiteComponents webapp- Create oppslagstavle tile]]"
---
Etter levering av dette prosjektet har jeg noen observasjoner, tanker og spørsmål.

## Generell filosofi ang. gjenbrukbare elementer

> [!important] Hvordan sørger vi for konsistent design på tvers av hele systemet?

Jeg forstår tanken om at de enkelte komponentene skal være selvstendige, men samtidig blir det:

- mye dobbeltarbeid og dobbel kode når alt må kodes flere ganger.
- mye ekstra jobb å endre alt alle steder dersom noe skal/må endres.
    - Samtidig øker det risikoen for uante konsekvenser dersom man endrer på en komponent som er brukt mange steder. (Her kunne kanskje automatisk UI-testing blitt brukt …?)
- vanskelig å holde alt likt og konsekvent overalt.

Eksempler på relativt enkle ting som kunne vært komponenter er ulike deler av kortene på forsiden av webappen:

- .card-header med ikon og tittel.
- .card-footer med lenke og pil
- Knapper med ikon

Også ting som språkstrenger, som jeg har laget twig-template for enkelt å få inn i Javascript fra PHP.

## Ikke implementert

- [ ] Maks-høyde på forsiden (scrolling av oppslag-lista)
- [ ] Velg synlighet (alle/avdeling/lokasjon)
- [ ] Toggle-knapp for «vis kun mine innlegg» i fullvisning
- [ ] Paginering av oppslag i fullvisning

## ToDo/OneDay/Maybe

- [ ] Admin-brukere bør kunne slette andres innlegg
- [ ] Brikke-innstilling for antall oppslag som vises på forsidebrikka?
- [ ] Markering av avdeling/lokasjon på oppslag. (Mangler design også.)
    - [ ] Eventuelt også filtrering av dette? (Kanskje best som dropdown …)
        - [ ] (•) Alle ( ) Felles ( ) Min avdeling ( ) Min lokasjon
- [ ] Felles spinner-komponent som ikke er basert på Sweetalert, fordi denne tar over hele vinduet (og er tredjeparts).
    - [ ] Skulle hatt en som var felles overalt. Den kan gjerne være lik Sweetalert sin i utseende, men mulig å putte inn der man trenger det i stedet for som heldekkende overlay.