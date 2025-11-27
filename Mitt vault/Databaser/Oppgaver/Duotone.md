---
Prosjekt:
  - "[[Databaser/Prosjekt/IVAR]]"
Oppgavestatus: Ferdig
---

https://yoksel.github.io/svg-gradient-map/

```html
<svg style="position: absolute; width: 0; height: 0;">  
    <defs>
		<filter id="sea" x="-10%" y="-10%" width="120%" height="120%" filterUnits="objectBoundingBox" primitiveUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
			<feColorMatrix type="matrix" values=".33 .33 .33 0 0
		            .33 .33 .33 0 0
		            .33 .33 .33 0 0
		            0 0 0 1 0" in="SourceGraphic" result="colormatrix"/>
			<feComponentTransfer in="colormatrix" result="componentTransfer">
		    		<feFuncR type="table" tableValues="0 0.16 0.08 1"/>
				<feFuncG type="table" tableValues="0 0.37 0.78 1"/>
				<feFuncB type="table" tableValues="0 0.94 0.55 1"/>
				<feFuncA type="table" tableValues="0 1"/>
		  	</feComponentTransfer>
			<feBlend mode="normal" in="componentTransfer" in2="SourceGraphic" result="blend"/>
		</filter>
	</defs>
</svg>
```



```php
function hexToTableValue(hex) {  
  // Remove # if present  
  hex = hex.replace('#', '');  
    
  // Parse RGB  
  const r = parseInt(hex.substr(0, 2), 16) / 255;  
  const g = parseInt(hex.substr(2, 2), 16) / 255;  
  const b = parseInt(hex.substr(4, 2), 16) / 255;  
    
  return { r, g, b };  
}  
  
// Example: ['#000000', '#000046', '#8cffc8', '#ffffff']  
const colors = ['#000000', '#000046', '#8cffc8', '#ffffff'];  
const values = colors.map(hexToTableValue);  
  
const tableR = values.map(v => v.r).join(' '); // "0 0 0.549 1"  
const tableG = values.map(v => v.g).join(' '); // "0 0 1 1"  
const tableB = values.map(v => v.b).join(' '); // "0 0.275 0.784 1"
```

