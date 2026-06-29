---
Date Created: 2025-01-23T15:00
Hovudoppgåve:
  - "[[CoreTrek/Mine YouTrack-saker/CP-16334 Direct edit topbar-tile does not display correctly in webapp]]"
Innboks: false
Områder:
  - "[[Jobb]]"
Prosjekt:
  - "[[SiteComponents]]"
Oppgavestatus: Ferdig
Type: CoreTrek
---
Placeholders i toppen skal vere som i vanleg SC.

**Problem:** Kategorimalen oppdaterer seg ikkje med nytt placeholder-oppsett.

**Løysing:** Oppdatere redigeringsmalen:

![[📎 Filer/image 11.png|image 11.png]]

Plan:

- [x] Opprette issue for endring av `webapp/std_grid.php`
    
    [CP-16339](https://coretrek.youtrack.cloud/issue/CP-16339) Webapp: Add placeholder-small-top-2 to edit templates
    
- [x] Lage branch med issue-nummer
    
    `CP-16339-update-webapp-edit-templates`
    
- [x] Fikse std_grid.php
- [x] Teste lokalt
- [x] Commit
- [x] MR
- [ ] When merged: Pull master
    - [ ] locally
    - [ ] server

  

  

![[📎 Filer/image 1 4.png|image 1 4.png]]