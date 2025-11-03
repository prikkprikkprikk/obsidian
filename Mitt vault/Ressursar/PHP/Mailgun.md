## Mailgun i Statamic / Laravel

[Laravel Mail Driver/Transport Prerequisites](https://laravel.com/docs/9.x/mail#driver-prerequisites)

Lag ny API-nøkkel: Mailgun → Sending → Domains → {domene} → Domain settings (tilbake i meny-sidebaren) → Sending API keys (tab) → Add sending key (knapp øverst til høgre)

I Statamic/Laravel:

```Plain
composer require symfony/mailgun-mailer symfony/http-client
```

`config/mail.php`:

> Set the default option in your application’s config/mail.php configuration file to mailgun

`config/services.php`:

```PHP
'mailgun' => [    'domain' => env('MAILGUN_DOMAIN'),    'secret' => env('MAILGUN_SECRET'),    'endpoint' => env('MAILGUN_ENDPOINT', 'api.eu.mailgun.net'),],
```

`.env`:

```Plain
MAIL_MAILER=mailgunMAILGUN_DOMAIN=mg.domene.noMAILGUN_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxxxxxxx-xxxxxxxxMAIL_FROM_ADDRESS=ikkesvar@domene.noMAIL_FROM_NAME="${APP_NAME}"
```