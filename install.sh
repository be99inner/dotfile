#!/usr/bin/env bash
set -euo pipefail

# Install dotfile configuration by backing up existing files/directories before
# linking this repository's files into their target locations.

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_SUFFIX="${BACKUP_SUFFIX:-back_$(date +%Y%m%d%H%M%S)}"
NVIM_CONFIG_SOURCE="${NVIM_CONFIG_SOURCE:-config/nvim}"

log() {
  printf '[dotfile] %s\n' "$*"
}

ensure_parent_dir() {
  mkdir -p "$(dirname "$1")"
}

backup_target() {
  local target="$1"

  if [ ! -e "$target" ] && [ ! -L "$target" ]; then
    return
  fi

  local backup="${target}_${BACKUP_SUFFIX}"
  local index=1
  while [ -e "$backup" ] || [ -L "$backup" ]; do
    backup="${target}_${BACKUP_SUFFIX}_${index}"
    index=$((index + 1))
  done

  log "Backing up $target -> $backup"
  mv "$target" "$backup"
}

link_path() {
  local source="$1"
  local target="$2"

  if [ ! -e "$source" ] && [ ! -L "$source" ]; then
    log "Missing source: $source"
    return 1
  fi

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    log "Already linked: $target -> $source"
    return
  fi

  ensure_parent_dir "$target"
  backup_target "$target"
  log "Linking $target -> $source"
  ln -s "$source" "$target"
}

clone_repo() {
  local repo="$1"
  local target="$2"

  if [ -e "$target" ] || [ -L "$target" ]; then
    backup_target "$target"
  fi

  ensure_parent_dir "$target"
  log "Cloning $repo -> $target"
  git clone --depth 1 "$repo" "$target"
}

install_oh_my_zsh_plugins() {
  local custom_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

  clone_repo "https://github.com/romkatv/powerlevel10k.git" "$custom_dir/themes/powerlevel10k"
  clone_repo "https://github.com/zsh-users/zsh-autosuggestions.git" "$custom_dir/plugins/zsh-autosuggestions"
  clone_repo "https://github.com/zdharma-continuum/fast-syntax-highlighting.git" "$custom_dir/plugins/fast-syntax-highlighting"
  clone_repo "https://github.com/zsh-users/zsh-completions.git" "$custom_dir/plugins/zsh-completions"
  clone_repo "https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git" "$custom_dir/plugins/autoupdate"
}

install_zsh() {
  log "Installing zsh configuration"
  clone_repo "https://github.com/ohmyzsh/ohmyzsh.git" "$HOME/.oh-my-zsh"
  install_oh_my_zsh_plugins
  link_path "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
  link_path "$DOTFILES_DIR/p10k.zsh" "$HOME/.p10k.zsh"
}

install_tmux() {
  log "Installing tmux configuration"
  clone_repo "https://github.com/tmux-plugins/tpm.git" "$HOME/.tmux/plugins/tpm"
  link_path "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
}

install_nvim() {
  log "Installing Neovim configuration"
  link_path "$DOTFILES_DIR/$NVIM_CONFIG_SOURCE" "$HOME/.config/nvim"
}

install_kitty() {
  log "Installing kitty configuration"
  link_path "$DOTFILES_DIR/config/kitty" "$HOME/.config/kitty"
}

install_lazygit() {
  log "Installing lazygit configuration"
  link_path "$DOTFILES_DIR/config/jesseduffield/lazygit" "$HOME/.config/jesseduffield/lazygit"
}

install_asdf_tool_versions() {
  log "Installing asdf tool versions"
  link_path "$DOTFILES_DIR/tool-versions" "$HOME/.tool-versions"
}

install_legacy_files() {
  log "Installing legacy terminal/vim files"
  link_path "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
  link_path "$DOTFILES_DIR/Xresources" "$HOME/.Xresources"
}

install_all() {
  install_zsh
  install_tmux
  install_nvim
  install_kitty
  install_lazygit
  install_asdf_tool_versions
  install_legacy_files
}

usage() {
  cat <<EOF
Usage: ./install.sh <command>

Commands:
  all       Install every supported component
  zsh       Install zsh, oh-my-zsh, theme, plugins, and zsh config
  tmux      Install tmux plugin manager and tmux config
  nvim      Link Neovim config to ~/.config/nvim
  kitty     Link kitty config
  lazygit   Link lazygit config
  asdf      Link asdf .tool-versions
  legacy    Link legacy .vimrc and .Xresources
  help      Show this usage manual

Environment:
  BACKUP_SUFFIX        Backup suffix. Default: back_YYYYmmddHHMMSS
  NVIM_CONFIG_SOURCE   Repo-relative Neovim config. Default: config/nvim

Examples:
  ./install.sh
  ./install.sh all
  ./install.sh nvim
  NVIM_CONFIG_SOURCE=config/nvim_v2 ./install.sh nvim
EOF
}

main() {
  if [ "$#" -eq 0 ]; then
    usage
    return 0
  fi

  local command="$1"

  case "$command" in
    all) install_all ;;
    zsh) install_zsh ;;
    tmux) install_tmux ;;
    nvim) install_nvim ;;
    kitty) install_kitty ;;
    lazygit) install_lazygit ;;
    asdf) install_asdf_tool_versions ;;
    legacy) install_legacy_files ;;
    -h|--help|help) usage ;;
    *)
      usage
      return 1
      ;;
  esac
}

main "$@"
