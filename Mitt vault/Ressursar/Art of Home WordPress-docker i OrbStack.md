
## Github repo
https://github.com/Rieck-tech/artofhome


## Intro av Claude

Here's your Obsidian-ready guide. A few things worth highlighting:

**The web root mismatch** is the trickiest part of running Bedrock in Docker. The standard `wordpress` image expects WordPress at `/var/www/html`, but Bedrock puts the web root at `web/`. The guide includes a custom Apache config to handle this.

**Satispress auth** goes in `auth.json` which you'll want to gitignore. You'll need to fill in the actual Satispress URL and API key once you have that set up.

**WP-CLI** uses Docker's "profiles" feature so it doesn't run as a long-lived container — it spins up only when you invoke it. The shell alias (`dcwp`) will save you a lot of typing.

One heads up: the `wordpress` Docker image ships with its own WordPress installation logic that can sometimes conflict with Bedrock's structure. If you run into issues where the container tries to install WordPress on top of Bedrock, you might need to switch to a plain `php:8.2-apache` image and install the PHP extensions yourself. I've gone with the official image here since it works in most cases, but flag it if you hit weirdness and we can adjust.


**Project:** Art of Home
**Path:** `~/code/artofhome`
**Runtime:** OrbStack (Docker) 
**Not for production** — Servebolt handles hosting. This is local dev only.


---

## The Mental Model

Before diving into commands, here's how the pieces relate:

```
Your Mac (host)
└── ~/code/artofhome/          ← Your Git repo, lives on your Mac
    ├── composer.json           ← Manages WP core, plugins, themes
    ├── .env                   ← Environment config (DB creds, URLs, etc.)
    ├── docker-compose.yml     ← Describes which containers to run
    ├── web/                   ← Bedrock's web root
    │   ├── app/               ← wp-content equivalent (themes, plugins)
    │   └── wp/                ← WordPress core (Composer-managed, gitignored)
    └── config/                ← Bedrock environment configs

OrbStack (runs Docker containers)
├── wordpress  ← PHP + Apache container, serves your site
│              ← Sees your repo files via a "volume mount"
│              ← Changes you make on Mac appear instantly in container
├── mariadb    ← Database container, data persists in a Docker volume
├── mailhog    ← Catches all outgoing emails for inspection
└── wpcli      ← Runs WP-CLI commands against the WordPress container
```

**Key insight:** Volume mounts are the bridge between your Mac and the containers. When you edit a theme file in VS Code, the WordPress container sees the change immediately — no copying, no syncing. The files live on your Mac; the container just has a window into them.

**Docker volumes vs bind mounts:**

- **Bind mount** (your code) → A folder on your Mac mapped into a container. You own the files.
- **Docker volume** (the database) → Managed by Docker. Lives inside OrbStack's VM. Persists across container restarts but isn't a visible folder on your Mac.

---

## Part 1: One-Time Setup

### 1.1 Prerequisites

Make sure you have these installed:

```bash
# OrbStack (includes Docker)
# Download from https://orbstack.dev or:
brew install orbstack

# Composer (PHP dependency manager)
brew install composer

# Verify everything works
docker --version
composer --version
```

### 1.2 Scaffold the Bedrock Project

```bash
cd ~/code
composer create-project roots/bedrock artofhome
cd artofhome
```

This gives you the Bedrock directory structure. Composer has already run `install`, so `web/wp/` (WordPress core) is in place.

### 1.3 Create the Docker Compose File

Create `docker-compose.yml` in the project root (`~/code/artofhome/`):

```yaml
# docker-compose.yml
# Defines all the containers for local development

services:

  # --- WordPress (PHP + Apache) ---
  wordpress:
    image: wordpress:6-php8.2-apache
    container_name: artofhome-wp
    ports:
      - "8080:80"                          # http://localhost:8080
    environment:
      WORDPRESS_DB_HOST: mariadb:3306
      WORDPRESS_DB_NAME: artofhome
      WORDPRESS_DB_USER: artofhome
      WORDPRESS_DB_PASSWORD: secret
    volumes:
      - .:/var/www/html                    # Mount entire repo into container
    working_dir: /var/www/html
    depends_on:
      mariadb:
        condition: service_healthy
    restart: unless-stopped

  # --- MariaDB ---
  mariadb:
    image: mariadb:11
    container_name: artofhome-db
    ports:
      - "3306:3306"                        # Optional: access DB from Mac
    environment:
      MARIADB_DATABASE: artofhome
      MARIADB_USER: artofhome
      MARIADB_PASSWORD: secret
      MARIADB_ROOT_PASSWORD: rootsecret
    volumes:
      - db_data:/var/lib/mysql             # Persist DB across restarts
    healthcheck:
      test: ["CMD", "healthcheck.sh", "--connect", "--innodb_initialized"]
      start_period: 10s
      interval: 10s
      timeout: 5s
      retries: 3
    restart: unless-stopped

  # --- Mailhog (email catcher) ---
  mailhog:
    image: mailhog/mailhog:latest
    container_name: artofhome-mail
    ports:
      - "1025:1025"                        # SMTP port
      - "8025:8025"                        # Web UI: http://localhost:8025
    restart: unless-stopped

  # --- WP-CLI ---
  wpcli:
    image: wordpress:cli-php8.2
    container_name: artofhome-wpcli
    volumes:
      - .:/var/www/html
    working_dir: /var/www/html
    environment:
      WORDPRESS_DB_HOST: mariadb:3306
      WORDPRESS_DB_NAME: artofhome
      WORDPRESS_DB_USER: artofhome
      WORDPRESS_DB_PASSWORD: secret
    depends_on:
      mariadb:
        condition: service_healthy
    # No restart — this runs on-demand, not as a long-lived service
    profiles:
      - cli

volumes:
  db_data:                                 # Named volume for database persistence
```

> **Why mount the entire repo?** Bedrock's web root is `web/`, not the project root. We'll configure Apache (or WordPress) to know this. Mounting everything means Composer's `vendor/` directory is also available inside the container.

### 1.4 Configure Bedrock's `.env`

Edit the `.env` file in your project root. Bedrock created a template — update it:

```dotenv
DB_NAME='artofhome'
DB_USER='artofhome'
DB_PASSWORD='secret'
DB_HOST='mariadb:3306'
DB_PREFIX='wp_'

WP_ENV='development'
WP_HOME='http://localhost:8080'
WP_SITEURL="${WP_HOME}/wp"

# Generate these at https://roots.io/salts.html
# Paste the generated block here
AUTH_KEY='generateme'
SECURE_AUTH_KEY='generateme'
LOGGED_IN_KEY='generateme'
NONCE_KEY='generateme'
AUTH_SALT='generateme'
SECURE_AUTH_SALT='generateme'
LOGGED_IN_SALT='generateme'
NONCE_SALT='generateme'
```

> **Important:** The `DB_HOST` is `mariadb` (the service name from docker-compose), not `localhost`. Inside Docker's network, containers talk to each other by service name.

### 1.5 Handle the Web Root Mismatch

The default `wordpress` Docker image expects WordPress at `/var/www/html`. But Bedrock puts the web root at `web/`. You need to tell Apache about this.

Create a file at `docker/apache.conf`:

```apache
<VirtualHost *:80>
    DocumentRoot /var/www/html/web

    <Directory /var/www/html/web>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

Then update the `wordpress` service in `docker-compose.yml` to include this config:

```yaml
  wordpress:
    image: wordpress:6-php8.2-apache
    container_name: artofhome-wp
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: mariadb:3306
      WORDPRESS_DB_NAME: artofhome
      WORDPRESS_DB_USER: artofhome
      WORDPRESS_DB_PASSWORD: secret
    volumes:
      - .:/var/www/html
      - ./docker/apache.conf:/etc/apache2/sites-available/000-default.conf  # Custom web root
    working_dir: /var/www/html
    depends_on:
      mariadb:
        condition: service_healthy
    restart: unless-stopped
```

### 1.6 Configure Satispress (for proprietary plugins/themes)

In your `composer.json`, add your Satispress repository. This is where your licensed/proprietary plugins and themes are served from:

```json
{
  "repositories": [
    {
      "type": "composer",
      "url": "https://your-satispress-site.com/satispress/"
    }
  ]
}
```

Composer authentication for Satispress goes in `auth.json` (in the project root — **add this to `.gitignore`**):

```json
{
  "http-basic": {
    "your-satispress-site.com": {
      "username": "your-api-key",
      "password": "satispress"
    }
  }
}
```

### 1.7 Set Up `.gitignore`

Bedrock ships with a sensible `.gitignore`, but make sure these are included:

```gitignore
# WordPress core (Composer-managed)
web/wp

# Dependencies
vendor

# Environment & secrets
.env
auth.json

# Docker
db_data

# OS files
.DS_Store
```

### 1.8 Mailhog Integration

To make WordPress send emails through Mailhog, you need a small MU-plugin. Create `web/app/mu-plugins/mailhog.php`:

```php
<?php
/**
 * Route all outgoing mail through Mailhog in development.
 */
if (defined('WP_ENV') && WP_ENV === 'development') {
    add_action('phpmailer_init', function ($phpmailer) {
        $phpmailer->Host = 'mailhog';
        $phpmailer->Port = 1025;
        $phpmailer->SMTPAuth = false;
        $phpmailer->isSMTP();
    });
}
```

### 1.9 First Launch

```bash
cd ~/code/artofhome

# Start all containers (except WP-CLI, which is on-demand)
docker compose up -d

# Watch the logs to see if everything boots cleanly
docker compose logs -f
```

Once it stabilizes, visit:

- **WordPress:** http://localhost:8080 (you'll see the install wizard)
- **Mailhog:** http://localhost:8025

Complete the WordPress install wizard in your browser.

---

## Part 2: Day-to-Day Workflows

### Starting Your Dev Environment

```bash
cd ~/code/artofhome
docker compose up -d
```

That's it. OrbStack starts fast. Your site is at http://localhost:8080.

### Stopping Your Dev Environment

```bash
# Stop containers but keep them (and the database)
docker compose stop

# OR: Stop and remove containers (database volume still persists)
docker compose down

# Nuclear option: remove everything including the database
docker compose down -v
```

### Running WP-CLI Commands

The `wpcli` service has the `cli` profile, so it doesn't start automatically. Run commands like this:

```bash
# General pattern
docker compose run --rm wpcli wp <command>

# Examples
docker compose run --rm wpcli wp plugin list
docker compose run --rm wpcli wp user list
docker compose run --rm wpcli wp cache flush
docker compose run --rm wpcli wp search-replace 'https://production-url.com' 'http://localhost:8080'
```

> **Tip:** Add a shell alias to save typing:
> 
> ```bash
> # Add to ~/.zshrc
> alias dcwp="docker compose run --rm wpcli wp"
> 
> # Then just:
> dcwp plugin list
> ```

### Installing Plugins/Themes via Composer

This happens on your Mac, not inside a container:

```bash
cd ~/code/artofhome

# Public plugin from wpackagist
composer require wpackagist-plugin/wp-offload-media

# Proprietary plugin from Satispress
composer require your-vendor/your-plugin

# Update everything
composer update
```

Since the repo is bind-mounted, the container sees changes immediately.

### Viewing Logs

```bash
# All containers
docker compose logs -f

# Specific container
docker compose logs -f wordpress
docker compose logs -f mariadb
```

### Accessing the Database from Your Mac

Since we exposed port 3306, you can connect with any database client (TablePlus, Sequel Ace, DBeaver, etc.):

|Field|Value|
|---|---|
|Host|127.0.0.1|
|Port|3306|
|User|artofhome|
|Password|secret|
|Database|artofhome|

### Rebuilding After Problems

```bash
# Rebuild containers (e.g., after changing docker-compose.yml)
docker compose up -d --build

# Full reset (lose database!)
docker compose down -v
docker compose up -d
```

---

## Part 3: How It All Connects (Reference)

### Where Things Live

|What|On your Mac|In the container|
|---|---|---|
|Project root|`~/code/artofhome/`|`/var/www/html/`|
|Web root|`~/code/artofhome/web/`|`/var/www/html/web/`|
|Themes|`~/code/artofhome/web/app/themes/`|`/var/www/html/web/app/themes/`|
|Plugins|`~/code/artofhome/web/app/plugins/`|`/var/www/html/web/app/plugins/`|
|MU-Plugins|`~/code/artofhome/web/app/mu-plugins/`|`/var/www/html/web/app/mu-plugins/`|
|WP Core|`~/code/artofhome/web/wp/`|`/var/www/html/web/wp/`|
|Uploads|`~/code/artofhome/web/app/uploads/`|`/var/www/html/web/app/uploads/`|
|Database|Docker volume `db_data`|`/var/lib/mysql/`|

### Port Map

|Service|Container Port|Your Mac|
|---|---|---|
|WordPress|80|http://localhost:8080|
|MariaDB|3306|localhost:3306|
|Mailhog SMTP|1025|localhost:1025|
|Mailhog Web UI|8025|http://localhost:8025|

### Container Network

Containers talk to each other using service names as hostnames:

- WordPress → `mariadb:3306` (not `localhost:3306`)
- WordPress → `mailhog:1025` (not `localhost:1025`)

This is Docker's internal DNS. The service names come from `docker-compose.yml`.

---

## Part 4: Common Issues & Fixes

**"Connection refused" to database** The MariaDB container might not be ready yet. Check `docker compose logs mariadb`. The healthcheck should prevent WordPress from starting too early, but occasionally timing is off. Just run `docker compose restart wordpress`.

**File permission errors** Sometimes the container's Apache user (www-data, UID 33) can't write to mounted directories. Fix:

```bash
# From your Mac
chmod -R 777 web/app/uploads
```

This is fine for local dev. Never do this in production.

**Port already in use** Another process is using 8080, 3306, or 8025. Either stop the other process or change the port mapping in `docker-compose.yml` (e.g., `"8081:80"`).

**Changes not showing up** Bind mounts are generally instant with OrbStack. If you're seeing stale content, try clearing any opcode caches or restarting the WordPress container: `docker compose restart wordpress`.

**WP-CLI permissions** The CLI container runs as a different user than Apache. If WP-CLI creates files, Apache might not be able to read them (and vice versa). The `--rm` flag ensures the CLI container is disposable.

---

## Part 5: Deployment Notes

Since Servebolt uses a traditional hosting setup (not Docker), your deployment workflow would be something like:

1. Develop locally with Docker (this setup)
2. Commit changes to Git
3. Deploy to Servebolt via Git push, rsync, or their deployment tools
4. Run `composer install --no-dev` on the server (or include `vendor/` in your deploy artifact)

Docker is purely your local development environment. The `docker-compose.yml` and `docker/` directory won't be used on the server.

---

## Quick Reference Card

```bash
# Start dev environment
cd ~/code/artofhome && docker compose up -d

# Stop dev environment
docker compose stop

# View logs
docker compose logs -f

# WP-CLI
docker compose run --rm wpcli wp <command>

# Install a plugin
composer require wpackagist-plugin/plugin-name

# Rebuild after config changes
docker compose up -d --build

# Full reset (destroys database!)
docker compose down -v && docker compose up -d
```