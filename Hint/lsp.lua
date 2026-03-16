return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				-- Example for TypeScript/JS
				vtsls = function(_, opts)
					opts.settings.typescript.inlayHints = {
						parameterNames = { enabled = "none" },
						variableTypes = { enabled = false },
					}
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				vtsls = { -- This is the default JS/TS server in LazyVim
					settings = {
						typescript = {
							inlayHints = {
								parameterNames = { enabled = "all" },
								parameterTypes = { enabled = true },
								variableTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								enumMemberValues = { enabled = true },
							},
						},
					},
				},
			},
		},
	},
}
