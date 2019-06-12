Tux Dotfile
===========

The new repository for store my dotfile.

* Using git --bare for store my dotfile


Installation
------------

* Make sure, you already no have conflict files
* Clone this repo's with command

```bash
git clone --bare <git_remote_url> $HOME/.dotfile
```
* Re-source, bashrc

```bash
source ~/.bashrc
```

* Run ignore command on your local
 
```bash
dotcf config --local status.showUntrackedFiles no
```

*This command may be makesome file on your repo is in stages of modified or
delete. You need to re add file of you repo*


[Atlassian Docs](https://www.atlassian.com/git/tutorials/dotfiles)
