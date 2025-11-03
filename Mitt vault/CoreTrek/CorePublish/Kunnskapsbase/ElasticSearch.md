## Oppsett av Elasticsearch i CorePublish

Instruksjonar her: [https://intranet.coretrek.no/utviklere/webhotell/nytt-elasticsearch-cluster-for-corepublish-servere](https://intranet.coretrek.no/utviklere/webhotell/nytt-elasticsearch-cluster-for-corepublish-servere)

Husk at det må opprettast brukarnamn og passord i Elastic (av nokon på drift).

![[📎 Filer/image 23.png|image 23.png]]

  

Opprette cron task _'Process Search Queue' (ProcessQueueTask)_ i CPAdmin – står som ein av dei obligatoriske under **Crontasks → Create cron task**.

  

Køyre cron task manuelt – eksempel frå `sa-vprod01`:

```Shell
cd /home/jorn/src/corepublish/corepublish/cron
# Husk å bruke rett PHP-versjon
phpbrew use 8.2.8
php taskrunner.php sa-vprod01.intra.coretrek.com 10192 --run-crontask 2
```

  

  

  

  

  

  

## Dette var relevant ein gong, men ikkje lenger …?

Endre protokoll til HTTPS:

![[📎 Filer/image 1 10.png|image 1 10.png]]

## Task for søkeindeksering