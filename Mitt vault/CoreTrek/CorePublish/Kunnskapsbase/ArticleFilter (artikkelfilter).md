
Eksempel fra ivar2025:

```php
$filter = new CtArticleFilter();  
$filter->addCategories($this->categories);  
$filter->setStatus(ARTICLESTATE_PUBLISHED);  
$filter->setContentTemplates([static::ARTICLE_TEMPLATE_ID]);  
$this->articles = $this->getCorePublish()->getArticles($filter);
```

