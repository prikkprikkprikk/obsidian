---
tags:
  - Laravel
  - Læring
  - PHP
  - Symfony
Prosjektstatus: I arbeid
Prosjekttype: Privat
---
## Navneforslag

- Chiclist

## Planlegging

TDD – tests first!

Punktliste for planlegging her @3:52:

[https://youtu.be/EJRRjFvOg_I?si=Iw0ZIs_kU8bk05wk&t=232](https://youtu.be/EJRRjFvOg_I?si=Iw0ZIs_kU8bk05wk&t=232)

## Which Tech Stack?

### Laravel fordi …

Har lyst til å lære meir Laravel, for å kunne gå over til Laravel-utvikling i CoreTrek.

Men passar det betre å lage Quiz Club i Laravel/Filament i så fall? Meir tradisjonell CRUD …

Samtidig ville LiveWire vere eit godt val for sorterbare sjekklister og slikt.

### Symfony fordi …

Har lyst til å lære meir best practices og mindre magi, og Symfony virkar som eit veldig godt val i så fall.

### Konklusjon: Laravel

Kanskje heller lage nettsidene mine i Symfony.

## Jetstream

For auth, teams osv.

  

# Models

## Terminology

- **CLTemplate**
    
- **CLInstance**
    - Links to a ChecklistTemplate

Separate tables for templates and instances.

- **CLSection**
- **CLItemTemplate**
    

  

# To Do

- [ ] Create Laravel app
- [x] Separat test-database
- [ ] Test that a user can:
    - [x] create a template
    - [x] create an instance based on a template
    - [ ] see the template in the app
        - [ ] create livewire component for a list of templates
        - [ ] check that it displays the correct data
    - [ ] see the checklist in the app
        - [ ] create livewire component for a list of checklists
        - [ ] … and check that it says that it’s based on the correct template
    - [ ] dashboard components
        - [ ] create livewire component for most recent templates
        - [ ] create livewire component for most recent checklist
- [ ] Set up running code quality checks (Laravel Pint, PHPStan and Pest) before committing code
    - [ ] `composer ci`?
    - [ ] Some automation in PHPStorm?