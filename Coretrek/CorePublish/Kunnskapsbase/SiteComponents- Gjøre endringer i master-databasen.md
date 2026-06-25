For å gjøre endringer i master-databasen må man logge inn i CorePublish som brukeren `sitecomponents`.

For at man skal kunne sjekke at ting virker som det skal i frontend med sin egen bruker i URL-en (f.eks. `https://webapp.sitecomponents.jorn.cp81.intra.coretrek.com/`) er det noen ting man på sørge for:

- Først må man passe på at man er på riktig branch i din lokale kode på serveren (`sa-vprod01`).
- Så må det settes riktig domeneID i `include-config.php` slik riktig kunde bootes opp: `sitecomponents` (domeneID `316`) i stedet for din egen kundebruker.
    - I mitt tilfelle `jorn` (domeneID `10192`)).
- Deretter må man endre to ting i databasen:
    - Sørge for at nettstedet faktisk er satt opp til å laste koden fra ditt område (server-innstillinger), altså «sti til prosjektfiler».
        - NB: Dette bør gjøres på begge nettsteder, altså både SiteComponents og Webapp, fordi systemet noen ganger prøver å hente ting fra det andre nettstedet hvis det finnes. (F.eks. “tile edit templates” for redigering av brikker i kategorimaler.)
    - Sørge for at nettstedet svarer på url-en din (dvs. legge inn `jorn.cp81.…`) og bruker den når den lager linker.

Da skal [http://webapp.sitecomponents.jorn.cp81.intra.coretrek.com/](http://webapp.sitecomponents.jorn.cp81.intra.coretrek.com/) både boote opp sitecomponents-kunden/databasen (riktig domeneID i include-config) og laste riktig kode (sti til prosjektfiler) og gi riktig url til lenker (hovedurl)

Dette betyr også at det bare er èn utvikler om gangen som kan sjekke at ting virker.

## Mediafiler

Mediefilene som følger med en fersk SiteComponents-installasjon ligger i mappa `sitecomponents/install/mmstore`.

Hvis du skal legge inn nye bilder:

- Først peker du mot install/mmstore mappa nederst i `include-config.php`:
    
    ```Shell
    CorePublish::getInstance()->getSystemConfig()
        ->setMmarchiveLocationPath(
            realpath(__DIR__.'/../../sitecomponents/install/mmstore/')
        );
    ```
    
- Så må man endre stien til multimediearkivet i cp-admin
    - Husk å logge ut og inn igjen – denne filstien blir lagret i session.
- Deretter laster du opp filer
- Så må du commit-e disse filene.
    - Det vil kreve at du tar bort denne mappa fra .gitignore hvor vi vanligvis har den for å unngå at folk commit-er filer feilaktig.
- Deretter legge mappa tilbake i .gitignore …
- … og kommentere bort setMmarchiveLocationPath() fra første steg igjen.