" ============================================================================
" Common Settings for MY NEOVIM
" ============================================================================
" NOTE: .nvimrc on new neovim has change to ~/.config/nvim/init.vim
" then i just link file to .nvimrc

" Ignore widerc setup
set nocompatible

" Let neovim show true color
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Encoding
set encoding=utf-8

" Autoload vimrc per project
" NOTE: Neovim
" ./project/.nvimrc
set exrc
" prevent from unsafe command in your project setting
set secure

" Automatic reload of .nvimrc
autocmd! bufwritepost .nvimrc source %

" Clipboard for neovim has to no integrate option
" you need to install software to interact with neovim clipboard
" :h clipboard
set clipboard+=unnamedplus

" Rebind <Loader> key
let mapleader = ','

" Real Programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remove hightlight of you last search
noremap <Leader>s <ESC>:nohl<CR>

" Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-C>:update<CR>

" Quice quite
noremap <C-q> :quit<CR>

" Easier moving of code tabs
vnoremap < <gv      " better indentation
vnoremap > >gv      " better indentation

" Bind Ctril+<Movement> key  to move around the windows
" instead of use Ctrl+w <movement>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Enable syntax highlighting
syntax off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number              " show line numbers
set relativenumber      " show relative number
set textwidth=79               " width of document (used by gd)
"" set nowrap           " don't automatically wrap on load
set fo-=t               " don't automatically wrap text when typing
set ruler               " determine word
set showcmd             " show cmd
" This feature is request for neovim
"" highlight ColorColumn ctermbg=0 guibg=ligthgrey

" Make cursorline easy to find out!.
set cursorline

" Useful settings
set history=700
set undolevels=700

" Indent for specific filetype
if has("autocmd")
    augroup styless
        autocmd!
        " Custom filetype settings:
        au FileType ruby,json,yaml,yml,css,javascript,html set tabstop=2 shiftwidth=2 softtabstop=2
        au FileType sh,zsh set tabstop=2 shiftwidth=2 softtabstop=2
        au FileType,BufNewFile,BufRead ~/.Xresources.d/* set filetype=xdefaults
        au FileType,BufNewFile,BufRead /*.rasi set filetype=css
        au FileType,BufNewFile,BufRead ~/.kube/config* set filetype=yaml
        au FileType,BufNewFile,BufRead ~/.config/termite/config* set filetype=yaml
    augroup END
endif

" Set wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" ============================================================================
" Setting for using vim-plug
" ============================================================================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" =====================
" Better visualization
" =====================
" vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'
" indent visual
Plug 'Yggdroot/indentLine'
" Statusbar (Airline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colorscheme
Plug 'rakr/vim-one'
Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim'
" Emoji
Plug 'junegunn/vim-emoji'

" =======================
" Interactive with system
" =======================
" Git
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
" Wakatime
Plug 'wakatime/vim-wakatime'
" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" ===================
" Syntax highlighting
" ===================
" Hashicorp
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" markdown mode
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
" Jinja
Plug 'Glench/Vim-Jinja2-Syntax'
" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'
"" dependecies of vim-deleve
if !has("nvim")
    Plug 'Shougo/vimshell.vim'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
endif

" =================
" Easy movetivation
" =================
" vim surround
""Plug 'tpope/vim-surround'
" commenter
Plug 'tpope/vim-commentary'
" multi-cursor
Plug 'terryma/vim-multiple-cursors'
" Splitjoin line
Plug 'AndrewRadev/splitjoin.vim'

" ==================
" Working with files
" ==================
" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" fuzzy search file
Plug 'kien/ctrlp.vim'

" ====================
" Completion & Linting
" ====================

" Initialize plugin system
call plug#end()

" ============================================================================
" Pluggins Setting and Custom configuration
" ============================================================================
" ----------------------------------------------------------------------------
" PLUGIN: colorscheme
" Need to combine more color theme for make it look nice.
" Set background color
set background=dark

" Material colorscheme settings
let g:material_theme_style = 'dark'

" Ayu colorscheme settings
let ayucolor = 'dark'

" One colorscheme settings
let g:one_allow_italics = 1

" Set color theme to one
colorscheme one

" *CAUTION*: Need to set CursorLine under color scheme
highlight CursorLine term=bold cterm=bold guibg=Grey22

" ----------------------------------------------------------------------------
" PLUGIN: vim-emoji
" emoji completion
set completefunc=emoji#complete

" ----------------------------------------------------------------------------
" PLUGIN: vim-multiple-cursor
" Disable default multiple cursor
let g:multi_cursor_use_default_mapping=0

" ----------------------------------------------------------------------------
" PLUGIN: git-signify
" Default updatetime 4000ms is not good for async update
set updatetime=100

" ----------------------------------------------------------------------------
" PLUGIN: vim-terraform
" auto align on terraform
let g:terraform_align=1

" auto fold terraform
let g:terraform_fold_sections=0

" set format on *.tf, *.tfvars with terraform fmt
let g:terraform_fmt_on_save=1

" ----------------------------------------------------------------------------
" PLUGIN: vim-go
" By default, vim-go don't set color because it causes too much distraction.
" Set syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Let auto show identifier type
let g:go_auto_type_info = 1

" Highlighting matching identifier
let g:go_auto_sameids = 1

" Build and run on leader
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" ----------------------------------------------------------------------------
" PLUGIN: NERDTree
map <C-n> <ESC>:NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" PLUGIN: Airline
" set powerline
let g:airline_powerline_fonts = 1

" set theme for airline
let g:airline_theme='badwolf'

" set airline enable for tab extension
""let g:airline#extensions#tabline#enabled = 1

" ----------------------------------------------------------------------------
" PLUGIN: editorconfig-vim
" To ensure that this plugin works well with Tim Pope's fugitive, and avoid loading EditorConfig for any remote files over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Resolve conflicts of trailing whitespace trimming and buffer autosaving
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

" ----------------------------------------------------------------------------
" PLUGIN: ctrlp.vim
" let ctrlp working with variable
let g:ctrlp_working_path_mode = 'rca'

" ----------------------------------------------------------------------------
" PLUGIN: nerdtree git
" Change variable symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ----------------------------------------------------------------------------
" PLUGIN: vim-delve
" Set backend
let g:delve_backend = "native"
