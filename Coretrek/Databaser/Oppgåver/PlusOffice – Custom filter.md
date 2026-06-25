---
Prosjekt:
  - "[[PlusOffice]]"
---
[https://scm.coretrek.no/Konsulent/fo2018/-/blob/master/config/fo2018.config?ref_type=heads#L33](https://scm.coretrek.no/Konsulent/fo2018/-/blob/master/config/fo2018.config?ref_type=heads#L33)

```PHP
// Add support for dropdown filters
requireClass('article.filter.CtArticleFilterManager');
requireClass('site:custom.article.filter.type.ArticleFilterTypeAutoValuesWithDropdown');
requireClass('site:custom.article.filter.type.ArticleFilterTypeTimeSpan');

CtArticleFilterManager::getInstance()->addFilterType(new ArticleFilterTypeAutoValuesWithDropdown, true);
CtArticleFilterManager::getInstance()->addFilterType(new ArticleFilterTypeTimeSpan);
```

  

![[📎 Filer/image 31.png|image 31.png]]