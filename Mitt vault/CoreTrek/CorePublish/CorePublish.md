## Læring

[[Gjestebok]]

[[Tasks]]

[[SiteComponents og CorePublish-utvikling]]

  

#### Kunnskapsbase

|![](https://www.notion.so/icons/font_gray.svg)Name|![](https://www.notion.so/icons/list_gray.svg)Tags|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Kategori|
|---|---|---|
|[[XDebug i PHPStorm]]|||
|[[Oppgradere CorePublish lokalt]]|||
|[[CoreTrek/CorePublish/Kunnskapsbase/Docker\|Docker]]|||
|[[Automatisk FTP til dev]]||PhpStorm|
|[[ElasticSearch]]|||
|[[Første release til staging]]||Release|
|[[Direkteredigering]]|||
|[[Cache-lokasjoner]]|||
|[[Translations]]|||
|[[Oppsett av nytt prosjekt]]||Oppsett|
|[[SVG og ikoner]]|||
|[[Skjemaer]]|||
|[[Oppdatere databasen til ny versjon]]|||
|[[Oversettelse i Javascript (setWord-getWord)]]|||
|[[squizlabs-codesniffer]]|||
|[[Database-ting]]|||
|[[SSH proxying when VPN is down]]|||
|[[SiteComponents- Gjøre endringer i master-databasen]]|||
|[[Demo deploy + egen, ren kopi]]|||
|[[Hente egendefinerte innstillinger- getConfigValue]]|||
|[[Find-get article by external ID]]|||
|[[Deployment]]||Release|
|[[CPAdmin staging]]|||
|[[Loggfil-lokalisjonar]]||Logging|
|[[Oppsett av CoreAI-widget]]|||
|[[Kategoriar]]|||
|[[Mail catcher]]|||
|[[Kundeconfig symlink]]|||

  
  

  

## Dokumentasjon

> [!info] https://technet.coretrek.no/doc/latest/developer  
>  
> [https://technet.coretrek.no/doc/latest/developer](https://technet.coretrek.no/doc/latest/developer)  

## Dummy JSON

> [!info] DummyJSON - Fake REST API of JSON data for development  
> DummyJSON provides a fake REST API of JSON data for development, testing, and prototyping.  
> [https://dummyjson.com/](https://dummyjson.com/)  

  

[[Produktinnspill - FogBugz]]

  

  

Gitlab taklar ikkje custom namn på nøkkel ved `git clone git@scm.coretrek.no:Konsulent/prosjekt`, men må ha standardnamn som f.eks. `id_rsa`.

  

## Testing

Oppsett av PHPStorm så det køyrer testane på dev:

![[📎 Filer/image 6.png|image 6.png]]

  

## Passord

[https://pw.intra.coretrek.com/](https://pw.intra.coretrek.com/)

  

### CPAdmin dev22

[https://corepublish.dev22.intra.coretrek.com/admin](https://corepublish.dev22.intra.coretrek.com/admin)

  

## Logging

```Bash
$msg = '';
CorePublish::getInstance()->getLog()->error(__FILE__, __LINE__, $msg);
```

### CP

```Bash
tail -f /var/log/corepublish/jorn2024-corepublish.log
```

### Frontend

```Bash
tail -f /home/jorn/public_html/devel/logs/all.log
```

I prod er frontend-loggen i `/var/log/frontend/jorn2024/all.log`.

  

  

  

## Språkstrenger til Javascript

```HTML
<script nonce="{{ corepublish.systemConfig.ContentSecurityNonce }}">
    ctRunWhenCplibLoaded(function () {
        setWord('form.validator.invalidPostalCode', '{{ site.getWord('form.validator.invalidPostalCode') }}');
        setWord('form.validator.invalidOrganizationNumber', '{{ site.getWord('form.validator.invalidOrganizationNumber') }}');
    });
</script>
```

  

  

## CorePublish releases

`ssh corepublish`

Bruk LDAP-passord

Ligg release f.eks. slik for 9.0.32:

`/home/data/corepublish-packages/9.0.32/CorePublish-9.0.32.zip`

Kan scp for å laste ned