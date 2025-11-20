---
Date Created: 2025-09-26T08:03
Innboks: false
Prosjekt:
  - "[[Databaser/Prosjekt/IVAR]]"
Oppgavestatus: På vent
---

### Elementer per nøkkeltall

- [ ] Ikon
- [ ] Tittel
- [ ] Beskrivelse
- [ ] Tall  

![[ivar-nøkkeltall.png|ivar-nøkkeltall.png]]

## API-synkronisering
- [ ] Task for å hente nye tal dagleg
	- [ ] Korleis køyrer ein task manuelt igjen?```
	      cd /usr/local/cpinstall/activeversion/corepublish/cron
	      php taskrunner.php dev22.intra.coretrek.com 11257 --run-crontask 10```
	- [ ] Når på døgnet? Skal det stå "i går", "siste 24 timer" eller kva?
		- [ ] Ser ut til at data er frå forrige døgn.
- [ ] Konstruere nøkkeltal ut frå API-data
	- [ ] Returnere DTO:
		- [ ] artikkel-id tala skal puttast inn i
		- [ ] nøkkeltal (streng)
- [ ] Lagre nøkkeltal i rett artikkel


## Crontask-oppsett

Eksempel frå Area:

![[Pasted image 20251120085817.png]]