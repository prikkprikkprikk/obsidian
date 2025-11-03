```SQL
---
config:
---
flowchart TB
    Start(("run dwatch")) --> CLAsGiven{{"Command line arguments for **server** and **username** given?"}}
    CLAsGiven -- Both --> HydrateAppState["Hydrate AppState"]
    CLAsGiven -- One --> ConfigFileExists2{{"Config file exists?"}}
    CLAsGiven -- None --> ConfigFileExists{{"Config file exists?"}}
    ConfigFileExists -- Yes --> ReadConfigFile[/"Read config file"/]
    ConfigFileExists -- No --> askToCreateConfig{{"Prompt: Create config file?"}}
    ConfigFileExists2 -- Yes --> ReadConfigFile
    ConfigFileExists2 -- No --> MissingCLA["Display missing CLA message"]
    askToCreateConfig -- Yes --> promptForServer["Ask for server name"]
    askToCreateConfig -- No --> Exit((("Exit")))
    promptForServer --> promptForUsername["Ask for username"]
    promptForUsername --> writeToConfigFile["Write to config file"]
    writeToConfigFile --> HydrateAppState
    ReadConfigFile --> ValidateConfigFile{{"Config valid?"}}
    ValidateConfigFile -- Yes --> HydrateAppState
    ValidateConfigFile -- No --> Exit
    HydrateAppState --> SSHintoServer["SSH into server"]
    SSHintoServer --> Exit
    MissingCLA --> Exit
    promptForServer@{ shape: sl-rect}
    promptForUsername@{ shape: sl-rect}
    writeToConfigFile@{ shape: lin-cyl}
```

  

[https://www.mermaidchart.com/raw/8cc1c921-7dfb-4e1a-8233-14f203ecdcd0?theme=light&version=v0.1&format=svg](https://www.mermaidchart.com/raw/8cc1c921-7dfb-4e1a-8233-14f203ecdcd0?theme=light&version=v0.1&format=svg)