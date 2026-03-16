# Auto Change Theme When enter a markdown buffer type

```lua
-- NOTE: This Works Perfect 99%

-- ~/.config/nvim/lua/config/autocmds.lua

-- Create a group so we don't duplicate the logic accidentally
local theme_group = vim.api.nvim_create_augroup("ThemeSwitcher", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  group = theme_group,
  pattern = "*", -- Watch every buffer you enter
  callback = function()
    -- Check if the file we just entered is markdown
    if vim.bo.filetype == "markdown" then
      vim.cmd("colorscheme catppuccin-frappe")
    else
      -- If it's anything else (lua, js, python, etc.), go back to your main theme
      -- Replace 'catppuccin' with 'catppuccin-mocha' if you want a specific one
      vim.cmd("colorscheme catppuccin")
    end
  end,
})

```
