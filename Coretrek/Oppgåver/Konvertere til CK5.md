---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: Ferdig
---
[[Intranet article – Convert to CKEditor 5]]


**Dmitriy:**
Jeg ser at assets/scss/public/wysiwyg.scss importerer ../shared/wysiwyg. Dette er den gamle basisfilen for CK4, som som standard inkluderer hele Bootstrap + alle basisstilene.  
  
I tillegg legger den importene inn under .cke_editable, slik at vi ender opp med CSS som for eksempel .ck .ck-content .cke_editable. Det vil ikke fungere i CK5, siden cke_editable ikke lenger er en standardklasse der.  
  
Ta heller utgangspunkt i sitecomponents/assets/scss/shared/ck5-wysiwyg.scss / sitecomponents/assets/scss/public/ck5-wysiwyg.scss. Den importerer ikke basisstilene som Bootstrap osv., siden disse allerede er lastet inn i hoveddokumentet.  
  
Deretter kan dere legge til de egendefinerte importene som trengs, for eksempel:  
@import "components/card";  
@import "components/buttons";  
og tilsvarende andre komponenter.  
  
Bygg deretter CSS-filen og pek CK5-oppsettet til den nye filen, for eksempel:  
  
/ck5-wysiwyg.min.css  
  
Jeg er ikke helt sikker på at alle stilene vil fungere korrekt uten videre, men da blir i hvert fall strukturen riktig, og stilene bør ikke påvirke resten av siden.  
  
Problemet nå er at wysiwyg.min.css laster inn basisstiler fra den gamle CK4-malen. (edited) 

**Jørn:**

Eit stort problem er at mange av SC-stilane begrensar seg til klasser som `.articledisplay .maincontent`, som gjer at det ikkje funkar å importere dette inn i `.ck-content` , som ikkje har `.articledisplay`-klassen …

Eller korleis funkar dette i standard SC no i 9.2 …?

**Dmitriy:**

I CK5 har vi ikke brukt stilene fra articledisplay. De er samtidig delvis migrert inn i basissettet her:  
corepublish/assets/scss/corepublish/components/ckeditor5/_ckeditor5-custom.scss  
  
Derfor brukes ikke disse importene i ck5-wysiwyg:  
@import 'components/placeholders/articledisplay-global';  
@import 'components/articledisplay-wysiwyg';  
@import 'components/articledisplay-details';  
  
Jeg er litt usikker her, så hvis dere ser at noen konkrete stiler mangler i praksis, gi meg gjerne beskjed.

Dessverre var det ikke mulig å migrere CSS-stilene automatisk i dette tilfellet. Hovedgrunnen er at CK5 renderer innholdet på en helt annen måte.  
  
I tillegg er source-koden som CK5 lagrer og som til slutt vises på nettsiden, ikke nødvendigvis den samme som HTML-strukturen som brukes inne i editoren for å vise de samme elementene. Derfor ville det heller ikke gitt forventet resultat å automatisk bytte ut selektorer i CSS-en fra gamle CK4-selektorer til nye CK5-selektorer.  
  
Det samme gjelder eventuelle egendefinerte plugins. Hvis slike finnes, må de migreres manuelt.  
  
Vi støtter fortsatt CK4, så hvis kunden er veldig avhengig av egendefinert kode rundt editoren, kan de eventuelt gå tilbake til CK4 frem til CK5-versjonen er tilpasset.

**Litt om hvordan CK5 fungerer «under panseret», for kontekst:**  
  
CK4 redigerte i praksis HTML-en direkte (contenteditable på rå HTML inne i en iframe). CK5 fungerer ikke slik. CK5 har sin egen abstrakte modell – et semantisk dokumenttre som er den eneste «sannheten». Fra denne modellen konverteres innholdet til to forskjellige representasjoner:  
  
* **Editing view** – DOM-en som vises inne i editoren. Den er optimalisert for redigering og inneholder ekstra wrappers, widget-markup og `.ck-*`-klasser. Et bilde blir for eksempel til `<figure class="image ck-widget ...">` med ekstra elementer rundt slik at det kan markeres, flyttes osv.  
* **Data / output** – HTML-en som `editor.getData()` produserer, og som lagres og vises på nettsiden. Denne er «ren» semantisk HTML, uten `.ck`-klasser og widget-wrappers.  
  
Modellen blir altså downcastet til editing view på én måte og til lagret output på en annen. Derfor er kildekoden som lagres ikke den samme strukturen som du ser inne i editoren. Det samme elementet (bilde, lenke, tabell, liste osv.) kan ha ulik markup på de to stedene.  
  
Det er nettopp derfor man ikke bare kan «bytte ut CK4-selektorer med CK5-selektorer». CSS som treffer editoren (`.ck-content`, `.ck-widget` osv.) er ikke den samme som CSS som treffer det publiserte resultatet. Hvis begge skal se like ut, må stilene tilpasses begge representasjonene manuelt.