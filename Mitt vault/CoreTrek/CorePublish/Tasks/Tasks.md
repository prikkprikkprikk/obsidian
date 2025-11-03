[[Tasks howto]]

  

## ToDo

- [x] Se på yield ift artikkelimport (én og én) og minnebruk
- [ ] Importere author til CP-bruker, og koble som forfatter på importert artikkel
    - [ ] Brukergruppe: 9
        - [ ] Innstilling: users.authorUserGroup
- [ ] lage en brikke som viser forfatterinfo på artikkel fullvisning

  

- [x] Last inn arguments
    - [x] Klasse for behandling av argumenter
    - [x] FetchArticleTaskArguments
        - [x] constructor må få $taskDescriptor som argument – knyttar arguments til task
        - [x] validateArguments() – sjekk at alle påkrevde argument er med, fjerne ubrukte
            - [ ] Korleis definere kva som er påkrevd?  
                Og kan dette lagast fleksibelt nok til å brukast på andre prosjekt?  
                Ja, men helst bruke tida på CP-relatert læring?
- [x] Hent neste artikkel frå DummyApi, lagre i eigen kategori.
    - [x] Lagre neste ID-nummer i task arguments.
        - [x] TaskDescriptor – sjekk Elko:  
            [https://scm.coretrek.no/Konsulent/elko2023/-/blob/master/include/classes/Shared/Task/TaskArguments.php#L110](https://scm.coretrek.no/Konsulent/elko2023/-/blob/master/include/classes/Shared/Task/TaskArguments.php#L110)
    - [x] Viss ingen fleire, gjer ingenting.
- [x] Hent bilde frå Lorem Picsum, lagre i arkivet og bruk som hoved- og miniatyrbilde.
    
    - [x] Hente info frå API
    - [x] Lagre i /tmp
    - [x] Legge inn i multimedia-arkivet slik som vist i **File uploads and image elements**:  
        [https://technet.coretrek.no/doc/latest/developer/features/06-articleimport.html#file-uploads-and-image-elements](https://technet.coretrek.no/doc/latest/developer/features/06-articleimport.html#file-uploads-and-image-elements)
    - [x] Knytte bildet til artikkelen som thumbnail vha. $artikkel->setThumbMmFile():
    
    ```PHP
        /**
         * Sets a multimedia file to use as article thumbnail.
         *
         * @param MultimediaFile $multimediaFile The file to set.
         * @return void
         */
        public function setThumbMmFile(MultimediaFile $multimediaFile) {
            $this->setThumbFileName('__CPMMFILEID_URL__::' . $multimediaFile->getFileId() . '::');
        }
    ```
    
    - [x] Sette `mainimage` til samme bilde – med `$article->getElement(’mainimage’)`:
    
    ```PHP
        /**
         * Provides an article element from this article.
         *
         * @param string $name The (programmatic) name of the element.
         * @return Articledata|null
         * @since 7.2.0
         */
        public function getElement(string $name): ?Articledata {
    
            $elements = $this->getElements(null, true);
    
            if (isset($elements[$name])) {
                return $elements[$name];
            }
    
            return null;
        }
    ```
    
    Eksempel frå Eirik:
    
    ```PHP
    $db = CorePublish::getInstance()->getDomainDatabase();
    $articleManager = \CorePublish::getInstance()->getArticleManager();
    $article = $articleManager->createArticleSimple();
    $article->setHeader('My article');
    
    $element = $article->getElement('text');
    if (!$element instanceof TextLine) {
        throw new CtConfigurationErrorException('Invalid element: text');
    }
    $element->setText('This is a line of text');
    $element->commitChanges($db);
    
    $element = $article->getElement('image');
    if (!$element instanceof Image) {
        throw new CtConfigurationErrorException('Invalid element: image');
    }
    $element->setMultimediaFileId(123);
    $element->commitChanges($db);
    
    $articleManager->articleContentChanged($db, $article);
    ```
    

## Merknader

  

  

  

Får ikkje til å mocke TaskDescriptor, testkoden finn ikkje klassen.

  

  

  

## Crontask

Crontask ID: 3

Arguments:

- [ ] “articleCategory”: 905
    - [ ] Kategori for artiklar frå DummyApi
- [ ] “mediaFolder”: 46
    - [ ] Folder for bilder frå Lorem Picsum
- [ ] “batchSize”: 1
    - [ ] Talet på artiklar å importere
- [ ] “nextArticleId”: 0
    - [ ] Artikkelen som skal hentast neste gong tasken køyrer.

  

  

  

```Shell
cd /usr/local/cpinstall/activeversion/corepublish/cron/
php taskrunner.php # vis argumenter osv.
php taskrunner.php dev22.intra.coretrek.com 10240 --run-crontask 3
```

  

## Artikkel

- [x] Hente artikkel frå f.eks. [https://dummyapi.online/](https://dummyapi.online/)
    - [x] [https://dummyapi.online/api/blogposts](https://dummyapi.online/api/blogposts)

  

## Bilde-DTO

Hente bilder frå Lorem Picsum, f.eks. med ID lik ID-en til artikkelen på dummyapi, eller kanskje med ein offset, for variasjon?

Maks-ID: 1084

Metadata: [https://picsum.photos/id/123/info](https://picsum.photos/id/123/info)

```JSON
{
	"id":"123",
	"author":"Mark Doda",
	"width":4928,
	"height":3264,
	"url":"https://unsplash.com/photos/tS9hJOnmKK8",
	"download_url":"https://picsum.photos/id/123/4928/3264"
}
```

  

### Bildeimport

Lage eigen bildeimporteringsklasse som tar ein PicsumPictureDto som argument.

Bildenedlasting i format 1920 × 1080: [https://picsum.photos/id/123/1920/1080.webp](https://picsum.photos/id/123/1920/1080.webp)

Lagre til tmp: `/tmp/jorn2024_picsum_123.webp`

  

  

## Actions

- [ ] FetchDummyArticle