---
Date Created: 2024-11-20T15:56
Innboks: false
Prosjekt:
  - "[[rwatch]]"
Status: I arbeid
---
- Viss ingen config-fil og ingen argument:
    - Vise melding om manglande fil, og spørsmål om ein vil opprette fila.
        - Viss **ja**, får ein spørsmål om:
            - Server og brukarnamn
                - Kan eventuelt velge server frå ~/.ssh/config?
                    - Lage test/klasse for lesing/parsing av denne
            - Prosjektnamn: Når server/brukarnamn er lagt inn, må ein velje kva slags måte ein skal laste prosjekt på.
                - symlenker i ei mappe
                - tekstfil
                - eigendefinert
        - Viss **nei**, får ein beskjed om at ein må oppgje argument.

```Plain
DWATCH – automatically ssh into a server, cd to a project and execute `npm run watch`.

Missing both command line arguments and config file.

Would you like to run the wizard to create the config file?

[YES] [NO/CANCEL]
```

> [!info]  
>  
> [https://www.mermaidchart.com/app/projects/9bd6323b-2d2f-4421-afb5-9a8cc127593c/diagrams/8cc1c921-7dfb-4e1a-8233-14f203ecdcd0/version/v0.1/edit](https://www.mermaidchart.com/app/projects/9bd6323b-2d2f-4421-afb5-9a8cc127593c/diagrams/8cc1c921-7dfb-4e1a-8233-14f203ecdcd0/version/v0.1/edit)  

[https://www.mermaidchart.com/raw/8cc1c921-7dfb-4e1a-8233-14f203ecdcd0?theme=light&version=v0.1&format=svg](https://www.mermaidchart.com/raw/8cc1c921-7dfb-4e1a-8233-14f203ecdcd0?theme=light&version=v0.1&format=svg)