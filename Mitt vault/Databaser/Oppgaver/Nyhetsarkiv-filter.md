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
- [x] Event listener ved lagring av nyheit
	- [x] Sette Forskningsområde automatisk
	- [x] Legge inn hjelpetekst om dette i artikkelelementet


## ToDo i prod

- [x] Språkstrengar:
	- [x] `articlefilter.select_year`
	- [x] `articlefilter.show_all`
	- [x] `articlefilter.year`
	- [x] `articlefilter.reset`
- [x] Opprette kategori "Annet" under Forskningsområder, setje den til ikkje synlig i menyar og skjult fra søk.
- [x] Artikkeltype: Nyhet (toi.no) 
	- [x] → Filtrering:
		- [x] År
		- [x] Forskningsområde
		- [x] Fritekstsøk
	- [x] Opprette **Konfigurasjon 2** med kategori-ID-ar til "Annet/Other"
	- [x] Malelement: Forskningsområde
		- [x] Legge inn klasse `CoreTrek\Shared\Article\Element\SelectProvider\MultiRootCategorySelectProvider`
	- [x] Lagre alle nyheiter på nytt, sjekke at Forskningsområde blir satt riktig
- [x] Kategori: Nyhetsarkiv → Avansert → Innstillinger
	- [x] `cssClass=news-archive`
	- [x] (også engelsk!)
- [x] Brikke: Artikkelfilter (toi.no)
- [x] Kategorimal: Nyhetsarkiv
	- [x] Ommøblere brikkene for filter og artikkelliste til nye placeholders
	- [x] Filter-brikke skal ikkje skjule filteret på mobil
- [x] Opprette Nyhetsarkiv-kategoriar under kvart forskningsområde, sette til kun Nyhet og Artikkel
	- [x] Opprette hovedartikkel for kvar av dei
	- [x] Opprette test-nyheit for kvar av dei
		- [x] Lagre på nytt etter at Forskningsområde-malelementet er korrigert


### FNI

#### Artikkeltype: Person
**Forskningsinteresser**

Klasse for listeverdier:
```
CoreTrek\Shared\Article\Element\SelectProvider\MultiRootCategorySelectProvider
```

Felter for egendefinert konfigurasjon: *Altså kategori med kategoriar som er namn på ulike forskningsinteresser*
Konfigurasjon 1: `{"1#no_NO":1001,"1#en_GB":1004}`

