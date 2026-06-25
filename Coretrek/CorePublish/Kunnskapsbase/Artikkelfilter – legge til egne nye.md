[Eksempel frå ivar2025](https://scm.coretrek.no/Konsulent/ivar2025/-/merge_requests/37/diffs)

include/classes/Ivar/Article/Filter/ArticleFilterTypeAutoValuesSorted.php
```php
<?php

declare(strict_types=1);

namespace CoreTrek\Ivar\Article\Filter;

use CtArticleFilterElement;
use CtArticleFilterItem;
use CtArticleFilterTypeAutoValues;

/**
 * Represents a filter type for automatically displaying all values from articles in a sorted manner.
 * Extends the base functionality of CtArticleFilterTypeAutoValues to provide sorting capabilities.
 */
class ArticleFilterTypeAutoValuesSorted extends CtArticleFilterTypeAutoValues {

    /**
     * Retrieves the identifier for the filter type.
     *
     * @return integer The identifier for the filter type.
     */
    public function getFilterTypeId(): int {
        return 100;
    }

    /**
     * Provides the name of this filter.
     *
     * @return string
     */
    public function getFilterTypeName(): string {
        return 'Automatisk vis alle verdier fra alle artikler (sortert)';
    }

    /**
     * This method is responsible for rendering this element on frontend.
     *
     * @param CtArticleFilterElement $element The element to render.
     * @param CtArticleFilterItem[] $filterItems The filter items to show (not valid for all elements, e.g. freetext
     *  search does not need it).
     * @param boolean $showItemCount Whether to display an item count behind elements where this is applicable
     * (e.g. show how many items there are behind each checkbox).
     */
    public function render(CtArticleFilterElement $element, array $filterItems = null, $showItemCount = false): void {
        usort($filterItems, function ($a, $b) {
            return $a->getName() <=> $b->getName();
        });
        parent::render($element, $filterItems, $showItemCount);
    }
}
```

Filteret må også leggast til i config-filene – både config/include-config.php og config/[prosjektnamn].config.php:
```php
// == ARTICLE ELEMENT FILTERS ==  
requireClass('article.filter.CtArticleFilterManager');  
use CoreTrek\Ivar\Article\Filter\ArticleFilterTypeAutoValuesSorted;  
  
$manager = CtArticleFilterManager::getInstance();  
$manager->addFilterType(new ArticleFilterTypeAutoValuesSorted());
```

