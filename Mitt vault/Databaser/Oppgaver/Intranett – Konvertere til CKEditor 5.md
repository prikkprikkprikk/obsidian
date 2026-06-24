**Slik kan man konvertere eksisterende nettside fra CKEditor 4 til 5.**

I CorePublish 9.2 er CKEditor oppgradert fra versjon 4 til versjon 5.

Den aller største endringen er at editoren ikke lenger er en iframe, men innebygget direkte i DOM.

For å få WYSIWYG til å fungere riktig uten at resten av admin-UI-et blir påvirket, må man dermed sørge for at stilene bare gjelder for `.ck-content`, som er DOM-elementet som viser innholdet i WYSIWYG-felt.

## \_articledisplay-global.scss

Alle stilene (i tillegg til standard Bootstrap) som påvirker WYSIWYG-innholdet finnes i placeholder-en `%articledisplay-main-content` i `assets/scss/shared/components/placeholders/_articledisplay-global.scss`.

Det fungerer derimot ikke å `@extend`-e denne inni `.ck-content`, grunnet måten SCSS laster placeholder-e på.

Derfor er den gjort om til en mixin og flyttet øverst i fila, og endret til `@include` i `.main-content` i placeholderen `%articledisplay-global`:

```scss
.main-content {  
  @include articledisplay-main-content;  
}
```

## ck5-wysiwyg.scss

I CP 9.2 finnes det en ny wysiwyg-fil: `ck5-wysiwyg.scss`

I TØI-prosjektet (toi2025) har jeg kommet fram til dette:

```scss
@charset "UTF-8";  
  
/*  
This is the ck5-wysiwyg.scss file containing custom styles used to adjust the appearance  
inside the CKEditor 5 WYSIWYG editor in CorePublish.  
  
IMPORTANT! Make sure to prefix all styles with .ck-content!  
This file is loaded into the main document where the editor is rendered,  
so styles without the .ck-content prefix may affect the entire page content.  
  
Also make sure this file is imported _after_ the base/variables file.  
*/  
  
// Shared variables. These are all defined with `!default`,  
// so they only apply if they are not already defined.  
@import "base/variables";  
  
// Bootstrap's variables file uses some Bootstrap functions, so we need to import them.  
@import "~bootstrap/scss/functions";  
  
// Some of the imported files below use Bootstrap mixins, so we need to import them here.  
@import "~bootstrap/scss/mixins";  
  
// Bootstrap's default variables, also using `!default`.  
@import "~bootstrap/scss/variables";  
  
// Properties are custom vanilla CSS variables.  
// Some of these get their values from SCSS variables,  
// so they must be imported only after these are defined.  
@import "base/properties";  
  
.ck {  
  .ck-content {  
    // Bootstrap's default CSS.  
    @import "~bootstrap/scss/bootstrap";  
  
    // `_articledisplay-global.scss` (below) uses material design iconic font,  
    // so we need to import it here.    @import '../../../node_modules/material-design-iconic-font/scss/material-design-iconic-font';  
  
    // The `articledisplay-main-content` mixin contains styling for the main content area,  
    // which includes styling for the WYSIWYG content (i.e. the normal body text of an article).    @import "../shared/components/placeholders/_articledisplay-global.scss";  
  
    @include articledisplay-main-content;  
  
    // Common WYSIWYG components.  
    @import "components/buttons";  
    @import "components/tables";  
    @import "components/blockquote";  
  
    // Card is used by custom TØI WYSIWYG templates  
    @import "components/card";  
  
    --ck-content-font-family: #{$font-family-base};  
  
    // Override CKEditor's styles for links styled as WYSIWYG template buttons.  
    a {  
      &.btn[href] {  
        color: $ghost;  
        text-decoration: none;  
  
        &.btn-primary:hover {  
          color: $primary;  
        }  
  
        &.btn-secondary:hover {  
          color: $secondary;  
        }  
      }  
    }  
  }  
}
```
