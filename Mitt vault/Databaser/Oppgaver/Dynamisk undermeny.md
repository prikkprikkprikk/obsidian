---
Prosjekt:
  - "[[TØI nettside 2026]]"
Oppgavestatus: Ferdig
---
- [x] Endre artikkeltype "Nyhet" til "Artikkel", og endre innstillinga på Nyheter-brikka til Artikkel.
## Dynamic submenu tile  
  
This tile is used on article pages as a menu to navigate the site.

The tile depends on all other tiles to be rendered before it. That is why a new placeholder is added to the `standard.html.twig` grid file.

At the top of the grid, all the placeholders are rendered before the layout is created.

```php  
    {% set stretchedContent = grid.getPlaceholderTileHtml('stretched-content') %}    
    {% set contentCenter = grid.getPlaceholderTileHtml('content-center') %}    
    {% set content = grid.getPlaceholderTileHtml('content') %}    
    {% set right = grid.getPlaceholderTileHtml('right') %}    
    {% set centeredBottom = grid.getPlaceholderTileHtml('centered-bottom') %}    
    {% set stretchedBottom = grid.getPlaceholderTileHtml('stretched-bottom') %}    
    {% set mainStretchedContent = grid.getPlaceholderTileHtml('stretched-content-2') %}    
    {# Dynamic sub menu tile needs to be the last to be set. #}    
    {# This to ensure that all tiles in the other placeholders gets registered. #}    
    {% set dynamicSubMenu = grid.getPlaceholderTileHtml('dynamic-sub-menu') %}  
```  
  
### Registering the tile  
  
Each tile you want to add to the dynamic submenu needs to be registered in the individual tile `prepare` method.  
Here is an example:  
```php  
DynamicMenuManager::getInstance()->registerTile(
	'tile-' . $this->getInstanceId(),
	$site->getWord('dynamicsubmenutile.article.link-text')
);
```  
The parameters needed are the tile instance id with the prefix `tile-` and the link text. The reason why you need the `tile-`prefix is to correspond to the tile main html-element id.    

The tiles registered in the dynamic submenu will be rendered in the `dynamic-sub-menu` placeholder.

## ToDo i prod

- [x] Ny brikke: Dynamisk undermeny
- [x] Nye brikkeholdarar i standard-strukturmalen:
	- [x] `dynamic-sub-menu`
		- [x] Mellom `right` og `stretched-bottom`
	- [x] `centered-bottom`
		- [x] Mellom `dynamic-sub-menu`og `stretched-bottom`
- [x] Ny kategorimal: Forskningsområde
	- [x] Brikker i centered-bottom
	     ![[Brikker på forskningsområde.png]]
- [x] Språkstreng: `dynamicsubmenutile.toggle.text`
	- [x] "Innhold på siden" / "Page content"
