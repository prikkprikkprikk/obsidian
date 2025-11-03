## faker
For at unit tests skal kunne bruke faker i factories, må følgande leggast til øverst i Pest.php:

```php
uses(Tests\TestCase::class)->in('Unit');
```

## actingAs()
For å kunne bruke actingAs() i test cases, legg inn som funksjon i Pest.php:

```php
/**
 * Set the currently logged in user for the application.
 *
 * @return TestCase
 */
function actingAs(Authenticatable $user, string $driver = null)
{
    return test()->actingAs($user, $driver);
}
```

Mer info: https://pestphp.com/docs/helpers#usage


