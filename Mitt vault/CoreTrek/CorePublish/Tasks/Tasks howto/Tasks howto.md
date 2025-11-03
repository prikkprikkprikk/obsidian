Tasks kan vere one-offs eller periodiske/gjentakande oppgåver.

  

### Sjå crontab

```Shell
crontab -l
```

### Redigere crontab

```Shell
crontab -e
```

På dev må kvar enkelt bruke eigen crontab, men vere forsiktig/bevisst på at det

Dev:

```Shell
* * * * * ( cd /usr/local/cpinstall/activeversion/corepublish/cron/ && /usr/bin/php taskrunner.php dev22.intra.coretrek.com 10159 --auto )
```

Redigere crontab på stage:

```HTML
sudo -u corepublish crontab -e
```

## Task

Interface Task – trenger kun `public function run()` .

TaskRunnerCallback→setProgress()

Returnere streng på slutten med fornuftig tilbakemelding.

  

### Definere crontasks i CPAdmin

[https://corepublish.dev22.intra.coretrek.com/admin](https://corepublish.dev22.intra.coretrek.com/admin)

**Arguments**

Spesifiserast som kva du vil, men f.eks. JSON:

```Shell
$jsonArguments = $taskDescriptor->getArguments();

$arguments = json_decode($jsonArguments, true);
```

  

**Enabled**

Treng ikkje å slå på, kan køyre task manuelt:

```Shell
cd /usr/local/cpinstall/activeversion/corepublish/cron/
php taskrunner.php # vis argumenter osv.
php taskrunner.php dev22.intra.coretrek.com [siteid] --run-crontask [crontaskID]
```

### Dele opp task i fleire runs

Tasks bør ikkje køyre for lenge, ikkje lenger enn f.eks. 2 min.

Heller dele opp i fleire runs med offset, f.eks.

Holde styr på offset e.l. vha. tabell som heiter “Preferences”.

### Exception i task

Viss en task throws exception, blir ikkje tasken køyrt meir.

### ErrorTolerantTask

```Shell
interface ErrorTolerantTask
```

– blir køyrt igjen sjølv om det oppstår exception.

### Statistikk-modul

Må aktivere **Statistics daily task** og **Statistics minutely task.**

### Importere artikler

Content Importer

[https://technet.coretrek.no/doc/latest/developer/features/06-articleimport.html](https://technet.coretrek.no/doc/latest/developer/features/06-articleimport.html)

  

## Eksempel

```PHP
<?php

namespace CoreTrek\Shared\Task;

use CtConfigurationErrorException;
use Task;
use TaskDescriptor;
use TaskRunnerCallback;

/**
 * Comment.
 */
class TestTask implements Task {

    /**
     * {@inheritDoc}
     *
     * @param TaskRunnerCallback $callback The callback.
     * @param TaskDescriptor $taskDescriptor  The descriptor.
     * @return string
     */
    public function run(TaskRunnerCallback $callback, TaskDescriptor $taskDescriptor) {
        $callback->setProgress(0, 'Starting');

        $jsonArguments = $taskDescriptor->getArguments();
        $arguments = json_decode($jsonArguments, true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            return 'FAIL - invalid json arguments';
        }

//        $userManager = \CorePublish::getInstance()->getUserManager();
//        $userListInstance = $userManager->getUserListInstance();
//        //$userListInstance->addUser(...);

//        $articleManager = \CorePublish::getInstance()->getArticleManager();
//        $articleListInstance = $articleManager->getArticleListInstance();
//        //$articleManager->createArticleSimple(...);
//
//        $msg = 'Arguments: ' . print_r($arguments, true);
//        \CorePublish::getInstance()->getLog()->error(__FILE__, __LINE__, $msg);

        $callback->setProgress(100, 'Finished');

        return "Hello World!";
    }
}
```

## Sette opp crontask i CPAdmin for customer

![[📎 Filer/image 40.png|image 40.png]]