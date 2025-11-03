1. **SyntheeROI**_**24. august 2024 21:02**_**24. august 2024 21:02**
    
    [![](https://cdn.discordapp.com/role-icons/890142246169636874/b28b57d1c94f0146272ce4a937cf0748.webp?size=20&quality=lossless)](https://cdn.discordapp.com/role-icons/890142246169636874/b28b57d1c94f0146272ce4a937cf0748.webp?size=20&quality=lossless)
    
    - **Disclaimer** Some of these mods may overlap functionality.
    - It has taken me many months of trial and error to achieve stability and performance, and this mod combination is running on several servers, increasing the enjoyment of everyone that plays on them!
    - Add them all! Unless you are running something that is not compatible with anything here (Canary for instance) these mods are all safe to run together.
    - Be sure to configure a few of them. Examples are Dynaview. You will want to customize your minimum view distance, and minimum simulation distance. I personally run view distance Max 8, Min 7, and Simulation Distance Max 8, Min 4. Please also configure SimpleBackups.

  

[Chunk Sending 1.18.2-2.5](https://www.curseforge.com/minecraft/mc-mods/chunk-sending-forge-fabric/files/4519961)

- More seamless server login/teleport/respawn/dimension change, as nearby chunks load first
- Less network strain as chunks are spread out over time, decreasing lag spikes and improving playability for people with slow connections

[Connectivity 1.18.2-3.2](https://www.curseforge.com/minecraft/mc-mods/connectivity/files/3833738)

- Lightweight mod which solves several connection problems like Login-Timeouts, DecoderException, Packet size limits, Ghostblock issues, Payload too large and more. It also offers commands to analyze network traffic and a bunch of debugging utilities, advanced error logging, packet logging etc.

[Cupboard 1.18.2-1.5](https://www.curseforge.com/minecraft/mc-mods/cupboard/files/4691988)

- Library mod required for Chunk Sending, Connectivity, Limited Chunks

[Dynview 1.18.2-2.8](https://www.curseforge.com/minecraft/mc-mods/dynamic-view/files/3814624)

- A lightweight server utility mod to help balancing lag(tps) and chunk view and simulation distance.
- During server lag, view distance and simulation distance get reduced. (Configurable)
- From personal experience, each client will want to install [Farsight](https://www.curseforge.com/minecraft/mc-mods/farsight/files/3810400) to overcome some screen flashing when view distance is changed dynamically

[Lazydfu 1.0-1.18+](https://www.curseforge.com/minecraft/mc-mods/lazy-dfu-forge/files/3544496)

- LazyDFU is an optimization mod that makes the initialization of DataFixerUpper "lazy"

[Let Me Despawn 1.18.x-1.19.x-forge-1.0.3](https://www.curseforge.com/minecraft/mc-mods/let-me-despawn/files/3949688)

- LMD tweaks the despawn check to allow mobs that pick up or equip items from the ground to naturally despawn like any other mob.

[Limited Chunks 1.18.2-2.3](https://www.curseforge.com/minecraft/mc-mods/limited-chunkloading/files/3699151)

- Cleans up loaded chunks (tickets) X minutes after a player logs off
- Also cleans up loaded chunks of mod's chunkloaders, add excluded ones to the config to disable
- Note for VH, Add ChunkyMcChunkFace to exceptions list in config after you install the mod

[Modern Fix 5.18.0+mc1.18.2](https://www.curseforge.com/minecraft/mc-mods/modernfix/files/5399365)

- ModernFix is an all-in-one mod that improves performance, reduces memory usage, and fixes many bugs in modern Minecraft versions

[Radium 0.7.10](https://www.curseforge.com/minecraft/mc-mods/radium-reforged/files/4797490)

- An unofficial fork of Lithium
- I chose Radium over Canary because Canary showed up in crash reports very often. Once I had switched I stopped getting crashes almost completely

[Saturn 1.18.2-0.1.5](https://www.curseforge.com/minecraft/mc-mods/saturn/files/5161844)

- Saturn aims on optimizing memory usage in a lot of ways, such as fixing in-game memory leaks, reducing GC heap and more

[SimpleBackups-1.18.2-1.1.14](https://www.curseforge.com/minecraft/mc-mods/simple-backups/files/3736073)

- This mod is used to create backups.
- Replace FTB Backups. Simple has the same functionality however does Not cause a lag spike while performing Backup operation.
- If you use your host’s built in scheduled backups, you don’t need SimpleBackups OR FTB Backups.

[Starlight 1.0.2](https://www.curseforge.com/minecraft/mc-mods/starlight-forge/files/3667412)

- Forge mod for rewriting the light engine to fix lighting performance and lighting errors

  

**Optimize your Java!**  
Two big things that will help your performance before the mods are your Java arguments, and your Java Distribution.  
These are a little bit tricky to change if you are renting a host, and some hosts don’t allow you to use what they don’t have listed on their panel! If you, however, have access to change your Java distribution, Switch to [GraalVM](https://www.graalvm.org/) I would personally recommend 21, though you can choose to stick with 17. Running it Client side will give a small boost as well.

If you use a pterodactyl system, and have access to add this to your nest, this link includes the [Pterodactyl images](https://github.com/Software-Noob/pterodactyl-images?tab=readme-ov-file). Alternatively, you can open a ticket with your host and ask to have GraalVM 21 added to your list of options and they should be able to do this for you

Java Arguments **Only** if you are using the above mentioned GraalVM distribution of Java.**Do Not Use** if you are using any other Java, it just won’t boot.

`java -Xms7G -Xmx7G -XX:+UnlockExperimentalVMOptions -XX:+EnableJVMCIProduct -XX:-UnlockExperimentalVMOptions -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -Dterminal.jline=false -Dterminal.ansi=true $( [[ ! -f unix_args.txt ]] && printf %s "-jar server.jar" || printf %s "@unix_args.txt" )`

This one needs a little bit of editing to match your server’s available memory. The XMS and XMX should be the same number, and a little bit lower than the amount of memory you have available. If you have 8gb available, set these numbers to 7G. If you have 16 available, set it to 14. Any higher than that, and just remove 4GB from that number, and set both to match it.