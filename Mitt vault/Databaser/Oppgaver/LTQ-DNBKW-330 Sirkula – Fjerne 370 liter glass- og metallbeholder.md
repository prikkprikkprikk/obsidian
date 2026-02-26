---
Prosjekt:
  - "[[Databaser/Prosjekt/Sirkula|Sirkula]]"
---
Vi ønsker å fjerne 370 liter glass- og metallbeholder, dette gjelder skjemaet både på åpne sider (det skjemaet som sendes inn via e-post) og skjemaet som ligger på Min Side.  Håper dere kan utføre dette i løpet av kort tid, slik at vi slipper bestillinger som vi må følge opp.

![[LTQ-DNBKW-330 Sirkula – Fjerne 370 liter glass- og metallbeholder.png|458]]

Eirik:
Da har jeg fjernet den beholderen fra skjemaet som ligger åpent. For skjemaet som ligger på "Min side" får vi dataene fra Norkart/Komtek, og det burde kanskje endres der? Det kan dog være en utfordring hvis det er noen som allerede har 370 liters dunken. Jeg kan prøve å filtrere den ut i koden vår ved å se på dataene vi får tilbake fra Komtek. Kan du gi meg et matrikkelnummer som jeg kan bruke for å slå opp direkte i API'et? Gjerne også et matrikkelnummer som har 370 liters dunk idag, så skal jeg prøve å teste litt lokalt.

Hege:
Gnr. 1, bnr. 2079 seksjon 1 er registrert med 370 liter glass-/metallbeholder.
Kommunenummer i Hamar er 3403

Takk, da fikk jeg laget matrikkelnummeret som må sendes til Norkart/Komtek - i dette tilfellet ser det slik ut:  
34030000120790000001

Eirik notat:
Det er to sider av oppgaven:  
1. På det åpne skjemaet er det bare å filtrere bort beholderen fra data vi får fra Norkart  
2. På det lukka skjemaet tror jeg vi må la beholderen vises i skjema hvis de har den idag, men hvis de ikke har den kan de ikke velge den  
  
Den største utfordringen er å teste skjema på “Min side” hvor vi må “fake” matrikkelnummer for å både vise eiendom med og uten den aktuelle beholderen. Se matrikkelnummer over for eiendom som har denne beholderen.

Hvis det er til noen hjelp:  
- på (åpent?) skjema kommer dunkene fra BinSelectElement og getBins()
- for å “fake” matrikkenummer tror jeg du kan gå inn i MinEiendomMediator

