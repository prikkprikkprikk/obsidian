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
- [ ] Legge til felt i Nøkkeltall-artikkeltypen:
	- [ ] Prosessor
		- [ ] accumulated_difference
		- [ ] hourly_sum
	- [ ] Tags
		- [ ] Kommaseparert liste
- [ ] Task for å hente nye tal dagleg
	- [ ] Korleis køyrer ein task manuelt igjen?```
	      cd /usr/local/cpinstall/activeversion/corepublish/cron
	      php taskrunner.php dev22.intra.coretrek.com 11257 --run-crontask 10```
	- [ ] Når på døgnet? Skal det stå "i går", "siste 24 timer" eller kva?
		- [ ] Ser ut til at data er frå forrige døgn, fram til og med kl. 01:00
		- [ ] Ergo køyre task f.eks. kl. 03:00
	- [ ] Hente alle artiklar frå kategoriane i config: `key_figures.categories`
		- [ ] For kvar artikkel:
			- [ ] Finne prosessor og tags
			- [ ] Prosessere
			- [ ] Oppdatere artikkelen med data returnert frå prosessoren
	- [ ] Husk feilhandtering!



## Crontask-oppsett

Eksempel frå Area:

![[Pasted image 20251120085817.png]]