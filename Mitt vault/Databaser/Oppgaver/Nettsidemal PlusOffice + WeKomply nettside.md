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
- [x] `logo.image` og `logo.image.alt`
- [x] `footer.contactInfo`
	- [ ] Brukes i Footer – kontaktinfo (BannerDisplayTile)
- [x] `social_media.*`

### Brikker
- [ ] Logo footer – Shared/FooterLogoTile
	- [x] Kopi av LogoTile
	- [x] Legge til parameter: `image_by_site_config`
- [ ] Eksisterende brikke: SiteComponents/article/tiles/banner/BannerDisplayTile
	- [x] Legge til parameter:
		- [x] `article_by_site_config` → Nettstedsinnstilling
			- [x] Ingen default value
			- [ ] Verdi for brikke i footer (både forside og felles): `footer.contactInfo`
- [x] Shared/ConfigMenuTile – Standardmeny fra innstilling
	- [x] Kopi av Standardmeny
	- [x] Ekstra parameter
		- [x] `menu_root_setting`
			- [x] Ingen default value

## Lage nytt nettsted
- [ ] Nytt nettsted for WeKomply
	- [ ] Sette standard maler

### Struktur
- [ ] Lag ny rot-kategori
	- [ ] Språk
		- [ ] Meny
			- [ ] Forside (ikke synlig i menyer)
			- [ ] Nyheter/artikler
			- [ ] Om oss

### *Før* kopiering av nettsted
- [ ] Nettsteder → [nettsted] → Generelt
	- [ ] Universell utforming → Alt på
	- [ ] Automatiske url-er → På

### *Etter* kopiering av nettsted
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

