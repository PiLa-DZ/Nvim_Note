return {
	"romgrk/barbar.nvim",
	event = "BufReadPost",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("barbar").setup({
			animation = true,
			tabpages = true,
		})
		vim.keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>", { desc = "Close Current Buffer" })
		vim.keymap.set("n", "<leader>bo", "<Cmd>BufferCloseAllButVisible<CR>", { desc = "Close Other Buffers" })
	end,
}
