"" Common Settings for MY NEOVIM
"" Ignore widerc setup
set nocompatible

"" Let neovim show true color
if (has("nvim"))
    set t_Co=256
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
    set termguicolors
endif

"" Encoding
set encoding=utf-8

"" Set guifont for GUI client
set guifont=MesloLGS\ NF:h12

"" Clipboard for neovim has to no integrate option
"" you need to install software to interact with neovim clipboard
"" :h clipboard
set clipboard+=unnamedplus

"" Rebind <Loader> key
let mapleader = ' '

"" Use space instead of TAB
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"" Set default indent
if has('autocmd')
    augroup default
        autocmd!
        " Custom filetype settings:
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
    augroup END
endif

"" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Remove hightlight of you last search
noremap <silent> <Leader>s <ESC>:nohl<CR>

"" Easier moving of code tabs
vnoremap < <gv
vnoremap > >gv

"" Refact indent on buffer file
noremap <Leader>rf <C-C>gg=G<CR>:update<CR>
"" Delete blank line on buffer file
noremap <Leader>rb <C-C>:g/^$/d<CR>:update<CR>

"" Bind Ctril+<Movement> key  to move around the windows
"" instead of use Ctrl+w <movement>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

"" Set splition
set splitright
set splitbelow

"" Easy move between tab
nmap <silent> <Leader>' :tabnew<CR>
nmap <silent> <Leader>] :tabnext<CR>
nmap <silent> <Leader>[ :tabprevious<CR>

"" Enable syntax highlighting
syntax off
filetype plugin indent on
syntax on

"" Showing line numbers and length
set number              " show line numbers
set relativenumber      " show relative number
set textwidth=79        " width of document (used by gd)
set nowrap              " don't automatically wrap on load
set fo-=t               " don't automatically wrap text when typing
set ruler               " determine word
set showcmd             " show cmd

"" Set scrolling always show 2 line of header/tail screen
set scrolloff=2

"" Make cursorline easy to find out!.
set cursorline

"" Make cursor shapes and blink
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

"" Useful settings
set history=700
set undolevels=700

"" Set wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" "" Jump to the last position when reopening a file
" if has("autocmd")
"     autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif

"" Set auto change directory on nvim
set autochdir

"" Set Python provider
"" currently has a problem with pyenv
let g:python3_host_prog  = $HOME . "/.virtualenvs/neovim/bin/python3"
