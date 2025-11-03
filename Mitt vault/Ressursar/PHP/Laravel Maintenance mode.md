> [!info] Laravel - The PHP Framework For Web Artisans  
> All of the configuration files for the Laravel framework are stored in the config directory.  
> [https://laravel.com/docs/9.x/configuration#maintenance-mode](https://laravel.com/docs/9.x/configuration#maintenance-mode)  

## [Maintenance Mode](https://laravel.com/docs/9.x/configuration#maintenance-mode)

When your application is in maintenance mode, a custom view will be  
displayed for all requests into your application. This makes it easy to  
"disable" your application while it is updating or when you are  
performing maintenance. A maintenance mode check is included in the  
default middleware stack for your application. If the application is in  
maintenance mode, a `Symfony\Component\HttpKernel\Exception\HttpException` instance will be thrown with a status code of 503.

To enable maintenance mode, execute the `down` Artisan command:

`php artisan down`

If you would like the `Refresh` HTTP header to be sent with all maintenance mode responses, you may provide the `refresh` option when invoking the `down` command. The `Refresh` header will instruct the browser to automatically refresh the page after the specified number of seconds:

`php artisan down --refresh=15`

You may also provide a `retry` option to the `down` command, which will be set as the `Retry-After` HTTP header's value, although browsers generally ignore this header:

`php artisan down --retry=60`

### [Bypassing Maintenance Mode](https://laravel.com/docs/9.x/configuration#bypassing-maintenance-mode)

To allow maintenance mode to be bypassed using a secret token, you may use the `secret` option to specify a maintenance mode bypass token:

`php artisan down --secret="1630542a-246b-4b66-afa1-dd72a4c43515"`

After placing the application in maintenance mode, you may navigate  
to the application URL matching this token and Laravel will issue a  
maintenance mode bypass cookie to your browser:

`https://example.com/1630542a-246b-4b66-afa1-dd72a4c43515`

When accessing this hidden route, you will then be redirected to the `/`  
route of the application. Once the cookie has been issued to your  
browser, you will be able to browse the application normally as if it  
was not in maintenance mode.

> Your  
> maintenance mode secret should typically consist of alpha-numeric  
> characters and, optionally, dashes. You should avoid using characters  
> that have special meaning in URLs such as `?`.

### [Disabling Maintenance Mode](https://laravel.com/docs/9.x/configuration#disabling-maintenance-mode)

To disable maintenance mode, use the `up` command:

`php artisan up`

> You may customize the default maintenance mode template by defining your own template at `resources/views/errors/503.blade.php`.