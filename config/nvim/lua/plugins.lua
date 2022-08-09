-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Boostrapping packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- ################################################
  -- # Tools
  -- ################################################
  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup() 
    end
  }
  -- Editconfig
  use 'editorconfig/editorconfig-vim'

  -- ################################################
  -- # BASIC
  -- ################################################
  use 'tpope/vim-sensible'

  -- ################################################
  -- # MOTIVATION
  -- ################################################
  -- auto match bracket and closer
  use 'rstacruz/vim-closer'
  -- Tmux integration
  use { 'alexghergh/nvim-tmux-navigation' }
  use { 'tmux-plugins/vim-tmux-focus-events' }
  use { 'tmux-plugins/vim-tmux' }
  -- Ident Line
  use {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end,
    -- To comparasion about performance 
    -- guess-indent vs indent-o-matic
    -- https://github.com/Darazaki/indent-o-matic/issues/12
  }
  -- Comment
  use 'terrortylor/nvim-comment' -- some issue, can't run config from packer
  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- fuzzy search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} , { 'themercorp/themer.lua'} }
  }
  use { 'farmergreg/vim-lastplace' } -- remember last place of cursor
  use { 'mg979/vim-visual-multi' } -- multi cursor
  use { 'tpope/vim-repeat' } -- replace native repeat behavior
  use { 'tpope/vim-surround' } -- easy change surround text
  use { 'mbbill/undotree' } -- Undo Tree
  use { 'unblevable/quick-scope' } -- fast motivation
  use { 'simrat39/symbols-outline.nvim' } -- Outline

  -- ################################################
  -- # UI
  -- ################################################
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'dracula/vim', as = 'dracula'} -- colorscheme
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- syntax highlighting
  use { 'lukas-reineke/indent-blankline.nvim' } -- indent line

  -- ################################################
  -- # Completions & Linters
  -- ################################################
  -- prettier
  use {
    'MunifTanjim/prettier.nvim',
    -- opt = true,
    requires = {
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'neovim/nvim-lspconfig' },
    }
  }
  -- completions
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
