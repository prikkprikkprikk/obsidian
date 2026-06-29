---
Date Created: 2025-08-21T09:32
Hast: Hastar
Innboks: false
Prosjekt:
  - "[[Prosjekt/Sirkula|Sirkula]]"
Oppgavestatus: Ferdig
Type: CoreTrek
Status: Fixed
---
# ToDo

- [x] Finne fram liste med brukere som har problemet
- [x] Sjekke liste opp mot Min Side-skjemaer

  

### KomTek 23. juli

**Roberth Johansen** (Kommunalteknikk)

Roberth Johansen  
Kunderådgiver KOMTEK  
Norkart kundestøtte  
komtek@norkart.no

23. juli 2025, 10:26 CEST

Hei.  Vi har nå ytterligere feilsøkt problemet. Og tror feilen ligger hos dere. Har testet å legge inn et telefonnummer på Sirkula sine sider for et par adresser i Hamar Kommune - Her får vi SMS om at varsel er aktivit og det dukker opp i våre databaser. **Når vi gjør det samme for Stange får vi verken SMS og ingenting dukker opp i våre databaser.**  Jeg har også satt opp en test rig med vår standard kode for dette, med Hamar og Stange kommune. Her fungerer alt som det skal.  Derfor ber vi dere ta kontakt med leverandør av nettsiden og se om det kan være noe feil der.

  

  

### Anastasiia Domkyna (Sirkula) 30. juli

Hei! Disse abonnentene mottar ikke varsler på SMS. Jeg sender informasjonen for å sjekke i Komtek-systemet.

- Løkkevegen 4b, Stange 91576728
- Karlsvognen 73, Hamar 90968971 45088751

> [!important] Hamar fungerer, Stange fungerer ikkje – muligens? NN2 kan vere brukarfeil.

  

### Eyvind 21. august (Slack)

Når det gjelder validering, så må vi skjule feltet “Ditt mobilnummer” og knappen “Bestill SMS-varsling” frem til vi har fått svar fra adresseoppslaget (på samme måte som knappen “Last ned kalender”. Dersom Tømmedager vises, så er adressen gyldig, og da kan brukeren bestille varsling for denne adressen.

Dersom nummeret spesifikt må være med eller uten +47, så bør det nok stå instruksjoner om dette. Jeg er ellers utsikker på om vi kan validere nummeret. Hvis vi ikke kan ta i mot +47, så kan vi kanskje validere at det kun er tall i inputfeltet.

På tross av disse svakhetene, så er det ting som tyder på problemer knyttet til Stange kommune.

Jeg bestilte SMS-varsel til mitt nummer på adressene Dr. Thorshaugs veg 16, Stange og Enerhaugen 90, Stange, men fikk ingen bekreftelse på SMS. Så bestilte jeg SMS-varsling på Fridtjof Nansens gate 35, Hamar og fikk bekreftelse på SMS med en gang.

  

![[📎 Filer/image 14.png|image 14.png]]

```Shell
2025-08-21 15:18:22.39 Anonym:74339    ERROR SmsNotificationSaveHandler.php:126 Requesting URL: https://komteksky.norkart.no/minrenovasjon.api/api/Sms/BestillVarsling?apitoken=7894457A-BBE9-44D6-AED1-7414E0448BB7&api-version=1.0
2025-08-21 15:18:22.39 Anonym:74339    ERROR SmsNotificationSaveHandler.php:127 Request Payload: {"landkode":47,"mobilnr":"95881009","varselAntallDager":1,"klokkeslett":"19.00","adresse":"Dr. Thorshaugs veg 16, Stange","gid":false}
2025-08-21 15:18:22.39 Anonym:74339    ERROR SmsNotificationSaveHandler.php:133 HTTP Status Code: 200
2025-08-21 15:18:22.39 Anonym:74339    ERROR SmsNotificationSaveHandler.php:134 Response: false
```

  

![[📎 Filer/image 1 7.png|image 1 7.png]]

```Shell
2025-08-21 15:28:24.43 Anonym:56273    ERROR SmsNotificationSaveHandler.php:126 Requesting URL: https://komteksky.norkart.no/minrenovasjon.api/api/Sms/BestillVarsling?apitoken=7894457A-BBE9-44D6-AED1-7414E0448BB7&api-version=1.0
2025-08-21 15:28:24.43 Anonym:56273    ERROR SmsNotificationSaveHandler.php:127 Request Payload: {"landkode":47,"mobilnr":"95881009","varselAntallDager":1,"klokkeslett":"19.00","adresse":"Fridtjof Nansens gate 35, Hamar","gid":false}
2025-08-21 15:28:24.43 Anonym:56273    ERROR SmsNotificationSaveHandler.php:133 HTTP Status Code: 200
2025-08-21 15:28:24.43 Anonym:56273    ERROR SmsNotificationSaveHandler.php:134 Response: true
```

  

![[📎 Filer/image 2 4.png|image 2 4.png]]

```Shell
2025-08-21 15:29:42.74 Anonym:76313    ERROR SmsNotificationSaveHandler.php:126 Requesting URL: https://komteksky.norkart.no/minrenovasjon.api/api/Sms/BestillVarsling?apitoken=7894457A-BBE9-44D6-AED1-7414E0448BB7&api-version=1.0
2025-08-21 15:29:42.74 Anonym:76313    ERROR SmsNotificationSaveHandler.php:127 Request Payload: {"landkode":47,"mobilnr":"","varselAntallDager":1,"klokkeslett":"19.00","adresse":", ","gid":false}
2025-08-21 15:29:42.74 Anonym:76313    ERROR SmsNotificationSaveHandler.php:133 HTTP Status Code: 400
2025-08-21 15:29:42.74 Anonym:76313    ERROR SmsNotificationSaveHandler.php:134 Response: {"type":"https://tools.ietf.org/html/rfc9110\#section-15.5.1","title":"One or more validation errors occurred.","status":400,"errors":{"$.mobilnr":["The JSON value could not be converted to System.Int32. Path: $.mobilnr | LineNumber: 0 | BytePositionInLine: 27."]},"traceId":"00-36231d0369396df2d1161edb41f908f1-ba564e7b2c07dacf-00"}
```

  

![[📎 Filer/image 3 2.png|image 3 2.png]]

```Shell
2025-08-21 15:30:24.23 Anonym:276      ERROR CtBase.php:189                  CoreTrek\Sirkula\RecyclingStation\Tiles\WhatNeedToThrowAdvanced\WhatNeedToThrowAdvancedSearchTile: Required parameters 'slug, key, title' is not set
2025-08-21 15:30:33.06 Anonym:95299    ERROR SmsNotificationSaveHandler.php:126 Requesting URL: https://komteksky.norkart.no/minrenovasjon.api/api/Sms/BestillVarsling?apitoken=7894457A-BBE9-44D6-AED1-7414E0448BB7&api-version=1.0
2025-08-21 15:30:33.06 Anonym:95299    ERROR SmsNotificationSaveHandler.php:127 Request Payload: {"landkode":47,"mobilnr":"95881009","varselAntallDager":1,"klokkeslett":"19.00","adresse":"Enerhaugen 90, Stange","gid":false}
2025-08-21 15:30:33.06 Anonym:95299    ERROR SmsNotificationSaveHandler.php:133 HTTP Status Code: 200
2025-08-21 15:30:33.06 Anonym:95299    ERROR SmsNotificationSaveHandler.php:134 Response: false
```

  

#### Brukere med SMS-problemer

| Name                    | Files & media     | Phone Number | Email             | Adresse                         |
| ----------------------- | ----------------- | ------------ | ----------------- | ------------------------------- |
| [[Julie Kirkeng]]       | ![[image002.png]] | 95494648     | julie@kirkeng.net | Rundvegen 11, Stange, 2312      |
| [[Bjørn Megaard]]       | ![[image001.png]] | 90797255     | bjorn@megaard.net | Vardebergvegen 37, Stange, 2337 |
| [[NN]]                  |                   | 91576728     |                   | Løkkevegen 4b, Stange           |
| [[NN2]]                 |                   | 90968971     |                   | Karlsvognen 73, 2315 Hamar      |
| [[Kristian Osmundsvåg]] |                   | 45088751     |                   | Karlsvognen 73, 2315 Hamar      |

## Potensielle årsaker

- Feil med skjemaet? Ingen av dei som har meldt frå om manglande varsel har vore innlogga på Min Side.
- Før 27. mai var varsel satt opp til å bli sendt 365 dagar før …! [https://scm.coretrek.no/Konsulent/sirkula/-/commit/c9ae80f5e2d3bc8904eb741187f20583d35cd540](https://scm.coretrek.no/Konsulent/sirkula/-/commit/c9ae80f5e2d3bc8904eb741187f20583d35cd540)
- Brukarforvirring? Det er ingen tilbakemeldingar på at adressefeltet må vere fylt ut før ein sender inn skjemaet.
- Brukarfeil? Det er ikkje noko slags validering av skjemaet.

  

# Ting å fikse

## Validering av SMS-skjemaet

Det er ikkje noko som helst slags validering av SMS-varsel-skjemaet!

Ein kan oppgi kva som helst som telefonnummer, og det blir sendt inn og går til sida med “**Takk for din henvendelse "Bestill varsel om tømming på mobil"**.