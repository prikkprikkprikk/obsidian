## Test environment

.env.testing

  

## faker

For at unit tests skal kunne bruke faker i factories, må følgande leggast til øverst i Pest.php:

```PHP
uses(Tests\TestCase::class)->in('Unit');
```

## actingAs()

For å kunne bruke actingAs() i test cases, legg inn som funksjon i Pest.php:

```PHP
/** * Set the currently logged in user for the application. * * @return TestCase */function actingAs(Authenticatable $user, string $driver = null){    return test()->actingAs($user, $driver);}
```

Mer info: https://pestphp.com/docs/helpers\#usage

  

> [!info] Make changes to the database during a Livewire Pest chain  
> Tests Tests are great!  
> [https://stefrouschop.nl/make-changes-to-the-database-during-a-livewire-pest-chain-cla44o0hb000l08k12hvlfqac](https://stefrouschop.nl/make-changes-to-the-database-during-a-livewire-pest-chain-cla44o0hb000l08k12hvlfqac)