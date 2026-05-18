---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---

## Plan

- [ ] Eiga filter-brikke
- [ ] Eige årsfilter

### FNI

#### Artikkeltype: Person
**Forskningsinteresser**

Klasse for listeverdier:
```
CoreTrek\Shared\Article\Element\SelectProvider\MultiRootCategorySelectProvider
```

Felter for egendefinert konfigurasjon: *Altså kategori med kategoriar som er namn på ulike forskningsinteresser*
Konfigurasjon 1: `{"1#no_NO":1001,"1#en_GB":1004}`




### Innstilling


```php
<?php  
  
namespace CoreTrek\Shared\Article\Filter;  
  
use Articlelist;  
use CtArticleFilter;  
use CtArticleFilterElement;  
use CtArticleFilterItem;  
use CtArticleFilterTypeDate;  
  
requireClass('article.filter.type.CtArticleFilterTypeDate');  
requireClass('article.filter.api.CtArticleFilterElement');  
requireClass('article.filter.CtArticleFilterItem');  
requireClass('article.filter.api.CtArticleFilterType');  
requireClass('article.CtArticleFilter');  
  
/**  
 * Class FNICustomDateFilter * * This class implements a custom date filter for filtering articles based on * publication or activity dates. It extends the `CtArticleFilterTypeDate` * class to provide additional functionality specific to this custom filter. * The limit for fetching dates from articles is set to 3000 to accommodate larger datasets. */
   
class FNIArticleFilterTypeDate extends CtArticleFilterTypeDate {  
    /**  
     * Constructor     */    public function __construct() {  
        parent::__construct();  
    }  
  
    /**  
     * Must provide the numerid id of this filter.     *     * <p>  
     * The number provided here is used to store references to this filter type in the database.     * You need to make sure that it is unique within     * your project, and custom filters must have an id higher than 100 (see below).     * </p>  
     *     * <p>  
     * NOTE> Id's from 1 to 100 is reserved for cplib, so if you are implementing a custom filter, please pick a     * type id higher than 100.     * </p>  
     *     * @return integer  
     */  
    public function getFilterTypeId(): int {  
        return 301;  
    }  
  
    /**  
     * Must provide the name of this filter.     *     * <p>  
     * This method must return the name of the filter.     * The name will be visible in the backend GUI, in the selector where the user     * are selecting which filter type to apply to one element.     *     * @return string  
     *                </p>  
     */    public function getFilterTypeName(): string {  
        return 'Datofilter (limit 3000 artikler)';  
    }  
  
    /**  
     * Assembles filter items for select list.     *     * @param CtArticleFilterElement $element The element to find filter items for.  
     * @param integer $limit How many articles to limit by.  
     * @param string $sortByCount Whether to sort by the count number and return the items with highest count  
     *  (occurrence) first.  Default sorting is name.     * @param array $articleIdArray Array of articles to fetch the items from, instead of fetching them from all  
     *  articles in the database.     * @param string $doItemCount Whether to do a count and set an item count on each object returned (might be  
     *  slower database query).     * @return CtArticleFilterItem[]|null  
     */  
    protected function _getFilterItemsSelectMode(  
        CtArticleFilterElement $element,  
        $limit = null,  
        $sortByCount = false,  
        array $articleIdArray = null,  
        $doItemCount = true  
    ) {  
        // No articles, return placeholder filter item  
        if ($articleIdArray === null || !count($articleIdArray)) {  
            return [new CtArticleFilterItem('', getWord('articlefilter.period'), $element, 0)];  
        }  
  
        // Fetch article instances  
        $articleList = new Articlelist();  
        $filter = new CtArticleFilter();  
        $filter->setContentTemplates($element->getFilterTemplateID());  
        $filter->setLimit(3000);  
        $filter->articles($articleIdArray);  
        $articles = $articleList->getArticlesByCriterias($filter);  
  
        $useActivityDates = $this->getFilterConfigurationValue($element, 'activity_date') == 1;  
  
        $itemCount = 0;  
        $timePeriods = ($useActivityDates) ?  
            $this->_getActivityPeriodArray($articles, $itemCount) :  
            $this->_getPublishedPeriodArray($articles, $itemCount);  
  
        // Sort to get recent years first  
        rsort($timePeriods, SORT_STRING);  
  
        // Remove duplicates and get count per period  
        $timePeriods = array_count_values($timePeriods);  
  
        // Create filters, add default selection first  
        $timespanFilters = [new CtArticleFilterItem('', getWord('articlefilter.period'), $element, $itemCount)];  
        array_walk($timePeriods, function ($articleCount, $timePeriod) use (&$timespanFilters, &$element) {  
            $isYear = ct_substr($timePeriod, 4, 2) == '99';  
            $value = ($isYear) ? ct_substr($timePeriod, 0, 4) : $timePeriod;  
            $name = ($isYear) ?  
                ct_substr($timePeriod, 0, 4) :  
                $this->getCorePublish()->getDateFormatter()->getMonthName(ct_substr($timePeriod, 4, 2));  
            $timespanFilters[] = new CtArticleFilterItem($value, $name, $element, $articleCount);  
        });  
  
        return $timespanFilters;  
    }  
}
```
