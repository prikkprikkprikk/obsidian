## Estimat

| Oppgave                       | Hva må gjøres                                                         | Timeestimat |
| ----------------------------- | --------------------------------------------------------------------- | ----------: |
| Research og estimat           | Sjekke eksisterende funksjonalitet og kode, estimere                  |           2 |
| Oppsett                       | Installere hos meg på dev22                                           |           1 |
| Endringer i brukergrensesnitt | - Endre språkstrenger<br>- Endre HTML (twig)<br>- Endre CSS           |           2 |
| Endringer i kalkulator-kode   | Legge inn stillingsvalg for Industri/Privat/Ideell/Øvrige à la Apotek |           5 |
| **Totalt**                    |                                                                       |      **10** |

## ToDo
- [ ] 

## ToDo i staging/prod
- [ ] Språkstrengar
	- [ ] 


## Legge inn stillingsvalg for Industri/Privat/Ideell/Øvrige à la Apotek

Hvis man velger *Apotek*, får man også opp valg for stilling.

De ønsker nå tilsvarende for *Industri/Privat/Ideell/Øvrige*, og lurer på om det går an å ordne det slik at dette kan oppdateres automatisk basert på regnearkverdiene.

Svaret er: Ja, men da er de nødt til å sørge for at **Stilling** er oppgitt for alle rader.

**Spørsmål:** Hvordan feilsjekker vi og håndterer eventuelle feil i regnearket?

**Spørsmål:** Hvorfor er filnavnet (kalkyl.xlsx) hardkodet? Hvorfor bare multimedia-mappe som innstilling, ikke fil?

```php
case self::METHOD_GET_SALARIES:  
    if ($this->businessType == "Apotek") {  
        try {  
            $salaryInformation = $salaryCalculator->getSalariesPharmacy(  
                $this->businessType,  
                $this->degree,  
                $this->graduationYear,  
                $this->employment  
            );  
            $html = $salaryCalculator->getSalariesAsHtml($salaryInformation);  
            $result['html'] = $html;  
        } catch (Exception $e) {  
            $result['status'] = "GET_SALARIES_ERROR";  
            $result['message'] = $e->getMessage();  
            $result['html'] = "";  
        }  
    } else {  
        try {  
            $salaryInformation = $salaryCalculator->getSalaries(  
                $this->businessType,  
                $this->degree,  
                $this->graduationYear  
            );  
            $html = $salaryCalculator->getSalariesAsHtml($salaryInformation);  
            $result['html'] = $html;  
        } catch (Exception $e) {  
            $result['status'] = "GET_SALARIES_ERROR";  
            $result['message'] = $e->getMessage();  
            $result['html'] = "";  
        }  
    }  
    break;
```