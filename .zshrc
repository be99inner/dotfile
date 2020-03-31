##
# Common ZSH Configuration
##
# Measure Preformance
##zmodload zsh/zprof

# Load completions
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# completion style
zstyle ':completion:*' menu select

# turn of bell
unsetopt BEEP

# history
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=2000000
export SAVEHIST=2000000

# Auto start tmux
export ZSH_TMUX_AUTOSTART=true

# Antibody
# Set antibody home
export ANTIBODY_HOME=~/.antibody
# load antibody with static method
if [ ! -f "${HOME}/.zsh_plugins.sh" ]; then
  antibody bundle < "${HOME}/.zsh_plugins.txt" > "${HOME}/.zsh_plugins.sh"
  source "${HOME}/.zsh_plugins.sh"
else
  source "${HOME}/.zsh_plugins.sh"
fi

# Set Color for autocolor-ls
export CLICOLOR=1

# Set notify
export AUTO_NOTIFY_THRESHOLD=30
export AUTO_NOTIFY_EXPIRE_TIME=2000
export AUTO_NOTIFY_WHITELIST=("yay" "helm3" "kbc" "kubectl" "gcloud" "gsutils")

# Set history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Golang
export GOPATH="${HOME}/go"
export GO111MODULE=on
export GO15VENDOREXPERIMENT=1

# Setpath
export PATH="${PATH}:${HOME}/bin:${GOPATH}/bin"

# kubernetes
alias kbc='kubectl'
alias kbx='kubectx'
alias kbn='kubens'

# working with golang
alias cgh="cd ${GOPATH}/src/github.com/be99inner"
alias cgl="cd ${GOPATH}/src/gitlab.com/be99inner"

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
alias abtu="antibody update -p 12 && antibody bundle < ${HOME}/.zsh_plugins.txt > ${HOME}/.zsh_plugins.sh"
alias abtg="antibody bundle < ${HOME}/.zsh_plugins.txt > ${HOME}/.zsh_plugins.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# display time
##zprof
