return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"ts_ls",
					"stylua",
					"prettier",
					"eslint_d",
				},
			})
		end,
	},
}
