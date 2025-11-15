return {
	-- toggleterm.nvim: لإدارة الطرفيات داخل Neovim
	"akinsho/toggleterm.nvim",
	version = "*", -- أو استخدم علامة إصدار محددة
	opts = {
		open_mapping = [[;;]],
		direction = "float",
		float_opts = {
			border = "curved",
			winblend = 3,
		},
	},
	vim.keymap.set("t", ";j", [[<C-\><C-n>]], { desc = "Escape from Terminal Mode" }),
}
