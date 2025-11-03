- Last ned siste versjon av Forge for rett Minecraft-versjon:
    
    > [!info] Minecraft Forge downloads  
    > Downloads for Minecraft Forge for Minecraft 1.  
    > [https://files.minecraftforge.net/net/minecraftforge/forge/index_1.18.2.html](https://files.minecraftforge.net/net/minecraftforge/forge/index_1.18.2.html)  
    
    - Lagre i crafty-brukaren si heimemappe
- Opprett server i Crafty
- `ssh crafty`
- `cd [ny server]`
- `java -jar ~/forge-1.18.2-40.2.1-installer.jar --installServer`
- `rm forge*` (treng ikkje forge-server-jar-filer i rotmappa lenger)
- Endre config i Crafty:
    - **Server executable:** `run.sh`
    - **Server execution command:** `./run.sh`
- Rediger user_jvm_args.txt for å sette min/max ram:
    
    ```Shell
    # Xmx and Xms set the maximum and minimum RAM usage, respectively.
    # They can take any number, followed by an M or a G.
    # M means Megabyte, G means Gigabyte.
    # For example, to set the maximum to 3GB: -Xmx3G
    # To set the minimum to 2.5GB: -Xms2500M
    -Xms4G
    
    # A good default for a modded server is 4GB.
    # Uncomment the next line to set it.
    -Xmx8G
    ```
    
- Rediger run.sh så den brukar siste java-versjon  
    (husk å bruke riktig forge-versjon i stien):
    
    ```Shell
    #!/usr/bin/env sh
    # Forge requires a configured set of both JVM and program arguments.
    # Add custom JVM arguments to the user_jvm_args.txt
    # Add custom program arguments {such as nogui} to this file in the next line before the "$@" or
    #  pass them to this script directly
    /usr/java/latest/bin/java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.18.2-40.2.9/unix_args.txt "$@"
    ```
    
- Last opp VH serverfiler
- Start server!