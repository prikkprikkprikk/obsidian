
```
docker compose up -d # -d = deamonize
```

## Database
Databasen er i eige "volume", artofhome_db_data, spesifisert i docker-compose.yml:

```yaml
# --- MariaDB ---  
mariadb:  
  container_name: artofhome-db  
  # [...]
  volumes:  
    - db_data:/var/lib/mysql
# [...]
volumes:  
  db_data:
```

Kan også inspiserast i OrbStack under **Volumes**.

# Docker/OrbStack konseptuelt

**Kjernen i OrbStack** (kernel) er ei minimal/lettvekts Linux Virtual Machine.
## Layers

Ein kan sjå på Docker som ein stabel med overhead-ark:
### The "Stack" (From Metal to Code)

1. **Your Mac (The Hardware):** Apple Silicon or Intel chip.
2. **OrbStack (The Engine):** A very thin, high-performance Linux Virtual Machine. This provides the **Linux Kernel**. Think of this as the "Projector" itself.
3. **The Image Base (The Bottom Slide):** When you use `FROM php:8.2-fpm-alpine`, that "Alpine" part is a tiny set of Linux files (a shell, a package manager like `apk`, etc.). It **does not** have its own kernel. It "borrows" the kernel from OrbStack. 
4. **The PHP Layer (The Middle Slide):** The PHP binaries and extensions.
5. **Your Code (The Top Slide):** Your Laravel/Symfony files, usually mounted from your Mac's SSD.

Because the container **borrows** the kernel from OrbStack, it starts up in milliseconds. If it had to boot its own kernel (like a traditional VirtualBox VM), you'd be waiting minutes for your environment to "warm up."

- A container is essentially a process that is "fooled" into thinking its root directory (`/`) is just that "bottom slide" (the Alpine or Debian files).    
- It can't see your Mac's files or other containers unless you explicitly give it a "portal" (a Volume or a Network).

Bra videoserie:

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ud7Npgi6x8E?si=v3egVLFuTw7kvxEu" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/HGKfE-cn9y4?si=foDgclVBkggRlvVg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## bash

```Shell
docker-compose exec webserver bash
```

## XDebug

Starte xdebug:

```Shell
npm run docker:xdebug:on
```

## dbdump

"docker:dump:dev": "docker run -ti --rm -v ~/.ssh:/opt/ssh:ro -v $(pwd)/docker/dump:/data/dbdump/ [scm.coretrek.no:5050/konsulent/docker/dbdump](http://scm.coretrek.no:5050/konsulent/docker/dbdump) dbdump -h [dev22.intra.coretrek.com](http://dev22.intra.coretrek.com/) cp_pensjonseksperten"

  

  

  

> [!info] PHPDocker.io - Generator  
> PHPDocker.  
> [https://phpdocker.io/](https://phpdocker.io/)