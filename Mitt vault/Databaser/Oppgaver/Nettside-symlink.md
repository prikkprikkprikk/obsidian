Dersom ein kunde har fleire nettsider, må dei ulike nettsidene symlinkast på server.
## dev
Symlink til `subdomene` i `~/public_html/devel/`.

For eksempel, om det er satt opp:
* https://ivar2025.jorn.dev22.intra.coretrek.com/ (hovednettside)
* https://ivarryfylke.jorn.dev22.intra.coretrek.com/
… opprettast symlink som peikar til prosjektmappa:
```bash
ivar2025/
ivarryfylke -> ivar2025/
```

## stage
På stage er lokasjonen `/home/projects` – ellers er det likt som for dev.

