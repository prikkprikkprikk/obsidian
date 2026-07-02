
https://corepublish.jorn.devcp83.intra.coretrek.com/

## Server dashboard

Ulike PHP-versjonar:
https://devcp83.intra.coretrek.com/
https://devcp84.intra.coretrek.com/
https://devcp85.intra.coretrek.com/


[sa-vprod02.intra.coretrek.com](https://sa-vprod02.intra.coretrek.com/)


## Oppsett for å få CKEditor 5 / WYSIWYG til å fungere

Sidan wildcard SSL-sertifikat ikkje støttar meir enn eitt subdomene-nivå, kan ein ikkje bruke f.eks.:

https://sitecomponents.jorn.devcp83.intra.coretrek.com/

Apache har ein feature der ein kan symlinke underscore i `~/public_html/devel` til rot-domenet sitt, f.eks.:

```shell
ln -s /home/jorn/src/corepublish/sitecomponents/ _
```

### CorePublish server-oppsett

Under **CorePublish → Nettsteder → {sitecomponents_fullname} → Servere → # sa-vprod02.intra.coretrek.com**:

Sti til prosjektfiler: 

Då vil `/home/jorn/src/corepublish/sitecomponents/html` bli servert når ein går til:

https://jorn.devcp83.intra.coretrek.com/

### Corepublish-URL

Deretter må ein endre URL-en til Corepublish for at den også skal bli servert utan subdomene.

```
cd /home/jorn/src/corepublish/sitecomponents/html

ln -s /home/jorn/src/corepublish/corepublish/html corepublish
```

Og så endre i `corepublish.config.php`:

```php
// htmlroot points to the URL CorePublish is available at.  
$__CPCONFIG['htmlroot'] = 'https://jorn.devcp83.intra.coretrek.com/corepublish/';
```

Husk å ikkje ha symlink til corepublish i `~/public/html`:

```
jorn@sa-vprod02:~/public_html/devel$ ll
total 12
drwxrwxr-x 3 jorn jorn 4096 Jul  2 10:34 ./
drwxrwxr-x 3 jorn jorn 4096 Jun 26 09:55 ../
lrwxrwxrwx 1 jorn jorn   41 Jul  2 10:22 _ -> /home/jorn/src/corepublish/sitecomponents/
lrwxrwxrwx 1 jorn jorn   44 Jun 26 09:56 cpadmin -> /home/jorn/src/corepublish/corepublish/admin/
drwxrwxrwx 2 jorn jorn 4096 Jul  1 08:57 logs/
```

