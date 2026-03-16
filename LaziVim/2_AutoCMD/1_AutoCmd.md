# Auto Change Theme When enter a markdown file type

```lua
-- WARN: This not works perfect

-- ~/.config/nvim/lua/config/autocmds.lua

-- 1. When entering a Markdown file, switch to Frappe
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd("colorscheme catppuccin-frappe")
  end,
})

-- 2. When leaving a Markdown file, switch back to your normal theme (Mocha/Default)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- This runs when you CLOSE the markdown buffer or change its type
    vim.api.nvim_create_autocmd("BufLeave", {
      buffer = 0,
      once = true,
      callback = function()
        vim.cmd("colorscheme catppuccin") -- This goes back to your default (Mocha)
      end,
    })
  end,
})
```
