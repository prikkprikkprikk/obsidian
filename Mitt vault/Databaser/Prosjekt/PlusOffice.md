---
Prosjekttype: CoreTrek
✔️ Oppgåver:
  - "[[PlusOffice – Design-justeringar]]"
  - "[[Favicon 2]]"
  - "[[Datofilter]]"
---
## Gitlab

> [!info]  
>  
> [https://scm.coretrek.no/Konsulent/plusoffice2024](https://scm.coretrek.no/Konsulent/plusoffice2024)  

## Design

> [!info] oversikt  
>  
> [https://plusoffice.webflow.io/oversikt](https://plusoffice.webflow.io/oversikt)  

## Google Drive

> [!info]  
>  
> [https://drive.google.com/drive/folders/16x08wZjYvk5TGQk-2j5wwmsWQUNXLoU_?usp=drive_link](https://drive.google.com/drive/folders/16x08wZjYvk5TGQk-2j5wwmsWQUNXLoU_?usp=drive_link)  

## Moment

> [!info] Moment  
>  
> [https://app.moment.team/coretrek/projects/entries/0006072](https://app.moment.team/coretrek/projects/entries/0006072)  

#### Oppgåver

|![](https://www.notion.so/icons/font_gray.svg)Name|![](https://www.notion.so/icons/clock_gray.svg)Date Created|![](https://www.notion.so/icons/calendar_gray.svg)Deadline|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Hast|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Hovudoppgåve|![](https://www.notion.so/icons/checkmark-square_gray.svg)Innboks|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Områder|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Prosjekt|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Status|![](https://www.notion.so/icons/arrow-circle-down_gray.svg)Type|![](https://www.notion.so/icons/arrow-northeast_gray.svg)Underoppgåver|
|---|---|---|---|---|---|---|---|---|---|---|
|[[PlusOffice – Design-justeringar]]|4. november 2024 07:08||||[ ]||[[PlusOffice]]|Innkomande|||
|[[Datofilter]]|18. november 2024 09:47||Hastar||[ ]||[[PlusOffice]]|I arbeid|||
|[[Favicon 2]]|14. november 2024 07:21||Neste||[ ]||[[PlusOffice]]|Ferdig|CoreTrek||


  

Noverande WP-nettside: [https://www.plusoffice.no/](https://www.plusoffice.no/)

Gammal CP-nettside: [https://plusoffice.stage22.coretrek.no/](https://plusoffice.stage22.coretrek.no/)

  

## Midstilt artikkel

Eksempel på midstilt artikkel:

[https://www.kopano.no/aktuelt/iso](https://www.kopano.no/aktuelt/iso)

Med sidekolonnen under:

[https://plusoffice.webflow.io/artikkel-midtstilt](https://plusoffice.webflow.io/artikkel-midtstilt)

## Kalkulator

[https://www.plusoffice.no/kalkulator/](https://www.plusoffice.no/kalkulator/)

Javascript-koden frå nettsida:

```JavaScript
document.addEventListener('DOMContentLoaded', function() {
    // Slider Elements
    const employeesSlider = document.getElementById('employees-slider'); // Antall årsverk
    const priceSlider = document.getElementById('price-slider'); // Gjennomsnittslønn
    const currentSickSlider = document.getElementById('current-sick-slider'); // Nåværende sykefraværsprosent
    const targetSickSlider = document.getElementById('target-sick-slider'); // Mål for sykefraværsprosent

    // Label Elements
    const employeesLabel = document.getElementById('days-label'); // Displays the number of employees
    const salaryLabel = document.getElementById('price-value'); // Displays the average salary
    const currentSickLabel = document.getElementById('percent-value'); // Displays current sick rate
    const targetSickLabel = document.getElementById('discount-value'); // Displays target sick rate

    // Result Display Elements
    const totCostDisplay = document.getElementById('totcost'); // Total current cost
    const goalSickDisplay = document.getElementById('goalsick'); // Total goal cost
    const savingsSickDisplay = document.getElementById('savingssick'); // Savings
    const reductionPercentDisplay = document.getElementById('reductionpercent'); // Reduction message

    // Standard Workdays per Year (if needed for further calculations)
    const workDaysPerYear = 260;  // Not used in current calculations

    function calculateCosts() {
        const employees = parseInt(employeesSlider.value);
        const averageSalary = parseFloat(priceSlider.value);
        const currentSickRate = parseFloat(currentSickSlider.value) / 100;
        const targetSickRate = parseFloat(targetSickSlider.value) / 100;

        // Totalkostnad nåværende sykefravær
        const totalCurrentCost = employees * averageSalary * currentSickRate;

        // Totalkostnad med mål sykefravær
        const totalGoalCost = employees * averageSalary * targetSickRate;

        // Beregn besparelser
        const savings = totalCurrentCost - totalGoalCost;

        // Oppdater visning
        totCostDisplay.textContent = formatCurrency(totalCurrentCost) + " kr";
        goalSickDisplay.textContent = formatCurrency(totalGoalCost) + " kr";
        savingsSickDisplay.textContent = formatCurrency(savings) + " kr";
        reductionPercentDisplay.textContent = "Reduserer dere sykefraværet til " + targetSickSlider.value + "% sparer dere årlig";

        // Oppdater slider etiketter
        employeesLabel.textContent = employeesSlider.value;
        salaryLabel.textContent = formatCurrency(averageSalary) + ' kr';
        currentSickLabel.textContent = currentSickSlider.value + '%';
        targetSickLabel.textContent = targetSickSlider.value + '%';
    }

    function formatCurrency(number) {
        return number.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, " ");
    }

    // Add Event Listeners to Sliders
    employeesSlider.addEventListener('input', calculateCosts);
    priceSlider.addEventListener('input', calculateCosts);
    currentSickSlider.addEventListener('input', calculateCosts);
    targetSickSlider.addEventListener('input', calculateCosts);

    // Initial Calculation
    calculateCosts();
});
```