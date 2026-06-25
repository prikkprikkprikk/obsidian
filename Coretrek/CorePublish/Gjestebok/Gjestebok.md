  

- [x] Lage eigen artikkeltype for gjestebokoppføring
- [x] Opprette nye gjestebokoppføringar frå innsendte skjema
    - [x] Lage lagringsmetode
    - [x] Programmatisk opprette gjestebokoppføring
        - [x] Lagre
            - [x] Strip tags!
- [x] Anna listevisning
- [ ] Opprette notifikasjon om ventande godkjenning?
    - [x] Har lagd varslingsabonnement i CP, og abonnert med system-brukaren – og det funkar.
    - [ ] Tilpasse meldinga (no står det berre «opprettet en ny artikkel»)
        - [ ] Create your own event notifications: [https://technet.coretrek.no/doc/latest/developer/modules/70-pwa.html#create-your-own-event-notifications](https://technet.coretrek.no/doc/latest/developer/modules/70-pwa.html#create-your-own-event-notifications)
        - [ ] [https://scm.coretrek.no/Konsulent/atbeta/-/blob/master/include/classes/Shared/Category/Event/TaskArticleEventListener.php](https://scm.coretrek.no/Konsulent/atbeta/-/blob/master/include/classes/Shared/Category/Event/TaskArticleEventListener.php)
- [x] Custom skjemavalidatorar
    - [x] Velge mellom personleg (postnummer) eller firma (org.nr.)
        - [x] Postummer: fire siffer 0–9
            - [x] Søke i api
                - [x] ==Ta eit steg tilbake og vurdere tilnærming til testing av API==
                    - [x] Javascriptet treng JSON, så data frå API-et burde vere JSON også.
                - [x] [https://webapi.no/api/v1/zipcode/2000](https://webapi.no/api/v1/zipcode/2000)
                - [x] [https://ws.geonorge.no/adresser/v1/#/default/get_sok](https://ws.geonorge.no/adresser/v1/#/default/get_sok)
        - [x] Org.nr.: ni siffer, med eller utan mellomrom
            - [x] Søke i BrReg-api
- [x] Legge poststad og/eller bedriftsnamn ut på gjestebokoppføringane

  

## Eksempel SiÅs

Prosjekt: sias

[https://www.sias.no/bolig/private-boliger/](https://www.sias.no/bolig/private-boliger/)

![[📎 Filer/image 21.png|image 21.png]]

[https://scm.coretrek.no/Konsulent/sias/-/blob/master/include/classes/custom/form/savehandler/HousingFormSaveHandlerArticle.php?ref_type=heads](https://scm.coretrek.no/Konsulent/sias/-/blob/master/include/classes/custom/form/savehandler/HousingFormSaveHandlerArticle.php?ref_type=heads)

  

  

## XMLHttpRequest

Sjekk SnapDrive for eksempel.

### **DifiHandler.php**

[https://scm.coretrek.no/Konsulent/snapdrive2018/-/blob/master/include/classes/custom/difi/service/DifiHandler.php?ref_type=heads](https://scm.coretrek.no/Konsulent/snapdrive2018/-/blob/master/include/classes/custom/difi/service/DifiHandler.php?ref_type=heads)

### **xmlhttprequestservicemap.config**

Når `CpXMLHttpRequest` er satt opp, lag

[https://scm.coretrek.no/Konsulent/snapdrive2018/-/blob/master/config/xmlhttprequestservicemap.config?ref_type=heads#L99](https://scm.coretrek.no/Konsulent/snapdrive2018/-/blob/master/config/xmlhttprequestservicemap.config?ref_type=heads#L99)