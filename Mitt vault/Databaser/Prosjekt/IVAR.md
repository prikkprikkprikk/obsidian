---
Prosjekttype: CoreTrek
✔️ Oppgåver:
  - "[[KeyFigures]]"
  - "[[BookingFacility]]"
  - "[[Anlegg-artikkeltyper]]"
  - "[[RElsk]]"
  - "[[Tømmedag-brikke]]"
Prosjektstatus: I arbeid
---

| Teneste                                 | Lenker                                                                                                                                                                                                                             |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![[GitLab logo.png\|50]]<br>GitLab      | [ivar2025](https://scm.coretrek.no/Konsulent/ivar2025)                                                                                                                                                                             |
| ![[Webflow logo.png\|50]]<br>Design     | [ivar2025 @ webflow](https://ivar-design.webflow.io/oversikt)<br>[IVAR profilmanual](https://fasett.brandguide.io/ivar)<br><br>IRR: https://ivar-ryfylke.webflow.io/oversikt<br><br>R:Elsk: https://relsk.webflow.io/oversikt      |
| ![[Google Drive logo.png\|50]]<br>Drive | [IVAR 2025](https://drive.google.com/drive/folders/1ZADZeS5JY_3X2xKpebf84Ecr6kjVByqC)<br>[IVAR Estimat 2025](https://docs.google.com/spreadsheets/d/1H4df80pSsiUQcRPEB31joONG4m5To9ESvunDx-5biBo/edit?gid=890527012#gid=890527012) |
| ![[Moment logo.png\|50]]<br>Moment      | [IVAR IKS - Nye nettsider 2025](https://app.moment.team/coretrek/projects/entries/0006537)                                                                                                                                         |
| ![[YouTrack logo.png\|50]]<br>YouTrack  | [IVAR kanban board](https://coretrek.youtrack.cloud/agiles/176-44/current)                                                                                                                                                         |

## Oppgåver
![[Oppgåver (dette prosjektet).base]]


## Estimeringsmøte med Eirik 14. november

### Åpningstider
Brikke: Artikkelelementer
Opprette ny programmatisk gruppe for åpningstider-templateline
Legge til denne i brikkeparameter for elements_programmaticgroup
### Kartvisning
Også egen brikke, a la åpningstider

## Møte med Eirik 3. desember
### Booking
Berre bruke skjemaet.
Prøve å selge inn:
* Admin-side med kronologisk oversikt.
* Task som sender ut oversikt for komande veke, f.eks.

### Bruke standard artikkelliste for gjenbruksstasjonar/opningstider
Utfordringar:
* Display: grid, fjerne standard Bootstrap-grid
	* Betyr ikkje det at ein må endre twig-template for heile brikka?
* Skrive om CSS til å virke med standard artikkelliste

Løysing: Endre BusinessHoursTile til å bruke artiklane sin rendringsmetode; altså skrote eigen output i {% for article in tile.getArticles() %} i businesshours.html.twig, og heller kalle på artikkelen sin list view rendring.

#### Åpningstider-brikke
Klasse: `\CoreTrek\Ivar\BusinessHours\Tile\BusinessHoursTile`
Visningsmal: `site:classes/Ivar/BusinessHours/Tile/businesshours.html.twig`
