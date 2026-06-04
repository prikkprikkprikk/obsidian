---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---
## Avklaringar

- [ ] Prosjekt _og forskingssentere_?
	- [ ] Avvik mellom struktur og wireframe/webflow
- [ ] Prosjekt = artikkel
	- [ ] … men korleis filtrere/utskilje tidlegare prosjekt?
	- [ ] Sluttdato? Viss tom, er det pågåande. Viss utfylt, er det eit tidlegare prosjekt.
- [ ] Hadde eigentleg lagt opp til at prosjekt er underkategoriar av "Prosjekter", og at prosjekt-seksjonen for eit forskningssenter er ein knappemeny som listar underkategoriar
	- [ ] Men om det skal vere artiklar, må listevisning og artikkelliste kodast spesielt.
	- [ ] Dessutan: Prosjektlista under forskningsområdene viser knappemeny utan prosjektstart, medan lista over alle prosjekt har vanleg artikkel-listevisning med unntak av oppstartsdato.
		- [ ] Korleis løysast ulike listevisningar i ulike samanhengar i praksis?
- [ ] Forslag:
	- [ ] Prosjekt organiserast i underkategoriar, så knappemenyen viser rett.
	- [ ] Prosjekt-utlistingssida hentar alle prosjekt-artiklar frå heile nettsida, og filtrerer på forskningsområde.
		- [ ] Forskningsområde må setjast ved lagring á la forskningsområde-artiklane – men sidan artiklane her ligg djupare nede enn forskingsområde-artiklane, må logikken for å finne kva slags forskningsområde prosjektartiklane tilhøyrer endrast så den traverserer oppover til den finn eit forskningsområde.
	- [ ] Det innførast sluttdato for prosjekt-artiklar, noko som forenklar filtrering av aktive/tidlegare prosjekt.


## ToDo
- [ ] Fikse bredde på artikkelliste-kategorimalane.
	- [ ] Lage generell klasse `ct-article-list` som kan leggast inn i template_id.XXX.body_css_class, og flytte CSS-en over frå .news-archive

## ToDo i prod
- [ ] Endre namn på artikkeltype **Prosjekt** til **Prosjekt (intranett)**
- [ ] Lage ny artikkeltype **Prosjekt (toi.no)**
	- [ ] Legge til artikkelelement:
		- [ ] Namn: Oppstart
		- [ ] Type: Dato/tidspunkt
		- [ ] Programmatisk namn: `project_start_date` (likt som intranett)
		- [ ] Skjul valg for klokkeslett
		- [ ] Elementklasse: `CoreTrek\Shared\Article\Element\StartDate\ArticleElementStartDate`
		- [ ] Språkstreng: `project.start_date`
			- [ ] Norsk: Oppstart
			- [ ] Engelsk: Started
	- [ ] Legge til artikkelelement:
		- [ ] Namn: **Forskningsområde**
		- [ ] Oppsett som på **Nyhet (toi.no)**
- [ ] Forskningsområder
	- [ ] Endre struktur på Forskningsområde → Prosjekt
		- [ ] Artiklar i staden for underkategoriar
		- [ ] Underkategori "Tidligere prosjekter"
	- [ ] Legge inn Prosjekt-kategori under alle forskningsområder
		- [ ] Hovedartikkel
		- [ ] Eksempel-artikkel
	- [ ] Endre "Lenker" på Forskningsområde-sida til å vere knappemeny for underkategoriar
	- [ ] Slette "Lenker"-kategori under Forskningsområde
	- [ ] Sidemalen: Endre "Prosjekter og forskningssentere"-brikke til å vere artikkelliste i staden for knappemeny
		- [ ] Design: Toppbilde uten marg
		- [ ] Ikkje underkategoriar
- [ ] Lage ny kategorimal **Artikkelliste**
	- [ ] Bruke denne på **Prosjekter** og **Tidligere prosjekter**
	- [ ] Hovedartikkel på **Prosjekter** lenkar til **Tidligere prosjekter** med knapp i WYSIWYG
	- [ ] Sette egendefinerte nettsideinnstillingar:
		- [ ] `template_id.144.body_css_class` → `ct-article-list bg-white`
- [ ] Lage ny kategorimal **Artikkelliste med filtrering**
	- [ ] Bruke denne på **Prosjekter og sentere**
	- [ ] Sette egendefinert nettsideinnstilling:
		- [ ] `template_id.145.body_css_class` → `ct-article-list bg-white`
- [ ] Aktivere filtrering for artikkeltype **Prosjekt (toi.no)**
- [ ] Kategori: **Prosjekter og sentere**
	- [ ] Hovedartikkel
	- [ ] Underkategori: **Tidligere prosjekter**
	- [ ] 