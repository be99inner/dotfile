# NvChad Custom Plugin Configuration

## Prerequisite

- Nvim (>= 0.9.0)
- NvChad (Check the link for NvChad requirement: https://nvchad.com/docs/quickstart/install)

## Installation

```bash
# backup old configuration
mv ~/.config/nvim ~/.config/nvim_bak

# install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# add custom config to NvChad
ln -sf $PWD/config/nvim ~/.config/nvim/lua/custom
```
