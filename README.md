# Tux Dotfile #

The new repository for store my dotfile.

* Using git --bare for store my dotfile


## Installation ##

* Make sure, you already no have conflict files
* Clone this repo's with command

```bash
git clone --bare https://github.com/be99inner/dotfile.git $HOME/.git
```

or you can run manual alias command

``` bash
alias dotcf='git --git-dir=$HOME/.git/ --work-tree=$HOME'
```

NOTE: add alias command on your bashrc file and resource it

* Run ignore command on your local
 
```bash
dotcf config --local status.showUntrackedFiles no
```

*This command may be makesome file on your repo is in stages of modified or
delete. You need to re add file of you repo*


[Atlassian Docs](https://www.atlassian.com/git/tutorials/dotfiles)
