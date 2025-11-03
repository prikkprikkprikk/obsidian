---
Date Created: 2025-03-31T10:18
Innboks: false
Prosjekt:
  - "[[TØI]]"
Status: På vent
---
HelseNord – SeenArticleCounterService:  
[https://scm.coretrek.no/Konsulent/helsenord2021/-/blob/master/include/classes/HelseNord/article/seencounter/SeenArticleCounterService.php](https://scm.coretrek.no/Konsulent/helsenord2021/-/blob/master/include/classes/HelseNord/article/seencounter/SeenArticleCounterService.php)

  

  

- [x] Lagre tidspunkt for “noticeboardtile last opened” på bruker
    - [x] t_wps_user_preferences
    - [x] getUser()→setProperty() og getProperty()
    - [x] Lagre som array i json
    - [x] Indeksert på artikkeltypeId_kategoriId
- [ ] Sett-timestamp må oppdateres hver gang brukeren laster oppslagstavla åpen:
    - [ ] Forside desktop
    - [ ] Fullvisning
- [ ] Eller motsatt:
    - [ ] Må ikke kjøre markAllAsSeen hvis man er på mobil forside og brikke ikke er åpen.
    - [ ] … men kjøres hvis man ekspanderer.
- [ ] Oppdatere timestamp når noen sletter et oppslag eller en kommentar?

  

  

- [ ] Bruker laster brikke.
    - [ ] Hvis brikka er lasta i utvida modus, skal "alle varsler sett"-tidsstempelet oppdaterast til dette tidspunktet.
    - [ ] Hvis brikka er lasta i samanfolda modus, skal talet på uleste varsler lastast i staden, og merket skal oppdaterast med dette talet.
        - [ ] Hvis 100 (grensa for å hente frå databasen), vis "99+"
- [ ] Når brikka blir veksla frå samanfolda til utvida modus, skal "markAllAsSeen"-tenesta kallast.