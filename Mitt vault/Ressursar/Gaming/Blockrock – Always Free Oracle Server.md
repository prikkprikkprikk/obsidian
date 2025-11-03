## ToDo:
- [x] Spesifisere java-bin for Vault Hunters-serveren
- [ ] Starte Crafty i bakgrunnen ved oppstart (service e.l.)
- [ ] Sjekke om det går an å sette opp port forwarding, f.eks. at [vanilla.blockrock.team](http://vanilla.blockrock.team) peikar på standard-port 25565, og at f.eks. [vh.blockrock.team](http://vh.blockrock.team) peikar på f.eks. 25566



## Starte opp Crafty
    ssh oracle
    sudo su crafty -
    launch-crafty


passord for root og opc: B!0ckR0ck4tw
passord for crafty: Zh8%6l^qHLVuMcDzAHRs

## Installering

Har gjort dette:

[How To Set Up and Run a (Really Powerful) Free Minecraft Server in the Cloud](https://blogs.oracle.com/developers/post/how-to-set-up-and-run-a-really-powerful-free-minecraft-server-in-the-cloud#create-a-virtual-machine-instance)

Konto registrert på jorn@designerandgeek.com

SSH-key: id_rsa

## Installere nedgradert Java
[Forge is broken on Java 1.8.0_321+](https://github.com/MultiMC/Launcher/issues/4470#issuecomment-1025114255)

Har oppretta konto hos Oracle for å få lov til å laste ned 8u311 i staden, og installert denne i /usr/java/jdk1.8.0_311-aarch64/bin/java

La den inn i `alternatives` :

```
$ sudo alternatives --set java /usr/java/jdk1.8.0_311-aarch64/bin/java
```

Kan svitsje manuelt med:

```
$ sudo update-alternatives --config java
```

Men har i staden lagt inn java executable path i Crafty.

## Installere Crafty

Crafty sin wiki har [instruksjonar for å installere Crafty 4 på CentOS](https://wiki.craftycontrol.com/en/4/Linux%20Setup%20Documentation)

Eg fann også denne kommentaren på Reddit:

[How to setup a decently powerful 1.17 minecraft server on Oracle VM for free : admincraft](https://www.reddit.com/r/admincraft/comments/o0d7bu/comment/h27b8cw/?utm_source=share&utm_medium=web2x&context=3)

### Oppgradere python til siste versjon

Installerte Python 3.10.6 ved å følge denne artikkelen: [How to Install Python 3.8 on CentOS 8](https://linuxize.com/post/how-to-install-python-3-8-on-centos-8/)
La inn som alternative:

```
$ sudo alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.10 1
$ sudo alternatives --set python3 /usr/local/bin/python3.10
```

## Opprette venv
Som crafty:

    sudo /usr/local/bin/python3.10 -m venv venv

## Åpne porter
F.eks. åpne 25566 for VH.

Sette opp Ingress Rules for TCP/UDP i Oracle Cloud, her:

-   [Networking](https://cloud.oracle.com/networking)
-   [Virtual Cloud Networks](https://cloud.oracle.com/networking/vcns)
-   [vcn-20220806-1111](https://cloud.oracle.com/networking/vcns/ocid1.vcn.oc1.eu-stockholm-1.amaaaaaahhohmcaaejbzkjhzr3byekxhuxzjbldknn662ieh3ier5xuytaoa/security-lists)
-   [subnet-20220806-1111](https://cloud.oracle.com/networking/vcns/ocid1.vcn.oc1.eu-stockholm-1.amaaaaaahhohmcaaejbzkjhzr3byekxhuxzjbldknn662ieh3ier5xuytaoa/subnets/ocid1.subnet.oc1.eu-stockholm-1.aaaaaaaacvl5xvj5mfuisomtvek3kcdkthx4vzixfcmbavx4vo2ap6yfv4ia)
-   [Default Security List for vcn-20220806-1111](https://cloud.oracle.com/networking/vcns/ocid1.vcn.oc1.eu-stockholm-1.amaaaaaahhohmcaaejbzkjhzr3byekxhuxzjbldknn662ieh3ier5xuytaoa/security-lists/ocid1.securitylist.oc1.eu-stockholm-1.aaaaaaaaaui5aobe5woszrwoddbtnxujips3d6tkkm3wzpqcr3sp3xym7pqa)

Deretter i terminal på serveren:

```
$ sudo firewall-cmd --permanent --zone=public --add-port=25566/tcp
success
$ sudo firewall-cmd --permanent --zone=public --add-port=25566/udp
success
$ sudo firewall-cmd --reload
success
```

## Port-mapping
[dns - Can I configure a subdomain to point to a specific port on my server - Stack Overflow](https://stackoverflow.com/a/19196639/1689299)

[SRV record - Wikipedia](https://en.wikipedia.org/wiki/SRV_record)


## Starte Crafty som service
[How To Install systemd-libs on CentOS 7 | Installati.one](https://installati.one/centos/7/systemd-libs/)

```
$ sudo dnf makecache
$ sudo dnf -y install systemd-libs
```

### Flytte scriptet til /usr/local/bin

[centos7 - selinux is preventing from execute access on the file centos - Server Fault](https://serverfault.com/questions/1032597/selinux-is-preventing-from-execute-access-on-the-file-centos)

TL;DR: SELinux lar ikkje services køyre script som ikkje ligg i /usr/bin, /