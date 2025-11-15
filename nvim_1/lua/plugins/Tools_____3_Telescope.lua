return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope Find Commands" })

		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = { width = 0.9, height = 0.9, preview_height = 0.5 },
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<CR>"] = actions.select_default,
						["<C-c>"] = actions.close,
					},
				},
			},
		})
	end,
}
