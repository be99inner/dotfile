
"" Specify a directory for plugins
"" - For Neovim: ~/.local/share/nvim/plugged
"" - Avoid using standard Vim directory names like 'plugin'
"" Make sure you use single quotes
call plug#begin('~/.nvim/plugged')


"" =====================
"" Generic
"" =====================
"" Generic configuration
Plug 'tpope/vim-sensible'
" Plug 'embear/vim-localvimrc'
Plug 'xolox/vim-misc'
" Plug 'haya14busa/incsearch.vim'


"" =====================
"" UI
"" =====================
"" Color theme plugins
" Plug 'morhetz/gruvbox'
" Plug 'gryf/wombat256grf'
" Plug 'vim-scripts/wombat256.vim'
" Plug 'kyoz/purify', { 'rtp': 'vim' }
" Plug 'rakr/vim-one'
" Plug 'joshdick/onedark.vim'
" Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'altercation/vim-colors-solarized'
" Plug 'ayu-theme/ayu-vim'
" Plug 'kaicataldo/material.vim'

Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'itchyny/vim-gitbranch'  " required to work with gitbrach on startify
" Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'osyo-manga/vim-over'
Plug 'nvim-lua/plenary.nvim'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'liuchengxu/vim-which-key'
" Plug 'hecal3/vim-leader-guide'
" Plug 'folke/todo-comments.nvim'
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'


"" =================
"" Easy Motivation
"" =================
Plug 'tpope/vim-sleuth'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
Plug 'terrortylor/nvim-comment'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" Plug 'windwp/nvim-autopairs'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree'
Plug 'haya14busa/incsearch.vim'
Plug 'moll/vim-bbye'
Plug 'airblade/vim-rooter'
" Plug 'dbakker/vim-projectroot'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'unblevable/quick-scope'
"" Outline
"" required nvim 0.5+ (nightly)
" Plug 'simrat39/symbols-outline.nvim'


"" =======================
"" Tools
"" =======================
"" Integrate with Git
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
"" Wakatime
Plug 'wakatime/vim-wakatime'
"" Editorconfig
Plug 'editorconfig/editorconfig-vim'
"" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
"" PlatformIO
" Plug 'coddingtonbear/neomake-platformio'


"" ===================
"" Languages
"" ===================
Plug 'sheerun/vim-polyglot'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'godlygeek/tabular', { 'for': 'markdown' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'pedrohdz/vim-yaml-folds'
" " Hashicorp
" Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" " Jinja
" Plug 'Glench/Vim-Jinja2-Syntax'
" " JavaScript
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" " Golang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'sebdah/vim-delve'
" " dependecies of vim-deleve
" if !has("nvim")
"     Plug 'Shougo/vimshell.vim'
"     Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" endif


"" ====================
"" Completion & Linting
"" ====================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'branch': 'release/1.x',
      \ 'for': [
      \   'javascript',
      \   'typescript',
      \   'css',
      \   'less',
      \   'scss',
      \   'json',
      \   'graphql',
      \   'markdown',
      \   'vue',
      \   'lua',
      \   'php',
      \   'python',
      \   'ruby',
      \   'html',
      \   'swift',
      \   'yaml']
      \ }
" Plug 'github/copilot.vim'


" Initialize plugin system
call plug#end()
