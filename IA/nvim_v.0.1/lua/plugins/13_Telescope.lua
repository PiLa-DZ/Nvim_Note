return {
	-- 1. Telescope: الأداة الرئيسية للبحث والتنقل
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim", -- مكتبة أساسية يعتمد عليها Telescope
		},

		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					-- إعدادات لضبط سلوك النافذة والنتائج
					layout_strategy = "vertical",
					layout_config = {
						vertical = { width = 0.9, height = 0.9, preview_height = 0.5 },
					},
					-- تخصيص الإجراءات المتاحة
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- للتنقل لأعلى
							["<C-j>"] = actions.move_selection_next, -- للتنقل لأسفل
							["<CR>"] = actions.select_default, -- لفتح الملف
							["<C-c>"] = actions.close, -- للإغلاق
						},
					},
				},
			})
		end,

		-- 2. اختصارات Telescope الأساسية
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files (Project)" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers (Open)" },
			{ "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Find Commands" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find Text (Grep)" },
		},
	},
}
