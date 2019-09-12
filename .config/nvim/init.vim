" ============================================================================
" Common Settings for MY NEOVIM
" ============================================================================
" NOTE: .nvimrc on new neovim has change to ~/.config/nvim/init.vim 
" then i just link file to .nvimrc

" Encoding
set encoding=utf-8

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
"highlight ColorColumn ctermbg=0 guibg=ligthgrey

" Useful settings
set history=700
set undolevels=700

" Indent for specific filetype
if has("autocmd")
    augroup styless
        autocmd!
        " Custom filetype settings:
        au FileType json,yaml,yml set tabstop=2 shiftwidth=2 softtabstop=2
        au FileType zsh set tabstop=2 shiftwidth=2 softtabstop=2
        au FileType,BufNewFile,BufRead ~/.Xresources.d/* set filetype=xdefaults
    augroup END
endif

" ============================================================================
" Setting for using vim-plug
" ============================================================================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Hashicorp
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'

" On-daemon loading
" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/pluged with post-update hook
" fzf (fuzzy finder: pacman -S fzf)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Statusbar (Airline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nekomake (asynchronous lint)
Plug 'neomake/neomake'

" vim-commentary
Plug 'tpope/vim-commentary'

" ansible-vim
Plug 'pearofducks/ansible-vim' ", { 'do': 'cd ./UltiSnips;./generate.py' }

" vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

" Initialize plugin system
call plug#end()

" ============================================================================
" Pluggins Setting and Custom configuration
" ============================================================================

" PLUGIN: vim-terraform
" auto align on terraform
let g:terraform_align=1
" auto fold terraform
let g:terraform_fold_sections=0
" set format on *.tf, *.tfvars with terraform fmt
let g:terraform_fmt_on_save=1

" PLUGIN: NERDTree
map <C-n> <ESC>:NERDTreeToggle<CR>

" PLUGIN: fzf.vim
noremap <silent> <Leader>fs :call fzf#run({
    \ 'down': '40%',
    \ 'sink': 'botright split' })<CR>

" PLUGIN: Airline

" PLUGIN: neomake
" When writing a bugger (no delay).
call neomake#configure#automake('w')

" PLUGIN: ansible-vim
" Indentation will completely reset (unindent to column 0) after two newlines
" in insert-mode.
let g:ansible_unindent_after_newline = 1

" Set filetype for ansible-vim
" if has("autocmd")
"     augroup ansible_vim_fthosts
"         autocmd!
"         autocmd BufNewFile,BufRead playbooks/*/hosts setfiletype ansible_hosts
"         autocmd BufNewFile,BufRead playbooks/*/inventor* setfiletype yaml.ansible
"     " augroup END
" endif
