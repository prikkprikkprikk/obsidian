**Slik kan man konvertere eksisterende nettside fra CKEditor 4 til 5.**

I CorePublish 9.2 er CKEditor oppgradert fra versjon 4 til versjon 5.

Den aller største endringen er at editoren ikke lenger er en iframe, men innebygget direkte i DOM.

For å få WYSIWYG til å fungere riktig uten at resten av admin-UI-et blir påvirket, må man dermed sørge for at stilene bare gjelder for `.ck-content`, som er DOM-elementet som viser innholdet i WYSIWYG-felt.

Alle stilene som påvirker dette innholdet finnes i placeholder-en `%articledisplay-main-content` i `assets/scss/shared/components/placeholders/_articledisplay-global.scss`.

Det fungerer derimot ikke å `@extend`-e denne inni `.ck-content`.