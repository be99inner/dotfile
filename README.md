# Tux Dotfile #

The new repository for store my dotfile.

* Using git --bare for store my dotfile


## Installation ##

* Make sure, you already no have conflict files
* Clone this repo's with command

```bash
git clone --bare https://github.com/be99inner/dotfile.git $HOME/.dotfile
```

or you can run manual alias command

``` bash
alias dotcf='git --git-dir=$HOME/.dotfile/ --work-tree=$HOME'
```

NOTE: add alias command on your bashrc file and resource it

* Run ignore command on your local
 
```bash
dotcf config --local status.showUntrackedFiles no
```

*This command may be makesome file on your repo is in stages of modified or
delete. You need to re add file of you repo*

## Configuration ##

CoC configuration (vim plugin).

```json
{
  "languageserver": {
    "golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod"],
      "filetypes": ["go"]
    }
  },
  "coc.source.emoji.enable": true,
  "coc.source.emoji.filetypes": null,
  "coc.source.emoji.disableSyntaxes": []
}
```

## References ##

[Atlassian Docs](https://www.atlassian.com/git/tutorials/dotfiles)

## ZSH ###

I use zsh for my usage.

NOTE: on oh-my-zsh when you add new plugin on your configuration.
You need to remove `.zcompdump*` on your home directory.
