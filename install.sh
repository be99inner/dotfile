#!/bin/bash -euo pipefail
# The script to install dotfile configuration

install_zsh() {
    echo "Install zsh..."
    echo "Cleanup oh-my-zsh..."
    rm -rf $HOME/.oh-my-zsh
    echo "Install oh-my-zsh..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
    echo "Checking the old configuration file for zsh..."
    if [ -f "$HOME/.zshrc" ] then
        echo "Found the old zsh configuration!!!"
        echo "Backup the old configuration..."
        mv $HOME/.zshrc $HOME/.zshrc_back
    elif
        echo "Don't found the old configuration..."
        echo "Backup configuration is skipped!!!"
    fi
    echo "Checking the old configuration file for p10k"
    if [ -f "$HOME/.p10k.zsh" ] then
        echo "Found the old p10k configuration!!!"
        echo "Backup the old configuration..."
        mv $HOME/.p10k.zsh $HOME/.p10k.zsh_back
    elif
        echo "Don't found the old configuration..."
        echo "Backup configuration is skipped!!!"
    fi
    echo "Install zsh configuration files..."
    ln -sf $PWD/.zshrc $HOME/.zshrc
    echo "Install p10k configuration files..."
    ln -sf $PWD/.p10k.zsh $HOME/.p10k.zsh
}

install_tmux() {
    echo "Cleanup tmux configuration..."
    echo "Checking the old configuration file..."
    if [ -f "$HOME/.tmux.conf" ] then
        echo "Found the old configurtation!!!"
        echo "Backup the old configuration..."
        mv $HOME/.tmux.conf $HOME/.tmux.conf_back
    fi
    echo "Check package directory..."
    echo "Found the old package directory!!!"
    echo "Cleanup the old package directory..."
    rm -rf $HOME/.tmux
    echo "Install tmux tpm..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "Install tmux configuration files..."
    ln -sf $PWD/.tmux.conf $HOME/.tmux.conf
}

install_nvim(){
    echo "Install Neovim configuration..."
    echo "Checking the old configuration folder..."
    if [ -d "$HOME/.config/nvim" ] then
        echo "Found the old configuration folder!!!"
        echo "Backup the old configuration..."
        mv $HOME/.config/nvim $HOME/.config/nvim_back
    fi
    echo "Install Neovim configuration..."
    ln -sf $PWD/config/nvim $HOME/.config/nvim
}
