---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---
## ToDo

- [x] Lage eiga brikke for visning av beskrivelsen, fordi den må registrerast i DynamicMenuManager, og då kan ein ikkje bruke ArticleElementsTile, fordi den då også vil plukke opp "Kontaktpersoner" på ei forskningsområde-side.
- [x] Felt for lenke til NVA (Nasjonalt vitenarkiv)
	- [x] Eksempel: https://nva.sikt.no/research-profile/1122235
- [ ] Publikasjonsbrikke, tre variantar (felt i publikasjonen):
	- [ ] Rapporter
	- [ ] Artikler
	- [ ] Bøker


## ToDo i prod

- [x] Utvide brukarartikkelen
	- [x] artikkelelement for beskrivelse
	- [x] NVA-lenke
- [x] Opprette ny brikke: **Artikkelelementer (dynamisk undermeny)**
	- [x] Legge til **Beskrivelse** som artikkelelement-valg
- [x] Legge inn brikke i kategorimal **Ansatt**
	- [x] Husk CSS-klasse `user-description`
- [x] Opprette egendefinert innstilling for bruker fullvisning:
	- [x] `template_id.77.body_css_class` → `ct-user-full-view`
- [x] Språkstreng: `userDisplayTile.nva_link_title`
- [x] Brukerartikkel