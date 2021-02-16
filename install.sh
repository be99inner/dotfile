#!/bin/bash -xe
echo "Install zsh..."
echo "Cleanup oh-my-zsh..."
rm -rf /home/${USER}/.oh-my-zsh
echo "Install oh-my-zsh..."
git clone https://github.com/ohmyzsh/ohmyzsh.git /home/$USER/.oh-my-zsh
echo "Link zsh configuration files..."
ln -sf $PWD/.zshrc /home/$USER/.zshrc
ln -sf $PWD/.p10k.zsh $HOME/.p10k.zsh

echo "Cleanup tmux configuration..."
rm -rf $HOME/.tmux
echo "Install tmux tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Link tmux configuration files..."
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf

echo "Cleanup neovim configuration..."
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
mkdir -p $HOME/.config/nvim
echo "Install vim-plugs"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Install neovim configuration files..."
ln -sf $PWD/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $PWD/.config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
