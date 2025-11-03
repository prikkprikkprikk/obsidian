## Mitt oppsett

```JavaScript
git init --bare $HOME/.dotfiles
```

La til funksjon i `.zshrc`:

```Bash
function dfs {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
```

```Bash
dfs config status.showUntrackedFiles no
dfs add .zshrc
dfs commit -m "Add .zshrc"
dfs remote add origin https://github.com/prikkprikkprikk/dotfiles.git
dfs push -u origin main
```

  

## Installere på ny maskin

```Bash
cd ~
git clone --bare https://github.com/prikkprikkprikk/dotfiles.git .dotfiles
```

Redigere

## Originaltråd på Hacker News

> [!info]  
>  
> [https://news.ycombinator.com/item?id=11071754](https://news.ycombinator.com/item?id=11071754)  

**StreakyCobra on Feb 10, 2016 | parent | context | favorite | on: Ask HN: What do you use to manage dotfiles?**

I use:

```Bash
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```

where my ~/.myconf directory is a git bare repository. Then any file within the home folder can be versioned with normal commands like:

```Bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .config/redshift.conf
config commit -m "Add redshift config"
config push
```

And so one…

No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate your configuration easily on new installation.

---

**seliopou on Feb 10, 2016 | next [–]**

To complete the description of the workflow (for others), you can replicate your home directory on a new machine using the following command:

`git clone --separate-git-dir=~/.myconf /path/to/repo ~`

This is the best solution I've seen so far, and I may adopt it next time I get the itch to reconfigure my environment.

**telotortium on Feb 11, 2016 | parent | next [–]**

For posterity, note that this will fail if your home directory isn't empty. To get around that, clone the repo's working directory into a temporary directory first and then delete that directory,

```Plain
git clone --separate-git-dir=$HOME/.myconf /path/to/repo $HOME/myconf-tmp
cp ~/myconf-tmp/.gitmodules ~  # If you use Git submodules
rm -r ~/myconf-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
```

and then proceed as before.

---

**Siilwyn on Feb 13, 2016 | root | parent | next [–]**

Finally got mine working, it does need some figuring out especially the replication part. I documented the needed commands here: [https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfi](https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfi)...

---

**wooptoo on Feb 10, 2016 | prev | next [–]**

Why is this a bare repo as opposed to a normal one?

**StreakyCobra on Feb 10, 2016 | parent | next [–]**

Because the working tree is already your home folder, you don't need to also have a copy of these files in ".myconf/".

**idle_zealot on Feb 11, 2016 | root | parent | next [–]**

So why use .myconf/ at all? What is it doing?

**telotortium on Feb 11, 2016 | root | parent | next [–]**

It contains the files that would normally be in .git (run `git help gitrepository-layout` for more details on the contents).

---

**shabda on Feb 10, 2016 | parent | next [–]**

Could you explain how this works? Won't this be putting the .bashrc in $HOME/.myconf/.bashrc, which won't get picked up by bash? (And similar for other dotfiles)

**unwind on Feb 10, 2016 | root | parent | next [–]**

No, since the config alias runs git with the option "--work-tree=$HOME", which tells it that the working directory is your home directory root, i.e. where config files (used to) live.

Anyway it's the proper root for config files, since if you use a .config directory (as seems to be the modern choice) that needs to live in your home directory of course.

  

  

## Atlassian-artikkel

> [!info] How to Store Dotfiles - A Bare Git Repository | Atlassian Git Tutorial  
> It&#039;s time to find a better way to store your dotfiles.  
> [https://www.atlassian.com/git/tutorials/dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)  

# Dotfiles: Best Way to Store in a Bare Git Repository

_Disclaimer: the title is slightly hyperbolic, there are_  
_other proven solutions to the problem. I do think the technique below is_  
_very elegant though._

Recently I read about this amazing technique in an [Hacker News thread](https://news.ycombinator.com/item?id=11070797) on people's solutions to store their [dotfiles](https://en.wikipedia.org/wiki/Dot-file). User `StreakyCobra` [showed his elegant setup](https://news.ycombinator.com/item?id=11071754) and  
... It made so much sense! I am in the process of switching my own  
system to the same technique. The only pre-requisite is to install [Git](https://www.atlassian.com/git).

In his words the technique below requires:

No extra tooling, no symlinks, files are tracked on a version control  
system, you can use different branches for different computers, you can  
replicate you configuration easily on new installation.

The technique consists in storing a [Git bare repository](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) in a "_side_" folder (like `$HOME/.cfg` or `$HOME/.myconfig`) using a specially crafted alias so that commands are run against that repository and not the usual `.git` local folder, which would interfere with any other Git repositories around.

## Starting from scratch

If you haven't been tracking your configurations in a Git repository  
before, you can start using this technique easily with these lines:

`git init --bare $HOME/.cfg alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' config config --local status.showUntrackedFiles no echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc`

- The first line creates a folder `~/.cfg` which is a [Git bare repository](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) that will track our files.
- Then we create an alias `config` which we will use instead of the regular `git` when we want to interact with our configuration repository.
- We set a flag - local to the repository - to hide files we are not explicitly tracking yet. This is so that when you type `config status` and other commands later, files you are not interested in tracking will not show up as `untracked`.
- Also you can add the alias definition by hand to your `.bashrc` or use the the fourth line provided for convenience.

I packaged the above lines into a [snippet](https://bitbucket.org/snippets/nicolapaolucci/ergX9) up on Bitbucket and linked it from a short-url. So that you can set things up with:

`curl -Lks http://bit.do/cfg-init | /bin/bash`

After you've executed the setup any file within the `$HOME` folder can be versioned with normal commands, replacing `git` with your newly created `config` alias, like:

`config status config add .vimrc config commit -m "Add vimrc" config add .bashrc config commit -m "Add bashrc" config push`

## Install your dotfiles onto a new system (or migrate to this setup)

If you already store your configuration/dotfiles in a [Git repository](https://www.atlassian.com/git), on a new system you can migrate to this setup with the following steps:

- Prior to the installation make sure you have committed the alias to your `.bashrc` or `.zsh`:

`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

- And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

`echo ".cfg" >> .gitignore`

- Now clone your dotfiles into a [bare](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) repository in a "_dot_" folder of your `$HOME`:

`git clone --bare <git-repo-url> $HOME/.cfg`

- Define the alias in the current shell scope:

`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

- Checkout the actual content from the bare repository to your `$HOME`:

`config checkout`

- The step above might fail with a message like:

`error: The following untracked working tree files would be overwritten by checkout:     .bashrc     .gitignore Please move or remove them before you can switch branches. Aborting`

This is because your `$HOME` folder  
might already have some stock configuration files which would be  
overwritten by Git. The solution is simple: back up the files if you  
care about them, remove them if you don't care. I provide you with a  
possible rough shortcut to move all the offending files automatically to  
a backup folder:

`mkdir -p .config-backup && \ config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \ xargs -I{} mv {} .config-backup/{}`

- Re-run the check out if you had problems:

`config checkout`

- Set the flag `showUntrackedFiles` to `no` on this specific (local) repository:

`config config --local status.showUntrackedFiles no`

- You're done, from now on you can now type `config` commands to add and update your dotfiles:

`config status config add .vimrc config commit -m "Add vimrc" config add .bashrc config commit -m "Add bashrc" config push`

Again as a shortcut not to have to remember all these steps on any  
new machine you want to setup, you can create a simple script, [store it as Bitbucket snippet](https://bitbucket.org/snippets/nicolapaolucci/7rE9K) like I did, [create a short url](http://bit.do/) for it and call it like this:

`curl -Lks http://bit.do/cfg-install | /bin/bash`

For completeness this is what I ended up with (tested on many freshly minted [Alpine Linux](http://www.alpinelinux.org/) containers to test it out):

`git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg function config {    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@ } mkdir -p .config-backup config checkout if [ $? = 0 ]; then   echo "Checked out config.";   else     echo "Backing up pre-existing dot files.";     config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{} fi; config checkout config config status.showUntrackedFiles no`

## Wrapping up

I hope you find this technique useful to track your configuration. If you're curious, [my dotfiles live here](https://bitbucket.org/durdn/cfg.git). Also please do stay connected by following [@durdn](https://www.twitter.com/durdn) or my awesome team at [@atlassiandev](https://www.twitter.com/atlassiandev).