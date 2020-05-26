" ============================================================================
" Common Settings for MY NEOVIM
" ============================================================================
" NOTE: .nvimrc on new neovim has change to ~/.config/nvim/init.vim
" then i just link file to .nvimrc

" Ignore widerc setup
set nocompatible

" Let neovim show true color
if (has("nvim"))
    set t_Co=256
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

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

" set default indent
if has('autocmd')
    augroup default
        autocmd!
        " Custom filetype settings:
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2
    augroup END
endif

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
vnoremap < <gv
vnoremap > >gv

" Refact indent on buffer file
noremap <Leader>f <C-C>gg=G<CR>:update<CR>
" Delete blank line on buffer file
noremap <Leader>b <C-C>:g/^$/d<CR>:update<CR>

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

" Set wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ============================================================================
" Setting for using vim-plug
" ============================================================================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.nvim/plugged')

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
"Plug 'rakr/vim-one'
"Plug 'joshdick/onedark.vim'
"Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'altercation/vim-colors-solarized'
"Plug 'ayu-theme/ayu-vim'
"Plug 'kaicataldo/material.vim'
" Emoji
Plug 'ryanoasis/vim-devicons'
" Limelight
Plug 'junegunn/limelight.vim'

" =======================
" Interactive with system
" =======================
" Git
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'tpope/vim-fugitive'
" Wakatime
Plug 'wakatime/vim-wakatime'
" Editorconfig
Plug 'editorconfig/editorconfig-vim'
" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
" Unix file opertions
Plug 'tpope/vim-eunuch'
" PlatformIO
Plug 'coddingtonbear/neomake-platformio'
" vim-localvimrc
Plug 'embear/vim-localvimrc'

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
" Helm chart
Plug 'towolf/vim-helm'
" Zinit
Plug 'zinit-zsh/zinit-vim-syntax'
" Jenkins
Plug 'martinda/Jenkinsfile-vim-syntax'
" Arduino
Plug 'vim-scripts/Arduino-syntax-file'

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
" abolish-vim
Plug 'tpope/vim-abolish'
" vim-repeat
Plug 'tpope/vim-repeat'

" ==================
" Working with files
" ==================
" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" fuzzy search file
Plug 'ctrlpvim/ctrlp.vim'

" ====================
" Completion & Linting
" ====================
" Deoplate
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" python
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
" emoji
Plug 'fszymanski/deoplete-emoji', {'for': 'gitcommit'}
" golang
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make', 'for': 'go'}
" zsh
Plug 'deoplete-plugins/deoplete-zsh', {'for': 'zsh'}
" vim
Plug 'Shougo/neco-vim', {'for': 'vim'}
" tabline
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" prettier
Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
\ 'branch': 'release/1.x'
\ }

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
"let g:material_theme_style = 'dark'

" Ayu colorscheme settings
" let ayucolor = 'dark'

" One colorscheme settings
"let g:one_allow_italics = 1
" One dark
"let g:onedark_termcolors = 256
"let g:onedark_terminal_italics = 1

" Set color theme to one
"colorscheme onedark
colorscheme dracula

" dracula setup color
let g:dracula_italic = 1
let g:dracula_bold = 1
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_colorterm = 1
let g:dracula_inverse = 1

" *CAUTION*: Need to set CursorLine under color scheme
"highlight CursorLine term=bold cterm=bold guibg=Grey22
autocmd ColorScheme dracula hi CursorLine cterm=underline term=underline

" change hightligh search color
"hi Search guibg=peru guifg=wheat
highlight Search guibg=LightBlue

" ----------------------------------------------------------------------------
" PLUGIN: vim-better-whitespace
" enable remove whitespace on save
let g:strip_whitespace_on_save = 1

" disable confirm on strip whitespace
let g:strip_whitespace_confirm = 0

" ----------------------------------------------------------------------------
" PLUGIN: vim-devicons
" loading the plugin
let g:webdeviconss_enable = 1

" adding the flags to NERDTree
let g:webdeviconss_enable_nerdtree = 1

" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" ----------------------------------------------------------------------------
" PLUGIN: vim-multiple-cursor
" Disable default multiple cursor
let g:multi_cursor_use_default_mapping = 0

" ----------------------------------------------------------------------------
" PLUGIN: git-signify
" Default updatetime 4000ms is not good for async update
set updatetime=100

" ----------------------------------------------------------------------------
" PLUGIN: vim-terraform
" auto align on terraform
let g:terraform_align = 1

" auto fold terraform
let g:terraform_fold_sections = 0

" set format on *.tf, *.tfvars with terraform fmt
let g:terraform_fmt_on_save = 1

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

" Just show quick fix
let g:go_list_type = "quickfix"

" Let auto show identifier type
let g:go_auto_type_info = 1

" Highlighting matching identifier
let g:go_auto_sameids = 0

" Disable vim-go to use gd command to open GoDef
let g:go_def_mapping_enabled = 0

" Auto import lib
let g:go_fmt_command = "goimports"

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
let g:airline_theme = 'dracula'

" set airline enable for tab extension
""let g:airline#extensions#tabline#enabled = 1

" ----------------------------------------------------------------------------
" PLUGIN: limelight
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 12

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Key mapping for toggle limelight
nmap <silent> <Space> <Esc>:Limelight!!<CR>

" ----------------------------------------------------------------------------
" PLUGIN: editorconfig-vim
" To ensure that this plugin works well with Tim Pope's fugitive, and avoid loading EditorConfig for any remote files over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Resolve conflicts of trailing whitespace trimming and buffer autosaving
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

" ----------------------------------------------------------------------------
" PLUGIN: vim-localvimrc
" Disable localvimrc sandbox
let g:localvimrc_sandbox = 0

" ----------------------------------------------------------------------------
" PLUGIN: ctrlp.vim
" let ctrlp working with variable
let g:ctrlp_working_path_mode = 'rca'

" ----------------------------------------------------------------------------
" PLUGIN: vim-commentary
autocmd FileType helm setlocal commentstring=#\ %s

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

" let show ignored
let g:NERDTreeShowIgnoredStatus = 0

" ----------------------------------------------------------------------------
" PLUGIN: vim-delve
" Set backend
let g:delve_backend = "native"

" ----------------------------------------------------------------------------
" PLUGIN: deoplete
" autostart
let g:deoplete#enable_at_startup = 1

" ----------------------------------------------------------------------------
" PLUGIN: deoplete-emoji
" enable emoji to another file
call deoplete#custom#source('emoji', 'filetypes', ['gitcommit', 'markdown', 'rst'])
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])

" ----------------------------------------------------------------------------
" PLUGIN: deoplete-go
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" ----------------------------------------------------------------------------
" PLUGIN: vim-prettier
" disable focus on quick-fix
let g:prettier#quickfix_auto_focus = 1

" force prettier to async
let g:prettier#exec_cmd_async = 1

" Max line length that prettier will wrap on: a number or 'auto'
let g:prettier#config#print_width = 'auto'

" ----------------------------------------------------------------------------
" PLUGIN: deoplete-necosyntax
" set min keyword
let g:necosyntax#min_key_length = 3

" ----------------------------------------------------------------------------
" PLUGIN: deoplete-tabnine
call deoplete#custom#var('tabnine', {
\ 'line_limit': 200,
\ 'max_num_results': 2,
\ })
