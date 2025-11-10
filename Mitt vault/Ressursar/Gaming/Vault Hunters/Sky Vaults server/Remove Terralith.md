How To Remove Terralith From SkyVault Worlds:

1. Create world backups
2. Remove Terralith_v#.#.#.jar from your mods folder.
3. Open NBT editor: [https://irath96.github.io/webNBT/](https://irath96.github.io/webNBT/) and upload level.dat
4. Expand the following:
    1. Data → WorldGenSettings → Dimensions →Minecraft:overworld → Generator
5. Delete biome source by clicking the X "delete tag" option at the top, then save (Ctrl+S)  
    Do not expand “biomes” in “biome_source”. It may lag your computer.
6. Exit NBTexplorer, then load your world once, then exit your world.
7. Load level.dat in NBT editor again.
8. Repeat step 4, this time do not delete biome source.nether.
9. Within “generator”, double click “type: minecraft:noise” within the input box type the_vault:sky_vaults, then save (Ctrl+S).  
    You can now freely enter your world and only void terrain will generate!  
    To remove the normal/"bugged" chunks:
10. Open [https://github.com/Querz/mcaselector](https://github.com/Querz/mcaselector) and open the world folder
11. Delete undesired chunks

  

Also:

![[📎 Filer/Untitled 14.png|Untitled 14.png]]