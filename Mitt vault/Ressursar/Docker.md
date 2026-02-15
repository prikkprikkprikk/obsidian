
[[Art of Home WordPress-docker i OrbStack]]

## Lære Docker

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ud7Npgi6x8E?si=IGNpR2fKHQ03h0xQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/HGKfE-cn9y4?si=Fh_3_4ISUvfx09bf" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/WKI7d2zZv9U?si=hjLtrNBjjAGg6Hnn" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>



<iframe width="691" height="326" src="https://www.youtube.com/embed/TeU0RJgL6y4" title="Docker For Developers" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>




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