---
Date Created: 2025-09-29T13:11
Underoppgåver:
  - "[[Outlook-API]]"
  - "[[Artikkeltype- Booking]]"
  - "[[Validatorer]]"
  - "[[Lagringsmetoder]]"
Innboks: false
Prosjekt:
  - "[[Databaser/Prosjekt/IVAR]]"
Oppgavestatus: I arbeid
---
#### Oppgåver

|![](https://www.notion.so/icons/font_gray.svg)Name|![](https://www.notion.so/icons/clock_gray.svg)Date Created|![](https://www.notion.so/icons/calendar_gray.svg)Deadline|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Hast|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Hovudoppgåve|![](https://www.notion.so/icons/checkmark-square_gray.svg)Innboks|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Områder|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Prosjekt|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Status|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Type|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Underoppgåver|
|---|---|---|---|---|---|---|---|---|---|---|
|[[Outlook-API]]|30. september 2025 09:10|||[[BookingFacility]]|[ ]|||På vent|||
|[[Artikkeltype- Booking]]|30. september 2025 09:10|||[[BookingFacility]]|[ ]|||I arbeid|||
|[[Validatorer]]|30. september 2025 10:02|||[[BookingFacility]]|[ ]|||I arbeid|||
|[[Lagringsmetoder]]|30. september 2025 10:09|||[[BookingFacility]]|[ ]|||I arbeid|||

  
  

  

  

  

## Outlook API

Offisiell package fra MS:

**[Microsoft Graph SDK for PHP](https://github.com/microsoftgraph/msgraph-sdk-php)**

  

## Artikkeltype: [Ivar] Booking av besøk

Endrede programmatiske navn:

- [ ] `openinghours` → `opening_hours`
- [ ] `googlecalendarID` → `outlook_calendar_ID`
- [ ] `first_calendar_date_days` → `booking_deadline`
- [ ] `bookeddatetimes` → `booked_datetimes`

  

  

## Skjemaoppsett

![[📎 Filer/image 17.png|image 17.png]]

  

  

  

## Skjemamal

![[📎 Filer/image 1 8.png|image 1 8.png]]

  

## Validering av tidspunkt

Validator for `booking-datetime`:

![[📎 Filer/image 2 5.png|image 2 5.png]]

### Gruppetype

![[📎 Filer/image 3 3.png|image 3 3.png]]

  

  

### Lagring

![[📎 Filer/image 4 2.png|image 4 2.png]]

  

## Lagringsmetoder

![[📎 Filer/image 5 2.png|image 5 2.png]]

![[📎 Filer/image 6 2.png|image 6 2.png]]

  

  

### Validatorer

![[📎 Filer/image 7 2.png|image 7 2.png]]

![[📎 Filer/image 8 2.png|image 8 2.png]]