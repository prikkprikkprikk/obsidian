Minimalt setup for å få Laravel til å køyre.
## ./docker-compose.yml
```yaml
services:  
  
  # --- PHP-FPM ---  
  php-fpm:  
    build:  
      context: .  
      dockerfile: docker/Dockerfile  
    container_name: kryptiskekryssord-php-fpm  
    working_dir: /var/www # Where we start when opening the terminal  
    volumes:  
      - .:/var/www # Where this project/repo should be mounted in the php-fpm service's file system  
    restart: unless-stopped  
  
  # --- Nginx ---  
  nginx:  
    image: nginx:stable-alpine # Smallest image size  
    container_name: kryptiskekryssord-nginx  
    volumes:  
      - ./public:/var/www/public # Where the public files should be mounted in the nginx service's file system  
      - ./docker/nginx.conf:/etc/nginx/conf.d/default.conf # Where the config file should be mounted  
    labels:  
      - dev.orbstack.domains=kryptiskekryssord.local
```

## ./docker/Dockerfile
```Dockerfile
FROM php:8.5-fpm  
  
# Install system dependencies and PHP extensions for Laravel with SQLite support.  
# NOTE: Does not do much yet.  
RUN apt-get update \  
#    && apt-get install -y --no-install-recommends \  
#        libicu-dev \  
#        libzip-dev \  
#    && docker-php-ext-install -j$(nproc) \  
#        intl \  
#        zip \  
#        bcmath \  
    && apt-get autoremove -y \  
    && apt-get clean \  
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  
  
WORKDIR /var/www
```
## ./docker/nginx.conf
```nginx
server {  
    listen 80;  
    listen [::]:80;  
    server_name kryptiskekryssord.local;  
    root /var/www/public; # Public path in laravel service  
  
    add_header X-Frame-Options "SAMEORIGIN";  
    add_header X-Content-Type-Options "nosniff";  
  
    index index.php;  
  
    charset utf-8;  
  
    location / {  
        try_files $uri $uri/ /index.php?$query_string;  
    }  
  
    location = /favicon.ico { access_log off; log_not_found off; }  
    location = /robots.txt  { access_log off; log_not_found off; }  
  
    error_page 404 /index.php;  
  
    location ~ ^/index\.php(/|$) {  
        fastcgi_pass php-fpm:9000; # Service name in docker-compose.yml and FPM's default port 9000  
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;  
        include fastcgi_params;  
        fastcgi_hide_header X-Powered-By;  
    }  
  
    location ~ /\.(?!well-known).* {  
        deny all;  
    }  
}
```

