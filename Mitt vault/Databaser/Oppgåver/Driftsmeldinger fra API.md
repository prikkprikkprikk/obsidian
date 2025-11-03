---
Date Created: 2025-04-08T10:35
Innboks: false
Prosjekt:
  - "[[Area Nett - Nye nettsider area.no]]"
Status: I arbeid
Type: CoreTrek
---
- [ ] Disable event log ved import, så det ikke kommer notifikasjoner i CP
    - [ ] [https://scm.coretrek.no/Produkt/corepublish/-/merge_requests/2431/diffs](https://scm.coretrek.no/Produkt/corepublish/-/merge_requests/2431/diffs)
    - [ ] `CtEventLogManager::disableEventLogging()` i starten
    - [ ] `CtEventLogManager::enableEventLogging()` når ferdig
- [ ] Lagre API-URL i innstillinger.
- [ ] Article import: [https://technet.coretrek.no/doc/latest/developer/features/06-articleimport.html](https://technet.coretrek.no/doc/latest/developer/features/06-articleimport.html)
- [ ] Sjekk jorn2024 for eksempel på bruk av content importer
- [ ] SourceArticle::Create($templateId, $externalId);
    - [ ] Sette categoryId
- [ ] Gå gjennom artikler i kategorien
    - [ ] Hvis eksternId ikke eksisterer i API-data, slette fra CP
    - [ ] (Hvis den finnes, blir den oppdatert med ev. nye data fra SourceArticle)
- [ ] Logge feilmeldinger hvis vi ikke får kontakt med API-endepunktet

  

- [ ] Varselbanner-design: [https://areanett.webflow.io/home-varselbanner](https://areanett.webflow.io/home-varselbanner)