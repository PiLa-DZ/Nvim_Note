-- (Alpha-nvim) --> Welcome Screen
-- (Web-Devicons)
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.buttons.val = {}
		alpha.setup(dashboard.opts)
		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				if vim.fn.argc() == 0 then
					vim.cmd.NvimTreeToggle()
				end
			end,
		})
	end,
}
