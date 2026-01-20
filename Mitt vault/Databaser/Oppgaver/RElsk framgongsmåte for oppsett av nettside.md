- [ ] ctrelease til stage for å få med nytt theme
- [ ] Innhold → Lag ny rot-kategori (nederst i innholdshierarkiet)
	- [ ] Navn: R:Elsk
	- [ ] Kategori-URL: Overstyr manuelt → sett til tom
- [ ] Innhold → ivar.no → **no**/**en** prikkemeny → Kopier kategori
	- [ ] til å bli underkategorier av denne noden: **R:Elsk**
- [ ] CorePublish → Nettsteder → IVAR IKS prikkemeny → Kopier
	- [ ] Nettstednavn: R:Elsk
	- [ ] Rotkategori for nettstedet: R:Elsk (frå steg 1)
	- [ ] Servere: dev22…
		- [ ] Hoved-URL: https://relsk.jorn.dev22.intra.coretrek.com/
			- [ ]  → Lagre
		- [ ] Vertsnavn: relsk.\*.dev22.intra.coretrek.com
			- [ ]  → Lagre
	- [ ] Språk: Norwegian/English → sette alle nødvendige kategoriar
	- [ ] Innstillinger:
		- [ ] style.theme_name: **relsk**
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
- [ ] Symlinke på stage:
	```shell
	ssh stage22
	cd /home/projects
	ln -s ivar2025 relsk
	```
