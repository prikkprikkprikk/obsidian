[[Antlers]]

## Starter kits

[Peak](https://statamic.com/starter-kits/studio1902/peak)

  

## Kurs

### Learn Statamic with Jack (Laracasts)

> [!info] Learn Statamic with Jack  
> You've probably heard of Statamic by now - that rebellious little Laravel-powered content management system that refuses to uses databases.  
> [https://laracasts.com/series/learn-statamic-with-jack](https://laracasts.com/series/learn-statamic-with-jack)  

Sjå ein gong til:

- Episode 12: Antlers
    - {{ condition ?= “show if true” }}
- Episode 14: Advanced Bard
- Episode 16: Deploying and cache modes
    - [https://laracasts.com/series/learn-statamic-with-jack/episodes/16](https://laracasts.com/series/learn-statamic-with-jack/episodes/16)
    - Spesielt sjekk deploy script:
        - php please stashe:refresh
        - php please static:clear
    - {{ nocache }} tag

### Introduction to Statamic (LinkedIn Learning)

> [!info] Introduction to Statamic - Building a Website with Statamic Video Tutorial | LinkedIn Learning, formerly Lynda.com  
> Statamic is a flat-file, Laravel- and Git-powered CMS designed for building beautiful, easy-to-manage websites.  
> [https://www.linkedin.com/learning/building-a-website-with-statamic/introduction-to-statamic?autoplay=true](https://www.linkedin.com/learning/building-a-website-with-statamic/introduction-to-statamic?autoplay=true)  

  

## Translation

Sett språk for frontend i `config/statamic/sites.php`:

```PHP
<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Sites
    |--------------------------------------------------------------------------
    |
    | Each site should have root URL that is either relative or absolute. Sites
    | are typically used for localization (eg. English/French) but may also
    | be used for related content (eg. different franchise locations).
    |
    */

    'sites' => [

        'default' => [
            'name' => config('app.name'),
            'locale' => 'no',
            'url' => '/',
        ],

    ],
];
```

[[Statamic contributions]]