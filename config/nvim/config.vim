"" Pluggins Setting and Custom configuration
"" Settting and custom plugin configuration
"" ============================================================================
"" Generic
"" ============================================================================
" ----------------------------------------------------------------------------
" PLUGIN: vim-localvimrc
" Disable localvimrc sandbox
let g:localvimrc_sandbox = 0


"" ============================================================================
"" UI
"" ============================================================================
"" Setup plugins on UI categories
"" ----------------------------------------------------------------------------
"" PLUGIN: onedark
"" Need to combine more color theme for make it look nice.
"" Set background color
set background=dark
"" Set color theme to onedark
colorscheme onedark
"" Set onedark to 256colors
let g:onedark_termcolors=256
"" Set onedark to support italic font
let g:onedark_terminal_italics=1
"" Change hightligh search color
" hightligh Search guibg=peru guifg=wheat
" highlight Search guibg=LightCyan

"" ----------------------------------------------------------------------------
"" PLUGIN: Airline
"" Set powerline
let g:airline_powerline_fonts = 1
"" Set theme for airline
let g:airline_theme = 'onedark'
"" Set airline enable for tab extension
let g:airline#extensions#tabline#enabled = 1

"" ----------------------------------------------------------------------------
"" PLUGIN: indentLine
"" Auto conceal and unconceal
augroup JSON_CONCEAL
    "" this one is which you're most likely to use?
    autocmd insertenter *.json setlocal concealcursor=
    autocmd insertleave *.json setlocal concealcursor=inc
    autocmd filetype json setlocal conceallevel=2 concealcursor=inc
    "" for json jinja
    autocmd filetype json.jinja setlocal conceallevel=2 concealcursor=inc
augroup end

"" ----------------------------------------------------------------------------
"" PLUGIN: limelight
"" Highlighting priority (default: 10)
""   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 12
"" Beginning/end of paragraph
""   When there's no empty line between the paragraphs
""   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
"" Key mapping for toggle limelight
nmap <silent> <Leader><Space> <Esc>:Limelight!!<CR>

"" ----------------------------------------------------------------------------
"" PLUGIN: vim-startify
"" Use NERDTree Bookmarks
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")
"" Setup fortune to use unicode
let g:startify_fortune_use_unicode = 1
"" Automatically update sessions
let g:startify_session_persistence = 0
"" When opening a file or bookmark, seek and change to the root directory of the
"" VCS (if there is one).
let g:startify_change_to_vcs_root = 1
"" The directory to save/load sessions to/from.
let g:startify_session_dir = $HOME.'/.nvim/sessions'
"" Set common bookmark
let g:startify_bookmarks = [
    \ {'cz': $HOME.'/.zshrc'},
    \ {'ct': $HOME.'/.tmux.conf'},
    \ {'ci': $HOME.'/.config/nvim/init.vim'},
    \ {'cg': $HOME.'/.config/nvim/generic.vim'},
    \ {'cp': $HOME.'/.config/nvim/packages.vim'},
    \ {'cc': $HOME.'/.config/nvim/config.vim'}
    \ ]
"" Returns all commits of the current git repo
function! s:list_commits()
    let git = 'git -C ' . getcwd()
    let commits = systemlist(git .' log --oneline | head -n2')
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction
"" Returns all modified files of the current git repo
"" `2>/dev/null` makes the command fail quietly, so that when we are not
"" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
"" Same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
"" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction
"" Setup startify list
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['   Sessions'] },
    \ { 'type': function('s:list_commits'), 'header': ['   Last commits on current directory: ' . getcwd()] },
    \ { 'type': function('s:gitModified'),  'header': ['   Git Modified']},
    \ { 'type': function('s:gitUntracked'), 'header': ['   Git Untracked']},
    \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
    \ { 'type': 'dir',       'header': ['   My most recently used files current directory'] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
    \ { 'type': 'files',     'header': ['   My most recently used files'] },
    \ { 'type': 'commands',  'header': ['   Commands'] },
    \ ]
"" Custom header with random quote from Fortune
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'
"" Map startify keymap
map <silent> <Leader>h <ESC>:Startify<CR>

"" ----------------------------------------------------------------------------
"" PLUGIN: lens
"" When resizing don't go beyond the following height
let g:lens#height_resize_max = 20
"" When resizing don't go below the following height
let g:lens#height_resize_min = 5
"" When resizing don't go beyond the following width
let g:lens#width_resize_max = 80
"" When resizing don't go below the following width
let g:lens#width_resize_min = 20
"" The plugin can be disabled for specific filetypes
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']

"" ----------------------------------------------------------------------------
"" PLUGIN: vim-which-key
"" Use SPC to toggle whichkey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"" ----------------------------------------------------------------------------
"" PLUGIN: vim-better-whitespace
"" Enable remove whitespace on save
let g:strip_whitespace_on_save = 1
"" Disable confirm on strip whitespace
let g:strip_whitespace_confirm = 0

"" ----------------------------------------------------------------------------
"" PLUGIN: nvim-colorizer
lua require'colorizer'.setup()


"" ============================================================================
"" Easy Motivation
"" ============================================================================
"" ----------------------------------------------------------------------------
"" PLUGIN: vim-visual-multi
"" Work around to create vertical cursor
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]    = '<Leader><Down>'   " new cursoDowndown
let g:VM_maps["Add Cursor Up"]      = '<Leader><Up>'   " new cursoUpown

"" ----------------------------------------------------------------------------
"" PLUGIN: NERDTree
"" Change variable symbols
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
"" Let show ignored
let g:NERDTreeGitStatusShowIgnored = 1
"" Toggle NERDTree with map command
map <silent> <Leader>n <ESC>:NERDTreeToggle<CR>
"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"" ----------------------------------------------------------------------------
"" PLUGIN: fzf.vim
"" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
"" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"" Enable fzf work with tmux
let g:fzf_prefer_tmux = 1
"" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
"" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
"" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
"" Map find files
map <silent> <Leader>p <ESC>:Files<CR>
map <silent> <Leader>r <ESC>:Rg<CR>

"" ----------------------------------------------------------------------------
"" PLUGIN: vim-commentary
autocmd FileType helm setlocal commentstring=#\ %s


"" ============================================================================
"" Tools
"" ============================================================================
"" ----------------------------------------------------------------------------
"" PLUGIN: git-signify
"" Default updatetime 4000ms is not good for async update
set updatetime=100

"" ----------------------------------------------------------------------------
"" PLUGIN: editorconfig-vim
"" To ensure that this plugin works well with Tim Pope's fugitive, and avoid loading EditorConfig for any remote files over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"" Resolve conflicts of trailing whitespace trimming and buffer autosaving
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']



"" ============================================================================
"" Languages
"" ============================================================================
"" Setup plugins on Languages categories
"" ----------------------------------------------------------------------------
"" PLUGIN: vim-yaml-folding
"" Set folding level to 20 to make sure yaml isn't folding in startup
set foldlevel=12

"" ----------------------------------------------------------------------------
"" PLUGIN: vim-markown
"" Disable conceal
let g:vim_markdown_conceal = 0
"" Disale folding on markdown
let g:vim_markdown_folding_disabled = 1
"" Follow anchor links
let g:vim_markdown_follow_anchor = 1
"" Disable code blocks conceal
let g:vim_markdown_conceal_code_blocks = 0
"" Item list idents
let g:vim_markdown_new_list_item_indent = 2
"" Syntax extensions
let g:vim_markdown_math = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1


"" ============================================================================
"" Completion and Linting
"" ============================================================================
"" ----------------------------------------------------------------------------
"" PLUGIN: vim-prettier
"" Disable focus on quick-fix
let g:prettier#quickfix_auto_focus = 1
"" Force prettier to async
let g:prettier#exec_cmd_async = 1
"" Max line length that prettier will wrap on: a number or 'auto'
let g:prettier#config#print_width = 'auto'
"" When running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
"" autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"" Overrid file instead of parse buffer (Fix: failed to parse buffer)
let g:prettier#config#config_precedence = 'file-override'
"" KeyBindings
nmap <Leader>py <Plug>(PrettierAsync)

"" ----------------------------------------------------------------------------
"" PLUGIN: coc.nvim
"" TextEdit might fail if hidden is not set.
set hidden
"" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
"" Give more space for displaying messages.
set cmdheight=2
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
set updatetime=300
"" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    "" Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif
"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
"" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
    autocmd!
    "" Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    "" Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
"" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
"" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
"" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"" Mappings for CoCList
"" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"" Auto download CoC Plugins List if it's missing
let g:coc_global_extensions = [
    \ 'coc-jedi',
    \ 'coc-snippets',
    \ 'coc-vimlsp'
    \ ]
