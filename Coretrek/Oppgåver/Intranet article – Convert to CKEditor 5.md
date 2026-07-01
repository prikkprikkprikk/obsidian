# How to convert from CKEditor 4 to 5

In CorePublish 9.2, the CKEditor has been upgraded from version 4 to version 5.

The biggest change is that the editor no longer is an iframe, but is embedded in the CP Admin DOM.

To ensure the WYSIWYG CSS only affects the editor and not the rest of the admin UI, we have to make sure the styles only apply to the `.ck-content` div, which is the DOM element containing the WYSIWYG content.

## All SCSS variables in shared/base/\_variables should be !default

To ensure that theme variables are correctly overridden, make sure all variables in shared/base/\_variables are defined as `!default`.

### Material Design Iconic Font location variables

The Material Design Iconic Font location variables should be moved into the `shared/base/\_variables.scss` file, instead of defining them in the `shared/style.scss` and `shared/wysiwyg.scss` files.

```css
/* ------------------------------------------------------------------------- */
/* Material Design Iconic Font location */
/* ------------------------------------------------------------------------- */

$zmdi-font-path: "../../../node_modules/material-design-iconic-font/dist/fonts/" !default;
$md-font-path: "../../../node_modules/material-design-iconic-font/dist/fonts/" !default;
```

## \_articledisplay-global.scss

All the styles (in addition to standard Bootstrap) pertaining to the WYSIWYG content is located inside the SCSS placeholder `%articledisplay-main-content` in the file `assets/scss/shared/components/placeholders/_articledisplay-global.scss`.

However, `@extend`-ing this inside `.ck-content` does not work, due to the way SCSS loads placeholders.

Therefore, the placeholder has been converted to a mixin and moved to the top of the file.

Then, it is converted to @include instead of @extend down below:

```scss
%articledisplay-global {
  [...]

  .main-content {  
    @include articledisplay-main-content;  
  }

  [...]
}
```

The placeholder is also in use in the file `assets/scss/shared/components/_articledisplay-wysiwyg.scss` and need to be changed to a mixin there too, if CKEditor 4 support is needed.

## ck5-wysiwyg.scss

CP 9.2 introduces a new WYSIWYG file: `ck5-wysiwyg.scss`

As the main comment says: It is important that this file is included _after_ each theme's `base/variables` file in each theme (we'll get to that).

In the TØI project (toi2025) I've ended up with this:

```scss
@charset "UTF-8";  
  
/*  
This is the shared ck5-wysiwyg.scss file containing custom styles used to  
adjust the appearance inside the CKEditor 5 WYSIWYG editor in CorePublish.
  
IMPORTANT! Make sure to prefix all styles with .ck-content!  
This file is loaded into the main document where the editor is rendered,  
so styles without the .ck-content prefix may affect the entire page content.  
  
Make sure this file is imported _after_ the base/variables file in each theme.
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
// Many of these get their values from SCSS variables,  
// so they must be imported only after these are defined.  
@import "base/properties";  

// The .ck selector is needed to properly override CKEditor 5 WYSIWYG editor styles.
.ck {  
  .ck-content {  
    // Bootstrap's default CSS.  
    @import "~bootstrap/scss/bootstrap";  

    // `_articledisplay-global.scss` (below) uses the material design iconic font  
    // for bullet list, so we need to import it here.
    @import '../../../node_modules/material-design-iconic-font/scss/material-design-iconic-font';  

    // The `articledisplay-main-content` mixin contains styling for the main content area,  
    // which includes styling for the WYSIWYG content (i.e. the normal body text of an article).
    // This used to be a placeholder, `%articledisplay-main-content`, but has been converted  
    // to a mixin because of the way SCSS works, otherwise it would not override  
    // Bootstrap's default CSS that we import above.  
    @import "../shared/components/placeholders/_articledisplay-global.scss";  
    @include articledisplay-main-content;  

    // Common WYSIWYG components.  
    @import "components/buttons";  
    @import "components/tables";  
    @import "components/blockquote";  
  
    // Card is used by custom TØI WYSIWYG templates  
    @import "components/card";  
  
    --ck-content-font-family: #{$font-family-base};  
  
    // Override CKEditor's a[href] styles for links styled as buttons (WYSIWYG template buttons).
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

## Tables

CKEditor's table styles are quite specific, so we need to make them even more specific.
### assets/scss/shared/components/\_tables.scss

```css
table.table:not(.layout-table) {  
  border: none;  
  
  & > thead,  
  & > tbody {  
    & > tr {  
      & > th,  
      & > td {  
        background: transparent;  
        border: none;  
        padding: .75rem;  
      }  
    }  
  }  
  
  & > thead {  
    & > tr {  
      & > th {  
        border-bottom: 1px solid $table-border-color;  
      }  
    }  
  }  
  
  & > tbody {  
    & > tr {  
      & > th {  
        border-right: 1px solid $table-border-color;  
      }  
    }  
  }
```


### assets/scss/public/components/tables.scss

```css
table.table:not(.layout-table) {
  & > thead {
    & > tr {
      & > th {
        border-bottom: 2px solid $primary;
      }
    }
  }
```


## \[theme]/ck5-wysiwyg.scss

Each theme should also have their own `ck5-wysiwyg.scss` file.

Here, you may include any components and other custom changes for that theme.

It might look something like this (again, from TØI, the `public` theme):

```scss
@charset "UTF-8";  
  
// Import all the SCSS variables defined in this theme.  
@import 'base/variables';  
  
// Import shared WYSIWYG variables and styles.  
@import "../shared/ck5-wysiwyg";  
  
.ck {  
  .ck-content {  
    // Components with additional custom styles for this theme.  
    @import "components/buttons";  
    @import "components/tables";  
    @import "components/blockquote";  
  
    // Card is used by custom TØI WYSIWYG templates.  
    @import "components/card";  
  
    --ck-color-base-background: #{$body-bg};  
  }  
}
```

## webpack.config.js

In the webpack.config.js file, add the `ck5-wysiwyg` files as output entries for each theme:

```js
entry: {  
  style: [  
    path.join(publicCssAssetsDir, "/style.scss")  
  ],  
  styleprint: [  
    path.join(publicCssAssetsDir, "/styleprint.scss")  
  ],  
  'ck5-wysiwyg': [  
    path.join(publicCssAssetsDir, "/ck5-wysiwyg.scss")  
  ]  
},
```

As we need to set the output CSS filename in the WYSIWYG configuration in CorePublish, we need to make sure we don't add a content hash. So for MiniCssExtract, add an if clause:

```js
  new MiniCssExtract({  
    filename: function(file) {  
      if (file.chunk && file.chunk.name === "ck5-wysiwyg") {  
        return "[name].min.css";  
      }  
      return developmentEnv ? "[name].min.css" : "[name].[contenthash:8].min.css";  
    },  
  }),
```

For TØI, I've also removed the old `wysiwyg` entries, but it's safe to leave them (and even recommended if there's a chance the client ever should need to go back to CKEditor 4).

## assets/scss/shared/components/\_articledisplay-wysiwyg.scss

… can be deleted, as it is not in use.