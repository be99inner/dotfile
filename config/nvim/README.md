# Neovim Configuration

Fast, modular Neovim configuration focused on editor performance and practical defaults.

## Layout

- `init.lua` loads the config entrypoint.
- `lua/config/` contains editor options, keymaps, autocmds, and lazy.nvim bootstrap.
- `lua/plugins/` contains focused plugin specs grouped by responsibility.

## Large Files

Buffers over 2 MiB or 50,000 lines enter large-file mode automatically. This disables expensive buffer features such as treesitter, LSP, diagnostics, syntax, cursorline, relative numbers, listchars, signs, folds, swap, and persistent undo for that buffer.

## Language Components

Filetype detection and language component mappings live in `lua/config/languages.lua`. Opening a normal-size file automatically installs/starts the related Treesitter parser, Mason LSP server, and configured formatter packages when they are supported.

## Install

From the dotfile repository:

```bash
./install.sh nvim
```

The installer backs up an existing `~/.config/nvim` before linking this directory.
On a fresh machine, the first Neovim startup restores plugin revisions from [`lazy-lock.json`](/Users/be99inner/workspace/github.com/be99inner/dotfile/config/nvim/lazy-lock.json) instead of resolving newer commits.

## Git UI

This config includes `lazygit.nvim`. Use `<leader>gl` to open LazyGit from inside Neovim. The `lazygit` binary still needs to be installed and available on `PATH`.
