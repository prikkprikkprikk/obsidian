## bash

```Shell
docker-compose exec webserver bash
```

## XDebug

Starte xdbug:

```Shell
npm run docker:xdebug:on
```

## dbdump

"docker:dump:dev": "docker run -ti --rm -v ~/.ssh:/opt/ssh:ro -v $(pwd)/docker/dump:/data/dbdump/ [scm.coretrek.no:5050/konsulent/docker/dbdump](http://scm.coretrek.no:5050/konsulent/docker/dbdump) dbdump -h [dev22.intra.coretrek.com](http://dev22.intra.coretrek.com/) cp_pensjonseksperten"

  

  

  

> [!info] PHPDocker.io - Generator  
> PHPDocker.  
> [https://phpdocker.io/](https://phpdocker.io/)