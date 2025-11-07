-- (Mason) --> Tool Manager
-- (Mason-Lspconfing.nvim) --> Link Beteen (Mason) and (LSP) Servers
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function() end,
	},
}
