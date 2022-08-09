"" Register the description dictionary. Assume Space is your leader
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

"" Define prefix dictionary
let g:which_key_map =  {}

let g:which_key_map = {
            \ 'h': 'Go to home page',
            \ 's': 'Turn off hightligh search',
            \ '<Up>': 'Create vertical multi-cursor',
            \ '<Down>': 'Create vertical multi-cursor',
            \ '<Space>': 'Toggle Ligthlime mode'
            \ }

let g:which_key_map.c = {
            \ 'name' : '+coc',
            \ 'c': 'CoC Command',
            \ 'e': 'CoC Extensions',
            \ 'a': 'CoC Diagnostics',
            \ 'o': 'CoC Outline',
            \ 's': 'CoC Systembols',
            \ 'j': 'CoC Next',
            \ 'k': 'CoC Previous',
            \ 'p': 'CoC Resume List'
            \ }

let g:which_key_map.f = {
            \ 'name' : '+files',
            \ 'f': 'Fuzzy search files',
            \ 'r': 'Search All files in current dir',
            \ 'n': 'Toggle NERDTree'
            \ }

let g:which_key_map.p = {
            \ 'name': '+format files',
            \ }

let g:which_key_map.r = {
            \ 'name': '+format files',
            \ 'f': 'Refact indent on current buffer',
            \ 'b': 'Delete blank line on current buffer'
            \ }
