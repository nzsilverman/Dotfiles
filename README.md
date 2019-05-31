# Dotfiles Readme
These dotfiles are stored under source control by following directions from [this](https://www.atlassian.com/git/tutorials/dotfiles) website.  
These instructions are copied from there.  

## Setting up a new system from scratch
```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

```

After this, anythin in your home directory can be used under version control using `config` instead of `git` for commands

## Install dotfiles onto a new system
Go through the following steps

### Make sure following is in `.bashrc`
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

### And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:
```
echo ".cfg" >> .gitignore
```

### Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:
```
git clone --bare <git-repo-url> $HOME/.cfg
```
Define the alias in the current shell scope:

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

```

### Checkout the actual content from the bare repository to your $HOME:

```

config checkout
```

### The step above might fail with an error message like:

```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
### This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

```

### Re-run the check out if you had problems
```
config checkout
```

### Set the flag showUntrackedFiles to no on this specific (local) repository:
```
config config --local status.showUntrackedFiles no

```
You're done, from now on you can now type config commands to add and update your dotfiles:

### For completeness this is what I ended up with (tested on many freshly minted Alpine Linux containers to test it out):
```

git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

