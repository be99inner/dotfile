-- Plugins Tables
local plugins = {
	-- tmux integrations
	{
		"alexghergh/nvim-tmux-navigation",
    lazy = false,
		dependencies = {
			{ "tmux-plugins/vim-tmux-focus-events" },
			{ "tmux-plugins/vim-tmux" },
		},
    config = function()
      require("custom.configs.tmux")
    end
	},

	-- wakatime plugins
	{ "wakatime/vim-wakatime", lazy = false },
	-- editorconfig
	{ "gpanders/editorconfig.nvim" },

	-- lsp installer
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"html-lsp",
				"prettier",
				"stylua",
        "gopls"
			},
		},
	},
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},

		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
}

return plugins
