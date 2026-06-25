---
tags:
  - Testing
YouTrack-URL: CP-16304
Status: Not started
YouTrack-ID: CP-16304
---
Check that notifications are implemented properly, works and looks OK in the new SC webapp design/framework.

This means at least:

- [x] The correct tile is added on all category templates in the top bar, next to the user icon.
- [x] It displays notifications correctly and with correct CSS.
- [x] When clicking on the notifications they are marked as read, and the service for marking all read is working.

  

  

**Problem:** Designet har flere elementer i toppmenyen som åpner en undermeny, og som på små skjermer ligger rett under \#placeholder-top og tar opp hele bredden og restrerende høyde:

- hovedmenyen (venstre)
- søkefeltet
- notifikasjoner
- brukermenyen

Alle disse undermenyene ligger inni div-er som igjen er inni \#placeholder-top, og den eneste måten å plassere disse på med CSS er å bruke `position: fixed`.

Men vi vet ikke hvor underkant av toppmenyen er, fordi direkteredigering kan være aktivt.

Dermed tror jeg man rett og slett må bruke Javascript for å finne bunnen på \#placeholder-top.

I tillegg bør disse ulike elementene kunne påvirke hverandre, slik at man sørger for å lukke det ene før man åpner et annet.

  

**Problem:** CSS-klasse-definisjonene i brikkers twig templates kontra placeholder-navn i SC vs. webapp.

Ønsker å la være å bruke bootstrap-kolonner på logoen i webappen, eller i det minste bruke andre kolonnebredder der enn på nettsiden/frontend/ekstranett, men det går ikke an siden menylinjen heter \#placeholder-top begge steder.

Kan overstyre col-klassene med CSS, men det blir jo fort ganske rotete.