---
Slug: SLUG
Prod-server: xxx.coretrek.net
Staging-server: stage22.coretrek.no
Prosjektnummer:
---

![[Oppgåver.base#Dette prosjektet]]

| Teneste                                 | Lenker                                                                                                                            |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| ![[GitLab logo.png\|50]]<br>GitLab      | [SLUG](https://scm.coretrek.no/Konsulent/SLUG)                                                                                    |
| ![[Webflow logo.png\|50]]<br>Design     | [Webflow-skisser](https://SLUG.webflow.io/oversikt)                                                                               |
| ![[Google Drive logo.png\|50]]<br>Drive | [Drive-mappe](https://drive.google.com/drive/folders/xxx)<br>[Estimat](https://docs.google.com/spreadsheets/d/xxx)                |
| ![[Moment logo.png\|50]]<br>Moment      | [Prosjekt XXXX](https://app.moment.team/coretrek/projects/entries/PROSJEKTNUMMER)                                                 |
| ![[YouTrack logo.png\|50]]<br>YouTrack  | [Kanban board](https://coretrek.youtrack.cloud/agiles/xxx)                                                                        |
| CPAdmin                                 | [Dev22 CPAdmin](https://corepublish.dev22.intra.coretrek.com/admin)<br>[Passord](https://pw.intra.coretrek.com/#pwsearch=id:xxxx) |
## rsync mmstore

### prod → dev

```
rsync --delete -rpCl --info=progress2 PRODSERVER:/home/mmstore/SLUG/ /home/mmstore/SLUG/
```
