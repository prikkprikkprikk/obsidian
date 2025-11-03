## Oppdatere til update 6h

Copy from client to server and overwrite everything:

- Config
- Scripts
- patchouli_books

Copy the following mods from V6H Client to server, and delete the old versions:

- the_vault
- sophisticatedcore
- sophisticatedbackpacks
- ispawner
- auxilaryblocks

You should then be good on server side. We still recommend you wait for server files though if unsure what you're doing.

## Oppdatere til update 6

1) Update your client

2) Replace the following folders and files on your server with the folders from your client

\config

\defaultconfig

\mods

\patchouli_books

\scripts

patchouli_data.json

3) Remove the following mods from the server

torohealth-1.18-forge-2.jar

LegendaryTooltips-1.18.2-1.3.1.jar

textrues_rubidium_options-1.0.3-mc1.18.2.jar

rubidium-0.5.4.jar

RubidiumExtra-1.18.2-0.4.11.45.jar

rubidium_extras-1.18.2_v1.3.2.jar

  

## Oppdatere til update 5

Forge 40.1.93

- [ ] Stoppe server
- [ ] Klone server
- [ ] SSH til server som crafty
    - [ ] `ssh crafty`
- [ ] Laste ned serverfiler til ~

```Shell
curl https://maven.minecraftforge.net/net/minecraftforge/forge/1.18.2-40.1.93/forge-1.18.2-40.1.93-installer.jar -o ~/forge-1.18.2-40.1.93-installer.jar
```

- [ ] cd til ny server-rotmappe
- [ ] Installere ny forge

```Shell
java -jar ~/forge-1.18.2-40.1.93-installer.jar --installServer
```

- [ ] Laste ned server pack fra CurseForge lokalt
    - [ ] Slette rubidium fra mods
- [ ] FTP til server som crafty
- [ ] Laste opp nye serverfiler til ny server
- [ ] Redigere run.sh i server root dir, erstatte `java` med `/usr/java/latest/bin/java` .
- [ ] Starte server

## Oppdatere til update 4

  

Download Server pack Update 4  
Stop your server  
Delete the following folders from your server;  
🔹 Mods  
🔹Config  
🔹defaultconfigs  
🔹patchouli_books  
🔹scripts

Copy the following folders from the server pack to your server  
🔹Mods  
🔹Config  
🔹defaultconfigs  
🔹patchouli_books  
🔹scripts

Start Server.