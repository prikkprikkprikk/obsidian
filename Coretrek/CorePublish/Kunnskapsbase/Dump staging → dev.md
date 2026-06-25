Bruke `ctdev`-scriptet til dumping av staging til dev (m.m.).

Eksempel frå IVAR – først dumpe databasen frå stage til dev:

```shell
$ ctdev

              a8888b.
             d888888b.
             8P"YP"Y88
             8|o||o|88
             8'    .88
             8`._.' Y8.
            d/      `8b.
           dP   .    Y8b.
          d8:'  "  `::88b
         d8"         'Y88b
        :8P    '      :888
         8a.   :     _a88P
       ._/"Yaa_:   .| 88P|
       \    YP"    `| 8P  `.
       /     \.___.d|    .'
       `--..__)8888P`._.'
                                  CTDEV

1. Create new CorePublish domain, and optionally:
   - Create database(s)
   - Install SiteComponents and import to Git
   - Prepare production and staging environment
2. Dump databases, and choose between:
   - Full database dump (all tables)
   - Smaller database dump (ignoring some tables)
3. (Deprecated)
4. Create empty database
5. (Deprecated)
6. Checkout project from Git
7. Prepare staging environment for old projects
8. Rsync mmstore
9. Release project
   
Your choice: 2
--- Dumping database ---

Specify locations to dump between:
1. Production to development
2. Production to staging
3. Staging to development
4. Development to staging
Your choice: 3

Please enter domain ID or domain name:
11257

Selected target domain is [ivar2025], DB-server [dev22.intra.coretrek.com]

Choose type of database dump
1. Full database dump (all tables)
2. Smaller database dump (ignoring some tables)
Your choice: 1

You are about to dump the database between these two locations:
From STAGING domain: ivar2025 (DB-server stage22.ctcustomer.com, DB-name cp_ivar2025)
To DEVELOPMENT domain: ivar2025 (DB-server dev22.intra.coretrek.com, DB-name cp_ivar2025)
No tables are ignored
Are you sure? (y/n) y

Now running database dump. Please wait.....
mysqldump: [Warning] Using a password on the command line interface can be insecure.
WARNING: --compress is deprecated and will be removed in a future version. Use --compression-algorithms instead.
mysql: [Warning] Using a password on the command line interface can be insecure.
WARNING: --compress is deprecated and will be removed in a future version. Use --compression-algorithms instead.
12.0MiB 0:00:26 [                                                                     <=>]
Database dump complete!
```

Deretter synk av mmstore:

```shell
$ ctdev

    CTDEV                     \./
                             (o o)
-------------------------oOOo-(_)-oOOo-------------------------

1. Create new CorePublish domain, and optionally:
   - Create database(s)
   - Install SiteComponents and import to Git
   - Prepare production and staging environment
2. Dump databases, and choose between:
   - Full database dump (all tables)
   - Smaller database dump (ignoring some tables)
3. (Deprecated)
4. Create empty database
5. (Deprecated)
6. Checkout project from Git
7. Prepare staging environment for old projects
8. Rsync mmstore
9. Release project

Your choice: 8
--- Rsync mmstore ---

Specify how to rsync mmstore:
1. Production to development
2. Production to staging
3. Staging to development
4. Development to staging
Your choice: 3

Please enter domain ID or domain name:
11257

Specify which staging server you want to fetch files from :
1. Other server (you will be prompted for server name)
2. stage22
3. stagecustom22
Your choice: 2

You are about to rsync mmstore files between these two locations:
From STAGING domain: ivar2025 (stage22.ctcustomer.com:/home/mmstore/ivar2025/)
To DEVELOPMENT domain: ivar2025 (dev22.intra.coretrek.com:/home/mmstore/ivar2025/)
Are you sure? (y/n) y

Checking if mmstore directory exist on the server stage22.ctcustomer.com...
The authenticity of host 'stage22.ctcustomer.com (80.239.119.9)' can't be established.
ED25519 key fingerprint is SHA256:G5+IlL8mCg//1Z+y2pAxyUsL32eeA9JRHi6nO5pYJ+k.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:4: [hashed name]
    ~/.ssh/known_hosts:7: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes

Checking if mmstore directory exist on the server dev22.intra.coretrek.com...

Rsyncing...(be patient)
receiving incremental file list
[...]

sent 304,998 bytes  received 30,041,209 bytes  3,570,142.00 bytes/sec
total size is 73,938,757  speedup is 2.44
```
