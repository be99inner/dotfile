
" ============================================================================
" Common Settings for MY VIMRC
" ============================================================================
"
set encoding=utf-8

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed


" Backspace fixed
""set bs=2


" Rebind <Leader> key
let mapleader = ','


" Bind nohl
" Remove highlight of you last search 
noremap <Leader>s <ESC>:nohl<CR>
vnoremap <Leader>s <ESC>:nohl<CR>
inoremap <Leader>s <ESC>:nohl<CR>


" Quicksave command
noremap <C-z> :update<CR>
vnoremap <C-z> <C-C>:update<CR>
inoremap <C-z> <C-C>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>	" Quit current window
noremap <Leader>E :qa!<CR>	" Quit all windows


" Bind Ctrl+<Movement> keys to move around the windows,
" instead of use Ctrl+w <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l


" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" Easier moving of code blocks
vnoremap < <gv 	" better indentation
vnoremap > >gv 	" better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autpcmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color Scheme
set t_Co=256
""colorscheme papaya_original


" Enable syntax highlighting 
syntax off
filetype plugin indent on
syntax on


" Showing line numbers and length 
set number	" show line numbers
set relativenumber  " show relative number
set tw=79	" width of document (used by gd)
""set nowrap	" don't automatically wrap on load
set fo-=t	" don't automatically wrap text when typing
set ruler	" determine word
set showcmd	" show cmd
set wildmenu	" show match suggestion
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Easier formation of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700


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


" Disable stupid backup and swap files,
" they trigger too many events for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Indent for specific filetype
if has("autocmd")
    augroup styles
        autocmd!
        " Custom filetype settings:
        au FileType json,yaml,yml set tabstop=2 shiftwidth=2 softtabstop=2
    augroup END
endif


" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python,yml,yaml   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" Completion
set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect
set shortmess+=c

augroup OmniCompletionSetup
    autocmd!
    autocmd FileType c          set omnifunc=ccomplete#Complete
    autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
    autocmd FileType python     set omnifunc=jedi#completions
    autocmd FileType ruby       set omnifunc=rubycomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
augroup END


" ============================================================================
" Pathogen Plugin
" ============================================================================
call pathogen#infect()
call pathogen#helptags()
"" Insert Plugin on ~/.vim/bundle and configure them below


" ycm
let g:syntastic_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<TAB>','<ENTER>']
let g:ycm_key_list_stop_completion = ['<TAB>','<C-y>']


" vim powerline
set laststatus=2
set showtabline=2


" autostart nerdtree
""autocmd vimenter * NERDTree
map <c-n> <esc>:NERDTreeToggle<cr>


" vim ansible
""au BufRead,BufNewFile *.yml set filetype=yaml.ansible
""au BufRead,BufNewFile *.j2 set filetype=yaml.ansible
""au BufRead,BufNewFile all,hosts set filetype=yaml.ansible
