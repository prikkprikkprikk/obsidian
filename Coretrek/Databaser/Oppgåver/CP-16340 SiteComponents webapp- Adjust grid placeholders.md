---
Date Created: 2025-01-24T11:55
Underoppgåver:
  - "[[Webapp- Justere design]]"
Innboks: false
Områder:
  - "[[Jobb]]"
Prosjekt:
  - "[[SiteComponents]]"
Oppgavestatus: Ferdig
Type: CoreTrek
---
  
Breakpoints:_`(xs: 0, sm: 576px, md: 768px, lg: 992px, xl: 1200px)`_

  

- [x] Forside-mal – fjerne
- [x] Testinnhold oppslagstavle
- [x] Vise oppslagstavle bare med skjema dersom ingen oppslag
- [x] Langstring: `noticeboard.no_notices`
    
    «Ingen har skrevet noe oppslag ennå.»
    
    «No notices have been posted yet.»
    
- [x] Oppslagstavle-ikon må lastast opp i master.
- [x] Egen mappe til Oppslagstavle-bilder
- [ ] Lenke til fullvisning – med pil
- [ ] Fikse CSS og script for toggling av sidemeny
    - [ ] Menyen skal være:
        - [ ] **Mobil:** fullbredde og skjult ved `@include media-breakpoint-down(md)` (altså under `lg`, mao. opp til og med 991,98px)
            - [ ] Kan toggles med hamburgerknapp i menylinja, men denne togglingen må ignoreres ved desktopvisning.
        - [ ] **Desktop:** 15rem og synlig ved `@include media-breakpoint-up(lg)` (altså fom. 992px)
            - [ ] Kan toggles mellom 15rem og kun ikoner, men dette må ignoreres ved mobilvisning.

  

  

  

  

- [x] Legge til placeholders med nye navn
- [x] Fjerne redigeringsmal
    - [x] webapp/std_grid.php
    - [x] webapp/std_frontpage.php
- [x] Flytte elementer til nye placeholders
- [x] Slette gamle placeholders
- [x] Fjerne kategorimal [**WebApp] - Felles → Forside**
    - [x] Først sjekke bruk – den brukes på engelsk forside pluss alle snarvei-kategorier på begge språk. Disse endres til f.eks. [**WebApp] - Felles → Kategori**
- [ ] Endre `placeholder-full-side-menu` til `placeholder-left`
    - [ ] Også i brikkeinnstillingen til «Sidemeny veksel» (for både felles- og forside-kategorimal):
        
        ![[📎 Filer/image 12.png|image 12.png]]
        
        ![[📎 Filer/image 1 5.png|image 1 5.png]]
        
- [ ] Fikse toppmeny
    - [ ] Vertikal størrelse
    - [ ] Plassering av elementer
        - [ ] Logo til venstre
        - [ ] Resten til høyre
- [ ]