local formatters = { "stylua", "prettier", "ruff" }
local linters = {}
local language_servers = {
	"lua_ls",
	"pyright",
	"ts_ls",
	"html",
	"tailwindcss",
	"angularls",
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
