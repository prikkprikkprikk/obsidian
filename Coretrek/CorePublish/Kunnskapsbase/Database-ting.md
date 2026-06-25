## Dump av master-databasen (sc_master)

```Shell
ssh corepublish
cd dumps
mysqldump --add-drop-database -u sitecomponents -p sc_master > sc_master_ÅÅÅÅ-MM-DD.sql
```

## Import av master-databasen

Eksempel:

```Shell
mysql -u jorn -p sc_jorn < sc_master_2025-02-06.sql
```

Passord til `sc_jorn` ligg i Bitwarden.

Etter import av master-databasen i eigen installasjon, må ein endre sti til prosjektfiler, Hoved-URL og sti til loggfiler i server-oppsettet:

![[📎 Filer/image 27.png|image 27.png]]

## Finne brukarnamn og passord

- Brukarnamn og passord til ulike databaser ligg i systemdatabasen.
- Brukernavn og passord til systemdatabasen finner du i corepublish.config
    
    ```HTML
    // Switch system database based in which branch we are in.
    if ($gitBranchName === 'CP_9_0-STABLE') {
        $__CPCONFIG['sysdb']['host']        = 'localhost';
        $__CPCONFIG['sysdb']['name']        = 'cp_9_0_stable';
        $__CPCONFIG['sysdb']['type']        = 'mysql5';
        $__CPCONFIG['sysdb']['username']    = '[redacted]';
        $__CPCONFIG['sysdb']['password']    = '[redacted]';
    } else {
        $__CPCONFIG['sysdb']['host'] = 'localhost';
        $__CPCONFIG['sysdb']['name'] = 'cphead';
        $__CPCONFIG['sysdb']['type'] = 'mysql5';
        $__CPCONFIG['sysdb']['username'] = '[redacted]';
        $__CPCONFIG['sysdb']['password'] = '[redacted]';
    }
    ```
    
- Logge inn i mysql:
    
    ```Shell
    mysql -u [redacted] -p
    ```
    
- Sjekke i tabellen t_domain:
    
    ```SQL
    use cphead;
    select db_username, db_password from t_domain where db_username="sitecomponents";
    ```
    
    ```Shell
    +----------------+----------------+
    | db_username    | db_password    |
    +----------------+----------------+
    | sitecomponents | [redacted]     |
    +----------------+----------------+
    ```
    

## Manuell dumping av databasen

Eksempel på dump av `sc_jorn`:

```HTML
mysqldump -u jorn -p sc_jorn > sc_jorn_2025-01-23.sql
```

## Marius sitt script

[https://github.com/MariusTBjercke/db-dump](https://github.com/MariusTBjercke/db-dump)

![[📎 Filer/image 1 11.png|image 1 11.png]]