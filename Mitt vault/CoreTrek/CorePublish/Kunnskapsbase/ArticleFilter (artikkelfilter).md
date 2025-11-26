
Eksempel frå ivar2025:

```php
$articleFilter = new CtArticleFilter();  
$articleFilter->addCategories($this->categories);  
$articleFilter->setStatus(ARTICLESTATE_PUBLISHED);  
$articleFilter->setContentTemplates([static::ARTICLE_TEMPLATE_ID]);  
$this->articles = $this->getCorePublish()->getArticles($articleFilter);
```

## Sort order

Sjå ArticleListTile for eksempel:
```php
public const SORT_ALPHABETIC = 'alphabetic';  
public const SORT_ALPHABETIC_STRING = 'header ASC';  
  
public const SORT_PUBLISHTIME = 'publishtime';  
public const SORT_PUBLISHTIME_STRING = 'pub_date DESC, pub_time DESC';  
  
public const SORT_PUBLISHTIME_PRIORITY = 'publishtime-with-priority';  
public const SORT_PUBLISHTIME_PRIORITY_STRING = 'priority DESC, pub_date DESC, pub_time DESC';
```
