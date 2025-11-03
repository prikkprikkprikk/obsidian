---
Date Created: 2024-11-25T11:58
Innboks: false
Prosjekt:
  - "[[SiteComponents]]"
Status: På vent
---
  

## ToDo

- [ ] Teste med CtSQLField som argument i staden for streng
- [ ] [https://technet.coretrek.no/doc/latest/developer/backend/backend-development.html#the-ctsql-database-framework](https://technet.coretrek.no/doc/latest/developer/backend/backend-development.html#the-ctsql-database-framework)
- [ ] Lage funksjon for dag også.

  

## CtSQL-struktur

I funksjonen `CtSQLDialectBase→fieldFunctionToSql()` er alle funksjonsklassene listet opp i en switch som sammenligner streng med lower-case klassenavn.

I `CtSQLDialectMySQL→fieldFunctionToSql()` sjekkes det først om funksjonen er instanceof `CtSQLFieldFunctionMySQLSumMatch`. Hvis ikke den matcher, kalles parent-funksjonen.

  

  

  

## Dialekter

- MSSQL
- MySQL
- MySQL5
- Oracle
- PDOSQLite
- Postgres

  

  

  

## MySQL date and time functions

> [!info] MySQL :: MySQL 8.4 Reference Manual :: 14.7 Date and Time Functions  
> This section describes the functions that can be used to  
> [https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_extract](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_extract)  

  

## EXTRACT vs YEAR, MONTH etc.

> [!info] MySQL - YEAR(FROM_UNIXTIME(col)) vs EXTRACT(YEAR FROM col)  
> Anyone have an authoritative answer for which is more performant?  
> [https://stackoverflow.com/a/27493830](https://stackoverflow.com/a/27493830)  

  

## SQLite: strftime

F.eks. strftime(’%Y’, pub_date)

> [!info] Date And Time Functions  
> The first six date and time functions take an optional time-value as an argument, followed  
> [https://www.sqlite.org/lang_datefunc.html](https://www.sqlite.org/lang_datefunc.html)