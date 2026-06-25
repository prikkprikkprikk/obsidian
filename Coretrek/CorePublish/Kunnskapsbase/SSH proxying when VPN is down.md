When VPN is down, but we still need to connect remotely to development servers, for example, we can use SSH tunneling/proxying.

## Make sure you can log into `ekstern.coretrek.no`

We connect to our network via `ekstern.coretrek.no`, so the critical point is to have your public SSH key added there.

```Shell
ssh-copy-id ~/.ssh/your-key ekstern.coretrek.no
```

When asked for a password, you should **use your LDAP password**, _not_ your Google account password.

If VPN already is down and you haven’t installed your key there, you can contact Arve who can add it for you.

## Set up ssh config

Now you can set up your `~/.ssh/config` file so that you can do a simple `ssh devserver` command to log into your development server like always.

Here, the proxy jump server is named `ekstern` and the development server is named `cpjump`:

```Shell
Host ekstern
  HostName ekstern.coretrek.no
  User jorn
  Port 2222
  IdentityFile "~/.ssh/jorn-coretrek"
Host cpjump
  Hostname sa-vprod01
  User jorn
  IdentityFile "~/.ssh/jorn-coretrek"
  ProxyJump ekstern
```

Now you can ssh into sa-vprod01 by simply typing `ssh cpjump`.

## PhpStorm proxy

If you’re developing by automatically FTP-ing changed files to the dev server, you can use an SSH tunnel like so:

```Shell
ssh -N -L 3333:sa-vprod01:22 ekstern
```

When you run this command, the `-N` parameter will keep ssh running and the tunnel open until it is terminated.

Port 3333 on `localhost` is connected to port 22 on `sa-vprod01` using `ekstern` as a proxy jump server (as configured in your ssh config file).

Now you just have to set up `localhost:3333` as SSH configuration in PhpStorm:

![[📎 Filer/image 28.png|image 28.png]]

… and use it for deployment:

![[📎 Filer/image 1 12.png|image 1 12.png]]

## SOCKS proxy for web browsers

Our development web servers are also protected behind VPN, so we also need to set up a proxy to be able to see our project in the browser.

In another terminal session, start a SOCKS proxy on port 1080 with the `-D` parameter:

```Shell
ssh -N -D 1080 ekstern
```

This should also be kept running in the terminal.

### Mac: Setting SOCKS proxy through System Settings

Then you can specify `localhost` and port 1080 in the proxy settings for your Internet network connection under **System Settings → Network → [Your connection] → Proxies**:

![[📎 Filer/image 2 7.png|image 2 7.png]]

### Firefox

If you’re using Firefox, you can also configure proxy settings only for that browser.

Open settings and search for “proxy” in the top right of the settings window.

Choose **Manual proxy configuration** and specify `localhost` and port 1080 for the SOCKS Host:

![[📎 Filer/image 3 4.png|image 3 4.png]]