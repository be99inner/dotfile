"" ############################################################################
"" ##
"" ## Init configuration to source all of configuration
"" ##
"" ############################################################################
source $HOME/.config/nvim/generic.vim
source $HOME/.config/nvim/packages.vim
source $HOME/.config/nvim/config.vim
" source $HOME/.config/nvim/whichkeys.vim


lua require('init')

"" Auto load configuration when configuration is saved
" if has('autocmd')
"     augroup reload_config
"         autocmd!
"         autocmd bufwritepost $HOME/.config/nvim/init.vim source $HOME/.config/nvim/init.vim
"         " autocmd bufwritepost $HOME/.config/nvim/init.vim execute ":AirlineRefresh"
"         autocmd bufwritepost $HOME/.config/nvim/packages.vim source $HOME/.config/nvim/init.vim
"         " autocmd bufwritepost $HOME/.config/nvim/packages.vim execute ":AirlineRefresh"
"         autocmd bufwritepost $HOME/.config/nvim/config.vim source $HOME/.config/nvim/init.vim
"         " autocmd bufwritepost $HOME/.config/nvim/config.vim execute ":AirlineRefresh"
"     augroup END
" endif
