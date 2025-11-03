[[Remove Terralith]]

1. Temporarily disable Terralith on your Vault Hunters _client_ e.g. by moving it out of your `mods` folder.
2. Generate a world on the client and make sure to set the “World Type” to “Sky Vaults” under “More World Options…”. **Make sure that the spawn is not in an ocean biome**, otherwise you will run into issues later on, e.g. having to move potentially thousands of blocks to find a biome that can spawn passive animals.
3. Client-side that’s all you have to do, you can re-enable Terralith now.
4. If your server is running, stop it.
5. Remove the Terralith mod from the server. _You will have to make sure to do this after every pack update_.
6. Delete or move your existing world from the _server_ folder. It should be called `world` by default, otherwise check your [`server.properties`](http://server.properties) for the `level-name`.
7. Copy the world you generated in step 2 from your client to your server folder. You will find it in `saves`.
8. Rename the copied world to whatever your world was called in step 6.
9. Edit `server.properties` and set `level-type` to `the_vault:sky_vaults`. This is currently not needed, but better be safe than sorry. (Note: The server will probably change this to `the_vault\:sky_vaults`. That is just unnecessary escaping and no reason to panic.)
10. Start the server and make sure there aren’t any errors that stop it from working.
11. Log into the server. You should find yourself on a lone island in the void.
12. Go into creative mode and fly a couple hundred blocks out to make sure everything is working properly. You should not run into any generated terrain.

Congratulations, you now have a working Sky Vaults server!