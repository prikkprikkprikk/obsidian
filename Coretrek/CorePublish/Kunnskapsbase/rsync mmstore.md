
## prod → dev

```
rsync --delete -rpCl --info=progress2 st-vtoi03.coretrek.net:/home/mmstore/[prosjektnamn]/ /home/mmstore/[prosjektnamn]/
```

## stage22 → dev

```
rsync --delete -rpCl --info=progress2 stage22.coretrek.no:/home/mmstore/[prosjektnamn]/ /home/mmstore/[prosjektnamn]/
```

