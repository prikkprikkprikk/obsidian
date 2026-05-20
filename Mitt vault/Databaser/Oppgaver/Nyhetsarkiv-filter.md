---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---

[[Artikkelfilter – legge til egne nye]]

## Plan

- [x] Eige årsfilter
	- [x] `class ArticleFilterTypeYear extends CtArticleFilterTypeDate {`
- [x] Eiga filter-brikke
	- [x] Brikke-klasse
	- [x] Twig template
- [ ] Event listener ved lagring av nyheit
	- [ ] Sette Forskningsområde automatisk
	- [ ] Legge inn hjelpetekst om dette i artikkelelementet


## ToDo i prod

- [ ] Språkstrengar:
	- [ ] `articlefilter.select_year`
	- [ ] `articlefilter.show_all`
	- [ ] `articlefilter.year`
	- [ ] `articlefilter.reset`
- [ ] Artikkeltype: Nyhet (toi.no) 
	- [ ] → Filtrering:
		- [ ] År
		- [ ] Forskningsområde
		- [ ] Fritekstsøk
	- [ ] Opprette **Konfigurasjon 2** med kategori-ID-ar til "Annet/Other"
- [ ] Kategori: Nyhetsarkiv → Avansert → Innstillinger
	- [ ] `cssClass=news-archive`
- [ ] Kategorimal: Nyhetsarkiv
	- [ ] Ommøblere brikkene for filter og artikkelliste til nye placeholders
	- [ ] Filter-brikke skal ikkje skjule filteret på mobil
- [ ] Opprette kategori "Annet" under Forskningsområder, setje den til ikkje synlig i menyar og skjult fra søk.
- [ ] Opprette Nyhetsarkiv-kategoriar under kvart forskningsområde, sette til kun Nyhet og Artikkel
	- [ ] Opprette hovedartikkel for kvar av dei
	- [ ] Opprette test-nyheit for kvar av dei
- [ ] 


### FNI

#### Artikkeltype: Person
**Forskningsinteresser**

Klasse for listeverdier:
```
CoreTrek\Shared\Article\Element\SelectProvider\MultiRootCategorySelectProvider
```

Felter for egendefinert konfigurasjon: *Altså kategori med kategoriar som er namn på ulike forskningsinteresser*
Konfigurasjon 1: `{"1#no_NO":1001,"1#en_GB":1004}`

