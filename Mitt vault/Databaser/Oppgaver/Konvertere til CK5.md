---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: I arbeid
---
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
