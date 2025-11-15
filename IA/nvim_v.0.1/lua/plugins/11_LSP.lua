-- (nvim-lspconfig)

-- TODO: Add this To (nvim-cmp)
-- dependencies = {
-- "hrsh7th/cmp-nvim-lsp", -- 💡 إضافة هذا المصدر الآن
-- },

-- TODO: Add this To (nvim-cmp)
-- sources = cmp.config.sources({
-- { name = "nvim_lsp" }, -- 💡 إضافة مصدر LSP في المقدمة
-- }),

-- TODO: Add jsconfig.json to ~/.config/nvim/
-- {
-- "compilerOptions": {
-- "module": "CommonJS",
-- "target": "ES2020",
-- "checkJs": true,
-- "allowSyntheticDefaultImports": true
-- },
-- "exclude": [
-- "node_modules",
-- "**/node_modules/*"
-- ]
-- }

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"html",
				"cssls",
				"jsonls",
			},
		})
		local on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end
		vim.lsp.config("ts_ls", {
			on_attach = on_attach,
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayVariableTypeHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayVariableTypeHints = true,
					},
				},
			},
		})
		vim.lsp.config("lua_ls", {
			on_attach = on_attach,
			settings = {
				lua = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayVariableTypeHints = true,
					},
				},
			},
		})
		vim.lsp.config("html", { on_attach = on_attach })
		vim.lsp.config("cssls", { on_attach = on_attach })
		vim.lsp.config("jsonls", { on_attach = on_attach })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation/hover" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
	end,
}
