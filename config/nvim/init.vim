"" LUA configuration
lua require("init")
lua require("plugins")
lua require("tools")
lua require("ui")
lua require("motivation")
lua require("completions")
lua require("keymaps")

"" LEGACY configuration
"" Make cursor shapes and blink
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing
