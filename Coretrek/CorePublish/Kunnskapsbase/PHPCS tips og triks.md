## requireClass – side effects


> [!NOTE] Side effect-feilmelding
> phpcs: A file should declare new symbols (classes, functions, constants, etc.) and cause no other side effects, or it should execute logic with side effects, but should not do both. 

For å unngå at PHPCS gir feilmelding ved `requireClass()`, kan ein bruke `// phpcs:disable` og `// phpcs:enable` før/etter:

```php
// phpcs:disable  
requireClass('ctwebform.entry.CtWebformEntryList');  
// phpcs:enable
```
