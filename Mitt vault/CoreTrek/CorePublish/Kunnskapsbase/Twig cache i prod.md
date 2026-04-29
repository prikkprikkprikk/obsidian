I prod, dersom endringar i strukturmal, f.eks., ikkje funkar, kan det hjelpe å slette twig cache.

Eksempel frå TØI:

```
eirik@st-vtoi03:/var/cache/frontend/toi2025$ ll
total 28
drwxrwxrwx  7 www-data www-data    4096 Apr 29 13:34 ./
drwxrwxrwx  9 www-data corepublish 4096 Feb 25 12:42 ../
drwxrwxrwx  2 www-data www-data    4096 Apr 29 13:31 beta.toi.no/
drwxrwxrwx  6 www-data www-data    4096 Apr 29 13:53 https-beta.toi.no/
drwxrwxrwx  4 www-data www-data    4096 Apr 29 13:48 https-intranett.toi.no/
drwxrwxrwx  2 www-data www-data    4096 Apr 29 13:34 intranett.toi.no/
drwxrwxrwx 57 www-data www-data    4096 Apr 29 13:49 twig/
eirik@st-vtoi03:/var/cache/frontend/toi2025$ rm -rf twig/
```
