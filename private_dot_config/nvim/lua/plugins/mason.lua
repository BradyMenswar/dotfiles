local formatters = { "stylua", "prettier", "ruff", "isort" }
local linters = {}
local language_servers = {
	"lua_ls",
	"ts_ls",
	"html",
	"rust_analyzer",
	"pyright",
	"taplo",
	"tailwindcss",
	"angularls",
	"yaml-language-server",
	"emmet-language-server",
}

local allMasonPkgs = vim.iter({ language_servers, linters, formatters }):flatten():totable()

return {
	{
		"whoissethdaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
		},
		opts = { ensure_installed = allMasonPkgs },
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
			},
		},
		opts = {},
	},
}
