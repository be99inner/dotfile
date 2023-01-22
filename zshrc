# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$HOME/bin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin
# kubectl krew plugins
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"
# # .NET
# export DOTNET_ROOT="/usr/local/share/dotnet"
# export PATH="$PATH:$DOTNET_ROOT"
# # Add .NET Core SDK tools
# export PATH="$PATH:$HOME/.dotnet/tools"
# Add n
export PATH="$N_PREFIX/bin:$PATH"
export N_PREFIX=$HOME/.n
#export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
ZSH_CUSTOM_AUTOUPDATE_QUITE=true

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Tmux Configuration
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_UNICODE=true
export ZSH_TMUX_ITERM2=false

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  alias-finder
  aws
  docker
  docker-compose
  gcloud
  git
  gitignore
  golang
  fzf
  jump
  kubectl
  pyenv
  rust
  terraform
  tmux
  virtualenv
  virtualenvwrapper
  # custom
  autoupdate
  fast-syntax-highlighting
  zsh-tfenv
  zsh-autosuggestions
  zsh-completions
  # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias kx='kubectx'
alias kn='kubens'
alias gjc='gitmoji -c'
alias cfz='nvim ~/.zshrc'
alias cft='nvim ~/.tmux.conf'
alias cfv='nvim ~/.nvimrc'
alias tf='terraform'
alias tfi='terraform init'
alias tfv='terraform validate'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfay='terraform apply --auto-approve'
alias vim='nvim'
alias lg="lazygit"

# Set Golang option
export GO111MODULE=on

# Setup brew
export HOMEBREW_NO_GITHUB_API=true

# Require by powerline10k installation (brew install)
# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set editor
export EDITOR='nvim'
export VISUAL="$EDITOR"

# OS specific configuration
if [[ $(uname) == "Darwin" ]] then
  # macOS need to setup this option for python fork()
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

  export JAVA_HOME='/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home'
  export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  alias ssh="TERM=xterm-256color ssh"
  alias htop="TERM=xterm-256color htop"

  # Setup libpq for PosgreSQL cli
  export PATH="$PATH:/opt/homebrew/opt/libpq/bin"

  # neovim test
  alias nv="XDG_CONFIG_HOME='/Users/be99inner/workspace/home-tmp/config' XDG_DATA_HOME='/Users/be99inner/workspace/home-tmp/share' XDG_CACHE_HOME='/Users/be99inner/workspace/home-tmp/cache' nvim -u ~/workspace/github.com/be99inner/lz-nvim/init.lua"

  # Set python virtualenvwrapper
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
elif [[ $(uname) == "Linux" ]] then
  # Android SDK
  export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
  export ANDROID_HOME="$HOME/Android/Sdk"
  # Flutter
  export CHROME_EXECUTABLE="/bin/google-chrome-stable"
fi
