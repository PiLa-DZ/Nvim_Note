-- (Neorg) --> Note Taking
-- (Plenary.nvim)

-- TODO: You have to add "norg" lenguage to (Tree-Sitter) Plugin
-- ensure_installed = { "javascript", "typescript", "json", "lua", "css", "html" , "norg"},

-- TODO: You have to add "LocalLeader" to Keymap file
-- vim.g.maplocalleader = ";"

return {
	"nvim-neorg/neorg",
	lazy = false,
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspace = {
							notes = "~/notes",
						},
					},
				},
			},
		})
	end,
}
