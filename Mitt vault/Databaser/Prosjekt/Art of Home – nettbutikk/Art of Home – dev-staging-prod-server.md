---
Prosjekttype: Rieck.tech
---
## .env

### dev

```JavaScript
DB_NAME='artofhome'
DB_USER='root'
DB_PASSWORD=''

# Optionally, you can use a data source name (DSN)
# When using a DSN, you can remove the DB_NAME, DB_USER, DB_PASSWORD, and DB_HOST variables
# DATABASE_URL='mysql://database_user:database_password@database_host:database_port/database_name'

# Optional database variables
# DB_HOST='localhost'
# DB_PREFIX='wp_'

WP_ENV='development'
WP_HOME='https://aoh.test'
WP_SITEURL="${WP_HOME}/wp"

# Specify optional debug.log path
# WP_DEBUG_LOG='/path/to/debug.log'

# Generate your keys here: https://roots.io/salts.html
AUTH_KEY='La+3-Zt!:6KK;iK68E!NY*KRz[J{+|]\#_h1&[PRe-|}Ms|yZ)x3)rXz]DJrbjN>N'
SECURE_AUTH_KEY='fDJcVyjj968-WTZMnJv9V+3XRT?iz<[pzxFO.a7c.F)p8;J\#3ONGPJ]v(i-*]0$N'
LOGGED_IN_KEY='F41.H|BKHBk^o{mX{+>[]:/vfa8^7&q2!%@2?\#ft5ccBZ(&5*8@a/%fCRx14uc-l'
NONCE_KEY='eT<.FL>B8M9?[NlN5*GI!-;[9yJ@FQ<{CvoKO$,:GkZls%Qt--7}s?s7!3_<(J}R'
AUTH_SALT='Cg`5B(mnFSy[54^s(?a.nP1x_<Wf;z*4I9rN%;A6M=?wU`z)8AsND$c|1]G^bTcR'
SECURE_AUTH_SALT='%!M=,w|7ek^Dly{AcF{x;,R3K(K_g?H8fs3,:_kju0^UIb<M*%-)xL<cvGms)3]c'
LOGGED_IN_SALT='R.qD2UEwiQ$LaCv!YAy,Zc^SDnyL!Fq%mG|ec]a.xnXBG(=YEbuA={IxUt3RRiPO'
NONCE_SALT='1787ci;|b%>iejuA]=]9XR3)O..)DtJiq^PLMt_&Eyxi}_]P*$Q+::U):ZWt]q<f'

ACORN_ENABLE_EXPIRIMENTAL_ROUTER='True'
```

### staging

|   |   |
|---|---|
|**AOH Staging**||
|Internal URL|https://aohsta-21587.lukas-osl.servebolt.cloud|
|SFTP/SSH Server|lukas-osl.servebolt.cloud|
|SSH Port (standard)|22|
|SFTP Port|1022|
|SFTP/SSH Brukernavn|aohsta_21587|
|SFTP/SSH Passord|*8vXb&P4h!W2M|
|Web root|/kunder/digita_13281/aohsta_21587/public/|

|   |   |
|---|---|
|**Database:**||
|Server:|localhost|
|Databasenavn:|aohstaging|
|Brukernavn:|aohstaging|
|Passord:|dsxuj&c*QThD93GK|
|PHPMyAdmin:|[phpmyadmin.lukas-osl.servebolt.cloud](https://phpmyadmin.lukas-osl.servebolt.cloud/)|

### prod

```JavaScript
DB_NAME='artofhome'
DB_USER='artofhome'
DB_PASSWORD='Bd*m-jF4hPac69b'

# Optionally, you can use a data source name (DSN)
# When using a DSN, you can remove the DB_NAME, DB_USER, DB_PASSWORD, and DB_HOST variables
# DATABASE_URL='mysql://database_user:database_password@database_host:database_port/database_name'

# Optional database variables
# DB_HOST='localhost'
# DB_PREFIX='wp_'

WP_ENV='production'
WP_HOME='https://artofh-19525.lukas-osl.servebolt.cloud'
WP_SITEURL="${WP_HOME}/wp"

# Specify optional debug.log path
# WP_DEBUG_LOG='/path/to/debug.log'

# Generate your keys here: https://roots.io/salts.html
AUTH_KEY='La+3-Zt!:6KK;iK68E!NY*KRz[J{+|]\#_h1&[PRe-|}Ms|yZ)x3)rXz]DJrbjN>N'
SECURE_AUTH_KEY='fDJcVyjj968-WTZMnJv9V+3XRT?iz<[pzxFO.a7c.F)p8;J\#3ONGPJ]v(i-*]0$N'
LOGGED_IN_KEY='F41.H|BKHBk^o{mX{+>[]:/vfa8^7&q2!%@2?\#ft5ccBZ(&5*8@a/%fCRx14uc-l'
NONCE_KEY='eT<.FL>B8M9?[NlN5*GI!-;[9yJ@FQ<{CvoKO$,:GkZls%Qt--7}s?s7!3_<(J}R'
AUTH_SALT='Cg`5B(mnFSy[54^s(?a.nP1x_<Wf;z*4I9rN%;A6M=?wU`z)8AsND$c|1]G^bTcR'
SECURE_AUTH_SALT='%!M=,w|7ek^Dly{AcF{x;,R3K(K_g?H8fs3,:_kju0^UIb<M*%-)xL<cvGms)3]c'
LOGGED_IN_SALT='R.qD2UEwiQ$LaCv!YAy,Zc^SDnyL!Fq%mG|ec]a.xnXBG(=YEbuA={IxUt3RRiPO'
NONCE_SALT='1787ci;|b%>iejuA]=]9XR3)O..)DtJiq^PLMt_&Eyxi}_]P*$Q+::U):ZWt]q<f'

ACORN_ENABLE_EXPIRIMENTAL_ROUTER='True'
```

## Servebolt credentials

|   |   |
|---|---|
|**Art of Home**||
|Internal URL|https://artofh-19525.lukas-osl.servebolt.cloud|
|SFTP/SSH Server|lukas-osl.servebolt.cloud|
|SSH Port (standard)|22|
|SFTP Port|1022|
|SFTP/SSH Brukernavn|artofh_19525|
|SFTP/SSH Passord|z2xEc?m2-?MDS|
|Web root|/kunder/digita_13281/artofh_19525/public/|

|   |   |
|---|---|
|**Database:**||
|Server:|localhost|
|Databasenavn:|artofhome|
|Brukernavn:|artofhome|
|Passord:|Bd*m-jF4hPac69b|
|PHPMyAdmin:|[phpmyadmin.lukas-osl.servebolt.cloud](https://phpmyadmin.lukas-osl.servebolt.cloud/)|