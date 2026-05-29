---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---
Bruke `MultiRootCategorySelectProvider` 

## ToDo i prod

- [x] Nettsideinnstilling: `topics.category` – Emner-kategorien
	- [x] For begge språk
- [x] Språkstrenger
	- [x] `topics`
	- [x] `topics.no_articles`
	- [x] `topics.not_found`
	- [x] `topics.other`
- [ ] Legge inn emner i Emner/Topics
- [ ] Nyhet (toi.no)
	- [ ] Legge til artikkelelement Emner/Topics
- [ ] Brikke: ToiTopicArticleListTile
	- [ ] Kopi av ArticleListTile
	- [ ] Strippe bort ting som ikkje trengst
- [ ] Kategorimal: Emner
	- [x] Opprette kategorimal
	- [ ] ToiTopicArticleListTile med rette innstillingar



Overstyre \_prepareBuildArticleArray, la den vere tom.

Bruke `getArticlesByElementConditions` i \_buildArticleArray

