---
Kunde:
  - "[[Databaser/Kundar/Sirkula\\|Sirkula]]"
Prosjekttype: CoreTrek
✔️ Oppgåver:
  - "[[MNC-TZXHR-614 Får ikke SMS-varsel]]"
  - "[[QBP-FJFXF-696 Får bestilt bleieavtale på Min Side uten å velge eiendom]]"
  - "[[LTQ-DNBKW-330 Sirkula – Fjerne 370 liter glass- og metallbeholder]]"
Prosjektstatus: CtProd
---
## Gitlab

> [!info]  
>  
> [https://scm.coretrek.no/Konsulent/sirkula](https://scm.coretrek.no/Konsulent/sirkula)  

## Design

## Google Drive

## Moment

> [!info] Moment  
>  
> [https://app.moment.team/coretrek/projects/entries/0006445](https://app.moment.team/coretrek/projects/entries/0006445)  

  

p-nr: 14047537631

## Composer

### mosquitto?

```Shell
composer install --ignore-platform-req=ext-mosquitto-php
```

## config-symlink

- [ ] Symlinke den kundespesifikke config-fila inn i `/usr/local/cpinstall/activeversion/config:`

```Shell
cd /usr/local/cpinstall/config
ln -s /home/jorn/public_html/devel/[prosjektnavn]/config/[prosjektnavn].config.php [prosjektnavn].config.php
```

## Oppgåver
![[Oppgåver (dette prosjektet).base]]  

## Sirkula-prosjektet

Hedmark-regionen

Kenneth og Morten i fjor

1,8 mill

Masse integrasjoner

Hostet sammen med flere andre nettsider for div. kommuner pluss hias.no

De hoster selv via Indigo IKT, som er driftsansvarlige

Server låst, ligger bak Citrix

### Innlogging i prod

Kommer bare inn på prod via dev22/devcustom22.

Har lagt inn i ssh-config:
```shell
ssh dc22
[deretter]
ssh prod
```
#### Manuell innlogging
```Shell
ssh f-yd-web20
```

Se pw id: 5255

### ctrelease til prod

ctrelease-scriptet spør om brukarnamn på host [82.147.38.119] – det er `corepublish`.

### Loggfiler

Loggfiler frontend: `/var/log/frontend/sirkula`
Loggfiler backend: `/var/log/corepublish/sirkula-corepublish.log`
  
Eyvind er KAM

## Skjemaer

NB: Skjemaer som starter med x må man være forsiktige med, de har programmert spesiell logikk mot andre ting