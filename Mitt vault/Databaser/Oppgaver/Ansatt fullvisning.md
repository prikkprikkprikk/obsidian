---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---
## ToDo

- [x] Lage eiga brikke for visning av beskrivelsen, fordi den må registrerast i DynamicMenuManager, og då kan ein ikkje bruke ArticleElementsTile, fordi den då også vil plukke opp "Kontaktpersoner" på ei forskningsområde-side.
- [ ] Felt for lenke til NVA (Nasjonalt vitenarkiv)
	- [ ] Eksempel: https://nva.sikt.no/research-profile/1122235


## ToDo i prod

- [ ] Utvide brukarartikkelen med artikkelelement for beskrivelse
- [ ] Opprette ny brikke: **Artikkelelementer (dynamisk undermeny)**
- [ ] Legge inn brikke i kategorimal **Ansatt**
	- [ ] Husk CSS-klasse `user-description`
		- [ ] … eller bør den leggast inn i twig som `'user-' . elementname`?
- [ ] Opprette egendefinert innstilling for bruker fullvisning:
	- [ ] `template_id.77.body_css_class` → `ct-user-full-view`
- [ ] Språkstreng: `userDisplayTile.nva_link_title`
- [ ] 