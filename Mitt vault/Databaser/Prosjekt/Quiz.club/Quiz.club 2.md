- [ ] Bare begynn!
    - [x] Laravel composer create-project laravel/laravel quizclub
    - [x] Jetstream
    - [x] Filament
    - [x] [[Pest]]
    - [x] [[Larastan 1]]
    - [x] Pint
    - [ ] Datastruktur
        - [ ] Quiz
            - [ ] Spørsmål
                - [ ] Spørsmålstype (inheritance / abstract class / interface?)

## Installering

```Plain
composer create-project laravel/laravel quizclub
cd quizclub
valet secure
composer require laravel/jetstream
php artisan jetstream:install livewire
npm install
npm run dev
php artisan migrate:fresh
composer require filament/filament:"^2.0"
php artisan make:filament-user
composer require nunomaduro/larastan:^2.0 --dev
composer require laravel/pint --dev
composer require pestphp/pest --dev --with-all-dependencies
composer require pestphp/pest-plugin-laravel --dev
php artisan pest:install
```

## Datastruktur

[Database-skjema-graf på HackerDraw](https://www.hackerdraw.com/docs/bdb6c689-21d7-4def-87c2-1ed7980085ae) (Google-innlogging jorn@digitaltwist.no)

  

## Revisjonskontroll av spørsmål

Siden spørsmål kan endres etter at de er inkludert i en quiz, bør/må revisjoner av spørsmålene lagres.

Dvs. når man lagrer et spørsmål, lagres også revisjonsnummer.

Dersom ingen tidligere revisjoner er i bruk noe sted, kan disse slettes for å holde databasen slankest mulig.

Bruke package? https://github.com/VentureCraft/revisionable

**Eller kode selv?**

- Hvert spørsmål har en UUID
- Selve innholdet (tittel, tekst, svaralternativer, rett svar etc.) er i en separat tabell, inkludert revisjonsnummer
- Når man bruker et spørsmål i en quiz, registrerer man både uuid og revisjonsnummer.
- Revisjoner som ikke er referert til fra noe sted kan slettes.