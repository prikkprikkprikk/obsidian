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
- [x] Legge inn emner i Emner/Topics
- [x] Nyhet (toi.no)
	- [x] Legge til artikkelelement Emner/Topics
	- [ ] Endre artikkel-renderer og visningsmal for fullvisining (under **Avansert**)
- [x] Brikke: ToiTopicArticleListTile
	- [x] Kopi av ArticleListTile
	- [ ] Strippe bort ting som ikkje trengst
- [ ] Kategorimal: Emner
	- [x] Opprette kategorimal
	- [ ] ToiTopicArticleListTile med rette innstillingar
	- [ ] Endre Emner-kategori til å bruke denne



Overstyre \_prepareBuildArticleArray, la den vere tom.

Bruke `getArticlesByElementConditions` i \_buildArticleArray

