return {
	-- نستخدم Mason لتثبيت خوادم اللغة
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- لربط Mason بـ LSPconfig
		},

		config = function()
			local lspconfig = require("lspconfig")

			-- قم بتعريف الخوادم التي تحتاجها هنا

			-- أ. tsserver: الخادم الأساسي لـ JavaScript و TypeScript
			-- هذا الخادم يوفر كل ميزات LSP لـ Node.js و Express
			lspconfig.ts_ls.setup({
				-- إعدادات إضافية لـ tsserver، يمكنك تخصيصها لاحقاً
				settings = {
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayVariableTypeHints = true,
						},
					},
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayVariableTypeHints = true,
						},
					},
				},
			})

			-- ب. lua_ls: خادم اللغة لـ Lua/Neovim (لإعداداتك)
			lspconfig.lua_ls.setup({})

			-- ج. html/css/json (ضروري لأي مطور ويب)
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.jsonls.setup({})

			-- ======================================
			-- تكوين Mason لتثبيت الخوادم تلقائياً
			-- ======================================
			require("mason-lspconfig").setup({
				-- تأكد أن هذه الخوادم مثبتة عند البدء
				ensure_installed = {
					-- "tsserver",
					"ts_ls",
					"lua_ls",
					"html",
					"cssls",
					"jsonls",
				},
			})

			-- ======================================
			-- اختصارات LSP الأساسية (للعمل الذكي)
			-- ======================================
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation/hover" })
			-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
}
