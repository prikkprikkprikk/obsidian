---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---

[[Artikkelfilter – legge til egne nye]]

## Plan

- [x] Eige årsfilter
	- [x] `class ArticleFilterTypeYear extends CtArticleFilterTypeDate {`
- [ ] Eiga filter-brikke
	- [ ] Brikke-klasse
	- [ ] Twig template



## ToDo i prod

- [ ] Språkstrengar:
	- [ ] `articlefilter.select_year`
	- [ ] `articlefilter.show_all`
	- [ ] `articlefilter.year`
- [ ] Artikkeltype: Nyhet (toi.no) → Filtrering:
	- [ ] År
	- [ ] Forskningsområde
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

