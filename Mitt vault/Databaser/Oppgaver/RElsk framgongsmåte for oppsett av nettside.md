- [x] ctrelease til stage for å få med nytt theme
- [x] Innhold → Lag ny rot-kategori (nederst i innholdshierarkiet)
	- [x] Navn: R:Elsk
	- [x] Kategori-URL: Overstyr manuelt → sett til tom
- [x] Innhold → ivar.no → **no**/**en** prikkemeny → Kopier kategori
	- [x] til å bli underkategorier av denne noden: **R:Elsk**
- [ ] CorePublish → Nettsteder → IVAR IKS prikkemeny → Kopier
	- [x] Nettstednavn: R:Elsk
	- [x] Rotkategori for nettstedet: R:Elsk (frå steg 1)
	- [x] Servere: dev22…
		- [x] Hoved-URL: https://relsk.jorn.dev22.intra.coretrek.com/
			- [x]  → Lagre
		- [x] Vertsnavn: relsk.\*.dev22.intra.coretrek.com
			- [x]  → Lagre
	- [x] Språk: Norwegian/English → sette alle nødvendige kategoriar
	- [ ] Innstillinger:
		- [x] style.theme_name: **relsk**
		- [x] rss_feed.root_category
	- [ ] Egendefinerte innstillinger:
		- [ ] logo.image
			- [ ] Opprette R:Elsk-mappe under Systemrelatert → Logoer
			- [ ] Laste opp R:Elsk-logo 
			- [ ] → Lagre
		- [ ] logo.link
			- [ ] Gjelder for norsk
				- [ ] Lenke til norsk forside
			- [ ] Lage ny, tilsvarande innstilling for engelsk
				- [ ] Lenke til engelsk forside
		- [ ] article.billboardTemplateID
- [ ] Symlinke på stage:
	```shell
	ssh stage22
	cd /home/projects
	ln -s ivar2025 relsk
	```
- [ ] Forsidemal R:Elsk
	- [ ] Bytte billboard-brikke med R:Elsk-versjon
	- [ ] Legge inn tre demo-billboard-artiklar i R:Elsk sin billboard-kategori
	- [ ] Bytte innhold i artikkellister, menyar og footer
- [ ] Bytte kategorimal på R:Elsk-forsida
	- [ ] URL: Overstyr URL, sett til tom
- [ ] Lage artikkelmal for R:Elsk åpningstider
	- [ ] Legge inn Åpningstider-hovedartikkel i Åpningstider-kategori
- [ ] Lage Åpningstider-brikke
	- [ ] Konfigurere med Åpningstider-kategori
- [ ] Redigere R:Elsk forsidemal, legge inn brikke
- [ ] Legge inn businesshours-språkstrenger
- [ ] 