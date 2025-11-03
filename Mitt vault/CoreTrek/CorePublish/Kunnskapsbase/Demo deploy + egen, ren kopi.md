- [ ] Kjøre demo deploy:  
    [https://jenkins.intra.coretrek.com/job/cp-demo-deploy/](https://jenkins.intra.coretrek.com/job/cp-demo-deploy/)
- [ ] Kopiere databasen:
    
    ```Shell
    ssh corepublish
    cd ~/dumps
    dumpdemo
    importdatabase sc_master_demo_åååå-mm-dd-hh-mm-ss.sql
    ```
    
- [ ] Sjekke ut master på sa-vprod01 og gjøre installasjonen ren:
    
    ```Shell
    cdp ~/sitecomponents
    git clean -fd
    git reset --hard HEAD
    git checkout master
    git pull
    npm ci
    npm run build
    ```