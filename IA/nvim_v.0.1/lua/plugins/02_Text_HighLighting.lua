-- (Tree-Sitter) --> Text_Highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "typescript", "json", "lua", "css", "html", "norg" },
			highlight = {
				enable = true,
				disable = {},
			},
			indent = { enable = true, disable = { "python" } },
		})
	end,
}
