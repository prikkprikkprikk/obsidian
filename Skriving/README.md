# Skriving — Obsidian-kvelv

Dette er ein Obsidian-kvelv (vault) bygd automatisk frå «Skriverier»-mappa på Proton Drive. Alt som såg ut som tekst du har skrive sjølv er henta ut og konvertert til Markdown, med mappestrukturen frå originalen bevart.

## Kva er her

- **Scrivener-prosjekt** (18 stk) er spegla som mapper. Kvar binder-node blir ein `.md`-fil, med synopsis og notat lagt inn som eigne seksjonar under sjølve teksten:

  ```
  # Tittel

  > Breadcrumb › Under-mappe › Denne

  Sjølve teksten …

  ---

  ## Synopsis
  …

  ---

  ## Notatar
  …
  ```

- **Karakter- og stadsark** frå Scrivener er henta ut som eigne filer (t.d. `Peter/Peter/Karakterer/Absurr.md`). Heilt tomme malkort er hoppa over; kort med berre éin detalj (som «Yrke: Legesekretær») er behaldne.
- **Lause filer** — `.md`, `.txt`, `.rtf`, `.pdf` og gamle Word-dokument (`.doc` eller utan etternamn) — er konverterte med beste evne.
- **Notater og synopsar** frå Scrivener ligg inne i same fila som teksten dei høyrer til, under eigne overskrifter.

## Kva er hoppa over

- Scrivener-metadata (`binder.scrivproj`, `.scrivx`, `info.plist`, `ui.xml`, kompileringsoppsett osv.)
- `QuickLook/`, `Settings/`, `Snapshots/`, `ProjectNotes/` og liknande interne mapper
- `Trash/` og `Template Sheets/` i kvart prosjekt
- Reine bilete, InDesign-filer, `.DS_Store` og andre binære filer
- Tomme malkort for karakter/stad

## Oversikt over innhaldet

Større samlingar i rota:

- **`Peter/`** — «Peters absurde dag», barneboka. Full manus + karakter/stad-kort + forsking + bilete-notat.
- **`Dikt/`**, **`Dikt Backup/`**, **`Dikt Backup-1/`** — dikt-samlingar i fleire generasjonar.
- **`Kortprosa/`** — kortprosa-tekstar.
- **`Blogging/`**, **`Blogging Backup/`** — blogginnlegg og kladdar.
- **`Brubyggjaren/`**, **`Evitare/`**, **`Hørespill/`** — andre prosjekt.
- **`Bokideer/`**, **`Ideer/`**, **`Inspirasjon/`** — idé-samlingar.
- **`Den mørke kjelleren/`** — prosjekt.
- **`FL/`**, **`PPT/`**, **`Underskog/`** — eldre samlingar.
- **`Scrivener Scratch Pad/`** — laust småstoff.

## Duplikatar med `(1)` i namnet — må slettast manuelt

**Dette er viktig.** Proton Drive-mountet eg jobbar mot tillét ikkje sletting av filer. Første gong eg køyrte konverteringa oppstod det 300 duplikatar på forma `Fila (1).md` ved sida av den opphavlege `Fila.md`. Eg fekk ikkje fjerna dei, så som arbeidsløysing har eg synkronisert innhaldet: alle `(1)`-filene har no nøyaktig same innhald som originalen, slik at det er trygt å slette anten `(1)`-settet eller originalane utan å mista data.

**Kva du bør gjera:**

1. Opna `Skriving`-mappa i Finder.
2. Bruk Finder sitt søk (Cmd+F) inni mappa og søk etter `(1)` i filnamnet — avgrens søket til «Skriving».
3. Merk alle treffa, høgreklikk → flytt til papirkorga.

Full liste over dei 300 duplikatfilene ligg i `.duplicates-to-delete.txt` i rota av kvelven (skjult fil — slå på visning av skjulte filer med Cmd+Shift+. i Finder om du vil sjå ho). Slett denne fila òg når du er ferdig.

## Konverteringsstatistikk (siste køyring)

| | |
|---|---|
| Scrivener-prosjekt | 18 |
| Dokument skrivne | 305 |
| Hoppa over (tomme malkort) | 10 |
| Hoppa over (tomme mapper) | 16 |
| Lause `.md` kopierte | 2 |
| `.txt` konverterte | 1 |
| `.rtf` konverterte | 5 |
| `.pdf`-tekst henta ut | 4 |
| `.doc` konverterte | 3 |
| Hoppa over (binærfiler) | 17 |
| Feil | 0 |

## Teknisk, om du er nysgjerrig

- RTF → Markdown med `pandoc -f rtf -t markdown-raw_html-simple_tables-...` (fall tilbake til `striprtf` om pandoc feilar).
- `.doc` (Word 97/2000 OLE) er parsa direkte i Python via `olefile` — las `WordDocument`-strøymen, henta `fcMin`/`fcMac` frå FIB og dekoda som cp1252. Grovt, men hentar fram teksten.
- Scrivener sine gamle `binder.scrivproj` er binær NSKeyedArchiver-plist — løyst opp med eigen walker over `$objects`.
- Dei nyare `.scrivx`-prosjekta er vanleg XML og greie å lesa.

## Etter rydding

Når du har sletta `(1)`-filene og `.duplicates-to-delete.txt`, er kvelven klar til å opnast i Obsidian. Peik Obsidian på `~/Obsidian/Skriving` om det ikkje alt er gjort, og du har heile skrive-arkivet søkbart og linkbart på eitt sted.
