##
# Common ZSH Configuration
##
# Load completions
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# completion style
zstyle ':completion:*' menu select

# history
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=2000000
export SAVEHIST=2000000

# Antibody
# Set antibody home
export ANTIBODY_HOME=~/.antibody
# Load antibody
source <(antibody init)
# Load plugins
antibody bundle < ~/.zsh_plugins.txt

# Set Color for autocolor-ls
export CLICOLOR=1

# Set notify
export AUTO_NOTIFY_THRESHOLD=30
export AUTO_NOTIFY_EXPIRE_TIME=2000
export AUTO_NOTIFY_WHITELIST=("yay" "helm3" "kbc" "kubectl")

# Set history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Golang
export GOPATH="${HOME}/go"
export GO15VENDOREXPERIMENT=1

# kubernetes
alias kbc='kubectl'
alias kbx='kubectx'
alias kbn='kubens'

# docker
alias dk='docker'
alias dc='docker-compose'

# alais-finder
alias af='alias-finder'

# reload zsh
alias upz='rm ~/.zcompdump* && source ~/.zshrc'
alias rez='source ~/.zshrc'

# move on nvim
alias vim='nvim'

# alias ssh
alias ssh='TERM=xterm-256color ssh'

# fix alias not found on watch
alias watch='watch '

# alias antibody
alias abt='antibody update -p 11'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
