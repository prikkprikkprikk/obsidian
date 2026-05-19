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
- [ ] Artikkeltype: Nyhet (toi.no) → Filtrering:
	- [ ] År
	- [ ] Forskningsområde
	- [ ] Fritekstsøk
- [ ] Kategori: Nyhetsarkiv → Avansert → Innstillinger
	- [ ] `cssClass=news-archive`
- [ ] Kategorimal: Nyhetsarkiv
	- [ ] Ommøblere brikkene for filter og artikkelliste til nye placeholders
	- [ ] Filter-brikke skal ikkje skjule filteret på mobil


### FNI

#### Artikkeltype: Person
**Forskningsinteresser**

Klasse for listeverdier:
```
CoreTrek\Shared\Article\Element\SelectProvider\MultiRootCategorySelectProvider
```

Felter for egendefinert konfigurasjon: *Altså kategori med kategoriar som er namn på ulike forskningsinteresser*
Konfigurasjon 1: `{"1#no_NO":1001,"1#en_GB":1004}`

