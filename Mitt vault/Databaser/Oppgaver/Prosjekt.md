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

## ToDo i prod
- [ ] Endre namn på artikkeltype **Prosjekt** til **Prosjekt (intranett)**
- [ ] Lage ny artikkeltype **Prosjekt (toi.no)**
	- [ ] Legge til artikkelelement:
		- [ ] Namn: Oppstart
		- [ ] Type: Dato/tidspunkt
		- [ ] Programmatisk namn: `project_start_date` (likt som intranett)
		- [ ] Skjul valg for klokkeslett
	- [ ] 