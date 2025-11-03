  

## docker compose

Docker Compose allows you to define and manage multi-container applications in a single YAML file.

`docker compose up -d`

-d = detached mode

  

## Watch mode

`docker compose watch`

[https://docs.docker.com/compose/file-watch/](https://docs.docker.com/compose/file-watch/)

  

## Bind mounts

```YAML
todo-app:
    # ...
    volumes:
      - ./app:/usr/src/app
      - /usr/src/app/node_modules
```

`./app` i prosjektet blir bunden til `/usr/src/app` i containeren.

`/usr/src/app/node_modules` blir beskytta frå å bli overskrive. (But why???)