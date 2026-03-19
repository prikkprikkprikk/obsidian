---
Prosjekt:
  - "[[PlusOffice]]"
Oppgavestatus: I arbeid
---
## Nettsidemal
Lage kopi av WeKomply når den er ferdig.

### Kategorimaler
- [ ] Forside
	- [ ] Forside Nettsidemal
	- [ ] Forside PlusOffice
	- [ ] Forside WeKomply

### Nettstedsinnstillinger
#### Innstillinger
Sette noen nødvendige innstillinger for hvert nye nettsted:
- [ ] `corepublish.root`
	- [ ] `/usr/local/cpinstall/activeversion/corepublish/`
- [ ] `svg.symbols.filepath`
	- [ ] `html/themes/[theme]/svg/`
- [ ] `svg.symbols.folder`
	- [ ] Lage egen SVG-mappe under hvert nettsteds filmappe
#### Egendefinerte
- [ ] logo.image og logo.image.alt
- [ ] footer.contactInfo
	- [ ] Brukes i ny brikke Footer – kontaktinfo

### Brikker
- [ ] Footer – kontaktinfo
	- [ ] Parametere
		- [ ] article
		- [ ] article_by_site_config → Nettstedsinnstilling
			- [ ] initiell verdi: footer.contactInfo

## Lage nytt nettsted
- [ ] Nytt nettsted for Nettsidemal
	- [ ] Sette standard maler

### Struktur
- [ ] Lag ny rot-kategori
	- [ ] Språk
		- [ ] Meny
			- [ ] Forside (ikke synlig i menyer)
			- [ ] Nyheter/artikler
			- [ ] Om oss

### *Før* kopiering av nettstad
- [ ] Nettsteder → [nettsted] → Generelt
	- [ ] Universell utforming → Alt på
	- [ ] Automatiske url-er → På

### *Etter* kopiering av nettstad
- [ ] Nettsteder → [nettsted] 
	- [ ] → Generelt
		- [ ] → Rotkategori for nettstedet
		- [ ] → Rotmappe for Filer
	- [ ] → Språk → Norwegian
		- [ ] → Endre alle kategori-innstillinger
	- [ ] → Servere
		- [ ] dev / stage / prod
			- [ ] Husk [[Nettside-symlink]]
- [ ] Forside
	- [ ] Lage ny forside-kategorimal
- [ ] Endre brikkeinnstillinger for både forsidemal og språk-kategorien
	- [ ] 


## Brikker
- [ ] Søkefelt interaktivt + søkeresultat
	- [ ] Legge inn nettstedsinnstilling
		- [ ] Kategorier som skal inkluderes i søk
		- [ ] Rotmappe for filer
		- [ ] Brukergruppe
			- [ ] Legge opp brukergrupper for dei ulike nettsidene
- [ ] Logo footer
	- [ ] Legge til felt for "navn på nettstedsinnstilling" 
	- [ ] Innstilling: logo.image.footer
- [ ] 

### Relasjonar
- [ ] Husk at kategoriar har bakgrunnsfarge-relasjon
- [ ] 

## Ved release til prod
- [ ] Nettsteder → [nettsted] → Innstillinger
	- [ ] Endre `style.theme_name` frå `corepublish` til `plusoffice` / `wekomply`
	- [ ] Endre `svg.symbols.filepath` til `html/themes/shared/svg/`


## Readme
- Oppdatere README.md med info om alt dette oppsettet.


---
## WeKomply
https://wekomply.com/

