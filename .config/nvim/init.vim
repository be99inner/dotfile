" ============================================================================
" Common Settings for MY NEOVIM
" ============================================================================
" NOTE: .nvimrc on new neovim has change to ~/.config/nvim/init.vim
" then i just link file to .nvimrc

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

" Useful settings
set history=700
set undolevels=700

" Indent for specific filetype
if has("autocmd")
    augroup styless
        autocmd!
        " Custom filetype settings:
        au FileType ruby,json,yaml,yml set tabstop=2 shiftwidth=2 softtabstop=2
        au FileType zsh set tabstop=2 shiftwidth=2 softtabstop=2
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
" Plug 'rakr/vim-one'
" Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'sonph/onehalf', {'rtp':'vim/'}

" =======================
" Interactive with system
" =======================
" visualize different on git
Plug 'airblade/vim-gitgutter'
" python virtualenv
Plug 'jmcantrell/vim-virtualenv'
" Wakatime
Plug 'wakatime/vim-wakatime'

" ===================
" Syntax highlighting
" ===================
" Hashicorp
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" ansible-vim
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips;./generate.py' , 'for': ['ansible', 'yaml.ansible', 'ruby.ansible'] }
" markdown mode
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
" django
Plug 'tweekmonster/django-plus.vim', { 'for': ['htmldjango', 'python'] }

" =================
" Easy movetivation
" =================
" vim surround
Plug 'tpope/vim-surround'
" commenter
Plug 'tpope/vim-commentary'

" ==================
" Working with files
" ==================
" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" fuzzy search file
Plug 'kien/ctrlp.vim'

" ====================
" Completion & Linting
" ====================
" Neomake (asynch lint engine)
Plug 'neomake/neomake'
" Neoformat (beatifuler)
Plug 'sbdchd/neoformat'

" NCM2 completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi', { 'for': 'python' }
Plug 'ncm2/ncm2-html-subscope'

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

" PLUGIN: Airline
" set powerline
let g:airline_powerline_fonts = 1
" set theme for airline
let g:airline_theme='dracula'
" set airline enable for tab extension
let g:airline#extensions#tabline#enabled = 1

" PLUGIN: dracula
colorscheme dracula

" PLUGIN: neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)
" Disable open the list automatically
let g:neomake_open_list = 0

" PLUGIN: ansible-vim
" Indentation will completely reset (unindent to column 0) after two newlines
" in insert-mode.
let g:ansible_unindent_after_newline = 1

" PLUGIN: ctrlp.vim
" let ctrlp working with variable
let g:ctrlp_working_path_mode = 'ra'

" PLUGIN: ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
