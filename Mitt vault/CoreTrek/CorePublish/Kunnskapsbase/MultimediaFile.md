## Arve på Slack

Filestore er et eget API i Multimediaarkivet, dvs at lagring av filer er abstrahert vekk fra selve multimedia-arkivet.

Dermed er det ikke gitt at filen faktisk er tilgjengelig lokalt på filsystemet. Vi har allerede flere implementasjoner hvor dette er tilfellet, bl.a. lagring i S3 (som flere kunder bruker) og også Mysql-basert lagring. Her finnes det ikke noen lokal path.  

Dermed må filestore-providere som støtter lokal readfile implementere og returnere true på `isReadfileSupported()` .

Hvis denne returnerer true så kan du kalle getReadFilePath().  

Hvis du skal ha en safe måte å få fatt i den fysiske filen på, så er det tryggest å bruke `\MultimediaFile::retrieveTemporaryFile()`.

Denne igjen bruker `\FileStoreProvider::retrieveTemporaryFile()`.

Her vil de som lagrer filer feks i S3 automatisk laste ned en lokal kopi til deg.

Men merk at `LocalFsFilestoreProvider` også faktisk lager en kopi på disk til deg, (slik at du skal unngå å rote med den originale filen).

Så hvis du bare skal lese filen, så er det optimale å bruke `isReadFileSupported` og så `getReadFilePath`.
