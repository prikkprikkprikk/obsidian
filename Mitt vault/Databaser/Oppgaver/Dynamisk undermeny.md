---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---

## Slik funkar det

Kvar brikke som skal visast må registrere seg hos `DynamicMenuManager` i sin `prepare()`:

```
DynamicMenuManager::getInstance()->registerTile(  
    'tile-' . $this->getInstanceId(),  
    $site->getWord('dynamicsubmenutile.article.link-text')  
);
```


## ToDo i prod
- [ ] Ny brikke: Dynamisk undermeny
- [ ] Ny kategorimal: Forskningsområde


