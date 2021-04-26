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
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
    set termguicolors
endif

" Encoding
set encoding=utf-8

" Font for MacOS
set guifont=MesloLGF\ NF

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
        autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
    augroup END
endif

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remove hightlight of you last search
noremap <silent> <Leader>s <ESC>:nohl<CR>

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

" Set splition
set splitright
set splitbelow

" Easy move between tab
nmap <silent> <Leader>c :tabnew<CR>
nmap <silent> <Leader>n :tabnext<CR>
nmap <silent> <Leader>m :tabprevious<CR>

" Enable syntax highlighting
syntax off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number              " show line numbers
set relativenumber      " show relative number
set textwidth=79        " width of document (used by gd)
set nowrap              " don't automatically wrap on load
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
" vim-misc
Plug 'xolox/vim-misc'
" Ansible
Plug 'pearofducks/ansible-vim'

" ===================
" Syntax highlighting
" ===================
" Hashicorp
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" markdown mode
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
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
" Json
Plug 'elzr/vim-json', { 'for': [ 'json','markdown'] }

" =================
" Easy movetivation
" =================
" vim surround
""Plug 'tpope/vim-surround'
" commenter
Plug 'tpope/vim-commentary'
" multi-cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Splitjoin line
Plug 'AndrewRadev/splitjoin.vim'
" abolish-vim
Plug 'tpope/vim-abolish'
" vim-repeat
Plug 'tpope/vim-repeat'
" auto-pairs
Plug 'jiangmiao/auto-pairs'

" ==================
" Working with files
" ==================
" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" fuzzy search file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ====================
" Completion & Linting
" ====================
" coc.nvim
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippets
Plug 'honza/vim-snippets'

" prettier
Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
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
"let ayucolor = 'dark'
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
let g:dracula_colorterm = 1

" *CAUTION*: Need to set CursorLine under color scheme
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
" Change variable symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
" Let show ignored
let g:NERDTreeGitStatusShowIgnored = 0
" map key
map <silent> <Leader>n <ESC>:NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" PLUGIN: Airline
" set powerline
let g:airline_powerline_fonts = 1
" set theme for airline
let g:airline_theme = 'dracula'
" set airline enable for tab extension
" let g:airline#extensions#tabline#enabled = 1

" ----------------------------------------------------------------------------
" PLUGIN: indentLine
" Auto conceal and unconceal
augroup JSON_CONCEAL
    " this one is which you're most likely to use?
    autocmd InsertEnter *.json setlocal concealcursor=
    autocmd InsertLeave *.json setlocal concealcursor=inc
augroup end

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
nmap <silent> <Leader><Space> <Esc>:Limelight!!<CR>

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
" PLUGIN: vim-markown
" Disable conceal
let g:vim_markdown_conceal = 0
" Disale folding on markdown
let g:vim_markdown_folding_disabled = 1
" Follow anchor links
let g:vim_markdown_follow_anchor = 1
" Disable code blocks conceal
let g:vim_markdown_conceal_code_blocks = 0
" Item list idents
let g:vim_markdown_new_list_item_indent = 2
" Syntax extensions
let g:vim_markdown_math = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1

" ----------------------------------------------------------------------------
" PLUGIN: ctrlp.vim
" let ctrlp working with variable
" let g:ctrlp_working_path_mode = 'ca'
" ### Problem with CtrlP cant finds entires
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ----------------------------------------------------------------------------
" PLUGIN: fzf.vim
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Enable fzf work with tmux
let g:fzf_prefer_tmux = 1
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Map find files
map <silent> <Leader>p <ESC>:Files<CR>
map <silent> <Leader>r <ESC>:Rg<CR>

" ----------------------------------------------------------------------------
" PLUGIN: vim-json
" Disable conceal on json
let g:vim_json_syntax_conceal = 0

" ----------------------------------------------------------------------------
" PLUGIN: vim-commentary
autocmd FileType helm setlocal commentstring=#\ %s

" ----------------------------------------------------------------------------
" PLUGIN: vim-delve
" Set backend
let g:delve_backend = "native"

" ----------------------------------------------------------------------------
" PLUGIN: vim-prettier
" Disable focus on quick-fix
let g:prettier#quickfix_auto_focus = 1
" Force prettier to async
let g:prettier#exec_cmd_async = 1
" Max line length that prettier will wrap on: a number or 'auto'
let g:prettier#config#print_width = 'auto'
" When running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" Ovverid file instead of parse buffer (Fix: failed to parse buffer)
let g:prettier#config#config_precedence = 'file-override'
" KeyBindings
nmap <Leader>py <Plug>(PrettierAsync)

" ----------------------------------------------------------------------------
" PLUGIN: coc.nvim
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Coc Plugins List
let g:coc_global_extensions = [
    \ 'coc-jedi'
    \ ]

" ----------------------------------------------------------------------------
" PLUGIN: ansible-vim
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END

source ~/.config/nvim/plugins.vim
