---
Date Created: 2024-11-18T09:47
Hast: Hastar
Innboks: false
Prosjekt:
  - "[[PlusOffice]]"
Status: I arbeid
---
## Oppsummering / framdriftsplan

Mulighet for å inkludere `pub_date` i artikkelfilter kommer i v9.0.33.

Når det er på plass, kan man søke i filteret etter datoer.

Da kan man også bruke `SELECT DISTINCT EXTRACT(YEAR FROM pub_date) as year` etc. for å hente ut år og måneder.

**Men OBS:** Man kan ikke bruke alias i `WHERE`-setninger.

  

Så:

- I filteret får man inn en liste med ID-er til alle artikler man skal søke i.
- Ut fra denne lista kjøres en spørring mot `t_wps_article_info` for å finne år+måneder hvor noe er publisert, og hvor mange artikler det er i hver måned.
- Dette SQL-resultatet brukes til å lage to select-elementer: år og måneder, som også viser antall artikler i parentes.
    
    ![[📎 Filer/image 8.png|image 8.png]]
    
- Når man velger et år, settes filtersøket til pub_date fra ÅÅÅÅ-01-01 til ÅÅÅÅ-12-31.  
    Velger man en måned også, settes filtersøket til pub_date fra ÅÅÅÅ-MM-01 til ÅÅÅÅ-MM-DD hvor DD er maksdato for måneden. Maksdato for måneden kan man finne med date()-funksjonen ved å bruke format “t”, slik:
    
    `$lastDayOfMonth = date('t', strtotime("{$year}-{$month}-01"));`
    
- ==Så er spørsmålet hvordan man på riktig måte sender inn dette filtersøket til CP …==

  

  

  

![[📎 Filer/image 1 2.png|image 1 2.png]]

  

  

**Arve skriver i Slack:**  
Skal du ha noe i databasen så er det ikke et virtuelt filter du skal lage. Da er det et vanlig filter. Virtuelt er for de casene hvor du IKKE lager en database-kolonne, men gjør det "i php" etterpå.

Men hvordan få det nye filteret til å dukke opp under “Artikkelfelter” her?

![[📎 Filer/image 2 3.png|image 2 3.png]]

(Artikkeltypeelementer er de ekstra elementene som er lagt til i artikkeltypen, mens Artikkelfelter er standard/obligatoriske felter som alle artikler har, som tittel, ingress, dato etc.)

Dan André har brukt virtuelt filter, og søker fram artikler og jobber mot disse i PHP. Dette blir inkludert i plusoffice2024.config.php og include-config.php:

```PHP
    use CoreTrek\PlusOffice\Article\Filter\ArticleFilterTypeTimeSpan;

    requireClass("article.filter.CtArticleFilterManager");

    CtArticleFilterManager::getInstance()->addFilterType(new ArticleFilterTypeTimeSpan);
```

**Arve skriver:**

Altså hvis du ser på CtArticleFilterElementArticleField, så er jo det en filter-klasse som har som formål å hente ut felter fra artikkelen og lagre som filter-verdier.

Den støtter jo ut av boksen alt som returneres i Article.getArticleFieldsForFilterTable().

Så jeg vil tro at du kan extende denne, og så override getFilterArticleValue() til å returnere årstall-måned delen av Article.getPubDate() ..og evt endre filterkey etc til noe annet.

**Jørn:**

Ja, men om eg extendar CtArticleFilterElementArticleField, så går ikkje det an å putte inn i addFilterType … fordi CtArticleFilterElementArticleField ikkje er ein CtArticleFilterType

og om eg prøvar å implementere CtArticleFilterType, så kræsjar to versjonar av getFilterItems …

**Arve:**

Ah, sorry. Jeg som ikke husker mitt eget API her

  

## Research

`corepublish/modules/template/template_edit_tab_filter.php` linje 331:

```PHP
    // Create options for article fields
    $articleFields = array_keys($template->getArticleFieldsForFilterTable());
```

  

`/Users/prikkprikkprikk/coretrek/CorePublish-9.0.32/cplib/Template.php` linje 1483:

```PHP
    /**
     * Returns the fields to use in the filter table
     *
     * <p>
     * The return format is an array, array keys are the field names, array values is the method on the article object
     * used to get the field value
     * <br>
     * You can use addArticleFieldForFilterTable() to add your own fields
     * </p>
     *
     * @see addArticleFieldForFilterTable()
     * @return array
     */
    public function getArticleFieldsForFilterTable() {

        if ($this->_articleFieldsForFilterTable === null) {
            $this->_articleFieldsForFilterTable = array();

            $possibleFields = array('header' => 'getHeader',
                    'ingress' => 'getIngress',
                    'keyword' => 'getKeywords',
                    'subject' => 'getSubject',
                    'header2' => 'getHeader2',
                    'ingress2' => 'getIngress2',
                    'workingheader' => 'getWorkingHeader',
                    'readmoretext'  => 'getReadMoreText' ,
                    'tags' => 'getTagsForFilter',
                    'externalID' => 'getExternalID'
            );

            foreach ($possibleFields as $fieldname => $method) {
                if ($this->isFieldVisible($fieldname)) {
                    $this->_articleFieldsForFilterTable[$fieldname] = $method;
                }
            }
        }

        return $this->_articleFieldsForFilterTable;
    }
```

Linje 1523:

```PHP
    /**
     * Adds a new article field to index , and the method on the article object to fetch it
     *
     * <p>
     * Example: $template->addArticleFieldForFilterTable('mypublishdate', 'getPubDate' );
     * </p>
     *
     * @param string $fieldname The field name to add.
     * @param string $methodName The method name.
     */
    public function addArticleFieldForFilterTable($fieldname, $methodName) {
        $this->getArticleFieldsForFilterTable(); // ensures that default fields are populated
        $this->_articleFieldsForFilterTable[$fieldname] = $methodName;
    }
```

… og der står det jo til og med pubDate som eksempel.